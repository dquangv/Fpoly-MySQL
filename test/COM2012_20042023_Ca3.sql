drop database ps36680_xuatban;

create database ps36680_xuatban;

use ps36680_xuatban;

create table nhaxuatban (
	manxb char(5) primary key,
    tennxb varchar(32) not null,
    dchi varchar(64) null,
    dthoai varchar(15) null);

create table sach (
	masach char(5) primary key,
    tensach varchar(64) not null,
    dongia int null,
    manxb char(5) not null,
    soluongban int null,
    solanxem int null);
    
alter table sach
add constraint fk_sach_nhaxuatban
foreign key (manxb) references nhaxuatban(manxb);
    
insert into nhaxuatban values
('NB001', 'Nha Nam', 'Cau Giay, Ha Noi', '02435146875'),
('NB002', 'Kim Dong', 'Quan 1, TP.HCM', '02839303832'),
('NB003', 'Giao Duc', 'Hoan Kiem, Ha Noi', '02435121979'),
('NB004', 'Tre', 'Quan 3, TP.HCM', '02839311433'),
('NB005', 'Tong Hop', 'Quan 1, TP.HCM', '02838256804');

insert into sach values
('SH001', 'Nang va hoa', 70000, 'NB005', 100, 1000),
('SH002', 'Bui sao', 90000, 'NB001', 200, 600),
('SH003', 'Mot nua lam day the gioi', 100000, 'NB005', 150, 500),
('SH004', 'Bo me oi, con tu dau toi', 50000, 'NB001', 250, 1000),
('SH005', 'Bong may', 60000, 'NB002', 180, 250),
('SH006', 'Nep cu', 180000, 'NB004', 100, 200);

-- 1. Hiển thị toàn bộ thông tin sách theo thứ tự giảm dần theo SoLuotXem.
select *
from sach
order by solanxem desc;

-- 2. Có bao nhiêu cuốn sách của NXB Nhã Nam.
select tennxb, count(masach)
from nhaxuatban nxb inner join sach s on nxb.manxb = s.manxb
where tennxb = 'Nha Nam';

-- 3. Hiển thị tên NXB, mã NXB, tổng số lượt xem. (Nhà xuất bản nào chưa có lượt xem thì hiển thị số 0)
select tennxb, nxb.manxb, ifnull(sum(solanxem), 0) as 'tongsoluotxem'
from nhaxuatban nxb left join sach s on nxb.manxb = s.manxb
group by nxb.manxb;

-- 4. Hiển thị thông tin NXB có doanh thu cao nhất. Với doanh thu bằng tổng số lượng bán * đơn giá ứng với từng cuốn sách.
select nxb.*, sum(soluongban * dongia) as 'doanhthu'
from nhaxuatban nxb inner join sach s on nxb.manxb = s.manxb
group by s.manxb
having doanhthu = (
	select max(doanhthu)
    from (
		select sum(soluongban * dongia) as 'doanhthu'
        from sach
        group by manxb) as bangdoanhthu
	);

-- 5. Giảm 10% giá bán cho sách của NXB Kim Đồng.
update sach
set dongia = dongia * 0.9
where manxb in (
	select manxb
    from nhaxuatban
    where tennxb = 'Kim Dong');


-- 6. Hiện thị thông tin NXB có tổng số sách bán ra bé hơn trung bình số lượng của toàn bộ sách đã bán ra.
select nxb.*, sum(soluongban) as 'tongsosachbanra'
from nhaxuatban nxb inner join sach s on nxb.manxb = s.manxb
group by s.manxb
having tongsosachbanra <= (
	select avg(soluongban)
    from sach);

-- 7. Tạo bảng lưu các sách có số lượt xem lớn nhất của từng nhà xuất bản
create table nhaxuatban_sach
select *
from sach
where solanxem in (
	select max(solanxem)
    from sach
    group by manxb);