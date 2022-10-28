flatten是如何展平的？



按行展平



```shell
>>> x.flatten()
tensor([1, 2, 3, 4, 5, 6])
>>> x
tensor([[1, 2],
        [3, 4],
        [5, 6]])
>>> x.flatten().reshape(2,3)
tensor([[1, 2, 3],
        [4, 5, 6]])
```

