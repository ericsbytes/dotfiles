#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGES=(
  git
  nvim
  tmux
)

# CHECK: does stow exist?
if command -v stow &>/dev/null; then
  echo "GNU Stow found. Stowing packages..."
  for pkg in "${PACKAGES[@]}"; do
    if [ -d "$DOTFILES/$pkg" ]; then
      echo "  Stowing $pkg..."
      stow --dir="$DOTFILES" --target="$HOME" --restow "$pkg"
    else
      echo "  Skipping $pkg (directory not found)"
    fi
  done
  echo "Done."
  exit 0
fi

echo "GNU Stow not found. Falling back to manual symlinks..."

for pkg in "${PACKAGES[@]}"; do
  pkg_dir="$DOTFILES/$pkg"
  if [ ! -d "$pkg_dir" ]; then
    echo "  Skipping $pkg (directory not found)"
    continue
  fi

  # Walk every file under the package dir and mirror the structure under $HOME
  find "$pkg_dir" -type f | while read -r src; do
    rel="${src#"$pkg_dir/"}"          # path relative to package root
    dest="$HOME/$rel"
    dest_dir="$(dirname "$dest")"

    mkdir -p "$dest_dir"

    if [ -L "$dest" ]; then
      echo "  Relinking $rel"
      ln -sf "$src" "$dest"
    elif [ -e "$dest" ]; then
      echo "  WARNING: $dest exists and is not a symlink — skipping"
    else
      echo "  Linking $rel"
      ln -s "$src" "$dest"
    fi
  done
done

echo "Done."