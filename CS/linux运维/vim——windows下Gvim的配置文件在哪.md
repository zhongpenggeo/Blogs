---
title: windows下Gvim的配置文件在哪
date: 2021-07-27 10:03:51
categories:
- Linux
---
实际上，用户的位于$HOME/_vimrc  
系统的位于安装目录的_vimrc  
并且两者有可能冲突，可以考虑删除其中一个

在vim中输入
> :version

可以看到相关版本信息，包括配置信息  
> echo $HOME

可以看到系统的家目录
