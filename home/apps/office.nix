{ pkgs, ... }:

{
  home.packages = with pkgs; [
    claws-mail
    libreoffice
    zotero
  ]; 
}