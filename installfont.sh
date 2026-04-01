FILENAME="PkgTTC-SGr-IosevkaTerm-34.2.1.zip"
FONT_DIRECTORY="$HOME/.local/share/fonts"

# wsl doesn't come with ts
if ! command -v unzip &>/dev/null; then
    if command -v apt &>/dev/null; then
        sudo apt install -y unzip
    elif command -v dnf &>/dev/null; then
        sudo dnf install -y unzip
    elif command -v pacman &>/dev/null; then
        sudo pacman -S --noconfirm unzip
    else
        echo "install unzip manually"
        exit 1
    fi
fi

echo "downloading the font from be5invis/Iosevka from github"
wget "https://github.com/be5invis/Iosevka/releases/download/v34.2.1/$FILENAME"

echo "making font directory at $FONT_DIRECTORY"
mkdir -p "$FONT_DIRECTORY"

unzip "$FILENAME" -d  "$FONT_DIRECTORY"

echo "refreshing font cache"
fc-cache -v
