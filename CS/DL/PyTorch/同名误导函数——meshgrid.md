### torch.meshgrid

```shell
>>> x= torch.linspace(0,10,5)
>>> x
tensor([ 0.0000,  2.5000,  5.0000,  7.5000, 10.0000])
>>> y = torch.linspace(50,100,10)
>>> X,Y=torch.meshgrid(x,y)
>>> print(X)
tensor([[ 0.0000,  0.0000,  0.0000,  0.0000,  0.0000,  0.0000,  0.0000,  0.0000,
          0.0000,  0.0000],
        [ 2.5000,  2.5000,  2.5000,  2.5000,  2.5000,  2.5000,  2.5000,  2.5000,
          2.5000,  2.5000],
        [ 5.0000,  5.0000,  5.0000,  5.0000,  5.0000,  5.0000,  5.0000,  5.0000,
          5.0000,  5.0000],
        [ 7.5000,  7.5000,  7.5000,  7.5000,  7.5000,  7.5000,  7.5000,  7.5000,
          7.5000,  7.5000],
        [10.0000, 10.0000, 10.0000, 10.0000, 10.0000, 10.0000, 10.0000, 10.0000,
         10.0000, 10.0000]])
>>> print(Y)
tensor([[ 50.0000,  55.5556,  61.1111,  66.6667,  72.2222,  77.7778,  83.3333,
          88.8889,  94.4444, 100.0000],
        [ 50.0000,  55.5556,  61.1111,  66.6667,  72.2222,  77.7778,  83.3333,
          88.8889,  94.4444, 100.0000],
        [ 50.0000,  55.5556,  61.1111,  66.6667,  72.2222,  77.7778,  83.3333,
          88.8889,  94.4444, 100.0000],
        [ 50.0000,  55.5556,  61.1111,  66.6667,  72.2222,  77.7778,  83.3333,
          88.8889,  94.4444, 100.0000],
        [ 50.0000,  55.5556,  61.1111,  66.6667,  72.2222,  77.7778,  83.3333,
          88.8889,  94.4444, 100.0000]])
>>> X.T
tensor([[ 0.0000,  2.5000,  5.0000,  7.5000, 10.0000],
        [ 0.0000,  2.5000,  5.0000,  7.5000, 10.0000],
        [ 0.0000,  2.5000,  5.0000,  7.5000, 10.0000],
        [ 0.0000,  2.5000,  5.0000,  7.5000, 10.0000],
        [ 0.0000,  2.5000,  5.0000,  7.5000, 10.0000],
        [ 0.0000,  2.5000,  5.0000,  7.5000, 10.0000],
        [ 0.0000,  2.5000,  5.0000,  7.5000, 10.0000],
        [ 0.0000,  2.5000,  5.0000,  7.5000, 10.0000],
        [ 0.0000,  2.5000,  5.0000,  7.5000, 10.0000],
        [ 0.0000,  2.5000,  5.0000,  7.5000, 10.0000]])
```



### np.meshgrid

```shell
>>> x=np.linspace(0,10,5)
>>> y=np.linspace(50,100,10)
>>> X,Y=np.meshgrid(x,y)
>>> print(X)
[[ 0.   2.5  5.   7.5 10. ]
 [ 0.   2.5  5.   7.5 10. ]
 [ 0.   2.5  5.   7.5 10. ]
 [ 0.   2.5  5.   7.5 10. ]
 [ 0.   2.5  5.   7.5 10. ]
 [ 0.   2.5  5.   7.5 10. ]
 [ 0.   2.5  5.   7.5 10. ]
 [ 0.   2.5  5.   7.5 10. ]
 [ 0.   2.5  5.   7.5 10. ]
 [ 0.   2.5  5.   7.5 10. ]]
>>> X.T
array([[ 0. ,  0. ,  0. ,  0. ,  0. ,  0. ,  0. ,  0. ,  0. ,  0. ],
       [ 2.5,  2.5,  2.5,  2.5,  2.5,  2.5,  2.5,  2.5,  2.5,  2.5],
       [ 5. ,  5. ,  5. ,  5. ,  5. ,  5. ,  5. ,  5. ,  5. ,  5. ],
       [ 7.5,  7.5,  7.5,  7.5,  7.5,  7.5,  7.5,  7.5,  7.5,  7.5],
       [10. , 10. , 10. , 10. , 10. , 10. , 10. , 10. , 10. , 10. ]])

>>> Y
array([[ 50.        ,  50.        ,  50.        ,  50.        ,
         50.        ],
       [ 55.55555556,  55.55555556,  55.55555556,  55.55555556,
         55.55555556],
       [ 61.11111111,  61.11111111,  61.11111111,  61.11111111,
         61.11111111],
       [ 66.66666667,  66.66666667,  66.66666667,  66.66666667,
         66.66666667],
       [ 72.22222222,  72.22222222,  72.22222222,  72.22222222,
         72.22222222],
       [ 77.77777778,  77.77777778,  77.77777778,  77.77777778,
         77.77777778],
       [ 83.33333333,  83.33333333,  83.33333333,  83.33333333,
         83.33333333],
       [ 88.88888889,  88.88888889,  88.88888889,  88.88888889,
         88.88888889],
       [ 94.44444444,  94.44444444,  94.44444444,  94.44444444,
         94.44444444],
       [100.        , 100.        , 100.        , 100.        ,
        100.        ]])
```



????????????????????????meshgrid??????????????????????????????????????????

???????????????????????????///////