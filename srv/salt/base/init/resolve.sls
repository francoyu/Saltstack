/etc/resolv.conf:
  file.managed:
    - source: salt://conf/resolv.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults: 
      dns_server: 192.168.166.2
     
