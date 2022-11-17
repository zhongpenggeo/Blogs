### 定义

string是一个常用类，包含在头文件`<string>`中。

```C++
#include <iostream>
#include <string>
using namespace std;
int main(){
    string s1;
    string s2 = "c plus plus";
    string s3 = s2;
    string s4 (5, 's');
    return 0;
}
```

变量 s1 只是定义但没有初始化，编译器会将默认值赋给 s1，默认值是`""`，也即空字符串。

变量 s2 在定义的同时被初始化为`"c plus plus"`。与C风格的字符串不同，string 的结尾没有结束标志`'\0'`。

变量 s3 在定义的时候直接用 s2 进行初始化，因此 s3 的内容也是`"c plus plus"`。

变量 s4 被初始化为由 5 个`'s'`字符组成的字符串，也就是`"sssss"`。

### 转换为C风格

使用`c_str()`成员函数。

```C++
string path = "D:\\demo.txt";
FILE *fp = fopen(path.c_str(), "rt");
```

#### 访问

可以使用类似数组的索引访问

#### 拼接

使用`+`，或者使用`insert()`成员函数

#### 删除

`erase()`成员函数

```C++
string& erase (size_t pos = 0, size_t len = npos);
```

```C++
#include <iostream>
#include <string>
using namespace std;
int main(){
    string s1, s2, s3;
    s1 = s2 = s3 = "1234567890";
    s2.erase(5);
    s3.erase(5, 3);
    cout<< s1 <<endl;
    cout<< s2 <<endl;
    cout<< s3 <<endl;
    return 0;

```

运行结果：
1234567890
12345
1234590

#### 提取子字符串

使用`substr()`成员函数，和erase用法类似。原型为：

```C++
string substr (size_t pos = 0, size_t len = npos) const;
```

```C++
#include <iostream>
#include <string>
using namespace std;
int main(){
    string s1 = "first second third";
    string s2;
    s2 = s1.substr(6, 6);
    cout<< s1 <<endl;
    cout<< s2 <<endl;
    return 0;
}
```

### 查找

#### find

原型：

```C++
size_t find (const string& str, size_t pos = 0) const;
size_t find (const char* s, size_t pos = 0) const;
```

```C++
#include <iostream>
#include <string>
using namespace std;
int main(){
    string s1 = "first second third";
    string s2 = "second";
    int index = s1.find(s2,5);
    if(index < s1.length())
        cout<<"Found at index : "<< index <<endl;
    else
        cout<<"Not found"<<endl;
    return 0;
}
```

find() 函数最终返回的是子字符串第一次出现在字符串中的起始下标。本例最终是在下标 6 处找到了 s2 字符串。如果没有查找到子字符串，那么会返回 string::npos，

#### rfind

rfind() 和 find() 很类似，同样是在字符串中查找子字符串，不同的是 find() 函数从第二个参数开始往后查找，而 rfind() 函数则最多查找到第二个参数处，如果到了第二个参数所指定的下标还没有找到子字符串，则返回 string::npos。

#### find_first_of() 函数

find_first_of() 函数用于查找子字符串和字符串共同具有的字符在字符串中首次出现的位置。请看下面的代码：

```C++
#include <iostream>
#include <string>
using namespace std;
int main(){
    string s1 = "first second second third";
    string s2 = "asecond";
    int index = s1.find_first_of(s2);
    if(index < s1.length())
        cout<<"Found at index : "<< index <<endl;
    else
        cout<<"Not found"<<endl;
    return 0;
}
```

本例中 s1 和 s2 共同具有的字符是‘s’，该字符在 s1 中首次出现的下标是3，故查找结果返回3。

参考：[C++ string详解，C++字符串详解 (biancheng.net)](http://c.biancheng.net/view/2236.html)

