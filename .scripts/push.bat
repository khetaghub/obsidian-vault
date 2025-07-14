@echo off
chcp 65001
setlocal

set REPO_DIR=../.
set COMMIT_MSG="Update: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

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
echo Добавляем все изменения...
git add --all

echo Коммитим: %COMMIT_MSG%
git commit -m %COMMIT_MSG%
if %errorlevel% neq 0 (
    echo Нет изменений для коммита или ошибка.
    pause
    exit /b 1
)

echo Пушим...
git push
if %errorlevel% neq 0 (
    echo Ошибка при пуше.
    pause
    exit /b 1
)

echo Успешно залито в GitHub!
cd ..
pause