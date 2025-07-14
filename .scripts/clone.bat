@echo off
chcp 65001
setlocal

set REPO_URL=git@github.com:khetaghub/obsidian-vault.git
set REPO_DIR=obsidian-vault

:: Проверка Git
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo Ошибка: Git не установлен или не добавлен в PATH.
    pause
    exit /b 1
)

if exist "%REPO_DIR%" (
    echo Ошибка: Папка "%REPO_DIR%" уже существует.
    pause
    exit /b 1
)

echo Клонирование репозитория...
git clone --quiet %REPO_URL% %REPO_DIR%
if %errorlevel% neq 0 (
    echo Ошибка при клонировании.
    pause
    exit /b 1
)

echo Репозиторий успешно склонирован в "%REPO_DIR%".
pause