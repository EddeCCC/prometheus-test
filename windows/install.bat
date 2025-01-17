@echo off

echo Checking for IIS installation...

:: Install IIS if it's not installed already
for /f "tokens=2 delims=:" %%I in ('dism /online /get-features ^| findstr /i "IIS-WebServerRole"') do set IISStatus=%%I
if /i "%IISStatus%" NEQ "Enabled" (
    echo IIS is not installed, installing now...
    dism /online /enable-feature /featurename:IIS-WebServerRole /all
    dism /online /enable-feature /featurename:IIS-WebServerManagementTools /all
) else (
    echo IIS is already installed
)

:: Start IIS if not already started
echo Starting IIS...
iisreset /start

echo IIS should be enabled and started

:: Check if windows_exporter.exe exists
if exist "%~dp0windows_exporter.exe" (
    echo Starting windows_exporter...

    :: Start the exporter
    sc create windows_exporter binPath= "%~dp0windows_exporter.exe --collectors.enabled iis,[defaults]"
    sc config windows_exporter start= auto
    sc start windows_exporter

    :: Check status
    sc query windows_exporter
) else (
    echo windows_exporter.exe not found
)

pause
