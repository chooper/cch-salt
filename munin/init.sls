include:
  - nginx
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

/etc/nginx/sites-enabled/munin.conf:
  file.managed:
    - user: root
    - group: root
    - file_mode: 644
    - source: salt://munin/nginx.conf
    - require:
      - pkg: nginx
      - file: /etc/nginx

