echo merge code to develop begin
# 先切换到开发分支并更新
git checkout develop
git pull
# 合并song的代码到开发分支
git merge song
# 更新远程开发分支状态
git push
# 返回song的编程分支
git checkout song