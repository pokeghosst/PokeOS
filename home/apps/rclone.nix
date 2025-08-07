{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ rclone ];
  # TODO: Declarative config
  # xdg.configFile."rclone/rclone.conf".text = ''
  #   [backblaze]
  #   type = s3
  # ''
}