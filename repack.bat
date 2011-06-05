::@echo off
set inputfile=%~1
set pth=%~dp0
set eac3to="%pth%eac3to\eac3to.exe"
set mp4box="%pth%mp4box\MP4Box.exe"
set neroaac="%pth%neroAacEnc.exe"

:: Unpack the mkv (first track assumed video, second assumed audio)
%eac3to% "%inputfile%" 1: %temp%\video.h264
%eac3to% "%inputfile%" 2: %temp%\audio.wav -down2

:: Encode all wav files
%neroaac% -q 0.5 -if %temp%\audio.wav -of %temp%\audio.aac

:: Pack the shit
%mp4box% -add %temp%\video.h264 -add %temp%\audio.aac -new "%inputfile%.mp4"

:: Remove files
del "%temp%\audio - Log.txt" "%temp%\audio.aac" "%temp%\audio.wav" "%temp%\video - Log.txt" "%temp%\video.h264"