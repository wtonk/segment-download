@echo off
setlocal EnableDelayedExpansion

REM Check if URL parameter is provided
IF [%1] == [] (
    echo Usage: %0 "<URL>" [start_segment] [end_segment]
    exit /b
)

REM Extract base URL and query parameters
set "url=%~1"

REM Split the url into base and params
for /f "tokens=1,* delims=?" %%a in ("%url%") do (
    set "base_url=%%a"
    set "query_params=%%b"
)

REM Remove segment information from URL
for /f "delims=" %%a in ('echo %base_url% ^| sed "s/\/[^/]*$/\//g"') do set "base_url=%%a"

REM Determine start and end segments (default to first twenty)
set "start_segment=1"
set "end_segment=20"
if not "%2"=="" set "start_segment=%2"
if not "%3"=="" set "end_segment=%3"

mkdir "Segments"

REM Iterate through specified segments
FOR /L %%i IN (!start_segment!,1,!end_segment!) DO (
    echo Segment %%i
	curl "!base_url!seg-%%i-v1-a1.ts?!query_params!" ^
         -o "Segments/%%i.ts"
    echo file 'Segments/%%i.ts' >> concat.txt
)

ffmpeg -f concat -i concat.txt -c copy Output.ts
REM Cleanup temporary files
rmdir /s /q "Segments"
del concat.txt /Q