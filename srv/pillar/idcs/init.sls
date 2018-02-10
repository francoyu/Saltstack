############IDC################
{% if grains['ip4_interfaces'].get('ens33')[0].startswith('192.168.166.163')  or grains['ip4_interfaces'].get('ens33')[0].startswith('192.168.166.165') %}
nameservers: ['8.8.8.8']
{% elif grains['ip4_interfaces'].get('ens33')[0].startswith('192.168.166.164')  %}
nameservers: ['8.8.4.4']
{% endif %}

