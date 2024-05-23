#!/bin/bash
mkdir -p bin
sh buildPocoLib.sh
# the minizip stuff will give warnings about mixing c and cpp file, probably time to move to build program like cmake
gcc -std=c++17 -O2 -no-pie \
  -Wall \
  -Wno-delete-incomplete \
  -Wno-invalid-offsetof \
  -Wno-unused-result \
  -Wno-unknown-pragmas \
  -Wno-unused-local-typedefs \
  -Wno-unused-variable \
  -Wno-unused-function \
  -Wno-unused-but-set-variable \
  -I../../include \
  -I../../lib/glew/include \
  -I../../lib/imgui \
  ../../lib/imgui/imgui.cpp \
  ../../lib/pugixml/src/*.cpp \
  ../../lib/imgui/imgui_draw.cpp \
  ../../lib/imgui/imgui_widgets.cpp \
  ../../lib/imgui/examples/imgui_impl_opengl2.cpp \
  ../../lib/imgui/examples/imgui_impl_sdl.cpp \
  ../../lib/imgui/addon/imguitinyfiledialogs.cpp \
  ../../source/sdl/*.cpp \
  ../../source/sdl/multiThreaded/*.cpp \
  ../../lib/glew/src/glew.cpp \
  ../../source/ui/*.cpp \
  ../../source/ui/controls/*.cpp \
  ../../source/ui/data/*.cpp \
  ../../source/ui/opengl/*.cpp \
  ../../source/ui/utils/*.cpp \
  ../../platform/sdl/*.cpp \
  ../../platform/linux/*.cpp \
  ../../source/emulation/cpu/*.cpp \
  ../../source/emulation/cpu/common/*.cpp \
  ../../source/emulation/cpu/normal/*.cpp \
  ../../source/emulation/cpu/x64/*.cpp \
  ../../source/emulation/cpu/binaryTranslation/*.cpp \
  ../../source/emulation/hardmmu/*.cpp \
  ../../source/emulation/softmmu/*.cpp \
  ../../source/io/*.cpp \
  ../../source/kernel/*.cpp \
  ../../source/kernel/devs/*.cpp \
  ../../source/kernel/proc/*.cpp \
  ../../source/kernel/sys/*.cpp \
  ../../source/kernel/loader/*.cpp \
  ../../source/util/*.cpp \
  ../../source/opengl/sdl/*.cpp \
  ../../source/opengl/*.cpp \
  ../../lib/zlib/contrib/minizip/ioapi.c \
  ../../lib/zlib/contrib/minizip/mztools.c \
  ../../lib/zlib/contrib/minizip/unzip.c \
  ../../lib/tiny-process/process.cpp \
  ../../lib/tiny-process/process_unix.cpp \
  -lcurl \
  -lssl \
  -lcrypto \
  -lpthread \
  -lm \
  -lz \
  -lGL \
  -lstdc++ \
  -lstdc++fs \
  -DBOXEDWINE_RECORDER \
  -DBOXEDWINE_ZLIB \
  -DSDL2=1 \
  "-DGLH=<SDL_opengl.h>" \
  -DBOXEDWINE_OPENGL_SDL \
  -Wl,-Bstatic \
  -lSDL2 \
  -Wl,-Bdynamic \
  `sdl2-config --cflags --static-libs` \
  -DSIMDE_SSE2_NO_NATIVE \
  -DBOXEDWINE_64 \
  -DBOXEDWINE_X64 \
  -DBOXEDWINE_MULTI_THREADED \
  -DBOXEDWINE_POSIX \
  -DBOXEDWINE_OPENGL_IMGUI_V2 \
  -DBOXEDWINE_BINARY_TRANSLATOR \
  -DBOXEDWINE_LINUX \
  -o bin/boxedwine64 
