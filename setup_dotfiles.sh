#!/bin/bash

set -e

DOTFILES_DIR="$HOME/dotfiles"

# Define items to be managed and their package names
declare -A DOTFILES=(
  ["$HOME/.zshrc"]="zsh"
  ["$HOME/.config/nvim"]="nvim"
  ["$HOME/.config/zellij"]="zellij"
  ["$HOME/.config/hypr"]="hypr"
  ["$HOME/.config/waybar"]="waybar"
  ["$HOME/.config/wofi"]="wofi"
  ["$HOME/.config/kitty"]="kitty"
)

echo "📁 Setting up dotfiles in $DOTFILES_DIR"
mkdir -p "$DOTFILES_DIR"

for SRC in "${!DOTFILES[@]}"; do
  PACKAGE="${DOTFILES[$SRC]}"
  DEST="$DOTFILES_DIR/$PACKAGE"

  REL_PATH="${SRC/#$HOME\//}"  # e.g., .zshrc or .config/nvim

  echo "🔄 Processing $SRC -> $DEST/$REL_PATH"

  # Ensure destination directory exists
  mkdir -p "$(dirname "$DEST/$REL_PATH")"

  # Move the original file/directory
  mv "$SRC" "$DEST/$REL_PATH"

done

# Stow all packages
cd "$DOTFILES_DIR"
for PACKAGE in $(ls -1); do
  echo "🔗 Stowing $PACKAGE"
  stow "$PACKAGE"
done

echo "✅ All files have been moved and stowed!"
