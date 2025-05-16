final: prev: {
  kickassembler = prev.callPackage ./kickass.nix {};
  tass64 = prev.callPackage ./64tass.nix {};
}
