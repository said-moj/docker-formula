docker-python-apt:
  pkg.installed:
    - name: python-apt

docker-dependencies:
   pkg.installed:
    - pkgs:
      - iptables
      - ca-certificates
      - lxc

kernel-dependencies:
   pkg.installed:
    - pkgs:
      - linux-image-generic-lts-raring 
      - linux-headers-generic-lts-raring

docker_repo:
    pkgrepo.managed:
      - repo: 'deb http://get.docker.io/ubuntu docker main'
      - file: '/etc/apt/sources.list.d/docker.list'
      - key_url: salt://docker/docker.pgp
      - require_in:
          - pkg: lxc-docker
      - require:
        - pkg: docker-python-apt

lxc-docker:
  pkg.latest:
    - require:
      - pkg: docker-dependencies

{% if '3.8' not in grains['kernelrelease'] -%}
reboot_host:
  module.run:
    - name: system.reboot
{% endif -%}

docker:
  service.running
