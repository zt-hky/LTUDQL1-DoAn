
create proc LoadRangBuoc
as
	select * from RANGBUOC
go

--drop proc ThongKeNam
create proc ThongKeNam
@nam int
as
	select *
	from VECHUYENBAY ve
	where YEAR(ve.NgayDat) = '2019'
go


--drop proc ThayDoiSoLuongSanBay
create proc ThayDoiSoLuongSanBay
@slSanBay int
as
	update RANGBUOC set SLSanBay = @slSanBay

go

create proc ThayDoiThoiGianBayMin
@thoiGianBayMin int
as
	update RANGBUOC set ThoiGianBayMin = @thoiGianBayMin
go

create proc ThayDoiSanBayTrungGianMax
@sbMax int
as
	update RANGBUOC set SBTGMax = @sbMax
go

create proc ThayDoiThoiGianDung
@tgMin int,
@tgMax int
as
	update RANGBUOC set TGDungMin = @tgMin, TGDungMax = @tgMax
go

create proc ThayDoiThoiGianChamNhatDatVe
@tgDat int
as
	update RANGBUOC set TGDatVe = @tgDat
go

create proc ThongKeThang
@thang int,
@nam int
as
	select cb.MaCB, count(ve.MaVe) as SoVe,   ,SUM(ve.GiaVe) as DoanhThu
	from CHUYENBAY cb, VECHUYENBAY ve
	where cb.MaCB=ve.MaCB and MONTH(ve.NgayDat) = @thang and YEAR(ve.NgayDat) = @nam
	group by cb.MaCB
go

--drop proc ThongKeNam
create proc ThongKeNam
@nam int
as
	select MONTH(ve.NgayDat) as Thang, count(cb.MaCB) as SoChuyenBay, sum(ve.GiaVe) as DoanhThu
	from CHUYENBAY cb, VECHUYENBAY ve
	where cb.MaCB=ve.MaCB and YEAR(ve.NgayDat) = @nam
	group by MONTH(ve.NgayDat)
go


create proc ThayDoiThoiGianHuyDatVe
@tgHuy int
as
	update RANGBUOC set TGHuyVe = @tgHuy
go

create proc ThayDoiSLHangVe
@slHang1 int,
@slHang2 int
as
	update RANGBUOC set SLHangVe1 = @slHang1, SLHangVe2 = @slHang2
go

--drop proc LoadSanBayTheoMa
create proc LoadSanBayTheoMa
@maSB nchar(10)
as
select *
from SANBAY sb
where MaSB= @maSB
go

create proc LoadSanBay
as
	select * from SANBAY
go

create proc LoadHangVe
as
	select * from HANGVE
go

create proc loadDonGia
@sbDi char(10),
@sbDen char(10), 
@tenHang nvarchar(30)
as
	select SBDi, SBDen, GheHang, TenHangVe, Gia
	from BANGGIA b join HANGVE h on h.MaHangVe=b.GheHang
	where h.TenHangVe = @tenHang and b.SBDi = @sbDi and b.SBDen = @sbDen
go
