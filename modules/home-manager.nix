# BEGIN DOTGIT-SYNC BLOCK MANAGED
self: {
  pkgs,
  lib,
  # BEGIN DOTGIT-SYNC BLOCK EXCLUDED NIX_HOME_MANAGER_MODULE_CUSTOM
  ...
}: {
  xdg = {
    configFile = {
      direnv = {
        source = lib.mkDefault self.packages.${pkgs.stdenv.hostPlatform.system}.default;
      };
    };
  };
  # END DOTGIT-SYNC BLOCK EXCLUDED NIX_HOME_MANAGER_MODULE_CUSTOM
}
# END DOTGIT-SYNC BLOCK MANAGED
