salt:
  pkg.installed:
    - names:
      - salt-minion
      - salt-common
      - python-mysqldb

#/srv/pillar:
#  file.recurse:
#    - source: salt://pillar_data
#    - user: root
#    - group: root
#    - dir_mode: 700
#    - file_mode: 600

