docker_repo:
  pkgrepo.managed:
    - repo: 'deb [arch=amd64] https://download.docker.com/linux/ubuntu trusty stable'
    - file: '/etc/apt/sources.list.d/docker.list'
    - key_url: salt://docker/files/docker.key
old_docker_repo:
  pkgrepo.absent:
    - repo: 'deb https://get.docker.com/ubuntu docker main'
    - file: '/etc/apt/sources.list.d/docker.list'
    