{ config, pkgs, ... }:
{
  home = {
    username = "school";
    homeDirectory = "/home/school";
    stateVersion = "24.11";
  };

  programs = {
    home-manager.enable = true;
  };

  imports = [ ./shared.nix ];
}
