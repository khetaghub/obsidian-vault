@echo off
chcp 65001 >nul
setlocal

set "REPO_DIR=../."

:: Проверка Git
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo Ошибка: Git не установлен или не добавлен в PATH.
    pause
    exit /b 1
)

:: Проверка и переход в директорию репозитория
if not exist "%REPO_DIR%\" (
    echo Ошибка: Папка репозитория не найдена
    pause
    exit /b 1
)

:: Основная операция
echo Обновление...
git pull --quiet --autostash 2>nul

echo Обновление завершено

:: Завершение
pause