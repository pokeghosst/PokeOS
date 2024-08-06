{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    rubik
    jetbrains-mono
    cascadia-code
    (nerdfonts.override { fonts = [ "CascadiaCode" "FiraCode" "JetBrainsMono" ]; })
    fira-code
    font-awesome_5
    d2coding
  ];
}
