{
  evgLib ? (import ./nix/lib/default.nix { inherit lib; }).evergarden,

  lib,
  mkShellNoCC,

  writeShellApplication,
  writeTextFile,

  catppuccin-catwalk,
  catppuccin-whiskers,
  fd,
  libwebp,
  ...
}:
let
  inherit (lib) mapAttrsToList;

  whiskers-palette = writeTextFile {
    name = "evergarden-whiskers";
    text = builtins.toJSON {
      all = evgLib.toCatppuccinPalette evgLib.palette;
    };
  };

  generate = writeShellApplication {
    name = "generate";
    runtimeInputs = [
      catppuccin-whiskers
    ];
    text = builtins.concatStringsSep "\n" (
      mapAttrsToList
        (n: v: ''
          whiskers --flavor mocha --color-overrides ${whiskers-palette} --overrides '{ "accent": { "hex": "${v}", "name": "${n}" } }' "$@"
        '')
        {
          inherit (evgLib.palette)
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

  convert-screenshots = writeShellApplication {
    name = "convert-screenshots";
    runtimeInputs = [
      fd
      libwebp
    ];
    text = ''
      for item in $(fd --exact-depth 2 -t file ".png" images/); do
        filename="''${item%.png}.webp"
        cwebp -q 100 "$item" -o "$filename"
      done
    '';
  };

  generate-screenshots = writeShellApplication {
    name = "generate-screenshots";
    runtimeInputs = [
      catppuccin-catwalk
      fd
    ];
    text = ''
      for item in $(fd --exact-depth 1 -t directory '''''' images/); do
        name="''${item##*/}"
        out="''${item}preview.webp"
        if [[ ! -f "$out" ]]; then
          >&2 echo "creating preview for $name -> $out"
          catwalk -C "$item" hard.webp medium.webp medium.webp soft.webp --output preview.webp
        fi
      done
    '';
  };
in
mkShellNoCC {
  packages = [
    catppuccin-catwalk
    catppuccin-whiskers

    generate
    generate-new
    generate-all
    generate-screenshots
    convert-screenshots

    libwebp
  ];
}
