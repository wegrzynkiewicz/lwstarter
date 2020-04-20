#!/usr/bin/env bash

qweh2d () {
   echo "obase=10; ibase=16; ${@:1}" | bc
}

qweh2b () {
   echo "obase=2; ibase=16; ${@:1}" | bc
}

qweb2d () {
   echo "obase=10; ibase=2; ${@:1}" | bc
}

qweb2h () {
   echo "obase=16; ibase=2; ${@:1}" | bc
}

qwed2h () {
   echo "obase=16; ibase=10; ${@:1}" | bc
}

qwed2b () {
   echo "obase=2; ibase=10; ${@:1}" | bc
}

