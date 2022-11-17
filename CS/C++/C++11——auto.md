自动推导数据类型。

auto 仅仅是一个占位符，在编译器期间它会被真正的类型所替代。或者说，C++ 中的变量必须是有明确类型的，只是这个类型是由编译器自己推导出来的。

可用于：



不可用于：

- 函数参数，以为参数在调用时才赋值
- 不能定义数组
- auto 不能作用于类的非静态成员变量（也就是没有 static 关键字修饰的成员变量）中。

## 主要优势

### 1. 定义迭代器

之前的代码：

```C++
#include <vector>
using namespace std;

int main(){
    vector< vector<int> > v;
    vector< vector<int> >::iterator i = v.begin();
    return 0;
}
```

C++11风格：

```C++
#include <vector>
using namespace std;
int main(){
    vector< vector<int> > v;
    auto i = v.begin();  //使用 auto 代替具体的类型
    return 0;
}
```

### 2. 泛型编程

不知道变量是什么类型，或者不希望指明具体类型的时候，比如泛型编程中。

```C++
#include <iostream>
using namespace std;

class A{
public:
    static int get(void){
        return 100;
    }
};

class B{
public:
    static const char* get(void){
        return "http://c.biancheng.net/cplus/";
    }
};

template <typename T>
void func(void){
    auto val = T::get();
    cout << val << endl;
}

int main(void){
    func<A>();
    func<B>();

    return 0;
}
```

本例中的模板函数 func() 会调用所有类的静态函数 get()，并对它的返回值做统一处理，但是 get() 的返回值类型并不一样，而且不能自动转换。这种要求在以前的 C++ 版本中实现起来非常的麻烦，需要额外增加一个模板参数，并在调用时手动给该模板参数赋值，用以指明变量 val 的类型。

但是有了 auto 类型自动推导，编译器就根据 get() 的返回值自己推导出 val 变量的类型，就不用再增加一个模板参数了



参考：[C++ auto类型推导完全攻略 (biancheng.net)](http://c.biancheng.net/view/6984.html)