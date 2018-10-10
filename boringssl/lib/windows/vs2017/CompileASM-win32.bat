echo off
set NASM=D:/Tools/Development/yasm/yasm-1.3.0-win64.exe
rem cmake .. -G "Visual Studio 15" -DCMAKE_ASM_NASM_COMPILER=%NASM%

call :CompileASM fipsmodule, aes-586
call :CompileASM fipsmodule, aesni-x86
call :CompileASM fipsmodule, bn-586
call :CompileASM fipsmodule, co-586
call :CompileASM fipsmodule, ghash-x86
call :CompileASM fipsmodule, md5-586
call :CompileASM fipsmodule, sha1-586
call :CompileASM fipsmodule, sha256-586
call :CompileASM fipsmodule, sha512-586
call :CompileASM fipsmodule, vpaes-x86
call :CompileASM fipsmodule, x86-mont
call :CompileASM chacha, chacha-x86

exit /b 0

:CompileASM
echo "Compile %1/%2.asm"
%NASM% -f win32 crypto/%1/%2.asm -o crypto/%1/%1.dir/Debug/%2.obj
%NASM% -f win32 crypto/%1/%2.asm -o crypto/%1/%1.dir/Release/%2.obj
goto:eof