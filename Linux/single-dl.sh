#!/bin/bash

echo "Welcome to the yt-dlp video Downloader"
echo "Features:"
echo "1. High Speed"
echo "2. Custom Format and Quality"

read -p "Enter video link: " link
link="${link/&list=*/}"

echo
yt-dlp --list-formats "$link"

read -p "Enter video quality (default=137+bestaudio/136+bestaudio/135+bestaudio/bestvideo+bestaudio/best): " quality
quality="${quality:-137+bestaudio/136+bestaudio/135+bestaudio/bestvideo+bestaudio/best}"

read -p "Video or Audio: (type v or a) " choice

if [ "$choice" == "v" ]; then
    yt-dlp "$link" --no-continue --format "$quality" -o "/_0_0_Download/%(title)s.%(ext)s"
elif [ "$choice" == "a" ]; then
    yt-dlp "$link" --no-continue -f 140/bestaudio --embed-thumbnail --add-metadata --output "/_0_0_Download/%(title)s.%(ext)s" &&
    ffmpeg -i "/_0_0_Download/%(title)s.m4a" -i "/_0_0_Download/%(title)s.png" -vn -ar 44100 -ac 2 -ab 192k -map_metadata 0 -map 0 -map 1 -c copy "/_0_0_Download/%(title)s.mp3" &&
    rm "/_0_0_Download/%(title)s.m4a" "/_0_0_Download/%(title)s.png"
else
    echo "Invalid choice."
fi
