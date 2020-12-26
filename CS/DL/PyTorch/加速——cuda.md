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







参考：

https://blog.csdn.net/qq_21578849/article/details/85240797