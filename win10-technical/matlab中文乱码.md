---
title: matlab中文乱码
date: 2021-01-19 20:00:41
categories:
- Win10
---
先在win10系统设置中修改region为中国

还要 **将Administrative选项的Language for non-Unicode programs 设置成简体中文就ok了**



参考：https://zhuanlan.zhihu.com/p/39298076



### UTF-8编码

如果m文件使用utf-8编码的（从其他软件中编辑的），而matlab默认用GBK编码带中文的文件，所以需要修改matlab文件编码。

在2017版本中，找matlab安装的bin目录

lcdata.xml 是仅包含注释的空文件，需要将 lcdata_utf8.xml 重命名为 lcdata.xml ，然后进行修改：

删除  

```text
<encoding name=”GBK”>  
  < encoding_alias name=”936”>  
</encoding>
```

并将  

```text
<encoding name=”UTF-8”>  
  <encoding_alias name=”utf8”/> 
</encoding>  
```

改为

```text
<encoding name="UTF-8">  
  <encoding_alias name="utf8"/>  
  <encoding_alias name="GBK"/>  
</encoding>  
```

重启 matlab 之后，即以 utf-8 编码.

参考：https://www.zhihu.com/question/27933621



#### 验证成功

以上两步都是需要的