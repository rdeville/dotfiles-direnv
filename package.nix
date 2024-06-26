{stdenv, ...}:
stdenv.mkDerivation {
  name = "direnvrc";
  src = ./.;
  installPhase = ''
    mkdir -p $out;
    cp -r \
      direnv.toml \
      direnvrc \
      lib \
      templates \
      tools \
      README.md \
      LICENSE* \
      $out
  '';
}
