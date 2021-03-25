结论： 不能只对一个变量求导


$$
y = X^2\cdot X
$$

```python
import torch
import torch.nn as nn

def gra_fun(X):
    W=torch.tensor([[2.0],[2.0]])
    y=torch.matmul(X*X,W)
    #y=tf.sin(tf.matmul(X*X,w))
    return y

x = torch.tensor([[4.0],[1.0]])
t = torch.tensor([[8.0],[2.0]])
X = torch.cat([x,t],1)
X.requires_grad_()
y=gra_fun(X)
```



```python
print(X)
gradient=torch.tensor([[1.0],[1.0]])
#后面加[0]可以把tuple变成tensor类型，非常重要

a = torch.cat([torch.autograd.grad(y[:,ii], X,torch.tensor([1.0,1.0]), 
                              create_graph=True,allow_unused=True)[0][:,0:1]
           for ii in range(y.size(1))
          ],1)

b = torch.cat([torch.autograd.grad(y[:,ii], X,torch.tensor([1.0,1.0]), 
                              create_graph=True,allow_unused=True)[0][:,1:2]
           for ii in range(y.size(1))
          ],1)
print(a)
print(b)
grad_x = torch.autograd.grad(y, X,torch.ones_like(y), create_graph=True)[0]
print(grad_x) 
grad_y_x = torch.autograd.grad(grad_x, X,torch.ones_like(grad_x))
print(grad_y_x) 
```

> ```
> tensor([[4., 8.],
>         [1., 2.]], requires_grad=True)
> tensor([[49., 64.],
>         [76., 16.]], grad_fn=<CatBackward>)
> tensor([[16., 49.],
>         [ 4., 76.]], grad_fn=<CatBackward>)
> tensor([[113.,  65.],
>         [ 92.,  80.]], grad_fn=<AddBackward0>)
> (tensor([[50., 48.],
>         [48., 34.]]),)
> ```

由上可见，每一个对应位置的梯度:

$$\nabla y_{i,j} =\sum_{i=0}\frac{\partial y_i}{\partial x_j}$$