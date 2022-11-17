### cpu计时

经典方法

```C
clock_t start, finish;
start = clock();
// 要测试的部分
finish = clock();
duration = (double)(finish - start) / CLOCKS_PER_SEC;

```

但是不适用于并行，所以使用

```C
#include <sys/time.h>
double cpuSecond()
{
  struct timeval tp;
  gettimeofday(&tp,NULL);
  return((double)tp.tv_sec+(double)tp.tv_usec*1e-6);
}
```

![img](imags/时间轴.png)

### 用nvprof计时

可能需要sudo才能运行（sudo可能没有这个命令，加上路径执行）

#### 理论界限最大化

各个设备的理论极限可以通过其芯片说明计算得到，比如说：

- Tesla K10 单精度峰值浮点数计算次数：745MHz核心频率 x 2GPU/芯片 x（8个多处理器 x 192个浮点计算单元 x 32 核心/多处理器） x 2 OPS/周期 =4.58 TFLOPS
- Tesla K10 内存带宽峰值： 2GPU/芯片 x 256 位 x 2500 MHz内存时钟 x 2 DDR/8位/字节 = 320 GB/s
- 指令比：字节 4.58 TFLOPS/320 GB/s =13.6 个指令： 1个字节