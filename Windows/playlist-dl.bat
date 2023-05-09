cls
@echo off
echo Welcome to the yt-dlp playlist Downloader
echo Features:
echo 1. High Speed
echo 2. Custom Format and Quality
echo 3. Index Renaming
echo 4. Default Configuration that you won't have to think much


set /p link="Enter playlist link: "
echo.
yt-dlp --list-formats --no-warnings --playlist-start 1 --playlist-end 1 "%link%"
set /p quality="Enter video quality (default=137+bestaudio/136+bestaudio/135+bestaudio/bestvideo+bestaudio/best): " || set "quality=137+bestaudio/136+bestaudio/135+bestaudio/bestvideo+bestaudio/best"
set /p choice="Enter download choice (all, specific, range, default=all): " || set "choice=all"
set /p folder="Enter folder name (default=playlist name)(Entering a folder name will help to initiate the process quickly): "

if "%folder%"=="" (
    for /f "delims=" %%a in ('yt-dlp --get-filename -o "%%(playlist)s" "%link%"') do set "folder=%%a"
)



if "%choice%"=="all" (
    yt-dlp "%link%" --no-continue --yes-playlist --format %quality% -o "/_0_0_Download/%folder%/%%(playlist_index)02d. %%(title)s.%%(ext)s"
) else if "%choice%"=="specific" (
	
    yt-dlp --flat-playlist --get-filename -o "%%(playlist_index)s - %%(title)s" "%link%"
    set /p index="Enter video index: "
    yt-dlp "%link%" --no-continue --format %quality% --output "/_0_0_Download/%folder%/%%(playlist_index)02d. %%(title)s.%%(ext)s" --playlist-items %index%
) else if "%choice%"=="range" (
	
    yt-dlp --flat-playlist --get-filename -o "%%(playlist_index)s - %%(title)s" "%link%"
    set /p start="Enter start index: "
    set /p end="Enter end index: "
    yt-dlp "%link%" --no-continue --format %quality% --output "/_0_0_Download/%folder%/%%(playlist_index)02d. %%(title)s.%%(ext)s" --playlist-items %start%-%end%
) else (
    echo Invalid choice.
)
