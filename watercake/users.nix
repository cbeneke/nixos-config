{ config, pkgs, ... }:

{
  users.users.cbeneke = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
}
