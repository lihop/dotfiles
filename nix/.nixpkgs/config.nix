{pkgs}:
let
  vimrc = import ./vimrc.nix {};
in
with pkgs; rec {
  vimrcConfig = {
    vam.knownPlugins = vimPlugins;
    vam.pluginDictionaries = [
      # load always
      { names = [
          "CSApprox"
          "Colour-Sampler-Pack"
          "changeColorScheme-vim"
          "fugitive"
          "random-vim"
          "sleuth"
          "vim-addon-vim2nix"
        ];
      }
      # load only when opening a .tex file
      { name = "latex-live-preview"; ft_regex = "^tex\$"; }
      { name = "latex-live-preview"; filename_regex = "^tex\$"; }
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
