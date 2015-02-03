Requirements
------------
The directory structure of these dotfiles is designed to be used with [GNU Stow](http://www.gnu.org/software/stow/). This repo also includes the vim plugin manager [Vundle](https://github.com/gmarik/Vundle.vim) and terminal color changer [dynamic-colors](https://github.com/sos4nt/dynamic-colors) as submodules.

Usage
-----
```
git clone --recursive https://github.com/lihop/dotfiles.git
```
To symlink all the dotfiles:
```
cd ~/.dotfiles
for dir in */; do stow $dir; done
```
To symlink the dotfiles of an individual application (e.g. vim) use the following from within the `.dotfiles` directory:
```
stow vim
```
To remove the symlink:
```
stow -D vim
```  


By default, the Vundle submodule is not on a branch. This means that Vundle will not be able to update itself using `git pull`. To check out the master branch, run the following command from within the `.dotfiles` directory:
```
git submodule foreach --recursive git checkout master
```
To update/install Vundle/Plugins (assuming you have the `vim` directory stowed):
```
vim -c VundleUpdate -c quitall
```
