let
  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  nixpkgs = import <nixpkgs> { overlays = [ moz_overlay ]; };
  ruststable = (nixpkgs.latest.rustChannels.stable.rust.override { extensions = [ "rust-src" "rls-preview" "rust-analysis" "rustfmt-preview" ];});
in
  with nixpkgs;
  stdenv.mkDerivation {
    name = "rust";
    buildInputs = [ openssl rustup ruststable cmake zlib ];

    shellHook = ''
	export LD_LIBRARY_PATH=${pkgs.stdenv.cc.cc.lib}/lib:${pkgs.cudatoolkit_11_0}/lib:${pkgs.cudnn_cudatoolkit_11_0}/lib:${pkgs.cudatoolkit_11_0.lib}/lib:/run/opengl-driver/lib:lib/:$LD_LIBRARY_PATH
        export OPENSSL_DIR="${openssl.dev}"
        export OPENSSL_LIB_DIR="${openssl.out}/lib"
    '';
  }
