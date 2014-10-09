HOME_DIR=~
INSTALL_DIR=$(HOME_DIR)/.af_vim_config
BIN_DIR=$(HOME_DIR)/bin
REPO=https://github.com/florinsky/af-vim.git

clean:
	cd $(HOME_DIR) && rm -rf .vim .vimrc $(INSTALL_DIR)

prepare:
	mkdir -p $(INSTALL_DIR)
	mkdir -p $(BIN_DIR)

download: prepare
	git clone $(REPO) $(INSTALL_DIR)

linking: download
	ln -s $(INSTALL_DIR)/.vim $(HOME_DIR)/.vim
	ln -s $(INSTALL_DIR)/.vimrc $(HOME_DIR)/.vimrc

build-phpctags: download
	cd $(INSTALL_DIR)/bin.src/phpctags.src && make
	mv $(INSTALL_DIR)/bin.src/phpctags.src/phpctags $(BIN_DIR)/
	cd $(INSTALL_DIR)/bin.src/phpctags.src && make dist-clean

install: download linking build-phpctags
	vim
