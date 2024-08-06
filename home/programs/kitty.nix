{ pkgs
, ...
}: {
  programs.kitty = {
    enable = true;
    font.name = "Cascadia Code";
    theme = "Gruvbox Material Dark Medium";
  };
}
