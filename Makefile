###################################################################
#
#  Makefile for dotfiles.
#
#  Author:  Lee Netherton
#  Created: 12/05/2010
#
#  Usage:
#      make          - will build sym links
#      make install  - will copy sym links to user directory
#      make bashrc   - will add the source command to the end
#                      of your .bashrc file (only do this once!)
#
###################################################################

# Set MAKEFLAGS so that make trats symbolic links themselves
# as valid targets (and not the linked-to file)
MAKEFLAGS = "-L"

# Source files

# Files to link
LNK_FILES += vimrc
LNK_FILES += vim
LNK_FILES += vimoutliner
LNK_FILES += vimoutlinerrc
LNK_FILES += screenrc
LNK_FILES += bashrc.public
LNK_FILES += gitconfig
LNK_FILES += rtorrent.rc
LNK_FILES += irssi
LNK_FILES += snownews

# Files to copy
CP_FILES += bashrc.private


# Dot files
DOT_LNK_FILES = $(addprefix .,$(LNK_FILES))
DOT_CP_FILES  = $(addprefix .,$(CP_FILES))

# Locations
DEST_DIR = ${HOME}
SOURCE_DIR = ${PWD}


# Default rule
.PHONY: all
all : $(DOT_LNK_FILES) $(DOT_CP_FILES)


# Dotfile creation rules
$(DOT_LNK_FILES): $(LNK_FILES) Makefile
	ln -sf $(SOURCE_DIR)/$(patsubst .%,%,$(@)) $(SOURCE_DIR)/$(@)

$(DOT_CP_FILES): $(CP_FILES) Makefile
	cp -f $(SOURCE_DIR)/$(patsubst .%,%,$(@)) $(SOURCE_DIR)/$(@)


# Install rule
#   - TODO: ask if user wants to overwrite
#
.PHONY: install
install: $(DOT_LNK_FILES) $(DOT_CP_FILES) bashrc
	install -m 644 $(DOT_CP_FILES) $(DEST_DIR)
	cp -d $(DOT_LNK_FILES) $(DEST_DIR) # needs cp -d so that the link isn't dereferenced


# Add entry to ~/.bashrc
#
.PHONY: bashrc
bashrc: bashrc.include Makefile
	@if fgrep -q '.bashrc.public' $(HOME)/.bashrc; then \
		echo "Bash profile already added."; \
	else \
		cat bashrc.include >> $(HOME)/.bashrc; \
		echo "Bash profile source added."; \
	fi


# Clean all dot files
#
.PHONY: clean
clean:
	rm -f $(DOT_LNK_FILES)
	rm -f $(DOT_CP_FILES)

