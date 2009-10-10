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
curl -O http://yasnippet.googlecode.com/files/yasnippet-bundle-0.6.1c.el.tgz
tar xzvf yasnippet-bundle-0.6.1c.el.tgz
rm yasnippet-bundle-0.6.1c.el.tgz

## PYFLAKES INSTALL
svn co http://divmod.org/svn/Divmod/trunk/Pyflakes PyFlakes
cd PyFlakes
sudo python setup.py install
cd ..
sudo rm -rf PyFlakes