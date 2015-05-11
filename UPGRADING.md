To v1.3.0
---------
This version adds aufs support. Previously running docker containers will not be aware of this change and will need to be restarted manually.

    service docker restart
