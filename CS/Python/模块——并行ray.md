### 优势

- Running the same code on more than one machine.
- Building [microservices](https://en.wikipedia.org/wiki/Microservices) and [actors](https://en.wikipedia.org/wiki/Actor_model) that have state and can communicate.
- Gracefully handling [machine failures](https://en.wikipedia.org/wiki/Fault_tolerance).
- Efficiently handling [large objects and numerical data](https://ray-project.github.io/2017/10/15/fast-python-serialization-with-ray-and-arrow.html).



### 与传统并行的区别

传统的并行需要改写串行程序，而ray不需要。



## 并行步骤

### 0. 设定资源

```python
ray.init(num_cpus=8, num_gpus=1)
```

如果没有指定数量，Ray会运行multiprocessing.cpu_count()来检测



也可以为每个任务指定

```python
@ray.remote(num_cpus=4, num_gpus=2)
def f():
    return 1

@ray.remote(num_gpus=0.5)
def h():
    return 1
```



[Resources (CPUs, GPUs) — Ray 0.6.3 documentation](https://docs.ray.io/en/stable/resources.html)

#### 1. 把类和函数的概念运用到ray中。

比如把function作为“remote function”。而函数会在后台运行，我们称之为task。

```python
import ray
import time

# Start Ray.
ray.init()

@ray.remote
def f(x):
    time.sleep(1)
    return x

# Start 4 tasks in parallel.
result_ids = []
for i in range(4):
    result_ids.append(f.remote(i))
    
# Wait for the tasks to complete and retrieve the results.
# With at least 4 cores, this will take 1 second.
results = ray.get(result_ids)  # [0, 1, 2, 3]
```

#### 2. 任务依赖

下面例子中，`multiply_matrices` task uses the outputs of the two `create_matrix` tasks

```python
import numpy as np

@ray.remote
def create_matrix(size):
    return np.random.normal(size=size)

@ray.remote
def multiply_matrices(x, y):
    return np.dot(x, y)

x_id = create_matrix.remote([1000, 1000])
y_id = create_matrix.remote([1000, 1000])
z_id = multiply_matrices.remote(x_id, y_id)

# Get the results.
z = ray.get(z_id)
```

#### 3. 从类到 actors

当类被实例化的时候，ray会创造actor，复制并运行一个对象。

```python
@ray.remote
class Counter(object):
    def __init__(self):
        self.x = 0
    
    def inc(self):
        self.x += 1
    
    def get_value(self):
        return self.x

# Create an actor process.
c = Counter.remote()

# Check the actor's counter value.
print(ray.get(c.get_value.remote()))  # 0

# Increment the counter twice and check the value again.
c.inc.remote()
c.inc.remote()
print(ray.get(c.get_value.remote()))  # 2
```

Individual actors execute methods serially (each individual method is atomic) so there are no race conditions. Parallelism can be achieved by creating multiple actors



ray似乎只能给类对象和函数并行，而不能对类成员函数并行

[How to use ray parallelism within a class in python? - Stack Overflow](https://stackoverflow.com/questions/64321153/how-to-use-ray-parallelism-within-a-class-in-python)



参考：[Modern Parallel and Distributed Python: A Quick Tutorial on Ray | by Robert Nishihara | Towards Data Science](https://towardsdatascience.com/modern-parallel-and-distributed-python-a-quick-tutorial-on-ray-99f8d70369b8)