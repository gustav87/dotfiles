#! /bin/bash
file='/home/'$USER'/.bash_aliases'
if [ -e $file ]
then
	echo "File $file exists. Making backup and creating symlink to repository file."
	mv $file $file'_copy'
	ln -s $PWD'/.bash_aliases' '/home/'$USER
else
	echo "File $file doesnt exist. Creating symlink to repository file"
	ln -s $PWD'/.bash_aliases' '/home/'$USER
fi
