@echo off
chcp 65001
setlocal

set REPO_DIR=../.

:: Проверка Git
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo Ошибка: Git не установлен или не добавлен в PATH.
    pause
    exit /b 1
)

if not exist "%REPO_DIR%" (
    echo Ошибка: Папка "%REPO_DIR%" не найдена. Сначала запустите clone_repo.bat.
    pause
    exit /b 1
)

cd %REPO_DIR%
echo Пуллим изменения из удалённого репозитория...
git pull --quiet
if %errorlevel% neq 0 (
    echo Ошибка при пулле.
    pause
    exit /b 1
)

echo Успешно обновлено.
cd ..
pause