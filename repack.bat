::@echo off
set inputfile=%~1
set eac3to=U:\encode2\megui\tools\eac3to\eac3to.exe
set mp4box=U:\encode2\megui\tools\mp4box\MP4Box.exe
set neroaac=U:\encode2\megui\neroAacEnc.exe
set temppath=U:\temp

:: Unpack the mkv (first track assumed video, second assumed audio)
%eac3to% "%inputfile%" 1: %temppath%\video.h264
%eac3to% "%inputfile%" 2: %temppath%\audio.wav -down2

:: Encode all wav files
%neroaac% -q 0.5 -if %temppath%\audio.wav -of %temppath%\audio.aac

:: Pack the shit
%mp4box% -add %temppath%\video.h264 -add %temppath%\audio.aac -new %temppath%\out.mp4

:: Remove files
del "%temppath%\audio - Log.txt" "%temppath%\audio.aac" "%temppath%\audio.wav" "%temppath%\video - Log.txt" "%temppath%\video.h264"

:: Move the output file
move "%temppath%\out.mp4" "%inputfile%.mp4"