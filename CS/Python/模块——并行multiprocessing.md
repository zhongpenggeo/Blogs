## multiprocessing模块

在程序中实现多进程并行

对比MPI：直接在一个脚本里实现数据归并？？

### 1. Process

多任务

### 2. Pool

The Pool class is easier to use than the Process class because you do not have to manage the processes by yourself. It creates the processes, splits the input data, and returns the result in a list. It also waits for the workers to finish their tasks, i.e., you do not have to call the join() method explicitly.

#### apply

类似于python的apply函数（python 3.x已经不再使用）

Pool.apply blocks 直到函数完成

直接返回值，如果返回值有多个，则自动封装为tuple形式。

#### apply_async

call returns immediately instead of waiting for the result

返回的是一个对象而不是函数的值，需要用get()方法得到值（apply直接返回值）；

The `get()` method blocks until the function is completed. Thus, `pool.apply(func, args, kwargs)` is equivalent to `pool.apply_async(func, args, kwargs).get()`.



```py
                  | Multi-args   Concurrence    Blocking     Ordered-results
---------------------------------------------------------------------
Pool.map          | no           yes            yes          yes
Pool.map_async    | no           yes            no           yes
Pool.apply        | yes          no             yes          no
Pool.apply_async  | yes          yes            no           no
Pool.starmap      | yes          yes            yes          yes
Pool.starmap_async| yes          yes            no           no
```

需要注意：blocking即是否同步处理（串行），对于异步函数（async)，只有在使用get()的时候才会等待，但是目前的测试是异步花费时间反而更长，可能是因为通信耗费太大吧。

参考：[python - multiprocessing.Pool: When to use apply, apply_async or map? - Stack Overflow](https://stackoverflow.com/questions/8533318/multiprocessing-pool-when-to-use-apply-apply-async-or-map)

实例：

```python
import multiprocessing
import time
import numpy as np

def func(n):
    return np.ones(10)*n,np.zeros(10)*n

if __name__ == "__main__":
    n_id = 3
    pool = multiprocessing.Pool(processes=n_id) # 创建4个进程
    result = np.empty((n_id,10),dtype=float)
    result2 = np.empty((n_id,10),dtype=float)
    for i in range(n_id):
        x = pool.apply(func, (i, ))
        # for a,b in x:
        # temp = x.get()
        # print(temp)
        result[i,:] = x[0]

        result2[i,:] = x[1]

    pool.close() # 关闭进程池，表示不能再往进程池中添加进程，需要在join之前调用
    pool.join() # 等待进程池中的所有进程执行完毕
    print ("Sub-process(es) done.")
```

参考：[Python多进程库multiprocessing中进程池Pool类的使用_小平子的专栏-CSDN博客_multiprocessing.pool](https://blog.csdn.net/jinping_shi/article/details/52433867)