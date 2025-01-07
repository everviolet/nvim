{
  inputs,
  lib,
  stdenv,
  mkShellNoCC,
  writeShellApplication,
  writeTextFile,
  ...
}:
let
  inherit (lib) mapAttrsToList;

  whiskers-palette = writeTextFile {
    name = "evergarden-whiskers";
    text = builtins.toJSON {
      all = inputs.self.toCatppuccinPalette inputs.self.palette;
    };
  };

  generate = writeShellApplication {
    name = "generate";
    runtimeInputs = [
      inputs.whiskers.packages.${stdenv.hostPlatform.system}.default
    ];
    text = builtins.concatStringsSep "\n" (
      mapAttrsToList
        (n: v: ''
          whiskers --flavor mocha --color-overrides ${whiskers-palette} --overrides '{ "accent": { "hex": "${v}", "name": "${n}" } }' "$@"
        '')
        {
          inherit (inputs.self.palette)
            red
            orange
            yellow
            green
            aqua
            skye
            blue
            purple
            pink
            ;
        }
    );
  };

  generate-all = writeShellApplication {
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

  generate-new = writeShellApplication {
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
mkShellNoCC {
  packages = [
    inputs.whiskers.packages.${stdenv.hostPlatform.system}.default

    generate
    generate-new
    generate-all
  ];
}
