docker_repo:
  pkgrepo.managed:
    - repo: 'deb https://get.docker.com/ubuntu docker main'
    - file: '/etc/apt/sources.list.d/docker.list'
    - keyserver: "keyserver.ubuntu.com"
    - keyid: "36A1D7869245C8950F966E92D8576A8BA88D21E9"
    - require_in:
        - pkg: lxc-docker
