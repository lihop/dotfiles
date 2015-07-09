{pkgs}:
let
  vimrc = import ./vimrc.nix {};
in
with pkgs; rec {
  vimrcConfig = {
    vam.knownPlugins = vimPlugins;
    vam.pluginDictionaries = [
      { names = [
          "CSApprox"
          "Colour-Sampler-Pack"
          "changeColorScheme-vim"
          "fugitive"
          "latex-live-preview"
          "random-vim"
          "sleuth"
          "vim-addon-vim2nix"
        ]; }
    ];
    customRC = vimrc.config;
  };
  
  my_vim = vim_configurable.customize { name = "vim"; inherit vimrcConfig; };

  packageOverrides = pkgs_: with pkgs_; {
    vimEnv = with pkgs; buildEnv {
      name = "vim-env";
      ignoreCollisions = true;
      paths = [
        my_vim
      ];
    };
  };
}
