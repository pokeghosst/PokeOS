{ pkgs, lib, ... }: {
  imports =
    [
      ./hardware-configuration.nix
      ./i3.nix
    ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  sound.enable = false;

  hardware = {
    bluetooth.enable = true;
    # pulseaudio.enable = true;
    bluetooth.powerOnBoot = true;
    acpilight.enable = true;
  };

  networking.hostName = "nixos";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  time.timeZone = "Europe/Sofia";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  users.users.boss = {
    isNormalUser = true;
    description = "boss";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [ xfce.thunar pavucontrol acpilight sof-firmware pw-volume ];

  programs = {
    dconf.enable = true;
    xfconf.enable = true;
  };

  services.power-profiles-daemon = {
    enable = true;
  };

  security.rtkit.enable = true;
  security.polkit.enable = true;

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      # alsa.support32Bit = true;
      pulse.enable = true;
    };
    libinput.touchpad.naturalScrolling = true;
    blueman.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  nix = {
    # do garbage collection weekly to keep disk usage low
    gc = {
      automatic = lib.mkDefault true;
      dates = lib.mkDefault "weekly";
      options = lib.mkDefault "--delete-older-than 3d";
    };
    optimise.automatic = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
