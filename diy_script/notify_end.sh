#!/bin/bash
# 企业id
    id=$1

# 应用secret
    secret=$2

# 应用id
    agentid=$3
    
    os=$4
    
    starttime=$(cat ../runtime.log)
    rm -rf ../runtime.log
    endtime=$(echo `date +'%Y-%m-%d %H:%M:%S'`)
    start_seconds=$(date --date="$starttime" +%s)
    end_seconds=$(date --date="$endtime" +%s)
    SEC=$((end_seconds-start_seconds))
    s=$(echo $(( (SEC % 3600) % 60 ))秒)
    m=$(echo $(( (SEC % 3600) / 60 ))分)
    h=$(echo $(( SEC / 3600 ))小时)

# API接口
    url="https://qyapi.weixin.qq.com/cgi-bin"

# 获取token [这里token没做缓存,如果频繁调用gettoken接口，会受到频率拦截，官方默认token值有效时间2小时]
    token=`curl -s "$url/gettoken?corpid=$id&corpsecret=$secret"|jq -r .access_token`

# 发送消息参数
    part="message/send?access_token=$token"

    
# 执行提示
function tips(){
    code=`jq -r .errcode`
    if [ "$code" == "0" ]
    then 
        echo
        echo -e "\033[32m✅   通知消息发送成功！\033[0m"
    else
        echo
        echo -e "\033[31m⚠️    通知消息发送失败：$code\033[0m"
    fi
}

function send(){
    msg='{"touser" : "@all","msgtype" : "textcard","agentid" : '"$agentid"',"textcard" : {"title" : "🚩🚩 编译结束(SH): ","description" : "<div class=\"highlight\">🎉 固件名称：OpenWrt-'"$os"'\n🎉 结束时间：'"$endtime"'\n🎉 编译用时：'"$h"''"$m"''"$s"'\n🎉 编译状态：Success✅ 😋💐</div>","url" : "https://pan.baidu.com/s/1m4_Ev7p_v0-YL9_2pNQ2KQ",btntxt":"点击打开"},"enable_id_trans": 0,"enable_duplicate_check": 0,"duplicate_check_interval": 1800}'
    curl -s -X POST -d "$msg" "$url/$part"|tips
}

send