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
    - mode: 755
    - makedirs: True

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx/config/nginx.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: /etc/nginx

/var/cache/nginx:
  file.directory:
    - makedirs: True

/var/log/nginx:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

#/var/www:
#  file.directory:
#    - makedirs: True

