
cd /root/tvbox/qist_tvbox/tvbox/
git checkout .
git pull
cd /root/tvbox/mygitee/tvbox/
rsync -av --exclude='.git' /root/tvbox/qist_tvbox/tvbox/* /root/tvbox/mygitee/tvbox/
# 执行脚本更新github地址
bash updategh.sh 

# git add .
# git commit -am "同步更新"
# git push

git checkout master
git checkout --orphan fresh-master
git add .
git commit -m "同步更新"
git branch -D master
git branch -m master

# 强制垃圾回收并重新打包
git reflog expire --expire=now --all
git gc --aggressive --prune=now

# 删除所有不再被引用的对象
git prune --expire now

git push origin master --force-with-lease
