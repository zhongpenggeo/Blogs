### hierarchical tasks network

设定任务，分解为子任务。

![image-20221213195303425](imags/image-20221213195303425.png)

### Goal-Oriented Action planning

![image-20221213195327255](imags/image-20221213195327255.png)

- 显式的目标；
- 



### Monte Carlo Tree Search

#### state space

树状结构，

#### simulation

Q： accumulation of simulation results

N：number of simulation

backpropagate：反向传导，更新所有的N/Q值

![image-20221213205014261](imags/image-20221213205014261.png)

- 开发：Q/N（胜率）高、确定性高
- 探索：不确定，探索少的，N小

#### UCB理论

上置信空间，如何选择

![image-20221213205206354](imags/image-20221213205206354.png)

C决定偏向开发还是探索。

#### expansion

![image-20221213205619722](imags/image-20221213205619722.png)

找到未探索的节点，展开。

#### the end condition

- memory size
- computation time

#### choose best move

- Max child: Select the root child with the **highest Q-value**
- Robust child: Select the **most visited(highest N-value)** root child
- Max-Robust child: Select the root child with both the
  highest visit count and the highest reward. If none exist,
  then continue searching until an acceptable visit count is
  achieved
- Secure child: Select the child which maximises a lower
  confidence bound (LCB)  

$$
LCB_j=\frac{Q_j}{N_j}-C\cdot\sqrt{\frac{2ln(N)}{N_j}}
$$

![image-20221213210423666](imags/image-20221213210423666.png)

