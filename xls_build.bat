@echo off
set curdir=%cd%

if not exist %cd%\pb\ md %cd%\pb\
call %cd%\proto\protoc -I=%cd%\src\ --cpp_out=pb %cd%\src\enum.proto

if not exist %cd%\py\ md %cd%\py\
call %cd%\proto\protoc -I=%cd%\src\ --python_out=py %cd%\src\enum.proto

for /f "delims=\" %%f in ('dir /b /a-d /o-d "%curdir%\xls\*.xls"') do (
		call python %curdir%\deploy\xls_deploy.py %curdir%\xls\%%f
	)
pause