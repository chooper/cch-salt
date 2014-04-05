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

  'lagunitas.*':
    - match: pcre
    - munin
    - cchdotnet
    - nginx_monitoring

