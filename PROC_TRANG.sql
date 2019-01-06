--============================= PROC 1660637 -	PHAN THỊ NHƯ TRANG ===========================

-- tính giá vé - hiển thị ra màn hình giá tiền cho khách hàng biết
if OBJECT_ID('GiaVe_DatCho','p') is not null
DROP proc GiaVe_DatCho
GO
create proc GiaVe_DatCho
@MaCB char(10),@GheHang varchar(10)
AS
	begin
		if not exists(select* from HANGVE where MaHangVe =@GheHang)
		begin 
			return
		end
		if not exists(select* from CHUYENBAY where MaCB = @MaCB)
		begin 
			return
		end
		
		select g.Gia
		from BANGGIA as g join CHUYENBAY as cb on cb.SBDen = g.SBDen and cb.SBDi = g.SBDi
		where cb.MaCB = @MaCB and g.GheHang =@GheHang
	end
GO
--insert vào bảng Vechuyenbay,
--Yêu cầu Đặt chổ
--Kiểm tra MaCB tồn tại
--Kiểm tra còn chỗ không
--Kiểm tra MaKH tồn tại
--Kiểm tra Hạng vé thuộc (1,2) không?
-->insert loai =0
if OBJECT_ID('ThemVe_DatCho','p') is not null
DROP proc ThemVe_DatCho
GO
create procedure ThemVe_DatCho
@MaCB char(10),@MaKH int,@GheHang varchar(10),@NgayDat datetime,@giaVe int
AS
	begin
		if not exists(select* from CHUYENBAY where MaCB = @MaCB)
		begin 
			return
		end
		insert into VECHUYENBAY(MaCB,MaKH,GheHang,NgayDat,GiaVe,Loai)
		values (@MaCB,@MaKH,@GheHang,@NgayDat,@giaVe,0)
	end
GO


--yêu cầu bán vé
--Kiểm tra mã đặt chỗ
--update Loai = 1
if OBJECT_ID('CapNhatLoaiVe_BanVe','p') is not null
DROP proc CapNhatLoaiVe_BanVe
GO
create procedure CapNhatLoaiVe_BanVe
@maVe int
AS
	begin
		if not exists(select* from VECHUYENBAY where MaVe = @maVe)
		begin 
			return
		end
		update VECHUYENBAY set Loai =1 where MaVe = @maVe
	end
GO
--search MaDatCho theo MaKH va MaCB - Xuất ra Cho khách hàng thấy sau khi đặt chổ
if OBJECT_ID('TimKiemMaDatCho','p') is not null
DROP proc TimKiemMaDatCho
GO
create procedure TimKiemMaDatCho
@maKH int, @maCB varchar(10)
AS
	begin 
		select MaVe from VECHUYENBAY where MaCB=@maCB and MaKH = @maKH
	end
GO
--Hiển thị thông tin đặt chổ từ mã đặt chổ
if OBJECT_ID('ThongTinDatCho','p') is not null
DROP proc ThongTinDatCho
GO
create procedure ThongTinDatCho
@maVe int
AS
	begin 
		if not exists (select*from VECHUYENBAY where MaVe = @maVe)
		begin
			return
		end
		select ve.MaVe,cb.MaCB,cb.SBDi,cb.SBDen,cb.NgayGio,kh.MaKH,kh.TenKH,kh.CMND,kh.DienThoai,ve.GiaVe,ve.GheHang
		from VECHUYENBAY as ve join CHUYENBAY as cb on cb.MaCB= ve.MaCB join KHACHHANG as kh on kh.MaKH = ve.MaKH
		where ve.MaVe=@maVe
	end
GO

--Them KH
if OBJECT_ID('ThemCMNDKhachHang','p') is not null
DROP proc ThemCMNDKhachHang
GO
create procedure ThemCMNDKhachHang
@CMND char(10)
AS
	begin 
		if exists(select* from KHACHHANG where CMND = @CMND)
		begin 
			return
		end
		else
		begin
			insert into KHACHHANG(CMND) values(@CMND)
		end
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
		update KHACHHANG set TenKH=@TenKH,DienThoai=@DienThoai,CMND=@CMND Where MaKH =@MaKH
	end
GO
--search Khach hang theo CMND
if OBJECT_ID('TimKiemKhachHang','p') is not null
DROP proc TimKiemKhachHang
GO
create procedure TimKiemKhachHang
@CMND varchar(20)
AS
	begin 
		select* from KHACHHANG where CMND=@CMND
	end
GO
--Liệt kê danh sách chuyến bay sau n ngày của ngày hiện tại( chưa bay) - n: là thời gian chậm nhất trước n ngày để đặt vé
--n : là TGDatVe
--liệt kê ra combobox trong DatCho
if OBJECT_ID('DatCho_DanhSachChuyenBay','p') is not null
DROP proc DatCho_DanhSachChuyenBay
GO
create procedure DatCho_DanhSachChuyenBay
AS
	begin 
		select * from CHUYENBAY where DATEDIFF(HOUR,GETDATE(), NgayGio) >=all (select TGDatVe from RANGBUOC)
	end
GO
--Tìm kiếm chuyến bay theo Mã chuyến bay (đặt chổ)
if OBJECT_ID('TimKiemChuyenBay','p') is not null
DROP proc TimKiemChuyenBay
GO
create procedure TimKiemChuyenBay
@MaCB char(10)
AS
	begin 
		select* from CHUYENBAY where MaCB=@MaCB
	end
GO

--======================================== HẾT phần của Trang ==================================================
select*from KHACHHANG