{ config, pkgs, ... }:

{
  hardware = {
    pulseaudio.enable = true;
  };

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
    };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    mtr.enable = true;
    tmux.enable = true;
  };

  services = {
    printing.enable = true;
    xserver = {
      enable = true;
      layout = "gb";
      xkbOptions = "eurosign:e";

      libinput.enable = true;

      windowManager.i3.enable = true;
      desktopManager = {
        default = "xfce";
	xterm.enable = false;
	xfce = {
	  enable = true;
	  noDesktop = true;
	  enableXfwm = false;
	};
      };
    };
    redshift = {
      enable = true;
      provider = "geoclue2";
    };
  };
}
