

```python
from torch.autograd.functional import jacobian
```

函数位置：[torch.autograd.functional.jacobian — PyTorch 1.9.1 documentation](https://pytorch.org/docs/1.9.1/generated/torch.autograd.functional.jacobian.html)

Jocabian可以求解一个python函数的输出对其输入的雅可比矩阵，即偏导数矩阵。

对于一个简单函数
$$
y=kf(x)
$$
则雅可比矩阵为：$kf'(x)$

### 范例

```python
import torch
from torch.autograd.functional import jacobian
def func(x):
    return torch.matmul(x,x.T)
x= torch.tensor([[1,2,3],[4,5,6]],dtype=torch.float32)
out=jacobian(func,x)
```

```python
out.shape
# torch.Size([2, 2, 2, 3])
```

out的值为

```
tensor([[[[ 2.,  4.,  6.],
          [ 0.,  0.,  0.]],

         [[ 4.,  5.,  6.],
          [ 1.,  2.,  3.]]],


        [[[ 4.,  5.,  6.],
          [ 1.,  2.,  3.]],

         [[ 0.,  0.,  0.],
          [ 8., 10., 12.]]]])
```



### 解析

对于上例的func函数，
$$
\begin{bmatrix} 
x_{11}&x_{12}&x_{13} \\ 
x_{21}&x_{22}&x_{23}\\
\end{bmatrix}
\cdot
\begin{bmatrix} 
x_{11}&x_{21} \\ 
x_{12}&x_{22} \\
x_{13}&x_{23} \\
\end{bmatrix}
=
\begin{bmatrix} 
x_{11}^2+x_{12}^2+x_{13}^2 &
x_{11}x_{21}+x_{12}x_{22}+x_{13}x_{23} \\ 
x_{21}x_{11}+x_{22}x_{12}+x_{23}x_{13} &
x_{21}^2+x_{22}^2+x_{23}^2\\
\end{bmatrix}
$$


其雅可比矩阵为每一个输出对每一个输入的偏导数即4x6=24个值。

在pytorch中，jacobian函数的输出，前N维表示输出的位置，比如方程输出是2x2的矩阵，那jacobian函数输出的前两个维度代表输出的位置，后面的维度代表输入的位置，即`out[0][0]`表示第一个输出对所有输入的导数

