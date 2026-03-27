FILENAME="PkgTTC-SGr-IosevkaTerm-34.2.1.zip"
FONT_DIRECTORY="$HOME/.local/share/fonts"

echo "downloading the font from be5invis/Iosevka from github"
wget "https://github.com/be5invis/Iosevka/releases/download/v34.2.1/$FILENAME"

echo "making font directory at $FONT_DIRECTORY"
mkdir -p "$FONT_DIRECTORY"

unzip "$FILENAME" -d  "$FONT_DIRECTORY"

echo "refreshing font cache"
fc-cache -v
