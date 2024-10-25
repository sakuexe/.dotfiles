# enable emacs mode
bindkey -e
# include some of the niceties of vi mode
# without actually using vi mode
# see all the hotkeys with bindkey -L
bindkey "^[[1~" beginning-of-line # home button
bindkey "^[[2~" yank
bindkey "^[[3~" delete-char # delete button
bindkey "^[[4~" end-of-line # end button
bindkey "^[[5~" history-beginning-search-backward-end
bindkey "^[[6~" history-beginning-search-forward-end
