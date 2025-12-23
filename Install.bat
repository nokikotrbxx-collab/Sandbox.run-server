@echo off
SETLOCAL

REM --- Папка для логов ---
if not exist logs (
    mkdir logs
)

echo [*] Проверяем наличие Chrome...
where chrome >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    echo [!] Chrome не найден. Пропускаем установку Chrome (нельзя GUI на Actions)
) ELSE (
    echo [+] Chrome установлен
)

echo [*] Скачиваем Chrome Remote Desktop Host...
powershell -Command "Invoke-WebRequest -Uri 'https://dl.google.com/chrome-remote-desktop/chrome-remote-desktop.msi' -OutFile 'chrome-remote-desktop.msi'"

echo [*] Устанавливаем Chrome Remote Desktop Host в silent режиме...
msiexec /i chrome-remote-desktop.msi /quiet /qn /norestart /l*v logs/crd_install.log

echo [+] Установка CRD завершена (silent mode)
echo [*] Логи установки доступны в logs/crd_install.log
echo [*] Настройка удаленного доступа должна быть выполнена вручную на локальной машине.
ENDLOCAL
