base:
  '*':
    - salt
    - ssh
    - users
    - misc
    - munin-node

  'theobroma.*':
    - match: pcre
    - munin
    - nginx_monitoring

