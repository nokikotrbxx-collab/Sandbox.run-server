@echo off
SETLOCAL

echo [*] Проверяем наличие Chrome...
where chrome >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    echo [!] Chrome не найден. Скачиваем и устанавливаем...
    powershell -Command "Start-Process 'https://dl.google.com/chrome/install/latest/chrome_installer.exe' -Wait"
) ELSE (
    echo [+] Chrome уже установлен.
)

echo [*] Скачиваем Chrome Remote Desktop Host...
powershell -Command "Invoke-WebRequest -Uri 'https://dl.google.com/chrome-remote-desktop/chrome-remote-desktop.msi' -OutFile 'chrome-remote-desktop.msi'"

echo [*] Устанавливаем Chrome Remote Desktop Host...
msiexec /i chrome-remote-desktop.msi /quiet /norestart

echo [+] Установка завершена!
echo [*] Настрой удаленный доступ через Google Chrome Remote Desktop:
echo     https://remotedesktop.google.com/access/
echo [*] Придумай PIN для подключения и используй свой Google аккаунт.
echo Готово!
ENDLOCAL
