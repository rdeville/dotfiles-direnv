{
  description = ''
    Flake for DirenvRC

    Dotfiles to setup common directory environment management per project using
    [`direnv`](https://direnv.net) uniformly for all my projects.
  '';

  inputs = {
    # Stable Nix Packages
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    # Flake Utils Lib
    utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs = inputs @ {self, ...}: let
    pkgsForSystem = system:
      import inputs.nixpkgs {
        inherit system;
      };
    forAllSystems = inputs.nixpkgs.lib.genAttrs allSystems;

    allSystems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
  in {
    # TOOLING
    # ========================================================================
    # Formatter for your nix files, available through 'nix fmt'
    # Other options beside 'alejandra' include 'nixpkgs-fmt'
    formatter = forAllSystems (
      system:
        (pkgsForSystem system).alejandra
    );

    homeManagerModules = {
      direnvrc = import ./modules/home-manager.nix self;
    };
    homeManagerModule = self.homeManagerModules.direnvrc;

    packages = forAllSystems (system: rec {
      direnvrc = with import inputs.nixpkgs {inherit system;};
        callPackage ./package.nix {};
      default = direnvrc;
    });
  };
}
# END DOTGIT-SYNC BLOCK MANAGED
