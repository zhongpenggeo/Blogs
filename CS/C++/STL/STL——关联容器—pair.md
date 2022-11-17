考虑到“键值对”并不是普通类型数据，[C++](http://c.biancheng.net/cplus/) [STL](http://c.biancheng.net/stl/) 标准库提供了 pair 类模板，其专门用来将 2 个普通元素 first 和 second（可以是 C++ 基本数据类型、结构体、类自定的类型）创建成一个新元素`<first, second>`。通过其构成的元素格式不难看出，使用 pair 类模板来创建“键值对”形式的元素，再合适不过。



参考：[C++ STL pair用法详解 (biancheng.net)](http://c.biancheng.net/view/7169.html)