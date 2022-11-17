编程模型中引入了核心语言扩展。它们允许程序员将内核定义为 C++ 函数，并在每次调用函数时使用一些新语法来指定网格和块的维度。所有扩展的完整描述可以在 [C++ 语言扩展](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#c-language-extensions)中找到。

任何包含这些扩展名的源文件都必须使用 nvcc 进行编译，如[使用NVCC编译](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#compilation-with-nvcc)中所述。

运行时在 [CUDA Runtime](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#cuda-c-runtime) 中引入。它提供了在主机上执行的 C 和 C++ 函数，用于分配和释放设备内存、在主机内存和设备内存之间传输数据、管理具有多个设备的系统等。运行时的完整描述可以在 CUDA 参考手册中找到。

### 利用NVCC编译

内核可以使用称为 `PTX` 的 CUDA 指令集架构来编写，`PTX` 参考手册中对此进行了描述。 然而，使用高级编程语言（如 C++）通常更有效。 在这两种情况下，内核都必须通过 `nvcc` 编译成二进制代码才能在设备上执行。

`nvcc` 是一种编译器驱动程序，可简化编译 `C++` 或 `PTX` 代码：它提供简单且熟悉的命令行选项，并通过调用实现不同编译阶段的工具集合来执行它们。 本节概述了 `nvcc` 工作流程和命令选项。 完整的描述可以在 `nvcc` 用户手册中找到。

#### 编译流程

**离线编译**

nvcc 的基本工作流程包括将设备代码与主机代码分离，然后：

- 将设备代码编译成汇编形式（`PTX` 代码）或二进制形式（`cubin` 对象）
- 并通过CUDA运行时函数的调用来替换 <<<…>>> 语法对主机代码进行修改，以从 `PTX` 代码或 `cubin` 对象加载和启动每个编译的内核。

然后应用程序可以：

- 链接到已编译的主机代码（这是最常见的情况），
- 或者忽略修改后的主机代码（如果有）并使用 CUDA 驱动程序 API（请参阅[驱动程序 API](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#driver-api)）来加载和执行 `PTX` 代码或 `cubin` 对象。

**即时编译**

应用程序在运行时加载的任何 `PTX` 代码都由设备驱动程序进一步编译为二进制代码。这称为即时编译