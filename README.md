
# Cloudflare DNS Management


## SETUP

```
$ sudo pip3 install octodns octodns-cloudflare octodns-route53
```

## Execution example

```
$ make dump ZONE=example.com.
Dumping DNS records from provider: cloudflare
octodns-dump --config-file=config.yaml --output-dir=zones/  example.com. cloudflare
```

In case of errors, etc., debugging information can be output by passing `EXTRA_OPTS=--debug`.

```
$ make dump ZONE=example.com. EXTRA_OPTS=--debug
```

## When DNS is changed

```
# edit YAML
$ vi zones/foo.bar.yaml

# validate
$ make validate


# Check the differences. (DRY RUN)
$ make sync

# Commit DNS changes
$ make sync EXTRA_OPTS=--doit
```


# Reference URL, etc.
- https://github.com/octodns/octodns/
- https://github.com/octodns/octodns-cloudflare
- https://heartbeats.jp/hbblog/2020/02/octodns01.html
- https://medium.com/devlan-io/octodns-github-actions-cloudflare-digital-ocean-redundant-multi-cloud-dns-hosting-for-free-134acdcc4f03
- https://blog.cloudflare.com/improving-the-resiliency-of-our-infrastructure-dns-zone/
- https://hn.mrugesh.dev/dns-how-to-split-configuration-across-multiple-dns-providers
- https://qiita.com/teckl/items/040d2bb217be9a28fa9d
