{ pkgs, vscode-extensions, ... }:
{
  home.pointerCursor = {
    x11.enable = true;
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    # size = 38;
  };
}
