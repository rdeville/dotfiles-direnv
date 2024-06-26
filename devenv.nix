{
  pkgs ? import <nixpkgs>,
  config,
  lib,
  ...
}: {
  packages = with pkgs; [];

  enterShell = ''
    CYAN="\033[36m"
    RESET="\033[0m"
    echo -e "$CYAN"
    echo -e "Helper scripts you can run to make your development richer:\n"
    ${pkgs.gnused}/bin/sed -e 's| |••|g' -e 's|=| |' <<EOF | ${pkgs.util-linuxMinimal}/bin/column -t | ${pkgs.gnused}/bin/sed -e 's|••| |g'
    ${lib.generators.toKeyValue {} (lib.mapAttrs (name: value: value.description) config.scripts)}
    EOF
    echo -e "$RESET"
  '';

  # Dotenv files are loading before devenv using direnv
  dotenv = {
    enable = false;
    disableHint = true;
  };
}
