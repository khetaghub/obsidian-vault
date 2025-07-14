@echo off
chcp 65001 >nul
setlocal

set REPO_DIR=../.

:: Форматируем дату и время без десятых секунды
for /f "tokens=1-3 delims=." %%a in ("%time%") do set CLEAN_TIME=%%a
set COMMIT_MSG="Update: %date% %CLEAN_TIME%"

:: Проверка Git
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo Ошибка: Git не установлен или не добавлен в PATH.
    pause
    exit /b 1
)

if not exist "%REPO_DIR%" (
    echo Ошибка: Папка "%REPO_DIR%" не найдена.
    pause
    exit /b 1
)

cd %REPO_DIR%

echo Добавляем все изменения...
git add --all

echo Коммитим: %COMMIT_MSG%
git commit -m %COMMIT_MSG% --quiet 2>nul
if %errorlevel% neq 0 (
    echo Нет изменений для коммита. Пропускаем.
    goto PUSH
)

:PUSH
echo Пушим...
git push --quiet
if %errorlevel% neq 0 (
    echo Ошибка при пуше.
    pause
    exit /b 1
)

echo Успешно залито в GitHub!
cd ..
pause