{
  pkgs ? import <nixpkgs> {}
, stdenv ? pkgs.stdenv
, fetchsvn ? pkgs.fetchsvn
}:

stdenv.mkDerivation rec {
  pname = "64tass";
  version = "r3246";

  nativeBuildInputs = with pkgs; [
    gcc
    gnumake
  ];

  sourceRoot = "${src.name}/trunk";

  src = fetchsvn {
    url = "https://svn.code.sf.net/p/tass64/code/trunk";
    rev = "3246";
    hash = "sha256-2ZGuUMrIIvx+o+SKoKyQsNetAfmz8gLHf10olRL/GM8=";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp 64tass $out/bin/
  '';
}
