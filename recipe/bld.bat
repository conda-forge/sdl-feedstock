setlocal EnableDelayedExpansion

:: Configure using the CMakeFiles!
cmake -S . -B build -G Ninja ^
	  -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
	  -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
	  -DCMAKE_BUILD_TYPE:STRING=Release
if errorlevel 1 exit 1

:: Build!
cmake --build build --config Release
if errorlevel 1 exit 1

:: Install!
cmake --install build --config Release --prefix "%LIBRARY_PREFIX%"
if errorlevel 1 exit 1

:: Add sdl.pc to support old pkg-config
:: See https://github.com/libsdl-org/sdl12-compat/issues/162 and
:: https://github.com/libsdl-org/sdl2-compat/issues/381
copy %LIBRARY_PREFIX%\lib\pkgconfig\sdl2_compat.pc %LIBRARY_PREFIX%\lib\pkgconfig\sdl2.pc