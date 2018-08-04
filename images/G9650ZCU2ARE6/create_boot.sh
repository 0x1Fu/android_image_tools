# /bin/bash

if [ ! -f Image.gz-dtb ];
then
	echo could not found Image.gz-dtb
	exit 1
fi

output=boot_`date "+%Y%m%d%H%M%S"`.img.tar

export PATH=../../bootimg_tools:$PATH

mkbootimg --kernel Image.gz-dtb --ramdisk ramdisk.cpio.gz --base 0x01dfff00 --cmdline 'console=null androidboot.hardware=qcom video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 service_locator.enable=1 swiotlb=2048' --board 'RILQH29A002' --pagesize 4096 -o boot.img

tar cvf $output boot.img

echo ---
boot_info boot.img

echo ---
ls -l Image.gz-dtb
ls -l ramdisk.cpio.gz
ls -l $output
