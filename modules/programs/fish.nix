{ var, ... }: {
  programs = {
    fish = {
      enable = true;
      plugins = [{
        name = "grc";
        src = var.pkgs.fishPlugins.grc.src;
      }];
      interactiveShellInit = ''
        set fish_greeting # Disable greeting

        set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

        # navigation
        alias ..='cd ..'
        alias ...='cd ../..'
        alias .3='cd ../../..'
        alias .4='cd ../../../..'
        alias .5='cd ../../../../..'

        alias ls='exa --icons'
        alias la='exa -a --icons'
        alias ll='exa -la --icons'
        alias cls='clear'


        alias em='emacs -nw'
        alias emds='emacs --daemon'
        alias emd='emacsclient -tty'

        alias vim='nvim'
        alias c='codium'
        alias code='codium'
        alias file='superfile'


        alias tas='zellij attach -c'
        alias tmux='zellij'

        alias df='df -h'
        alias free='free -m'
        alias rmi='rm -rf'

        # get error messages from journalctl
        alias jctl="journalctl -p 3 -xb"


        alias gap='git add -u'
        alias gaa='git add .'
        alias gco='git checkout'
        alias gc='git clone'
        alias gp='git pull origin'
        alias gm='git commit -m'
        alias gb='git branch'
        alias gs='git status'
        alias gl='git log'
        alias gf='git diff'

        alias ranger='joshuto'

        # Play audio files in current dir by type
        alias playwav='vlc *.wav'
        alias playogg='vlc *.ogg'
        alias playmp3='vlc *.mp3'

        # Youtube-Dl
        alias ytv='yt-dlp -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4] / bv*+ba/b"'
        alias yta='yt-dlp -x --audio-format mp3'

        # Play video files in current dir by type
        alias playavi='vlc *.avi'
        alias playmov='vlc *.mov'
        alias playmp4='vlc *.mp4'


        alias tb='nc termbin.com 9999'
        alias recordterm='asciinema rec'

        # Distrobox
        alias dev='ssh anower@10.155.119.10'


        alias pdf='sioyek'
        alias v='alacritty -e nvim'

        alias hotspot='nmcli dev wifi hotspot'
        alias wpassword='nmcli dev wifi show-password'

        alias nix_rebuild='sudo nixos-rebuild switch --flake ~/flake#nixos'
        alias hm_rebuild='home-manager switch --flake ~/flake#nixos'
        alias nix_cleanup='sudo nix-collect-garbage -d'
        alias nix_oldgen='sudo nix-env -p /nix/var/nix/profiles/system --delete-generations old'

      '';
      # Add npm path to PATH
      shellInit = ''
        set -gx PATH $HOME/.npm_global/bin $HOME/.deno/bin $HOME/.bun/bin $HOME/.avm/bin $HOME/.emacs.d/bin $HOME/.config/hypr/scripts $HOME/.local/share/solana/install/active_release/bin $HOME/.cargo/bin $HOME/.local/bin $PATH

                 zoxide init --cmd cd fish | source
                 starship init fish | source
      '';
    };
  };
}
