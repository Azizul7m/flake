{ global, ... }: {
  programs = {
    fish = {
      enable = true;
      plugins = [
        # Enable a plugin (here grc for colorized command output) from nixpkgs
        {
          name = "grc";
          src = global.pkgs.fishPlugins.grc.src;
        }
      ];
      interactiveShellInit = ''
        set fish_greeting # Disable greeting

        set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
        set DOOMDIR /home/${global.user}/.doom.d 

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
        alias cls= 'clear'


        alias em='emacs -nw'
        alias emds='emacs --daemon'
        alias emd='emacsclient -tty'
        alias doomsync='~/.config/emacs/bin/doom sync'
        alias doomdoctor='~/.config/emacs/bin/doom doctor'
        alias doomupgrade='~/.config/emacs/bin/doom upgrade'
        alias doompurge='~/.config/emacs/bin/doom purge'


        alias v='nvim'

        alias cp='cp -i'
        alias mv='mv -i'
        alias rm='rm -i'

        alias tas='tmux attach-session -c '
        alias tns='tmux new-session -s '

        alias df='df -h'
        alias free='free -m'

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



        alias tb='nc termbin.com 9999'
        alias recordterm='asciinema rec'

        # Distrobox
        alias fedora='distrobox enter fedora'
        alias ubuntu='distrobox enter ubuntu'
        alias kali='distrobox enter blackarch'


        alias pdf='sioyek'
        alias txt='alacritty -c nvim'
        # alias hotspot='nmcli dev wifi hotspot'
        # alias wpassword='nmcli dev wifi show-password'

        alias nixosrebuild='sudo nixos-rebuild switch --flake ~/flake#nixos'
        alias cleanup='sudo nix-collect-garbage -d'

      '';
      # Add npm path to PATH
      shellInit = ''
        set -gx PATH /home/${global.user}/.npm_global/bin  /home/${global.user}/.emacs.d/bin /home/${global.user}/.config/hypr/scripts /home/${global.user}/.local/share/solana/install/active_release/bin /home/${global.user}/.cargo/bin /home/${global.user}/.local/bin $PATH

        # pnpm
          set -gx PNPM_HOME "/home/anower/.local/share/pnpm"
          set -gx PATH "$PNPM_HOME" $PATH
        # pnpm end
        starship init fish | source

      '';
    };
  };
}
