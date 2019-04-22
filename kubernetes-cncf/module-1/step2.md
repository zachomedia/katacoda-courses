You can now start deploying software based on charts. To find available charts use the search command. 

For example, to deploy Redis search for that chart by name.

`helm search redis`{{execute}}

Once found, more information may be revealed with the _inspect_ command.

`helm inspect stable/redis`{{execute}}
