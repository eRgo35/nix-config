{
  stdenv,
  fetchurl,
  makeDesktopItem,
  makeWrapper,
  autoPatchelfHook,
  fontconfig,
  freetype,
  glib,
  gtk3,
  jdk17,
  lib,
  xorg,
  zlib,
  alsaLib,
}: let
  # Please keep the version x.y.0.z and do not update to x.y.76.z because the
  # source of the latter disappears much faster.
  version = "6.6.0";

  # rpath = stdenv.lib.makeLibraryPath [
  #   gcc-unwrapped
  #   glibc
  # ];
  # What is it for?
  # + ":${stdenv.cc.cc.lib}/lib64";

  src = ./papyrus-2023-12-6.6.0-linux64.tar.gz;

  desktopItem = makeDesktopItem {
    name = "papyrus";
    exec = "papyrus";
    icon = "papyrus";
    desktopName = "Papyrus";
    comment = "SQL Integrated Development Environment";
    genericName = "SQL Integrated Development Environment";
    categories = ["Development"];
  };
in
  stdenv.mkDerivation {
    pname = "papyrus";
    version = "6.6.0";

    system = "x86_64-linux";

    inherit src;

    nativeBuildInputs = [
      makeWrapper
      autoPatchelfHook
    ];

    buildInputs = [
      fontconfig
      freetype
      glib
      gtk3
      jdk17
      xorg.libX11
      xorg.libXrender
      xorg.libXtst
      zlib
      alsaLib
    ];

    # Extract and copy executable in $out/bin
    installPhase = ''
      # Remove the bundled Java Runtime Environment as we will use our own.
      rm -rf jre

      # Create the directory where DBeaver will reside within the Nix store.
      mkdir -p $out/

      # Copy all the files from the build directory to the Nix store.
      cp -r . $out/Papyrus

      # The binaries will be automatically patched by autoPatchelfHook.
      # This adds necessary runtime dependencies to the ELF files.

      # Create a wrapper script for launching DBeaver.
      # - Sets Java path
      # - Sets library path for GTK and X11
      # - Sets GSettings schema path
      makeWrapper $out/Papyrus/papyrus $out/bin/Papyrus \
        --prefix PATH : ${jdk17}/bin \
        --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [glib gtk3 xorg.libXtst]} \
        --prefix XDG_DATA_DIRS : "$GSETTINGS_SCHEMAS_PATH"

      # Create a directory for the desktop entry.
      mkdir -p $out/share/applications

      # Copy the generated desktop entry to the appropriate location.
      cp ${desktopItem}/share/applications/* $out/share/applications

      # Create a directory for storing the DBeaver icon.
      mkdir -p $out/share/pixmaps

      # Symlink the DBeaver icon to the standard location.
      ln -s $out/Papyrus/icon.xpm $out/share/pixmaps/papyrus.xpm
    '';

    meta = with lib; {
      homepage = "https://eclipse.dev/papyrus/index.php";
      description = "Open source Model-Based Engineering tool";
      # longDescription = ''
      #   Multi-platform database tool for developers, SQL programmers, database
      #   administrators and analysts. Supports all popular databases: MySQL,
      #   PostgreSQL, MariaDB, SQLite, Oracle, DB2, SQL Server, Sybase, MS Access,
      #   Teradata, Firebird, Derby, etc.
      # '';
      license = licenses.free;
      platforms = ["x86_64-linux"];
      maintainers = [maintainers.eRgo35];
    };
  }
# desktopItem = makeDesktopItem {
#   name = "dbeaver-ee";
#   exec = "dbeaver";
#   icon = "dbeaver";
#   desktopName = "dbeaver-ee";
#   comment = "SQL Integrated Development Environment";
#   genericName = "SQL Integrated Development Environment";
#   categories = ["Development"];
# };
#
#  # src = pkgs.fetchurl {
#  #   url = "https://download.eclipse.org/modeling/mdt/papyrus/rcp/2023-12/6.6.0/papyrus-2023-12-6.6.0-linux64.tar.gz";
#  #   sha512 = "ab1f1c0192fa7791550ef284c221a5445e02a699f4a82ec9b08f2c4b1f894b387751c37a6c5109f7709afea265126210682a266adb00fb26768057c0321ba802";
#  # };
#  # unpackPhase = "tar -xf $src -C $out/bin/papyrus --strip-components=1";
#
#  installPhase = ''
#    mkdir -p $out/bin
#    tar -xf $src -C $out/bin --strip-components=1
#  '';
#

