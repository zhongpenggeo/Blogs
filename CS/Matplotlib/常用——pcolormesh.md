### 常用的绘制多个mesh图



```python
pad            = 0.05 # pad between colorbar and map (value is relative to figsize?)   
labelpad       = 6 # label pad between label and bar (value is relative to axis value?)  
text_size      = 10 # text size
bar_size       = 10 # label size of colorbar
# for line style
color          = 'white'
linestyle      = 'dashed'
color_f        = 'black'
linestyle_f    = 'solid'
ticks_position = 'bottom' # colorbar ticks location relative to bar
loc            = 'right' # colorbar location relative to map
text_x_pos     = -135 # text location (value is relative to axis data in map)
text_y_pos     = 18.0 
rotation       = 0  # text rotation
shading        = 'nearest' # pcolor shading, nearest for same size of x, y, C.

title_out = ['(a)','(b)','(c)']
bar_label = [r'$\log_{10}\,\rho_{xy}\,(\Omega m)$',r'$\phi_{xy}\,$(degree)',\
             r'$\log_{10}\,\rho_{yx}\,(\Omega m)$',r'$\phi_{yx}\,$(degree)']
x_label   = r'distance$\,$(km)'
y_label   = r'frequency$\,$(Hz)'
data = [[rhoxy_true,rhoxy_retrain,rhoxy],
        [phsxy_true,phsxy_retrain,phsxy],
        [rhoyx_true,rhoyx_retrain,rhoyx],
        [phsyx_true,phsyx_retrain,phsyx]
        ]

n_row,n_column = 4,3
figsize   = (6*n_column*cm,4*n_row*cm)

fig,ax     = plt.subplots(n_row,n_column,figsize=figsize)
for j in range(n_column):
    for i in range(n_row):
        h = ax[i,j].pcolormesh(ry/1e3,freq,data[i][j],norm=norm[i], shading=shading)
        ax[i,j].plot(ry_row,   freq_row,   color = color,linestyle=linestyle)
        ax[i,j].plot(ry_column,freq_column,color = color,linestyle=linestyle)
        ax[i,j].set_yscale("log")
        
        

        if i == 0:
            ax[i,j].set_title(title_out[j])
#             text(text_x_pos,text_y_pos,title_out[j], horizontalalignment='center',\
#                          verticalalignment='center',rotation=rotation,fontsize=text_size)
        if i!=n_row-1:
            ax[i,j].set_xticks([])
            
        if j == 0:
            ax[i,j].yaxis.tick_left()
            ax[i,j].yaxis.set_label_position("left")
            ax[i,j].set_ylabel(y_label)
        else:
            ax[i,j].set_yticks([])
        
        if j == n_column-1:
            cbar = fig.colorbar(h,ax=[ax[i,jj] for jj in range(n_column)],location=loc)#,pad=pad)
            cbar.set_label(bar_label[i],fontsize=bar_size)#,labelpad=labelpad)
            cbar.ax.xaxis.set_ticks_position(ticks_position)
            
    ax[i,j].set_xlabel(x_label)
#         if j!=0 or i!=0:
#             ax[i,j].set_xticks([])
#             ax[i,j].set_yticks([])
# plt.subplots_adjust(wspace=0.1)
# fig.tight_layout()
plt.savefig("../imags/input100_r"+str(rho_id)+"_o"+str(obs_id)+"_f"+str(f_id)+".jpg",dpi=300,bbox_inches='tight',pad_inches=0.05)
# plt.savefig("../imags/input128_r"+str(rho_id)+"_o"+str(obs_id)+"_f"+str(f_id)+".pdf",dpi=300,bbox_inches='tight',pad_inches=0.05)

plt.show()
```

