include:
  - munin-node

munin:
  pkg:
    - installed
    - require:
      - file: /etc/munin

/etc/munin/munin.conf:
  file.managed:
    - source: salt://munin/munin.conf
    - require:
      - pkg: munin

