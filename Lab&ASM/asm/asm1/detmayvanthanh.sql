drop database detmayvanthanh_ps36680;

create database detmayvanthanh_ps36680;

use detmayvanthanh_ps36680;

create table loaihang (
	malh varchar(5) not null primary key,
	tenlh varchar(20) not null);

create table cuahang (
	mach varchar(5) not null primary key,
	tench varchar(20) not null,
	sdt varchar(13) not null,
	diachi varchar(50) not null,
	email varchar(20) not null,
	unique (sdt),
	unique (diachi),
	unique (email));

create table mathang (
	mamh varchar(5) not null primary key,
	tenmh varchar(20) not null,
	donvitinh varchar (10) not null,
	dongia float not null,
	malh varchar(5) not null);

create table phieuxuat (
	sopx varchar(5) not null primary key,
	ngaylp date not null,
	ngayxh date null,
	mach varchar(5) not null);

create table phieuxuatchitiet (
	mamh varchar(5) not null,
	sopx varchar(5) not null,
	soluong int not null,
	ghichu varchar(100) null,
	primary key (mamh, sopx));

alter table mathang
add constraint fk_mh_lh
foreign key (malh) references loaihang(malh);

alter table phieuxuat
add constraint fk_px_ch
foreign key (mach) references cuahang(mach);

alter table phieuxuatchitiet
add constraint fk_pxct_mh
foreign key (mamh) references mathang(mamh),
add constraint fk_pxct_px
foreign key (sopx) references phieuxuat(sopx);

alter table phieuxuat
add constraint check_nxh_nlp
check (ngayxh >= ngaylp);


delimiter //
create trigger tinhsoluonghangxuat
after insert on phieuxuatchitiet
for each row
begin
    declare mamhtemp varchar(5);
    declare soluongtemp int;
    declare dongiatemp float;
    
    set mamhtemp = new.mamh;
    set soluongtemp = new.soluong;
    select dongia into dongiatemp 
    from mathang
    where mamh = new.mamh;
    
    update cuahang
    set soluonghangxuat = coalesce(soluonghangxuat, 0) + soluongtemp,
		tongtienhang = COALESCE(tongtienhang, 0) + (soluongtemp * dongiatemp);
end;
// delimiter ;
