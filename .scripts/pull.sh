#!/bin/bash

REPO_DIR="./"

# Проверка Git
if ! command -v git &> /dev/null; then
    echo "Ошибка: Git не установлен или не добавлен в PATH."
    read -p "Нажмите Enter для продолжения..."
    exit 1
fi

# Проверка и переход в директорию репозитория
if [ ! -d "$REPO_DIR" ]; then
    echo "Ошибка: Папка репозитория не найдена"
    read -p "Нажмите Enter для продолжения..."
    exit 1
fi

cd "$REPO_DIR" || exit 1

# Основная операция
echo "Обновление..."
git pull --quiet --autostash 2>/dev/null

echo "Обновление завершено."

# Завершение
read -p "Нажмите Enter для продолжения..."