[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/1niUih_B)
| Name           | NRP        | Kelas     |
| ---            | ---        | ----------|
| ... | ... | ... |

<img width="1035" height="187" alt="image" src="https://github.com/user-attachments/assets/822bff43-2adf-4f1a-8472-c4fca8c356b6" />


## Put your topology config image here!

(8)
<img width="1388" height="681" alt="image" src="https://github.com/user-attachments/assets/e3f13cb9-08b9-4f85-b85d-b5d84d53d5e6" />
<img width="949" height="150" alt="image" src="https://github.com/user-attachments/assets/31bb3863-eeaa-4b91-a90f-343030bb5c71" />
<img width="1128" height="196" alt="image" src="https://github.com/user-attachments/assets/dfe2d222-6eb9-42ff-a153-8b33dd30dae1" />


## Put your GNS3 Project file here!

`Put file URL here`

<br>

## Soal 1

> Dokumentasikan hasil pengelompokan subnet yang telah dibuat.

> _Document the results of the subnet grouping that has been created._

**Answer:**

- Screenshot

  <img width="882" height="683" alt="image" src="https://github.com/user-attachments/assets/66296e65-d35e-4754-af46-f22bc72105be" />
  <img width="778" height="670" alt="image" src="https://github.com/user-attachments/assets/78b5f2f5-66f9-4fd2-9988-1554a76bad2c" />
  <img width="803" height="708" alt="image" src="https://github.com/user-attachments/assets/e9ae253c-bd7d-4ae3-aba4-e674f2b9fa66" />
  <img width="875" height="697" alt="image" src="https://github.com/user-attachments/assets/1e4d051c-bce6-44a3-94e3-2d24c63bf9db" />

  _`Untuk melihat pengelompokan subnet yang lebih lengkap dapat ditemukan pada bagian eksplansi atau di dokumentasi.txt di atas`_

  
- Explanation

  `Put your explanation in here`

  
  | No | Subnet         | Netmask       | Gateway     | Router Pengelola | Perangkat / Host       | Fungsi                        |
  | -- | -------------- | ------------- | ----------- | ---------------- | ---------------------- | ----------------------------- |
  | 1  | 192.168.1.0/24 | 255.255.255.0 | 192.168.1.1 | IronMan          | BlackPanther           | Backbone antar router (kiri)  |
  | 2  | 192.168.2.0/24 | 255.255.255.0 | 192.168.2.1 | IronMan          | BlackWidow             | Backbone antar router (kanan) |
  | 3  | 192.168.3.0/24 | 255.255.255.0 | 192.168.3.1 | BlackPanther     | Falcon, CaptainAmerica | LAN User kiri atas            |
  | 4  | 192.168.4.0/24 | 255.255.255.0 | 192.168.4.1 | BlackPanther     | WinterSoldier, Hawkeye | LAN User kiri bawah           |
  | 5  | 192.168.5.0/24 | 255.255.255.0 | 192.168.5.1 | BlackWidow       | Thor, ScarletWitch     | LAN User kanan atas           |
  | 6  | 192.168.6.0/24 | 255.255.255.0 | 192.168.6.1 | BlackWidow       | Hulk                   | LAN User kanan bawah          |


<br>

## Soal 2

> Lakukan konfigurasi routing agar setiap node dapat saling berkomunikasi. Pastikan setiap router dapat mengirimkan paket ke jaringan lain melalui tabel routing yang sesuai. Sertakan bukti bahwa Falcon bisa melakukan ping ke SpiderMan, DoctorStrange, dan ScarletWitch.

> _Configure routing so that each node can communicate with each other. Ensure each router can forward packets to other networks through the appropriate routing table. Include proof that Falcon can ping SpiderMan, Doctor Strange, and ScarletWitch._

**Answer:**

- Screenshot

  `Put your screenshot in here`


  <img width="900" height="851" alt="image" src="https://github.com/user-attachments/assets/82b61221-426b-4e25-94ed-c4d123162c06" />  
  

- Explanation

  `Saya berhasil mengubungkan seluruh device menggunakan static routing. Falcon dapat berhasil terhubung ke SpiderMan, DoctorStrange, dan ScarletWitch dikarenakan modifikasi yang saya tambahkan pada router Ironman dan BlackWidow.` 
<br>

  `Static routing Ironman:`
  - up ip route add 192.168.3.0/24 via 192.168.1.2
  - up ip route add 192.168.4.0/24 via 192.168.1.2
  - up ip route add 192.168.5.0/24 via 192.168.2.2
  - up ip route add 192.168.6.0/24 via 192.168.2.2
  - up ip route add 192.168.7.0/24 via 192.168.2.2  
  
  `Static routing BlackWidow: up ip route add 192.168.7.0/24 via 192.168.5.3`
  
<br>

## Soal 3

> Lakukan konfigurasi agar semua node dapat terhubung ke internet. Sertakan hasil uji coba dengan melakukan ping ke google.com dari node Falcon, CaptainAmerica, SpiderMan, dan Thor.

> _Configure all nodes to connect to the internet. Include test results by pinging google.com from the Falcon, CaptainAmerica, SpiderMan, and Thor nodes._

**Answer:**

- Screenshot

  <img width="939" height="321" alt="image" src="https://github.com/user-attachments/assets/b8e71ee5-ee84-4b74-9429-246fc1707ced" />
  <img width="975" height="324" alt="image" src="https://github.com/user-attachments/assets/76c8d6ea-f76d-4b20-86ca-861d532d4256" />
  <img width="1103" height="538" alt="image" src="https://github.com/user-attachments/assets/7c5772c6-b592-4643-adfa-aba823cbd1ba" />
  <img width="906" height="339" alt="image" src="https://github.com/user-attachments/assets/1c50caf3-7387-45c3-9354-735f1eb8c296" />

- Explanation

  `Dengan memasukkan command ini ke terminal:
  - apt update
  - apt install iptables
  - iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.168.0.0/16
  Saya berhasil menghubungkan device ke internet`

<br>

## Soal 4

> Berikan Falcon alamat IP dalam rentang [Prefix IP].3.20 - [Prefix IP].3.25
> <br> </br>
> Berikan Hawkeye alamat IP dalam rentang [Prefix IP].4.30 - [Prefix IP].4.35
> <br> </br>
> Berikan Hulk alamat IP dalam rentang [Prefix IP].6.50 - [Prefix IP].6.55

<br>

> _Give Falcon an IP address in the range [IP Prefix].3.20 - [IP Prefix].4.35_
> <br> </br>
> _Give Hawkeye an IP address in the range [IP Prefix].4.30 - [IP Prefix].4.35_
> <br> </br>
> _Give Hulk an IP address in the range [IP Prefix].6.50 - [IP Prefix].6.55_

**Answer:**

- Screenshot

  <img width="909" height="187" alt="image" src="https://github.com/user-attachments/assets/7e08cb8a-a7d4-4a35-bfc5-51b2a816d47e" />
  <img width="928" height="189" alt="image" src="https://github.com/user-attachments/assets/c9bd5170-1218-4662-9be6-fdd9a3e32a09" />
  <img width="913" height="197" alt="image" src="https://github.com/user-attachments/assets/bfe87ef6-f65f-4024-a75c-db422b05ba31" />


- Explanation

  `Put your explanation in here`

<br>

## Soal 5

> Berikan ScarletWitch dan Thor alamat IP dalam rentang [Prefix IP].5.40 - [Prefix IP].5.45 dan [Prefix IP].5.100 - [Prefix IP].5.105

> _Give ScarletWitch and Thor IP addresses in the range [IP Prefix].5.40 - [IP Prefix].5.45 and [IP Prefix].5.100 - [IP Prefix].5.105_

**Answer:**

- Screenshot

  <img width="954" height="185" alt="image" src="https://github.com/user-attachments/assets/070f1929-3e90-407c-88a0-c6f0be24b28e" />
  <img width="1137" height="207" alt="image" src="https://github.com/user-attachments/assets/61b203ff-aed4-44da-81eb-54e37632cd91" />


- Explanation

  `Put your explanation in here`

<br>

## Soal 6

> Berikan SpiderMan dan DoctorStrange alamat IP dalam rentang [Prefix IP].7.60 - [Prefix IP].7.65  dan [Prefix IP].7.110 - [Prefix IP].7.115

> _Give SpiderMan and DoctorStrange IP addresses in the ranges [IP Prefix].7.60 - [IP Prefix].7.65 and [IP Prefix].7.110 - [IP Prefix].7.115_

**Answer:**

- Screenshot

  <img width="1005" height="201" alt="image" src="https://github.com/user-attachments/assets/ddac1ed4-42d1-40ff-b488-4fe970b7e97f" />
  <img width="1016" height="180" alt="image" src="https://github.com/user-attachments/assets/09c94a92-1a43-4892-b278-59968a9d366d" />


- Explanation

  `Put your explanation in here`

<br>

## Soal 7

> Tetapkan waktu peminjaman alamat IP pada DHCP server untuk client yang terhubung melalui Switch 2 selama 5 menit (Default), dan untuk client melalui Switch 5 selama 10 menit (Default). Tetapkan juga batas waktu peminjaman maksimal selama 2 jam.
> <br> </br>
> Tetapkan waktu peminjaman alamat IP pada DHCP server untuk client yang terhubung melalui Switch 1 dan Switch 3 selama 2 menit (Default). Tetapkan juga batas waktu peminjaman maksimal selama 100 menit.

<br>

> _Set the IP address lease period on the DHCP server for clients connected through Switch 2 to 5 minutes (default), and for clients connected through Switch 5 to 10 minutes (default). Also, set the maximum lease period to 2 hours._
> <br> </br>
> _Set the IP address lease time on the DHCP server for clients connected via Switch 1 and Switch 3 to 2 minutes (default). Also set the maximum lease time limit to 100 minutes._

**Answer:**

- Screenshot

  `Put your screenshot in here`
  <img width="924" height="192" alt="image" src="https://github.com/user-attachments/assets/db25c2b1-99c9-4a03-8f4e-7cc0e9c53980" />
  <img width="903" height="139" alt="image" src="https://github.com/user-attachments/assets/642551fe-737c-4f53-bcf0-b8d8fe849596" />



- Explanation

  `Put your explanation in here`

<br>

## Soal 8

> Ubah konfigurasi DHCP Server agar Hawkeye, Thor, dan SpiderMan mendapatkan IP statis dengan [Prefix IP].x.5, namun masih menggunakan DHCP.

> _Change the DHCP Server configuration so that Hawkeye, Thor, and SpiderMan get static IPs with [Prefix IP].x.5, but still use DHCP._

**Answer:**

- Screenshot

  <img width="1023" height="152" alt="image" src="https://github.com/user-attachments/assets/de379902-a391-426c-91f4-48792d8ea67a" />
  <img width="1018" height="162" alt="image" src="https://github.com/user-attachments/assets/4624b7da-e264-44dc-acdd-9fe3b3b244aa" />


- Explanation

  <img width="788" height="368" alt="image" src="https://github.com/user-attachments/assets/593c21c8-7ac5-4f49-9f81-7da594f916d6" />
  <img width="880" height="161" alt="image" src="https://github.com/user-attachments/assets/1e3a3358-553e-4a69-b43b-8a02159f8a9b" />

  `Menggunakan fixed address, untuk mengatasi konfigurasi ini.`

<br>

## Soal 9

> Buatlah konfigurasi DHCP Failover dengan WinterSoldier sebagai DHCP server backup untuk CaptainAmerica.

> _Create a DHCP Failover configuration with WinterSoldier as the backup DHCP server for CaptainAmerica._

**Answer:**

- Screenshot

  <img width="1559" height="443" alt="image" src="https://github.com/user-attachments/assets/0253b931-20cc-4c96-8e59-e7cbe93f083a" />


- Explanation

  `Put your explanation in here`

<br>

## Soal 10

> Buatlah konfigurasi agar CaptainAmerica dan WinterSoldier berjalan dengan mode Load Balancing.

> _Create a configuration so that CaptainAmerica and WinterSoldier run in Load Balancing mode._

**Answer:**

- Screenshot

  <img width="1497" height="325" alt="image" src="https://github.com/user-attachments/assets/f20783ce-7ced-4c2e-827b-b562f1f96d7e" />
  <img width="1531" height="184" alt="image" src="https://github.com/user-attachments/assets/c3415d4d-859d-4266-add2-8b36688e3be8" />


- Explanation

  `Put your explanation in here`

<br>
  
## Problems

## Revisions (if any)
