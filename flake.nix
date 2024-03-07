{
  description = "A NickOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    # Some serivces/programs defined here exist on NUR only.
    nur.url = "github:nix-community/NUR"; 
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mesa-git = {
      url = "git+https://gitlab.freedesktop.org/mesa/mesa?ref=main";
      flake = false;
    };
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
  };
  outputs = inputs: {

    # System configurations and modules
    nixosModules = import ./nixos/modules inputs;

    # Home-manager configurations and modules
    homeModules = import ./home/modules inputs;

    nixosConfigurations = {
      artorias = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          inputs.hyprland.nixosModules.default
          ./nixos/configurations/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      "nick@artorias" = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
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