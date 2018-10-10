echo off
set NASM=D:/Tools/Development/yasm/yasm-1.3.0-win64.exe
rem cmake .. -G "Visual Studio 15 2017 Win64" -DCMAKE_ASM_NASM_COMPILER=%NASM%

call :CompileASM fipsmodule, aesni-gcm-x86_64
call :CompileASM fipsmodule, aesni-x86_64
call :CompileASM fipsmodule, aes-x86_64
call :CompileASM fipsmodule, bsaes-x86_64
call :CompileASM fipsmodule, ghash-x86_64
call :CompileASM fipsmodule, md5-x86_64
call :CompileASM fipsmodule, p256-x86_64-asm
call :CompileASM fipsmodule, rdrand-x86_64
call :CompileASM fipsmodule, rsaz-avx2
call :CompileASM fipsmodule, sha1-x86_64
call :CompileASM fipsmodule, sha256-x86_64
call :CompileASM fipsmodule, sha512-x86_64
call :CompileASM fipsmodule, vpaes-x86_64
call :CompileASM fipsmodule, x86_64-mont5
call :CompileASM fipsmodule, x86_64-mont
call :CompileASM cipher_extra, aes128gcmsiv-x86_64
call :CompileASM cipher_extra, chacha20_poly1305_x86_64
call :CompileASM chacha, chacha-x86_64


exit /b 0

:CompileASM
echo "Compile %1/%2.asm"
%NASM% -f win64 crypto/%1/%2.asm -o crypto/%1/%1.dir/Debug/%2.obj
%NASM% -f win64 crypto/%1/%2.asm -o crypto/%1/%1.dir/Release/%2.obj
goto:eof