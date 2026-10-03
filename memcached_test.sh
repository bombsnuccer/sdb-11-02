#!/bin/bash
echo "=== Записываем ключ 'testkey' со значением 'hello' и TTL 5 секунд ==="
printf "set testkey 0 5 5\r\nhello\r\n" | nc -q 1 localhost 11211

echo ""
echo "=== Сразу читаем ключ (должен вернуть значение) ==="
printf "get testkey\r\n" | nc -q 1 localhost 11211

echo ""
echo "=== Ждем 6 секунд (TTL истекает) ==="
sleep 6

echo ""
echo "=== Читаем ключ снова (должен вернуть только END) ==="
printf "get testkey\r\n" | nc -q 1 localhost 11211
