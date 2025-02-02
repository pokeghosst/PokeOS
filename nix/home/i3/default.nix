{ pkgs
, config
, ...
}: {
  home.file.".config/i3/config".source = ./config;
  home.file.".config/i3/wallpaper.jpg".source = ../../wallpaper.jpg;
  home.file.".config/i3/polybar.sh" = {
    source = ./polybar.sh;
    executable = true;
  };
}
