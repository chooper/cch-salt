include:
  - munin-node

/etc/munin/plugins/nginx_status:
  file.symlink:
    - target: /usr/share/munin/plugins/nginx_status
    - require:
      - pkg: munin-node

/etc/munin/plugins/nginx_request:
  file.symlink:
    - target: /usr/share/munin/plugins/nginx_request
    - require:
      - pkg: munin-node

/etc/munin/plugin-conf.d/nginx:
  file.managed:
    - source: salt://nginx_monitoring/munin_plugin_env.conf
    - user: root
    - group: root
    - mode: 640
    - require:
      - pkg: munin-node

