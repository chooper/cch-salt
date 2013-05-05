base:
  '*':
    - salt
    - ssh
    - users
    - misc

  'theobroma.*':
    - match: pcre
    - cchdotnet
