#! /bin/sh
for f in .cshrc .set_path .login .alias
do
    ln -s $HOME/marki/$f ~/$f
done
