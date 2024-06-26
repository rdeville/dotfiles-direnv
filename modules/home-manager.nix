self: {
  pkgs,
  lib,
  ...
}: {
  xdg = {
    configFile = {
      direnv = {
        source = lib.mkDefault self.packages.${pkgs.stdenv.hostPlatform.system}.default;
      };
    };
  };
}
