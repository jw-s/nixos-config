{ pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
  environment.localBinInPath = true;

  environment.systemPackages = with pkgs; [
    zsh-powerlevel10k
    meslo-lgs-nf # patched font recommended for powerlevel10k
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    promptInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      if [[ -r "''${XDG_CACHE_HOME:-''$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-''$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
      if command -v fzf-share >/dev/null; then
        source "$(fzf-share)/key-bindings.zsh"
        source "$(fzf-share)/completion.zsh"
      fi
    '';
    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };

  programs.tmux = {
    enable = true;
    plugins = with pkgs; [
      tmuxPlugins.resurrect # S-key for save, R-key for restore
      tmuxPlugins.continuum # Auto-save
    ];
    extraConfig = ''
      set -g @continuum-restore 'on' # Enable auto-restore
      set -g @continuum-save-interval '10' # Save every 10 minutes
    '';
  };

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
