{
  description = ''
    Flake for DirenvRC

    Dotfiles to setup common directory environment management per project using
    [`direnv`](https://direnv.net) uniformly for all my projects.
  '';

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
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
    formatter = forAllSystems (
      system:
        (pkgsForSystem system).alejandra
    );

    # PACKAGES
    # ========================================================================
    packages = forAllSystems (system: rec {
      direnvrc = with (pkgsForSystem system);
        callPackage ./package.nix {};
      default = direnvrc;
    });

    # HOME MANAGER MODULES
    # ========================================================================
    homeManagerModules = {
      direnvrc = import ./modules/home-manager.nix self;
    };
    homeManagerModule = self.homeManagerModules.direnvrc;

  };
}
