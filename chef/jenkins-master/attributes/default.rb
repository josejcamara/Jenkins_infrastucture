JENKINS_VERSION = "2.190.1"
JENKINS_HOME = "/var/jenkins"

default['jenkins']['master']['home'] = JENKINS_HOME
default['jenkins']['master']['user'] = 'jenkins'
default['jenkins']['master']['user_id'] = 1000
default['jenkins']['master']['group'] = 'jenkins'
default['jenkins']['master']['group_id'] = 1000
default['jenkins']['master']['port'] = 8080
default['jenkins']['master']['version'] = JENKINS_VERSION
default['jenkins']['master']['jvm_options'] = '-Xmx1024m -Djenkins.install.runSetupWizard=false'
default['jenkins']['master']['email'] = 'whatever@gmail.com'

# Custom installation
# JENKINS_URL = "https://repo.jenkins-ci.org/public/org/jenkins-ci/main/jenkins-war/#{JENKINS_VERSION}/jenkins-war-#{JENKINS_VERSION}.war"
# default['jenkins']['master']['install_method'] = 'war'
# default['jenkins']['master']['mirror'] = 'https://updates.jenkins.io' #'http://mirrors.jenkins-ci.org'
# default['jenkins']['master']['source'] = JENKINS_URL

default['jenkins']['executor']['protocol'] = "http" # http / ssh
# default['jenkins']['executor']['cli_user'] = "vagrant"
# default['jenkins']['master']["channel"]        = "updates"

# default['jenkins-master']['admin']['username'] = 'admin1'
# default['jenkins-master']['admin']['password'] = 'admin1' # only used if the security strategy is "generate"
# default['jenkins-master']['security']['strategy'] = 'generate' # generate or chef-vault
# default['jenkins-master']['security']['chef-vault']['data_bag'] = 'jenkins-users'
# default['jenkins-master']['security']['chef-vault']['data_bag_item'] = node['jenkins-master']['admin']['username']
# default['jenkins-master']['security']['notifies']['resource'] = 'jenkins_script[configure permissions]'

# # Dev_mode attributes
# default['jenkins-master']['dev_mode']['security']['password'] = 'admin1'
# default['jenkins-master']['dev_mode']['security']['public_key'] = 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDn23T41ZUS5PVhkns4+kf0nFoH2UoxHlpc5O3zAFOssBRbVcfGVdQk9MYSA8upeVQr1p3ccgOdDivpYx+Cg2oTATnQHJCHihzueMxsIxmVOm7b78MF8IWIXWzdxsZMbjInhTFuEC4I2wWg1BCxottWzqgDLYt753KdW1+D7i7MaJIBB4sJ9PLx3MgHnsTiAB5BDIVtkJUM2q3UTszV3RMa8gbb0QkCjamTypKoeTjM/rTQQLIOH79yvVSv2FRlcGzwpsAnZT46T9K+AyrEcAlH5Eo2Bk92xbcHhGnoGlzOBAgxqLJ3v6pDVnUefRiqjxZ7N+tPbbhzeaD0pWQe99GmKAuBMfFfbDzA/Q7DIhRQ8ddVs9Ol7iNNp1xkxksgO1GekwxbrDBkIO4olxEzATCLkvDLLREQ2DtWeOQN5P0U3HR5q2Kf8qCl4vniDc72QJTxE4KG2KHrgXiuFn3poc9k6RkI076nTY0N5mXKd/lEze+3xVxBBnHe/a0ibWG08FMuh4TDkzX459PW0xIWmXVt2OCtisZOSs0JG7E0Qo6ymIFcHpfROvH/FYxDorWJdvRq23K2Zok97b83jh7W7FjEnrJyyT9OiaJcW3fUcrJvlvvxrjAFmeRiUgXnmSqfCRLsDiRQ4mgfnJ7dZYSD+RYSiiiOb+79TJTihw+jDoADOQ== jenkins-security'
# default['jenkins-master']['dev_mode']['security']['private_key'] =
# '-----BEGIN RSA PRIVATE KEY-----
# MIIJJwIBAAKCAgEA59t0+NWVEuT1YZJ7OPpH9JxaB9lKMR5aXOTt8wBTrLAUW1XH
# xlXUJPTGEgPLqXlUK9ad3HIDnQ4r6WMfgoNqEwE50ByQh4oc7njMbCMZlTpu2+/D
# BfCFiF1s3cbGTG4yJ4UxbhAuCNsFoNQQsaLbVs6oAy2Le+dynVtfg+4uzGiSAQeL
# CfTy8dzIB57E4gAeQQyFbZCVDNqt1E7M1d0TGvIG29EJAo2pk8qSqHk4zP600ECy
# Dh+/cr1Ur9hUZXBs8KbAJ2U+Ok/SvgMqxHAJR+RKNgZPdsW3B4Rp6BpczgQIMaiy
# d7+qQ1Z1Hn0Yqo8WezfrT224c3mg9KVkHvfRpigLgTHxX2w8wP0OwyIUUPHXVbPT
# pe4jTadcZMZLIDtRnpMMW6wwZCDuKJcRMwEwi5Lwyy0RENg7VnjkDeT9FNx0eati
# n/KgpeL54g3O9kCU8ROChtih64F4rhZ96aHPZOkZCNO+p02NDeZlynf5RM3vt8Vc
# QQZx3v2tIm1htPBTLoeEw5M1+OfT1tMSFpl1bdjgrYrGTkrNCRuxNEKOspiBXB6X
# 0Trx/xWMQ6K1iXb0attytmaJPe2/N44e1uxYxJ6ycsk/TomiXFt31HKyb5b78a4w
# BZnkYlIF55kqnwkS7A4kUOJoH5ye3WWEg/kWEooojm/u/UyU4ocPow6AAzkCAwEA
# AQKCAgApmPf9hORABY/4t30gFdc/DaYhblyfP2Da9b+zL0XT36tnT5aOAOwUzU2U
# AdZSS5BMZS7hVBtN3DMIpl4K3mTzj+69ZcKQbrkOF+IlLI70dQ1arEODF0n90zUq
# /PSq1cJt0Lmzk3eO4yy5VBLCrANKKb1/BHbX/ghULwaN9veyeLhpMt9BJA9KUWAZ
# 7eRI39iNtx9hLuVu7vTs+E5LuGQrG20blv9U0/GusFNrooQMU05BZroLSqrgfRNq
# kRdjM6535pLm/oURlSysJolPwQIJQe4Gj09GceaKlLkjiUdJNvP5ZNjQHzT+684L
# cEoyn4VbCgdPstG69gFooxu5aqDUJTsmPpK1qspfNnizyDO4tYF2Hu89dfyqrcWZ
# oYpdO2yVttTSNa1XHY1i1DwvJbDal5UZf1atre0qCHwnsVjY5kYs/9ObV8jbLri/
# /M97iH4oH+n7ltT3OweLiNKhgtJAXkQaWmZ/sTGjmNC5kw2df7De3OJ9G0XmhWEU
# EjB+hC3HvjfwiVycaJ/Q0INLhBQtuBzGs1ZQwSz37Vw0v5HB3zihSD8eUoFCFgkS
# 5wX+3oXTCSWXoBuc4r8IhIIpWg9G8NedkV3zLRDN5Glw4ViU8tgQ54nCCAlgkErg
# N0AvnTEjS/tdviL4IU30tN+TRCxAQbRQYNGQRyqiDK0cCjVlAQKCAQEA+lkCiLSc
# J7hE9veTsh7eVnnOFKwsiyIXRT78T5wYaWwsEJzU+rMjyA5uVXXVhX0kWyH74Ii9
# KQQgQMJZXwB/8z9LDEOfNrej4r69CjS8oVePDjbY2qhHbLgwvIotCuZiU+UHENfh
# J4aOX5vq7GkAGXB/OqrRT3Or290YTzUhqC4C5o6TZOIK1oM6TLGWXY67JX0SZfLc
# sXSNB6uonD4aY3MTUVchANB4mrm9uRU8fLyIZVeutIpYDD346T80brwUXwwSzioN
# zvYf50hM1aqUFGhWK8LznU9j3DCB5KAtOZUhXHCEqukgYaw7Z+BXFEK4Cf3+VOel
# eh8diwV1Ad49MQKCAQEA7ReS3zZQGjwRwY2I29SCCeDefCh3kx51xmR8eCoSRnhB
# cnyRIhsgq69tlQRHMOQJXpHHq0hAE3skgRCs3s5rNtMij0HxoyD8Qx4KjGNlCWin
# KxcWnNCIhG1v+aCaM3WA2f5jxQ9mOdpTlHRi4ZUL2cNmZljo8uOC4No9sN1DzED0
# JxYtXaLWkfD/zMlbMOQW+mZgDRJoVcUmBsf4hEBzm7k6+p4fiSyHfybOMeQaMV/e
# Ta6sebV1s5xCLl+SjGdTBD4epGVR6EPAUxsqin4IHMpOI5IuCLNJwahGFsToDFnF
# AkoTr0W60L123QUlik5yBA0UzjeF9raJpeIEFkSEiQKCAQBIDEfTag8qyzhlzxid
# gY7BWmq5vldPb289CYR5sNXBuVTxLwGIaPfaQnT0eWYK9dn5tE0V8KRn4n0ZxhUM
# Z0triQKjM+7lQ3KR9gzXnBfRYy6Ti6tbOmTb4CJ+kFGoOmd/94DSEx8EThA5adjx
# UsKpj5u+GZ0FfaevLfEqEoNuMFe7XLsEpJ0z4S5tFgrNQB+SCW27E2r6Uy2nUHrF
# BIZ5qoubtDSWVGjxNpVoZ7kxuNyUNejcopf2Zft1vS/s0ooWVJYw6R9yOZky6bbb
# Iy1cti5eh8uusUNvAjLPxl1dnhKs1OEJgvBDy9qI6aKF/TGUBpoke0o/XCcXdGmZ
# MQlxAoIBADulDY7X1Aj1iaX+nCppaJlhl7b2WzaImCpjxyhXtSdDQ3uwuLYyyuJG
# DLRLUjmLdIv08p01XOFJvmI1treKiFBPh0cw2MAoIS4lVZQBwT4/tKZTdZ3XnDBs
# c5oB/Cjr65FrvN+rQxVUxmf3a5TCcSvES3N99IR+FcPJQ3HGCDNPN9zJaHpA5+fp
# EAENusIu71TpAkrnkZXaNfnIvs1OhYbsb1jzBI32xNOJCKBmeOxo6Lz0L3Gi48xe
# iAuwgWaO68SKeBz1XEipGq4NjIMwt4u+nS+3q5sGt4xfb9p0iMfqoXQ0/ITAbwHq
# WAe8Lrh/iZFZVR2XvDzXqQMxO8P6UrkCggEAcIAxZEDMl3D2fs8/6rC0/Bf5nUXG
# b19Y9xuCFIr3cAV5+l4bT5+rjcpS57w+RD0oj3qzJYB4NdY2PbA4utp9fWt+jHDW
# EDDBp0i/f8M08j07J2//A2agBpH3sLZ0H+5bO/nEQdIFeivVrk0N+ifVSIq1uHMl
# 0OyEQqeg0yt4xKpj747/hpd8v366EAuleT8+g5A1RkiJdgx+hLc9Ob/k8V+p+1be
# LXLgeSQQBfnbBz/uAHxaob97sT2LgUJQelRTl17ZetEklIMObKgHBom4lZHW3RXN
# 0r6JSDHSi7AXmzvWtceE9XmY5d6AwHHO1J38AK3TQL/PAn/WU1BbK+o2pg==
# -----END RSA PRIVATE KEY-----'
