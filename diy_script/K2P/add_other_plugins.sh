#!/bin/bash

cd $1

rm -rf package/other
mkdir package/other

#istore
#svn co https://github.com/linkease/istore/trunk/luci/luci-app-store ./package/other/luci-app-store
#svn co https://github.com/openwrt/luci/trunk/libs/luci-lib-ipkg ./package/other/luci-lib-ipkg
#cp -rf ./package/other/luci-lib-ipkg ./feeds/luci/libs/
#rm -rf ./package/feeds/luci/luci-lib-ipkg/luasrc
#ln -s ./feeds/luci/libs/luci-lib-ipkg ./package/feeds/luci/luci-lib-ipkg
#git clone https://github.com/linkease/istore-ui.git ./package/other/istore-ui
#cp -rf ./package/other/istore-ui/app-store-ui ./package/other/luci-app-store
#echo "-----------------------------------------------------"
#echo

# Add luci-app-poweroff
git clone --depth=1 https://github.com/esirplayground/luci-app-poweroff ./package/other/luci-app-poweroff
echo "-----------------------------------------------------"
echo

# alist
git clone --depth=1 https://github.com/sbwml/openwrt-alist ./package/other/openwrt-alist
echo "-----------------------------------------------------"
echo

#Auto Wan
git clone https://github.com/kongfl888/luci-app-autorewan.git ./package/other/luci-app-autorewan
echo "-----------------------------------------------------"
echo

#luci-app-netspeedtest
git clone https://github.com/waynesg/luci-app-netspeedtest.git ./package/other/luci-app-netspeedtest
echo "-----------------------------------------------------"
echo

# 采用lisaac的luci-app-dockerman
rm -rf ./package/lean/luci-app-dockerman 
rm -rf ./package/lean/luci-lib-docker
svn co https://github.com/lisaac/luci-app-dockerman/trunk/applications/luci-app-dockerman ./package/lean/luci-app-dockerman
git clone --depth=1 https://github.com/lisaac/luci-lib-docker ./package/lean/luci-lib-docker
echo "-----------------------------------------------------"
echo

#添加 fw876/helloworld
rm -rf ./package/lean/helloworld
git clone --depth=1 https://github.com/fw876/helloworld.git ./package/lean/helloworld
echo "-----------------------------------------------------"
echo

# add luci-app-advanced
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-advanced ./package/other/luci-app-advanced
echo "-----------------------------------------------------"
echo

# add luci-app-aliddns
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-aliddns ./package/other/luci-app-aliddns
echo "-----------------------------------------------------"
echo

# add luci-app-eqos
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-eqos ./package/other/luci-app-eqos
echo "-----------------------------------------------------"
echo

# add adguardhome
svn co https://github.com/kenzok8/openwrt-packages/trunk/adguardhome ./package/other/adguardhome
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-adguardhome ./package/other/luci-app-adguardhome
echo "-----------------------------------------------------"
echo

# add aliyundrive-webdav
svn co https://github.com/kenzok8/openwrt-packages/trunk/aliyundrive-webdav ./package/other/aliyundrive-webdav
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-aliyundrive-webdav ./package/other/luci-app-aliyundrive-webdav
echo "-----------------------------------------------------"
echo

# add ddnsto
svn co https://github.com/kenzok8/openwrt-packages/trunk/ddnsto ./package/other/ddnsto
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-ddnsto ./package/other/luci-app-ddnsto
echo "-----------------------------------------------------"
echo

# add filebrowser
svn co https://github.com/kenzok8/openwrt-packages/trunk/filebrowser ./package/other/filebrowser
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-filebrowser ./package/other/luci-app-filebrowser
echo "-----------------------------------------------------"
echo

# add luci-app-bypass
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-bypass ./package/other/luci-app-bypass
echo "-----------------------------------------------------"
echo

# add luci-app-koolddns
svn co https://github.com/c939984606/openwrt-packages/trunk/luci-app-koolddns ./package/other/luci-app-koolddns
echo "-----------------------------------------------------"
echo

# add openclash
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-openclash ./package/other/luci-app-openclash
echo "-----------------------------------------------------"
echo

# add passwall2
#git clone https://github.com/kenzok8/small ./package/other/small
#svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-passwall2 ./package/other/luci-app-passwall2
#echo "-----------------------------------------------------"
#echo

# add passwall
#git clone https://github.com/kenzok8/small ./package/other/small
#svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-passwall ./package/other/luci-app-passwall
#echo "-----------------------------------------------------"
#echo

#微信推送钉钉机器人版
git clone https://github.com/zzsj0928/luci-app-pushbot ./package/other/luci-app-pushbot
echo "-----------------------------------------------------"
echo

# add luci-app-serverchan
rm -rf ./package/lean/luci-app-serverchan
git clone https://github.com/tty228/luci-app-serverchan ./package/lean/luci-app-serverchan
echo "-----------------------------------------------------"
echo

# add luci-app-smartdns
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-smartdns ./package/other/luci-app-smartdns
svn co https://github.com/kenzok8/openwrt-packages/trunk/smartdns ./package/other/smartdns
echo "-----------------------------------------------------"
echo

#  VSSR
rm -rf ./package/lean/luci-app-vssr
rm -rf ./package/lean/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr.git ./package/other/luci-app-vssr
git clone https://github.com/jerrykuku/lua-maxminddb.git ./package/other/lua-maxminddb
echo "-----------------------------------------------------"
echo

# add theme
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-atmaterial_new ./package/other/luci-theme-atmaterial_new
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-argonne ./package/other/luci-theme-argonne
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-mcat ./package/other/luci-theme-mcat
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-tomato ./package/other/luci-theme-tomato
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-neobird ./package/other/luci-theme-neobird
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-argonne-config ./package/other/luci-app-argonne-config
echo "-----------------------------------------------------"
echo