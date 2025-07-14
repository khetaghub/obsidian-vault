@echo off
chcp 65001 >nul
setlocal

:: Конфигурация
set REPO_DIR=../.
set COMMIT_MSG="Update: %date% %time:~0,8%"

:: Проверка наличия Git
where git >nul 2>&1 || (
    echo Ошибка: Git не установлен или не добавлен в PATH
    pause
    exit /b 1
)

:: Проверка существования директории репозитория
if not exist "%REPO_DIR%\" (
    echo Ошибка: Папка репозитория не найдена
    pause
    exit /b 1
)

:: Переход в директорию репозитория
cd /d "%REPO_DIR%" || (
    echo Ошибка перехода в папку репозитория
    pause
    exit /b 1
)

:: Проверка наличия изменений
git diff --quiet --exit-code 2>nul && git diff --cached --quiet --exit-code 2>nul && (
    echo Рабочая директория чиста. Нет изменений для коммита.
    pause
    exit /b 0
)

:: Выполнение git-операций
echo Добавляем изменения...
git add --all >nul 2>&1

echo Создаём коммит...
git commit -m %COMMIT_MSG% >nul 2>&1

echo Отправляем изменения...
git push >nul 2>&1 && (
    echo Успешно залито в GitHub!
) || (
    echo Ошибка при отправке изменений
)

pause