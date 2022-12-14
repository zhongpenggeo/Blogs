```python
import numpy as np

import tensorflow as tf

from tensorflow import keras
from tensorflow.keras import layers

tf.keras.backend.clear_session()  # For easy reset of notebook state.
```

数据

```python
inputs = keras.Input(shape=(784,))
# Just for demonstration purposes.
img_inputs = keras.Input(shape=(32, 32, 3))
```

```python
inputs.shape # TensorShape([None, 784])
inputs.dtype # tf.float32
```

创建网络层

```python
dense = layers.Dense(64, activation='relu')
x = dense(inputs)

# 创建两层
x = layers.Dense(64, activation='relu')(x)
outputs = layers.Dense(10)(x)
```

创建模型

```python
model = keras.Model(inputs=inputs, outputs=outputs, name='mnist_model')
```

查看模型

```python
model.summary()
```

绘制模型（绘制为流程图）

```python
keras.utils.plot_model(model, 'my_first_model.png')
```

绘制并显示输入输出

```python
keras.utils.plot_model(model, 'my_first_model_with_shape_info.png', show_shapes=True)
```



#### 一整个模型

```python
(x_train, y_train), (x_test, y_test) = keras.datasets.mnist.load_data()

x_train = x_train.reshape(60000, 784).astype('float32') / 255
x_test = x_test.reshape(10000, 784).astype('float32') / 255

model.compile(loss=keras.losses.SparseCategoricalCrossentropy(from_logits=True),
              optimizer=keras.optimizers.RMSprop(),
              metrics=['accuracy'])

history = model.fit(x_train, y_train,
                    batch_size=64,
                    epochs=5,
                    validation_split=0.2)

test_scores = model.evaluate(x_test, y_test, verbose=2)
print('Test loss:', test_scores[0])
print('Test accuracy:', test_scores[1])
```

#### Use the same graph of layers to define multiple models

https://tensorflow.google.cn/guide/keras/functional?hl=zh-cn#use_the_same_graph_of_layers_to_define_multiple_models

#### Save and serialize

This saved file includes the:

- model architecture
- model weight values (that were learned during training)
- model training config, if any (as passed to `compile`)
- optimizer and its state, if any (to restart training where you left off)

```
model.save('path_to_my_model')del model# Recreate the exact same model purely from the file:model = keras.models.load_model('path_to_my_model')
```