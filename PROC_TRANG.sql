--============================= PROC 1660637 -	PHAN THỊ NHƯ TRANG ===========================
--insert vào bảng Vechuyenbay,
--Yêu cầu Đặt chổ
--Kiểm tra MaCB tồn tại
--Kiểm tra còn chỗ không
--Kiểm tra MaKH tồn tại
--Kiểm tra Hạng vé thuộc (1,2) không?

-->insert loai =0

--yêu cầu bán vé
--Kiểm tra mã đặt chỗ
--update Loai = 1

--button Them (CMND)
-- Phat sinh mã
-- Kiểm tra CMND tồn tại
--insert
if OBJECT_ID('ThemCMNDKhachHang','p') is not null
DROP proc ThemCMNDKhachHang
GO
create procedure ThemCMNDKhachHang
@CMND char(10)
AS
	begin 
		insert into KHACHHANG(CMND) values(@CMND)
	end
GO
--button CapNhat (FrmKhachHang)
--update Khach hang
if OBJECT_ID('CapNhatKhachHang','p') is not null
DROP proc CapNhatKhachHang
GO
create procedure CapNhatKhachHang
@CMND char(10),@MaKH int,@TenKH nvarchar(30),@DienThoai varchar(10)
AS
	begin 
		update KHACHHANG set TenKH=@TenKH,DienThoai=@DienThoai
	end
GO
--search Khach hang theo CMND
if OBJECT_ID('TimKiemKhachHang','p') is not null
DROP proc TimKiemKhachHang
GO
create procedure TimKiemKhachHang
@CMND char(10)
AS
	begin 
		select* from KHACHHANG where CMND=@CMND
	end
GO
--======================================== HẾT phần của Trang ==================================================
