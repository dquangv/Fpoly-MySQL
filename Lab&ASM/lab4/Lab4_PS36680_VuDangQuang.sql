create database batdongsan_ps36680;

use batdongsan_ps36680;

create table vanphong (
mavp int not null,
diadiem varchar(255) null);

create table nhanvien (
manv int not null,
tennv varchar(50) null,
mavp int not null);

create table thannhan (
matn int not null,
tenthannhan varchar(50) null,
moiquanhe varchar(50) null,
manv int not null);

create table batdongsan (
mabds int not null,
diachi varchar(255) null,
mavp int not null,
machusohuu int not null);

create table chusohuu (
machusohuu int not null,
tenchusohuu varchar(50) null,
sodienthoai varchar(50) null);

alter table vanphong
add constraint pk_vanphong
primary key (mavp);

alter table nhanvien
add constraint pk_nhanvien
primary key (manv),
add constraint fk_nhanvien_vanphong
foreign key (mavp)
references vanphong(mavp);

alter table thannhan
add constraint pk_thannhan
primary key (matn),
add constraint fk_thannhan_nhanvien
foreign key (manv)
references nhanvien(manv);

alter table chusohuu
add constraint pk_chusohuu
primary key (machusohuu);

alter table batdongsan
add constraint pk_batdongsan
primary key (mabds),
add constraint fk_batdongsan_chusohuu
foreign key (machusohuu)
references chusohuu(machusohuu);

alter table nhanvien
add column socmnd varchar(12) not null;

alter table nhanvien
add constraint uni_nhanvien_socmnd
unique (socmnd);

alter table thannhan
drop constraint fk_thannhan_nhanvien;
alter table nhanvien
modify manv varchar(7);
alter table thannhan
modify manv varchar(7),
add constraint fk_thannhan_nhanvien
foreign key (manv)
references nhanvien(manv)
on update cascade;


alter table nhanvien
add column gioitinh varchar(3) not null;

alter table thannhan
drop foreign key fk_thannhan_nhanvien;

drop table thannhan;