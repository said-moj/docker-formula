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
      - linux-image-generic-lts-raring: '3.8.0.42.42'
      - linux-headers-generic-lts-raring: '3.8.0.42.42' 

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
  pkg.installed:
    - require:
      - pkg: docker-dependencies

{% if '3.8' not in grains['kernelrelease'] -%}
reboot_host:
  cmd.run:
    - name: |
        echo "A reboot is required to upgrade to Kernel 3.8, which is required by docker " 
{% endif -%}

docker:
  service.running
