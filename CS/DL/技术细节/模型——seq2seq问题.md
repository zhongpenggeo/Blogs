之前我们都把输入当作一个vector，但现在输入和输出都是一系列vector

## self-attention

解决seq2seq问题中上下文之间没有联系的问题

<img src="../imags/image-20210812212920723.png" alt="image-20210812212920723" style="zoom:50%;" />

attention：计算相似度，可以用dot-product、addictive

![image-20210812213521167](../imags/image-20210812213521167.png)

之后可以用soft-max归一化，也可以用其他

![image-20210812213852557](../imags/image-20210812213852557.png)

b的值可能决定于α，那么b越大可能接近于相对应的v的值

输入是I，即原始输入值经过hidden layer得到，，输出是O，self-attention的操作为：

![image-20210812215141396](../imags/image-20210812215141396.png)

## 多头self-attention



## positional encoding

![image-20210812220518090](../imags/image-20210812220518090.png)

可以用三角函数代表位置

## attention vs CNN

attention不需要人为指定filter

![image-20210812222558699](../imags/image-20210812222558699.png)



对比RNN：可以并行处理