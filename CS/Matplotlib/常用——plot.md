## 常用的绘制线条和标记



```python
title_out = ['(a)','(b)','(c)']
title_label = ['FDM','transfer','retrain']

n_row,n_column = 4,2
figsize   = (6*n_column*cm,3*n_row*cm)
linewidth =1
text_x_pos     = -140 # text location (value is relative to axis data in map)
text_x_pos1     = 40 # text location (value is relative to axis data in map)
text_y_pos     = 4.2 

y_label = [r'$\log_{10}\,\rho_{xy}\,(\Omega m)$',\
           r"$\phi_{xy}\,$(degree)",\
           r'$\log_{10}\,\rho_{yx}\,(\Omega m)$',\
           r"$\phi_{yx}\,$(degree)"]
x_label = [r"distance$\,$(km)",r"frequency$\,$(Hz)"]
title   = ['xy mode','yx mode']



# rho_min = np.min([rhoxy_x_true,rhoxy_x,rhoyx_x_true,rhoyx_x])
# rho_max = np.max([rhoxy_x_true,rhoxy_x,rhoyx_x_true,rhoyx_x])
# phs_min = np.min([phsxy_x_true,phsxy_x,phsyx_x_true,phsyx_x])
# phs_max = np.max([phsxy_x_true,phsxy_x,phsyx_x_true,phsyx_x])
# rho_lim = [rho_min,rho_max]
# phs_lim = [phs_min,phs_max]
rho_ticks  = [0.0,1.0,2.0,3.0,4.0]
rho_lim = [0,4.0]
phs_lim = [0,90]

print(f"frequency is: {freq[f_id]} Hz")
print("")

# rho_min = np.min([rhoxy_true,rhoxy,rhoyx_true,rhoyx])
# rho_max = np.max([rhoxy_true,rhoxy,rhoyx_true,rhoyx])
# phs_min = np.min([phsxy_true,phsxy,phsyx_true,phsyx])
# phs_max = np.max([phsxy_true,phsxy,phsyx_true,phsyx])
# rho_lim = [rho_min,rho_max]
# phs_lim = [phs_min,phs_max]
data0   = [[rhoxy_true[f_id,:],   phsxy_true[f_id,:],  rhoyx_true[f_id,:],  phsyx_true[f_id,:]],
            [rhoxy_true[:,obs_id],phsxy_true[:,obs_id],rhoyx_true[:,obs_id],phsyx_true[:,obs_id]]]
data1   = [[rhoxy[f_id,:],  phsxy[f_id,:],  rhoyx[f_id,:],  phsyx[f_id,:]],
           [rhoxy[:,obs_id],phsxy[:,obs_id],rhoyx[:,obs_id],phsyx[:,obs_id]]]
data2   = [[rhoxy_retrain[f_id,:],  phsxy_retrain[f_id,:],  rhoyx_retrain[f_id,:],  phsyx_retrain[f_id,:]],
           [rhoxy_retrain[:,obs_id],phsxy_retrain[:,obs_id],rhoyx_retrain[:,obs_id],phsyx_retrain[:,obs_id]]]

print(f"observation station is: {ry[obs_id]/1e3}km")
print("")
fig,ax     = plt.subplots(n_row,n_column,figsize=figsize)
for j in range(n_column):
    for i in range(n_row):
        if j == 0:
            ax[i,j].scatter(ry/1e3, data0[j][i],color='None',marker='o',s=2,edgecolors='g',             label=title_label[0])     
            ax[i,j].plot(   ry/1e3, data1[j][i],color='r', linewidth=linewidth,linestyle='solid', marker='None',markersize=1,label=title_label[1])
            ax[i,j].plot(   ry/1e3, data2[j][i],color='b', linewidth=linewidth,linestyle='solid', marker='None',markersize=1,label=title_label[2])            
#             ax[i,j].set_ylabel(y_label[i])
            if i%2==0:
                ax[i,j].set_ylabel(y_label[i])
            else:
                ax[i,j].set_ylabel(y_label[i],labelpad=1)


#         ax[i,jj].plot(   freq, data2[i][j],color='b', linestyle='solid', marker='None',markersize=1,label=title_label[2])
        elif j==1:
            ax[i,j].scatter(freq, data0[j][i],color='None',marker='o',s=2,edgecolors='g',             label=title_label[0])     
            ax[i,j].plot(   freq, data1[j][i],color='r', linewidth=linewidth,linestyle='solid', marker='None',markersize=1,label=title_label[1])
            ax[i,j].plot(   freq, data2[j][i],color='b', linewidth=linewidth,linestyle='solid', marker='None',markersize=1,label=title_label[2])
            ax[i,j].invert_xaxis()
            ax[i,j].set_xscale("log")       
        
        ax[i,j].tick_params(axis='both',which='major',length=2, width=1,direction='in')
        ax[i,j].tick_params(axis='both',which='minor',length=1, width=1,direction='in')
        
                
        if i == 0:
            ax[i,j].set_title(title_out[j])
#             (text_x_pos1,text_y_pos,title_out[j], horizontalalignment='center',\
#                                      verticalalignment='center',rotation=rotation,fontsize=text_size)            
            ax[i,j].set_ylim(rho_lim)
            ax[i,j].set_yticks(rho_ticks)
#             ax[i,j].set_title(title[0])
            
#             ax[i,j].set_aspect(1) # same scale
#             ax[i,j].legend()
        elif i == 1:
            ax[i,j].set_ylim(phs_lim)
        elif i == 2:
            ax[i,j].set_ylim(rho_lim)
            ax[i,j].set_yticks(rho_ticks)
#             ax[i,j].set_title(title[1])
        elif i == 3:
            ax[i,j].set_xlabel(x_label[j])           
            ax[i,j].set_ylim(phs_lim)
            
        ax[0,0].legend(loc='lower right')
fig.tight_layout()#调整整体空白
plt.subplots_adjust(wspace =0.2, hspace =0.2)#调整子图间距
# plt.savefig("../imags/freq_profile_r"+str(rho_id)+"_o"+str(obs_id)+".jpg",dpi=300,bbox_inches='tight',pad_inches=0.05)
# plt.savefig("../imags/input_128_profile.eps",bbox_inches='tight',pad_inches=0.05)
# plt.savefig("../imags/input_128_profile.pdf",dpi=300,bbox_inches='tight',pad_inches=0.05)
plt.savefig("../imags/input_128_profile.jpg",dpi=300,bbox_inches='tight',pad_inches=0.05)
plt.show()     
```

