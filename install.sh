#!/bin/sh

# Script to install rope, ropemacs, pymacs, yasnippet and flymake for emacs.
#
# AUTHOR: Greg Newman http://20seven.org
#
# INSTRUCTIONS:
#
# make sure this script has execute permissions
# Run this script
#  ./install.sh
#

## PYMACS INSTALLATION
cd vendor
# download pymacs 0.23 tarball into vendor directory
curl -O http://pymacs.progiciels-bpi.ca/archives/Pymacs.tar.gz
# expand pymacs
tar xzvf Pymacs.tar.gz
# step into the pymacs directory
cd Pymacs-0.23
# install the pymacs proper
sudo python setup.py install
# copy the pymacs lisp file into the vendor directory
cp pymacs.el ../pymacs.el
cd ..
# cleanup. we don't need these anymore
rm Pymacs.tar.gz
sudo rm -rf Pymacs-0.23/


## ROPE, ROPEMACS INSTALLATION
# we assume you already have mercurial installed
# clone the necessary files (rope, ropemacs and ropemode)
hg clone http://bitbucket.org/agr/rope
hg clone http://bitbucket.org/agr/ropemacs
hg clone http://bitbucket.org/agr/ropemode
cd rope
# install Rope
sudo python setup.py install
cd ..
# symlink ropemode which is needed for the ropemacs install
ln -s ../ropemode/ropemode ropemacs/
cd ropemacs
# install ropemacs
sudo python setup.py install
cd ..
sudo rm -rf rope
sudo rm -rf ropemacs
sudo rm -rf ropemode


## YASNIPPET 0.6.1c INSTALLATION
svn checkout http://yasnippet.googlecode.com/svn/trunk/ yasnippet

## PYFLAKES & FLYMAKE INSTALL
cd ..
mkdir tmp
cd tmp
svn co http://divmod.org/svn/Divmod/trunk/Pyflakes PyFlakes
cd PyFlakes
sudo python setup.py install
ln -s `pwd`/bin/pyflakes /usr/local/bin
cd ..
#sudo rm -rf PyFlakes

## CEDET INSTALLATION
cvs -d:pserver:anonymous@cedet.cvs.sourceforge.net:/cvsroot/cedet login
cvs -z3 -d:pserver:anonymous@cedet.cvs.sourceforge.net:/cvsroot/cedet co -P cedet
cd cedet
make EMACS=emacs
cd ..

## ECB INSTALLATION
curl -O http://ecb.sourceforge.net/cvs_snapshots/ecb.tar.gz
tar xzvf ecb.tar.gz
rm ecb.tar.gz