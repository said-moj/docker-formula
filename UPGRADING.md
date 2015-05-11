To v1.3.0
---------
This version adds aufs support. Previously running docker containers will not be aware of this change and will need to be restarted manually.

    service docker restart
    
**NOTE:** This will kill any running containers, so you will have to start them up yourself afterwards. 
