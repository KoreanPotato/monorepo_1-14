#!/usr/bin/env python3
"""
Простое консольное приложение Hello World для Linux.
"""
import sys


def main():
    """
    Основная функция, которая выводит приветственное сообщение.
    Может принимать опциональный аргумент с именем.
    """
    if len(sys.argv) > 1:
        name = sys.argv[1]
        print(f"Привет, {name}!")
    else:
        print("Привет, мир!")


if __name__ == "__main__":
    main()
