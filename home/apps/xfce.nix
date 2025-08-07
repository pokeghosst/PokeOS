{ pkgs, ... }:

{
  home.packages = with pkgs; [
    xfce.xfce4-panel
    xfce.xfce4-whiskermenu-plugin
  ];
}
