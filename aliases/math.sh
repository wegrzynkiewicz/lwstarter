#!/usr/bin/env bash

qwe-bc-hexadecimal-to-decimal () {
   echo "obase=10; ibase=16; ${@:1}" | bc
}

qwe-bc-hexadecimal-to-binary () {
   echo "obase=2; ibase=16; ${@:1}" | bc
}

qwe-bc-binary-to-decimal () {
   echo "obase=10; ibase=2; ${@:1}" | bc
}

qwe-bc-binary-to-hexadecimal () {
   echo "obase=16; ibase=2; ${@:1}" | bc
}

qwe-bc-decimal-to-hexadecimal () {
   echo "obase=16; ibase=10; ${@:1}" | bc
}

qwe-bc-decimal-to-binary () {
   echo "obase=2; ibase=10; ${@:1}" | bc
}

