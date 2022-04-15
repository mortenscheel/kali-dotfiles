load_order=(
  $HOME/.localrc
  $HOME/.zsh/path.zsh
  $HOME/.zsh/brew.zsh
  $HOME/.zsh/files.zsh
  $HOME/.zsh/options.zsh
  $HOME/.zsh/completion.zsh
  $HOME/.zsh/zim-init.zsh
  $HOME/.zsh/kali.zsh
  $HOME/.zsh/aliases.zsh
)

for script in $load_order; do
  [ -f "$script" ] && . "$script"
done
