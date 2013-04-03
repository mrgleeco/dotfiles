#!/usr/bin/env bash


# bash stuff
( cd bash && for f in bashrc*; do cp $f  ~/.$f; done )


#  ssh stuff
if [ `which gpg` ];
  -x ~/.ssh || { mkdir -m 0700 ~/.ssh}
  gpg ssh/id.asc
  tar xf id
else
  echo " FAIL - ~/.ssh stuff needs gpg to install SSH from this repo"
fi




# vim stuff


mkdir -p ~/.vim/{bundle,bundle-manual,backup}
cp -r vim/autoload ~/.vim/

cp vim/bundle_submodule_init.pl ~/.vim
( cd ~/.vim && perl bundle_submodule_init.pl )
( cd vim && for f in vimrc*; do cp $f  ~/.$f; done )



