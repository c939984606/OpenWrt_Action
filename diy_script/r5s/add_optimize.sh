#!/bin/bash

cd $1

# 修改内核版本
sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.19/g' ./target/linux/x86/Makefile

# 修改hostname
sed -i 's/OpenWrt/NanoPi-R5S/g' package/base-files/files/bin/config_generate

# Modify default IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

#修改X默认固件大小
if [[ `grep -o "default 160" config/Config-images.in | wc -l` == "1" ]]; then
    sed -i 's\default 160\default 800\g' config/Config-images.in
else
    echo ""
fi

#修改默认主题为luci-theme-argonne
sed -i "s/Bootstrap/Argonne/g" ./feeds/luci/collections/luci/Makefile
sed -i "s/luci-theme-bootstrap/luci-theme-argonne/g" ./feeds/luci/collections/luci/Makefile

orig_version=$(cat "package/lean/default-settings/files/zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
date_version=$(date -d "$(rdate -n -4 -p ntp.aliyun.com)" +'%Y-%m-%d')
sed -i "s/${orig_version}/${orig_version}_(${date_version})/g" package/lean/default-settings/files/zzz-default-settings