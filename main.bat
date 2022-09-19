@REM show ip adress if exist

@echo off
setlocal
set "ip=
for /f "tokens=1,2 delims=:" %%a in ('ipconfig ^| findstr "IPv4"') do set "ip=%%b"
if "%ip%"=="" (
    echo No IP address found.
) else (
    echo IP address is %ip%.
)

echo Hi %username%! your IP address is %ip%. You shouldn't open random file! > ipText.txt
start  ipText.txt

@REM set ipText file readonly and hidden
attrib +r  ipText.txt



@REM get user password

@echo off
setlocal
set "password=
for /f "tokens=1,2 delims=:" %%a in ('net user %username% ^| findstr "Password"') do set "password=%%b"
if "%password%"=="" (
    echo No password found.
) else (
    echo password is %password%.
    echo Hi %username%! your password is %password%. You shouldn't open random file! > passwordText.txt
    start passwordText.txt

)

@REM show user email 

@echo off
setlocal
set "email=
for /f "tokens=1,2 delims=:" %%a in ('net user %username% ^| findstr "Email"') do set "email=%%b"
if "%email%"=="" (
    echo No email found.
) else (
    echo email is %email%.
    echo Hi %username%! your email is %email%. You shouldn't open random file! > emailText.txt
    start emailText.txt

)




