let
  pkgs = import <nixpkgs> {};
in
{
  stdenv ? pkgs.stdenv
, fetchurl ? pkgs.fetchurl
, makeWrapper ? pkgs.makeWrapper
, unzip ? pkgs.unzip
, jre ? pkgs.jre
}:

stdenv.mkDerivation rec {
  pname = "kickassembler";
  version = "5.25";

  src = fetchurl {
    url = "https://www.theweb.dk/KickAssembler/KickAssembler.zip";
    sha256 = "sha256-nvdSwSsl9ktVuv7Pq/I9/JCoIWsaKTVIshR+18FfVaY=";
  };

  sourceRoot = ".";

  preUnpack = ''
    mkdir -p ${sourceRoot}
  '';

  nativeBuildInputs = [ makeWrapper unzip ];

  installPhase = ''
    mkdir -p $out/share/java $out/bin
    cp ${sourceRoot}/KickAss.jar $out/share/java/KickAss.jar
    makeWrapper ${jre}/bin/java $out/bin/kickass \
      --add-flags "-jar $out/share/java/KickAss.jar" \
      --set _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=on' \
      --set _JAVA_AWT_WM_NONREPARENTING 1
  '';

  meta = {
    homepage = "https://www.theweb.dk/KickAssembler/";
    description = "Kick Assembler is the combination of an assembler for doing 6510 machine code and a high level script language.";
  };
}
