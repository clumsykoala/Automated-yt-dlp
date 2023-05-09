# Automated-yt-dlp for Android

## installation
there are several yt-dlp clients on Android plateform. One of them is seal which offers running custom commands.
01. install the latest release of [seal](https://github.com/JunkFood02/Seal)
02. you can use the GUI or custom command. Here is a sample of custom command for playlist:
```
 yt-dlp --no-continue --yes-playlist --format 137+bestaudio/136+bestaudio/135+bestaudio/bestvideo+bestaudio/best -o "%(playlist)s/%(playlist_index)02d. %(title)s.%(ext)s"
```
Sample command for single video:
```
yt-dlp --no-continue --format 137+bestaudio/136+bestaudio/135+bestaudio/bestvideo+bestaudio/best -o "%(title)s.%(ext)s"
```
3. keep the command like this or modify it as you wish and enjoy :')
