#!/bin/bash

# 执行git push命令
git push

# 获取git push命令的退出状态码
PUSH_STATUS=$?

# 检查退出状态码，如果非0（表示有错误），打印自定义错误信息
if [ $PUSH_STATUS -ne 0 ]; then
	    echo "push失败"
fi

# 脚本的退出状态码与git push命令的退出状态码一致
exit $PUSH_STATUS
