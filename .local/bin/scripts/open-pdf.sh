if [[ $# -eq 1 ]]; then
    selected=$1
else
    # Find PDFs, replace $HOME with ~, and pass to Wofi
    selected=$(find ~/Documents ~/books -type f -name "*.pdf" 2>/dev/null | sed "s|^$HOME|~|" | wofi --dmenu --prompt "Open PDF" --height 40% --width 50%)
fi

# Exit cleanly if no file was selected (e.g., pressed Escape)
if [[ -z "$selected" ]]; then
    exit 0
fi

# Expand leading ~ back to full $HOME path
full_path="${selected/#\~/$HOME}"

# Launch Zathura with the expanded full path
nohup zathura "$full_path" >/dev/null 2>&1 &
