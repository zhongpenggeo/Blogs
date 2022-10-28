#### 启动

通过命令行 （command） 或在 notebook 体验中启动 TensorBoard ，这两个接口通常是相同的。 在 notebooks, 使用 `%tensorboard` 命令。 在命令行中， 运行不带“％”的相同命令。

## tf.summary()

在训练过程中记录数据的利器：tf.summary()提供了各类方法（支持各种多种格式）用于保存训练过程中产生的数据（比如loss_value、accuracy、整个variable），这些数据以日志文件的形式保存到指定的文件夹中。

数据可视化：而tensorboard可以将tf.summary()记录下来的日志可视化，根据记录的数据格式，生成折线图、统计直方图、图片列表等多种图。

tf.summary()通过递增的方式更新日志，这让我们可以边训练边使用tensorboard读取日志进行可视化，从而实时监控训练过程。

#### 1. 基本步骤

```python
# （1）创建一个 SummaryWriter 对象，生成的日志将储存到 "./mylogs" 路径中
writer_1 = tf.summary.create_file_writer("./mylogs")  #
# （2）使用 writer_1 记录with包裹的context中，进行 summary 写入的操作
with writer_1.as_default():  
    for step in range(100):    
        # other model code would go here    
        # （3）将scalar("loss", loss, step)写入 summary 
        tf.summary.scalar("loss", loss, step=step)  
        tf.summary.scalar("loss", loss, step=step)
        tf.summary.scalar("loss", loss, step=step)
        # （4）强制 SummaryWriter 将缓存中的数据写入到日志
        writer.flush()  
```
#### 2. 产看Graph 和 Profile的信息
- trace_export()：停止trace，并将之前trace记录到的信息写入profiler日志文件。
- trace_off()：停止trace，并舍弃之前trace记录。
- trace_on()：开始trace

我们可以在训练时使用 tf.summary.trace_on 开启 Trace，此时 TensorFlow 会将训练时的大量信息（如计算图的结构，每个操作所耗费的时间等）记录下来。在训练完成后，使用 tf.summary.trace_export 将记录结果输出到文件。

```python
writer = tf.summary.create_file_writer(log_dir)
tf.summary.trace_on(graph=True, profiler=True)  # 开启Trace，可以记录图结构和profile信息
"""
进行训练
"""
# 最后将统计信息写入日志
with writer.as_default():
    tf.summary.trace_export(name="model_trace", step=0, profiler_outdir=log_dir)
```

原文链接：https://blog.csdn.net/weixin_39498935/java/article/details/105974714

参考：http://studyai.com/pytorch-1.4/intermediate/tensorboard_tutorial.html