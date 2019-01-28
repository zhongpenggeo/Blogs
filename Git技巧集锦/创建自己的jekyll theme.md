---
title: 2019-1-28-创建自己的jekyll theme
date：2019-1-28
categories:
- Jekyll
- theme
tags: design

mathjax: true
grammar_cjkRuby: true
---

## jekyll的文件结构
```
root/
├── _posts/
│   └── my-amazing-post-14-09-2017.md
├── index.html
├── Gemfile
├── _config.yml
├── 404.md
└── about.md
```
**文件功能**  
- \_includs:一般是保存各种网页，主要用来作为模板导入其他的网页框架中
- \_layouts: contain a default.html, post.html and page.html template to get started with
- \_saaa: 空的，将包含你的风格partials
- assets：包含静态文件或者link，如几何框架style.css
- others
- index.html是网站的入口（主页），
#### 其他文件
- yourtheme-gemspec：保存关于theme的各种信息，包括软件版本和copywrite等；如设置变量：spec.homepage. 

## 如何创建搜索
需要借助lunr.js脚本的函数来实现，注意该脚本已经从1.x升级到2.x，所以有些博文已经失效了。  
参考：[Jekyll search using lunr.js](https://learn.cloudcannon.com/jekyll/jekyll-search-using-lunr-js/)

## 如何创建目录
参考[Separate pages per tag/category with Jekyll (without plugins)](https://christianspecht.de/2014/10/25/separate-pages-per-tag-category-with-jekyll-without-plugins/)

注意这里没有借助json脚本，所以只能手动建立每个category的目录和index网页，从而实现目录链接。

## 最终结果
参考cayman的theme，改进得到的博客界面：  
![enter description here](https://www.github.com/zhongpenggeo/Blogs/raw/master/imags/1548675465204.png)