{% if grains['os'] == 'CentOS' %}
apache: httpd
{% elif grains['os'] == 'Debian' %}
apache: apache2
{% elif grains['os'] == 'Fedora' %}
apache: fedorahttpd
{% endif %}
