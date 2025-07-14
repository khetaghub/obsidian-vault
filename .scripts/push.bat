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

:: Проверяем есть ли изменения
git diff --quiet --exit-code 2>nul
set HAS_CHANGES=%errorlevel%

if %HAS_CHANGES% equ 0 (
    git diff --cached --quiet --exit-code 2>nul
    set HAS_CHANGES=%errorlevel%
)

if %HAS_CHANGES% equ 0 (
    echo Рабочая директория чиста. Нет изменений для коммита.
    goto END
)

echo Добавляем все изменения...
git add --all >nul 2>&1

echo Коммитим: %COMMIT_MSG%
git commit -m %COMMIT_MSG% >nul 2>&1

:PUSH
echo Пушим изменения...
git push >nul 2>&1
if %errorlevel% equ 0 (
    echo Успешно залито в GitHub!
) else (
    echo Ошибка при пуше изменений.
)

:END
pause