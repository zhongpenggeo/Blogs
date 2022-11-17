### 使用函数对象的方式

```C++
#include <iostream>
#include <set>      // set
#include <string>       // string
using namespace std;
//定义函数对象类
class cmp {
public:
    //重载 () 运算符
    bool operator ()(const string &a,const string &b) {
        //按照字符串的长度，做升序排序(即存储的字符串从短到长)
        return  (a.length() < b.length());
    }
};
int main() {
    //创建 set 容器，并使用自定义的 cmp 排序规则
    std::set<string, cmp>myset{"http://c.biancheng.net/stl/",
                               "http://c.biancheng.net/python/",
                               "http://c.biancheng.net/java/"};
    //输出容器中存储的元素
    for (auto iter = myset.begin(); iter != myset.end(); ++iter) {
            cout << *iter << endl;
    }
    return 0;
}
```

或者可以用struct格式

```C++
//定义函数对象类
struct cmp {
    //重载 () 运算符
    bool operator ()(const string &a, const string &b) {
        //按照字符串的长度，做升序排序(即存储的字符串从短到长)
        return  (a.length() < b.length());
    }
};
```



### 修改自定义数据体的值

借助 const_cast，我们可以直接修改 set 和 multiset 容器中元素的非键部分。

参考：[如何修改关联式容器中键值对的键？ (biancheng.net)](http://c.biancheng.net/view/vip_7722.html)