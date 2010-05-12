##############################################################
#
#
#
#
#
#
#
#
##############################################################

# Set MAKEFLAGS so that make trats symbolic links themselves
# as valid targets (and not the linked-to file)
MAKEFLAGS = "-L"

# Source files
SRCFILES += vimrc
SRCFILES += vim
SRCFILES += vimoutliner
SRCFILES += vimoutlinerrc
SRCFILES += screenrc
SRCFILES += bashrc.public
SRCFILES += bashrc.private
SRCFILES += gitconfig
SRCFILES += rtorrent.rc
SRCFILES += irssi
SRCFILES += snownews


# Other vars
DOTFILES = $(addprefix .,$(SRCFILES))
DESTDIR = ${HOME}
SOURCEDIR = ${PWD}

# Default rule
.PHONY: all
all : $(DOTFILES)

# Rules for dotfiles
#   - create symlink in src directory
#   - needs an absolute path to make the link works when copied
#
$(DOTFILES): $(SRCFILES) Makefile
	ln -sf $(SOURCEDIR)/$(patsubst .%,%,$(@)) $(SOURCEDIR)/$(@)

# Install rule
#   - TODO: ask if user wants to overwrite
#
.PHONY: install
install: $(DOTFILES)
	cp -d $(DOTFILES) $(DESTDIR)

# Clean all dot files
#
.PHONY: clean
clean:
	rm -f $(DOTFILES)

