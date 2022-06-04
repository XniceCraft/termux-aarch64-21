# Termux Package for Aarch64 Android 5 (21)
These packages are compiled with Clang 5.0 (NDK r15c).

<img src="https://img.shields.io/badge/Clang-5.0-informational?style=for-the-badge&logo=llvm">

```
Note : Clang 5.0 sysroot lib(libc.a libc.so libm.so libm.a libdl.so) replaced with the NDK r10e one and used gnustl.
To avoid DT_VERSYM, DT_VERNEED, etc warning
```

# Compiler Flags
```
PKG_CONFIG_LIBDIR=/data/data/com.termux/files/usr/lib/pkgconfig \
TOOLCHAIN=/home/android-toolchain-r15c \
CC=${TOOLCHAIN}/bin/aarch64-linux-android-clang \
CXX=${TOOLCHAIN}/bin/aarch64-linux-android-clang++ \
CPP=${TOOLCHAIN}/bin/aarch64-linux-android-cpp \
AS=${CC} \
AR=${TOOLCHAIN}/bin/llvm-ar \
LD=${TOOLCHAIN}/bin/aarch64-linux-android-ld \
NM=${TOOLCHAIN}/bin/aarch64-linux-android-nm \
OBJCOPY=${TOOLCHAIN}/bin/aarch64-linux-android-objcopy \
OBJDUMP=${TOOLCHAIN}/bin/aarch64-linux-android-objdump \
STRIP=${TOOLCHAIN}/bin/aarch64-linux-android-strip \
RANLIB=${TOOLCHAIN}/bin/aarch64-linux-android-ranlib \
GCOV=${TOOLCHAIN}/bin/aarch64-linux-android-gcov \
ADDR2LINE=${TOOLCHAIN}/bin/aarch64-linux-android-addr2line \
DWP=${TOOLCHAIN}/bin/aarch64-linux-android-dwp \
READELF=${TOOLCHAIN}/bin/aarch64-linux-android-readelf \
SIZE=${TOOLCHAIN}/bin/aarch64-linux-android-size \
STRINGS=${TOOLCHAIN}/bin/aarch64-linux-android-strings \
GPROF=${TOOLCHAIN}/bin/aarch64-linux-android-gprof \
ELFEDIT=${TOOLCHAIN}/bin/aarch64-linux-android-elfedit \
CFLAGS="-march=armv8-a+simd -mtune=cortex-a53 -mcpu=cortex-a53 -fPIE -fPIC -O2 -ffast-math -mlittle-endian -fassociative-math -mfix-cortex-a53-835769 -fstack-protector-strong " \
LDFLAGS="-pie -L/data/data/com.termux/files/usr/lib -Wl,--as-needed -Wl,-z,relro,-z,now " \
CXXFLAGS="${CFLAGS} -I/data/data/com.termux/files/usr/include " \
CPPFLAGS="${CFLAGS}-I/data/data/com.termux/files/usr/include " \
```

# Info (obtained from termux_step_setup_toolchain.sh)
libintl.h: Inline implementation gettext functions.
langinfo.h: Inline implementation of nl_langinfo().
Remove <sys/capability.h> because it is provided by libcap.
Remove <sys/shm.h> from the NDK in favour of that from the libandroid-shmem.
Remove <sys/sem.h> as it doesn't work for non-root.
Remove <glob.h> as we currently provide it from libandroid-glob.
Remove <iconv.h> as it's provided by libiconv.
Remove <zlib.h> and <zconf.h> as we build our own zlib.

# Credit :<br>
@termux for packages patch (https://github.com/termux/termux-packages)
