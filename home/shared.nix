{config, pkgs, ...}:

let
  mod = "Mod4";
in
{

  home.packages = with pkgs; [
    rofi-wayland
    swaybg
    swaylock
    swayidle
    brightnessctl
    wlogout
    grim
    slurp
    swappy
    jq
    pwvucontrol
  ];

  programs = {
    waybar.enable = true;

    firefox.enable = true;

    foot = {
      enable = true;
      settings = {
        main = {
          font = "SourceCodePro:size=10";
        };

	colors= {
	 alpha = 0.95;
	};
      };
    };
  };
}
