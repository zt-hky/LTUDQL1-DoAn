----------
if OBJECT_ID('LoadRangBuoc','p') is not null
DROP proc LoadRangBuoc
GO
create proc LoadRangBuoc
as
	select * from RANGBUOC
go

----------
if OBJECT_ID('ThongKeNam','p') is not null
DROP proc ThongKeNam
GO

--drop proc ThongKeNam
create proc ThongKeNam
@nam int
as
	select *
	from VECHUYENBAY ve
	where YEAR(ve.NgayDat) = '2019'
go

----------
if OBJECT_ID('ThayDoiSoLuongSanBay','p') is not null
DROP proc ThayDoiSoLuongSanBay
GO
--drop proc ThayDoiSoLuongSanBay
create proc ThayDoiSoLuongSanBay
@slSanBay int
as
	update RANGBUOC set SLSanBay = @slSanBay

go

----------
if OBJECT_ID('ThayDoiThoiGianBayMin','p') is not null
DROP proc ThayDoiThoiGianBayMin
GO

create proc ThayDoiThoiGianBayMin
@thoiGianBayMin int
as
	update RANGBUOC set ThoiGianBayMin = @thoiGianBayMin
go

----------
if OBJECT_ID('ThayDoiSanBayTrungGianMax','p') is not null
DROP proc ThayDoiSanBayTrungGianMax
GO

create proc ThayDoiSanBayTrungGianMax
@sbMax int
as
	update RANGBUOC set SBTGMax = @sbMax
go

----------
if OBJECT_ID('ThayDoiThoiGianDung','p') is not null
DROP proc ThayDoiThoiGianDung
GO

create proc ThayDoiThoiGianDung
@tgMin int,
@tgMax int
as
	update RANGBUOC set TGDungMin = @tgMin, TGDungMax = @tgMax
go

----------
if OBJECT_ID('ThayDoiThoiGianChamNhatDatVe','p') is not null
DROP proc ThayDoiThoiGianChamNhatDatVe
GO

create proc ThayDoiThoiGianChamNhatDatVe
@tgDat int
as
	update RANGBUOC set TGDatVe = @tgDat
go

----------
if OBJECT_ID('TinhTyLe') is not null
DROP FUNCTION TinhTyLe
GO

CREATE FUNCTION TinhTyLe (@maCB nchar(10)) 
RETURNS float 
AS 
BEGIN 
	declare @tong float = (select (SLHangVe1+SLHangVe2) as TongVe from RANGBUOC)
	declare @count float = (	select dem.SoVeBan
									from (  select MaCB, count(MaVe) as SoVeBan 
											from VECHUYENBAY where MaCB = @maCB
											group by MaCB) as dem )
	declare @tyle float = (@count / @tong) * 100
 RETURN  @tyle
END

go
----------

if OBJECT_ID('ThongKeThang','p') is not null
DROP proc ThongKeThang
GO

--drop proc ThongKeThang
create proc ThongKeThang
@thang int,
@nam int
as
	select cb.MaCB, count(ve.MaVe) as SoVe, round(dbo.TinhTyLe(cb.MaCB), 2) as TyLe ,SUM(ve.GiaVe) as DoanhThu
	from CHUYENBAY cb, VECHUYENBAY ve, (select SLHangVe1, SLHangVe2, (SLHangVe1+SLHangVe2) as TongVe from RANGBUOC) as rb
	where cb.MaCB=ve.MaCB and MONTH(ve.NgayDat) = @thang and YEAR(ve.NgayDat) = @nam
	group by cb.MaCB
go



----------
if OBJECT_ID('ThongKeNam','p') is not null
DROP proc ThongKeNam
GO

--drop proc ThongKeNam
create proc ThongKeNam
@nam int
as
	select MONTH(ve.NgayDat) as Thang, count(cb.MaCB) as SoChuyenBay, sum(ve.GiaVe) as DoanhThu
	from CHUYENBAY cb, VECHUYENBAY ve
	where cb.MaCB=ve.MaCB and YEAR(ve.NgayDat) = @nam
	group by MONTH(ve.NgayDat)
go


----------
if OBJECT_ID('ThayDoiThoiGianHuyDatVe','p') is not null
DROP proc ThayDoiThoiGianHuyDatVe
GO


create proc ThayDoiThoiGianHuyDatVe
@tgHuy int
as
	update RANGBUOC set TGHuyVe = @tgHuy
go



----------
if OBJECT_ID('ThayDoiSLHangVe','p') is not null
DROP proc ThayDoiSLHangVe
GO


create proc ThayDoiSLHangVe
@slHang1 int,
@slHang2 int
as
	update RANGBUOC set SLHangVe1 = @slHang1, SLHangVe2 = @slHang2
go

----------
if OBJECT_ID('LoadSanBayTheoMa','p') is not null
DROP proc LoadSanBayTheoMa
GO


--drop proc LoadSanBayTheoMa
create proc LoadSanBayTheoMa
@maSB nchar(10)
as
select *
from SANBAY sb
where MaSB= @maSB
go

----------
if OBJECT_ID('LoadSanBay','p') is not null
DROP proc LoadSanBay
GO


create proc LoadSanBay
as
	select * from SANBAY
go

----------
if OBJECT_ID('LoadHangVe','p') is not null
DROP proc LoadHangVe
GO


create proc LoadHangVe
as
	select * from HANGVE
go

----------
if OBJECT_ID('loadDonGia','p') is not null
DROP proc loadDonGia
GO

--drop proc loadDonGia
create proc loadDonGia
@sbDi char(10),
@sbDen char(10), 
@hang int
as
	select SBDi, SBDen, GheHang, Gia
	from BANGGIA b
	where b.GheHang = @hang and b.SBDi = @sbDi and b.SBDen = @sbDen
go


----------
if OBJECT_ID('ThayDoiDonGia','p') is not null
DROP proc ThayDoiDonGia
GO

create proc ThayDoiDonGia
@sbDi char(10),
@sbDen char(10), 
@hang int,
@gia float
as
	update BANGGIA set Gia = @gia where SBDi=@sbDi and SBDen=@sbDen and GheHang=@hang
go