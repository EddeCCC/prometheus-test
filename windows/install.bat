@echo off
:: Check if IIS is already installed
echo Checking for IIS installation...

:: Enable IIS features via DISM
dism /online /enable-feature /featurename:IIS-WebServerRole /all /norestart
dism /online /enable-feature /featurename:IIS-WebServerManagementTools /all /norestart

:: Install IIS if it's not installed already
for /f "tokens=2 delims=:" %%I in ('dism /online /get-features ^| findstr /i "IIS-WebServerRole"') do set IISStatus=%%I
if /i "%IISStatus%" NEQ "Enabled" (
    echo IIS is not installed, installing now...
    dism /online /enable-feature /featurename:IIS-WebServerRole /all
    dism /online /enable-feature /featurename:IIS-WebServerManagementTools /all
) else (
    echo IIS is already installed.
)

:: Start IIS if not already started
echo Starting IIS...
iisreset /start

:: Check IIS status and notify user
echo IIS should now be enabled and started.

:: Starting windows_exporter service
echo Starting windows_exporter service...

:: Check if windows_exporter.exe exists in the same folder as this batch script
if exist "%~dp0windows_exporter-0.30.0-amd64.exe" (
    echo Found windows_exporter.exe, creating the service...

    :: Create a new service for windows_exporter with IIS-collector
    sc create windows_exporter binPath= "%~dp0windows_exporter-0.30.0-amd64.exe -log.file event --collectors.enabled iis,[defaults]" start= auto
    sc start windows_exporter
    echo windows_exporter service started.
) else (
    echo windows_exporter.exe not found in the current folder. Make sure the file exists.
)

:: End of script
pause
