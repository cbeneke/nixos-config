# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./users.nix
    ./services.nix
  ];

  boot = {
    loader.grub = {
      enable = true;
      version = 2;
      device = "/dev/sda";
    };

    initrd.luks.devices = [
      {
        name = "ssd";
        device = "/dev/disk/by-uuid/34036e6f-2676-4756-af43-37c6af4a1180";
        preLVM = true;
        allowDiscards = true;
      }
    ];
  };

  environment = {
    systemPackages = with pkgs; [
      acpi coreutils curl gnupg networkmanager neovim rsync rxvt_unicode unrar
      unzip wget which zip
    ];
    variables.EDITOR = "neovim"; 
  };

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "uk";
    defaultLocale = "en_US.UTF-8";
  };

  networking = { 
    hostName = "watercake";
    wireless.enable = true;
    firewall.enable = false;
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [(self: super: {
      neovim = super.neovim.override {
        withPython = true;
        withPython3 = true;
        vimAlias = true;
      };
    })];
  };

  sound.enable = true;

  time.timeZone = "Europe/Berlin";



  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.03"; # Did you read the comment?
}
