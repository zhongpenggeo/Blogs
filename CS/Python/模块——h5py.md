### 简介

h5py用来处理hdf5文件格式。另外一种类似于scipy.io的是hdf5storage包



### 读取

```python
f_id = h5py.File('test.hd','r')
data = f_id['key']
data_array = np.array(data)
```



### 写入

```python
f_id = h5py.File('test.h5','w')
ds = f.create_dataset('data', data=np.zeros(10,))
```

无法像scipy一样一次把大量的key和value存储，这里似乎一次只能存储一个



### 循环写入

特色： 可以循环写入多个一样的带关键词的数据，组合为多个batch。matlab格式似乎不能这样处理

```python
data = np.random.random((13, 8, 512, 768)).astype(np.float32)

with h5py.File('SO_65606675.h5', 'w') as f:
    # create empty data set
    dset = f.create_dataset('embeds', shape=(130, 8, 512, 768),
                            maxshape=(None, 8, 512, 768), chunks=(13, 8, 512, 768),
                            dtype=np.float32)
    for cnt in range(2):
        # add chunk of rows
        start = cnt*13
        dset[start:start+13, :, :, :] = data[:, :, :, :]
        
        # Create attribute with last_index value
        dset.attrs['last_index']=(cnt+1)*13

# add more data
with h5py.File('SO_65606675.h5', 'a') as f: # USE APPEND MODE
    dset = f['embeds']
    for cnt in range(2):
        start = dset.attrs['last_index']
        # add chunk of rows
        dset[start:start+13, :, :, :] = data[:, :, :, :]
    
        # Resize the dataset to accommodate the next chunk of rows
        #dset.resize(26, axis=0)
        
        # Create attribute with last_index value
        dset.attrs['last_index']=start+(cnt+1)*13

# check data
with h5py.File('SO_65606675.h5', 'r') as f:
    print(f['embeds'].attrs['last_index'])
    print(f['embeds'].shape)
    #print(f['embeds'][0:26])
```

参考：[python - Efficiently add data to h5py dataset over a loop - Stack Overflow](https://stackoverflow.com/questions/65606675/efficiently-add-data-to-h5py-dataset-over-a-loop)