`$\mathbf{main\,equation}$`  
`$\mathbf{u}$`:velocity  
`$\eta$` :viscoity  
`$\mathbf{u}_t$`: time derivation  
`$\rho$` : density  
`$\mathbf{g}$` : gravity  

# mass conservation  
`$ \frac{\partial \rho}{\partial t}+div(\rho \mathbf{u})=0$`  
In 3D:  `$\frac{\partial \rho}{\partial t}+\frac{\partial (\rho u_x)}{\partial x}+\frac{\partial (\rho u_y)}{\partial y}+\frac{\partial (\rho u_z)}{\partial z}=0$`  
incompressible continuity equation\
`$div(\vec{v})=0$`
# `$\color{red}{momentum\,conservation}$`  
`$\rho (u_t+(\mathbf{u} \cdot \nabla)\mathbf{u})=2\nabla \cdot (\eta \nabla^s \mathbf{u})-\nabla p+\rho \mathbf{g}$`  
Boussnesq approximation  
`$
\frac{\partial \rho}{\partial t}+\nabla \cdot(\rho \mathbf{u})=0 \color{red}{\Rightarrow} \nabla\cdot\mathbf{u}=0
$`    
mechanical problem  
stockes equation:  
`$
\begin{array}{lr}
& -2\nabla\cdot(\eta\nabla_s\mathbf{u})+\nabla p=\rho\mathbf{g} \\
& \nabla\mathbf{u}=0
\end{array}
$`   
力学问题：  
输入密度`$\rho$`和黏度`$\eta$`代入方程得到速度`$\mathbf{u}$`和压力p。 

# `$\color{red}{\mathbf{energy\, conservation}}$`  
`$\rho C_\rho(\frac{\partial T}{\partial t}+\mathbf{u}\cdot\nabla T)=\nabla\cdot(k\cdot\nabla T)+\rho f$`  

# `$\color{red}{\mathbf{advection\, equation}}$`
a scalar fuction A at an Eulerian point, this advection equation is written as follows:\
`$\frac{\partial A}{\partial t}=-\vec{u} \cdot grad(A)$`

another
![image.png](https://upload-images.jianshu.io/upload_images/7955445-b03ddd8329d3044b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
