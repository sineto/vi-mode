# Ensure that the prompt is redrawn when the terminal size changes.
TRAPWINCH() {
  zle && { zle -R; zle reset-prompt }
}

bindkey -v

# eliminating delays
export KEYTIMEOUT=1

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line

# mapping <Esc> to escape from vi-insert mode to vi-cmd-mode and vice-versa
bindkey -M viins '^[' vi-cmd-mode
bindkey -M vicmd '^[' vi-insert

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' up-history
bindkey '^N' down-history

# allow ctrl-j/ctrl-j for navigate history integrated with zsh-history-substring-search
bindkey -M viins '^k' history-substring-search-up
bindkey -M viins '^j' history-substring-search-down

# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

# allow ctrl-r to perform backward search in history
bindkey '^r' history-incremental-search-backward

# allow ctrl-a/HOME and ctrl-e/END to move to beginning/end of line
bindkey '^a'      beginning-of-line
bindkey '\e[H'    beginning-of-line
bindkey '^e'      end-of-line
bindkey '\e[F'    end-of-line

# [Home] - Go to beginning of line
bindkey -M viins "${terminfo[khome]}" beginning-of-line
bindkey -M vicmd "${terminfo[khome]}" beginning-of-line

# [End] - Go to end of line
bindkey -M viins "${terminfo[kend]}" end-of-line
bindkey -M vicmd "${terminfo[kend]}" end-of-line
