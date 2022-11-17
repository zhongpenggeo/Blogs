## 一般形式
```c++
template <class T> inline const T& max(const T& a,const T& b)
{
    
}
```
这里，T为任意数据型别，用于函数调用者指定。任何合法的识别符号都可以拿来作为参数的名称，但通常以T表示。T本身不一定要求是class。任何数据型别只要提供template定义里所用到的操作，都可以用于此template。  
此处的class为关键字，也可以用typename来表示

## 关键词typename
可以用来作为型别之前的标识符号：  
```C++
template <class T>
class Myclass {
    typename T::SubType *ptr;
    ...
};
```
这里typename指出：SubType是class T中定义的一个类型，因此ptr是一个指向T::SubType类型的指针。  
如果没有typename关键字，SubType会被作为static成员。此时T::SubType \*ptr被解释为T当中数值SubType与ptr的乘积。

T必须是一种类型，其内部必须提供定义，如：如果令Q为template的参数，
Myclass<Q> x;  
那么Q必须有定义：  

```C++
class Q {
    typedef int SubType;
    ...
}
```

子类别也可以成为数据类型：
```C++
class Q {
    class SubType;
    ...
}
```

## 显式初始化
int i2 = int(); //此时会被初始化为0.  
所以在：  
```C++
template <class T>
void f()
{
    T x=T()
}
```
## 异常处理
通过异常处理，C++STL可以在不污染接口（参数和返回）的情况下处理异常。  

## namespace
与package类似；  
namespace将不同标识符号集合在一个具名作用域。  
```C++
namespace josuttis{
    class File;
    void MyGlobalFunc();
}
\\ using
josuttis::File obj;
josuttis::MyGlobalFunc();
```

如果函数的一个或多个参数是定义在namespace中，那么该函数不需要指定namespace：  
```C++
namespace josuttis{
    class File;
    void MyGlobalFunc();
}
\\ using
josuttis::File obj;
MyGlobalFunc(obj);
josuttis::MyGlobalFunc();
```
注意，using namespace josuttis会josuttis里的名字出现在namespace之外，易出现命名冲突问题

## const static members
对象的内存中包含了成员变量，不同的对象占用不同的内存，这使得不同对象的成员变量相互独立，它们的值不受其他对象的影响。例如有两个相同类型的对象 a、b，它们都有一个成员变量 m_name，那么修改 a.m_name 的值不会影响 b.m_name 的值。

可是有时候我们希望在多个对象之间共享数据，对象 a 改变了某份数据后对象 b 可以检测到。共享数据的典型使用场景是计数，以前面的 Student 类为例，如果我们想知道班级中共有多少名学生，就可以设置一份共享的变量，每次创建对象时让该变量加 1。

在C++中，我们可以使用静态成员变量来实现多个对象共享数据的目标。静态成员变量是一种特殊的成员变量，它被关键字`static`修饰，

