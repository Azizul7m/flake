{ var, ... }: {
  programs = {
    fish = {
      enable = true;
      plugins = [
        # Enable a plugin (here grc for colorized command output) from nixpkgs
        {
          name = "grc";
          src = var.pkgs.fishPlugins.grc.src;
        }
      ];
      interactiveShellInit = ''
        set fish_greeting # Disable greeting

        set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
        set DOOMDIR /home/${var.user}/.doom.d

        set RUST_BACKTRACE 1

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
        alias doomsync='~/.config/emacs/bin/doom sync'
        alias doomdoctor='~/.config/emacs/bin/doom doctor'
        alias doomupgrade='~/.config/emacs/bin/doom upgrade'
        alias doompurge='~/.config/emacs/bin/doom purge'


        alias v='nvim'


        alias tas='tmux attach-session -c '
        alias tns='tmux new-session -s '

        alias df='df -h'
        alias free='free -m'

        # get error messages from journalctl
        alias jctl="journalctl -p 3 -xb"


        alias addup='git add -u'
        alias addall='git add .'
        alias branch='git branch'
        alias checkout='git checkout'
        alias clone='git clone'
        alias commit='git commit -m'
        alias pull='git pull origin'
        alias gpush='git push origin'
        alias gstatus='git status'
        alias glog='git log'

        alias wstop='waydroid session stop || sudo waydroid container stop'
        alias wui='waydroid show-full-ui'
        alias ranger='joshuto'

        # Play audio files in current dir by type
        alias playwav='vlc *.wav'
        alias playogg='vlc *.ogg'
        alias playmp3='vlc *.mp3'

        # Play video files in current dir by type
        alias playavi='vlc *.avi'
        alias playmov='vlc *.mov'
        alias playmp4='vlc *.mp4'


        alias tb='nc termbin.com 9999'
        alias recordterm='asciinema rec'

        # Distrobox
        alias fedora='distrobox enter fedora'
        alias ubuntu='distrobox enter ubuntu'
        alias kali='distrobox enter blackarch'
        alias arch='distrobox enter arch'


        alias pdf='sioyek'
        alias txt='alacritty -c nvim'
        # alias hotspot='nmcli dev wifi hotspot'
        # alias wpassword='nmcli dev wifi show-password'

        alias nixosrebuild='sudo nixos-rebuild switch --flake ~/flake#nixos'
        alias cleanup='sudo nix-collect-garbage -d'

      '';
      # Add npm path to PATH
      shellInit = ''
        set -gx PATH /home/${var.user}/.npm_global/bin  /home/${var.user}/.emacs.d/bin /home/${var.user}/.config/hypr/scripts /home/${var.user}/.local/share/solana/install/active_release/bin /home/${var.user}/.cargo/bin /home/${var.user}/.local/bin $PATH

        # pnpm
          set -gx PNPM_HOME "/home/anower/.local/share/pnpm"
          set -gx PATH "$PNPM_HOME" $PATH
        # pnpm end
        starship init fish | source

      '';
    };
  };
}
