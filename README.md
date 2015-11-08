These are the salt stack manifests I use to provision my personal hosts

Provision a new host, and then:

```bash
local$ git clone git@github.com:chooper/cch-salt.git
local$ rsync -avh cch-salt root@remote-server:/srv/salt
remote$ cd /srv/salt && ./bootstrap
```

## `mxbackup`

After provisioning an `mxbackup` host, drop the following two files into
`/etc/postfix`:

1. `/etc/postfix/virtual`

1. `/etc/postfix/transport`

Then run:

```bash
sudo /etc/postfix/reload	# this will prob fail on `postfix reload` - that's OK
sudo service postfix start
```

### Known issues

1. TLS support is in progress

1. IPv6 is disabled (see `sysctl.conf`) since some MTAs will reject mail until
   IPv6 DNS/rDNS records are fixed (most notable gmail)

1. You probably need to manually configure `/etc/network/interfaces` because I
   am bad

## `mxrelay`

After provisioning an `mxrelay` host, drop the following files into
`/etc/postfix`:

1. `/etc/postfix/virtual`

1. `/etc/postfix/relay_from`

1. `/etc/postfix/relay_from.cidr`

Then copy `/var/spool/postfix/etc/sasldb2` into place and ensure that it's
owned by `root:postfix`. You can do this by re-running salt's highstate
command.

Then run:

```bash
sudo /etc/postfix/reload	# this will prob fail on `postfix reload` - that's OK
sudo service postfix start
```

### Known issues

1. TLS support is in progress

1. IPv6 is disabled (see `sysctl.conf`) since some MTAs will reject mail until
   IPv6 DNS/rDNS records are fixed (most notable gmail)

1. You probably need to manually configure `/etc/network/interfaces` because I
   am bad
