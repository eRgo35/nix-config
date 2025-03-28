{
  inputs,
  pkgs,
  rust-overlay,
  ...
}: {
  environment.systemPackages = with pkgs.unstable; [
    # general
    docker
    docker-compose

    # iot
    platformio

    # rust
    openssl
    rustup
    pkg-config
    cargo-deny
    cargo-edit
    cargo-watch
    # rust-analyzer

    # bash
    shellcheck

    # nodejs
    node2nix
    nodejs
    nodePackages.pnpm
    yarn

    # # python
    # python311
    # python311Packages.pip
    uv
    # python311Packages.venvShellHook

    # cpp
    clang-tools
    libgcc
    gcc
    clang
    cmake
    codespell
    conan
    cppcheck
    doxygen
    gtest
    lcov
    vcpkg
    gnumake
    # vcpkg-tool
    valgrind

    # haskell
    cabal-install
    ghc
    haskell-language-server

    # nix
    cachix
    lorri
    niv
    nixd
    nixfmt-classic
    statix
    haskellPackages.dhall-nix

    # java
    jdk
    jdk8
    jdk17
    maven
    gradle

    tex-fmt
  ];
}
