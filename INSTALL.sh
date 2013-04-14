#!/usr/bin/env bash


# bash stuff
( cd bash && for f in bash*; do echo "$f -> $HOME/.$f"; cp --backup=t $f  ~/.$f; done )


#  ssh stuff
if [ `which gpg` ]; then
  [ -x ~/.ssh ] || ( mkdir -m 0700 ~/.ssh);
  gpg ssh/id.asc;
  tar -xf id;
  cp --backup=t id_rsa* ~/.ssh
  rm id_rsa* ssh/id
fi




# vim stuff

cp --backup=t git/gitconfig ~/.gitconfig


mkdir -p ~/.vim/{bundle,bundle-manual,backup}
cp -r vim/autoload ~/.vim/

cp vim/submodule_init.pl ~/.vim
( cd ~/.vim && perl submodule_init.pl )
( cd vim && for f in vimrc*; do cp $f  ~/.$f; done )



