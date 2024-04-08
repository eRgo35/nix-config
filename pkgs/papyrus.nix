with import <nixpkgs> {}; with pkgs;
stdenv.mkDerivation rec {
  name = "papyrus";
  version = "6.6.0";
  buildInputs = [ pkgs.unzip 
      alsaLib
      glibc
      xlibs.libxcb
      xlibs.libX11
      xlibs.libXcursor
      xlibs.libXi
      xlibs.libXrandr
      libglvnd ];
  src = pkgs.fetchurl {
    url = "https://download.eclipse.org/modeling/mdt/papyrus/rcp/2023-12/6.6.0/papyrus-2023-12-6.6.0-linux64.tar.gz";
    sha512 = "ab1f1c0192fa7791550ef284c221a5445e02a699f4a82ec9b08f2c4b1f894b387751c37a6c5109f7709afea265126210682a266adb00fb26768057c0321ba802";
  };
  # src = ./papyrus-2023-12-6.6.0-linux64.tar.gz;
  sourceRoot = ".";
  dontConfigure = true;
  dontBuild = true;
  installPhase = ''
    mkdir -p $out/{bin,lib}
    mv lib/* $out/lib/
    tar -xf $src -C $out/bin --strip-components=1
  '';
  dontPatchELF = true;
  preFixup = let
    libPath = lib.makeLibraryPath [
      alsaLib
      glibc
      xlibs.libxcb
      xlibs.libX11.out
      xlibs.libXcursor
      xlibs.libXi
      xlibs.libXrandr
      libglvnd
    ];
  in ''
    rPath="${libPath}:$out/lib"
    echo $rPath
    patchelf \
      --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
      --set-rpath $rPath \
      $out/bin/robo-instructus-demo
  '';
  # meta = with stdenv.lib; {
  #  homepage = "https://eclipse.dev/papyrus/index.php";
  #  description = "Modeling environment";
  #  license = licenses.free;
  #  platforms = platforms.linux;
  #  maintainers = [ "eRgo35" ];
  #};
}
