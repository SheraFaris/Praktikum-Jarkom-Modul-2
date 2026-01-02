#!/bin/bash
set -euo pipefail

# Pastikan dijalankan sebagai root
if [ "$(id -u)" -ne 0 ]; then
  echo "Jalankan sebagai root: sudo $0"
  exit 1
fi

echo "[V 1/6] apt-get update"
apt-get update -y

echo "[V 2/6] install isc-dhcp-relay"
apt-get install -y isc-dhcp-relay

echo "[V 3/6] start isc-dhcp-relay (initial)"
service isc-dhcp-relay start || true

echo "[V 4/6] configure /etc/default/isc-dhcp-relay"
cat > /etc/default/isc-dhcp-relay <<'EOF'
SERVERS="192.168.3.2"
INTERFACES="eth0 eth1"
OPTIONS=""
EOF

echo "[V 5/6] enable IP forwarding (runtime + persistent)"
# aktifkan sekarang
sysctl -w net.ipv4.ip_forward=1 >/dev/null

# simpan permanen
if grep -qE '^\s*net\.ipv4\.ip_forward\s*=' /etc/sysctl.conf; then
  sed -i 's/^\s*net\.ipv4\.ip_forward\s*=.*/net.ipv4.ip_forward=1/' /etc/sysctl.conf
else
  echo "" >> /etc/sysctl.conf
  echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
fi

# apply ulang config sysctl
sysctl -p /etc/sysctl.conf >/dev/null || true

echo "[V 6/6] restart isc-dhcp-relay"
service isc-dhcp-relay restart

echo "✅ V DHCP Relay configured."
echo "---- STATUS ----"
service isc-dhcp-relay status || true
echo "ip_forward = $(sysctl -n net.ipv4.ip_forward)"
echo "Config: /etc/default/isc-dhcp-relay"
