#cloud-config
runcmd:
#  - [ sh, -xc, "sed -i -e 'N;/fqdn.*/a http_host_trusted_hostnames=${http_host_trusted_hostnames}' /var/wab/etc/wabengine.conf" ]
  - [ sh, -xc, python3, -c, "from wabconfig import Config; Config('wabengine')['http_host_trusted_hostnames'] = '${http_host_trusted_hostnames}'"]
  - [ sh, -xc, "/opt/wab/bin/WABVersion | grep Bastion || sed -i -e '$aweb.check.session.origin=false' /var/wab/etc/wabam/wabam.properties" ]