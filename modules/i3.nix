{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };
    
    windowManager.i3.enable = true;
    windowManager.i3.configFile = ../home/config/i3/config;
  };

  services.picom.enable = true;
  services.displayManager.defaultSession = "xfce+i3";
}
