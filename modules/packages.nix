{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    obsidian
    vscode
    claude-code
    lshw
    dmidecode
    alacritty
    piper
    libreoffice
    librepods
    jq
    gnumake
    plan9port-wayland
  ];
}
