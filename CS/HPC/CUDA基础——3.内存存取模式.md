### 问题

在同一个 thread 中连续存取内存，在实际执行时反而不是连续了，下图很明显的反应了这个问题，我们的存取是跳跃式的。

![这里写图片描述](imags/20160405143707907)



要让实际执行结果是连续的存取，我们应该要让 thread 0 读取第一个数字，thread 1 读取第二个数字…依此类推，很容易可以想象，通过这种存储方式，我们取数字的时候就变成了连续存取。

![这里写图片描述](imags/20160405145021319)

```C++
#define THREAD_NUM 256


__global__ static void sumOfSquares(int *num, int* result, clock_t* time)
{

    //表示目前的 thread 是第几个 thread（由 0 开始计算）
    const int tid = threadIdx.x;

    int sum = 0;

    int i;

    //记录运算开始的时间
    clock_t start;

    //只在 thread 0（即 threadIdx.x = 0 的时候）进行记录
    if (tid == 0) start = clock();

    //改为连续存取（thread 0 读取第一个数字，thread 1 读取第二个数字 …）
    for (i = tid; i < DATA_SIZE; i += THREAD_NUM) {

        sum += num[i] * num[i] * num[i];

    }

    result[tid] = sum;

    //计算时间的动作，只在 thread 0（即 threadIdx.x = 0 的时候）进行
    if (tid == 0) *time = clock() - start;

}
```

