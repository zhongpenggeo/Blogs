### 安装插件

C++插件，或者



### 配置文件

首先选择C++编译器，

`Ctrl+P`，`>`，然后选择`C/C++: edit configuration(UI)`，确定编译器路径。

选好后，可以直接生成task和c_cpp_properties文件。

#### launch

在菜单栏选择Debug>Add Configuration, 选择C++ (GDB/LLDB), 在下拉栏中选择g++ build and debug active file.生成launch.json，内容更改为：

```json
{
    // 使用 IntelliSense 了解相关属性。 
    // 悬停以查看现有属性的描述。
    // 欲了解更多信息，请访问: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
    {
    "name": "g++ build and debug active file",
    "type": "cppdbg",
    "request": "launch",
    "program": "${fileDirname}/${fileBasenameNoExtension}",
    "args": [],
    "stopAtEntry": false,
    "cwd": "${workspaceFolder}",
    "environment": [],
    "externalConsole": false,
    "MIMode": "gdb",
    "setupCommands": [
    {
     "description": "为 gdb 启用整齐打印",
     "text": "-enable-pretty-printing",
     "ignoreFailures": true
    }
    ],
    "preLaunchTask": "g++ build active file",
    "postDebugTask": "delete output file",
    "miDebuggerPath": "/usr/bin/gdb"
    }
    ]
   }
```

参考：[vscode远程调试c++ - 云梦士 - 博客园 (cnblogs.com)](https://www.cnblogs.com/yunmeng-shi/p/16367554.html)