多个loss函数

```python
#one
loss1.backward()
loss2.backward()
loss3.backward()
optimizer.step()
#two wrong！
loss1.backward()
optimizer.step() 
loss2.backward()
optimizer.step() 
loss3.backward()
optimizer.step()   
#three
loss = loss1+loss2+loss3
loss.backward()
optimizer.step()
```

First and 3rd attempt are exactly the same and correct, while 2nd approach is completely wrong.

Reason is, in Pytorch, low layer gradients are **Not** "overwritten" by subsequent `backward()` calls, rather they are accumulated, or summed. This makes first and 3rd approach identical, though 1st approach might be preferable if you have low-memory GPU/RAM, since a batch size of 1024 with immediate `backward() + step()` call is same as having 8 batches of size 128 and 8 `backward()` calls, with one `step()` call in the end.

参考：https://www.thetopsites.net/article/53994625.shtml

#### 第二种也可以

```python
Y = model(X,0,0)
loss1 = torch.sum(Y)
grad_u = torch.autograd.grad(loss1,model.parameters(),retain_graph=True)

optimizer.zero_grad()
loss1.backward()
for param, grad_f0 in zip(model.parameters(), grad_u):
        print(param.grad.data-grad_f0)
        
# loss2
optimizer.step()
optimizer.zero_grad()
X2 = torch.zeros(3,2)
Y2 = func(model,X2)
loss2 = torch.sum(Y2)
grad_f = torch.autograd.grad(loss2,model.parameters(),retain_graph=True)
loss2.backward(retain_graph=True)
for param, grad_f0 in zip(model.parameters(), grad_f):
        print(param.grad.data-grad_f0)
```

输出都是0，所以第二种方式也是可以的