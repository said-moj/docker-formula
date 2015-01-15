include:
  - .repo

docker-dependencies:
  pkg.installed:
    - pkgs:
      - ca-certificates

lxc-docker:
  pkg.installed:
    - require:
      - pkg: docker-dependencies

/etc/default/docker:
  file.managed:
    - template: jinja
    - source: salt://docker/templates/docker/default
    - watch_in
      - service: docker

docker:
  service.running:
    - require:
      - pkg: lxc-docker
