#!/bin/bash
# use SDL 2.0.6 because commit e8c1446 in 2.0.7 broke mac audio, at least for Boxedwine
gcc -std=c++11 -Wall -Wno-invalid-offsetof -Wno-unused-local-typedef -Wno-unused-private-field -Wno-unused-variable -Wno-parentheses-equality -Wno-unused-function -I../../include -I../../lib/glew/include -I../../lib/imgui ../../lib/imgui/imgui.cpp ../../lib/imgui/imgui_draw.cpp ../../lib/imgui/imgui_widgets.cpp ../../lib/imgui/examples/imgui_impl_opengl3.cpp ../../lib/imgui/examples/imgui_impl_sdl.cpp ../../lib/imgui/addon/imguitinyfiledialogs.cpp ../../source/sdl/*.cpp ../../source/sdl/multiThreaded/*.cpp ../../lib/glew/src/glew.cpp ../../source/ui/*.cpp ../../source/ui/controls/*.cpp ../../source/ui/data/*.cpp ../../source/ui/opengl/*.cpp ../../source/ui/utils/*.cpp ../../platform/linux/*.cpp ../../source/emulation/cpu/*.cpp ../../source/emulation/cpu/common/*.cpp ../../source/emulation/cpu/normal/*.cpp ../../source/emulation/cpu/x64/*.cpp ../../source/emulation/hardmmu/*.cpp ../../source/emulation/softmmu/*.cpp ../../source/io/*.cpp ../../source/kernel/*.cpp ../../source/kernel/devs/*.cpp ../../source/kernel/proc/*.cpp ../../source/kernel/sys/*.cpp ../../source/kernel/loader/*.cpp ../../source/util/*.cpp ../../source/opengl/sdl/*.cpp ../../source/opengl/*.cpp -o boxedwine64 -lm -lz -lc++ -DSIMDE_NO_NATIVE -DBOXEDWINE_RECORDER -DBOXEDWINE_HAS_SETJMP -DBOXEDWINE_64 -DBOXEDWINE_ZLIB -DSDL2=1 -DBOXEDWINE_64BIT_MMU -DBOXEDWINE_X64 -DBOXEDWINE_MULTI_THREADED "-DGLH=<SDL_opengl.h>" -DBOXEDWINE_OPENGL_SDL -DBOXEDWINE_GLHANDLE_ARB_POINTER -I../../lib/mac/sdlMac2.0.6/SDL2.framework/Headers -O2 -framework OpenGL -D_THREAD_SAFE -L../../lib/mac/precompiledMac -lSDL2main -lSDL2 -liconv -lminizip -framework ForceFeedback -framework Cocoa -framework Carbon -framework IOKit -framework CoreAudio -framework AudioToolbox -framework AudioUnit -framework CoreVideo
#../../lib/zlib/contrib/minizip/ioapi.c ../../lib/zlib/contrib/minizip/mztools.c ../../lib/zlib/contrib/minizip/unzip.c
