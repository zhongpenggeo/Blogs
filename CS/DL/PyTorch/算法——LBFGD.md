#### pytorch自带的实现

The implementation in PyTorch doesn’t work for mini-batches, so we’ll input the full dataset at the same time. Better hope your dataset is reasonably sized!

不能mini-batch，需要一次性输入所有的input



#### batch version

A batch version of LBFGS is available at https://github.com/nlesc-dirac/pytorch/blob/master/lbfgsnew.py



#### 比较

