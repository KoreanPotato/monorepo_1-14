#!/bin/bash

# Переменные для SSH-подключения
SSH_HOST="100.114.136.8"  # IP-адрес или имя хоста
SSH_USER="sergey"         # Имя пользователя для SSH
SSH_PORT="22"             # SSH порт (обычно 22)
SSH_KEY="~/.ssh/id_rsa"   # Путь к приватному ключу (если используется)

# Переменные для Docker-контейнера
CONTAINER_NAME="web-app"     # Имя контейнера
IMAGE_NAME="web-ui:latest"   # Имя образа
PORT_MAPPING="8080:8080"     # Маппинг портов, например "8080:8080"
ENV_VARS="-e PORT=8080"      # Переменные окружения, например "-e PORT=8080"

# Путь к Dockerfile и приложению на удаленной машине
DOCKERFILE_PATH="/home/sergey/devops/web-ui.Dockerfile"
APP_PATH="/home/sergey/web-ui/src"

# Подключаемся к удаленной машине и выполняем команды
echo "Подключение к $SSH_HOST..."

ssh $SSH_USER@$SSH_HOST -p $SSH_PORT -i $SSH_KEY << 'EOF'
    echo "Подключение успешно. Настраиваем Docker контейнер..."
    
    # Переходим в директорию с приложением
    cd $APP_PATH
    
    # Останавливаем и удаляем существующий контейнер если он есть
    if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
        echo "Останавливаем существующий контейнер..."
        docker stop $CONTAINER_NAME
        docker rm $CONTAINER_NAME
    fi
    
    # Собираем Docker образ
    echo "Сборка Docker образа..."
    docker build -t $IMAGE_NAME -f $DOCKERFILE_PATH .
    
    # Запускаем новый контейнер
    echo "Запуск нового контейнера..."
    docker run -d --name $CONTAINER_NAME -p $PORT_MAPPING $ENV_VARS $IMAGE_NAME
    
    # Проверяем статус контейнера
    echo "Статус контейнера:"
    docker ps | grep $CONTAINER_NAME
    
    echo "Готово! Контейнер настроен и запущен."
EOF

echo "Скрипт выполнен."

#task 9
