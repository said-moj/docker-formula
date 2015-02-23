{% from "docker/map.jinja" import docker with context %}
include:
  - .repo

docker-dependencies:
  pkg.installed:
    - pkgs:
      - ca-certificates

docker-pkg:
  pkg.installed:
    - name: {{ docker.pkg }}-{{ docker.pkg_version }}
    - require:
      - pkg: docker-dependencies
      - pkgrepo: docker_repo

docker-py:
  pip.installed:
    - name: docker-py == {{ docker.py_version }}
    - require:
      - pkg: docker-pkg

/etc/default/docker:
  file.managed:
    - template: jinja
    - source: salt://docker/templates/docker/default
    - watch_in:
      - service: docker

docker:
  service.running:
    - require:
      - pkg: docker-pkg
