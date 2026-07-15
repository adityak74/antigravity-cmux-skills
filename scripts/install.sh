#!/bin/bash
set -e

PLUGIN_DIR="/Users/adityakarnam/.gemini/config/plugins"
TARGET_LINK="$PLUGIN_DIR/antigravity-cmux-skill"
SOURCE_DIR="/Users/adityakarnam/Projects/antigravity-cmux-skill"

echo "Creating plugins directory if it doesn't exist..."
mkdir -p "$PLUGIN_DIR"

if [ -L "$TARGET_LINK" ] || [ -e "$TARGET_LINK" ]; then
    echo "Removing existing symlink/directory at $TARGET_LINK..."
    rm -rf "$TARGET_LINK"
fi

echo "Symlinking $SOURCE_DIR to $TARGET_LINK..."
ln -s "$SOURCE_DIR" "$TARGET_LINK"

echo "Installation complete! The antigravity-cmux-skill is now active."
