#!/bin/bash

# Конфигурация
REPO_DIR="./."
COMMIT_MSG="Update: $(date '+%Y-%m-%d %H:%M:%S')"

# Проверка наличия Git
if ! command -v git &> /dev/null; then
    echo "Ошибка: Git не установлен или не добавлен в PATH."
    read -p "Нажмите Enter для продолжения..."
    exit 1
fi

# Проверка существования директории репозитория
if [ ! -d "$REPO_DIR" ]; then
    echo "Ошибка: Папка репозитория не найдена."
    read -p "Нажмите Enter для продолжения..."
    exit 1
fi

# Переход в директорию репозитория
cd "$REPO_DIR" || {
    echo "Ошибка перехода в папку репозитория."
    read -p "Нажмите Enter для продолжения..."
    exit 1
}
echo "Текущая директория: `pwd`"

# Улучшенная проверка изменений (включая новые файлы)
if [ -z "$(git status --porcelain)" ]; then
    echo "Нет изменений."
    read -p "Нажмите Enter для продолжения..."
    exit 0
fi

# Выполнение git-операций
echo "Добавляем изменения..."
git add --all >/dev/null 2>&1

echo "Создаём коммит..."
git commit -m "$COMMIT_MSG" >/dev/null 2>&1

echo "Отправляем изменения..."
if git push >/dev/null 2>&1; then
    echo "Успешно залито в GitHub!"
else
    echo "Ошибка при отправке изменений."
fi

read -p "Нажмите Enter для продолжения..."