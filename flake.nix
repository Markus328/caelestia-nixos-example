{
  description = "A NixOS with Hyprland + Caelestia Shell setup.";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    caelestia-shell = {
      url = "github:caelestia-dots/shell";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    hyprland,
    caelestia-shell,
    ...
  }: let
    system = "x86_64-linux";
  in {
    nixosConfigurations.caelestia-nixos = nixpkgs.lib.nixosSystem {
      modules = [./configuration.nix];
      inherit system;
      specialArgs = {
        inherit inputs;
      };
    };
  };
}
