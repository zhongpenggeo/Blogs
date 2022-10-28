## 1. 引文

引文/citation

同时生成et al. 与等

在Style仓库中提供的国家标准`GB/T 7714-2015`对于既引用了中文文献，又有英文文献引用的情况，在文章存在多个作者需要省略时会统一使用“等”。这可能是由于笔者的系统语言设置为了中文。但是，这在引用英文文献时就不理想了。

[Jurism](https://juris-m.github.io/)提供了一个解决方案。它是一个在法律文献，多语言方面提供了增强的Zotero修改版。在其[Style仓库](https://juris-m.github.io/styles/)中提供了一个[**JM Chinese Std GB/T 7714-2005 (numeric, Chinese)**](https://our.law.nagoya-u.ac.jp/updater/styles/jm-chinese-gb7714-2005-numeric.csl?install=1)，可以根据文献的`Language`字段判断使用"et al.“还是“等”。默认的方式是英文文献需要在其`Language/语言`字段声明为`en`，否则默认视作中文文献使用“等”



## 2. 参考文献

### 参考文献中著录全部作者

找到定义参考文献的`<bibliography>`词段（通常位于最后的位置），将其中的`et-al-min`定义设置为`0`即可。`<bibliography>`词段的设置如下

| `1 ` | `<bibliography et-al-min="0" et-al-use-first="3" hanging-indent="true" line-spacing="1.5" entry-spacing="0"> ` |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

代表触发`et-al`的最小作者数是0（即不生效），使用前3个作者用于et-al之前，悬挂缩进（没找到设置缩进值的字段），1.5倍行距，entry-spacing是否指代段前段后间距不明。

### 去掉引文最后的DOI编号

在`<bibliography>`词段内，删去如下使用URL和DOI的部分。

| `1 2 3 4 ` | `<group delimiter=". " prefix=". ">  <text variable="URL"/>  <text variable="DOI" prefix="DOI:"/> </group> ` |
| ---------- | ------------------------------------------------------------ |
|            |                                                              |

### 按照作者姓名-出版年排序参考文献

在`<bibliography>`词段内，保证插入如下部分。

| `1 2 3 4 ` | `<sort>  <key macro="author-intext"/>  <key macro="issue-date-year" sort="ascending"/>` |
| ---------- | ------------------------------------------------------------ |
|            |                                                              |





参考：

[自定义Zotero Style - SR-C](https://sr-c.github.io/2021/02/24/zotero-style-for-ucas-dissertation/)