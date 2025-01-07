{
  self,
  pkgs,
  whiskers,
  ...
}:
let
  inherit (pkgs.lib) mapAttrsToList;
  whiskers-palette = pkgs.writeTextFile {
    name = "evergarden-whiskers";
    text = builtins.toJSON {
      all = self.toCatppuccinPalette self.palette;
    };
  };
  generate = pkgs.writeShellApplication {
    name = "generate";
    runtimeInputs = [
      whiskers.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
    text = builtins.concatStringsSep "\n" (
      mapAttrsToList
        (n: v: ''
          whiskers --flavor mocha --color-overrides ${whiskers-palette} --overrides '{ "accent": { "hex": "${v}", "name": "${n}" } }' "$@"
        '')
        {
          inherit (self.palette)
            red
            orange
            yellow
            green
            aqua
            sky
            blue
            purple
            pink
            ;
        }
    );
  };
  generate-all = pkgs.writeShellApplication {
    name = "generate-all";
    runtimeInputs = [
      generate
    ];
    text = ''
      for item in templates/*.tera; do
        >&2 echo "generating $item"
        generate "$item"
      done
    '';
  };
  generate-new = pkgs.writeShellApplication {
    name = "generate-new";
    runtimeInputs = [
      generate
    ];
    text = ''
      for item in templates/*.tera; do
        filename="''${item##*/}"
        name="''${filename%.tera}"
        if [[ ! -d "extras/''${name}" ]]; then
          >&2 echo "generating $item"
          generate "$item"
        else
          >&2 echo "skipping $item"
        fi
      done
    '';
  };
in
pkgs.mkShellNoCC {
  packages = [
    pkgs.fd
    pkgs.fzf
    whiskers.packages.${pkgs.stdenv.hostPlatform.system}.default
    generate
    generate-new
    generate-all
  ];
}
