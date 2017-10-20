PROJNAME=lw
OBJ= main.obj
RES= lw.res
INCLUDE_PATHS= /I.
LIB_PATHS= /LIBPATH:./x86/
CFLAGS= /GS /analyze- /W3 /Zc:wchar_t /ZI /Gm /Od /sdl /fp:precise /D "_WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_CRT_SECURE_NO_WARNINGS" /D "_UNICODE" /D "UNICODE" /WX- /Zc:forScope /RTC1 /Gd /Oy- /MDd /EHsc
CPPLAGS= /GS /analyze- /W3 /Zc:wchar_t /ZI /Gm /Od /sdl /fp:precise /D "_WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_CRT_SECURE_NO_WARNINGS" /D "_UNICODE" /D "UNICODE" /WX- /Zc:forScope /RTC1 /Gd /Oy- /MDd /EHsc
LDFLAGS= user32.lib kernel32.lib comctl32.lib ws2_32.lib
WARNINGS=/wd4028 /wd4047

default: $(PROJNAME)_exe

$(PROJNAME)_dll: $(OBJ) $(RES)
	@link /nologo /DLL /DEBUG /MACHINE:X86 /SUBSYSTEM:WINDOWS /implib:"x86\$(PROJNAME)_i.lib" /OUT:"x86\$(PROJNAME)_i.dll" /PDB:"x86\$(PROJNAME)_i.pdb" $(LIB_PATHS) $(OBJ) $(RES) $(LDFLAGS)

$(PROJNAME)_exe: $(OBJ) $(RES)
	@link /nologo /DEBUG /MACHINE:X86 /SUBSYSTEM:WINDOWS /OUT:"x86\$(PROJNAME).exe" /PDB:"x86\$(PROJNAME).pdb" $(LIB_PATHS) $(OBJ) $(RES) $(LDFLAGS)

.rc.res:
    @rc /nologo /Fox86\lw.res $*.rc

.c.obj:
    @cl /nologo /c /Zi /O2 /MD /EHsc $(INCLUDE_PATHS) $(CFLAGS) $(WARNINGS) /Fox86\ /Fdx86\ $*.c 
    
.cpp.obj:
    @cl /nologo /c /Zi /O2 /MD /EHsc $(INCLUDE_PATHS) $(CPPFLAGS) $(WARNINGS) /Fox86\ /Fdx86\ $*.cpp 

post_build:
    @cmd /c post_build.cmd
    
clean: 
	@if exist x86 ( rd /s /q x86 )
    @mkdir x86