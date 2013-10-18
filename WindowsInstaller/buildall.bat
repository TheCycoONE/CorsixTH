REM init VS environment vars
IF NOT "%VCVARS%" == "1" (
  call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\Tools\vsvars32.bat"
  set VCVARS=1
)

:OpenGLx86
cmake -G"Visual Studio 10" -H".." -B"..\x86-opengl" -C"x86_CacheInit.txt" -DWITH_OPENGL=ON -DBUILD_MAPEDITOR=ON -DBUILD_ANIMVIEWER=ON
cmake -G"Visual Studio 10" -H".." -B"..\x86-opengl" -C"x86_CacheInit.txt" -DWITH_OPENGL=ON -DBUILD_MAPEDITOR=ON -DBUILD_ANIMVIEWER=ON

msbuild.exe ..\x86-opengl\CorsixTH\CorsixTH.vcxproj /t:Rebuild /p:Configuration=Release;TargetName=CorsixTH_OpenGL
msbuild.exe ..\x86-opengl\AnimView\AnimView.vcxproj /t:Rebuild /p:Configuration=Release
msbuild.exe ..\x86-opengl\MapEdit\MapEdit.vcxproj /t:Rebuild /p:Configuration=Release

:OpenGLx64
cmake -G"Visual Studio 10 Win64" -H".." -B"..\x64-opengl" -C"x64_CacheInit.txt" -DWITH_OPENGL=ON -DBUILD_MAPEDITOR=ON -DBUILD_ANIMVIEWER=ON
cmake -G"Visual Studio 10 Win64" -H".." -B"..\x64-opengl" -C"x64_CacheInit.txt" -DWITH_OPENGL=ON -DBUILD_MAPEDITOR=ON -DBUILD_ANIMVIEWER=ON

msbuild.exe ..\x64-opengl\CorsixTH\CorsixTH.vcxproj /t:Rebuild /p:Configuration=Release;TargetName=CorsixTH_OpenGL
msbuild.exe ..\x64-opengl\AnimView\AnimView.vcxproj /t:Rebuild /p:Configuration=Release
msbuild.exe ..\x64-opengl\MapEdit\MapEdit.vcxproj /t:Rebuild /p:Configuration=Release

:SDLx86
cmake -G"Visual Studio 10" -H".." -B"..\x86-sdl" -C"x86_CacheInit.txt" -DWITH_SDL=ON
msbuild.exe ..\x86-sdl\CorsixTH\CorsixTH.vcxproj /t:Rebuild /p:Configuration=Release;TargetName=CorsixTH_SDL

:SDLx64
cmake -G"Visual Studio 10 Win64" -H".." -B"..\x64-sdl" -C"x64_CacheInit.txt" -DWITH_SDL=ON
msbuild.exe ..\x64-sdl\CorsixTH\CorsixTH.vcxproj /t:Rebuild /p:Configuration=Release;TargetName=CorsixTH_SDL

:DirectXx86
cmake -G"Visual Studio 10" -H".." -B"..\x86-directx" -C"x86_CacheInit.txt" -DWITH_DIRECTX=ON
msbuild.exe ..\x86-directx\CorsixTH\CorsixTH.vcxproj /t:Rebuild /p:Configuration=Release;TargetName=CorsixTH_DirectX

:DirectXx64
cmake -G"Visual Studio 10 Win64" -H".." -B"..\x64-directx" -C"x64_CacheInit.txt" -DWITH_DIRECTX=ON
msbuild.exe ..\x64-directx\CorsixTH\CorsixTH.vcxproj /t:Rebuild /p:Configuration=Release;TargetName=CorsixTH_DirectX

:x86Dlls
mkdir ..\x86dlls
copy C:\Libraries\wxWidgets-2.9.4\lib\vc100_dll\wxmsw294u_gl_vc100.dll ..\x86dlls\
copy C:\Libraries\wxWidgets-2.9.4\lib\vc100_dll\wxmsw294u_core_vc100.dll ..\x86dlls\
copy C:\Libraries\wxWidgets-2.9.4\lib\vc100_dll\wxbase294u_vc100.dll ..\x86dlls\
copy C:\Libraries\wxWidgets-2.9.4\lib\vc100_dll\wxmsw294u_ribbon_vc100.dll ..\x86dlls\
copy C:\Libraries\SDL-1.2.15\lib\x86\SDL.dll ..\x86dlls\
copy C:\Libraries\SDL_mixer-1.2.12\lib\x86\SDL_mixer.dll ..\x86dlls\
copy C:\Libraries\SDL_mixer-1.2.12\lib\x86\smpeg.dll ..\x86dlls\
copy C:\Libraries\ffmpeg-1.0.1-win32-dev\lib\avformat-54.dll ..\x86dlls\
copy C:\Libraries\ffmpeg-1.0.1-win32-dev\lib\avcodec-54.dll ..\x86dlls\
copy C:\Libraries\ffmpeg-1.0.1-win32-dev\lib\avutil-51.dll ..\x86dlls\
copy C:\Libraries\ffmpeg-1.0.1-win32-dev\lib\swscale-2.dll ..\x86dlls\
copy C:\Libraries\ffmpeg-1.0.1-win32-dev\lib\swresample-0.dll ..\x86dlls\
copy C:\Libraries\LuaJIT-2.0.2\x86\lua51.dll ..\x86dlls\
copy C:\Libraries\freetype-2.4.11\lib\x86\freetype2411.dll ..\x86dlls\

:x64Dlls
mkdir ..\x64dlls
copy C:\Libraries\wxWidgets-2.9.4\lib\vc100_x64_dll\wxmsw294u_gl_vc100_x64.dll ..\x64dlls\
copy C:\Libraries\wxWidgets-2.9.4\lib\vc100_x64_dll\wxmsw294u_core_vc100_x64.dll ..\x64dlls\
copy C:\Libraries\wxWidgets-2.9.4\lib\vc100_x64_dll\wxbase294u_vc100_x64.dll ..\x64dlls\
copy C:\Libraries\wxWidgets-2.9.4\lib\vc100_x64_dll\wxmsw294u_ribbon_vc100_x64.dll ..\x64dlls\
copy C:\Libraries\SDL-1.2.15\lib\x64\SDL.dll ..\x64dlls\
copy C:\Libraries\SDL_mixer-1.2.12\lib\x64\SDL_mixer.dll ..\x64dlls\
copy C:\Libraries\SDL_mixer-1.2.12\lib\x64\smpeg.dll ..\x64dlls\
copy C:\Libraries\ffmpeg-1.0.1-win64-dev\lib\avformat-54.dll ..\x64dlls\
copy C:\Libraries\ffmpeg-1.0.1-win64-dev\lib\avcodec-54.dll ..\x64dlls\
copy C:\Libraries\ffmpeg-1.0.1-win64-dev\lib\avutil-51.dll ..\x64dlls\
copy C:\Libraries\ffmpeg-1.0.1-win64-dev\lib\swscale-2.dll ..\x64dlls\
copy C:\Libraries\ffmpeg-1.0.1-win64-dev\lib\swresample-0.dll ..\x64dlls\
copy C:\Libraries\LuaJIT-2.0.2\x64\lua51.dll ..\x64dlls\
copy C:\Libraries\freetype-2.4.11\lib\x64\freetype2411.dll ..\x64dlls\

:Copy2Installer
mkdir .\x86
copy ..\x86dlls\* .\x86\
copy ..\x86-opengl\CorsixTH\Release\CorsixTH_OpenGL.exe .\x86\
copy ..\x86-opengl\AnimView\Release\AnimView.exe .\x86\
copy ..\x86-opengl\MapEdit\Release\MapEdit.exe .\x86\
copy ..\x86-sdl\CorsixTH\Release\CorsixTH_SDL.exe .\x86\
copy ..\x86-directx\CorsixTH\Release\CorsixTH_DirectX.exe .\x86\
mkdir .\x86\Src
mkdir .\x86\Src\shaders
copy ..\CorsixTH\Src\shaders\* .\x86\Src\shaders\

mkdir .\x64
copy ..\x64dlls\* .\x64\
copy ..\x64-opengl\CorsixTH\Release\CorsixTH_OpenGL.exe .\x64\
copy ..\x64-opengl\AnimView\Release\AnimView.exe .\x64\
copy ..\x64-opengl\MapEdit\Release\MapEdit.exe .\x64\
copy ..\x64-sdl\CorsixTH\Release\CorsixTH_SDL.exe .\x64\
copy ..\x64-directx\CorsixTH\Release\CorsixTH_DirectX.exe .\x64\
mkdir .\x64\Src
mkdir .\x64\Src\shaders
copy ..\CorsixTH\Src\shaders\* .\x64\Src\shaders\
