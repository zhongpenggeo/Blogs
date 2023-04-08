### 1. 向量和矩阵

```C++
// 代码片段1：运行时设置矩阵的维度
#include <iostream>
#include <Eigen/Dense>
using namespace Eigen;
using namespace std;
int main()
{
  MatrixXd m = MatrixXd::Random(3,3);// 初始值在-1和1之间
  m = (m + MatrixXd::Constant(3,3,1.2)) * 50;// 映射到10和110
  cout << "m =" << endl << m << endl;
  VectorXd v(3); //任意维度列向量
  v << 1, 2, 3; // 初始化为3x1的向量；逗号初始化；
  cout << "m * v =" << endl << m * v << endl; //点乘
}

// 代码片段2：编译时确定矩阵的维度
#include <iostream>
#include <Eigen/Dense>
using namespace Eigen;
using namespace std;
int main()
{
  Matrix3d m = Matrix3d::Random();
  m = (m + Matrix3d::Constant(1.2)) * 50;
  cout << "m =" << endl << m << endl;
  Vector3d v(1,2,3);
  
  cout << "m * v =" << endl << m * v << endl;
}
```

注意：第一段代码使用的向量和矩阵其维度是在运行时决定的（MatrixXd），第二段代码中矩阵和向量的形状在编译时就已知了（Matrix3d）。

一个比较好的经验是在矩阵维度小于或等于 4×4 时使用固定尺寸的矩阵（例如：Matrix3f、Matrix2i、Matrix4d等内置类型）

### 2. 其他初始化

```C++
Matrix<short, 5, 5> m1;
Matrix<float, 20, 75> m2;
```

#### 迭代矩阵

Eigen 在内存中**按列顺序**保存矩阵，所以在迭代矩阵的时候按列的顺序进行迭代，效率会比按行进行迭代要快（逗号初始化的时候按行），如下伪代码：

```c++
for i = 1:4 {
	for j = 1:4 {
		B(j , i ) = 0.0;
	}
}
```

#### 辅助矩阵

```C++
// Set each coefficient to a uniform random value in the range [ -1 , 1]
A = Matrix3f :: Random () ;
// Set B to the identity matrix
B = Matrix4d :: Identity () ;
// Set all elements to zero
A = Matrix3f :: Zero () ;
// Set all elements to ones
A = Matrix3f :: Ones () ;
// Set all elements to a constant value
B = Matrix4d :: Constant (4.5) ;
// Scalar multiplication , and subtraction
// What do you expect the output to be?
cout << M2 - Matrix4f :: Ones () * 2.2 << endl ;

```

### 将矩阵看作数组

逐元素操作，使用`array()`成员方法。不是**in-place**操作，即 array() 将返回一个和原矩阵完全相同的新矩阵对象。

```C++
// Square each element of the matrix
cout << M1 . array () . square () << endl ;
// Multiply two matrices element - wise
cout << M1 . array () * Matrix4f :: Identity () . array () << endl ;
// All relational operators can be applied element - wise
cout << M1 . array () <= M2 . array () << endl << endl ;
cout << M1 . array () > M2 . array () << endl ;
```



参考：[eigen_tutorial.pdf (dritchie.github.io)](https://dritchie.github.io/csci2240/assignments/eigen_tutorial.pdf)

[Eigen 3.3.7 入门教程 | HJiahu's Blog (yearn.xyz)](https://yearn.xyz/posts/tools/eigen-3.3.7-快速入门/#加减运算)