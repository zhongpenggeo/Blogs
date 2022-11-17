### windows下GUI库

- 基于C++的有 [Qt](http://c.biancheng.net/qt/)、MFC、WTL、wxWidgets、DirectUI、Htmlayout；
- 基于 [C#](http://c.biancheng.net/csharp/) 的有 WinForm、WPF；
- 基于 [Java](http://c.biancheng.net/java/) 的有 AWT、[Swing](http://c.biancheng.net/swing/)；
- 基于 Pascal 的 有Delphi；
- 基于Go语言的有 walk 和 electron；
- 还有国内初露头角的 aardio；
- Visual Basic 曾经很流行，现在逐渐失去了色彩；
- 如果你有 Web 开发经验，也可以基于 Webkit 或 Chromium 将网页转换为桌面程序。

### Qt的优势

- 简单易学：Qt 封装的很好，几行代码就可以开发出一个简单的客户端，**不需要了解 Windows API**。
- 资料丰富：资料丰富能够成倍降低学习成本，否则你只能去看源码，关于 DirectUI、Htmlayout、aardio 的资料就很少。
- 漂亮的界面：Qt 很容易做出**漂亮的界面和炫酷的动画**，而 MFC、WTL、wxWidgets 比较麻烦。
- 独立安装：Qt 程序最终会编译为本地代码，**不需要其他库的支撑**，而 Java 要安装虚拟机，C# 要安装 .NET Framework。
- **跨平台**：如果你的程序需要运行在多个平台下，同时又希望降低开发成本，Qt 几乎是必备的。

### 对比MFC

读者经常将 MFC 和 Qt 进行对比，MFC 只能应用在 Windows 平台，而 Qt 是跨平台的，一次编写，到处运行。

另外，Qt 已经封装了底层细节，学习 Qt 将会非常简单；而 MFC 只是给 Windows API 加了一层包装，不了解 Windows API 也学不好 MFC，大家普遍反映 MFC 难学。

我们不能简单地说 Qt 好还是 MFC 好，两者都有用武之地；但是初学者学习 Qt 会比较简单，不用应付那些烦人的 Windows API，很快就能开发出带有漂亮界面的应用程序。

### Linux下GUI

Linux 下常用的 GUI 库有基于 C++ 的 Qt、GTK+、wxWidgets，以及基于 Java 的 AWT 和 Swing。其中最著名的就是 Qt 和 GTK+：KDE 桌面系统已经将 Qt 作为默认的 GUI 库，Gnome 桌面系统也将 GTK+ 作为默认的 GUI 库。

![Linux下各种GUI库对比图](imags/1-1Z5301332042C.gif)



参考：[Qt和其它GUI库的对比 (biancheng.net)](http://c.biancheng.net/view/3876.html)

