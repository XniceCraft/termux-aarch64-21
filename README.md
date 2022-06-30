# Termux Packages for Aarch64 Android 5 (21)
### About
This repository provide termux packages for Aarch64 Android 5 that aren't maintained anymore with official termux apt. This repository is open source.

<img src="https://img.shields.io/badge/Clang-14-informational?style=for-the-badge&logo=llvm">

### Toolchain Download
Gdrive : https://drive.google.com/file/d/1UIgXaRwsQT6wddB981H8vkKgZIyAOMy0 (Linux Only)

### Upcoming Update
- Rebuild packages that compiled with Clang 5.0.

### Packages still aren't recompiled
- fdkaac
- flac
- iconv
- libfdk-aac
- libflac
- libiconv
- libjpeg
- libjpeg-turbo
- libmad
- libvorbis

### Toolchain Changelog
- Removing x86_64-linux-android i686-linux-android arm-linux-androideabi and aarch64-linux-android23-32 toolchains to decrease size
- Remove share and test folder to decrease size.
- Move original lld binary to bin/old folder.
- Using elf.h linux/elf.h linux/elf-em.h linux/elf-fdpic.h from ndk r15c instead from the r24 one. (The old one are renamed with .orig suffix)
- Replace crtbegin_so.o, crtbegin_static.o, crtend_android.o, crtend_so.o, libc.a, libc.so, libdl.so, libm.a, libm.so with the ndk r10e one. (To avoid versioned symbol warning)
- Replace libstdc++.a, libstdc++.so with the ndk r14b.
- Replace ndk r24 ld.lld with ld.lld from ndk r18b. (To avoid unsupported DT_FLAGS_1)
- Replace sysroot/usr/lib/aarch64-linux-android/(libc.a, libm.a, libdl.a) with the api 21 one.
- Symlink sysroot/usr/lib/aarch64-linux-android/22 to sysroot/usr/lib/aarch64-linux-android/21

### Compiler Flags
```
PKG_CONFIG_LIBDIR=/data/data/com.termux/files/usr/lib/pkgconfig \
TOOLCHAIN=/home/r24 \
CC=${TOOLCHAIN}/bin/aarch64-linux-android21-clang \
CXX=${TOOLCHAIN}/bin/aarch64-linux-android21-clang++ \
CPP=${TOOLCHAIN}/bin/aarch64-linux-android21-cpp \
AS=${CC} \
ADDR2LINE=${TOOLCHAIN}/bin/llvm-addr2line \
AR=${TOOLCHAIN}/bin/llvm-ar \
DWP=${TOOLCHAIN}/bin/llvm-dwp \
GCOV=${TOOLCHAIN}/bin/llvm-cov \
GPROF=${TOOLCHAIN}/bin/llvm-profdata \
LD=${TOOLCHAIN}/bin/ld.lld \
NM=${TOOLCHAIN}/bin/llvm-nm \
OBJCOPY=${TOOLCHAIN}/bin/llvm-objcopy \
OBJDUMP=${TOOLCHAIN}/bin/llvm-objdump \
STRIP=${TOOLCHAIN}/bin/llvm-strip \
RANLIB=${TOOLCHAIN}/bin/llvm-ranlib \
READELF=${TOOLCHAIN}/bin/llvm-readelf \
SIZE=${TOOLCHAIN}/bin/llvm-size \
STRINGS=${TOOLCHAIN}/bin/llvm-strings \
CFLAGS="-march=armv8-a+simd -mtune=cortex-a53 -mcpu=cortex-a53 -fPIE -fPIC -O2 -ffast-math -mlittle-endian -fassociative-math -mfix-cortex-a53-835769 -fstack-protector-strong -fuse-ld=lld -Wno-unused-command-line-argument " \
LDFLAGS="-pie -L/data/data/com.termux/files/usr/lib -Wl,--as-needed -Wl,-z,relro,-z,now -Wl,--hash-style=sysv " \
CXXFLAGS="${CFLAGS}" \
CPPFLAGS="-I/data/data/com.termux/files/usr/include " \
```

### Info (obtained from termux_step_setup_toolchain.sh)
```
libintl.h: Inline implementation gettext functions.
langinfo.h: Inline implementation of nl_langinfo().
Remove <sys/capability.h> because it is provided by libcap.
Remove <sys/shm.h> from the NDK in favour of that from the libandroid-shmem.
Remove <sys/sem.h> as it doesn't work for non-root.
Remove <glob.h> as we currently provide it from libandroid-glob.
Remove <iconv.h> as it's provided by libiconv.
Remove <spawn.h> as it's only for future (later than android-27).
Remove <zlib.h> and <zconf.h> as we build our own zlib.
Remove unicode headers provided by libicu.
Remove KRH/khrplatform.h provided by mesa.
```

### Credit :<br>
- <a href="https://github.com/termux/termux-packages">@termux</a> for packages patch.
- <a href="https://source.android.com">AOSP</a> for ndk r24 toolchain.
