一个用于可视化weights&bias的小工具，支持几乎所有的深度学习框架

#### installation

```python
pip install wandb
```

```python
# 在工作区，直接用wanbd会显示无此命令，需要如下方法
python -m wandb.cli $COMMAND
```

#### 简介

需要注册一个云端账户，运行时会把结果发送到云端，也可以存在本地，以h5数据格式？

#### Usage

1. 在py代码中加入wanda的数据，主要是init和log
2. python code.py
3. 在云端查看结果