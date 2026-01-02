#!/bin/bash
set -euo pipefail

# Pastikan dijalankan sebagai root
if [ "$(id -u)" -ne 0 ]; then
  echo "Jalankan sebagai root: sudo $0"
  exit 1
fi

echo "[1/6] apt update + install isc-dhcp-server"
apt-get update -y
apt-get install -y isc-dhcp-server

echo "[2/6] Cek versi dhcpd"
dhcpd --version || true

echo "[3/6] Set interface DHCP: eth0"
cat > /etc/default/isc-dhcp-server <<'EOF'
INTERFACESv4="eth0"
EOF

echo "[4/6] Tulis /etc/dhcp/dhcpd.conf (PRIMARY + FAILOVER)"
cat > /etc/dhcp/dhcpd.conf <<'EOF'
authoritative;
default-lease-time 600;
max-lease-time 7200;

# (opsional tapi umum dipakai biar tidak ganggu DNS)
ddns-update-style none;

# ===== FAILOVER (PRIMARY) =====
failover peer "dhcp-failover" {
    primary;
    address 192.168.3.2;
    port 647;

    peer address 192.168.4.2;
    peer port 647;

    max-response-delay 60;
    max-unacked-updates 10;

    # LOAD BALANCING
    load balance max seconds 3;

    # Hanya ada di PRIMARY
    mclt 3600;

    # Split untuk load-balance (128 = 50/50 kira-kira)
    split 128;
}

# ===== SUBNETS (pakai POOL + failover peer) =====

subnet 192.168.3.0 netmask 255.255.255.0 {
    option routers 192.168.3.1;
    option domain-name-servers 192.168.122.1;

    pool {
        failover peer "dhcp-failover";
        range 192.168.3.20 192.168.3.25;
    }
}

subnet 192.168.4.0 netmask 255.255.255.0 {
    option routers 192.168.4.1;
    option domain-name-servers 192.168.122.1;

    pool {
        failover peer "dhcp-failover";
        range 192.168.4.30 192.168.4.35;
    }
}

subnet 192.168.5.0 netmask 255.255.255.0 {
    option routers 192.168.5.1;
    option domain-name-servers 192.168.122.1;

    # Dua range -> bikin dua pool (keduanya ikut failover)
    pool {
        failover peer "dhcp-failover";
        range 192.168.5.40 192.168.5.45;
    }
    pool {
        failover peer "dhcp-failover";
        range 192.168.5.100 192.168.5.105;
    }
}

subnet 192.168.6.0 netmask 255.255.255.0 {
    option routers 192.168.6.1;
    option domain-name-servers 192.168.122.1;

    pool {
        failover peer "dhcp-failover";
        range 192.168.6.50 192.168.6.55;
    }
}

subnet 192.168.7.0 netmask 255.255.255.0 {
    option routers 192.168.7.1;
    option domain-name-servers 192.168.122.1;

    pool {
        failover peer "dhcp-failover";
        range 192.168.7.60 192.168.7.65;
    }
    pool {
        failover peer "dhcp-failover";
        range 192.168.7.110 192.168.7.115;
    }
}

host ScarletWitch {
    hardware ethernet 02:42:5f:f6:29:00;
    fixed-address 192.168.5.40;
}

host Thor {
    hardware ethernet 02:42:96:01:65:00;
    fixed-address 192.168.5.100;
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

echo "[5/6] Validate config"
dhcpd -t -cf /etc/dhcp/dhcpd.conf

echo "[6/6] Restart DHCP server"
systemctl restart isc-dhcp-server || service isc-dhcp-server restart

echo "✅ PRIMARY DHCP failover configured and restarted."
systemctl --no-pager --full status isc-dhcp-server || true
