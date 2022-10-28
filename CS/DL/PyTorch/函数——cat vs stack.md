```
stack
```

> Concatenates sequence of tensors along a **new dimension**.

```
cat
```

> Concatenates the given sequence of seq tensors **in the given dimension**.

So if `A` and `B` are of shape (3, 4), `torch.cat([A, B], dim=0)` will be of shape (6, 4) and `torch.stack([A, B], dim=0)` will be of shape (2, 3, 4).



stack增加一个维度

cat增加维度内的元素