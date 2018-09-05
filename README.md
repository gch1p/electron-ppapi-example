# electron-ppapi-example

Пример Pepper Plugin (PPAPI) для Electron (Chromium), который рисует вращающийся куб на OpenGL (GLES2).

### Linux

Нужен wget, gcc (g++) и python 2.7.
```
./setup-linux.sh
./build-linux.sh
./run-linux.sh
```

### macOS
Тоже нужен wget, g++ (наверное, это Xcode устанавливает /usr/bin/g++) и python 2.7.
```
./setup-macos.sh
./build-macos.sh
./run-macos.sh
```

### Windows
- Нужен git, bash (я ставил отсюда https://git-scm.com/download/win и там сразу и то и другое), curl, Visual Studio.
- `./setup-win.sh`
- Затем открыть nacl_sdk/pepper_49/include/win/pthread.h и после `#define PTHREAD_H` добавить `#define HAVE_STRUCT_TIMESPEC`.
- Открыть solution в VS, убедиться что стоит Release и x86 и запустить сборку. 
  - Если ругается на несовпадение версий, пересобрать либу тем же компилятором, для этого открыть "Developer Command Prompt" вашей версии VS, зайти в nacl_sdk/pepper_49/src и сделать `make TOOLCHAIN=win PROJECTS="ppapi ppapi_cpp ppapi_gles2 pthreads"`. Если завершается без сборки, надо руками удалить объектники из nacl_sdk/pepper_49/src/{$project}/win. Если либа не создается в nacl_sdk/pepper_49/lib/win_x86_32_host или создается в другом месте, проверить, что переменная `NACL_SDK_ROOT` указывает на правильную папку (nacl_sdk/pepper_49).
- Когда все готово, запустить `.\electron32\electron.exe .` и магия должна случиться.

Это про 32-х битный плагин. x64 что-то пока плохо работает (зависает при запуске).
