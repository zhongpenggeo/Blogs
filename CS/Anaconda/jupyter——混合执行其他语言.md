## 魔法符号——Magics

混合执行shell、Ruby和R等语言

- 之前任何语言和IDE都是相互独立的，导致工作时需要在不同的系统间切换和拷贝／粘贴数据。
- Magic操作符可以在HTML页面中输入shell脚本以及Ruby等其它语言并混合执行，极大地提升了传统的“控制台”的生产效率。
- Magics是一个单行的标签式“命令行”系统，指示后续的代码将如何、以及被何种解释器去处理。
- Magisc与传统的shell脚本几乎没有什么区别，但是可以将多种指令混合在一起。

#### 语法

- Line magics: 以 `%` 字符开始，该行后面都为指令代码，参数用空格隔开，不需要加引号。
- Cell magics: 使用两个百分号 (`%%`)开始, 后面的整个单元（Cell）都是指令代码。
  注意，`%%`魔法操作符只在Cell的第一行使用，而且不能嵌套、重复（一个Cell只有一个）。极个别的情况，可以堆叠，但是只用于个别情况。

#### 查看所有指令

```python
%lsmagic
```

**缺省情况下，`Automagic`开关打开，不需要输入`%`符号，将会自动识别。**也可以手动开启和关闭。

```python
%automagic
```

### 1. 简单例子

 `%timeit` 魔法，计量代码的执行时间, 适用于单行和cell:

```python
%timeit np.linalg.eigvals(np.random.rand(100,100))
```

`%%capture` 魔法，用于捕获stdout/err, 可以直接显示，也可以存到变量里备用:

```python
%%capture capt
from __future__ import print_function
import sys
print('Hello stdout')
print('and stderr', file=sys.stderr)
```

#### `%%writefile` 魔法，将后续的语句写入文件中:

```python
%%writefile foo.py
print('Hello world')
```

#### 执行多行shell脚本。

```python
%%! # 等价于%%script bash
ls -l
pwd
who
```

### 2. Magics运行其他解释器

#### 1. `%%script` 交互解释器

魔法操作符, 可以在一个子进程中运行其它语言的解释器，包括: bash, ruby, perl, zsh, R, 等等.

执行时从stdin取得输入，就像你自己在键入一样。

直接在`%%script` 行后传入指令即可使用。

后续的cell中的内容将按照指示符运行，子进程的信息通过stdout/err捕获和显示。

```python
%%script python
import sys
print('hello from Python %s' % sys.version)
```

#### 2. 直接执行脚本

```python
%%script python ./lnum.py
```

#### 3. 捕获输出。

可以直接从子进程中捕获stdout/err到Python变量中, 替代直接进入stdout/err。

```python
%%bash --out output --err error
echo "hi, stdout"
echo "hello, stderr" >&2
```

```python
print(error)
print(output)
```

> hello, stderr 
>
> hi, stdout

#### 4. 后台运行 Scripts

只需添加 **`--bg`** ，即可让脚本在后台运行。
在此情况下, 输出将被丢弃，除非使用 `--out/err` 捕获输出。

```python
%%ruby --bg --out ruby_lines
```

#### 5. 函数拓展





参考：[Jupyter魔法操作符 | Notebook Share (gitbooks.io)](https://supergis.gitbooks.io/git_notebook/content/doc/jupyter_magics.html)