{
  description = "A NixOS with Hyprland + Caelestia Shell setup.";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
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
    caelestia-shell,
    ...
  }: let
    system = "x86_64-linux";
  in rec {
    packages.${system}.default = nixosConfigurations.caelestia-nixos.config.system.build.vm;
    nixosConfigurations.caelestia-nixos = nixpkgs.lib.nixosSystem {
      modules = [./configuration.nix];
      inherit system;
      specialArgs = {
        inherit inputs;
      };
    };
  };
}
