和 map 容器一样，实现 multimap 容器的类模板也定义在`<map>`头文件，并位于 std 命名空间中。

和 map 容器的区别在于，multimap 容器中可以同时存储多（≥2）个键相同的键值对。

和 map 容器相比，multimap 未提供 at() 成员方法，也没有重载 [] 运算符。这意味着，map 容器中通过指定键获取指定指定键值对的方式，将不再适用于 multimap 容器。其实这很好理解，因为 multimap 容器中指定的键可能对应多个键值对，而不再是 1 个。

> 另外值的一提的是，由于 multimap 容器可存储多个具有相同键的键值对，因此表 1 中的 lower_bound()、upper_bound()、equal_range() 以及 count() 成员方法会经常用到。

```C++
#include <iostream>
#include <map>  //map
using namespace std;   

int main()
{
    //创建并初始化 multimap 容器
    multimap<char, int>mymultimap{ {'a',10},{'b',20},{'b',15}, {'c',30} };
    //输出 mymultimap 容器存储键值对的数量
    cout << mymultimap.size() << endl;
    //输出 mymultimap 容器中存储键为 'b' 的键值对的数量
    cout << mymultimap.count('b') << endl;

    for (auto iter = mymultimap.begin(); iter != mymultimap.end(); ++iter) {
        cout << iter->first << " " << iter->second << endl;
    }
    return 0;
}
```





参考：[C++ STL multimap容器用法完全攻略（超详细） (biancheng.net)](http://c.biancheng.net/view/7190.html)