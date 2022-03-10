:: MSVC is preferred.
set CC=cl.exe
set CXX=cl.exe

mkdir build
cd build

cmake ^
    -G "Ninja" ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DBUILD_SHARED_LIBS=ON ^
    %SRC_DIR%
if errorlevel 1 exit 1

:: Install.
cmake --build . --config Release --target install
if errorlevel 1 exit 1

:: Add sdl.pc to support old pkg-config
:: See https://github.com/libsdl-org/sdl12-compat/issues/162
copy %LIBRARY_PREFIX%\lib\pkgconfig\sdl12_compat.pc %LIBRARY_PREFIX%\lib\pkgconfig\sdl.pc
if errorlevel 1 exit 1
