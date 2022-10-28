#### 新建screen

screen -S yourname -> 新建一个叫yourname的session



#### 列出所有screen

screen -ls -> 列出当前所有的session



#### 返回某个session

screen -r yourname -> 回到yourname这个session



#### 清除screen

screen -wipe

#### 删除已经detach的会话

```bash
screen -X -S screen_name quit
```



#### 查看是否在screen当中

echo $STY