include:
  - nginx

cchdotnet:
  user.present:
    - fullname: Wordpress User
    - shell: /bin/bash
    - home: /home/cchdotnet

cchdotnet_key:
  ssh_auth.present:
    - user: cchdotnet
    - source: salt://cchdotnet/id_dsa.pub
    - require:
      - user: cchdotnet

/home/cchdotnet:
  file.directory:
    - user: cchdotnet
    - group: cchdotnet
    - dir_mode: 0755
    - require:
      - user: cchdotnet

/home/cchdotnet/www:
  file.directory:
    - user: cchdotnet
    - group: cchdotnet
    - dir_mode: 0755
    - file_mode: 0644
    - require:
      - user: cchdotnet
      - file: /home/cchdotnet
    - recurse:
      - user
      - group
      - mode

/etc/nginx/sites-enabled:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - require:
      - pkg: nginx

/etc/nginx/sites-enabled/cchdotnet.conf:
  file.managed:
    - source: salt://cchdotnet/nginx.conf
    - require:
      - file: /etc/nginx/sites-enabled
      - file: /home/cchdotnet

