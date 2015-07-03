Installation
------------
1. Install the dotfiles package using [this](https://github.com/lihop/nixos/blob/master/pkgs/dotfiles.nix) nix expression.
2. Run the command `dotfiles-update`.

Usage
-----
```
cd ~/.dotfiles
```
To symlink all the dotfiles:
```
for dir in */; do stow $dir; done
```
To symlink the dotfiles of an individual application (e.g. xmonad):
```
stow xmonad
```
To remove the symlink:
```
stow -D xmonad
```  

