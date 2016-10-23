{ nixpkgs ? <nixpkgs> }:
let
  pkgs = import <nixpkgs> { };
in
{
  build = pkgs.lib.genAttrs [ "x86_64-linux" "x86_64-darwin" ] (system:
    let
      pkgs = import <nixpkgs> { inherit system; config.allowUnfree = true; };
    in
    { common = import ./envs/common { inherit pkgs; };
      development = import ./envs/development { inherit pkgs; };
      games = import ./envs/gaming { inherit pkgs; };
      media = import ./envs/media { inherit pkgs; };
      office = import ./envs/office { inherit pkgs; };
      workstation = import ./envs/workstation { inherit pkgs; };
    }
  );
}
