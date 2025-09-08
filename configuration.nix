{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # ./hardware-configuration.nix
    inputs.hyprland.nixosModules.default
    inputs.home-manager.nixosModules.default
    ./home.nix
  ];

  nixpkgs = {
    overlays = [
      inputs.hyprland.overlays.default
    ];
  };

  boot.loader.grub.enable = true;

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
    };
  };

  networking.hostName = "caelestia-nixos";
  networking.networkmanager.enable = true;

  users.users = {
    root.initialPassword = "notsegsy"; # you must change the root password with `passwd`
    caelestia = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      initialPassword = "segsy"; # you must change your user password with `passwd`
    };
  };

  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    htop
    neovim
  ];

  programs.hyprland.enable = true;

  system.stateVersion = "25.11"; # do not change this

  # if not willing to test in a VM, you can safely delete this configs below
  virtualisation.vmVariant = {
    virtualisation = {
      memorySize = 4096;
      cores = 4;

      qemu.options = [
        "-device virtio-vga-gl"
        "-display gtk,gl=on,show-cursor=off,grab-on-hover=on"
        "-cpu host"
        "-usb -device usb-tablet"
      ];
    };
  };
}
