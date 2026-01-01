[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/1niUih_B)
| Name           | NRP        | Kelas     |
| ---            | ---        | ----------|
| ... | ... | ... |



## Put your topology config image here!

<img width="1388" height="681" alt="image" src="https://github.com/user-attachments/assets/e3f13cb9-08b9-4f85-b85d-b5d84d53d5e6" />


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
  `Static routing Ironman berupa:
    - up ip route add 192.168.3.0/24 via 192.168.1.2
    - up ip route add 192.168.4.0/24 via 192.168.1.2
    - up ip route add 192.168.5.0/24 via 192.168.2.2
    - up ip route add 192.168.6.0/24 via 192.168.2.2
    - up ip route add 192.168.7.0/24 via 192.168.2.2`
  
  `Static routing BlackWidow: up ip route add 192.168.7.0/24 via 192.168.5.3`
<br>

## Soal 3

> Lakukan konfigurasi agar semua node dapat terhubung ke internet. Sertakan hasil uji coba dengan melakukan ping ke google.com dari node Falcon, CaptainAmerica, SpiderMan, dan Thor.

> _Configure all nodes to connect to the internet. Include test results by pinging google.com from the Falcon, CaptainAmerica, SpiderMan, and Thor nodes._

**Answer:**

- Screenshot

  `Put your screenshot in here`

- Explanation

  `Put your explanation in here`

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

  `Put your screenshot in here`

- Explanation

  `Put your explanation in here`

<br>

## Soal 5

> Berikan ScarletWitch dan Thor alamat IP dalam rentang [Prefix IP].5.40 - [Prefix IP].5.45 dan [Prefix IP].5.100 - [Prefix IP].5.105

> _Give ScarletWitch and Thor IP addresses in the range [IP Prefix].5.40 - [IP Prefix].5.45 and [IP Prefix].5.100 - [IP Prefix].5.105_

**Answer:**

- Screenshot

  `Put your screenshot in here`

- Explanation

  `Put your explanation in here`

<br>

## Soal 6

> Berikan SpiderMan dan DoctorStrange alamat IP dalam rentang [Prefix IP].7.60 - [Prefix IP].7.65  dan [Prefix IP].7.110 - [Prefix IP].7.115

> _Give SpiderMan and DoctorStrange IP addresses in the ranges [IP Prefix].7.60 - [IP Prefix].7.65 and [IP Prefix].7.110 - [IP Prefix].7.115_

**Answer:**

- Screenshot

  `Put your screenshot in here`

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

- Explanation

  `Put your explanation in here`

<br>

## Soal 8

> Ubah konfigurasi DHCP Server agar Hawkeye, Thor, dan SpiderMan mendapatkan IP statis dengan [Prefix IP].x.5, namun masih menggunakan DHCP.

> _Change the DHCP Server configuration so that Hawkeye, Thor, and SpiderMan get static IPs with [Prefix IP].x.5, but still use DHCP._

**Answer:**

- Screenshot

  `Put your screenshot in here`

- Explanation

  `Put your explanation in here`

<br>

## Soal 9

> Buatlah konfigurasi DHCP Failover dengan WinterSoldier sebagai DHCP server backup untuk CaptainAmerica.

> _Create a DHCP Failover configuration with WinterSoldier as the backup DHCP server for CaptainAmerica._

**Answer:**

- Screenshot

  `Put your screenshot in here`

- Explanation

  `Put your explanation in here`

<br>

## Soal 10

> Buatlah konfigurasi agar CaptainAmerica dan WinterSoldier berjalan dengan mode Load Balancing.

> _Create a configuration so that CaptainAmerica and WinterSoldier run in Load Balancing mode._

**Answer:**

- Screenshot

  `Put your screenshot in here`

- Explanation

  `Put your explanation in here`

<br>
  
## Problems

## Revisions (if any)
