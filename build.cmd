@echo off
title 自动构建环境
set INCLUDE=C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\include
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\atlmfc\include
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\10\Include\10.0.15063.0\ucrt
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\10\Include\10.0.15063.0\um
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\10\Include\10.0.15063.0\shared
set LIB=C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\lib
set LIB=%LIB%;C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\atlmfc\lib
set LIB=%LIB%;C:\Program Files (x86)\Windows Kits\10\Lib\10.0.15063.0\ucrt\x86
set LIB=%LIB%;C:\Program Files (x86)\Windows Kits\10\Lib\10.0.15063.0\um\x86
set BIN=C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin
set BIN=%BIN%;C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.7 Tools
set BIN=%BIN%;C:\Program Files (x86)\Windows Kits\10\bin\x86
set BIN=%BIN%;C:\Windows
set BIN=%BIN%;C:\Windows\system32
set PATH=%BIN%
cmd /k