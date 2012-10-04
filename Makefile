CURRENT_DIR := $(shell pwd)
INSTALL_DIR := $(HOME)

all: cui gui

.PHONY: git tig tmux vim zsh
cui: git tig tmux vim zsh

.PHONY: vimperator
gui: vimperator

git:
	ln -fns $(CURRENT_DIR)/git/gitconfig $(INSTALL_DIR)/.gitconfig
	ln -fns $(CURRENT_DIR)/git/gitignore $(INSTALL_DIR)/.gitignore

tig:
	ln -fns $(CURRENT_DIR)/tig/tigrc $(INSTALL_DIR)/.tigrc

tmux:
	ln -fns $(CURRENT_DIR)/tmux/tmux.conf $(INSTALL_DIR)/.tmux.conf

vim:
	git submodule update --init
	ln -fns $(CURRENT_DIR)/vim/vim    $(INSTALL_DIR)/.vim
	ln -fns $(CURRENT_DIR)/vim/vimrc  $(INSTALL_DIR)/.vimrc
	ln -fns $(CURRENT_DIR)/vim/gvimrc $(INSTALL_DIR)/.gvimrc
	vim -u ~/.vim/neobundle.vimrc +"silent NeoBundleInstall" +q
	cd ~/.bundle/vimproc; make -f make_unix.mak

vimperator: vimperator-repo
	ln -fns $(CURRENT_DIR)/vimperator/vimperator      $(INSTALL_DIR)/.vimperator
	ln -fns $(CURRENT_DIR)/vimperator/vimperatorrc    $(INSTALL_DIR)/.vimperatorrc
	ln -fns $(CURRENT_DIR)/vimperator/vimperatorrc.js $(INSTALL_DIR)/.vimperatorrc.js

vimperator-repo:
	@if [ ! -d $(INSTALL_DIR)/share/vimperator-plugins ]; then \
		git clone git://github.com/vimpr/vimperator-plugins.git $(INSTALL_DIR)/share/vimperator-plugins; \
	fi

zsh:
	ln -fns $(CURRENT_DIR)/zsh/zsh    $(INSTALL_DIR)/.zsh
	ln -fns $(CURRENT_DIR)/zsh/zshrc  $(INSTALL_DIR)/.zshrc
	ln -fns $(CURRENT_DIR)/zsh/zshenv $(INSTALL_DIR)/.zshenv

clean:
	rm ${INSTALL_DIR}/.tmux.conf
	rm ${INSTALL_DIR}/.zsh
	rm ${INSTALL_DIR}/.zshrc
	rm ${INSTALL_DIR}/.zshenv
	rm $(INSTALL_DIR)/.vim
	rm $(INSTALL_DIR)/.vimrc
	rm $(INSTALL_DIR)/.gvimrc