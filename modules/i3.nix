{ pkgs, ... }: {
  environment.pathsToLink = [ "/libexec" ];

  services = {
    xserver = {
      enable = true;

      desktopManager = {
        xterm.enable = false;
      };

      # TODO: One day do the config declaratively
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          dunst
          i3lock
          dmenu
          # xautolock
          # picom
          feh
          xorg.xbacklight
          xorg.xdpyinfo
        ];
      };

      xkb = { layout = "us"; variant = ""; };
    };

    displayManager.defaultSession = "none+i3";

    gvfs.enable = true;
    udisks2.enable = true;
    tumbler.enable = true;
  };

  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];
}
