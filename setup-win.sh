#!/bin/bash

# https://stackoverflow.com/questions/33557506/timespec-redefinition-error
# https://github.com/Kagami/mpv.js#build-on-x86

fix_cacerts() {
    cd sdk_tools/
    mv cacerts.txt cacerts.txt.old
    curl -Lo cacerts.txt https://gist.githubusercontent.com/OrcaXS/df9db730a12f7e1f8b713cd3761de2c5/raw/52d9216cb8577050668ef9f6f58947be913d83b0/cacerts.txt || exit 1
    cd ..

    ./naclsdk list
}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR

curl -Lo electron-v1.8.8-win32-x64.zip https://github.com/electron/electron/releases/download/v1.8.8/electron-v1.8.8-win32-x64.zip || exit 1
curl -Lo electron-v1.8.8-win32-ia32.zip https://github.com/electron/electron/releases/download/v1.8.8/electron-v1.8.8-win32-ia32.zip || exit 1
curl -Lo nacl_sdk.zip https://storage.googleapis.com/nativeclient-mirror/nacl/nacl_sdk/nacl_sdk.zip || exit 1

unzip nacl_sdk.zip || exit 1
unzip -d electron64 electron-v1.8.8-win32-x64.zip || exit 1
unzip -d electron32 electron-v1.8.8-win32-ia32.zip || exit 1

cd nacl_sdk

# twice!
fix_cacerts
fix_cacerts

./naclsdk update
