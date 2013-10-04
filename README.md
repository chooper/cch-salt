These are the salt stack manifests I use to provision my personal hosts

Provision a new host, and then:

```bash
local$ git clone git@github.com:chooper/cch-salt.git
local$ rsync -avh cch-salt root@remote-server:/srv/salt
remote$ /srv/salt/bootstrap
```

