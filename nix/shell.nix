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
      >&2 echo "creating preview"
      catwalk -C "images/" winter.webp fall.webp fall.webp spring.webp --output preview.webp
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
