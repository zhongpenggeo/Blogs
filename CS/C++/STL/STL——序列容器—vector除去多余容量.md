### shrink_to_fit

该方法的功能是将当前 vector 容器的容量缩减至和实际存储元素的个数相等。例如，在程序一的基础上，添加如下语句：

```C++
myvector.shrink_to_fit();
cout << "7、当前 myvector 拥有 " << myvector.size() << " 个元素，容量为 " << myvector.capacity() << endl;
```

### swap

`vector<int>(myvector).swap(myvector)`

先执行 vector<int>(myvector)，此表达式会调用 vector 模板类中的拷贝构造函数，从而创建出一个临时的 vector 容器（后续称其为 tempvector）;

然后借助 swap() 成员方法对 tempvector 临时容器和 myvector 容器进行调换，此过程不仅会交换 2 个容器存储的元素，还会交换它们的容量。换句话说经过 swap() 操作，myvetor 容器具有了 tempvector 临时容器存储的所有元素和容量，同时 tempvector 也具有了原 myvector 容器存储的所有元素和容量。

当整条语句执行结束时，临时的 tempvector 容器会被销毁，其占据的存储空间都会被释放。注意，这里释放的其实是原 myvector 容器占用的存储空间。

```C++
#include <iostream>
#include <vector>
using namespace std;
int main()
{
    vector<int>myvector;
    //手动为 myvector 扩容
    myvector.reserve(1000);
    cout << "1、当前 myvector 拥有 " << myvector.size() << " 个元素，容量为 " << myvector.capacity() << endl;
    //利用 myvector 容器存储 10 个元素
    for (int i = 1; i <= 10; i++) {
        myvector.push_back(i);
    }
    //将 myvector 容量缩减至 10
    vector<int>(myvector).swap(myvector);
    cout << "2、当前 myvector 拥有 " << myvector.size() << " 个元素，容量为 " << myvector.capacity() << endl;
    return 0;
}
```

