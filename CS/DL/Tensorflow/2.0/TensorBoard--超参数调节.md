#### 加载tensorboard

```
# Load the TensorBoard notebook extension
%load_ext tensorboard
# Clear any logs from previous runs
!rm -rf ./logs/ 
```

#### 导入模块

```
import tensorflow as tf
from tensorboard.plugins.hparams import api as hp
```