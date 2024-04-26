{
  description = "A NickOS flake";

  inputs = {
    # Nix 
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    # Some serivces/programs defined here exist on NUR only.
    nur.url = "github:nix-community/NUR"; 
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # GPU Driver
    mesa-git = {
      url = "git+https://gitlab.freedesktop.org/mesa/mesa?ref=main";
      flake = false;
    };

    # Hyprland
    hyprland = {
      url = "github:hyprwm/hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprwm-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hyprland-portal.url = "github:hyprwm/xdg-desktop-portal-hyprland";
    hyprlock.url = "github:hyprwm/Hyprlock";

    # Misc
    nix-colors.url = "github:misterio77/nix-colors";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    catppuccin.url = "github:catppuccin/nix";
  };
  outputs = inputs@{ self, nixpkgs, nix-colors, catppuccin, home-manager, ... }:
    let
      inherit (self) outputs;
    in
    {

    # System configurations and modules
    nixosModules = import ./nixos/modules;

    # Home-manager configurations and modules
    homeModules = import ./home/modules;

    nixosConfigurations = {
      artorias = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs nix-colors; };
        modules = [
          inputs.hyprland.nixosModules.default
          ./nixos/configurations/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      "nick@artorias" = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs nix-colors catppuccin; };
        modules = [
          ./home/configurations/configuration.nix
          {
            home = {
              packages = [
                inputs.home-manager.packages.x86_64-linux.home-manager
              ];
            };
          }
        ];
      };
    };
  }; 
}