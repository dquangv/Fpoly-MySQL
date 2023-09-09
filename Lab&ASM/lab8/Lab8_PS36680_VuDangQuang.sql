drop database ps36680_quanlybh;
create database ps36680_quanlybh;
use ps36680_quanlybh;
create table ps36680_quanlybh.khachhang(
MaKH varchar(10) not null,
HoVaTenLot varchar(50) ,
Ten varchar(50) not null,
DiaChi varchar(255),
Email varchar(50),
DienThoai varchar(20) not null,
primary key (MaKH)
);
create table ps36680_quanlybh.nhanvien(
MaNV varchar(10) not null,
HoVaTenLot varchar(50) ,
Ten varchar(50) not null,
DiaChi varchar(255),
Email varchar(50),
DienThoai varchar(20) not null,
primary key (MaNV)
);
create table ps36680_quanlybh.sanpham(
MaSP varchar(10) not null,
TenSP varchar(50) ,
GiaSP float not null,
SoLuong int not null,
MoTa varchar(255) not null,
primary key (MaSP)
);
create table ps36680_quanlybh.hoadon(
MaHD varchar(10) not null,
NgayLapHD date not null,
TongTien float not null,
TrangThai varchar(20) not null,
MaNV varchar(10) not null,
MaKH varchar(10) not null,
primary key (MaHD)
);
create table ps36680_quanlybh.HoaDonChiTiet(
MaHD varchar(10) not null,
MaSP varchar(10) not null,
SoLuongMua int not null,
primary key (MaHD, MaSP)
);
alter table ps36680_quanlybh.hoadon
add constraint FK_HD1 foreign key (MaNV) references ps36680_quanlybh.nhanvien(MaNV),
add constraint FK_HD2 foreign key (MaKH) references ps36680_quanlybh.khachhang(MaKH);
alter table ps36680_quanlybh.HoaDonChiTiet
add constraint FK_HDCT1 foreign key (MaHD) references ps36680_quanlybh.hoadon(MaHD),
add constraint FK_HDCT2 foreign key (MaSP) references ps36680_quanlybh.sanpham(MaSP);
insert into ps36680_quanlybh.khachhang values
('KH001', 'Trần Trọng', 'Trí', 'Gò Vấp', '', '0983456654'),
('KH002', 'Đàm Vĩnh', 'Hưng', 'Quận 3', '', '0988123567'),
('KH003', 'Châu Đăng', 'Khoa', 'Quận 1', '', '0977874300'),
('KH004', 'Phạm', 'Hương', 'Quận 2', '', '0903090932'),
('KH005', 'Trường', 'Giang', 'Bình Thạnh', '', '0933411154'),
('KH006', 'Hoài', 'Linh', 'Phú Nhuận', '', '0888012381'),
('KH007', 'Mỹ', 'Tâm', 'Quận 1', '', '0977456654'),
('KH008', 'Ưng Hoàng', 'Phúc', 'Quận 5', '', '091950064'),
('KH009', 'Châu Tinh', 'Trì', 'Quận 1', '', '0888456098'),
('KH010', 'Thành', 'Long', 'Quận 2', '', '0903090908'),
('KH011', 'Lý Liên', 'Kiệt', 'Tân Bình', '', '0933410054'),
('KH012', 'Châu Khải', 'Phong', 'Quận 1', '', '0888022411'),
('KH013', 'Vân Quang', 'Long', 'Quận 12', '', '0983456633'),
('KH014', 'Châu Việt', 'Cường', 'Quận 8', '', '0988903664'),
('KH015', 'Ngọc', 'Sơn', 'Quận 10', '', '0977766098'),
('KH016', 'Nguyễn Phi', 'Hùng', 'Quận 12', '', '0903098032'),
('KH017', 'Trịnh Thăng', 'Bình', 'Bình Thạnh', '', '0933477754'),
('KH018', 'Sơn', 'Tùng M-TP', 'Tân Phú', '', '0888029999'),
('KH019', 'Ngô Thanh', 'Vân', 'Tân Bình', '', '0983456890'),
('KH020', 'Trương Quỳnh', 'Anh', 'Quận 3', '', '0888053664'),
('KH021', 'Hoàng Thùy', 'Linh', 'Quận 1', '', '0977000098'),
('KH022', 'Tóc', 'Tiên', 'Quận 2', '', '0903090888'),
('KH023', 'Bích', 'Phương', 'Quận 1', '', '0933411010'),
('KH024', 'Thu', 'Minh', 'Quận 9', '', '0888022223');
insert into ps36680_quanlybh.nhanvien values
('NV001', 'Võ Đình', 'Hải', 'Gò Vấp', '', '0983769320'),
('NV002', 'Lý Minh', 'Khoa', 'Quận 3', '', '0933999100'),
('NV003', 'Vũ Phạm Minh', 'Châu', 'Quận 1', '', '0977333902'),
('NV004', 'Nguyễn Văn', 'Tuấn', 'Quận 2', '', '0903000021'),
('NV005', 'Lê Hoài', 'Bảo', 'Bình Thạnh', '', '0933488854'),
('NV006', 'Trần Duy Bảo', 'Long', 'Phú Nhuận', '', '0888022422');
insert into ps36680_quanlybh.sanpham values
('SP001', 'Samsung Galaxy Note 9', 20000000.0, 30, 'Hàng chính hãng'),
('SP002', 'IPHONE XS MAX', 30000000.0, 15, 'Hàng chính hãng'),
('SP003', 'IPHONE X', 20000000.0, 40, 'Hàng xách tay'),
('SP004', 'BPhone 3', 70000000.0, 300, 'Hàng chính hãng'),
('SP005', 'Oppo F9', 7000000.0, 50, 'Hàng chính hãng'),
('SP006', 'Samsung Galaxy S9 Plus', 18000000.0, 30, 'Hàng xách tay');
insert into ps36680_quanlybh.hoadon values
('HD001', '2019-01-20', 20000000,'Đã thanh toán', 'NV004', 'KH003'),
('HD002', '2019-02-09', 27000000,'Chưa thanh toán', 'NV002', 'KH001'),
('HD003', '2019-01-22', 50000000,'Thanh toán qua thẻ', 'NV005', 'KH004'),
('HD004', '2019-02-03', 60000000,'Đã thanh toán', 'NV003', 'KH003'),
('HD005', '2019-01-29', 80000000,'Chưa thanh toán', 'NV003', 'KH005'),
('HD006', '2018-01-29', 30000000,'Chưa thanh toán', 'NV003', 'KH007'),
('HD007', '2018-01-29', 80000000,'Đã Thanh Toán', 'NV002', 'KH010'),
('HD008', '2018-01-29', 20000000,'Chưa thanh toán', 'NV003', 'KH001'),
('HD009', '2018-01-29', 10000000,'Đã Thanh Toán', 'NV003', 'KH006'),
('HD010', '2018-01-29', 10000000,'Chưa thanh toán', 'NV001', 'KH008'),
('HD011', '2018-01-29', 40000000,'Chưa thanh toán', 'NV002', 'KH009'),
('HD012', '2018-01-29', 50000000,'Đã Thanh Toán', 'NV005', 'KH002'),
('HD013', '2018-01-29', 20000000,'Đã thanh toán', 'NV001', 'KH003'),
('HD014', '2018-01-29', 30000000,'Đã thanh toán', 'NV003', 'KH011'),
('HD015', '2018-01-29', 70000000,'Đã thanh toán', 'NV002', 'KH015'),
('HD016', '2018-01-29', 80000000,'Chưa thanh toán', 'NV004', 'KH020'),
('HD017', '2018-01-29', 60000000,'Chưa thanh toán', 'NV004', 'KH021'),
('HD018', '2018-01-29', 90000000,'Chưa thanh toán', 'NV005', 'KH020'),
('HD019', '2018-01-29', 50000000,'Chưa thanh toán', 'NV001', 'KH003'),
('HD020', '2018-01-29', 40000000,'Chưa thanh toán', 'NV002', 'KH004'),
('HD021', '2018-01-29', 24000000,'Chưa thanh toán', 'NV003', 'KH009'),
('HD022', '2018-01-29', 12000000,'Chưa thanh toán', 'NV002', 'KH008'),
('HD023', '2018-01-29', 21000000,'Chưa thanh toán', 'NV003', 'KH016'),
('HD024', '2018-01-29', 22000000,'Chưa thanh toán', 'NV005', 'KH013'),
('HD025', '2018-01-29', 32000000,'Chưa thanh toán', 'NV004', 'KH011'),
('HD026', '2018-01-29', 19000000,'Chưa thanh toán', 'NV003', 'KH010'),
('HD027', '2018-01-29', 17500000,'Chưa thanh toán', 'NV001', 'KH001'),
('HD028', '2018-01-29', 12550000,'Chưa thanh toán', 'NV002', 'KH001'),
('HD029', '2018-01-29', 7000000,'Chưa thanh toán', 'NV001', 'KH002');
insert into ps36680_quanlybh.hoadonchitiet values
('HD001','SP001',1),
('HD002','SP003',1),
('HD002','SP004',1),
('HD003','SP002',1),
('HD003','SP003',1),
('HD004','SP001',3),
('HD005','SP002',2),
('HD005','SP003',1);

/*
Dựa trên cơ sở dữ liệu Quản lý bán hàng đã có, hãy thực hiện các câu truy vấn sau
*/

/*
Bài 1. Tạo chỉ mục trên các bảng có tần suất truy vấn nhiều
1. Tạo chỉ mục UNIQUE trên cột điện thoại của bảng khách hàng
2. Tạo chỉ mục UNIQUE trên cột email của bảng khách hàng
*/

create unique index uni_id_sdt_khachhang
on khachhang(dienthoai);

set @@sql_safe_updates = 0;
UPDATE khachhang
SET Email = NULL
WHERE Email = '';

create unique index uni_id_email_khachhang
on khachhang(email);

/*
Bài 2. Thao tác import, export và bảo mật dữ liệu
Sử dụng hệ quản trị csdl My SQL hoặc SQL Server để lưu trữ dữ liệu
1. Thực hiện các thao tác import/export DB Quản lý bán hàng ra file .sql
2. Tạo user trong my sql, gán quyền cho user
*/

create user 'binbungmo'@'localhost' identified by '123';

grant select, insert, delete, update on ps36680_quanlybh.*
to 'binbungmo'@'localhost';

/*
Bài 3. Bài tập: Dựa trên cơ sở dữ liệu Quản lý bán hàng đã có, hãy
thực hiện các câu truy vấn sau
*/

-- 1. Hiển thị danh sách các sản phẩm ‘Hàng xách tay’, có giá nhỏ hơn 5 mươi triệu. Thông tin gồm: Mã sp, tên sp, giá
select masp, tensp, giasp, mota
from sanpham
where mota = "Hàng xách tay" and giasp < 50000000;

-- 2. Cho biết số lượng hóa đơn chưa thanh toán của từng khách hàng. Thông tin gồm: Mã kh, tên kh, số lượng HD chưa TT
select kh.makh, concat(hovatenlot, " ", ten) as 'ten', count(mahd) as 'soluonghoadon'
from khachhang kh inner join hoadon hd on hd.makh = kh.makh
where trangthai = 'chưa thanh toán'
group by hd.makh;

-- 3. Thêm 1 hóa đơn mới (thông tin tự cho).
insert into hoadon
values ('KH030', '2023-08-22', 30000000, 'Đã thanh toán', 'NV005', 'KH007');

-- 4. Cập nhật trạng thái ‘Đã thanh toán’ và ngày lập HD là ngày hiện tại cho hóa đơn ‘HD002’. Chú ý: Dùng hàm curdate() để lấy ngày hiện tại
update hoadon
set trangthai = 'Đã thanh toán', ngaylaphd = curdate()
where mahd = 'HD002';

-- 5. Cho biết thông tin các nhân viên đã bán hàng cho khách hàng ‘KH001’. Thông tin hiển thị: MaNV, Họ tên NV, Số ĐT
select distinct nv.manv, concat(hovatenlot, " ", ten) as 'ten', dienthoai
from nhanvien nv inner join hoadon hd on nv.manv = hd.manv
where makh = 'KH001';

-- 6. Danh sách các sản phẩm có trong nhiều hơn 2 hóa đơn.
select sp.*, count(mahd)
from sanpham sp inner join hoadonchitiet hdct on sp.masp = hdct.masp
group by hdct.masp
having count(mahd) > 2;