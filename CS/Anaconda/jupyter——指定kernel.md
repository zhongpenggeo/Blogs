### jupyter 指定kernel打开

#### 命令行指定

```shell
jupyter lab --MultiKernelManager.default_kernel_name=FNO --config=~/.jupyter/jupyter_pz_config.py
```



#### config文件指定

在config.py中写入：

```configure
c.MultiKernelManager.default_kernel_name = 'GT'
```



[Config file and command line options — Jupyter Notebook 6.4.3 documentation (jupyter-notebook.readthedocs.io)](https://jupyter-notebook.readthedocs.io/en/stable/config.html)