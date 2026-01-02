#!/bin/bash
set -euo pipefail

# Jalankan sebagai root
if [ "$(id -u)" -ne 0 ]; then
  echo "Jalankan sebagai root: sudo $0"
  exit 1
fi

echo "[1/6] apt-get update"
apt-get update -y

echo "[2/6] install isc-dhcp-relay"
apt-get install -y isc-dhcp-relay

echo "[3/6] set /etc/default/isc-dhcp-relay"
cat > /etc/default/isc-dhcp-relay <<'EOF'
SERVERS="192.168.3.2"
INTERFACES="eth0 eth1 eth2"
OPTIONS=""
EOF

echo "[4/6] enable ip_forward (runtime)"
sysctl -w net.ipv4.ip_forward=1 >/dev/null

echo "[5/6] persist ip_forward in /etc/sysctl.conf"
# kalau ada baris net.ipv4.ip_forward, replace; kalau tidak ada, tambahkan.
if grep -qE '^\s*net\.ipv4\.ip_forward\s*=' /etc/sysctl.conf; then
  sed -i 's/^\s*net\.ipv4\.ip_forward\s*=.*/net.ipv4.ip_forward=1/' /etc/sysctl.conf
else
  echo "" >> /etc/sysctl.conf
  echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
fi

# apply sysctl.conf (biar konsisten)
sysctl -p /etc/sysctl.conf >/dev/null || true

echo "[6/6] restart isc-dhcp-relay"
service isc-dhcp-relay restart

echo "✅ DHCP Relay configured."
echo "---- STATUS ----"
service isc-dhcp-relay status || true
echo "ip_forward = $(sysctl -n net.ipv4.ip_forward)"
echo "Config: /etc/default/isc-dhcp-relay"
