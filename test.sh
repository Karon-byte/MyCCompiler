#!/bin/bash
input="$1"
expected="$2"

if [ "$#" -lt 2 ]; then
    >&2 echo "The number of argument is not enough"
    exit 1
fi

assert(){
    expected="$1"
    input="$2"

    ./9cc "$input" > tmp.s
    gcc -o tmp tmp.s
    ./tmp
    actual="$?"

    if [ "$actual" = "$expected" ]; then
        echo "$input => $expected"
    else
        echo "$expected expected, but got $actual"
        exit 1
    fi
}

assert $input $expected

echo "OK"
