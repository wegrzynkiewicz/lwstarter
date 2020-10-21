#!/usr/bin/env bash

qwe-hexadecimal-to-decimal () {
   echo "obase=10; ibase=16; ${@:1}" | bc
}

qwe-hexadecimal-to-binary () {
   echo "obase=2; ibase=16; ${@:1}" | bc
}

qwe-binary-to-decimal () {
   echo "obase=10; ibase=2; ${@:1}" | bc
}

qwe-binary-to-hexadecimal () {
   echo "obase=16; ibase=2; ${@:1}" | bc
}

qwe-decimal-to-hexadecimal () {
   echo "obase=16; ibase=10; ${@:1}" | bc
}

qwe-decimal-to-binary () {
   echo "obase=2; ibase=10; ${@:1}" | bc
}

