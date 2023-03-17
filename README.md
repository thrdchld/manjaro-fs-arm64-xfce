# Manjaro arm64 rootfs with xfce4 and tigervnc

![](manjaro.png)

> Manjaro rootfs with `xfce4` and `vncserver` preinstalled. Just setup username, password and vnc password.


Manjaro arm64 with xfce4, xfce4-goodies, tigervnc

|  | Manjaro 21.1.1  |
| :---:   | :-: |
| vncserver | tigervnc |
| Anki | No | Yes |
| Download size | 1.0 GB |
| Installed Size | 4.0 GB |
| Desktop Env. | xfce4, xfce4-goodies |

# QuickStart
1. Copy and run commands below in [Termux](https://f-droid.org/en/packages/com.termux)
2. Select `Install the latest rootfs`
3. Wait for download to complete
4. Set username and password
5. Type `vncserver-start` and vnc password
6. Open [RealVNC](https://play.google.com/store/apps/details?id=com.realvnc.viewer.android) and connect to `localhost:5901`.

    View more tutorials [here](https://github.com/infinyte7/manjaro-fs-arm64/wiki).

## Manjaro arm64 with xfce4, xfce4-goodies and tigervnc
Copy and run it in Termux
```
pkg install wget && wget https://raw.githubusercontent.com/iecxiv/manjaro-fs-arm64/main/manjaro.sh && chmod +x manjaro.sh && ./manjaro.sh
```

## To proot into already installed rootfs
### For Manjaro
```
./manjaro.sh
```

## 1. Manjaro not showing default themes ?
Note: Make a backup of $HOME/.config folder
```
mv $HOME/.config $HOME/.config.bak
```
Run following commands to reset to default Manjaro look.
```
cp -r /etc/skel/.config $HOME
```

## 2. File permission errors ?
Run following commands to fix file permission errors
```
chmod -R 755 /bin /boot /etc/ /home /lib /mnt /opt /run /sbin /srv /usr /var

chmod -R 1777 /tmp
chmod -R 555 /sys
chmod -R 700 /root
```

## 3. Not able to run sudo commands ?
Change manjaro:manjaro with <username>:<password>
```
chown manjaro:manjaro /usr/bin/sudo && chmod 4755 /usr/bin/sudo
```
## 4. vncserver not connecting ?
May be vncserver not closed successfully, run following to stop vncserver
```
vncserver-stop
```
If above commands didn't work then do it manually
```
vncserver -list
vncserver -kill :1
```
Change :1 to :2 , :3 if there in process listed in -list

Then finally start vncserver
```
vncserver 
```
## 5. Fonts not showing properly ?
Install fonts for the language
```
sudo pacman -S ttf-bitstream-vera noto-fonts wqy-microhei #chinese
```
Set locale
```
sudo nano /etc/locale.gen
```
Uncomment the required locale by removing #

Then run
```
sudo locale-gen
```
Now local -a will print following
C
en_US.UTF-8
Posix
zh_CN.UTF-8
Restart Termux and proot into Manjaro and view result in RealVNC
## 6. Firefox getting crashed ?
```
export MOZ_FAKE_NO_SANDBOX=1

firefox
```
View more at https://github.com/termux/proot/issues/139

## 7. Libreoffice not running in termux proot.
Workaround for Libreoffice, needs to bind a fake /proc/version

Copy and run in Manjaro proot
```
wget https://raw.githubusercontent.com/infinyte7/manjaro-fs-arm64/main/scripts/fix-libreoffice.py && python fix-libreoffice.py
```

## 8. Black screen on VNC viewer?
There are many solutions for that. But in some cases reinstalling desktop environment may solve the problems.
For example: xfce4, run this to install xfce4.
```
sudo pacman -S xfce4 xfce4-goodies
```
# License and Credits
- [Manjaro ARM](https://manjaro.org/)

- [Manjaro on Android (manjaro-fs-arm64)](https://github.com/krmanik/manjaro-fs-arm64)<br>
    Mani (Infinyte7)<br>GPL v3

- [AndronixOrigin](https://github.com/AndronixApp/AndronixOrigin)<br>MIT License

- ItsMeKuroro<br>[https://forum.manjaro.org](https://archived.forum.manjaro.org/t/how-to-run-the-official-manjaro-arm-edition-on-android-with-chroot-environment/151429)

- [undocker](http://github.com/larsks/undocker)<br>
    GPL v3
