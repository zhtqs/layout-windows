PROJNAME=lw
OBJ= main.obj
RES= lw.res
INCLUDE_PATHS= /I.
LIB_PATHS= /LIBPATH:./
CFLAGS= /GS /analyze- /W3 /Zc:wchar_t /ZI /Gm /Od /sdl /fp:precise /D "_WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_CRT_SECURE_NO_WARNINGS" /D "_UNICODE" /D "UNICODE" /WX- /Zc:forScope /RTC1 /Gd /Oy- /MDd /EHsc
CPPLAGS= /GS /analyze- /W3 /Zc:wchar_t /ZI /Gm /Od /sdl /fp:precise /D "_WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_CRT_SECURE_NO_WARNINGS" /D "_UNICODE" /D "UNICODE" /WX- /Zc:forScope /RTC1 /Gd /Oy- /MDd /EHsc
LDFLAGS= user32.lib kernel32.lib comctl32.lib ws2_32.lib
WARNINGS=/wd4028 /wd4047

default: $(PROJNAME)_exe $(PROJNAME)_dll post_build

$(PROJNAME)_dll: $(OBJ) $(RES)
	@link /nologo /DLL /DEBUG /MACHINE:X86 /SUBSYSTEM:WINDOWS /implib:"$(PROJNAME)_i.lib" /OUT:"$(PROJNAME).dll" /PDB:"$(PROJNAME)_i.pdb" $(LIB_PATHS) $(OBJ) $(RES) $(LDFLAGS)

$(PROJNAME)_exe: $(OBJ) $(RES)
	@link /nologo /DEBUG /MACHINE:X86 /SUBSYSTEM:WINDOWS /OUT:"$(PROJNAME).exe" /PDB:"$(PROJNAME).pdb" $(LIB_PATHS) $(OBJ) $(RES) $(LDFLAGS)

*.rc.res:
    @rc /nologo /Fo$@ $*.rc

*.c.obj:
    @cl /nologo /c $(INCLUDE_PATHS) $(CFLAGS) $(WARNINGS) /Fo$@ $*.c 
    
*.cpp.obj:
    @cl /nologo /c $(INCLUDE_PATHS) $(CPPFLAGS) $(WARNINGS) /Fo$@ $*.cpp 

post_build:
    @cmd /c post_build.cmd
    
clean: 
	@if exist x86 ( rd /s /q x86 )
    @mkdir x86
    @del /f /s /q *.exe 
    @del /f /s /q *.dll 
    @del /f /s /q *.ilk 
    @del /f /s /q *.pdb 
    @del /f /s /q *.obj 
    @del /f /s /q *.idb 
    @del /f /s /q *.res 