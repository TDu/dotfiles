# dotfiles

Sharing and making easily transferable between computers the dotfiles I care about.

To avoid creating a git repo in my home directory, which has been noted by others to be bad practice (security, ease of use, ?). All the dotfiles are stored in their own directory (~/dotfiles) and symlinks are used to access them.

## How to
To set up the symlink to the dotfiles on a new system, gnu-stow (apt-get install stow) is used.

The process is as follow, from the dotfile directory :

    stow {directory name}

Will create the coresponding symlink in the home directory.