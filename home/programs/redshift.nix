{ config, lib, pkgs, ... }:

{
  services.redshift = {
    enable = true;
    tray = true;
    latitude = "42.69";
    longitude = "23.32";
  };
}
