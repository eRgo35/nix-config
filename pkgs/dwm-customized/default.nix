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
  version = "6.4";

  src = pkgs.fetchFromGitHub {
    owner = "eRgo35";
    repo  = "dwm";
    rev   = "main";
    sha256 = "sha256-KA/g84/QgbihwRT8VuFVr8EXe0L15kFvNW82PRBASa0=";
  };

  # unpackPhase = ''tar -xf $src'';
  
  buildInputs = [ libX11 libXinerama libXft ];

  buildPhase  = ''make'';

  installPhase = ''make PREFIX=$out DESTDIR="" install'';
}
