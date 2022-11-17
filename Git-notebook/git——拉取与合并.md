![操作流程图](imags/git1.jpg)

### pull

pull 操作简单粗暴，直接将远端代码拉取并合并到本地，对，就是这么不讲道理，实际上`pull ≈ fetch + merge`

### git fetch

git fetch 是将远端代码全部保存到本地，但此时并没有合并到代码中，而是存放在了`.git/FETCH_HEAD`文件中

> FETCH_HEAD指的是: 某个branch在服务器上的最新状态， 每一个执行过fetch操作的项目都会存在一个，FETCH_HEAD列表, 这个列表保存在.git/FETCH_HEAD` 文件中，其中每一行对应于远程服务器的一个分支commit_id， 当前分支指向的FETCH_HEAD, 就是这个文件第一行对应的那个分支。

### git merge

```
git merge <远程主机名> <远程分支名>  # <本地分支名>
```

顾名思义就是将某分支的内容合并到当前分支，如下图，c4分支合并c5分支。

![merge 分支变化](imags/git2.png)

[浅谈 Git (一) 之 拉取与合并 (wzmmmmj.com)](https://wzmmmmj.com/2018/09/22/git-pull-and-git-rebase/)