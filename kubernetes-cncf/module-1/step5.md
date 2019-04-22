Now that Redis is running, take it back down. After all these things should not be precious [snowflakes](https://martinfowler.com/bliki/SnowflakeServer.html).

`helm delete my-redis --purge`{{execute}}

No matter how complex the chart, the delete command will undo everything the install provisioned. The `--purge` command is used to remove the record. Without the purge the record of the installation will remain for reference.

Next, explore the wealth of charts available.