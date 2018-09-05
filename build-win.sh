#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CC=$DIR/nacl_sdk/pepper_49/toolchain/win_x86_glibc/bin/x86_64-nacl-g++.exe

cd $DIR

$CC spinning_cube.c hello.cc \
    -shared -o libppapi_hello.ldd \
    -I$DIR/nacl_sdk/pepper_49/include \
    -L$DIR/nacl_sdk/pepper_49/lib/win_x86_64_host/Release \
    -lppapi_cpp \
    -lppapi \
    -lppapi_simple \
    -lpthread \
    -lm \
    -lppapi_gles2 \
    -Wall -fPIC
