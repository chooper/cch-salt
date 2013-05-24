include:
  - munin-node

# Monitoring
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
    - source: salt://nginx/munin_plugins.conf
    - user: root
    - group: root
    - mode: 640
    - require:
      - pkg: munin-node

# Make sure nginx is installed and up
nginx:
  pkg:
    - installed
  service.running:
    - require:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf
    - watch:
      - file: /etc/nginx/*

# Configuration files for nginx
/etc/nginx:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx/config/nginx.conf
    - user: root
    - group: root
    - file_mode: 644
    - require:
      - file: /etc/nginx

/var/cache/nginx:
  file.directory:
    - makedirs: True

/var/log/nginx:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True

#/var/www:
#  file.directory:
#    - makedirs: True

