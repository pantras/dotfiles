#!/bin/bash
############################
# bootstrap.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
#
# Based on https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh
############################

dir=~/dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old            # old dotfiles backup directory

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in *; do
echo "current: $file"
    if [ "$file" == "bootstrap.sh" -o "$file" == "README.md" ]; then
        continue
    fi
    echo "Moving $file from ~ to $olddir"
    mv ~/.$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
