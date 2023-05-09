@echo off
cls
set /p link="Enter video link: "
set "link=%link:&list=*%"
echo.
yt-dlp --list-formats "%link%"
set /p quality="Enter video quality (default=137+bestaudio/136+bestaudio/135+bestaudio/bestvideo+bestaudio/best): " || set "quality=137+bestaudio/136+bestaudio/135+bestaudio/bestvideo+bestaudio/best"
set /p choice="Video or Audio: (type v or a) "
if "%choice%"=="v" (
	yt-dlp "%link%" --no-continue --format %quality% -o "/_0_0_Download/%%(title)s.%%(ext)s"
	
	) else if "%choice%"=="a" (
		 yt-dlp "%link%" --no-continue -f 140/bestaudio --embed-thumbnail --add-metadata --output "/_0_0_Download/%%(title)s.%%(ext)s" && ffmpeg -i "/_0_0_Download/%%title%.m4a" -i "/_0_0_Download/%%title%.png" -vn -ar 44100 -ac 2 -ab 192k -map_metadata 0 -map 0 -map 1 -c copy "/_0_0_Download/%%title%.mp3"
			del "/_0_0_Download/%%title%.m4a"
			del "/_0_0_Download/%%title%.png"
	)
