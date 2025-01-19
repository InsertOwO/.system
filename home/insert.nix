{config, pkgs, ...}:

{
  home = {
    username = "insert";
    homeDirectory = "/home/insert";
    stateVersion = "24.11";
  };

  programs = {
    home-manager.enable = true;
  };

  imports = [./shared.nix];
}
