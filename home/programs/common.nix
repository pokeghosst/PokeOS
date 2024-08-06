{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ungoogled-chromium
    anki-bin
    workrave
    redshift
    obsidian
    keepassxc
    xfce.xfce4-screenshooter
    font-manager
    telegram-desktop

    # gtk
    gruvbox-dark-gtk
    gruvbox-plus-icons
    capitaine-cursors-themed
    lxappearance

    # misc
    xdg-utils

    # nix-specific
    nixpkgs-fmt
  ];
  gtk.cursorTheme.name = "Capitaine Cursors (Gruvbox)";
}
