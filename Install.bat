@echo off
REM Проверка установки Chrome
where chrome >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    echo Chrome не найден. Скачиваем и устанавливаем...
    powershell -Command "Start-Process 'https://dl.google.com/chrome/install/latest/chrome_installer.exe' -Wait"
) ELSE (
    echo Chrome уже установлен.
)

REM Скачиваем Chrome Remote Desktop Host
echo Скачиваем Chrome Remote Desktop Host...
powershell -Command "Invoke-WebRequest -Uri 'https://dl.google.com/chrome-remote-desktop/chrome-remote-desktop.msi' -OutFile 'chrome-remote-desktop.msi'"

echo Устанавливаем Chrome Remote Desktop Host...
msiexec /i chrome-remote-desktop.msi /quiet /norestart

echo Установка завершена. Настрой удаленный доступ через:
echo https://remotedesktop.google.com/access/
pause
