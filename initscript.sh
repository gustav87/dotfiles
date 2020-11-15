#! /bin/bash
# Check if .bash_aliases exists, and if it does, create a backup of it before creating symlink
bashaliases='/home/'$USER'/.bash_aliases'
if [ -e $bashaliases ]
then
	echo "File $bashaliases exists. Making backup and creating symlink to repository file."
	mv $bashaliases $bashaliases'_copy'
	ln -s $PWD'/.bash_aliases' '/home/'$USER
else
	echo "File $bashaliases doesnt exist. Creating symlink to repository file."
	ln -s $PWD'/.bash_aliases' '/home/'$USER
fi

# Check if .bashrc already includes .bash_aliases. If it doesn't, then append that code to the end of .bashrc
bashrc='/home/'$USER'/.bashrc'
if ! grep -q bash_aliases $bashrc; then
	echo "Link to .bash_aliases doesn't exist in .bashrc. Appending code to the end of .bashrc."
	echo "if [ -f ~/.bash_aliases ]; then" >> $bashrc &&
	echo ". ~/.bash_aliases" >> $bashrc &&
	echo "fi" >> $bashrc
fi
