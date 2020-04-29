docker_repo:
  # Required because pkgrepo.managed.clean_files doesn't work https://github.com/saltstack/salt/issues/28082
  file.absent:
    - name: '/etc/apt/sources.list.d/docker.list'
  pkgrepo.managed:
    - repo: 'deb [arch=amd64] https://download.docker.com/linux/ubuntu trusty stable'
    - file: '/etc/apt/sources.list.d/docker.list'
    - key_url: salt://docker/files/docker.key
