1. mesh是只读性的，无法赋值；
2. 一般用修改mesh
> with mesh.deform_mesh():\
> mesh.data[index]=(0.1,0.1);
 
#### index
mesh的index：
```
# create an 8x8 rectalinear element mesh 
# range x:[0.0,2.0], y:[0.0,1.0]
mesh = uw.mesh.FeMesh_Cartesian( elementType = ("Q1"), 
                                 elementRes  = (8, 8), 
                                 minCoord    = (0.0, 0.0), 
                                 maxCoord    = (2.0, 1.0) )

# visualising the result
figMesh = glucifer.Figure(figsize=(1200,600))
figMesh.append( glucifer.objects.Mesh(mesh, nodeNumbers=True) )
figMesh.show()
```
result
![image.png](https://upload-images.jianshu.io/upload_images/7955445-5967ecc26e70b3be.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
可以看出：
- index是一个数，即mesh.data[index]，这与矩阵的索引不太一样，
- 下标从0开始，与elementRes的数目相关，一般是n+1;
- 问题，要具体定位某一个点的参数，如velocity，应该如何？？？
