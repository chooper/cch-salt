# Make sure postfix is installed and up
postfix:
  pkg:
    - installed
  service.running:
    - require:
      - pkg: postfix
      - file: /etc/postfix/main.cf
      - file: /etc/postfix/master.cf
      - file: /etc/hosts
    - watch:
      - file: /etc/postfix/*

# Configuration files for postfix
/etc/sysctl.conf:
  file.managed:
    - source: salt://mxrelay/sysctl.conf
    - user: root
    - group: root
    - mode: 644

/etc/hosts:
  file.managed:
    - source: salt://mxbackup/hosts
    - user: root
    - group: root
    - mode: 644

/etc/postfix:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

/etc/postfix/main.cf:
  file.managed:
    - source: salt://mxbackup/config/main.cf
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: /etc/postfix

/etc/postfix/master.cf:
  file.managed:
    - source: salt://mxbackup/config/master.cf
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: /etc/postfix

/etc/postfix/reload:
  file.managed:
    - source: salt://mxbackup/config/reload
    - user: root
    - group: root
    - mode: 755
    - require:
      - file: /etc/postfix

