{ config, pkgs, ... }:

{
  imports = [ ./programs ./i3 ];

  home =
    {
      username = "boss";
      homeDirectory = "/home/boss";
      stateVersion = "24.05";
    };

  programs.home-manager.enable = true;
}
