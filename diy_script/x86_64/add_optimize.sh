#!/bin/bash

cd $1

# 修改内核版本
sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=6.0/g' ./target/linux/x86/Makefile

# Modify default IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

#修改X86默认固件大小
if [[ `grep -o "default 160" config/Config-images.in | wc -l` == "1" ]]; then
    sed -i 's\default 160\default 300\g' config/Config-images.in
else
    echo ""
fi

#修改默认主题为luci-theme-argonne
sed -i "s/Bootstrap/Argonne/g" ./feeds/luci/collections/luci/Makefile
sed -i "s/luci-theme-bootstrap/luci-theme-argonne/g" ./feeds/luci/collections/luci/Makefile

#修改x86首页
#  rm -rf package/lean/autocore/files/index.htm
wget -O x86_index.htm https://raw.githubusercontent.com/c939984606/OpenWrt_Action/master/Other/x86_index.htm
cp -rf ./x86_index.htm package/lean/autocore/files/x86/index.htm
base_zh_po_if=$(grep -o "#天气预报" feeds/luci/modules/luci-base/po/zh-cn/base.po)
if [[ "$base_zh_po_if" == "#天气预报" ]]; then
    echo "已添加天气预报"
else
    sed -i '$a \       ' feeds/luci/modules/luci-base/po/zh-cn/base.po
    sed -i '$a #天气预报' feeds/luci/modules/luci-base/po/zh-cn/base.po
    sed -i '$a msgid "Weather"' feeds/luci/modules/luci-base/po/zh-cn/base.po
    sed -i '$a msgstr "天气"' feeds/luci/modules/luci-base/po/zh-cn/base.po
    sed -i '$a \       ' feeds/luci/modules/luci-base/po/zh-cn/base.po
    sed -i '$a msgid "Local Weather"' feeds/luci/modules/luci-base/po/zh-cn/base.po
    sed -i '$a msgstr "本地天气"' feeds/luci/modules/luci-base/po/zh-cn/base.po
fi

#首页显示编译时间 作者 下载地址
Compile_time_if=$(grep -o "#首页显示编译时间" feeds/luci/modules/luci-base/po/zh-cn/base.po)
if [[ "$Compile_time_if" == "#首页显示编译时间" ]]; then
    echo "已添加首页显示编译时间"
else
    sed -i '$a \       ' feeds/luci/modules/luci-base/po/zh-cn/base.po
    sed -i '$a #首页显示编译时间' feeds/luci/modules/luci-base/po/zh-cn/base.po
    sed -i '$a msgid "Compile_time"' feeds/luci/modules/luci-base/po/zh-cn/base.po
    sed -i '$a msgstr "固件编译时间"' feeds/luci/modules/luci-base/po/zh-cn/base.po
    sed -i '$a \       ' feeds/luci/modules/luci-base/po/zh-cn/base.po
    sed -i '$a #首页显示编译作者' feeds/luci/modules/luci-base/po/zh-cn/base.po
    sed -i '$a msgid "Compile_author"' feeds/luci/modules/luci-base/po/zh-cn/base.po
    sed -i '$a msgstr "固件编译作者"' feeds/luci/modules/luci-base/po/zh-cn/base.po
    sed -i '$a \       ' feeds/luci/modules/luci-base/po/zh-cn/base.po
    sed -i '$a #首页显示下载地址' feeds/luci/modules/luci-base/po/zh-cn/base.po
    sed -i '$a msgid "Frimware_dl"' feeds/luci/modules/luci-base/po/zh-cn/base.po
    sed -i '$a msgstr "固件更新地址"' feeds/luci/modules/luci-base/po/zh-cn/base.po
fi
sed -i '/Compile_time/d' package/lean/default-settings/files/zzz-default-settings
sed -i '/Compile_author/d' package/lean/default-settings/files/zzz-default-settings
sed -i '/Frimware_dl/d' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/d' package/lean/default-settings/files/zzz-default-settings
echo "echo \"`date "+%Y-%m-%d %H:%M"` (commit:`git log -1 --format=format:'%C(bold white)%h%C(reset)'`)\" >> /etc/Compile_time" >> package/lean/default-settings/files/zzz-default-settings
echo "echo \"🎯&nbsp;&nbsp;By 一路阳光&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;🎯&nbsp;&nbsp;https://blog.istar.run\" >> /etc/Compile_author" >> package/lean/default-settings/files/zzz-default-settings
echo "echo \"🎯&nbsp;&nbsp;固件更新地址：https://files.istar.run/Aliyun/OS/Router/OpenWrt\" >> /etc/Frimware_dl" >> package/lean/default-settings/files/zzz-default-settings
echo "exit 0" >> package/lean/default-settings/files/zzz-default-settings
