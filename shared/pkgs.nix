{pkgs, ...}:

{
  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    udisks2 = {
      enable = true;
      mountOnMedia = true;
    };

    blueman.enable = true;

    gvfs.enable = true;

    printing.enable = true;
  };

  environment.systemPackages = with pkgs; [
    nemo
    unrar
    unzip
    bitwarden-desktop
  ];

  fonts.packages = with pkgs; [
    font-awesome
    source-code-pro
  ];
}
