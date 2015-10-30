#dotfiles

Sharing and making easily transferable between computers the dotfiles I care about.

To avoid creating a git repo in my home directory, which has been noted by others to be bad practice (security, ease of use, ?) they are stored in their own directory (~/dotfiles) and symlinks are used.

And I am using gnu-stow (apt-get install stow) to manage the symlink. From the dotfile directory :

stow {directory name}

And the proper symlink will be created in the home directory.