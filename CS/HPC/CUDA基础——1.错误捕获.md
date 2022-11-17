

```c
#include <stdio.h>
#include <stdlib.h>

//CUDA RunTime API
#include <cuda_runtime.h>

__global__ void myKernel() {
    printf("Hello world\n");
}

int main(int argc, char const* argv[]) {
    myKernel << <4, 2 >> > ();
    cudaError_t err = cudaGetLastError();
    if (err != cudaSuccess) {
        printf("CUDA Error: %s\n", cudaGetErrorString(err));
        // Possibly: exit(-1) if program cannot continue....
    }
    return 0;
}
```

![image-20221110103909198](imags/image-20221110103909198.png)



`cudaGetErrorString`读取error类型

