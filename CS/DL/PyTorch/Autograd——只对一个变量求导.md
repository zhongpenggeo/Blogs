结论： 不能只对一个变量求导


$$
y = w_1  x^2 + w_2 t^2
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
gradient=torch.tensor([[1.0],[1.0]])
#后面加[0]可以把tuple变成tensor类型，非常重要
grad_x = torch.autograd.grad(y, x,gradient, create_graph=True)[0]
print(grad_x) 
grad_y_x = torch.autograd.grad(grad_x, x,gradient, create_graph=True)
print(grad_y_x) 
```

> ```
> RuntimeError: One of the differentiated Tensors does not require grad
> ```



```python
gradient=torch.tensor([[1.0],[1.0]])
#后面加[0]可以把tuple变成tensor类型，非常重要
grad_x = torch.autograd.grad(y, X,gradient, create_graph=True)[0]
print(grad_x) 
grad_y_x = torch.autograd.grad(grad_x, X,torch.ones_like(grad_x), create_graph=True)
print(grad_y_x) 
```

> ```
> tensor([[16., 32.],
>         [ 4.,  8.]], grad_fn=<AddBackward0>)
> (tensor([[4., 4.],
>         [4., 4.]]),)
> ```