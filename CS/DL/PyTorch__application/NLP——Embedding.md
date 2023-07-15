### CLASS
> torch.nn.Embedding(*num_embeddings*, *embedding_dim*, *padding_idx=None*, *max_norm=None*, *norm_type=2.0*, *scale_grad_by_freq=False*, *sparse=False*, *_weight=None*, *_freeze=False*, *device=None*, *dtype=None*)[[SOURCE\]](https://pytorch.org/docs/stable/_modules/torch/nn/modules/sparse.html#Embedding)

一个简单的查找表，存储一个固定字典和尺寸的embedding

- 输入：索引（list）； 
  - (∗), IntTensor or LongTensor of arbitrary shape containing the indices to extract

- 输出：对应的 word embedding；
  - (∗,*H*), where * is the input shape and H=embedding_dim *H*=embedding_dim


#### 参数

- **num_embeddings** ([*int*](https://docs.python.org/3/library/functions.html#int)) ：embedding字典的尺寸
- **embedding_dim** ([*int*](https://docs.python.org/3/library/functions.html#int)) ：每个embedding vector的尺寸

#### 变量

**weight** ([*Tensor*](https://pytorch.org/docs/1.13/tensors.html#torch.Tensor)) – the learnable weights of the module of shape (num_embeddings, embedding_dim) initialized from $\mathcal{N}(0,1)$

#### 范例

```shell
>>> # an Embedding module containing 10 tensors of size 3
>>> embedding = nn.Embedding(10, 3)
>>> # a batch of 2 samples of 4 indices each
>>> input = torch.LongTensor([[1,2,4,5],[4,3,2,9]])
>>> embedding(input)
tensor([[[-0.0251, -1.6902,  0.7172],
         [-0.6431,  0.0748,  0.6969],
         [ 1.4970,  1.3448, -0.9685],
         [-0.3677, -2.7265, -0.1685]],

        [[ 1.4970,  1.3448, -0.9685],
         [ 0.4362, -0.4004,  0.9400],
         [-0.6431,  0.0748,  0.6969],
         [ 0.9124, -2.3616,  1.1151]]])


>>> # example with padding_idx
>>> embedding = nn.Embedding(10, 3, padding_idx=0)
>>> input = torch.LongTensor([[0,2,0,5]])
>>> embedding(input)
tensor([[[ 0.0000,  0.0000,  0.0000],
         [ 0.1535, -2.0309,  0.9315],
         [ 0.0000,  0.0000,  0.0000],
         [-0.1655,  0.9897,  0.0635]]])

```



参考：[Embedding — PyTorch 1.13 documentation](https://pytorch.org/docs/1.13/generated/torch.nn.Embedding.html?highlight=embedding#torch.nn.Embedding)