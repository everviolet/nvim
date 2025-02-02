{
  description = "evergarden theme";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
    }:
    let
      forAllSystems =
        function:
        nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed (
          system: function nixpkgs.legacyPackages.${system}
        );
    in
    {
      lib = import ./nix/lib { inherit (nixpkgs) lib; };

      devShells = forAllSystems (pkgs: {
        default = pkgs.callPackage ./nix/shell.nix { evgLib = self.lib.evergarden; };
      });
    };
}
