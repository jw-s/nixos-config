{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      inter
      roboto
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      dejavu_fonts
      nerd-fonts.fira-code
    ];

    fontconfig = {
      enable = true;
      antialias = true;

      hinting = {
        enable = true;
        style = "full"; # try "medium" if you want sharper text
      };

      subpixel = {
        rgba = "rgb";
        lcdfilter = "default";
      };

      defaultFonts = {
        sansSerif = [ "Inter" "Roboto" ];
        serif = [ "DejaVu Serif" ];
        monospace = [ "DejaVu Sans Mono" ];
      };
    };
  };

  services.xserver.displayManager.gdm.enable = true;

  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
  };

  services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
    [org/gnome/desktop/interface]
    font-antialiasing='rgba'
    font-hinting='full'
    text-scaling-factor=1.15
  '';

  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  programs.firefox.enable = false;
}
