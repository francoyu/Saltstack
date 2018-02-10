apache-install:
  pkg.installed:
    - names:
      - httpd
      - httpd-tools

apache-service:
  service.running:
    - name: httpd
    - enable: True
    - reload: True

