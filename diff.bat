@echo off
setlocal
asm6 smw.asm smw.nes || exit
fc /b SuperMarioWorld.nes smw.nes
set res=%errorlevel%
if "%res%"=="1" (fc /b SuperMarioWorld.nes smw.nes > diff.log)
