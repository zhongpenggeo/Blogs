### 拉普拉斯算子

$$
\sum_i\frac{\partial^2 u}{\partial x^2_i}
$$

即计算二阶导数的和，**等效与海塞矩阵对角线元素之和。**



## requires_grad属性

对于用cat合成的矩阵而言，下面两种情况是不一样的

情况一、

```python
a.requires_grad_()
b.requires_grad()
c = torch.cat([a,b],1)
```

情况二、

```python
c = torch.cat([a,b],1)
c.requires_grad()
```

以上两种情况并不一样，情况一可以分别对a和b求偏导，**同时也能对c求偏导**，而情况二只能对c整体求偏导，之前一直误解了。



## 代码

```python
        YY.requires_grad_()
        ZZ.requires_grad_()
        YZ = torch.cat([YY,ZZ],1)
        u_f = model(YZ,lb,ub)
        u_Y  = self.gradients(u_f,YY,True,True)[0]
        u_YY = self.gradients(u_Y,YY,True,False)[0]
        u_Z  = self.gradients(u_f,ZZ,True,True)[0]
        u_ZZ = self.gradients(u_Z,ZZ,False,False)[0]
        u_YZ = u_YY.detach() + u_ZZ.detach()
        u0 = u_f.detach()
        del u_f,u_Y,u_Z,u_YY,u_ZZ
        return u_YZ,beta*u0
    
    def gradients(self,outputs, inputs,flag0=True,flag=False):
        return torch.autograd.grad(outputs, inputs,
                grad_outputs=torch.ones_like(outputs),
                retain_graph=flag0,create_graph=flag)
```



## 范例

$$
u = [x^2t^3, x^3t^2]
$$



```python
import torch
import torch.nn as nn
def gra_fun(X):
    W=torch.tensor([[1.0],[10.0]])
    X2 = X*X
    X3 = X2*X
    y= X2*(torch.cat([X3[:,1:2],X3[:,0:1]],1))
    #y=tf.sin(tf.matmul(X*X,w))
    return y
```
对 X 求导
```python
x = torch.tensor([[4.0],[1.0]])
x.requires_grad_()
t = torch.tensor([[8.0],[2.0]])
X = torch.cat([x,t],1)
# X.requires_grad_()
y=gra_fun(X)
print(X)
print(y)
y_x = torch.cat([torch.autograd.grad(y[:,ii], x,torch.ones_like(y[:,ii]), create_graph=True)[0] for ii in range(y.size(1))],1)
print(y_x)
grad_y_x = torch.cat([torch.autograd.grad(y_x[:,ii], x,torch.ones_like(y_x[:,ii]), create_graph=True)[0] for ii in range(y_x.size(1))],1)
print(grad_y_x) 
```

> ```
> tensor([[4., 8.],
>         [1., 2.]], grad_fn=<CatBackward>)
> tensor([[8.1920e+03, 4.0960e+03],
>         [8.0000e+00, 4.0000e+00]], grad_fn=<MulBackward0>)
> tensor([[4096., 3072.],
>         [  16.,   12.]], grad_fn=<CatBackward>)
> tensor([[1024., 1536.],
>         [  16.,   24.]], grad_fn=<CatBackward>)
> ```

对 t 求导

```python
x = torch.tensor([[4.0],[1.0]])
x.requires_grad=True
t = torch.tensor([[8.0],[2.0]])
t.requires_grad_()
X = torch.cat([x,t],1)
y=gra_fun(X)
print(X)
print(y)
y_x = torch.cat([torch.autograd.grad(y[:,ii], t,torch.ones_like(y[:,ii]), create_graph=True)[0] for ii in range(y.size(1))],1)
print(y_x)
grad_y_x = torch.cat([torch.autograd.grad(y_x[:,ii], t,torch.ones_like(y_x[:,ii]), create_graph=True)[0] for ii in range(y_x.size(1))],1)
print(grad_y_x) 
```

> ```
> tensor([[4., 8.],
>         [1., 2.]], grad_fn=<CatBackward>)
> tensor([[8.1920e+03, 4.0960e+03],
>         [8.0000e+00, 4.0000e+00]], grad_fn=<MulBackward0>)
> tensor([[3072., 1024.],
>         [  12.,    4.]], grad_fn=<CatBackward>)
> tensor([[768., 128.],
>         [ 12.,   2.]], grad_fn=<CatBackward>)
> ```

对 x 和 t 求导

```python
x = torch.tensor([[4.0],[1.0]])
x.requires_grad=True
t = torch.tensor([[8.0],[2.0]])
t.requires_grad_()
X = torch.cat([x,t],1)
y=gra_fun(X)
print(X)
print(y)
y_x = torch.autograd.grad(y, t,torch.ones_like(y),create_graph=True)[0]
print(y_x)
y_xx = torch.autograd.grad(y_x, t,torch.ones_like(y_x),retain_graph=True)[0]
print(y_xx)
y_x = torch.autograd.grad(y, x,torch.ones_like(y),create_graph=True)[0]
print(y_x)
y_xx = torch.autograd.grad(y_x, x,torch.ones_like(y_x))[0]
print(y_xx)
```

> ```
> tensor([[4., 8.],
>         [1., 2.]], grad_fn=<CatBackward>)
> tensor([[8.1920e+03, 4.0960e+03],
>         [8.0000e+00, 4.0000e+00]], grad_fn=<MulBackward0>)
>         
> tensor([[4096.],
>         [  16.]], grad_fn=<SliceBackward>)
> tensor([[896.],
>         [ 14.]])
>         
> tensor([[7168.],
>         [  28.]], grad_fn=<SliceBackward>)
> tensor([[2560.],
>         [  40.]])        
> ```