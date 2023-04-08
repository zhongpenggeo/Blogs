Generative Pre_Training（GPT）

transformer的Decoder（BERT是Encoder）

![image-20230404111037062](./imags/image-20230404111037062.png)

<figure align="center"> <font color="#0000FF">a为token，查询q要与上下文的k做self attention，再与每一个v做乘积求和得到输出</font> </figure>

### zero-shot learning

- reading comprehension：完全无需标签数据（BERT需要）
- summarization
- translation