因为gale是从老版本的underworld改进版本，所以应该是可以用来参照underworld2的  
#### 1. infrastructure
粒子是Gale中最基础的object，它存储了物质的属性，包括密度、integrated strain和热扩散率。a logically regular finite elemen mesh is created at each time step. 物质属性从particles（粒子）插值到mesh，然后Stokes方程在mesh上求解，mesh可以distorted，as边界的mesh可以延伸到覆盖particles所在的位置。一旦stokes方程解出来了，mesh就只是维持，用来提供一个good initial guess for the next time step

#### 2. Units

#### 3. Basic Equation
first, decomposting the stress tensor `$\sigma$` into pressure `$p$`, and deviatoric stress `$\tau$`  
`$\sigma_{ij}=\tau_{ij}-p \delta_{ij}$`  
`$\delta$`is  Kronecker delta, so Gale solves a conservation equation for momentum  
`$\tau_{ij,j}-p_{,j}=0$`  
subject to the incompressible continuity equation  
`$v_{i,i}=0$`  
**注意：这里与stokes equation是一样的，只是不同的方式。**  
对`$\sigma$`求散度，得到：  
`$\nabla \cdot \sigma= \vec{b}$`  
and :  
`$\tau_{ij}=2\eta \dot{\epsilon}_{ij}=\eta(v_{i,j}+v_{j,i})$`  
then:  
`$\nabla \cdot(2 \eta \nabla \vec{v})-\nabla p =\vec{b} $`  
now, compare with stokes equation:  
`$-2 \nabla \cdot(\eta \nabla^s \vec{v})+\nabla p =\rho \vec{g}$`  

**Divergence Force**  
`$v_{i,i}=d$`  
**naiver-stokes equation 的推导？**  
in some cases, divergence modifies the velocity,However, since the velocity and pressure are not really independent, you can also think of it as setting a condition on the pressure. For example, consider a one dimensional isoviscous case with no gravity. You can write the momentum Equation (Eq. 2.2) as  
`$\eta(v_{i,jj}+v_{j,ij})+p_{,i}=0$`

#### temperature
`$\rho C_\rho(\frac{\partial T}{\partial t}+\mathbf{u}\cdot\nabla T)=\nabla\cdot(k\cdot\nabla T)+\rho f$`   
thermal advection and diffusion means using SUPG method to solve the energy equation, and this should normally work without any modificaiton.

#### Uzawa Algorithm
