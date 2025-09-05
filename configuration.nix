{
  config,
  pkgs,
  caelestia-shell,
  ...
}: {
  imports = [
    # ./hardware-configuration.nix
  ];

  boot.loader.grub.enable = true;

  networking.hostName = "caelestia-nixos";
  networking.networkmanager.enable = true;

  users.users.caelestia = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    initialPassword = "segsy";
  };

  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    htop
    neovim
  ];

  programs.hyprland.enable = true;
  home-manager.users.caelestia = {
    imports = [caelestia-shell.homeManagerModules.default];

    wayland.systemd.target = "hyprland-session.target";
    wayland.windowManager.hyprland = {
      enable = true;
    };
    programs.caelestia = {
      enable = true;
    };
    home.stateVersion = "25.11";
  };

  virtualisation.vmVariant = {
    nixpkgs.hostPlatform = pkgs.system;
    virtualisation = {
      memorySize = 2048;
      cores = 2;

      qemu.options = [
        "-device virtio-vga-gl"
        "-display sdl,gl=on,show-cursor=off"
      ];
    };
  };

  system.stateVersion = "25.11";
}
