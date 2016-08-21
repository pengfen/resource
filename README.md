打开git客户端

cd /e/git/resource
ssh-keygen.exe 生成公钥私钥
将公钥复制到 github ---> setting ---> ssh keys ---> add ssh keys;

git init
git remote add origin https://github.com/pengfen/resource.git
git pull origin master
git config --global user.email "caopeng8787@163.com"

APP 项目主目录
    Admin 后台模块
    Common 公共文件
    Component 组件
    Home 前台模块
    Model 模型
    Public 
    Runtime 运行时文件
Public 项目公共资源目录
ThinkPHP TP框架
index.php 入口文件
shop.sql 数据库文件