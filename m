#!/data/data/com.termux/files/usr/bin/bash


  pulseaudio --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1 --start
  unset LD_PRELOAD
  exec proot --kill-on-exit -l -0 --sysvipc \
    -r ./manjaro \
    -b /dev \
    -b /proc \
    -b ./manjaro/root:/dev/shm \
    -b $PREFIX/tmp:/tmp \
    -b /storage/36A4-24A7:/media/sd \
    -b /storage/emulated/0:/media/int \
    -w /root \
    /usr/bin/env -i \
    PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/games:/usr/games \
    HOME=/root \
    TERM=linux \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US \
    LC_ALL=C \
    /bin/bash --login
