HOME_DIR=`realpath ~`
INSTALL_DIR=$(HOME_DIR)/.af_vim_config
BIN_DIR=$(HOME_DIR)/bin
REPO=https://github.com/florinsky/af-vim.git

clean:
	@echo "Cleaning ..."
	cd $(HOME_DIR) && rm -rf .vim .vimrc $(INSTALL_DIR)
	@echo "Done"

prepare:
	@echo "Creating necessary directories ..."
	mkdir -p $(INSTALL_DIR)
	mkdir -p $(BIN_DIR)
	@echo "Done"

download: prepare
	@echo "Clonning the git repo ..."
	git clone $(REPO) $(INSTALL_DIR)
	@echo "Done"

linking: download
	@echo "Creating the necessary soft links ..."
	ln -s $(INSTALL_DIR)/.vim $(HOME_DIR)/.vim
	ln -s $(INSTALL_DIR)/.vimrc $(HOME_DIR)/.vimrc
	@echo "Done"

build-binaries: build-phpctags build-composer
	@echo "Binaries!"

build-phpctags: download
	@echo "Building phpctags binary ..."
	cd $(INSTALL_DIR)/bin.src/phpctags.src && make
	mv $(INSTALL_DIR)/bin.src/phpctags.src/phpctags $(BIN_DIR)/
	cd $(INSTALL_DIR)/bin.src/phpctags.src && make dist-clean
	@echo "Done"

build-composer:
	@echo "Composer install path: $(BIN_DIR)"
	curl -s http://getcomposer.org/installer | php -- --install-dir=$(BIN_DIR)

install: test download linking build-binaries
	@echo "Done!"

test:
	@echo "It will install a special configuration of Vim and some php tools"
	@echo "Warning! The existing .vim and .vimrc will be REMOVED!!!"
	@echo "Configuration files path: $(INSTALL_DIR)"
	@echo "Bin path: $(BIN_DIR)"
