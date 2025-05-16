{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }: flake-utils.lib.eachDefaultSystem(system:
    let
      overlay = import ./overlay;
      pkgs = import nixpkgs {
        inherit system;
	overlays = [ overlay ];
      };
    in
    {
      overlays.default = overlay;

      devShell = pkgs.mkShell {
        buildInputs = with pkgs; [
	  coreutils-full
	  kickassembler
	  libxkbcommon
	  vice
	  xorg.xcbutil
	  zenity
          c64-debugger
          dasm
          figlet
          gnumake
	  tass64
        ];
        shellHook=''
          figlet -c C=64 ASM!
        '';
        };
    });
}
