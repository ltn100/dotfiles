use strict;
#use warnings;
use Irssi;
use Irssi::Irc;
use vars qw($VERSION %IRSSI %cmplist $active %static_list);

$VERSION = "0.0.3";
%IRSSI = (
	authors     => "Sebastian 'yath' Schmidt, Valentin Batz",
	contact     => "yathen\@web.de, senneth\@irssi.org",
	name        => "Command dispatcher, with tab completion",
	description => "This scripts sends only known commands to the server",
	license     => "GNU GPLv2",
	changed     => "Thu Jan 12 19:27:38 CET 2006",
	revision    => '$LastChangedRevision: 368 $',
	changed     => '$LastChangedDate: 2006-01-31 22:29:39 +0100 (Di, 31 Jan 2006) $',
	version     => $VERSION,
);

$active = 0;

%static_list = (
	euircd => [ 
		"cs", "chanserv",
		"ns", "nickserv",
		"ms", "memoserv", 
	],
	hybrid => [ 
		"locops", "lwallops", "ltrace",
		"close", "kline", "unkline",
		"dline", "htm",
		"gline", "testline",
	],
);

sub load_static_commands {
	my $server = shift;
	if ($server->{'version'} =~ /^euircd/i) {
		@{$cmplist{$server->{'tag'}}} = @{$static_list{euircd}};
	} elsif ($server->{'version'} =~ /^hybrid/i) {
		@{$cmplist{$server->{'tag'}}} = @{$static_list{hybrid}};
	}
}

sub event_help_notice {
	# "message irc notice", SERVER_REC, char *msg, char *nick, char *address, char *target
	my ($server, $msg, $nick, undef, $target) = @_;
	#assume that nicks can't contain dots or hyphens (so it works with irssi-proxy and psybnc)
	if ( defined $server && $nick =~ /[-\.]/ && $target eq $server->{'nick'} ) {
		@{$cmplist{$server->{'tag'}}} = ( @{$cmplist{$server->{'tag'}}}, lc $msg );
		Irssi::signal_stop();
	}
}

# ratbox specific stuff
sub event_help_reply {
	my ($server, $data) = @_;
	my (undef, $cmds) = split ':', $data, 2;
	if ($cmds ne '') {
		my @commands = split '\ +', lc $cmds;
		@{$cmplist{$server->{'tag'}}} = ( @{$cmplist{$server->{'tag'}}}, @commands );
	}
	Irssi::signal_stop();
}

Irssi::Irc::Server::redirect_register( "help reply", 0, 0,
					{
						"event 704" => -1,
					},
					{
						"event 706" => -1,
					},
					undef );
#end ratbox

sub add_sig {
	return if $active;
	Irssi::signal_add("message irc notice", "event_help_notice");
	$active = 1;
}

sub remove_sig {
	return if not $active;
	Irssi::signal_remove("message irc notice", "event_help_notice");
	$active = 0;
}

sub remove_sig_later {
	return if not $active;
	my $timeout = shift;
	$timeout = 1000 if $timeout < 1000;
	Irssi::timeout_add_once($timeout, "remove_sig", undef);
}

sub update_server_cmds {
	my $server = shift;
	return if not defined $server;
	@{$cmplist{$server->{'tag'}}} = ();
	# hybrid and euircd sends more than just commands :/
	if ($server->{'version'} =~ /(^Hybrid|^euIRCd)/) {
		load_static_commands($server);
		return;
	}
	if ( $server->{'version'} =~ /^ircd-ratbox/i ) {
		$server->redirect_event( "help reply", 0, '', -1, undef,
					{
						"event 705" => "redir help reply",
						""	=> "event empty",
					} );
	}
	$server->send_raw('HELP');
}

sub update_server_later {
	my $tag = shift;
	my $server = Irssi::server_find_tag($tag);
	return unless $server;
	add_sig();
	update_server_cmds($server);
	remove_sig_later();
}

sub event_connected {
	my $server = shift;
	#add_sig();
	#update_server_cmds($server);
	#remove_sig_later();
	if ($server->{'chat_type'} eq 'IRC') {
		Irssi::timeout_add_once(20000, "update_server_later", $server->{'tag'});
	}
}

sub get_ircd_commands {
	my $nservers = 0;
	if (defined Irssi::servers()) {
		add_sig();
		foreach my $server (Irssi::servers()) {
				next if $server->{'chat_type'} ne 'IRC';
				update_server_cmds($server);
				$nservers++;
		}
		remove_sig_later(1000 * $nservers);
	}
}

sub event_default_command {
	my ($command, $server) = @_;
	return if (Irssi::settings_get_bool("dispatch_unknown_commands") == 0
		|| !$server || $server->{'chat_type'} ne 'IRC');
	my $found = 0;
	foreach my $cmd ( @{$cmplist{$server->{'tag'}}} ) {
		my $quoted = quotemeta $cmd;
		if ($command =~ /^$quoted/) {
			$found = 1;
			last;
		}
	}
	if ($found || scalar @{$cmplist{$server->{'tag'}}} eq 0 ) {
		$server->send_raw($command);
		Irssi::signal_stop();
	}
}

sub sig_complete_word {
	my ($complist, $window, $word, $linestart, $want_space) = @_;
	my $cmdchars = quotemeta Irssi::settings_get_str("cmdchars");
	if ($word =~ /^[$cmdchars]/) {
		my $prefix = substr($word, 0, 1); #preserve cmdchar
		my $tag = $window->{'active_server'}->{'tag'};
		my $arr = $cmplist{ $tag };
		if (defined $arr) {
			@{$arr} = sort(@{$arr});
			my $cmd = quotemeta substr($word, 1);
			my @cmds;
			foreach my $c (@$arr) {
				if ($c =~ /^$cmd/) {
					@cmds = (@cmds, $prefix.$c);
				}
			}
			if (scalar @cmds gt 0) { push (@{$complist}, @cmds); }
		}
	}
	
}

Irssi::settings_add_bool("misc", "dispatch_unknown_commands", 1);
Irssi::signal_add_first("default command", "event_default_command");
Irssi::signal_add_first("redir help reply", "event_help_reply");
Irssi::signal_add_last("complete word", "sig_complete_word");
Irssi::signal_add_last("event connected", "event_connected");
get_ircd_commands();
