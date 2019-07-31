https://verynomagic.com/2015/07/multiple-dns-resolvers-in-os-x.html

Basically, make `/etc/resolver/service.consul` contain:
```
domain service.consul
port 53
nameserver <ip>.53
```

To verify run this command and you should see it show up
`scutil --dns`
