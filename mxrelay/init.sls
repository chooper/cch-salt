# WARNING: /var/spool/postfix/etc/sasldb2 has
# to be dropped into place manually until
# I figure out how to handle secrets
postfix:
  pkg:
    - installed
  service.running:
    - require:
      - pkg: postfix
      - file: /etc/postfix/main.cf
      - file: /etc/postfix/master.cf
      - file: /etc/mailname.mxrelay1
      - file: /etc/mailname.mxrelay2
      - file: /etc/hosts
    - watch:
      - file: /etc/postfix/*
      - file: /etc/mailname.mxrelay1
      - file: /etc/mailname.mxrelay2

sasl2-bin:
  pkg:
    - installed

saslauthd:
  service.running:
    - require:
      - pkg: sasl2-bin
      - file: /etc/default/saslauthd
    - watch:
      - file: /etc/default/saslauthd
      - file: /var/spool/postfix/etc/sasldb2

# Configuration files for postfix
/etc/sysctl.conf:
  file.managed:
    - source: salt://mxrelay/sysctl.conf
    - user: root
    - group: root
    - mode: 644

/etc/hosts:
  file.managed:
    - source: salt://mxrelay/hosts
    - user: root
    - group: root
    - mode: 644

/etc/mailname:
  file.managed:
    - contents: obsmtp1.dynall.net
    - user: root
    - group: root
    - mode: 644

/etc/mailname.mxrelay1:
  file.managed:
    - contents: obsmtp1.dynall.net
    - user: root
    - group: root
    - mode: 644

/etc/mailname.mxrelay2:
  file.managed:
    - contents: obsmtp2.dynall.net
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
    - source: salt://mxrelay/config/main.cf
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: /etc/postfix

/etc/postfix/master.cf:
  file.managed:
    - source: salt://mxrelay/config/master.cf
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: /etc/postfix

/etc/postfix/reload:
  file.managed:
    - source: salt://mxrelay/config/reload
    - user: root
    - group: root
    - mode: 755
    - require:
      - file: /etc/postfix

/etc/default/saslauthd:
  file.managed:
    - source: salt://mxrelay/saslauthd-defaults
    - user: root
    - group: root
    - mode: 644
    - require:
       - pkg: sasl2-bin

/etc/sasldb2:
  file.symlink:
    - target: /var/spool/postfix/etc/sasldb2
    - require:
      - pkg: sasl2-bin

/var/spool/postfix/etc/sasldb2:
  file.managed:
    - user: root
    - group: postfix
    - mode: 660
    - require:
      - pkg: sasl2-bin

/etc/postfix/server.pem:
  file.managed:
    - user: root
    - group: root
    - mode: 600
    - require:
      - file: /etc/postfix

/etc/postfix/CAcert.pem:
  file.managed:
    - user: root
    - group: root
    - mode: 664
    - require:
      - file: /etc/postfix

/var/spool/postfix/etc/certs:
  file.directory:
    - user: root
    - group: postfix
    - mode: 664
    - makedirs: True
