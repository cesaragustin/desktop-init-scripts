#!/usr/bin/env bash

VIMDIR=~/.vim
BUNDLEDIR=~/.vim/bundle
COLORSDIR=~/.vim/colors

mkdir -p $VIMDIR
mkdir -p $BUNDLEDIR
mkdir -p $COLORSDIR

cp vim/vimrc ~/.vimrc

repos=(Vundle.vim ctrlp.vim nerdtree vim-airline vim-airline-themes typescript-vim)
for repo in "${repos[@]}"
do
    if [ ! -d $BUNDLEDIR/$repo ]; then
        mkdir -p $BUNDLEDIR/$repo
    fi
done

git clone git://github.com/VundleVim/Vundle.vim.git $BUNDLEDIR/Vundle.vim
git clone git://github.com/ctrlpvim/ctrlp.vim.git $BUNDLEDIR/ctrlp.vim
git clone git://github.com/scrooloose/nerdtree.git $BUNDLEDIR/nerdtree
git clone git://github.com/vim-airline/vim-airline.git $BUNDLEDIR/vim-airline
git clone git://github.com/vim-airline/vim-airline-themes.git $BUNDLEDIR/vim-airline-themes
git clone git://github.com/leafgarland/typescript-vim.git $BUNDLEDIR/typescript-vim

cp vim/monokai.vim $COLORSDIR


TMPDIR=/tmp

mkdir -p $TMPDIR/tmux

#apt-get -y -qq remove tmux

git clone https://github.com/tmux/tmux.git $TMPDIR/tmux
cd $TMPDIR/tmux
sh autogen.sh
autoreconf -i --force && ./configure
make
cp $TMPDIR/tmux/tmux /bin

cp tmux/tmux.conf ~/.tmux.conf
