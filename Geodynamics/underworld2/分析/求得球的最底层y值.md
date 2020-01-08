##### /docs/examples/1_05_StokesSinker
```
fn_lowest_point_of_blob = fn.view.min_max(  fn.branching.map( fn_key=materialIndex, 
                                         mapping={materialHeavyIndex:fn.coord()[1], materialLightIndex:1.99} ) )

def GetSwarmYMin():
    fn_lowest_point_of_blob.reset()
    fn_lowest_point_of_blob.evaluate(swarm)
    return fn_lowest_point_of_blob.min_global()
ymin = GetSwarmYMin()
if(uw.rank()==0):
    print('Minimum y value for sinker = {0:.3e}'.format(ymin))
```