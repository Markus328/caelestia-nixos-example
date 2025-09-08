# Caelestia NixOS Example

Welcome to the **Caelestia NixOS Example** repository. This guide will help you quickly set up and experiment with a NixOS configuration tailored for the Caelestia environment.

> [!NOTE]
> This **is not** a dotfiles repo. If you want a rice you need to make it yourself, using the home-manager with Caelestia HM module.

# Quick Start

You can quickly try out this configuration in a virtual machine (VM) using Nix. Simply run the following command:

```bash
nix run github:Markus328/caelestia-nixos-example
```

If you are using NixOS, you can also use the `nixos-rebuild` command:

```bash
nixos-rebuild build-vm --flake github:Markus328/caelestia-nixos-example
result/bin/run-caelestia-nixos-vm
```

---

# Installation

To install this configuration, you need to copy the files from this repository to a fresh NixOS installation. Follow these steps as the root user:

1. Clone the repository into the `/etc/nixos` directory:

   ```bash
   git clone https://github.com/Markus328/caelestia-nixos-example.git /etc/nixos
   ```

2. Build and switch to the new configuration:

   ```bash
   nixos-rebuild switch --flake
   ```

3. Log in as root using the default password "notsegsy" and set up new passwords:

   ```bash
   su root
   passwd # choose a new password for root
   passwd caelestia # choose a new password for the caelestia user
   ```

You have now successfully installed the Caelestia NixOS configuration!

---

# Installation from Scratch

If you do not have a NixOS installation yet, follow the [NixOS Installation Guide](https://nixos.wiki/wiki/NixOS_Installation_Guide) until you reach the "Create NixOS config" step. Before running `sudo nixos-install`, run:

```bash
   git clone https://github.com/Markus328/caelestia-nixos-example.git /mnt/etc/nixos
```

Reboot the system, now follow the step 3 from previous section.

---

# Usage

- user: caelestia
- default password: segsy

Once the installation is complete, you can start using the Caelestia environment. After logging in `caelestia` user, you will start into Hyprland with Caelestia Shell.

## Binds

- SUPER + Q => Open Terminal
- SUPER + M => Logout

# Configuration Details

This repository contains a sample NixOS configuration for the Caelestia environment. The key configuration files are located in the `/etc/nixos` directory. You can customize these files to suit your needs.

## Key Files

- `configuration.nix`: Main configuration file for NixOS.
- `home.nix`: Configuration file for home-manager, and also Caelestia Shell.

Open these files and modify as you want, including changing the user's name, add new programs, configure Caelestia Shell or Hyprland.

---

# Contributing

Contributions are welcome! If you have suggestions for improvements, please open an issue or submit a pull request.
