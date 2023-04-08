## Array 类有什么用？

Array 类提供了一个一般用途的数组，用于操作元素相关算法，就像 Matrix 专门用于实现线性代数算法。更具体一点，Array 提供了对元素进行操作的方法，这些操作大部分与线性代数算法无关。比如数组中每个元素都加一个常量或者两个同维数组对应元素相乘。

**注意与`array()`成员方法的区别**

### Array类型

```C++
Array<typename Scalar, int RowsAtCompileTime, int ColsAtCompileTime>
```

与 Matrix 相同，Eigen 也内置了一些常用的 Array 对象，不过与 Matrix 不同指出在于Array同时定义了一维和二维Array。内置 Array 类型的任意维度均不大于4：

```c++
Array<float,Dynamic,1> ArrayXf 
Array<float,3,1> Array3f 
Array<double,Dynamic,Dynamic> ArrayXXd 
Array<double,3,3> Array33d 
```

## Matrix和Array之间的转换

Eigen 中 Matrix 和 Array 的职能不同，前者完成线性代数相关算法，后者完成元素相关的计算，你需要按照自己需求在二者之间进行选择。有些时候我们需要同时对数据进行线性代数相关的操作和元素相关的操作，这个时候就需要在 Matrix 和 Array 之间进行转换。

Matrix 有一个 array() 方法可将 Matrix 转化为 Array 对象。同样，Array 有一个 matrix() 方法可将 Array 对象转化为 Matrix 对象。和 Eigen 表达式优化一样，这种转换没有运行时消耗（假设你允许编译器优化）。.array() 方法和 .matrix() 方法的返回值均可以当做左值或者右值进行使用。

Eigen 不允许在同一个表达式中同时使用 Array 和 Matrix 对象，也就是说你不能直接将 Array 和 Matrix 对象相加。重载的运算符 `+`，其两侧要么全是 Array，要么全是 Matrix 对象。赋值运算符是个例外，你可以将 Matrix d对象赋予 Array 对象，同样你也可以将 Array 对象赋予 Matrix对象。

参考：[Eigen: The Array class and coefficient-wise operations](http://eigen.tuxfamily.org/dox/group__TutorialArrayClass.html)