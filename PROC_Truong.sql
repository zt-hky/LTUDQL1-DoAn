
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

--create proc ThayDoiThoiGianChamNhatDatVe
--@tgDat datetime
--as
--	update TG
--go

create proc ThongKeThang
@thang int,
@nam int
as
	select cb.MaCB, count(ve.MaVe) as SoVe  ,SUM(ve.GiaVe) as DoanhThu
	from CHUYENBAY cb, VECHUYENBAY ve
	where cb.MaCB=ve.MaCB and MONTH(ve.NgayDat) = @thang and YEAR(ve.NgayDat) = @nam
	group by cb.MaCB
go


create proc ThongKeNam
@nam int
as
	select MONTH(ve.NgayDat) as Thang, count(cb.MaCB) as SoChuyenBay, sum(ve.GiaVe) as DoanhThu
	from CHUYENBAY cb, VECHUYENBAY ve
	where cb.MaCB=ve.MaCB and YEAR(ve.NgayDat) = @nam
	group by MONTH(ve.NgayDat)
go

