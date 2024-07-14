#!/bin/bash


#!/bin/bash

# 尝试执行git push命令，并重定向输出到/dev/null
git push > /dev/null 2>&1

# 检查git push命令的退出状态码
if [ $? -eq 128 ]; then
    echo "未绑定上游分支，自动绑定中..."
    # 绑定上游分支并尝试再次推送
    git push --set-upstream origin $(git branch --show-current)
    if [ $? -ne 0 ]; then
        echo "自动绑定上游分支失败"
        exit 1
    fi
elif [ $? -ne 0 ]; then
    echo "推送失败，发生未知错误"
    exit 1
fi

echo "push成功"
exit 0
