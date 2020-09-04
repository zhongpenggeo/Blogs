#### 启动

```python
# Load the TensorBoard notebook extension
%load_ext tensorboard
```

#### 训练结束后启动

```python
%tensorboard --logdir logs
```

这里也可以在最开始启动，用以监视模型。

### 使用API获得更多控制

```
from tensorboard import notebook
notebook.list() # View open TensorBoard instances
```