### 目的

尽可能少的改变正向仿真的代码，实现**自动微分**（AD）

从结果推到初始状态（类似反演？）

### AD的两种选择

Source Code Transformation (SCT)   ：高性能、但不灵活且编译时间长

Tracing  ：低性能但灵活。