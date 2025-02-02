{ pkgs
, ...
}: {
  programs.bash = {
    enable = true;
    shellAliases = {
      nix-wh = "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system";
      nix-rs = "sudo nixos-rebuild switch";
    };
  };
}
