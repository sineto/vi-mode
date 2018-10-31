# Updates editor information when the keymap changes.
function zle-line-init zle-keymap-select() {
  NVI="%{$fg_bold[green]%} [% N]% %{$reset_color%}"
  IVI="%{$fg_bold[blue]%} [% I]% %{$reset_color%}"
  RPS1="${${KEYMAP/vicmd/$NVI}/(main|viins)/$IVI} $EPS1"
  zle reset-prompt
  zle -R
}

# Ensure that the prompt is redrawn when the terminal size changes.
TRAPWINCH() {
  zle && { zle -R; zle reset-prompt }
}

zle -N zle-line-init
zle -N zle-keymap-select
zle -N edit-command-line

bindkey -v

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' up-history
bindkey '^N' down-history

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
