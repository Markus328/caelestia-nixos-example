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
  outputs = {
    self,
    nixpkgs,
    home-manager,
    hyprland,
    caelestia-shell,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [
        hyprland.overlays.default
      ];
    };
  in {
    nixosConfigurations.caelestia-nixos = nixpkgs.lib.nixosSystem {
      modules = [./configuration.nix home-manager.nixosModules.home-manager];
      specialArgs = {
        inherit pkgs caelestia-shell;
      };
    };
    nixosConfigurations.caelestia-nixos-vm = nixpkgs.lib.nixosSystem {
      modules = [./configuration.nix home-manager.nixosModules.home-manager ./vm.nix];
      specialArgs = {
        inherit pkgs caelestia-shell;
      };
    };
  };
}
