#!/bin/bash

echo "Welcome to the yt-dlp playlist Downloader"
echo "Features:"
echo "1. High Speed"
echo "2. Custom Format and Quality"
echo "3. Index Renaming"
echo "4. Default Configuration that you won't have to think much"

read -p "Enter playlist link: " link
echo ""
yt-dlp --list-formats --no-warnings --playlist-start 1 --playlist-end 1 "$link"

read -p "Enter video quality (default=137+bestaudio/136+bestaudio/135+bestaudio/bestvideo+bestaudio/best): " quality
quality=${quality:-137+bestaudio/136+bestaudio/135+bestaudio/bestvideo+bestaudio/best}

read -p "Enter download choice (all, specific, range, default=all): " choice
choice=${choice:-all}

read -p "Enter folder name (default=playlist name)(Entering a folder name will help to initiate the process quickly): " folder

if [[ -z "$folder" ]]; then
    folder=$(yt-dlp --get-filename -o "%(playlist)s" "$link")
fi

if [[ "$choice" == "all" ]]; then
    yt-dlp "$link" --no-continue --yes-playlist --format "$quality" -o "/_0_0_Download/$folder/%(playlist_index)02d. %(title)s.%(ext)s"
elif [[ "$choice" == "specific" ]]; then
    yt-dlp --flat-playlist --get-filename -o "%(playlist_index)s - %(title)s" "$link"
    read -p "Enter video index: " index
    yt-dlp "$link" --no-continue --format "$quality" --output "/_0_0_Download/$folder/%(playlist_index)02d. %(title)s.%(ext)s" --playlist-items "$index"
elif [[ "$choice" == "range" ]]; then
    yt-dlp --flat-playlist --get-filename -o "%(playlist_index)s - %(title)s" "$link"
    read -p "Enter start index: " start
    read -p "Enter end index: " end
    yt-dlp "$link" --no-continue --format "$quality" --output "/_0_0_Download/$folder/%(playlist_index)02d. %(title)s.%(ext)s" --playlist-items "$start"-"$end"
else
    echo "Invalid choice."
fi
