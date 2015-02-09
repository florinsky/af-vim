HOME_DIR=`realpath ~`
INSTALL_DIR=$(HOME_DIR)/.af_vim_config
BIN_DIR=$(HOME_DIR)/bin
REPO=https://github.com/florinsky/af-vim.git

install-system-tools:
	@echo "Installing system tools ..."
	sudo apt-get update
	sudo apt-get install ant atop autoconf automake bison build-essential curl git git-core libc6-dev libreadline6 libreadline6-dev libsqlite3-dev libssl-dev libtool libxml2-dev libxslt-dev libyaml-dev mysql-server ncurses-dev openssl php5  php5-cli php5-curl php5-pgsql php5-sqlite php5-xdebug php5-xsl phpmyadmin php-pear sqlite3 subversion vim zlib1g zlib1g-dev openssh-server ssh iotop rar screen ncftp p7zip smbnetfs smbclient apache2-suexec libapache2-mod-fcgid php5-fpm libfcgi0ldbl libmysql-java bc dnsutils realpath
	@echo "Installing system tools ... Done\n"

clean:
	@echo "Cleaning ..."
	cd $(HOME_DIR) && rm -rf .vim .vimrc $(INSTALL_DIR)
	@echo "Cleaning ... Done\n"

prepare:
	@echo "Creating necessary directories ..."
	mkdir -p $(INSTALL_DIR)
	mkdir -p $(BIN_DIR)
	@echo "Creating necessary directories ... Done\n"

download: prepare
	@echo "Clonning the git repo ..."
	git clone $(REPO) $(INSTALL_DIR)
	@echo "Clonning the git repo ... Done\n"

linking: download
	@echo "Creating the necessary soft links ..."
	ln -s $(INSTALL_DIR)/.vim $(HOME_DIR)/.vim
	ln -s $(INSTALL_DIR)/.vimrc $(HOME_DIR)/.vimrc
	@echo "Creating the necessary soft links ... Done\n"

build-binaries: build-phpctags build-composer build-vimproc
	@echo "Binaries installed!\n"

build-phpctags: download
	@echo "Building phpctags binary ..."
	cd $(INSTALL_DIR)/bin.src/phpctags.src && make
	mv $(INSTALL_DIR)/bin.src/phpctags.src/phpctags $(BIN_DIR)/
	cd $(INSTALL_DIR)/bin.src/phpctags.src && make dist-clean
	@echo "Building phpctags binary ... Done\n"

build-composer:
	@echo "Installing Composer ..."
	@echo "Composer install path: $(BIN_DIR)"
	curl -s http://getcomposer.org/installer | php -- --install-dir=$(BIN_DIR)
	@echo "Installing Composer ... Done\n"

build-vimproc:
	@echo "Building vimproc ..."
	cd $(INSTALL_DIR)/.vim/bundle/vimproc.vim && make
	@echo "Building vimproc ... Done\n"

install: test download linking build-binaries
	@echo "Done!\n"

test:
	@echo "It will install a special configuration of Vim and some php tools"
	@echo "Warning! The existing .vim and .vimrc will be REMOVED!!!"
	@echo "Configuration files path: $(INSTALL_DIR)"
	@echo "Bin path: $(BIN_DIR)"
	@echo "\n"
