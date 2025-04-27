#!/usr/bin/env python3
import sys


def main():
    
    if len(sys.argv) > 1:
        name = sys.argv[1]
        print(f"Привет, {name}!")
    else:
        print("Привет, мир!")


if __name__ == "__main__":
    main()

#Task 1