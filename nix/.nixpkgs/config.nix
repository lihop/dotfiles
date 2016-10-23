let
in
{
  allowUnfree = true;

  packageOverrides = pkgs: with pkgs; rec {
    common = import ./envs/common { inherit pkgs; };
    development = import ./envs/development { inherit pkgs; };
    gaming = import ./envs/gaming { inherit pkgs; };
    media = import ./envs/media { inherit pkgs; };
    office = import ./envs/office { inherit pkgs; };
    workstation = import ./envs/workstation { inherit pkgs; };

    # Home desktop environment
    desktopEnv = buildEnv {
      name = "desktop-environment";
      paths = [
        common
        development.base
        development.haskell
        development.node
        development.tools
        gaming
        media.extra
        office.extra
        workstation.extra
      ];
    };
  };
}
