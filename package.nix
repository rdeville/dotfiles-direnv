{stdenv, ...}:
stdenv.mkDerivation {
  name = "direnvrc";
  src = ./.;
  installPhase = ''
    mkdir -p $out;
    cp -r \
      *.md \
      LICENSE* \
      direnv.toml \
      direnvrc \
      lib \
      templates \
      tools \
      $out
  '';
}
