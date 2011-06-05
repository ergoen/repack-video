Here's how the libav dlls which are shipping with eac3to were compiled:

(1)
install TDM-GCC -> http://tdm-gcc.tdragon.net/
install MSYS    -> http://www.mingw.org/wiki/MSYS

(2)
create empty folder "c:\msys\home\ffmpeg"
svn checkout svn://svn.mplayerhq.hu/ffmpeg/trunk . -r 23802

(3)
copy "mlp_parser.c/h" and "mlpdec.c" to "c:\msys\home\ffmpeg\libavcodec\*.*"
apply patches "dca.patch" and "ac3dec.patch"

(4)
start msys
cd ../ffmpeg
configure --enable-shared --disable-static --enable-memalign-hack

(5)
add to "config.h":
#define CONFIG_AUDIO_FULL 1    // activates AC3/DTS/TrueHD full bitdepth output
#define CONFIG_AUDIO_NODRC 1   // forcefully disables AC3 DRC processing

(6)
make install

(7)
c:\msys\local\bin\avcodec.dll
c:\msys\local\bin\avutil-50.dll
