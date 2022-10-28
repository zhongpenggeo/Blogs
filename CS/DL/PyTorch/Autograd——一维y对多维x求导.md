## 多元求导



从测试结果来看，本质上，向量对向量的求导是，拓展后的$m\times n$维Y对$m\times n$维的X求导的过程，根据X的尺寸，可能会出现累加的情况。

最简单的理解是这里与多维y对一维x求导一样，只是这里的$y\neq w_1x_1$，而是它们的和，但是对于求导没有影响

$$
\frac{dy}{dx}=\\
\begin{pmatrix}\frac{dy_1}{dx_{1,1}}& \frac{dy_{1}}{dx_{1,2}}& \cdots & \frac{dy_1}{dx_{1,n}}\\
\vdots & \vdots & \ddots & \vdots \\
\frac{dy_{m}}{dx_{m,1}} & \frac{dy_{m}}{dx_{m,2}} & \cdots &\frac{dy_{m}}{dx_{m,n}}\end{pmatrix}
$$

如果加减法是在不同X间进行的，那么对于求导没有影响

矩阵乘法的特性，第一行x的值只影响第一行y的值；



#### 2.2 多元高阶导数

$$ y = X^3\bigodot W$$

$$y_{1,m} = W_1X_1^3+W_2X_2^3+...+W_nX_n^3$$

最简单的理解是这里和多维y对一维x求导一样，只是这里的$y\neq w_1x_1$，而是它们的和，但是对于求导没有影响

$$
\frac{dy}{dx}=\\
\begin{pmatrix}\frac{dy_1}{dx_{1,1}}& \frac{dy_{1}}{dx_{1,2}}& \cdots & \frac{dy_1}{dx_{1,n}}\\
\vdots & \vdots & \ddots & \vdots \\
\frac{dy_{m}}{dx_{m,1}} & \frac{dy_{m}}{dx_{m,2}} & \cdots &\frac{dy_{m}}{dx_{m,n}}\end{pmatrix}
$$




```python
def gra_fun(X):
    W=torch.tensor([[2.0],[4.0]])
    y=torch.matmul(X**3,W)
    #y=tf.sin(tf.matmul(X*X,w))
    return y
```



```python
gradient=torch.ones_like(x)
grad_x = torch.autograd.grad(y, X,torch.ones_like(y), create_graph=True)[0]
print(grad_x) 
```

> ```
> tensor([[ 96., 768.],
>      [  6.,  48.]], grad_fn=<MulBackward0>)
> ```

```python
grad_y_x = torch.autograd.grad(grad_x[:,0:1], X,torch.ones_like(x), create_graph=True)
print(grad_y_x) 
```

> ```
> (tensor([[48.,  0.],
>      [12.,  0.]], grad_fn=<MulBackward0>),)
> ```

```python
grad_y_x = torch.autograd.grad(grad_x[:,1:2], X,torch.ones_like(x), create_graph=True)
print(grad_y_x) 
```

> ```
> (tensor([[  0., 192.],
>      [  0.,  48.]], grad_fn=<MulBackward0>),)
> ```

**注意不能直接对x对二阶导数。**

这样的结果是每一列为：[y_x1_x1,y_x1_x2]

**相当于把y_xx+y_xy的和放在一起了**

结果表明，确实不能直接求二阶导。因为涉及到累加过程。如果直接求，结果是两者的累加。

同时发现，一阶导也不能这样计算

### 举例

```python
grad_xx1 = torch.autograd.grad(grad_x[:,0:1], X,torch.ones_like(grad_x[:,0:1]), create_graph=True,allow_unused=True)[0]
grad_xx2 = torch.autograd.grad(grad_x[:,1:2], X,torch.ones_like(grad_x[:,0:1]), create_graph=True,allow_unused=True)[0]
print(grad_xx1) 
print(grad_xx2)
```

> ```
> tensor([[ 5832., 11664.],
>         [  108.,   324.]], grad_fn=<AddBackward0>)
> tensor([[11664., 10368.],
>         [  324.,   432.]], grad_fn=<AddBackward0>)
> ```

```python
grad_xx = torch.autograd.grad(grad_x, X,torch.ones_like(grad_x), create_graph=True,allow_unused=True)[0]
print(grad_xx)
```

> ```
> tensor([[17496., 22032.],
>         [  432.,   756.]], grad_fn=<AddBackward0>)
> ```



## 结论

多输入多输出的导数要分开计算，完全不能一起计算。



## 注意：

不能只对输入值的部分列设置可求导性