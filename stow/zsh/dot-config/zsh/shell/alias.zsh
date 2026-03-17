source ~/.config/zsh/shell/alias/core.zsh
source ~/.config/zsh/shell/alias/unix.zsh

for f in ~/.config/zsh/shell/alias/applications/*.zsh; do
  source "$f"
done
