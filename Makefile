PROJNAME=lw
OBJ= main.obj
RES= lw.res
INCLUDE_PATHS= /I.
LIB_PATHS= /LIBPATH:./X64/
CFLAGS= /GS /analyze- /W3 /Zc:wchar_t /ZI /Gm /Od /sdl /fp:precise /D "_WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_CRT_SECURE_NO_WARNINGS" /D "_UNICODE" /D "UNICODE" /WX- /Zc:forScope /RTC1 /Gd /Oy- /MDd /EHsc
CPPLAGS= /GS /analyze- /W3 /Zc:wchar_t /ZI /Gm /Od /sdl /fp:precise /D "_WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_CRT_SECURE_NO_WARNINGS" /D "_UNICODE" /D "UNICODE" /WX- /Zc:forScope /RTC1 /Gd /Oy- /MDd /EHsc
LDFLAGS= user32.lib kernel32.lib comctl32.lib ws2_32.lib
WARNINGS=/wd4028 /wd4047

default: $(PROJNAME)_exe

$(PROJNAME)_dll: $(OBJ) $(RES)
	@link /nologo /DLL /DEBUG /MACHINE:X64 /SUBSYSTEM:WINDOWS /implib:"X64\$(PROJNAME)_i.lib" /OUT:"X64\$(PROJNAME)_i.dll" /PDB:"X64\$(PROJNAME)_i.pdb" $(LIB_PATHS) $(OBJ) $(RES) $(LDFLAGS)
	@echo generate X64\$(PROJNAME)_i.dll finished.

$(PROJNAME)_exe: $(OBJ) $(RES)
	@link /nologo /DEBUG /MACHINE:X64 /SUBSYSTEM:WINDOWS /OUT:"X64\$(PROJNAME).exe" /PDB:"X64\$(PROJNAME).pdb" $(LIB_PATHS) $(OBJ) $(RES) $(LDFLAGS)
	@echo generate X64\$(PROJNAME).exe finished.

.rc.res:
    @rc /nologo /FoX64\lw.res $*.rc

.c.obj:
    @if not exist X64 ( @mkdir X64 )
    @cl /nologo /c /Zi /O2 /MD /EHsc $(INCLUDE_PATHS) $(CFLAGS) $(WARNINGS) /FoX64\ /FdX64\ $*.c 
    
.cpp.obj:
	@if not exist X64 ( @mkdir X64 )
    @cl /nologo /c /Zi /O2 /MD /EHsc $(INCLUDE_PATHS) $(CPPFLAGS) $(WARNINGS) /FoX64\ /FdX64\ $*.cpp 

post_build:
    @cmd /c post_build.cmd
    
clean: 
	@if exist X64 ( rd /s /q X64 )
    @mkdir X64