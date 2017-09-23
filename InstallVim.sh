#!/bin/sh

GetPythonConfigName(){
	s=$(ls /usr/lib/ | grep python3.)
	s=$(ls /usr/lib/$s -N --ignore="*.py" | grep config)
	echo $s
}

GetVimInstallPackageName(){
	ls ~/vim | grep vim.*\.deb
}

#echo $(GetPythonConfigName)
#return

echo "Compiling Vim from source..."
echo "Vim removing..."
sudo apt-get remove -y vim vim-runtime gvim vim-tiny vim-common vim-gui-common vim-nox
echo "Installing essential tools..."
sudo apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git checkinstall
echo "Vim cloning..."
cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --enable-python3interp=yes \
			--with-python3-config-dir=/usr/lib/$(ls /usr/lib/ | grep python3.)/$(GetPythonConfigName) \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local
make VIMRUNTIMEDIR=/usr/local/share/vim/vim80
echo "Vim installing..."
sudo checkinstall
sudo dpkg -i ~/vim/$(GetVimInstallPackageName)
echo "Vim installed"
wget https://raw.githubusercontent.com/fsps60312/RandomCode/master/.vimrc -O ~/.vimrc
echo "Configuring: \\x to comment/uncomment"
sudo aptitude install vim-addon-manager vim-scripts
vim-addons install enhanced-commentify
echo "Configuring: Auto Pairs"
wget https://raw.githubusercontent.com/jiangmiao/auto-pairs/master/plugin/auto-pairs.vim -O ~/.vim/plugin/auto-pairs.vim
echo "Configuring YCM..."
sudo apt-get install -y build-essential cmake python-dev python3-dev
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
echo "Apply Plugins..."
vim +PluginInstall
echo "All Completed!!!"
