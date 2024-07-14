#!/bin/bash
# 尝试执行git push命令，并重定向输出到/dev/null
git push > /dev/null 2>&1

result=$?

# 检查git push命令的退出状态码
if [ $result -ne 0 ]; then
	echo "不等于0"
    if [ $result -eq 128 ]; then
	echo "等于128"
        echo "未绑定上游分支，自动绑定中..."
        # 绑定上游分支并尝试再次推送
        git push --set-upstream origin $(git branch --show-current) > /dev/null 2>&1
        if [ $? -ne 0 ]; then
            echo "自动绑定上游分支失败"
            exit 1
        fi
    else
        echo "推送失败，发生未知错误"
        exit 1
    fi
fi

echo "推送成功"
exit 0
