libnet-cidr-perl:
  pkg:
    - installed

munin-node:
  pkg:
    - installed
    - require:
      - pkg: libnet-cidr-perl
  service.running:
    - require:
      - pkg: munin-node
      - file: /etc/munin
      - pkg: munin-node-plugins
  watch:
    - file: /etc/munin/*
    - file: /etc/munin/plugins/*
    - file: /etc/munin/plugin-conf.d/*

munin-node-plugins:
  pkg:
    - installed
    - require:
      - pkg: munin-node
      - file: /etc/munin
    - names:
      - munin-plugins-extra

/etc/munin:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

/etc/munin/munin-node.conf:
  file.managed:
    - source: salt://munin-node/munin-node.conf
    - require:
      - file: /etc/munin

