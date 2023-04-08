## 地形几何

### Adaptive mesh

自适应网格：随着视角深入，物体细节增加 

#### Triangle-Based Subdivision

用的不多

#### QuadTree-Based Subdivision

![image-20221208145102777](imags/image-20221208145102777.png)

暗含资源管理

**解决T-junctions：**

利用吸附性把点吸附到邻近点（退化三角形）；

![image-20221208145640772](imags/image-20221208145640772.png)

#### Triangulated irregular network（TIN）

简化顶点（顶点汇聚到山脊）

![image-20221208145920638](imags/image-20221208145920638.png)

#### 对比

![image-20221208150042541](imags/image-20221208150042541.png)

#### Hardware Tessellation

![image-20221208150936487](imags/image-20221208150936487.png)

#### mesh shader pipeline

directX12支持。更简单只管

#### real-time deformable terrain

 

## 地形材质

#### texture array



