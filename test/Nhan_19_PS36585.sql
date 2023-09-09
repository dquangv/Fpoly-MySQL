create database PS36585_QuanLy_NhanSu;
use PS36585_QuanLy_NhanSu ;

-- tạo bảng
create table phongban(
	idPB varchar(5) not null,
	tenPB varchar(200),
    primary key (idPB)
);

create table nhanvien(
	idNV int not null,
    hoNV varchar(100),
    tenNV varchar(50) not null,
    namSinh date,
    gioiTinh varchar(5),
    luong decimal,
    phongbanID varchar(5),
    primary key (idNV),
    foreign key (phongbanID)
	references phongban(idPB)
);

-- thêm dữ liệu vào bảng
insert into phongban(idPB,tenPB)
values  ('PB001','kế toán'),
		('PB002','nhân sự'),
		('PB003','kinh doanh'),
		('PB004','marketing'),
		('PB005','kỹ thuật'),
		('PB006','quản lý chất lượng'),
		('PB007','sản xuất'),
		('PB008','phòng nhà máy'),
		('PB009','phòng dịch vụ'),
		('PB010','phòng tiếp thị');
   
   
   insert into nhanvien(idNV,hoNV,tenNV,namSinh,gioiTinh,luong,phongbanID)
   values   ('1','Nguyễn','Chiêu','1990-01-01','nam','15000000','PB001'),
			('2','Trần','Long','1995-05-03','nam','12000000','PB002'),
			('3','Lê','Hương','1992-10-06','nữ','13500000','PB002'),
			('4','Phạm','Hùng','1992-06-10','nam','20000000','PB003'),
			('5','Đỗ','Khanh','1993-10-20','nữ','18000000','PB003'),
			('6','Vũ','Kha','1987-12-25','nam','25000000','PB004'),
			('7','Nguyễn','Khang','1991-02-28','nữ','25000000','PB004'),
			('8','Hoàng','Hoàng','1985-04-02','nam','22000000','PB005'),
			('9','Lê','Bảo','1994-07-08','nữ','14000000','PB005'),
			('10','Trần','Bình','1997-09-12','nam','11000000','PB006'),
			('11','Phạm','An','1990-11-17','nữ','25000000','PB006'),
			('12','Nguyễn','Lan','1986-01-23','nam','19000000','PB007'),
			('13','Lê','Cúc','1992-04-28','nữ','13000000','PB007'),
			('14','Trần','Chánh','1998-07-03','nam','10500000','PB007'),
			('15','Vũ','Anh','1989-09-07','nữ','17500000','PB005');
	
    -- truy vấn
    -- 1. Trong bảng nhan_vien, lấy các thông tin gồm: ho_nv, ten_nv, nam_sinh, gioi_tinh, luong của tất cả các nhân viên trong phòng ban có id là "PB003"
		select hoNV, tenNV, namSinh, gioiTinh, luong
		from nhanvien
		where phongbanID = 'PB003';
    
	-- 2. Trong bảng nhan_vien hiển thị ho_nv, ten_nv, Luong; trong đó gộp 2 cột ho_nv, ten_nv thành cột đặt tên là "Full Name". Chỉ hiển thị các nhân viên 
	-- có mức lương > 5000000 (5 triệu), sắp xếp lương giảm dần và chỉ lấy 5 dòng dữ liệu
		select   concat(hoNV,' ',tenNV) as fullName, luong
		from nhanvien
		where luong > 5000000
		order by luong desc
		limit 5;
    
	-- 3. Trong bảng nhan_vien lấy ra tất cả các nhân viên có mức lương cao nhất bao gồm các thông tin: ho_nv, ten_nv, luong và sắp xếp theo cột ten_nv 
	-- theo thứ tự từ A-Z
		select hoNV, tenNV, luong
		from nhanvien
		where luong = (select MAX(luong) from nhanvien)
		order by tenNV;

	-- 4. Hiển thị thông tin phòng ban chưa có nhân viên nào 
		select *
        from phongban
        where idPB not in
        (select distinct phongbanID 
        from nhanvien 
        );
	-- 5. Hiển thị thông tin: ho_nv, ten_nv, gioi_tinh, tuổi (lấy năm hiện tại curdate() - nam_sinh), nhưng chỉ hiển thị các nhân viên có tuổi lớn hơn 30
		select hoNV, tenNV, gioiTinh, year(curdate()) - year(namSinh) as tuoi
		from nhanvien
		where year(curdate()) - year(namSinh) > 30;

        
	-- 6. Hiển thị thông tin các nhân viên trong nhóm có mức lương cao thứ 3
		select luong, hoNV, tenNV
        from nhanvien 
        where luong <(
			select distinct max(luong) from nhanvien
        )
        limit 1;


	-- 7. Chuyển nhân viên có id = 7 sang phòng kế toán
		UPDATE nhanvien
		SET phongbanID = 'PB002'
		WHERE  idNV = '7';		