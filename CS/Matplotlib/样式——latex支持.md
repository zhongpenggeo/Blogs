---
title: 样式——latex支持
date: 2021-07-27 10:04:29
categories:
- Matplotlib
---
```python
from matplotlib import rc
rc('text', usetex=False) 
```

latex支持pdf生成

支持公式

但有时候可能没安装，所以使用上述命令关闭。



使用tex字符

```python
label(r"$\nabla$")
```

