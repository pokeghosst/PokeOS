{
  inputs = {
    # Use `nix flake update` to update the flake to the latest revision of the chosen release channel.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
    outputs = inputs@{
      nixpkgs,
      home-manager,
      nix-vscode-extensions,
      ...
      }: {
        nixosConfigurations = {
          nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            ./configuration.nix
            ./modules

            { nixpkgs.overlays = [ nix-vscode-extensions.overlays.default ]; }

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.boss = import ./home;

              home-manager.extraSpecialArgs = {
                inherit inputs;
                vscode-extensions = inputs.nix-vscode-extensions.extensions.x86_64-linux;
              };
            }	
          ];
        };
    };
  };
}

