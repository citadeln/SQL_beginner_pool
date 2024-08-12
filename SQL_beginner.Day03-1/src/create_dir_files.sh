#!/bin/bash

echo "Tusk day?(format 00, 01, 02)"
read day
echo "How many folders create?(format 0, 1, 2)"
read number

for ((i=0; i<=number; i++)); do
    mkdir -p ex$(printf "%02d" $i)
done

for ((i=0; i<=number; i++)); do
    padded_i=$(printf "%02d" $i)
    touch "day${day}_ex${padded_i}.sql"
    mv "day${day}_ex${padded_i}.sql" ex${padded_i};
done
