爱因斯坦求和算子

$$y=c_ix^i$$

等效于：

$$y=\sum^3_{i=1}c_ix^i$$





```
torch.einsum(equation, *operands)
```

矩阵乘法表示为： `torch.einsum(“ij,jk->ik”, A, B)`，j是求和下标，而i、k是输出下标。

#### equation 

输入数据诶个维度的下标，用`,`分离，二维用两个字母，用相同字母的下标需要broadcastable，即维度要相等；

箭头`->`是表示输出，`ij,jk->ki`，矩阵乘法的转置。

`...`表示，注意这里与numpy的处理不同；

```python
>>> b=torch.tensor([[1,2,3],[4,5,6],[7,8,9]])
>>> b
tensor([[1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]])

# trace,对角线求和；a_ii
>>> torch.einsum('ii',b)
tensor(15)

# 对角线取值
>>> torch.einsum('ii->i',b)
tensor([1, 5, 9])

# outer product
>>> x=torch.tensor([1,2,3])
>>> y=torch.tensor([4,5,6])
>>> torch.einsum('i,j->ij', x, y)
tensor([[ 4,  5,  6],
        [ 8, 10, 12],
        [12, 15, 18]])
>torch.einsum('i,j->ji', x, y)
tensor([[ 4,  8, 12],
        [ 5, 10, 15],
        [ 6, 12, 18]])
```

