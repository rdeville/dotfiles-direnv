{stdenv, ...}:
stdenv.mkDerivation {
  name = "direnvrc";
  src = ./.;
  installPhase = ''
    mkdir -p $out;
    cp -r \
      README.md \
      LICENSE* \
      CHANGELOG.md \
      CODE_OF_CONDUCT.md \
      AUTHORS \
      direnv.toml \
      direnvrc \
      lib \
      templates \
      tools \
      $out
  '';
}
