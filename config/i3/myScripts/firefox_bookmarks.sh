#!/bin/bash

ROFI_COMMAND="rofi -dmenu -i"

# List all the folders of firefox
# sqlite3 -line /tmp/places.sqlite 'SELECT title FROM moz_bookmarks where type=2'
EXCLUDE_FOLDERS="'Mozilla Firefox', 'Manjaro Linux'"

get_firefox_bookmarks() {
  BOOKMARKS_FILE="$(find ~/.mozilla -iname '*places.sqlite')"
  BOOKMARKS_TMP_DIR="/tmp/bookmark"
  mkdir -p "$BOOKMARKS_TMP_DIR"
  cp "$BOOKMARKS_FILE" "$BOOKMARKS_TMP_DIR/"

  SQL_EXCLUDE_FOLDERS="
    SELECT moz_bookmarks.id
    FROM moz_bookmarks
    WHERE type=2 AND title IN ($EXCLUDE_FOLDERS)" # type=2 means folder
  SQL="
    SELECT moz_places.url, moz_bookmarks.title
    FROM moz_bookmarks
    JOIN moz_places
    ON moz_bookmarks.fk = moz_places.id
    WHERE moz_bookmarks.parent NOT IN ($SQL_EXCLUDE_FOLDERS)"

  FIREFOX_BOOKMARKS="$(sqlite3 -line $BOOKMARKS_TMP_DIR/places.sqlite "$SQL")"
  rm -rf "$BOOKMARKS_TMP_DIR"
}

parse_firefox_bookmarks() {
  BOOKMARKS_TITLES="$(echo "$FIREFOX_BOOKMARKS" | grep 'title' | awk '{$1=$2=""; print $0}' | sed 's/^ *//g')"
  BOOKMARKS_URLS="$(echo "$FIREFOX_BOOKMARKS" | grep 'url' | awk '{$1=$2=""; print $0}' | sed 's/^ *//g')"

  BOOKMARKS=$(paste -d "," -- <(echo "$BOOKMARKS_TITLES") <(echo "$BOOKMARKS_URLS") | awk -F ',' '{print $1 " (" $2 ")"}')
}

rofi_firefox_bookmarks() {
  BOOKMARK_SELECTED=$(echo "$BOOKMARKS" | $ROFI_COMMAND)

  if [[ -z "$BOOKMARK_SELECTED" ]]; then
    exit 0
  fi

  WEBPAGE=$(echo "$BOOKMARK_SELECTED" | sed 's/.*(\(https\?:\/\/.*\))$/\1/g')

  echo "Opening with firefox: $WEBPAGE"

  firefox "$WEBPAGE"
}

get_firefox_bookmarks
parse_firefox_bookmarks
rofi_firefox_bookmarks
