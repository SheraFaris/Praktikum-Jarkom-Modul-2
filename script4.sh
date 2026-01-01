#!/bin/bash
set -euo pipefail

# Pastikan dijalankan sebagai root
if [ "$(id -u)" -ne 0 ]; then
  echo "Jalankan sebagai root: sudo $0"
  exit 1
fi

echo "[1/5] apt update + install isc-dhcp-server"
apt-get update -y
apt-get install -y isc-dhcp-server

echo "[2/5] Cek versi dhcpd"
dhcpd --version || true

echo "[3/5] Set interface DHCP: eth0"
cat > /etc/default/isc-dhcp-server <<'EOF'
INTERFACESv4="eth0"
EOF

echo "[4/5] Tulis /etc/dhcp/dhcpd.conf"
cat > /etc/dhcp/dhcpd.conf <<'EOF'
authoritative;
default-lease-time 600;
max-lease-time 7200;

subnet 192.168.3.0 netmask 255.255.255.0 {
    range 192.168.3.20 192.168.3.25;
    option routers 192.168.3.1;
    option domain-name-servers 192.168.122.1;
}

subnet 192.168.4.0 netmask 255.255.255.0 {
    range 192.168.4.30 192.168.4.35;
    option routers 192.168.4.1;
    option domain-name-servers 192.168.122.1;
}

subnet 192.168.6.0 netmask 255.255.255.0 {
    range 192.168.6.50 192.168.6.55;
    option routers 192.168.6.1;
    option domain-name-servers 192.168.122.1;
}

subnet 192.168.5.0 netmask 255.255.255.0 {
    option routers 192.168.5.1;
    option domain-name-servers 192.168.122.1;

    range 192.168.5.40 192.168.5.45;
    range 192.168.5.100 192.168.5.105;
}

host ScarletWitch {
    hardware ethernet 02:42:5f:f6:29:00;
    fixed-address 192.168.5.40;
}

host Thor {
    hardware ethernet 02:42:96:01:65:00;
    fixed-address 192.168.5.100;
}

subnet 192.168.7.0 netmask 255.255.255.0 {
    option routers 192.168.7.1;
    option domain-name-servers 192.168.122.1;

    range 192.168.7.60 192.168.7.65;
    range 192.168.7.110 192.168.7.115;
}

host SpiderMan {
    hardware ethernet 02:42:c4:d4:42:00;
    fixed-address 192.168.7.60;
}

host DoctorStrange {
    hardware ethernet 02:42:3a:18:c8:00;
    fixed-address 192.168.7.110;
}
EOF

echo "[5/5] Validate config + restart DHCP server"
dhcpd -t -cf /etc/dhcp/dhcpd.conf
systemctl restart isc-dhcp-server || service isc-dhcp-server restart

echo "✅ DHCP server configured and restarted."
systemctl --no-pager --full status isc-dhcp-server || true
