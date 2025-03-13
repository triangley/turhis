@echo off
pushd %~dp0\..\
call vendor\premake\bin\windows-x86_64\premake5.exe vs2022
popd
pause
