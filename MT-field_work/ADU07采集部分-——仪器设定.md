1. 更改本机IP，如记录仪为192.168.0.15，则本机应为192.168.2.22之类，保证处于同一网段内；
2. 连接记录仪，在IE浏览器输入记录仪IP
3. 4个操作：“Configuration ”配置、 　“Status”状态、“Management”管理、 “Shutdown”关机
4. channels
- calibration signal 标定信号;
- HF-Channel configuration高频通道配置：选择通道
- Gain Stage 1：选择增益
- Chopper：采集低频数据要把斩波器打开，为“1”
- Input Connection:使用5通道时，此项为关，使用外界电导（通过多功能插头连接的电道）设置为开，“1”
![参数设置](https://upload-images.jianshu.io/upload_images/7955445-4304eef3f2f26b7f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- Configuration：第二项参数“sensor pos”设置传感器极距
### AGU-General：
1. start job 工作时间、采样率等
2. stop job
3. processing queue：为将要执行的工作任务建立附带参数，如是否滤波
4. Options：设置失去
5. site config 工作相关的，如信号，标题，id，记录人等
5. save session：
### 简单操作过程
1. site config配置
2. 采集通道 channels， 传感器布置sensor pos
3. 设定任务起始时间并保存
4. 等待或立即开始任务
### 读取数据


