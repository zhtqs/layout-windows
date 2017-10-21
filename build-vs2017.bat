@echo off
title automake environment
set LWDIR=%cd%
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\VC\Auxiliary\Build\vcvars64.bat"
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\10\Include\10.0.15063.0\shared
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\10\Include\10.0.15063.0\ucrt
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\10\Include\10.0.15063.0\um
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\NETFXSDK\4.7\Include\um
set LIB=%LIB%;C:\Program Files (x86)\Windows Kits\10\Lib\10.0.15063.0\ucrt\x64
set LIB=%LIB%;C:\Program Files (x86)\Windows Kits\10\Lib\10.0.15063.0\um\x64
set LIB=%LIB%;C:\Program Files (x86)\Windows Kits\NETFXSDK\4.7\Lib\um\x64
set BIN=%BIN%;C:\Program Files (x86)\Windows Kits\10\bin\10.0.15063.0\x64
set PATH=%BIN%;%PATH%
cd /d %LWDIR%
nmake clean
nmake
exit 0