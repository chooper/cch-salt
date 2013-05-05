chooper:
  user.present:
    - fullname: Charles Hooper
    - shell: /bin/bash
    - home: /home/chooper
    - groups:
      - sudo

chooper_key:
  ssh_auth.present:
    - user: chooper
    - source: salt://chooper-chimay.id_dsa.pub
    - require:
      - user: chooper

/etc/sudoers:
  file.managed:
    - source: salt://sudoers
    - user: root
    - group: root
    - mode: 0440

root_key:
  ssh_auth.present:
    - user: root
    - source: salt://chooper-chimay.id_dsa.pub

