#! /bin/sh
for f in .cshrc .set_path .login .alias .forward
do
    ln -s ~/marki/$f ~/$f
done
