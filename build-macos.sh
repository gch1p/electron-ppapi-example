#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

g++ ./spinning_cube.c ./hello.cc \
    -shared -o libppapi_hello.so \
    -I$DIR/nacl_sdk/pepper_49/include \
    -L$DIR/nacl_sdk/pepper_49/lib/mac_host/Release \
    -lppapi_cpp \
    -lppapi \
    -lppapi_simple \
    -lpthread \
    -lm \
    -lppapi_gles2 \
    -Wall -fPIC 
