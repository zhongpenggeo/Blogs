### 问题

在win10系统，Geforce 940 MX card上

写的的代码无法执行，显示：`CUDA Error: no kernel image is available for execution on the device`

### 解决方案

The way I solved it was include the `compute_50,sm_50` in the field at `Properties > CUDA C/C++ > Device > Code Generation`. Hope this helps.

亲测有效



### 错误原因

太高的cuda版本而太低的驱动。



参考：[gpu - Nvidia CUDA Error: no kernel image is available for execution on the device - Stack Overflow](https://stackoverflow.com/questions/67825986/nvidia-cuda-error-no-kernel-image-is-available-for-execution-on-the-device)

