@echo off
title automake environment
call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat" x86
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Microsoft SDKs\Windows\v7.1A\Include
set LIB=%LIB%;C:\Program Files (x86)\Microsoft SDKs\Windows\v7.1A\Lib
set BIN=%BIN%;C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.7 Tools
set PATH=%BIN%;%PATH%
cmd /k