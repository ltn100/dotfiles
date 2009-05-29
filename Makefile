CONFIGS += .vimrc
CONFIGS += .vim

DEST = ${HOME}
SOURCE = ${PWD}

.PHONY: all
all : .vim .vimrc

.vim : vim Makefile
	if [ -e ${DEST}/.vim ]
	then
		echo "file exists"
	else
		ln -s ${SOURCE}/vim ${DEST}/.vim
	fi
