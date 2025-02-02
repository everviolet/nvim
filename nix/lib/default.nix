{ lib }:
lib.fixedPoints.makeExtensible (self: {
  evergarden = {
    palette = import ./palette.nix;
    base16 = import ./base16.nix { inherit (self.evergarden) palette; };
    toCatppuccinPalette = import ./toctp.nix;
  };
})
