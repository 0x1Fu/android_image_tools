(for research purposes only)

### BUILD ENVIRONMENT
Download and extrace NDK tool.

[android-ndk-r17b-linux-x86_64.zip](https://developer.android.google.cn/ndk/downloads/)

Download Kernel source codes and boot image tools.
```
cd ~
git clone https://github.com/0x1Fu/SM-G9650_CHN_kernel.git
git clone https://github.com/0x1Fu/android_image_tools.git
```
### COMPILE KERNEL
```
cd ~/SM-G9650_CHN_kernel
export PATH=~/android-ndk-r17b/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin:$PATH
./build_kernel.sh
``` 
### CREATE BOOT IMAGE

```
cd ~/android_image_tools/images/G9650ZCU2ARE6/
cp ~/SM-G9650_CHN_kernel/out/arch/arm64/boot/Image.gz-dtb .
./create_boot.sh
```
### FLASH
Enter DOWNLOAD mode, flash boot.img.tar via Odin.

Reboot to TWRP RECOVERY mode and install SuperSU.

