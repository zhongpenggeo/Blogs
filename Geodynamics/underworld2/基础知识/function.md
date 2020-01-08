## /user_guide/05_function
#### module overview
##### Submodules:
`analytic`: Analytic solution functions.  
`branching`: Functions which provide branching type behaviour.  
`exception`: Functions which raise exceptions under certain conditions.  
`math`: Basic mathematics functions.  
`misc`: Miscellaneous other functions.  
`rheology`: Functions which perform rheology specific behaviours.  
`shape`: Functions which perform geometric operations.  
`tensor`: Functions which perform operations on tensor functions.  
`view`: Functions which only observe function evaluations without modifying results.  

##### Classes:
`coord`: This function is an alias to the `input()` function.  
`input`: This is the identity function. It simply returns its input.  
`Function`: The `Function` base class.  
`FunctionInput`: The `FunctionInput` base class.
1. in Underworld, addtion and multiplication can be automatically converted to an Underworld operation. 符号重载？
2. for some speacial operation, should use Underworld function, e.g. exp;
3. MeshVariable is also a Function.
4. must `$\color{red}{float}$`

e.g. \
`$
    k(\mathbf{x}) = 5 +8\exp({5T(\mathbf{x})})
$`
```
import underworld as uw
from underworld import function as fn
import glucifer

# first create a mesh and variable
mesh = uw.mesh.FeMesh_Cartesian(elementRes=(64,64))
tempVar = uw.mesh.MeshVariable(mesh,1)
# init the temp variable 
for index,coord in enumerate(mesh.data):
    tempVar.data[index] = coord[1]

    
# and now define the function.
fn_k = 5. + 8.*fn.math.exp(5.*tempVar) 
```
#### Underworld data objects
Meshvariable and SwarmVariable\
they can be used directlu within functions, 
1. Note that true arbitrary coordinate evaluation is not possible for SwarmVariable objects, as they are purely discrete and do not (currently) have supporting interpolation functions.
 

#### evaluate
若mesh还没有赋值，则可以用evaluate计算，若已经赋值，则该值为constant value，则无法再用evaluate计算。
- evaluate可以看做是类型转换器，把数据类型从function转换到list or float。

#### convert
对于一些不能修改的数据，如tuple，需要用convert显示转换\
e.g. \
```
vec_as_py_tuple = (sinvar, cosvar)
print("`vec_as_py_tuple` type is: {}".format(type(vec_as_py_tuple)))

# this will not work!
# vec_as_py_tuple.evaluate()  

vec_as_uw_fn = fn.Function.convert(vec_as_py_tuple)
print("`vec_as_uw_fn` type is: {}".format(type(vec_as_uw_fn)))

# this is better
print("evaluate: {}".format(vec_as_uw_fn.evaluate(coord)))
```
note!\
python math is not compatibel with Underworld2 funcitons, so we need operator overloads.
```
sin = fn.math.sin()
cos = fn.math.cos()
tan = fn.math.tan()

# double angle formula
sin_2theta = 2.*sin*cos
cos_2theta = 1. - 2.*sin**2
tan_2theta = (2.*tan)/(1.-tan**2)
```
#### Relational and logical functions
Relational functions are constructed via the Python relational operators (`<`,`<=`,`>`,`>=`). Underworld functions for `AND`, `OR` and `XOR` logical operations are also available, and these overload the Python bitwise operators (`&`,`|`,`^`) (though they do **not** perform bitwise operations). These functions will all return boolean results.
```
# define a logical function for inside a unit circle.
# we will use the `input()` function as a proxy for the coordinate (see below).
radius = 1.
coord = fn.input()
inside_circle = ( coord[0]**2 + coord[1]**2 < radius**2 )

# test at some locations
test( inside_circle.evaluate( (0. ,0. ) ), True )
test( inside_circle.evaluate( (1. ,1. ) ), False )
test( inside_circle.evaluate( (0.5,0.5) ), True )
test( inside_circle.evaluate( (0.9,0.5) ), False )

# now something a bit more complex.. first, some circles
radius = 0.25
offset = (0.5,0.5)
deltax = radius*math.cos(math.pi/4.)
deltay = radius*math.sin(math.pi/4.)
coord1 = fn.input() - offset 
circle1 = ( fn.math.dot(coord1,coord1) < radius**2 )
coord2 = coord1 - ( deltax, deltay)
circle2 = ( fn.math.dot(coord2,coord2) < radius**2 )
coord3 = coord1 - (-deltax, deltay)
circle3 = ( fn.math.dot(coord3,coord3) < radius**2 )
coord4 = coord1 - ( deltax,-deltay)
circle4 = ( fn.math.dot(coord4,coord4) < radius**2 )
coord5 = coord1 - (-deltax,-deltay)
circle5 = ( fn.math.dot(coord5,coord5) < radius**2 )

# now create a cross.. note the use of the OR operator
cross =  ( (fn.math.abs(coord1[0])<radius/2.) | (fn.math.abs(coord1[1])<radius/2.) )

# visualise the XOR of these shapes
fig = glucifer.Figure()
fig.append(glucifer.objects.Surface(mesh, circle1^circle2^circle3^circle4^circle5^cross, resolution=400, colours=['white','blue']))
fig.show()
```
##### underworld.function.input
alias of underworld.function.coord \
fn.input()[1]即为y轴