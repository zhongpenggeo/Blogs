- Algorithms offer fundamental services, such as ** such as searching, sorting, copying, reordering, modifying, and numeric processing**;  
- Algorithms are not member function of the container classe but instead are **glabal functions that operate with iterators**.
- 优点是可以操作不同容器中的元素，
- 缺点：用法不直观；一些数据结构的联合体可能无法使用这些算法或者不好用。

```C++
#include <algorithm>
#include <vector>
#include <iostream>
using namespace std;
int main()
{
// create vector with elements from 1 to 6 in arbitrary order
vector<int> coll = { 2, 5, 4, 1, 6, 3 };
// find and print minimum and maximum elements
auto minpos = min_element(coll.cbegin(),coll.cend());
cout << "min: " << *minpos << endl;
auto maxpos = max_element(coll.cbegin(),coll.cend());
cout << "max: " << *maxpos << endl;
// sort all elements
sort (coll.begin(), coll.end());
// find the first element with value 3
// - no cbegin()/cend() because later we modify the elements pos3 refers to
auto pos3 = find (coll.begin(), coll.end(), // range
3); // value
// reverse the order of the found element with value 3 and all following elements
reverse (pos3, coll.end());
// print all elements
for (auto elem : coll) {
cout << elem << " ";
}
cout << endl;
}
```
注意，这里`min_elemen`t函数用的cbegin()迭代（用begin()也可以），而`sort`函数用的begin()，因为sort会改变velue of the elements。  
`find`函数返回value的pos，**如果fail，返回end of range，也就是end()**，  
`reverse`把iterator之间的元素翻转；所以也不能用const iterator；

### 1.1 range
iterators的范围是：[pos1, pos2); or [pos1, pos2-1];  
注意要确保pos1的范围在前面，但是除了随机存取的容器可以用`<`判断，其他容器不能判断位置i先后，需要用编程技巧。 

### 1.2 multiple ranges
```C++
if (equal (coll1.begin(), coll1.end(), // first range
coll2.begin())) { // second range
...
}```
这里对(coll1.begin(), coll1.end()）里的数和coll2里的一一比较，同时coll2比较的范围由(coll1.begin(), coll1.end()）的元素数目决定了。  
这引出一个**大前提**：比较前确保coll2的元素数目大于或等于coll1！！。


```

**事实上，每个容器还有自己独特的成员函数拥有部分algorithms的功能。比如成员函数中的remove比algorithm中的remove好用**。