{ config, lib, pkgs, ...}:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
  ];

}
