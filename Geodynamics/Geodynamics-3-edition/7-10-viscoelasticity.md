#### definition
短时间内表现为弹性而长时间尺度内表现为粘性的称为粘弹性物质，下面以Maxwell模型来阐述

弹性：\
`$epsilon_e=\frac{\sigma}{E}$`\
粘性The
rate of strain of a Newtonian viscous fluid subjected to a deviatoric normal stress σ is given by Equation (6.60)
as:\
`$\frac{d\epsilon_f}{dt}=-\frac{\partial u}{\partial x}=\frac{\sigma}{2\mu}$`\
总应变为：\
`$\epsilon=\epsilon_e+\epsilon_f$`\
那么总应变率为：\
`$\frac{d\epsilon}{dt}=\frac{1}{2\mu}\sigma+\frac{1}{E}\frac{d\sigma}{dt}$`\
假定这么一种情况，在t=0时，维持一个常量应变`$\epsilon_0$`,那么t=0时：\
`$\sigma_0=E\epsilon_0$`\
因为是常量应变，所以应变率为0:\
`$0=\frac{1}{2\mu}\sigma+\frac{1}{E}\frac{d\sigma}{dt}$`\
`$\frac{d\sigma}{\sigma}=-\frac{E}{2\mu}dt$`\
给定边界和初始条件\
`$\sigma=\sigma_0;t=0$`\
积分得到：\
`$\sigma=\sigma_0exp(-\frac{Et}{2\mu})$`\
则**应力松弛**到1/e时，其消耗时间为：\
`$\tau_{ve}=\frac{2\mu}{E}$`\
这就是**松弛时间**
#### 举例
1. 瞬时：\
断层的同震形变，发生在几秒内，而且如果温度足够高，应力会产生固态蠕变过程。
2. 一个简单的粘弹性模型可以用来检验弹性应力是否松弛了  
