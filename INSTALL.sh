#!/usr/bin/env bash


# bash stuff
backup='';
case $SYS in
    Darwin)
        # on a new MBA install, vim doesnt work w/o this setup
        sudo sudo mkdir -p /usr/include/python2.7
        sudo ln -s /System/Library/Frameworks/Python.framework/Versions/Current/include/python2.7/pyconfig.h /usr/include/python2.7/pyconfig.h
        ;;
    Linux)
	    backup='--backup=t'; 
	;;
esac;

( cd bash && for f in bash*; do echo "$f -> $HOME/.$f"; cp ${backup} $f  ~/.$f; done )

#  ssh stuff
if [ `which gpg` ]; then
  [ -x ~/.ssh ] || ( mkdir -m 0700 ~/.ssh);
  ( cd ssh  && gpg id.asc && tar -xf id && cp ${backup} id_rsa* ~/.ssh/ && rm id_rsa* id )
fi


cp ${backup} git/gitconfig   ~/.gitconfig
cp ${backup} screen/screenrc ~/.screenrc
cp ${backup} tmux/tmux.conf  ~/.tmux.conf


# vim stuff
mkdir -p ~/.vim/{bundle,bundle-manual,backup}
cp -r vim/autoload ~/.vim/

cp vim/submodule_init.pl ~/.vim
( cd ~/.vim && perl submodule_init.pl )
( cd vim && for f in vimrc*; do cp ${backup} $f  ~/.$f; done )



