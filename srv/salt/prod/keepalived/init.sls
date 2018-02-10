include: 
  - pkg.pkg-init

keepalived-install:
  file.managed:
    - name: /usr/local/src/keepalive-1.2.19.tar.gz
    - source: salt://keepalived/files/keepalive-1.2.19.tar.gz
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: cd /usr/local/src/ && tar zxf keepalive-1.2.19.tar.gz  && cd keepalive-1.2.19 && ./configure  --prefix=/usr/local/keepalived  --disabled-fwmark  && make && make install
    - unless: test -d /usr/local/keepalived
    - require: 
      - pkg: pkg-init
      - file: keepalived-install

keepalive-init:
  file.managed:
    - name: /etc/init.d/keepalived
    - source: salt://keepalived/files/keepalived/init
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: chkcofig --add keepalived
    - unless: chkconfig --list | grep -i keepalived
    - require:
      - file: keepalive-init

/etc/sysconfig/keepalived:
  file.managed:
    - source: salt://keepalived/files/keepalived.sysconfig
    - user: root
    - group: root
    - mode: 644

/etc/keepalived:
  file.directory:
    - user: root
    - group: root
    - mode: 755 
