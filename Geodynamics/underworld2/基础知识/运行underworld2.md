windows系统
1. 打开docker quick terminal
2. 输入：docker run -p 8888:8888 underworldcode/underworld2 
3. 或者输入：docker run -p 8888:8888 -v $PWD/pz/docs:/workspace underworldcode/underworld2  \
解释:
- -p 表示端口，把docker容器里的端口映射到本地端口，冒号后面的是容器端口，前面的是本地端口，所以打开容器的方式是打开8888端口，具体操作是：在浏览器打开http://192.168.99.100:8888，192.168.99.100是docker默认的IP地址 
- -v 表示挂载本地目录到容器目录，冒号后为容器目录，前为本地目录，由于我的docker安装在D:\pengzhong目录下，即本地家目录是D盘，所以实际挂载的目录是：D:\pengzhong\docker\pz;使用本地目录的好处是可以保存所做的更改，但可能速度会变慢。若不使用-v挂载，则需要自己手动把docker容器里的数据导入本地，目前我还没学会这一步。

4. 实际运行：docker run -p 8888:8888 -v /c/Users/pengzhong/pz/docs:/workspace underworldcode/underworld2
5. or docker run -p 8888:8888 -v /c/Users/pengzhong/pz/UWsubduction:/workspace underworldcode/underworld2