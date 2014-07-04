## Version 1.0.3
    * pass -g /mnt/docker in upstart daemon to workaround this bug https://github.com/dotcloud/docker/issues/3611

## Version 1.0.2
    
    * Use /mnt instead of /var for docker
    * Removed kernel install, as it should be included in the base OS image
    * removed docker pgp key

## Version 1.0.1

* This specifies a specific kernel version be installed
* This now requires a manual reboot step to complete kernel upgrade

## Version 1.0.0

* Added simple docker salt state for Ubuntu 12.04

