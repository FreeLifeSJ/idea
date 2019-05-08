echo == merge code to develop begin ==
# 同步远程自己的开发分支
git push origin bai
# 先切换到开发分支并更新
git checkout develop
git pull origin develop
# 合并自己的代码到开发分支
git merge bai
# 更新远程开发分支状态
git push origin develop
# 返回自己的编程分支
git checkout bai