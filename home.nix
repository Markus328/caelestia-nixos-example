{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  home-manager.users.caelestia = {
    imports = [inputs.caelestia-shell.homeManagerModules.default];

    programs.bash = {
      enable = true;
      profileExtra = ''
        if [ "$(tty)" == "/dev/tty1" ]; then
          exec Hyprland
        fi
      '';
    };

    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        # configure your hyprland here
        # see https://wiki.hypr.land/Nix/Hyprland-on-Home-Manager/
      };
      # extraConfig = ./hyprland.conf
    };
    wayland.systemd.target = "hyprland-session.target"; # to start the caelestia only after hyprland automatically

    programs.caelestia = {
      enable = true;

      settings = {
        # just an example, see the avaiable options in the repo's README
        bar.status = {
          showBattery = false;
        };
        paths.wallpaperDir = "~/Images";
      };

      cli = {
        enable = true;
        settings = {
          # see avaiable options in caelestia-dots/cli
          theme.enableGtk = false;
        };
      };
    };

    # your home.packages, you don't need to specify caelestia here
    home.packages = with pkgs; [
      kitty
      # firefox
    ];

    home.stateVersion = "25.11"; # do not change this
  };
}
