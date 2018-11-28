[MatPlotLib tutorial](https://matplotlib.org/users/pyplot_tutorial.html)

Property	| Value Type
----|----
alpha	| float
animated	| [True | False]
antialiased or aa| 	[True | False]
clip_box	| a matplotlib.transform.Bbox instance
clip_on	| [True | False]
clip_path	| a Path instance and a Transform instance, a Patch
color or c	| any matplotlib color
contains	| the hit testing function
dash_capstyle| 	['butt' | 'round' | 'projecting']
dash_joinstyle| 	['miter' | 'round' | 'bevel']
dashes	| sequence of on/off ink in points
data	| (np.array xdata, np.array ydata)
figure	| a matplotlib.figure.Figure instance
label	| any string
linestyle or ls	| [ '-' | '--' | '-.' | ':' | 'steps' | ...]
linewidth or lw	| float value in points
lod	| [True | False]
marker| 	[ '+' | ',' | '.' | '1' | '2' | '3' | '4' ]
markeredgecolor or mec| 	any matplotlib color
markeredgewidth or mew| 	float value in points
markerfacecolor or mfc| 	any matplotlib color
markersize or ms| 	float
markevery| 	[ None | integer | (startind, stride) ]
picker	| used in interactive line selection
pickradius	| the line pick selection radius
solid_capstyle	| ['butt' | 'round' | 'projecting']
solid_joinstyle	| ['miter' | 'round' | 'bevel']
transform	| a matplotlib.transforms.Transform instance
visible	| [True | False]
xdata	| np.array
ydata	| np.array
zorder	| any number

- 多幅图：subplot（212），类似于matlab
- 使用figure()函数产生多幅图
- 使用 setp()函数开工至line的参数
>In [69]: lines = plt.plot([1, 2, 3])\
\
In [70]: plt.setp(lines)
  alpha: float
  animated: [True | False]
  antialiased or aa: [True | False]
  ...snip

-  在图上写字:用title()写标题，用text(x,y,color'text'), e.g.plt.text(60, .025, r'$\mu=100,\ \sigma=15$');还可以写数学式plt.title(r'$\sigma_i=15$')
- annotating text 箭头文字？
> import numpy as np
import matplotlib.pyplot as plt
\
ax = plt.subplot(111)

t = np.arange(0.0, 5.0, 0.01)
s = np.cos(2*np.pi*t)
line, = plt.plot(t, s, lw=2)
\
plt.annotate('local max', xy=(2, 1), xytext=(3, 1.5),
            arrowprops=dict(facecolor='black', shrink=0.05),
            )
\
plt.ylim(-2,2)
plt.show()

![image.png](https://upload-images.jianshu.io/upload_images/7955445-ef7e4d4d2ce5126e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- 画直方图
> import numpy as np
import matplotlib.pyplot as plt
\
\# Fixing random state for reproducibility
np.random.seed(19680801)
\
mu, sigma = 100, 15
x = mu + sigma * np.random.randn(10000)
\
\# the histogram of the data
n, bins, patches = plt.hist(x, 50, normed=1, facecolor='g', alpha=0.75)
\
\
plt.xlabel('Smarts')
plt.ylabel('Probability')
plt.title('Histogram of IQ')
plt.text(60, .025, r'$\mu=100,\ \sigma=15$')
plt.axis([40, 160, 0, 0.03])
plt.grid(True)
plt.show()

![image.png](https://upload-images.jianshu.io/upload_images/7955445-d8c7813b009bd33c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- log轴或其他轴
> import numpy as np
import matplotlib.pyplot as plt
\
from matplotlib.ticker import NullFormatter  # useful for `logit` scale
\
\# Fixing random state for reproducibility
np.random.seed(19680801)
\
\# make up some data in the interval ]0, 1[
y = np.random.normal(loc=0.5, scale=0.4, size=1000)
y = y[(y > 0) & (y < 1)]
y.sort()
x = np.arange(len(y))
\
\# plot with various axes scales
plt.figure(1)
\
\# linear
plt.subplot(221)
plt.plot(x, y)
plt.yscale('linear')
plt.title('linear')
plt.grid(True)
\
\
\# log
plt.subplot(222)
plt.plot(x, y)
plt.yscale('log')
plt.title('log')
plt.grid(True)
\
\
\# symmetric log
plt.subplot(223)
plt.plot(x, y - y.mean())
plt.yscale('symlog', linthreshy=0.01)
plt.title('symlog') 
plt.grid(True)
\# logit
plt.subplot(224)
plt.plot(x, y)
plt.yscale('logit')
plt.title('logit')
plt.grid(True)
\# Format the minor tick labels of the y-axis into empty strings with
\# `NullFormatter`, to avoid cumbering the axis with too many labels.
plt.gca().yaxis.set_minor_formatter(NullFormatter())
\# Adjust the subplot layout, because the logit one may take more space
\# than usual, due to y-tick labels like "1 - 10^{-3}"
plt.subplots_adjust(top=0.92, bottom=0.08, left=0.10, right=0.95, hspace=0.25, wspace=0.35)
\
plt.show()

![image.png](https://upload-images.jianshu.io/upload_images/7955445-32b91e00c23cbe90.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
