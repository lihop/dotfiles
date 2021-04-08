{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Leroy Hopson";
    userEmail = "git@leroy.geek.nz";
  };
}
