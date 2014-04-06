include:
  - munin-node

/etc/munin/plugins/postfix_mailqueue:
  file.symlink:
    - target: /usr/share/munin/plugins/postfix_mailqueue
    - require:
      - pkg: munin-node

/etc/munin/plugins/postfix_mailstats:
  file.symlink:
    - target: /usr/share/munin/plugins/postfix_mailstats
    - require:
      - pkg: munin-node

/etc/munin/plugins/postfix_mailvolume:
  file.symlink:
    - target: /usr/share/munin/plugins/postfix_mailvolume
    - require:
      - pkg: munin-node

/etc/munin/plugin-conf.d/postfix:
  file.managed:
    - source: salt://postfix_monitoring/munin_plugin_env.conf
    - user: root
    - group: root
    - mode: 640
    - require:
      - pkg: munin-node

