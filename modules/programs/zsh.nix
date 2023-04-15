{ pkgs, user, ... }:
{
  programs = {
    zsh = {
      enable = true;
      history = {
        size = 10000;
        path = "/home/${user}/zsh/history";
      };
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "npm" "node" "vscode" "tmux" "command-not-found" ];
        theme = "robbyrussell";
      };
      initExtra = ''
        # navigation
        alias ..='cd ..'
        alias ...='cd ../..'
        alias .3='cd ../../..'
        alias .4='cd ../../../..'
        alias .5='cd ../../../../..'

        alias ls='exa --icons'
        alias la='exa -a --icons'
        alias ll='exa -la --icons'
        alias c= 'clear'
        alias h= 'htop'
        alias n= 'neofetch'


        alias em='emacs -nw'
        alias emds='emacs --daemon'
        alias emd='emacsclient -tty'

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
        alias chackout='git chackout'
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


        alias pdf='zathura'
        alias txt='mousepad'
        alias hotspot='nmcli dev wifi hotspot'
        alias wpassword='nmcli dev wifi show-password'

        alias nixosrebuild='sudo nixos-rebuild switch --flake ~/flake#nixos'
        alias cleanup='sudo nix-collect-garbage -d'
        eval "$(starship init zsh)"
      '';
    };
  };
}
