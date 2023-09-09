drop database ps36680_ql_detai_tn;

create database ps36680_ql_detai_tn;

use ps36680_ql_detai_tn;

create table detai (
	madt varchar(5) not null primary key,
    tendt varchar(50) not null);

create table sinhvien (
	masv varchar(8) not null primary key,
    hoten varchar(50) not null,
    diachi varchar(200) null,
    dienthoai varchar(10) not null,
    madt varchar(5) not null);
    
alter table sinhvien
add constraint fk_sv_dt
foreign key (madt) references detai(madt);

insert into detai values
('22001', 'Quan ly thu vien'),
('22002', 'Nhan dang van tay'),
('22003', 'Ban dau gia tren mang'),
('22004', 'Quan ly sieu thi'),
('22005', 'Xu ly anh');

insert into sinhvien values
('22TH0101', 'Nguyen Van An', '12 Tran Hung Dao Q1', '0903688543', '22001'),
('22TH0102', 'Tran Hung Anh', '13/4 Le Thai Ton, Q4', '0908453443', '22002'),
('22TH9903', 'Le Thuy Hang', '20 Pasteur, Q3', '0988544457', '22001'),
('22TH9904', 'Ngo Anh Khoa', '54/12 Le Hong Phong, Q10', '0808545439', '22003'),
('22DH8805', 'Pham Van Tai', '12 Bach Dang Q.TB', '0938149023', '22005'),
('22DH8806', 'Dinh Hoang Tien', '31 Ton Dan, Q4', '0938956123', '22005');

-- 1. Hiển thị toàn bộ thông tin sinh viên, sắp xếp theo thứ tự mã đề tài tăng dần
select *
from sinhvien
order by madt;

-- 2. Hiển thị toàn bộ thông tin những sinh viên ở quận 1 (Q1) và quận 4 (Q4).
select *
from sinhvien
where diachi like '%Q1' or diachi like '%Q4';

-- 3. Liệt kê những sinh viên ngành Đồ Họa (ký tự thứ 3, thứ 4 là ‘DH’ của mã sinh viên), thông tin gồm: Mã sinh viên, họ tên, địa chỉ, số điện thoại, tên đề tài.
select masv, hoten, diachi, dienthoai, tendt
from sinhvien sv inner join detai dt on sv.madt = dt.madt
where masv like '%DH%';

-- 4. Thống kê số lượng sinh viên tham gia từng đề tài, thông tin gồm: Mã đề tài, tên đề tài, số lượng sinh viên tham gia
select dt.madt, tendt, count(masv) as soluongsvthamgia
from sinhvien sv inner join detai dt on sv.madt = dt.madt
group by dt.madt;

-- 5. Hãy cho biết đề tài nào có sinh viên tham gia nhiều nhất, thông tin gồm: Mã đề tài, tên đề tài, số lượng sinh viên
select dt.madt, tendt, count(masv) as soluongsinhvien
from sinhvien sv inner join detai dt on sv.madt = dt.madt
group by dt.madt
having soluongsinhvien >= all (
	select count(masv)
    from sinhvien
    group by madt);
    
-- 6. Tạo bảng lưu danh sách các đề tài không có sinh viên thực hiện
create table detai_sinhvien
select *
from detai
where madt not in (
	select madt
    from sinhvien);

-- 7. Chuyển đề tài cho sinh viên có mã ‘22DH8805’ sang làm đề tài ‘Quản lý siêu thị’
update sinhvien
set madt = '22004'
where masv = '22DH8805';