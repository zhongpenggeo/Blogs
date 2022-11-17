### 获取设备信息

cudaDeviceProp 结构定义:

```C
struct cudaDeviceProp {

char name [256];
size_t totalGlobalMem;
size_t sharedMemPerBlock;
int regsPerBlock;
int warpSize;
size_t memPitch;
int maxThreadsPerBlock;
int maxThreadsDim [3];
int maxGridSize [3];
size_t totalConstMem;
int major;
int minor;
int clockRate;
size_t textureAlignment;
int deviceOverlap;
int multiProcessorCount;
}
```

- `name` 用于表示设备的ASCII字符串
- `totalGlobalMem`设备上可用的全局存储器总量，以字节为单位
- `shareMemPerBlock`线程块可以使用的共享存储器的最大值,以字节为单位;多处理器上的所有线程块可以同时共享这些存储器;

- `regsPerBlock`线程块可以使用的32位寄存器的最大值;多处理器上的所有线程块可以同时共享这些寄存器;

- `warpSize`按线程计算的warp块大小;

- `memPitch`允许通过cudaMallocPitch()为包含存储器区域的存储器复制函数分配的最大间距(pitch),以字节为单位;

- `maxThreadsPerBlock`每个块中的最大线程数

- `maxThreadsDim[3]`块各个维度的最大值:

- `maxGridSize[3]`网格各个维度的最大值;

- `totalConstMem`设备上可用的不变存储器总量,以字节为单位;

- `major,minor`定义设备计算能力的主要修订号和次要修订号;

- `clockRate`以千赫为单位的时钟频率;

- `textureAlignment`对齐要求;与textureAlignment字节对齐的纹理基址无需对纹理取样应用偏移;

- `deviceOverlap`如果设备可在主机和设备之间并发复制存储器,同时又能执行内核,则此值为 1;否则此值为 0;

- `multiProcessorCount`设备上多处理器的数量。



### 评价CUDA程序

为了短时间内完成计算，需要考虑算法、并行划分、指令吞吐量、存储器带宽等多方面因素，总的来说一个优秀的CUDA程序应该具有下面这些特征：

- 在给定的数据规模下，选用算法的计算复杂度不明显高于最优的算法；

- Active warp的数量能够让SM满载，并且active block的数量大于2，能够有效地隐藏访存延迟（使用足够大的内存带宽）；

- 当瓶颈出现在运算指令时，指令流的效率已经过了充分优化；

- 当瓶颈出现在访问IO时，程序已经选用了恰当的存储器来储存数据，并使用了适当的存储器访问方式，以获得最大带宽；



### 确保GPU可用


```C++
bool InitCUDA()`
{
    int count;

    //取得支持Cuda的装置的数目
    cudaGetDeviceCount(&count);
    //没有符合的硬件
    if (count == 0) {
        std::cout<<"There is no device.\n";
        return false;
    }
    int i;
    for (i = 0; i < count; i++) {
        cudaDeviceProp prop;
        if (cudaGetDeviceProperties(&prop, i) == cudaSuccess) {
            if (prop.major >= 1) {
                break;
            }
        }
    }
    if (i == count) {
        std::cout<<"There is no device supporting CUDA 1.x.\n";
        return false;
    }
    cudaSetDevice(i);
    std::cout<<"GPU number: " << count <<std::endl;
    return true;
}
```

用`cudaGetDeviceCount`函数可以获得。



参考：[CUDA编程（三）评估CUDA程序的表现_MingChaoSun的博客-CSDN博客](https://blog.csdn.net/sunmc1204953974/article/details/51002061)