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
- 