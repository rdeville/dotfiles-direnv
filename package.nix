{stdenv, ...}:
stdenv.mkDerivation {
  name = "direnvrc";
  src = ./.;
  installPhase = ''
    mkdir -p $out;
    cp -r \
      *.md \
      AUTHORS \
      LICENSE* \
      direnv.toml \
      direnvrc \
      lib \
      templates \
      tools \
      $out
  '';
}
