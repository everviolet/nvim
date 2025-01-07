{
  description = "evergarden theme";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    whiskers.url = "github:catppuccin/whiskers";
  };

  outputs =
    {
      self,
      nixpkgs,
      whiskers,
    }@inputs:
    let
      forAllSystems =
        function:
        nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed (
          system: function nixpkgs.legacyPackages.${system}
        );

      palette = {
        red = "E67E80";
        orange = "E69875";
        yellow = "DBBC7F";
        green = "B2C98F";
        aqua = "93C9A1";
        sky = "97C9C3";
        blue = "9BB5CF";
        purple = "D6A0D1";
        pink = "E3A8D1";
        text = "DDDECF";
        subtext1 = "CACCBE";
        subtext0 = "94AAA0";
        overlay2 = "839E9A";
        overlay1 = "738A8B";
        overlay0 = "617377";
        surface2 = "4F5E62";
        surface1 = "3D494D";
        surface0 = "313B40";
        base = "232A2E";
        mantle = "1C2225";
        crust = "171C1F";
        softbase = "2B3538";
      };
    in
    {
      inherit palette;
      base16 = {
        base00 = palette.base;
        base01 = palette.red;
        base02 = palette.green;
        base03 = palette.yellow;
        base04 = palette.blue;
        base05 = palette.pink;
        base06 = palette.aqua;
        base07 = palette.text;
        base08 = palette.surface0;
        base09 = palette.red;
        base0A = palette.green;
        base0B = palette.yellow;
        base0C = palette.blue;
        base0D = palette.pink;
        base0E = palette.aqua;
        base0F = palette.subtext0;
      };
      toCatppuccinPalette = palette: {
        inherit (palette)
          pink
          red
          yellow
          green
          sky
          blue
          text
          subtext1
          subtext0
          overlay2
          overlay1
          overlay0
          surface2
          surface1
          surface0
          base
          mantle
          crust
          ;
        rosewater = palette.pink;
        flamingo = palette.pink;
        mauve = palette.purple;
        maroon = palette.red;
        peach = palette.orange;
        teal = palette.aqua;
        sapphire = palette.blue;
        lavender = palette.purple;
      };

      devShells = forAllSystems (pkgs: {
        default = pkgs.callPackage ./shell.nix inputs;
      });
    };
}
