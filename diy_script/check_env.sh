#/bin/bash

# ENV
for name in jq s3fs python3-pip ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential \
bzip2 ccache cmake cpio curl device-tree-compiler fastjar flex gawk gettext gcc-multilib g++-multilib \
git gperf haveged help2man intltool libc6-dev-i386 libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev \
libmpc-dev libmpfr-dev libncurses5-dev libncursesw5-dev libreadline-dev libssl-dev libtool lrzsz \
mkisofs msmtp nano ninja-build p7zip p7zip-full patch pkgconf python2.7 python3 python3-pip libpython3-dev qemu-utils \
rsync scons squashfs-tools subversion swig texinfo uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev

  do
    installed=$(dpkg --get-selections $name)
    if [ $installed ]; then
      echo -e "🎯  $name 已经安装过，跳过"
    else
      echo -e "🎯  $name 不存在，开始安装"
      sudo apt-get -q install $name
    fi
 done
 
 # 阿里云盘cli https://github.com/wxy1343/aliyunpan.git
 pip install aliyunpan --upgrade
