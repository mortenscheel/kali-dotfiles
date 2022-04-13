load_order=(
  $HOME/.localrc
  $HOME/.zsh/options.zsh
  $HOME/.zsh/completion.zsh
  $HOME/.zsh/zim-init.zsh
  $HOME/.zsh/kali.zsh
  $HOME/.zsh/aliases.zsh
)

for script in $load_order; do
  [ -f "$script" ] && . "$script"
done