#### 1. 进入虚拟环境

```powershell
# winodws
conda activate 环境名称
# linux
active activate 环境名称
```

#### 2. 在当前环境里

安装ipykernel

```powershell
conda install ipykernel
```

写入kernel（--display可以舍去）


```powershell
python -m ipykernel install --user --name 环境名称 --display-name "Python (环境名称)"
# python -m ipykernel install --user --name tensorflow --display-name "Python (tensorflow1.2)"
```
“环境名称”为当前虚拟环境的名称，最后面引号内的字符串是该虚拟环境显示在 Jupyter Notebook 界面的名字，可以随意修改。
#### 3. 退出虚拟环境
启动 Jupyter Notebook：

![image-20200607103208772](imags/image-20200607103208772.png)


参考： https://xirikm.net/2019/319-1





注意：nb_conda只能使用python2和python3两种环境。



#### 4. 查看所有kernel

```shell
jupyter kernelspec list
```

#### 5. 卸载指定核

```shell
jupyter kernelspec remove kernel_name
```

