#!/bin/bash

REPO_URL="git@github.com:khetaghub/obsidian-vault.git"
REPO_DIR="obsidian-vault"

# Проверка Git
if ! command -v git &> /dev/null; then
    echo "Ошибка: Git не установлен или не добавлен в PATH."
    read -p "Нажмите Enter для продолжения..."
    exit 1
fi

if [ -d "$REPO_DIR" ]; then
    echo "Ошибка: Папка '$REPO_DIR' уже существует."
    read -p "Нажмите Enter для продолжения..."
    exit 1
fi

echo "Клонирование репозитория..."
git clone --quiet "$REPO_URL" "$REPO_DIR"
if [ $? -ne 0 ]; then
    echo "Ошибка при клонировании."
    read -p "Нажмите Enter для продолжения..."
    exit 1
fi

echo "Репозиторий успешно склонирован в '$REPO_DIR'."
read -p "Нажмите Enter для продолжения..."