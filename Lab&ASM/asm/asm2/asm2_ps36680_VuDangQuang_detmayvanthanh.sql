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

insert into cuahang values
('01','uniqlo','01666331161','01 son ki', 'abc@gmail.com'),
('02','coolmate','02666331161','02 son ki', 'bcd@gmail.com'),
('03','levi','03666331161','03 son ki', 'cde@gmail.com'),
('04','muji','04666331161','04 son ki', 'def@gmail.com'),
('05','h&m','05666331161','05 son ki', 'efg@gmail.com');

insert into loaihang values
('01','ao'),
('02','quan'),
('03','tat'),
('04','gang_tay'),
('05','khau_trang');

insert into mathang values
('0101','ao_thun','chiec','300000','01'),
('0102','ao_so_mi','chiec','450000','01'),
('0201','quan_tay','cai','400000','02'),
('0202','quan_jean','cai','500000','02'),
('0301','tat_cao','doi','150000','03'),
('0302','tat_thap','doi','120000','03'),
('0401','gang_tay_y_te','doi','350000','04'),
('0402','gang_tay_chong_rung','doi','420000','04'),
('0501','khau_trang_3_lop','cai','2500','05'),
('0502','khau_trang_4_lop','cai','3500','05');

insert into phieuxuat values
('01','2021-07-01','2021-07-06','01'),
('02','2022-07-20','2022-07-25','02'),
('03','2023-07-25','2023-07-30','03'),
('04','2022-09-07','2022-09-12','04'),
('05','2023-12-07','2023-12-12','02');

insert into phieuxuatchitiet values
('0102','03','5',null),
('0301','05','10',null),
('0202','01','3',null),
('0402','01','7',null),
('0501','01','8',null),
('0301','02','2',null),
('0302','04','4',null),
('0101','03','3',null),
('0502','05','5',null),
('0402','04','4',null),
('0201','04','4',null),
('0101','01','1',null);

-- 6.1. Hiển thị tất cả mặt hàng. Danh sách sắp xếp theo đơn giá tăng dần.
select *
from mathang
order by dongia asc;

-- 6.2. Hiển thị tất cả các mặt hàng thuộc loại hàng “quan”. Thông tin gồm: mã mặt hàng, tên mặt hàng, đơn vị tính, đơn giá, tên loại hàng.
select mamh, tenmh, donvitinh, dongia, tenlh
from mathang mh inner join loaihang lh on mh.malh = lh.malh
where tenlh = 'quan';

-- 6.3. Thống kê số mặt hàng theo loại hàng, thông tin gồm: mã loại hàng, tên loại hàng, tổng số mặt hàng. Danh sách sắp xếp theo tổng số mặt hàng giảm dần.
select lh.malh, tenlh, count(mamh) as 'tong_so_mat_hang'
from loaihang lh inner join mathang mh on lh.malh = mh.malh
group by malh
order by tong_so_mat_hang desc;

-- 6.4. Liệt kê số phiếu xuất, ngày xuất hàng, mã cửa hàng, tên mặt hàng, số lượng, đơn giá, thành tiền.
select px.sopx, ngayxh, ch.mach, tenmh, soluong, dongia, sum(pxct.soluong*mh.dongia) as thanhtien
from phieuxuat px inner join phieuxuatchitiet pxct on px.sopx = pxct.sopx inner join mathang mh on pxct.mamh = mh.mamh inner join cuahang ch on ch.mach = px.mach
group by px.sopx, ngayxh, ch.mach, tenmh, soluong, dongia;

-- 6.5. Thống kế tổng số lần xuất hàng theo từng tháng trong năm 2021, thông tin gồm: tháng/năm, số lần xuất hàng.
select concat(thangxuat,'/',namxuat) as 'thang/nam', solanxuathang
from
	(select month(ngayxh) as thangxuat, year(ngayxh) as namxuat, count(ngayxh) as solanxuathang
	from phieuxuat
	where year(ngayxh) = 2021
	group by month(ngayxh), year(ngayxh)
	order by month(ngayxh)
	) as solanxuathang;

-- 6.6. Liệt kê 5 mặt hàng có số lượng xuất kho nhiều nhất.
select mh.*, sum(soluong) as 'soluongxuatkho'
from phieuxuatchitiet pxct inner join mathang mh on pxct.mamh = mh.mamh
group by mh.mamh
order by soluongxuatkho desc
limit 5;

-- 6.7. Thống kê số hàng nhập về cửa hàng “Chi nhánh 02 son ky”, thông tin hiển thị: Tên cửa hàng, số lần nhập hàng.
select tench, count(sopx) as 'solannhaphang'
from cuahang ch inner join phieuxuat px on ch.mach = px.mach
where diachi = '02 son ki'
group by tench;

-- 6.8. Thống kê tổng tiền hàng xuất kho theo ngày, thông tin hiển thị: Ngày xuất hàng, tổng thành tiền.
select ngayxh, sum(soluong*dongia) as 'tongthanhtien'
from phieuxuat px inner join phieuxuatchitiet pxct on px.sopx = pxct.sopx inner join mathang mh on mh.mamh = pxct.mamh
group by ngayxh;

-- 6.9. Cập nhật ngày xuất hàng là ngày hiện hành cho các phiếu xuất chưa có ngày xuất.
set @@sql_safe_updates = 0;
update phieuxuat
set ngayxh = curdate()
where ngayxh is null;

-- 6.10. Cập nhật đơn giá của “gang_tay_chong_rung” giảm 10% trên đơn giá hiện tại.
update mathang
set dongia = dongia * 0.9
where tenmh = 'gang_tay_chong_rung';

-- 6.11. Thực hiện xóa các cửa hàng chưa có thông tin xuất hàng.
delete from cuahang
where mach not in
	(select mach
    from phieuxuat);
    
-- 6.12. Liệt kê danh sách các mặt hàng có số lượng xuất hàng thấp nhất: Mã hàng, tên hàng, tổng số lượng xuất.
select mh.mamh, tenmh, sum(soluong) as tongsoluongxuat
from phieuxuatchitiet pxct inner join mathang mh on pxct.mamh = mh.mamh
where mh.mamh in
	(select mamh
    from
		(select mamh, sum(soluong)
        from phieuxuatchitiet
        group by mamh
        having sum(soluong) =
			(select sum(soluong)
            from phieuxuatchitiet
            group by mamh
            order by sum(soluong) asc
            limit 1
            )
		) as bangmathangxuatthap
	)
group by mamh;
        
-- 6.13. Liệt kê những mặt hàng chưa từng xuất cho các cửa hàng, thông tin gồm: Mã mặt hàng, tên mặt hàng, tên loại hàng.
select mh.mamh, tenmh, tenlh
from mathang mh inner join loaihang lh on lh.malh = mh.malh
where mh.mamh not in
	(select mamh
    from phieuxuatchitiet);