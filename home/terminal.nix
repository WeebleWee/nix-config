{ config, pkgs, ... }:

{
  # --------------------------------------------------------- ghostty ---
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "noctalia";
      font-family = "CozetteVector";
      font-size = 22;
      font-synthetic-style = false;
      freetype-load-flags = "monochrome";
      term = "xterm-256color";
      confirm-close-surface = false;
      window-padding-x = 6;
      window-padding-y = 4;
    };
  };

  # ------------------------------------------------------------- PATH ---
  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    "$HOME/.bun/bin"
    "$HOME/.local/share/gem/ruby/3.4.0/bin"
    "$HOME/go/bin"
  ];

  # ------------------------------------------------------------- tools ---
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [ "--cmd j" ];
  };

  programs.bat.enable = true;
  programs.fzf.enable = true;
  programs.eza.enable = true;

  # ---------------------------------------------------------------- zsh ---
  programs.zsh = {
    enable = true;
    enableCompletion = true; # runs compinit for you
    syntaxHighlighting.enable = true;

    autosuggestion = {
      enable = true;
      highlight = "fg=#7B5FD4";
    };

    history = {
      path = "${config.xdg.configHome}/zsh/zhistory";
      size = 5000;
      save = 5000;
      append = true;
      share = true;
      ignoreSpace = true;
      ignoreDups = true;
      ignoreAllDups = true;
      saveNoDups = true;
      findNoDups = true;
    };

    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }
      {
        name = "history-substring-search";
        src = pkgs.zsh-history-substring-search;
        file = "share/zsh-history-substring-search/zsh-history-substring-search.zsh";
      }
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
    };

    shellAliases = {
      ll = "eza --icons=always --color=always -lah";
      ls = "eza --icons=always --color=always -a";
      vim = "nvim";
      radio = "sonicradio";
      rebuild = "nh os switch";
    };

    initContent = ''
      autoload -Uz add-zsh-hook vcs_info
      precmd () { vcs_info }
      _comp_options+=(globdots)

      xterm_title_precmd() {
        print -Pn -- '\e]2;%n@%m %~\a'
      }

      xterm_title_preexec() {
        print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "''${(q)1}\a"
      }

      if [[ "$TERM_PROGRAM" == ghostty ]]; then
        add-zsh-hook -Uz precmd xterm_title_precmd
        add-zsh-hook -Uz preexec xterm_title_preexec
      fi

      zstyle ':completion:*' menu select
      zstyle ':completion:*:descriptions' format '[%d]'
      zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
      zstyle ':completion:*' matcher-list \
        'm:{a-zA-Z}={A-Za-z}' \
        '+r:|[._-]=* r:|=*' \
        '+l:|=*'
      zstyle ':vcs_info:*' formats ' %B%s-[%F{magenta}%f %F{yellow}%b%f]-'

      zstyle ':fzf-tab:*' fzf-flags --style=full --height=90% --pointer '>' \
        --color 'pointer:red:bold,bg+:-1:,fg+:white:bold,info:blue:bold,marker:yellow:bold,hl:blue:bold,hl+:yellow:bold' \
        --input-label ' Search ' --color 'input-border:red,input-label:red:bold' \
        --list-label ' Results ' --color 'list-border:green,list-label:green:bold' \
        --preview-label ' Preview ' --color 'preview-border:cyan,preview-label:cyan:bold'
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons=always --color=always -a $realpath'
      zstyle ':fzf-tab:complete:eza:*' fzf-preview 'eza -1 --icons=always --color=always -a $realpath'
      zstyle ':fzf-tab:complete:bat:*' fzf-preview 'bat --color=always --theme=base16 $realpath'
      zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
      zstyle ':fzf-tab:*' accept-line enter

      setopt AUTOCD PROMPT_SUBST MENU_COMPLETE LIST_PACKED AUTO_LIST COMPLETE_IN_WORD

      expand-or-complete-with-dots() {
        echo -n "\e[31m…\e[0m"
        zle expand-or-complete
        zle redisplay
      }
      zle -N expand-or-complete-with-dots
      bindkey "^I" expand-or-complete-with-dots

      bindkey '^[[3~' delete-char
      bindkey '^[[A' history-substring-search-up
      bindkey '^[[B' history-substring-search-down

      DIM=$'%{\e[2m%}%F{4}'
      UNDIM=$'%{\e[22m%}%f'

      dir_icon() {
        if [[ $PWD == $HOME ]]; then
          print -rn -- '%B%F{blue}󰋜%f%b'
        else
          print -rn -- '%B%F{blue}󰣇%f%b'
        fi
      }

      TIME="''${DIM}[''${UNDIM}%F{cyan}%B%T%b''${DIM}]''${UNDIM}"
      NICK="''${DIM}[''${UNDIM}%F{cyan}%BWeeble@VioletFlake%b''${DIM}]''${UNDIM}"

      PS1="''${NICK}"' $(dir_icon)  %B%F{green}%~%f%b''${vcs_info_msg_0_} %(?.%B%F{yellow}.%F{magenta})%f%b'

      command_not_found_handler() {
        printf "Erm... what the fricken frick is %s%s?\n" "$acc" "$0" >&2
        return 127
      }

      fastfetch --logo ~/lil.txt
    '';
  };
}
