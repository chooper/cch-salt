chooper:
  user.present:
    - fullname: Charles Hooper
    - shell: /bin/bash
    - home: /home/chooper
    - groups:
      - sudo

chooper_keys:
  ssh_auth.present:
    - user: chooper
    - require:
      - user: chooper
    - source: salt://keys.pub

/etc/sudoers:
  file.managed:
    - source: salt://sudoers
    - user: root
    - group: root
    - mode: 0440

root:
  user.present:
  - fullname: root
  - shell: /bin/bash
  - home: /root
  - groups:
    - sudo

root_keys:
  ssh_auth.present:
    - user: root
    - require:
      - user: root
    - source: salt://keys.pub

