### 挑战

- 涉及多种功能：声效画面
- 玩法多样性
- 快速迭代



### publish-subscribe pattern

- event definition
  - C++类
  - 允许自定义拓展：以数据（而不是代码）保存（当成dll）；
- callback registration
  - 安全性，回调函数的生命周期
- event dispatch
  - 难以并行
  - 组建queue： ring buffer

### script language

- Support for rapid iteration
- Easy to learn and write
- Support for hot update
- Stable, less crash by running in a sandbox  

脚本会转换为字节码，再VM上运行

#### 对象管理

脚本管理还是引擎编程语言管理（Game Object）

- 业务复杂，玩法多变，适合用脚本管理
- 单机游戏适合用引擎管理。

#### 架构

引擎调用脚本

脚本调用引擎的SDK

![image-20221213135431228](imags/image-20221213135431228.png)

- 易于热更新
- 速度慢：使用JIT，边运行边编译

#### 选择语言

- Lua：效率高、扩展少
- Python：扩展多、运行内存多
- C#：可以当脚本运行

### 可视化脚本

面向非程序员

### 3C 

Character、Control & Camera

- 角色：移动、战斗、技能
- 控制：输入信号变为game logic、反馈（手柄力反馈、游戏键盘闪光）
- 相机系统：track，相机管理



