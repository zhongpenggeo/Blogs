## sehll脚本的组成
通常来说，shell脚本是由很多一条命令组成的一个命令集，用来共同完成一个任务；一般情况下包括很多命令，那他们究竟是如何执行的呢？

## shell脚本一条条执行
```shell
command1
command2
```
或者
```shell
command1 ; command2
```

在这种情况下，shell会一条一条执行任务，直到上一条执行完毕（无论成功还是失败）才会执行下一条；

## 出错退出
如果希望上一条命令出错后，立即停止下面任务的执行，可以在shell文件开头加上：
> set -e

或者：
> my_command || { echo 'my_command failed' ; exit 1; }

注意{}里面的空格；个人推荐第一种 set -e