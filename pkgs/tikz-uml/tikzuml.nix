{ lib, stdenvNoCC, fetchurl, mkShell }:
let
  pkgs = import <nixpkgs> { };

  version = "1.0";
  date = "2016-03-29";

  # src = ./tikzuml-v1.0-2016-03-29.tbz;

  src = fetchurl {
    url = "http://perso.ensta-paristech.fr/~kielbasi/tikzuml/var/files/src/tikzuml-v${version}-${date}.tbz";
    sha256 = "0cbc4a20c8ed40162b3b9ab1400b174293ec1ad7508e640ca879e78c45a105d0";
  };
  
  tikzuml = { pkgs = [ pkgs.tikzuml ]; };

  texpkgs = pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-full;
    inherit tikzuml;
  };

in stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "tikz-uml";
  inherit version;
  
  inherit src;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/texmf-nix/latex/tikz-uml
    mkdir -p $out/share/texmf-nix/doc/tikz-uml
    cp -prd doc/. $out/share/texmf-nix/doc/tikz-uml
    cp -prd tikz-uml.sty $out/share/texmf-nix/latex/tikz-uml/

    # install -Dm644 "$src/tikzuml-v${version}-${date}/tikz-uml.sty" "$out/share/texmf-nix/tex/latex/tikz-uml/tikz-uml.sty"

    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://perso.ensta-paris.fr/~kielbasi/tikzuml/index.php";
    description = "A LaTeX package for drawing UML diagrams using pgf/tikz";
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ eRgo35 ];
    platforms = platforms.unix;
  };
})
