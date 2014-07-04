docker-python-apt:
  pkg.installed:
    - name: python-apt

docker-python-pip:
  pkg.installed:
    - name: python-pip

docker-python-dockerpy:
  pip.installed:
    - name: docker-py
    - repo: git+https://github.com/dotcloud/docker-py.git
    - require:
      - pkg: docker-python-pip

docker-dependencies:
  pkg.installed:
    - pkgs:
      - iptables
      - ca-certificates
      - lxc

docker-mkdir:
  file.directory:
    - name: /mnt/docker

/etc/default/docker:
  file.managed:
    - source: salt://docker/docker_opts
    - user: root
    - group: root
    - mode: 644

docker_repo:
    pkgrepo.managed:
      - repo: 'deb http://get.docker.io/ubuntu docker main'
      - file: '/etc/apt/sources.list.d/docker.list'
      - keyserver: keyserver.ubuntu.com
      - keyid: 36A1D7869245C8950F966E92D8576A8BA88D21E9
      - require_in:
          - pkg: lxc-docker
      - require:
        - pkg: docker-python-apt
      - require:
        - pkg: docker-python-pip

lxc-docker:
  pkg.installed:
    - require:
      - pkg: docker-dependencies

docker:
  service.running:
    - require:
      - pkg: lxc-docker
      - file: /etc/default/docker
      - file: docker-mkdir
