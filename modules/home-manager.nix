{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.programs.direnv;
in {
  config = lib.mkIf cfg.enable {
    programs = {
      direnv = {
        config = builtins.fromTOML (builtins.readFile ../direnv.toml);
        stdlib = builtins.readFile ../direnvrc;
      };
    };

    xdg = {
      configFile = {
        "direnv/lib" = {
          source = ../lib;
        };
        "direnv/templates" = {
          source = ../templates;
        };
        "direnv/tools" = {
          source = ../tools;
        };
      };
    };
  };
}