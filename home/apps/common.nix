{ pkgs, ... }:

{
  home.packages = with pkgs; [
    anki-bin
    keepassxc
    mullvad-browser
    tor-browser
    telegram-desktop
    workrave
    # upwork
    nixfmt
  ];
}