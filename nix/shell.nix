{
  mkShellNoCC,

  writeShellApplication,

  catppuccin-catwalk,
  catppuccin-whiskers,
  fd,
  libwebp,
  ...
}:
let
  convert-screenshots = writeShellApplication {
    name = "convert-screenshots";
    runtimeInputs = [
      fd
      libwebp
    ];
    text = ''
      for item in $(fd -t file ".png" assets/previews/); do
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
      >&2 echo "creating preview"
      catwalk -C "assets/previews/" winter.webp fall.webp fall.webp spring.webp --output preview.webp
    '';
  };
in
mkShellNoCC {
  packages = [
    catppuccin-catwalk
    catppuccin-whiskers

    generate-screenshots
    convert-screenshots

    libwebp
  ];
}
