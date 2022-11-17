## 线程并行

### 将计算分配到不同gpu

```C++
// __global__ 函数 (GPU上执行) 计算立方和
__global__ static void sumOfSquares(int *num, int* result, clock_t* time)
{

    //表示目前的 thread 是第几个 thread（由 0 开始计算）
    const int tid = threadIdx.x; 

    //计算每个线程需要完成的量
    const int size = DATA_SIZE / THREAD_NUM;

    int sum = 0;

    int i;

    //记录运算开始的时间
    clock_t start;

    //只在 thread 0（即 threadIdx.x = 0 的时候）进行记录
    if (tid == 0) start = clock();

    for (i = tid * size; i < (tid + 1) * size; i++) {

        sum += num[i] * num[i] * num[i];

    }

    result[tid] = sum;

    //计算时间的动作，只在 thread 0（即 threadIdx.x = 0 的时候）进行
    if (tid == 0) *time = clock() - start;

}

```



同时修改调用核函数的形式

```C++
sumOfSquares < << 1, THREAD_NUM, 0 >> >(gpudata, result, time);
```

