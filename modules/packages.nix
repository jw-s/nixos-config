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
    containerlab # run via `sudo containerlab`/`sudo clab`, needs netns/veth privileges
  ];
}
