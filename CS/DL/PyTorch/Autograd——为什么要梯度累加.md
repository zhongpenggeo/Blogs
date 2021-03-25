#### 为什么梯度可以累加

假设模型为：

$$h_{\theta}(x_1, x_2, ..., x_n) = \theta_0 + \theta_1 x_1 + ... + \theta_n x_n  = \sum_{i=0}^{n}\theta_{i}x_{i}，x_0 = 1$$

则损失函数为：

$$J(\theta_0, \theta_1, ..., \theta_n) = \frac{1}{2m}\sum_{j=0}^{m} (h_{\theta}^{j}(x_0, x_1, ..., x_n) - y_{j}) ^ 2$$

**计算梯度：**

$$\frac{\partial}{\partial \theta_i} J(\theta_0, \theta_1, ..., \theta_n)=\frac{1}{m}\sum_{j=0}^{m}(h_{\theta}^{j}(x_0, x_1, ..., x_n) - y_{j})x_{i}^{j}$$

注意这里：

因为（代数和的导数等于导数的和）：
$$
\frac{\partial(l1+l2)}{\partial(x)} = \frac{\partial(l1)}{\partial(x)}+\frac{\partial(l)2}{\partial(x)}
$$

也就是说：不管参与计算的y和x有多少个，最后都会求一个平均值。

更新参数$\theta$的表达式

$$\frac{\partial}{\partial \theta_i} J(\theta_0, \theta_1, ..., \theta_n)=\frac{1}{m}\sum_{j=0}^{m}(h_{\theta}^{j}(x_0, x_1, ..., x_n) - y_{j})x_{i}^{j}$$

#### 传统方法训练

```python
for i,(images,target) in enumerate(train_loader):
    # 1. input output
    images = images.cuda(non_blocking=True)
    target = torch.from_numpy(np.array(target)).float().cuda(non_blocking=True)
    outputs = model(images)
    loss = criterion(outputs,target)

    # 2. backward
    optimizer.zero_grad()   # reset gradient
    loss.backward()
    optimizer.step()
```
简单的说就是进来一个batch（一个小组的数据）的数据，计算一次梯度，更新一次网络

### 使用梯度累加时
#### 减少内存
```python
for i,(images,target) in enumerate(train_loader):
    # 1. input output
    images = images.cuda(non_blocking=True)
    target = torch.from_numpy(np.array(target)).float().cuda(non_blocking=True)
    outputs = model(images)
    loss = criterion(outputs,target)

    # 2.1 loss regularization
    loss = loss/accumulation_steps
    # 2.2 back propagation
    loss.backward()

    # 3. update parameters of net
    if((i+1)%accumulation_steps)==0:
        # optimizer the net
        optimizer.step()        # update parameters of net
        optimizer.zero_grad()   # reset gradient
```
总结来说：梯度累加就是，每次获取1个batch的数据，计算1次梯度，梯度不清空，不断累加，累加n个batch后，根据累加的梯度更新网络参数，然后清空梯度，进行下一次循环

和一次加载一个大batch(=n\* small batch)比，只需要更小1/n的内存就可以得到和dabatch一样的效果。

#### 减少计算图内存
```python
for idx, data in enumerate(train_loader):
    xs, ys = data
    pred1 = model1(xs)
    pred2 = model2(xs)

    loss1 = loss_fn1(pred1, ys)
    loss2 = loss_fn2(pred2, ys)

    ******
    loss = loss1 + loss2
    optmizer.zero_grad()
    loss.backward()
    ++++++
    optmizer.step()
```
从PyTorch的设计原理上来说，在每次进行前向计算得到pred时，会产生一个**用于梯度回传的计算图，这张图储存了进行back propagation需要的中间结果，当调用了 ****.backward()** 后，会从内存中将这张图进行释放。

上述代码执行到 ****** 时，内存中是包含了两张计算图的，而随着求和得到loss，这两张图进行了合并，而且大小的变化可以忽略。
执行到 ++++++ 时，得到对应的grad值并且释放内存。这样，训练时必须存储两张计算图，而如果loss的来源组成更加复杂，内存消耗会更大。

因为：
$$
\frac{\partial(l1+l2)}{\partial(x)} = \frac{\partial(l1)}{\partial(x)}+\frac{\partial(l)2}{\partial(x)}
$$

所以有以下变种
```python
for idx, data in enumerate(train_loader):
    xs, ys = data

    optmizer.zero_grad()

    # 计算d(l1)/d(x)
    pred1 = model1(xs) #生成graph1
    loss = loss_fn1(pred1, ys)
    loss.backward()  #释放graph1

    # 计算d(l2)/d(x)
    pred2 = model2(xs)#生成graph2
    loss2 = loss_fn2(pred2, ys)
    loss2.backward()  #释放graph2

    # 使用d(l1)/d(x)+d(l2)/d(x)进行优化
    optmizer.step()
````