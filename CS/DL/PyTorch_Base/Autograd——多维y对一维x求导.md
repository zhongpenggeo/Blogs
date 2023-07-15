## $m\times n$维的求导

- x: [m,1]
- w: [1,n]
- y: [m,n]

#### 求导
$$
\frac{dy}{dx}=\\
\begin{pmatrix}
\frac{dy_{1,1}}{dx_1}& \frac{dy_{1,2}}{dx_1}& \cdots & \frac{dy_{1,n}}{dx_1}\\
\vdots & \vdots & \ddots & \vdots \\
\frac{dy_{m,1}}{dx_m} & \frac{dy_{m,2}}{dx_m} & \cdots &\frac{dy_{m,n}}{dx_m}
\end{pmatrix}
$$

#### 方法
**由于grad最多只能向量对向量求导，所以需要每一列的y对x求导**

#### 实例

$$ y = X^3\bigodot W$$

```python
def gra_fun(X):
    W=torch.tensor([[2.0,4.0]])
    y=torch.matmul(X**3,W)
    #y=tf.sin(tf.matmul(X*X,w))
    return y

x = torch.tensor([[4.0],[1.0]])
# t = torch.tensor([[8.0],[2.0]])
# X = torch.cat([x,t],1)
X = x
X.requires_grad=True

#y=torch.matmul(X*X,W)
y=gra_fun(X)
print(X)
print(y)
# results
# tensor([[4.],
#         [1.]], requires_grad=True)
# tensor([[128., 256.],
#         [  2.,   4.]], grad_fn=<MmBackward>)

torch.cat([torch.autograd.grad(y[:,ii], X,torch.tensor([1.0,1.0]), 
                              create_graph=True,allow_unused=True)[0]
           for ii in range(y.size(1))
          ],1)
# results
# tensor([[ 96., 192.],
#         [  6.,  12.]], grad_fn=<CatBackward>)
```

如果常规写法：  
```python
gradients = torch.ones_like(y)
y.backward(gradients)
print(X.grad)
```

> ```
> tensor([[288.],
>         [ 18.]])
> ```





## 另外一种方法

$$y = W X^3$$

因为输出的维度取决于X的尺寸，所以：直接把X扩张为$m\times n$维，使用点积而不是矩阵乘法。

但是这里只是示范，实际似乎不太实用

```python
def gra_fun2(X):
    W=torch.tensor([[2.0,4.0]])
    y=X**3*W # 注意这里用的点积而不是matmul
    #y=tf.sin(tf.matmul(X*X,w))
    return y
# 注意 X 的扩张
x = torch.tensor([[4.0,4.0],[1.0,1.0]])
# t = torch.tensor([[8.0],[2.0]])
# X = torch.cat([x,t],1)
X = x
X.requires_grad=True

#y=torch.matmul(X*X,W)
y=gra_fun2(X)
print(X)
print(y)
gradients = torch.ones_like(y)
```

> ```
> tensor([[4., 4.],
>         [1., 1.]], requires_grad=True)
> tensor([[128., 256.],
>         [  2.,   4.]], grad_fn=<MulBackward0>)
> ```

```python
torch.autograd.grad(y,X,gradients, create_graph=True,allow_unused=True)[0]
```

> ```
> tensor([[ 96., 192.],
>         [  6.,  12.]], grad_fn=<MulBackward0>)
> ```

```python
y.backward(gradients)
print(X.grad)
```

> ```
> tensor([[ 96., 192.],
>         [  6.,  12.]])
> ```



## 总结

第一种方法其实和第二种方法的结果本质上是一样的，但是由于X只有一维，而输出的Y有多维，求导过程相当于把所有Y对X的导数累加了