{ pkgs, user, ... }:
{
  programs = {
    fish = {
      enable = true;
      plugins = [
        # Enable a plugin (here grc for colorized command output) from nixpkgs
        { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      ];
      interactiveShellInit = ''
        set fish_greeting # Disable greeting

        set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

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
        alias doomsync='~/.emacs.d/bin/doom sync'
        alias doomdoctor='~/.emacs.d/bin/doom doctor'
        alias doomupgrade='~/.emacs.d/bin/doom upgrade'
        alias doompurge='~/.emacs.d/bin/doom purge'

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

        alias tb='nc termbin.com 9999'
        alias recordterm='asciinema rec'

        # Distrobox
        alias fedora='distrobox enter fedora'
        alias ubuntu='distrobox enter ubuntu'
        alias kali='distrobox enter kali'


        alias pdf='zathura'
        alias txt='mousepad'
        alias hotspot='nmcli dev wifi hotspot'
        alias wpassword='nmcli dev wifi show-password'

        alias nixosrebuild='sudo nixos-rebuild switch --flake ~/flake#nixos'
        alias cleanup='sudo nix-collect-garbage -d'
      '';
      # Add npm path to PATH
      shellInit = ''
        set -gx PATH /home/${user}/.npm-global/bin  /home/${user}/.config/hypr/scripts /home/${user}/.local/share/solana/install/active_release/bin /home/${user}/.cargo/bin  $PATH
        set -gx xkblayout "us"
        set -gx xkbvariant "bn_probhat"
        # pnpm
          set -gx PNPM_HOME "/home/anower/.local/share/pnpm"
          set -gx PATH "$PNPM_HOME" $PATH
        # pnpm end
        starship init fish | source
      '';
    };
  };
}
