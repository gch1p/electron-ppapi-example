#!/bin/bash

fix_cacerts() {
    cd sdk_tools/
    mv cacerts.txt cacerts.txt.old
    wget https://gist.githubusercontent.com/OrcaXS/df9db730a12f7e1f8b713cd3761de2c5/raw/52d9216cb8577050668ef9f6f58947be913d83b0/cacerts.txt
    cd ..

    ./naclsdk list   
}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR

wget https://github.com/electron/electron/releases/download/v1.8.8/electron-v1.8.8-linux-x64.zip
wget https://storage.googleapis.com/nativeclient-mirror/nacl/nacl_sdk/nacl_sdk.zip

unzip nacl_sdk.zip
unzip -d electron electron-v1.8.8-linux-x64.zip

cd nacl_sdk

# gentoo fix
export EPYTHON=python2.7

# twice
fix_cacerts
fix_cacerts

./naclsdk update
