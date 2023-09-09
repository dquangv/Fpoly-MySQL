drop database vanchuyen;

create database vanchuyen;

use vanchuyen;

create table xetai (
	bienso char(11) not null primary key,
    tenxe varchar(30) not null,
    ngaymua date not null,
    trongtai int not null,
    ngaykd date not null);
    
create table vanchuyen (
	mavc char(5) not null primary key,
    bienso char(11) not null,
    trongluong int not null,
    quangduong int not null,
    ngayvc date not null);
    
alter table vanchuyen
add constraint fk_vc_xt
foreign key (bienso) references xetai(bienso);

insert into xetai values
('59A1-135.79', 'KIA A200', '2020-3-2', 1200, '2022-11-6'),
('39F2-456.67', 'Teraco 190', '2021-8-7', 2000, '2022-10-7'),
('61A3-543.22', 'ISUZU IKR', '2022-4-20', 900, '2021-3-8'),
('50B2-223.77', 'JAC HFC1042K', '2019-8-4', 1500, '2022-12-5'),
('52A1-335.46', 'KIA A200', '2020-6-2', 1200, '2022-1-9');

insert into vanchuyen values
('V001', '59A1-135.79', 1000, 20, '2023-1-2'),
('V002', '50B2-223.77', 1200, 15, '2023-4-16'),
('V003', '61A3-543.22', 1000, 30, '2023-9-2'),
('V004', '59A1-135.79', 1500, 22, '2022-7-6'),
('V005', '61A3-543.22', 800, 40, '2021-2-8'),
('V006', '39F2-456.67', 2000, 30, '2023-3-5'),
('V007', '50B2-223.77', 2000, 15, '2023-4-21');

-- 1. Liệt kê xe có trọng tải lớn hơn 1200 kg. Sắp xếp danh sách theo thứ tự ngày mua giảm dần
select *
from xetai
where trongtai > 1200
order by ngaymua desc;

-- 2. Liệt kê xe được sản xuất bởi hãng KIA mua sau năm 2020
select *
from xetai
where tenxe like '%KIA%' and year(ngaymua) > 2020;

-- 3. Liệt kê danh sách xe chưa sử dụng vận chuyển lần nào
select *
from xetai
where bienso not in (
	select bienso
    from vanchuyen);

-- 4. Cập nhật ngày kiểm định cho xe có biển số: 39F2-456.67 là ngày hiện hành
update xetai
set ngaykd = curdate()
where bienso = '39F2-456.67';

-- 5. Tìm xe hết hạn kiểm định, biết hạn kiểm định là 6 tháng
select *
from xetai
where ngaykd <= date_sub(current_date(), interval 6 month);

-- 6. Tìm xe có tổng quãng đường sử dụng để vận chuyển ngắn nhất
select xt.*, sum(quangduong) as 'quang_duong_ngan_nhat'
from xetai xt inner join vanchuyen vc on xt.bienso = vc.bienso
group by vc.bienso
having sum(quangduong) = (
	select sum(quangduong)
    from vanchuyen
    group by bienso
    limit 1);

-- 7. Tạo bảng lưu những chuyến vận chuyển lượng hàng vượt quá tải trọng xe
create table xetai_vanchuyen
select vc.*, trongtai
from xetai xt inner join vanchuyen vc on xt.bienso = vc.bienso
where trongluong > trongtai;