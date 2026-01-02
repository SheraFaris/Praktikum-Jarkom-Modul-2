#!/bin/bash
set -euo pipefail

# Jalankan sebagai root
if [ "$(id -u)" -ne 0 ]; then
  echo "Jalankan sebagai root: sudo $0"
  exit 1
fi

echo "[BW 1/6] apt-get update"
apt-get update -y

echo "[BW 2/6] install isc-dhcp-relay"
apt-get install -y isc-dhcp-relay

echo "[BW 3/6] start service (initial start)"
service isc-dhcp-relay start || true

echo "[BW 4/6] set /etc/default/isc-dhcp-relay"
cat > /etc/default/isc-dhcp-relay <<'EOF'
SERVERS="192.168.3.2"
INTERFACES="eth0 eth1 eth2"
OPTIONS=""
EOF

echo "[BW 5/6] enable ip_forward (runtime + persistent)"
# runtime
sysctl -w net.ipv4.ip_forward=1 >/dev/null

# persist di /etc/sysctl.conf (replace kalau sudah ada, append kalau belum)
if grep -qE '^\s*net\.ipv4\.ip_forward\s*=' /etc/sysctl.conf; then
  sed -i 's/^\s*net\.ipv4\.ip_forward\s*=.*/net.ipv4.ip_forward=1/' /etc/sysctl.conf
else
  echo "" >> /etc/sysctl.conf
  echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
fi

# apply
sysctl -p /etc/sysctl.conf >/dev/null || true

echo "[BW 6/6] restart isc-dhcp-relay"
service isc-dhcp-relay restart

echo "✅ BW DHCP Relay configured."
echo "---- STATUS ----"
service isc-dhcp-relay status || true
echo "ip_forward = $(sysctl -n net.ipv4.ip_forward)"
echo "Config: /etc/default/isc-dhcp-relay"
