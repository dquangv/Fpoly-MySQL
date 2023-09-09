
-- Tao CSDL quanlybanhangLab7
CREATE DATABASE quanlybanhangLab7;

-- Chi dinh CSDL duoc su dung
USE quanlybanhangLab7;

-- Tao bang KhachHang
CREATE TABLE KhachHang(
	MaKH VARCHAR(10) NOT NULL,
	HoVaTenLot VARCHAR(50),
	Ten VARCHAR(50) NOT NULL,
	DiaChi VARCHAR(255),
	Email VARCHAR(50),
	DienThoai VARCHAR(20) NOT NULL,
	PRIMARY KEY (MaKH)
);

-- Tao bang NhanVien
CREATE TABLE NhanVien(
	MaNV VARCHAR(10) NOT NULL,
	HoVaTenLot VARCHAR(50) ,
	Ten VARCHAR(50) NOT NULL,
	DiaChi VARCHAR(255),
	Email VARCHAR(50),
	DienThoai VARCHAR(20) NOT NULL,
	PRIMARY KEY (MaNV)
);

-- Tao bang SanPham
CREATE TABLE SanPham(
	MaSP VARCHAR(10) NOT NULL,
	TenSP VARCHAR(50),
	GiaSP FLOAT NOT NULL,
	SoLuong INT NOT NULL,
	MoTa VARCHAR(255) NOT NULL,
	PRIMARY KEY (MaSP)
);

-- Tao bang HoaDon
CREATE TABLE HoaDon(
	MaHD VARCHAR(10) NOT NULL,
	NgayLapHD DATE NOT NULL,
	TongTien FLOAT NOT NULL,
	TrangThai VARCHAR(20) NOT NULL,
	MaNV VARCHAR(10) NOT NULL,
	MaKH VARCHAR(10) NOT NULL,
	PRIMARY KEY (MaHD)
);

-- Tao bang HoaDonChiTiet
CREATE TABLE HoaDonChiTiet(
	MaHD VARCHAR(10) NOT NULL,
	MaSP VARCHAR(10) NOT NULL,
	SoLuongMua INT NOT NULL,
	PRIMARY KEY (MaHD, MaSP)
);

-- -- Them khoa ngoai bang HoaDon
ALTER TABLE HoaDon
ADD CONSTRAINT FK_HD_NV FOREIGN KEY (MaNV) REFERENCES nhanvien(MaNV),
ADD CONSTRAINT FK_HD_KH FOREIGN KEY (MaKH) REFERENCES khachhang(MaKH);

-- -- Them khoa ngoai bang HoaDonChiTiet
ALTER TABLE HoaDonChiTiet
ADD CONSTRAINT FK_HDCT_HD FOREIGN KEY (MaHD) REFERENCES hoadon(MaHD),
ADD CONSTRAINT FK_HDCT_SP FOREIGN KEY (MaSP) REFERENCES sanpham(MaSP);



-- Nhap du lieu bang KhachHang
INSERT INTO KhachHang VALUES
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

-- Nhap du lieu bang NhanVien
INSERT INTO NhanVien VALUES
	('NV001', 'Võ Đình', 'Hải', 'Gò Vấp', '', '0983769320'),
	('NV002', 'Lý Minh', 'Khoa', 'Quận 3', '', '0933999100'),
	('NV003', 'Vũ Phạm Minh', 'Châu', 'Quận 1', '', '0977333902'),
	('NV004', 'Nguyễn Văn', 'Tuấn', 'Quận 2', '', '0903000021'),
	('NV005', 'Lê Hoài', 'Bảo', 'Bình Thạnh', '', '0933488854'),
	('NV006', 'Trần Duy Bảo', 'Long', 'Phú Nhuận', '', '0888022422');

-- Nhap du lieu bang SanPham
INSERT INTO SanPham VALUES
	('SP001', 'Samsung Galaxy Note 9', 20000000.0, 30, 'Hàng chính hãng'),
	('SP002', 'IPHONE XS MAX', 30000000.0, 15, 'Hàng chính hãng'),
	('SP003', 'IPHONE X', 20000000.0, 40, 'Hàng xách tay'),
	('SP004', 'BPhone 3', 70000000.0, 300, 'Hàng chính hãng'),
    ('SP005', 'Oppo F9', 7000000.0, 50, 'Hàng chính hãng'),
	('SP006', 'Samsung Galaxy S9 Plus', 18000000.0, 30, 'Hàng xách tay');

-- Nhap du lieu bang HoaDon
INSERT INTO HoaDon VALUES
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

-- Nhap du lieu bang HoaDonChiTiet
INSERT INTO HoaDonChiTiet VALUES
	('HD001','SP001',1),
	('HD002','SP003',1),
	('HD002','SP004',1),
	('HD003','SP002',1),
	('HD003','SP003',1),
	('HD004','SP001',3),
	('HD005','SP002',2),
	('HD005','SP003',1);



