{
  stdenv,
  pkgs,
  libX11,
  libXinerama,
  libXft,
  ...
}:
stdenv.mkDerivation {
  pname = "dwm-customized";
  version = "6.4.2";

  src = pkgs.fetchFromGitHub {
    owner = "eRgo35";
    repo = "dwm";
    rev = "d4fed3cac603ea386d57b8c96f6bc49b3c2eec64";
    sha256 = "sha256-pQMoxKbvWJLznpzcl91yPuB4ugxXW1PnslDM/877ZqA=";
  };

  # unpackPhase = ''tar -xf $src'';

  buildInputs = [libX11 libXinerama libXft];

  buildPhase = ''make'';

  installPhase = ''make PREFIX=$out DESTDIR="" install'';
}
