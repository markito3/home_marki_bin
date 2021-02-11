#! /bin/sh
for f in .cshrc .set_path .login .alias .emacs .bashrc .bash_profile .inputrc
do
    ln -s $HOME/marki/$f ~/$f
done
