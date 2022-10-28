## @staticmethod的用法

在class中，希望在实例化对象之前就拥有一个方法函数，只不过这个函数需要在类里面调用。

```python
class A(object):
    def m1(self, n):
        print("self:", self)

    @classmethod
    def m2(cls, n):
        print("cls:", cls)

    @staticmethod
    def m3(n):
        pass

a = A()
a.m1(1) # self: <__main__.A object at 0x000001E596E41A90>
A.m2(1) # cls: <class '__main__.A'>
A.m3(1)
```

我在类中一共定义了3个方法，m1 是实例方法，第一个参数必须是 self（约定俗成的）。m2 是类方法，第一个参数必须是cls（同样是约定俗成），m3 是静态方法，参数根据业务需求定，可有可无。当程序运行时，大概发生了这么几件事（结合下面的图来看）。

- 第一步：代码从第一行开始执行 class 命令，此时会创建一个类 A 对象（没错，类也是对象，一切皆对象嘛）同时初始化类里面的属性和方法，记住，此刻实例对象还没创建出来。
- 第二、三步：接着执行 a=A()，系统自动调用类的构造器，构造出实例对象 a
- 第四步：接着调用 a.m1(1) ，m1 是实例方法，内部会自动把实例对象传递给 self 参数进行绑定，也就是说， self 和 a 指向的都是同一个实例对象。
- 第五步：调用A.m2(1)时，python内部隐式地把类对象传递给 cls 参数，cls 和 A 都指向类对象



参考：

[正确理解Python中的 @staticmethod@classmethod方法 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/28010894)