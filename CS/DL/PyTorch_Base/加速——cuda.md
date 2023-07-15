### 使用GPU训练

模型转为cuda，数据转为cuda，和输出数据去cuda，转为numpy。修改的地方包括将数据的形式变成 GPU 能读的形式, 然后将 网络模型 也变成 GPU 能读的形式。做法就是在后面加上 .cuda() 。

1、模型转为cuda

```
gpus = [0]   #使用哪几个GPU进行训练，这里选择0号GPU
cuda_gpu = torch.cuda.is_available()   #判断GPU是否存在可用
net = Net(12288, 25, 16, 6)
if(cuda_gpu):
    net = torch.nn.DataParallel(net, device_ids=gpus).cuda()   #将模型转为cuda类型
12345
```

2、数据转为cuda

```
(minibatchX, minibatchY) = minibatch
minibatchX = minibatchX.astype(np.float32).T
minibatchY = minibatchY.astype(np.float32).T
if(cuda_gpu):
    b_x = Variable(torch.from_numpy(minibatchX).cuda())    #将数据转为cuda类型
    b_y = Variable(torch.from_numpy(minibatchY).cuda())
else:
    b_x = Variable(torch.from_numpy(minibatchX))
    b_y = Variable(torch.from_numpy(minibatchY))
123456789
```

3、输出数据去cuda，转为numpy

```
correct_prediction = sum(torch.max(output, 1)[1].data.squeeze() == torch.max(b_y, 1)[1].data.squeeze())
if(cuda_gpu):
    correct_prediction = correct_prediction.cpu().numpy()   #.cpu将cuda转为tensor类型，.numpy将tensor转为numpy类型
else:
    correct_prediction = correct_prediction.numpy()
```



## to(device)用法

#### 把模型放到device上

```python
device = torch.device("cuda:0" if torch.cuda.is_available() else "cpu")

model.to(device)
```

#### 数据放到device

```python
mytensor = my_tensor.to(device)
```

这行代码的意思是将所有最开始读取数据时的tensor变量copy一份到device所指定的[GPU](https://cloud.tencent.com/product/gpu?from=10680)上去，之后的运算都在GPU上进行。

### 多GPU

```python
device = torch.device("cuda:0" if torch.cuda.is_available() else "cpu")
model = Model()

if torch.cuda.device_count() > 1:
	model = nn.DataParallel(model，device_ids=[0,1,2])

model.to(device)
```



## 指定GPU

#### 直接终端设定

```python
CUDA_VISIBLE_DEVICES=1
```



#### 代码中设定

```python
import os

os.environ['CUDA_VISIBLE_DEVICE']='1'
```

#### 使用函数

```python
import torch


torch.cuda.set_device(id)
```



```python
os.environ['CUDA_VISIBLE_DEVICES'] = '1, 2, 3'
device = torch.device("cuda:0" if torch.cuda.is_available() else "cpu")

if torch.cuda.device_count() > 1:
    print(torch.cuda.device_count(), "Gpus")
    MagNet = torch.nn.DataParallel(MagNet)
MagNet.to(device)
```



参考：

[Pytorch：使用GPU训练_idotc的博客-CSDN博客_pytorch使用gpu训练](https://blog.csdn.net/qq_21578849/article/details/85240797)

[Pytorch的to(device)用法 - 云+社区 - 腾讯云 (tencent.com)](https://cloud.tencent.com/developer/article/1582572)