#### 静态函数

static关键字

不需要具体类的实例也可以调用类的成员函数

实现多个对象共享数据的目标。静态成员变量是一种特殊的成员变量，它被关键字`static`修饰，例如：

```c++
class Student{
    public:  
    	Student(char *name, int age, float score);    
    	void show();
    public:    
    	static int m_total;  //静态成员变量
    private:    
    	char *m_name;    int m_age;    float m_score;};
```

这段代码声明了一个静态成员变量 m_total，用来统计学生的人数。

static 成员变量属于类，不属于某个具体的对象，即使创建多个对象，也只为 m_total 分配一份内存，所有对象使用的都是这份内存中的数据。当某个对象修改了 m_total，也会影响到其他对象。

其初始化必须在外部

```C++
int Student::m_total = 0;
```

静态成员变量在初始化时不能再加 static，但必须要有数据类型。被 private、protected、public 修饰的静态成员变量都可以用这种方式初始化。

#### 访问

静态成员变量在初始化时不能再加 static，但必须要有数据类型。被 private、protected、public 修饰的静态成员变量都可以用这种方式初始化。

```C++
//通过类类访问 static 成员变量
Student::m_total = 10;
//通过对象来访问 static 成员变量
Student stu("小明", 15, 92.5f);
stu.m_total = 20;
//通过对象指针来访问 static 成员变量
Student *pstu = new Student("李华", 16, 96);
pstu -> m_total = 20;
```

这三种方式是等效的。

### const成员

const 成员函数可以使用类中的所有成员变量，但是不能修改它们的值，这种措施主要还是为了保护数据而设置的。const 成员函数也称为常成员函数。

我们通常将 get 函数设置为常成员函数。读取成员变量的函数的名字通常以`get`开头，后跟成员变量的名字，所以通常将它们称为 get 函数。

常成员函数需要在声明和定义的时候在**函数头部的结尾**加上 const 关键字，

```C++
class Student{
public:
    Student(char *name, int age, float score);
    void show();
    //声明常成员函数
    char *getname() const;
    int getage() const;
    float getscore() const;
private:
    char *m_name;
    int m_age;
    float m_score;
};
Student::Student(char *name, int age, float score): m_name(name), m_age(age), m_score(score){ }
void Student::show(){
    cout<<m_name<<"的年龄是"<<m_age<<"，成绩是"<<m_score<<endl;
}
//定义常成员函数
char * Student::getname() const{
    return m_name;
}
int Student::getage() const{
    return m_age;
}
float Student::getscore() const{
    return m_score;
}
```

需要强调的是，必须在成员函数的**声明和定义**处同时加上 const 关键字。

#### const对象

在 [C++](http://c.biancheng.net/cplus/) 中，const 也可以用来修饰对象，称为常对象。一旦将对象定义为常对象之后，就只能调用类的 const 成员（包括 const 成员变量和 const 成员函数）了。

参考：[C++ const对象（常对象） (biancheng.net)](http://c.biancheng.net/view/2232.html)