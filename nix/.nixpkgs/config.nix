{pkgs}:
let
  vimrc = import ./vimrc.nix {};

  customPlugins.elm = pkgs.vimUtils.buildVimPlugin {
    name = "elm";
    src = pkgs.fetchFromGitHub {
      owner = "lambdatoast";
      repo = "elm.vim";
      rev = "916842745a73c73d25437ca17b88f32d8c944e1d";
      sha256 = "1wkz5r8h6f4i0rhar787p4dvs6j02zxl9ki24pczgwql6j1dgkhp";
    };
  };

  customPlugins.hasksyn = pkgs.vimUtils.buildVimPlugin {
    name = "hasksyn";
    src = pkgs.fetchFromGitHub {
      owner = "travitch";
      repo = "hasksyn";
      rev = "c434040bf13a17ca20a551223021b3ace7e453b9";
      sha256 = "09998lnfcshqis5m062wlag6y476imq9jday9gp4ayjjl1cp3cwx";
    };
  };
in
with pkgs; rec {
  vimrcConfig = {
    vam.knownPlugins = vimPlugins // customPlugins;
    vam.pluginDictionaries = [
      # load always
      { names = [
          "CSApprox"
          "Colour-Sampler-Pack"
          "changeColorScheme-vim"
          "elm"
          "fugitive"
          "hasksyn"
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
