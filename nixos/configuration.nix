# Only very core options are set here.

{inputs, config, pkgs, ...}:

{
  # Configure the bootloader and Linux kernel version.
  boot = {
    loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    };

    plymouth.enable = true;
    kernelPackages = pkgs.linuxKernel.packages.linux_6_12;
  };

  # Enable networking.
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };
  hardware.opengl.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Brussels";

  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;

  # Define a user accounts. Set the password with ‘passwd’.
  users.users = {
    insert = {
      isNormalUser = true;
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    };

    school.isNormalUser = true;
  };
  # Temporary quick fix, il do it properly later.
  programs.sway.enable = true;
  environment.systemPackages = with pkgs; [git];
  # Set homemanager for users.
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      insert = import ../home/insert.nix;
      school = import ../home/school.nix;
    };
  };

  # Enable flakes.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Import results of the hardware scan.
  imports = [./hardware-configuration.nix inputs.home-manager.nixosModules.home-manager];

  # You are too stupid to know what this number means so just dont change it. Okay?
  system.stateVersion = "24.11";
}
