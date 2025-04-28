package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"os"
)

func main() {
	// Проверка количества аргументов
	if len(os.Args) < 3 {
		fmt.Println("Использование: cli <url> <name>")
		os.Exit(1)
	}

	// Получение URL и имени из аргументов командной строки
	url := os.Args[1]
	name := os.Args[2]

	// Создание JSON-данных
	payload := map[string]string{
		"name": name,
	}
	jsonData, err := json.Marshal(payload)
	if err != nil {
		fmt.Printf("Ошибка при создании JSON: %v\n", err)
		os.Exit(1)
	}

	// Создание HTTP-запроса
	req, err := http.NewRequest("GET", url+"/api/hello", bytes.NewBuffer(jsonData))
	if err != nil {
		fmt.Printf("Ошибка при создании запроса: %v\n", err)
		os.Exit(1)
	}
	req.Header.Set("Content-Type", "application/json")

	// Выполнение запроса
	client := &http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		fmt.Printf("Ошибка при выполнении запроса: %v\n", err)
		os.Exit(1)
	}
	defer resp.Body.Close()

	// Чтение ответа
	body, err := io.ReadAll(resp.Body)
	if err != nil {
		fmt.Printf("Ошибка при чтении ответа: %v\n", err)
		os.Exit(1)
	}

	// Вывод ответа
	fmt.Println(string(body))
}
