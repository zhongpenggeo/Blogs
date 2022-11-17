### 流迭代器

#### 输入流

```C++
std::istream_iterator<double> eos;
std::istream_iterator<double> iit(std::cin); // 读取cin输入数据
```

```C++
#include <iostream>
#include <iterator>
using namespace std;
int main() {
    //用于接收输入流中的数据
    double value1, value2;
    cout << "请输入 2 个小数: ";
    //创建表示结束的输入流迭代器
    istream_iterator<double> eos;
    //创建一个可逐个读取输入流中数据的迭代器，同时这里会让用户输入数据
    istream_iterator<double> iit(cin);
    //判断输入流中是否有数据
    if (iit != eos) {
        //读取一个元素，并赋值给 value1
        value1 = *iit;
    }
    //如果输入流中此时没有数据，则用户要输入一个；反之，如果流中有数据，iit 迭代器后移一位，做读取下一个元素做准备
    iit++;
    if (iit != eos) {
        //读取第二个元素，赋值给 value2
        value2 = *iit;
    }
    //输出读取到的 2 个元素
    cout << "value1 = " << value1 << endl;
    cout << "value2 = " << value2 << endl;
    return 0;
}
```

> 请输入 2 个小数: 1.2 2.3
> value1 = 1.2
> value2 = 2.3

#### 输出流

```C++
#include <iostream>
#include <iterator>
#include <string>
using namespace std;
int main() {
    //创建一个输出流迭代器
    ostream_iterator<string> out_it(cout);
    //向 cout 输出流写入 string 字符串
    *out_it = "http://c.biancheng.net/stl/";
    cout << endl;
    //创建一个输出流迭代器，设置分隔符 ,
    ostream_iterator<int> out_it1(cout, ",");
    //向 cout 输出流依次写入 1、2、3
    *out_it1 = 1;
    *out_it1 = 2;
    *out_it1 = 3;
    return 0;
}
```

> http://c.biancheng.net/stl/
> 1,2,3,

### 实际用法

和`copy()`函数配合，实现读取流数据建立容器。

```C++
#include <iostream>
#include <iterator>
#include <vector>
#include <algorithm>    // std::copy
using namespace std;
int main() {
    //创建一个 vector 容器
    vector<int> myvector;
    //初始化 myvector 容器
    for (int i = 1; i < 10; ++i) {
        myvector.push_back(i);
    }
    //创建输出流迭代器
    std::ostream_iterator<int> out_it(std::cout, ", ");
    //将 myvector 容器中存储的元素写入到 cout 输出流中
    std::copy(myvector.begin(), myvector.end(), out_it);
    return 0;
}
```



参考：[C++ STL流迭代器(istream_iterator和ostream_iterator) (biancheng.net)](http://c.biancheng.net/view/vip_7730.html)