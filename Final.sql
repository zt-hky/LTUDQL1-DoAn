USE [master]
GO
/****** Object:  Database [DoAnUDQL]    Script Date: 1/6/2019 10:00:11 PM ******/
CREATE DATABASE [DoAnUDQL]
GO
ALTER DATABASE [DoAnUDQL] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DoAnUDQL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DoAnUDQL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DoAnUDQL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DoAnUDQL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DoAnUDQL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DoAnUDQL] SET ARITHABORT OFF 
GO
ALTER DATABASE [DoAnUDQL] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DoAnUDQL] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DoAnUDQL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DoAnUDQL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DoAnUDQL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DoAnUDQL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DoAnUDQL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DoAnUDQL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DoAnUDQL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DoAnUDQL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DoAnUDQL] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DoAnUDQL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DoAnUDQL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DoAnUDQL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DoAnUDQL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DoAnUDQL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DoAnUDQL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DoAnUDQL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DoAnUDQL] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DoAnUDQL] SET  MULTI_USER 
GO
ALTER DATABASE [DoAnUDQL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DoAnUDQL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DoAnUDQL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DoAnUDQL] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DoAnUDQL]
GO
/****** Object:  StoredProcedure [dbo].[CapNhatKhachHang]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CapNhatKhachHang]
@CMND char(10),@MaKH int,@TenKH nvarchar(30),@DienThoai varchar(10)
AS
	begin 
		update KHACHHANG set TenKH=@TenKH,DienThoai=@DienThoai,CMND=@CMND Where MaKH =@MaKH
	end

GO
/****** Object:  StoredProcedure [dbo].[CapNhatLoaiVe_BanVe]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CapNhatLoaiVe_BanVe]
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
/****** Object:  StoredProcedure [dbo].[DatCho_DanhSachChuyenBay]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DatCho_DanhSachChuyenBay]
AS
	begin 
		select * from CHUYENBAY where DATEDIFF(HOUR,GETDATE(), NgayGio) >=all (select TGDatVe from RANGBUOC)
	end

GO
/****** Object:  StoredProcedure [dbo].[GiaVe_DatCho]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GiaVe_DatCho]
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
/****** Object:  StoredProcedure [dbo].[loadDonGia]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--drop proc loadDonGia
create proc [dbo].[loadDonGia]
@sbDi char(10),
@sbDen char(10), 
@hang int
as
	select SBDi, SBDen, GheHang, Gia
	from BANGGIA b
	where b.GheHang = @hang and b.SBDi = @sbDi and b.SBDen = @sbDen

GO
/****** Object:  StoredProcedure [dbo].[LoadHangVe]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[LoadHangVe]
as
	select * from HANGVE

GO
/****** Object:  StoredProcedure [dbo].[LoadRangBuoc]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LoadRangBuoc]
as
	select * from RANGBUOC

GO
/****** Object:  StoredProcedure [dbo].[LoadSanBay]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[LoadSanBay]
as
	select * from SANBAY

GO
/****** Object:  StoredProcedure [dbo].[LoadSanBayTheoMa]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--drop proc LoadSanBayTheoMa
create proc [dbo].[LoadSanBayTheoMa]
@maSB nchar(10)
as
select *
from SANBAY sb
where MaSB= @maSB

GO
/****** Object:  StoredProcedure [dbo].[ThayDoiDonGia]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ThayDoiDonGia]
@sbDi char(10),
@sbDen char(10), 
@hang int,
@gia float
as
	update BANGGIA set Gia = @gia where SBDi=@sbDi and SBDen=@sbDen and GheHang=@hang

GO
/****** Object:  StoredProcedure [dbo].[ThayDoiSanBayTrungGianMax]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ThayDoiSanBayTrungGianMax]
@sbMax int
as
	update RANGBUOC set SBTGMax = @sbMax

GO
/****** Object:  StoredProcedure [dbo].[ThayDoiSLHangVe]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[ThayDoiSLHangVe]
@slHang1 int,
@slHang2 int
as
	update RANGBUOC set SLHangVe1 = @slHang1, SLHangVe2 = @slHang2

GO
/****** Object:  StoredProcedure [dbo].[ThayDoiSoLuongSanBay]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--drop proc ThayDoiSoLuongSanBay
create proc [dbo].[ThayDoiSoLuongSanBay]
@slSanBay int
as
	update RANGBUOC set SLSanBay = @slSanBay


GO
/****** Object:  StoredProcedure [dbo].[ThayDoiThoiGianBayMin]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ThayDoiThoiGianBayMin]
@thoiGianBayMin int
as
	update RANGBUOC set ThoiGianBayMin = @thoiGianBayMin

GO
/****** Object:  StoredProcedure [dbo].[ThayDoiThoiGianChamNhatDatVe]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ThayDoiThoiGianChamNhatDatVe]
@tgDat int
as
	update RANGBUOC set TGDatVe = @tgDat

GO
/****** Object:  StoredProcedure [dbo].[ThayDoiThoiGianDung]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ThayDoiThoiGianDung]
@tgMin int,
@tgMax int
as
	update RANGBUOC set TGDungMin = @tgMin, TGDungMax = @tgMax

GO
/****** Object:  StoredProcedure [dbo].[ThayDoiThoiGianHuyDatVe]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[ThayDoiThoiGianHuyDatVe]
@tgHuy int
as
	update RANGBUOC set TGHuyVe = @tgHuy

GO
/****** Object:  StoredProcedure [dbo].[ThemCMNDKhachHang]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ThemCMNDKhachHang]
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
/****** Object:  StoredProcedure [dbo].[ThemVe_DatCho]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ThemVe_DatCho]
@MaCB char(10),@MaKH int,@GheHang varchar(10),@NgayDat datetime,@giaVe int
AS
	begin
		if not exists(select* from CHUYENBAY where MaCB = @MaCB)
		begin 
			return
		end
		if(@GheHang = 1)
		begin 
			if exists(select cb.MaCB,cb.SLGhe1,count(*) as SL from CHUYENBAY as cb join VECHUYENBAY as ve on ve.MaCB = cb.MaCB where cb.MaCB = @MaCB group by cb.MaCB,cb.SLGhe1 having count(*) < cb.SLGhe1)
			begin 
				insert into VECHUYENBAY(MaCB,MaKH,GheHang,NgayDat,GiaVe,Loai)
				values (@MaCB,@MaKH,@GheHang,@NgayDat,@giaVe,0)
				update CHUYENBAY set SLGhe1 = SLGhe1+1 where MaCB = @MaCB
			end
		end
		if(@GheHang = 2)
		begin
			if exists(select cb.MaCB,cb.SLGhe2,count(*) as SL from CHUYENBAY as cb join VECHUYENBAY as ve on ve.MaCB = cb.MaCB where cb.MaCB = @MaCB group by cb.MaCB,cb.SLGhe2 having count(*) < cb.SLGhe2)
			begin 
				insert into VECHUYENBAY(MaCB,MaKH,GheHang,NgayDat,GiaVe,Loai)
				values (@MaCB,@MaKH,@GheHang,@NgayDat,@giaVe,0)
				update CHUYENBAY set SLGhe1 = SLGhe2+1 where MaCB = @MaCB
			end
		end
		
	end

GO
/****** Object:  StoredProcedure [dbo].[ThongKeNam]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--drop proc ThongKeNam
create proc [dbo].[ThongKeNam]
@nam int
as
	select MONTH(ve.NgayDat) as Thang, count(cb.MaCB) as SoChuyenBay, sum(ve.GiaVe) as DoanhThu
	from CHUYENBAY cb, VECHUYENBAY ve
	where cb.MaCB=ve.MaCB and YEAR(ve.NgayDat) = @nam
	group by MONTH(ve.NgayDat)

GO
/****** Object:  StoredProcedure [dbo].[ThongKeThang]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--drop proc ThongKeThang
create proc [dbo].[ThongKeThang]
@thang int,
@nam int
as
	select cb.MaCB, count(ve.MaVe) as SoVe, round(dbo.TinhTyLe(cb.MaCB), 2) as TyLe ,SUM(ve.GiaVe) as DoanhThu
	from CHUYENBAY cb, VECHUYENBAY ve, (select SLHangVe1, SLHangVe2, (SLHangVe1+SLHangVe2) as TongVe from RANGBUOC) as rb
	where cb.MaCB=ve.MaCB and MONTH(ve.NgayDat) = @thang and YEAR(ve.NgayDat) = @nam
	group by cb.MaCB

GO
/****** Object:  StoredProcedure [dbo].[ThongTinDatCho]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ThongTinDatCho]
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
/****** Object:  StoredProcedure [dbo].[TimKiemChuyenBay]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[TimKiemChuyenBay]
@MaCB char(10)
AS
	begin 
		select* from CHUYENBAY where MaCB=@MaCB
	end

GO
/****** Object:  StoredProcedure [dbo].[TimKiemKhachHang]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[TimKiemKhachHang]
@CMND varchar(20)
AS
	begin 
		select* from KHACHHANG where CMND=@CMND
	end

GO
/****** Object:  StoredProcedure [dbo].[TimKiemMaDatCho]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[TimKiemMaDatCho]
@maKH int, @maCB varchar(10)
AS
	begin 
		select MaVe from VECHUYENBAY where MaCB=@maCB and MaKH = @maKH
	end

GO
/****** Object:  StoredProcedure [dbo].[uc_checkMaCB]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[uc_checkMaCB] @MaCB VARCHAR(10)
AS
BEGIN
	SELECT COUNT(*)
	FROM dbo.CHUYENBAY
	WHERE MaCB = @MaCB

END 

GO
/****** Object:  StoredProcedure [dbo].[uc_ChuyenBayInsert]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[uc_ChuyenBayInsert] @MaCB VARCHAR(10), @SBDi VARCHAR(10), @SBDen VARCHAR(10), @NgayGio DATETIME,  @TGbay INT,
@SLGhe1 INT, @SLGhe2 INT
AS
BEGIN
 INSERT dbo.CHUYENBAY
         ( MaCB ,
           SBDi ,
           SBDen ,
           NgayGio ,
           TGBay ,
           SLGhe1 ,
           SLGhe2 ,
           SoGheTrong ,
           SoGheDat ,
           SoVe ,
           TyLe ,
           DoanhThu
         )
 VALUES  ( @MaCB , -- MaCB - char(10)
           @SBDi , -- SBDi - char(10)
           @SBDen , -- SBDen - char(10)
           @NgayGio , -- NgayGio - datetime
           0 , -- TGBay - int
           @SLGhe1 , -- SLGhe1 - int
           @SLGhe2 , -- SLGhe2 - int
           0 , -- SoGheTrong - int
           0 , -- SoGheDat - int
           0 , -- SoVe - int
           0.0 , -- TyLe - float
           0.0  -- DoanhThu - float
         )
END


GO
/****** Object:  StoredProcedure [dbo].[uc_countVebyMaCB]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[uc_countVebyMaCB] @MaCB varchar(10)
AS
BEGIN
SELECT COUNT(*)
FROM dbo.VECHUYENBAY
WHERE MaCB = @MaCB

END 


GO
/****** Object:  StoredProcedure [dbo].[uc_deleteChuyenBay]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[uc_deleteChuyenBay] @MACB VARCHAR(10)
AS
BEGIN
	DELETE FROM dbo.CHUYENBAY
	WHERE MaCB = @MACB
END 

GO
/****** Object:  StoredProcedure [dbo].[uc_getChuyenBayByMaCB]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[uc_getChuyenBayByMaCB]  @MaCB VARCHAR(10)
AS
BEGIN
	SELECT *
	FROM dbo.CHUYENBAY
	WHERE MaCB = @MaCB

END 

GO
/****** Object:  StoredProcedure [dbo].[uc_getCTCBbyMaSB]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[uc_getCTCBbyMaSB] @MaSB VARCHAR(10)
AS
BEGIN
	SELECT *
	FROM dbo.CHITIETCHUYENBAY
	WHERE MaCB = @MaSB

END


GO
/****** Object:  StoredProcedure [dbo].[uc_getSanBayAll]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[uc_getSanBayAll] 
AS
BEGIN
SELECT * FROM dbo.SANBAY
END


GO
/****** Object:  StoredProcedure [dbo].[uc_getTK_by_Username]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uc_getTK_by_Username] @username VARCHAR(30)
AS
begin
SELECT * FROM dbo.TAIKHOAN WHERE username = @username
END


GO
/****** Object:  StoredProcedure [dbo].[uc_InsertCTTB]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[uc_InsertCTTB] @stt INT, @MaCB VARCHAR(10), @SBTG VARCHAR(10), @TGDung INT, @ghichu TEXT
AS
BEGIN
 INSERT dbo.CHITIETCHUYENBAY
         ( STT, MaCB, MaSBTG, TGDung, GhiChu )
 VALUES  ( @stt, -- STT - int
           @MaCB, -- MaCB - char(10)
           @SBTG, -- MaSBTG - char(10)
           @TGDung, -- TGDung - int
           @ghichu  -- GhiChu - text
           )
END 


GO
/****** Object:  UserDefinedFunction [dbo].[TinhTyLe]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[TinhTyLe] (@maCB nchar(10)) 
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


GO
/****** Object:  Table [dbo].[BANGGIA]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BANGGIA](
	[SBDi] [char](10) NOT NULL,
	[SBDen] [char](10) NOT NULL,
	[GheHang] [int] NOT NULL,
	[Gia] [float] NULL,
 CONSTRAINT [PK_BANGGIA] PRIMARY KEY CLUSTERED 
(
	[GheHang] ASC,
	[SBDen] ASC,
	[SBDi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CHITIETCHUYENBAY]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHITIETCHUYENBAY](
	[STT] [int] NOT NULL,
	[MaCB] [char](10) NOT NULL,
	[MaSBTG] [char](10) NULL,
	[TGDung] [int] NULL,
	[GhiChu] [text] NULL,
 CONSTRAINT [PK_CHITIETCHUYENBAY] PRIMARY KEY CLUSTERED 
(
	[STT] ASC,
	[MaCB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CHUYENBAY]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHUYENBAY](
	[MaCB] [char](10) NOT NULL,
	[SBDi] [char](10) NULL,
	[SBDen] [char](10) NULL,
	[NgayGio] [datetime] NULL,
	[TGBay] [int] NULL,
	[SLGhe1] [int] NULL,
	[SLGhe2] [int] NULL,
	[SoGheTrong] [int] NULL,
	[SoGheDat] [int] NULL,
	[SoVe] [int] NULL,
	[TyLe] [float] NULL,
	[DoanhThu] [float] NULL,
 CONSTRAINT [PK_CHUYENBAY] PRIMARY KEY CLUSTERED 
(
	[MaCB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HANGVE]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HANGVE](
	[MaHangVe] [int] NOT NULL,
	[TenHangVe] [nvarchar](30) NULL,
 CONSTRAINT [PK_HANGVE] PRIMARY KEY CLUSTERED 
(
	[MaHangVe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[CMND] [char](20) NULL,
	[DienThoai] [char](20) NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RANGBUOC]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RANGBUOC](
	[PK] [int] NOT NULL,
	[SLSanBay] [int] NULL,
	[ThoiGianBayMin] [int] NULL,
	[SBTGMax] [int] NULL,
	[TGDungMin] [int] NULL,
	[TGDungMax] [int] NULL,
	[TGDatVe] [int] NULL,
	[TGHuyVe] [int] NULL,
	[SLHangVe1] [int] NULL,
	[SLHangVe2] [int] NULL,
 CONSTRAINT [PK_RANGBUOC] PRIMARY KEY CLUSTERED 
(
	[PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SANBAY]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SANBAY](
	[MaSB] [char](10) NOT NULL,
	[TenSB] [nvarchar](50) NULL,
 CONSTRAINT [PK_SANBAY] PRIMARY KEY CLUSTERED 
(
	[MaSB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[username] [varchar](30) NOT NULL,
	[password] [varchar](120) NULL,
	[loaiUSER] [int] NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VECHUYENBAY]    Script Date: 1/6/2019 10:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VECHUYENBAY](
	[MaVe] [int] IDENTITY(1,1) NOT NULL,
	[Loai] [int] NOT NULL,
	[MaCB] [char](10) NOT NULL,
	[MaKH] [int] NOT NULL,
	[GheHang] [int] NULL,
	[NgayDat] [datetime] NULL,
	[GiaVe] [int] NULL,
 CONSTRAINT [PK_VECHUYENBAY] PRIMARY KEY CLUSTERED 
(
	[MaVe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB01      ', N'SB01      ', 1, 1750000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB02      ', N'SB01      ', 1, 700000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB03      ', N'SB01      ', 1, 2050000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB04      ', N'SB01      ', 1, 700000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB05      ', N'SB01      ', 1, 1800000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB06      ', N'SB01      ', 1, 1700000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB07      ', N'SB01      ', 1, 2650000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB08      ', N'SB01      ', 1, 650000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB09      ', N'SB01      ', 1, 2950000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB10      ', N'SB01      ', 1, 2750000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB01      ', N'SB02      ', 1, 850000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB02      ', N'SB02      ', 1, 1500000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB03      ', N'SB02      ', 1, 1350000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB04      ', N'SB02      ', 1, 2850000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB05      ', N'SB02      ', 1, 1600000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB06      ', N'SB02      ', 1, 1350000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB07      ', N'SB02      ', 1, 2250000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB08      ', N'SB02      ', 1, 2950000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB09      ', N'SB02      ', 1, 1400000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB10      ', N'SB02      ', 1, 1050000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB01      ', N'SB03      ', 1, 1850000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB02      ', N'SB03      ', 1, 2600000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB03      ', N'SB03      ', 1, 1200000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB04      ', N'SB03      ', 1, 2250000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB05      ', N'SB03      ', 1, 2600000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB06      ', N'SB03      ', 1, 2650000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB07      ', N'SB03      ', 1, 2800000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB08      ', N'SB03      ', 1, 1050000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB09      ', N'SB03      ', 1, 950000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB10      ', N'SB03      ', 1, 850000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB01      ', N'SB04      ', 1, 1950000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB02      ', N'SB04      ', 1, 1200000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB03      ', N'SB04      ', 1, 2500000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB04      ', N'SB04      ', 1, 750000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB05      ', N'SB04      ', 1, 1950000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB06      ', N'SB04      ', 1, 400000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB07      ', N'SB04      ', 1, 1150000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB08      ', N'SB04      ', 1, 1000000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB09      ', N'SB04      ', 1, 1350000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB10      ', N'SB04      ', 1, 850000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB01      ', N'SB05      ', 1, 1400000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB02      ', N'SB05      ', 1, 1650000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB03      ', N'SB05      ', 1, 3000000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB04      ', N'SB05      ', 1, 850000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB05      ', N'SB05      ', 1, 1000000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB06      ', N'SB05      ', 1, 1250000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB07      ', N'SB05      ', 1, 750000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB08      ', N'SB05      ', 1, 1850000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB09      ', N'SB05      ', 1, 1000000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB10      ', N'SB05      ', 1, 2000000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB01      ', N'SB06      ', 1, 1950000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB02      ', N'SB06      ', 1, 2850000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB03      ', N'SB06      ', 1, 2300000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB04      ', N'SB06      ', 1, 550000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB05      ', N'SB06      ', 1, 2400000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB06      ', N'SB06      ', 1, 2200000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB07      ', N'SB06      ', 1, 950000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB08      ', N'SB06      ', 1, 800000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB09      ', N'SB06      ', 1, 400000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB10      ', N'SB06      ', 1, 2650000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB01      ', N'SB07      ', 1, 1000000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB02      ', N'SB07      ', 1, 2900000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB03      ', N'SB07      ', 1, 1400000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB04      ', N'SB07      ', 1, 1750000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB05      ', N'SB07      ', 1, 1150000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB06      ', N'SB07      ', 1, 1350000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB07      ', N'SB07      ', 1, 600000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB08      ', N'SB07      ', 1, 2650000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB09      ', N'SB07      ', 1, 1350000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB10      ', N'SB07      ', 1, 1250000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB01      ', N'SB08      ', 1, 900000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB02      ', N'SB08      ', 1, 1150000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB03      ', N'SB08      ', 1, 2150000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB04      ', N'SB08      ', 1, 2500000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB05      ', N'SB08      ', 1, 750000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB06      ', N'SB08      ', 1, 2000000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB07      ', N'SB08      ', 1, 700000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB08      ', N'SB08      ', 1, 2800000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB09      ', N'SB08      ', 1, 1000000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB10      ', N'SB08      ', 1, 700000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB01      ', N'SB09      ', 1, 1600000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB02      ', N'SB09      ', 1, 1250000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB03      ', N'SB09      ', 1, 1850000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB04      ', N'SB09      ', 1, 1800000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB05      ', N'SB09      ', 1, 1400000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB06      ', N'SB09      ', 1, 2600000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB07      ', N'SB09      ', 1, 2450000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB08      ', N'SB09      ', 1, 1950000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB09      ', N'SB09      ', 1, 1400000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB10      ', N'SB09      ', 1, 800000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB01      ', N'SB10      ', 1, 2800000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB02      ', N'SB10      ', 1, 2950000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB03      ', N'SB10      ', 1, 2500000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB04      ', N'SB10      ', 1, 1050000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB05      ', N'SB10      ', 1, 2600000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB06      ', N'SB10      ', 1, 2100000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB07      ', N'SB10      ', 1, 800000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB08      ', N'SB10      ', 1, 1350000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB09      ', N'SB10      ', 1, 2000000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB10      ', N'SB10      ', 1, 2650000)
GO
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB01      ', N'SB01      ', 2, 1500000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB02      ', N'SB01      ', 2, 2300000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB03      ', N'SB01      ', 2, 2550000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB04      ', N'SB01      ', 2, 3000000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB05      ', N'SB01      ', 2, 1150000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB06      ', N'SB01      ', 2, 1800000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB07      ', N'SB01      ', 2, 2200000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB08      ', N'SB01      ', 2, 1150000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB09      ', N'SB01      ', 2, 1100000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB10      ', N'SB01      ', 2, 2400000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB01      ', N'SB02      ', 2, 2950000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB02      ', N'SB02      ', 2, 2350000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB03      ', N'SB02      ', 2, 2850000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB04      ', N'SB02      ', 2, 2900000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB05      ', N'SB02      ', 2, 2850000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB06      ', N'SB02      ', 2, 2250000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB07      ', N'SB02      ', 2, 2550000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB08      ', N'SB02      ', 2, 2000000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB09      ', N'SB02      ', 2, 1350000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB10      ', N'SB02      ', 2, 2650000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB01      ', N'SB03      ', 2, 2650000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB02      ', N'SB03      ', 2, 2850000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB03      ', N'SB03      ', 2, 2850000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB04      ', N'SB03      ', 2, 2500000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB05      ', N'SB03      ', 2, 1450000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB06      ', N'SB03      ', 2, 1500000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB07      ', N'SB03      ', 2, 2550000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB08      ', N'SB03      ', 2, 1050000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB09      ', N'SB03      ', 2, 3000000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB10      ', N'SB03      ', 2, 2150000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB01      ', N'SB04      ', 2, 1350000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB02      ', N'SB04      ', 2, 1600000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB03      ', N'SB04      ', 2, 1300000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB04      ', N'SB04      ', 2, 1400000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB05      ', N'SB04      ', 2, 950000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB06      ', N'SB04      ', 2, 800000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB07      ', N'SB04      ', 2, 1550000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB08      ', N'SB04      ', 2, 2650000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB09      ', N'SB04      ', 2, 1400000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB10      ', N'SB04      ', 2, 1750000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB01      ', N'SB05      ', 2, 1700000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB02      ', N'SB05      ', 2, 2550000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB03      ', N'SB05      ', 2, 1500000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB04      ', N'SB05      ', 2, 1050000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB05      ', N'SB05      ', 2, 2750000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB06      ', N'SB05      ', 2, 1100000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB07      ', N'SB05      ', 2, 2950000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB08      ', N'SB05      ', 2, 1700000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB09      ', N'SB05      ', 2, 1250000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB10      ', N'SB05      ', 2, 700000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB01      ', N'SB06      ', 2, 450000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB02      ', N'SB06      ', 2, 2300000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB03      ', N'SB06      ', 2, 1850000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB04      ', N'SB06      ', 2, 950000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB05      ', N'SB06      ', 2, 2300000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB06      ', N'SB06      ', 2, 1350000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB07      ', N'SB06      ', 2, 1050000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB08      ', N'SB06      ', 2, 1650000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB09      ', N'SB06      ', 2, 600000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB10      ', N'SB06      ', 2, 2650000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB01      ', N'SB07      ', 2, 1400000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB02      ', N'SB07      ', 2, 750000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB03      ', N'SB07      ', 2, 1950000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB04      ', N'SB07      ', 2, 1750000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB05      ', N'SB07      ', 2, 2700000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB06      ', N'SB07      ', 2, 1850000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB07      ', N'SB07      ', 2, 2650000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB08      ', N'SB07      ', 2, 1350000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB09      ', N'SB07      ', 2, 650000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB10      ', N'SB07      ', 2, 2800000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB01      ', N'SB08      ', 2, 1800000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB02      ', N'SB08      ', 2, 1550000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB03      ', N'SB08      ', 2, 1450000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB04      ', N'SB08      ', 2, 2000000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB05      ', N'SB08      ', 2, 2450000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB06      ', N'SB08      ', 2, 800000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB07      ', N'SB08      ', 2, 600000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB08      ', N'SB08      ', 2, 2100000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB09      ', N'SB08      ', 2, 3000000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB10      ', N'SB08      ', 2, 400000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB01      ', N'SB09      ', 2, 2550000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB02      ', N'SB09      ', 2, 700000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB03      ', N'SB09      ', 2, 1600000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB04      ', N'SB09      ', 2, 2850000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB05      ', N'SB09      ', 2, 2700000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB06      ', N'SB09      ', 2, 2950000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB07      ', N'SB09      ', 2, 500000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB08      ', N'SB09      ', 2, 2250000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB09      ', N'SB09      ', 2, 750000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB10      ', N'SB09      ', 2, 2450000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB01      ', N'SB10      ', 2, 1450000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB02      ', N'SB10      ', 2, 2350000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB03      ', N'SB10      ', 2, 1550000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB04      ', N'SB10      ', 2, 1100000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB05      ', N'SB10      ', 2, 2200000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB06      ', N'SB10      ', 2, 1550000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB07      ', N'SB10      ', 2, 2000000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB08      ', N'SB10      ', 2, 850000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB09      ', N'SB10      ', 2, 2750000)
INSERT [dbo].[BANGGIA] ([SBDi], [SBDen], [GheHang], [Gia]) VALUES (N'SB10      ', N'SB10      ', 2, 1900000)
GO
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB01      ', N'SB05      ', 16, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB02      ', N'SB01      ', 14, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB04      ', N'SB09      ', 6, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB06      ', N'SB09      ', 17, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB07      ', N'SB01      ', 14, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB09      ', N'SB09      ', 12, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB10      ', N'SB07      ', 13, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB12      ', N'SB08      ', 5, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB13      ', N'SB07      ', 12, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB14      ', N'SB02      ', 9, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB15      ', N'SB09      ', 10, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB16      ', N'SB06      ', 6, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB18      ', N'SB01      ', 10, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB19      ', N'SB04      ', 15, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB20      ', N'SB02      ', 7, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB21      ', N'SB03      ', 19, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB22      ', N'SB07      ', 8, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB23      ', N'SB04      ', 8, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB24      ', N'SB09      ', 5, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB26      ', N'SB08      ', 14, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB27      ', N'SB09      ', 8, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB28      ', N'SB03      ', 19, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB29      ', N'SB08      ', 6, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB30      ', N'SB05      ', 19, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB31      ', N'SB06      ', 8, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB32      ', N'SB08      ', 17, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB33      ', N'SB09      ', 11, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB35      ', N'SB10      ', 14, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB36      ', N'SB03      ', 17, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB37      ', N'SB08      ', 18, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB38      ', N'SB08      ', 9, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB39      ', N'SB09      ', 9, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB41      ', N'SB03      ', 8, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB42      ', N'SB07      ', 5, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB43      ', N'SB10      ', 20, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB44      ', N'SB02      ', 6, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB45      ', N'SB08      ', 16, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB46      ', N'SB08      ', 11, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB47      ', N'SB09      ', 13, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB48      ', N'SB01      ', 12, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB50      ', N'SB02      ', 9, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB51      ', N'SB04      ', 10, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB52      ', N'SB07      ', 16, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB53      ', N'SB01      ', 14, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB54      ', N'SB04      ', 9, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB56      ', N'SB04      ', 18, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB57      ', N'SB02      ', 10, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB58      ', N'SB03      ', 10, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (1, N'CB60      ', N'SB01      ', 12, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (2, N'CB02      ', N'SB09      ', 9, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (2, N'CB04      ', N'SB06      ', 14, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (2, N'CB07      ', N'SB02      ', 18, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (2, N'CB10      ', N'SB08      ', 15, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (2, N'CB16      ', N'SB10      ', 8, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (2, N'CB24      ', N'SB10      ', 10, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (2, N'CB33      ', N'SB04      ', 10, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (2, N'CB39      ', N'SB09      ', 12, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (2, N'CB48      ', N'SB03      ', 17, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (2, N'CB54      ', N'SB09      ', 19, NULL)
INSERT [dbo].[CHITIETCHUYENBAY] ([STT], [MaCB], [MaSBTG], [TGDung], [GhiChu]) VALUES (2, N'CB58      ', N'SB07      ', 20, NULL)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'01        ', N'SB04      ', N'SB04      ', CAST(0x0000A9CD0160CD00 AS DateTime), 0, 12, 12, 0, 0, 0, 0, 0)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB01      ', N'SB09      ', N'SB01      ', CAST(0x0000A9CC017B0740 AS DateTime), 70, 35, 25, 26, 32, 2, 0.033333333333333333, 1200000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB02      ', N'SB06      ', N'SB10      ', CAST(0x0000A9CD002ECD40 AS DateTime), 35, 20, 20, 6, 20, 14, 0.35, 21000000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB03      ', N'SB03      ', N'SB02      ', CAST(0x0000A9CD00D4EA40 AS DateTime), 60, 40, 35, 22, 13, 40, 0.53333333333333333, 80000000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB04      ', N'SB05      ', N'SB01      ', CAST(0x0000A9CD017EFBC0 AS DateTime), 110, 40, 25, 17, 43, 5, 0.076923076923076927, 7750000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB05      ', N'SB02      ', N'SB05      ', CAST(0x0000A9CE00A968C0 AS DateTime), 45, 30, 30, 22, 27, 11, 0.18333333333333332, 13200000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB06      ', N'SB07      ', N'SB08      ', CAST(0x0000A9CE014B9140 AS DateTime), 60, 40, 25, 17, 8, 40, 0.61538461538461542, 74000000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB07      ', N'SB08      ', N'SB02      ', CAST(0x0000A9CE0182F040 AS DateTime), 80, 25, 40, 21, 20, 24, 0.36923076923076931, 15600000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB08      ', N'SB05      ', N'SB10      ', CAST(0x0000A9CF0089C4C0 AS DateTime), 150, 30, 20, 14, 28, 8, 0.16, 14800000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB09      ', N'SB05      ', N'SB10      ', CAST(0x0000A9CF010854C0 AS DateTime), 145, 40, 40, 22, 43, 15, 0.1875, 15750000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB10      ', N'SB03      ', N'SB10      ', CAST(0x0000A9D00036B640 AS DateTime), 40, 30, 25, 11, 7, 37, 0.67272727272727273, 40700000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB11      ', N'SB10      ', N'SB05      ', CAST(0x0000A9D00089C4C0 AS DateTime), 115, 30, 30, 23, 19, 18, 0.3, 28800000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB12      ', N'SB06      ', N'SB03      ', CAST(0x0000A9D001200FC0 AS DateTime), 55, 25, 20, 11, 25, 9, 0.2, 11700000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB13      ', N'SB05      ', N'SB08      ', CAST(0x0000A9D001537A40 AS DateTime), 85, 20, 30, 0, 37, 13, 0.26, 5850000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB14      ', N'SB03      ', N'SB09      ', CAST(0x0000A9D1002AD8C0 AS DateTime), 100, 20, 40, 10, 29, 21, 0.35, 22050000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB15      ', N'SB05      ', N'SB09      ', CAST(0x0000A9D1002ECD40 AS DateTime), 35, 30, 35, 25, 19, 21, 0.32307692307692309, 19950000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB16      ', N'SB05      ', N'SB04      ', CAST(0x0000A9D100D4EA40 AS DateTime), 50, 20, 30, 1, 23, 26, 0.52, 36400000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB17      ', N'SB01      ', N'SB07      ', CAST(0x0000A9D1017B0740 AS DateTime), 40, 30, 30, 9, 24, 27, 0.45, 39150000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB18      ', N'SB09      ', N'SB02      ', CAST(0x0000A9D20095A240 AS DateTime), 150, 40, 30, 17, 20, 33, 0.47142857142857142, 46200000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB19      ', N'SB07      ', N'SB02      ', CAST(0x0000A9D200DCD340 AS DateTime), 105, 40, 40, 24, 3, 53, 0.6625, 58300000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB20      ', N'SB08      ', N'SB03      ', CAST(0x0000A9D201240440 AS DateTime), 90, 35, 20, 8, 23, 24, 0.43636363636363634, 13200000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB21      ', N'SB06      ', N'SB02      ', CAST(0x0000A9D3002ECD40 AS DateTime), 110, 30, 40, 14, 20, 36, 0.51428571428571423, 12600000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB22      ', N'SB03      ', N'SB07      ', CAST(0x0000A9D30089C4C0 AS DateTime), 135, 20, 30, 6, 6, 38, 0.76, 60800000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB23      ', N'SB01      ', N'SB08      ', CAST(0x0000A9D301200FC0 AS DateTime), 65, 20, 30, 9, 10, 31, 0.62, 18600000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB24      ', N'SB02      ', N'SB10      ', CAST(0x0000A9D3017EFBC0 AS DateTime), 100, 20, 35, 10, 13, 32, 0.58181818181818179, 32000000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB25      ', N'SB09      ', N'SB02      ', CAST(0x0000A9D40079F2C0 AS DateTime), 140, 20, 40, 5, 47, 8, 0.13333333333333333, 2800000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB26      ', N'SB07      ', N'SB04      ', CAST(0x0000A9D4013BBF40 AS DateTime), 60, 30, 20, 2, 16, 32, 0.64, 24000000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB27      ', N'SB05      ', N'SB02      ', CAST(0x0000A9D500131DC0 AS DateTime), 45, 25, 25, 17, 13, 20, 0.4, 35000000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB28      ', N'SB02      ', N'SB10      ', CAST(0x0000A9D500A17FC0 AS DateTime), 60, 40, 30, 15, 12, 43, 0.61428571428571432, 62350000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB29      ', N'SB08      ', N'SB04      ', CAST(0x0000A9D5010C4940 AS DateTime), 85, 25, 25, 20, 24, 6, 0.12, 10800000)
INSERT [dbo].[CHUYENBAY] ([MaCB], [SBDi], [SBDen], [NgayGio], [TGBay], [SLGhe1], [SLGhe2], [SoGheTrong], [SoGheDat], [SoVe], [TyLe], [DoanhThu]) VALUES (N'CB30      ', N'SB08      ', N'SB01      ', CAST(0x0000A9D501537A40 AS DateTime), 60, 35, 40, 7, 59, 9, 0.12, 16650000)
INSERT [dbo].[HANGVE] ([MaHangVe], [TenHangVe]) VALUES (1, N'Thương gia')
INSERT [dbo].[HANGVE] ([MaHangVe], [TenHangVe]) VALUES (2, N'Vé thường')
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (1, N'An Quang Trường', N'343643251253        ', N'(830) 211-8117      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (2, N'Nguyễn Việt Khoa', N'351683245794        ', N'(828) 444-8753      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (3, N'Nguyễn Vạn Thông', N'797612775999        ', N'(449) 957-7441      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (4, N'Kiều Hữu Thiện', N'166724326624        ', N'(943) 293-8762      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (5, N'Đỗ Bình An', N'682130392916        ', N'(341) 920-4132      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (6, N'Đoàn Nam Thanh', N'658694586673        ', N'(577) 912-8936      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (7, N'Ngô Lương Tài', N'372032758340        ', N'(512) 724-5395      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (8, N'Kiều Tường Nguyên', N'182751970040        ', N'(336) 410-4043      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (9, N'Nguyễn Long Quân', N'261695731873        ', N'(413) 554-3662      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (10, N'Võ Sơn Tùng', N'384761710568        ', N'(977) 836-5241      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (11, N'Trần Minh Nhân', N'522069257718        ', N'(889) 654-0734      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (12, N'Phó Tân Thành', N'216228792372        ', N'(568) 611-4308      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (13, N'Phạm Gia Khánh', N'144270649142        ', N'(469) 619-4819      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (14, N'Vưu Trường An', N'072800363889        ', N'(791) 542-8720      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (15, N'Vũ Ðức Hòa', N'600269131309        ', N'(551) 397-4912      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (16, N'Lê Mạnh Dũng', N'765846138644        ', N'(255) 206-1587      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (17, N'Nguyễn Quang Vũ', N'725604255998        ', N'(755) 786-4839      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (18, N'Đỗ Ðông Hải', N'661716171567        ', N'(968) 344-2871      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (19, N'Nguyễn Minh Toàn', N'617966725926        ', N'(666) 620-4725      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (20, N'La Việt Quyết', N'086836739100        ', N'(860) 330-7544      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (21, N'Lê Quang Thắng', N'727742291400        ', N'(579) 829-8153      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (22, N'Dương Chí Kiên', N'561791664355        ', N'(385) 927-3675      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (23, N'Đinh Ðức Trung', N'252826552325        ', N'(564) 287-8468      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (24, N'Phan Ðình Hảo', N'134867635688        ', N'(594) 586-4823      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (25, N'Thảo Thanh Ðoàn', N'642147951504        ', N'(233) 365-4011      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (26, N'Quách Thế Vinh', N'698146322951        ', N'(400) 479-9067      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (27, N'Đàm Hòa Hợp', N'430608438826        ', N'(975) 586-7497      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (28, N'Nguyễn Thái San', N'295086110847        ', N'(511) 861-0115      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (29, N'Giang Phú Hưng', N'720625244056        ', N'(826) 623-5245      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (30, N'Nguyễn Gia Kiên', N'090797031008        ', N'(401) 651-9617      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (31, N'Thân Thế Sơn', N'106008662892        ', N'(718) 528-1450      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (32, N'Đặng Lạc Phúc', N'697528883577        ', N'(736) 959-0448      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (33, N'Đặng Anh Tuấn', N'252007973784        ', N'(282) 385-0896      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (34, N'Huỳnh Mạnh Trường', N'055505868381        ', N'(898) 583-4807      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (35, N'Chu Việt Thanh', N'432800182893        ', N'(268) 381-6501      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (36, N'Lương Thanh Thuận', N'825045407257        ', N'(872) 759-9471      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (37, N'Đỗ Bảo Châu', N'423477471099        ', N'(857) 415-1673      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (38, N'Đào Anh Khải', N'053781434952        ', N'(565) 862-9975      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (39, N'Vũ Trung Nguyên', N'137659636116        ', N'(806) 782-8682      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (40, N'Vũ Ðức Toàn', N'748954651075        ', N'(213) 892-5404      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (41, N'Nguyễn Hữu Hiệp', N'310597005709        ', N'(787) 818-2565      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (42, N'Triệu Việt Phương', N'401484717966        ', N'(868) 319-6183      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (43, N'Nguyễn Hùng Sơn', N'402396157348        ', N'(803) 370-4357      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (44, N'Mạch Nhật Khương', N'288675329855        ', N'(993) 347-1139      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (45, N'Lục Quang Đông', N'227088879072        ', N'(429) 713-8058      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (46, N'Phan Minh Chuyên', N'240673479908        ', N'(531) 922-4578      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (47, N'Lâm Trường Sơn', N'116778819193        ', N'(850) 954-5347      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (48, N'Mã Hữu Trí', N'701580453663        ', N'(886) 830-2787      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (49, N'Vũ Ðông Nguyên', N'718657484262        ', N'(666) 664-1850      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (50, N'Nguyễn Vĩnh Thụy', N'822623926983        ', N'(201) 449-4448      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (51, N'Vũ Cao Phong', N'772371751773        ', N'(686) 632-4238      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (52, N'Nguyễn Quốc Hưng', N'111953591473        ', N'(346) 880-9842      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (53, N'Thi Phúc Hòa', N'331730540690        ', N'(534) 839-3535      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (54, N'Phan Duy Thạch', N'328747418237        ', N'(303) 646-1382      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (55, N'Nguyễn Huy Việt', N'577698888933        ', N'(849) 741-0126      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (56, N'Hoàng Quốc Hiền', N'122328884995        ', N'(787) 511-7118      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (57, N'Phạm Xuân Nam', N'219817333534        ', N'(963) 411-8569      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (58, N'Vương Bảo Toàn', N'321711019096        ', N'(606) 544-1239      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (59, N'Ngư Bảo Hòa', N'265406106243        ', N'(223) 327-8168      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (60, N'Cao Ðức Phú', N'150797807050        ', N'(982) 643-6257      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (61, N'Phan Phước Thiện', N'219305552759        ', N'(342) 700-0595      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (62, N'Lý Tài Ðức', N'501565697935        ', N'(980) 719-7023      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (63, N'Bạch Tấn Thành', N'554122981483        ', N'(231) 361-4294      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (64, N'Nguyễn Khắc Ninh', N'284856707011        ', N'(633) 503-5947      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (65, N'Hoàng Ðình Sang', N'750280048175        ', N'(405) 366-6443      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (66, N'Bạch Ðình Nguyên', N'247716135312        ', N'(346) 204-9951      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (67, N'Ngô Trung Anh', N'529187133061        ', N'(596) 376-5405      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (68, N'Chử Quốc Minh', N'545079907369        ', N'(954) 627-7912      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (69, N'Đặng Hoàng Linh', N'593851385830        ', N'(569) 318-5286      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (70, N'Ngư Chí Bảo', N'458488262959        ', N'(669) 217-9827      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (71, N'Phạm Việt An', N'631663081441        ', N'(388) 619-1406      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (72, N'Hồ Phúc Khang', N'255837430187        ', N'(660) 571-3023      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (73, N'Cao Tuấn Hùng', N'656415555339        ', N'(809) 498-6219      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (74, N'Hồ Lập Thành', N'338048544053        ', N'(207) 560-1821      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (75, N'Bùi Minh Anh', N'080997373342        ', N'(360) 685-1586      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (76, N'Ngô Trường Phát', N'434648749820        ', N'(209) 776-2503      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (77, N'Ngô Huy Tuấn', N'594546739875        ', N'(267) 543-5185      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (78, N'Lý Quang Thuận', N'459831327838        ', N'(488) 672-1837      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (79, N'Đặng Nam Sơn', N'409012645570        ', N'(436) 924-4796      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (80, N'Dương Mạnh Thiện', N'443534160400        ', N'(812) 850-4980      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (81, N'Nguyễn Thuận Phương', N'805878704484        ', N'(991) 784-8443      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (82, N'Nguyễn Hoài Tín', N'299664660512        ', N'(399) 282-5495      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (83, N'Văn Thành Nguyên', N'368742736247        ', N'(552) 711-8801      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (84, N'Hồ Tất Hòa', N'195174685587        ', N'(454) 604-7509      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (85, N'Phó Xuân Cao', N'292996666891        ', N'(861) 682-8811      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (86, N'Lục Ngọc Thuận', N'198530454805        ', N'(920) 319-1459      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (87, N'Trầm Cao Tiến', N'734050465629        ', N'(358) 870-6099      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (88, N'Vũ Chí Thanh', N'124270366807        ', N'(687) 412-3750      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (89, N'Diệp Quốc Khánh', N'850605031934        ', N'(702) 235-7203      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (90, N'Nguyễn Duy Tâm', N'057309724549        ', N'(241) 801-9317      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (91, N'Bùi Chấn Hưng', N'418942734710        ', N'(510) 265-8269      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (92, N'Đàm Trung Việt', N'203278570651        ', N'(868) 517-4847      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (93, N'Bùi Thạch Tùng', N'227804138865        ', N'(787) 965-6493      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (94, N'Võ Trường Long', N'363825417053        ', N'(863) 208-0893      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (95, N'Ân Phú Hiệp', N'797396120350        ', N'(285) 901-7771      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (96, N'Bùi Minh Trí', N'574135757148        ', N'(397) 346-3376      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (97, N'Nguyễn Bảo Sơn', N'515518745765        ', N'(932) 898-7952      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (98, N'Thân Ðăng An', N'352366783381        ', N'(916) 798-2597      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (99, N'Bạch Thành Long', N'359681151014        ', N'(629) 547-7333      ')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (100, N'Tôn Hoàng Giang', N'264878505706        ', N'(905) 463-5636      ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (101, NULL, N'3436432512          ', NULL)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (102, N'Trang', N'1                   ', N'1                   ')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [CMND], [DienThoai]) VALUES (103, NULL, N'7340504656          ', NULL)
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
INSERT [dbo].[RANGBUOC] ([PK], [SLSanBay], [ThoiGianBayMin], [SBTGMax], [TGDungMin], [TGDungMax], [TGDatVe], [TGHuyVe], [SLHangVe1], [SLHangVe2]) VALUES (1, 21, 23, 2, 5, 120, 24, 24, 12, 25)
INSERT [dbo].[SANBAY] ([MaSB], [TenSB]) VALUES (N'SB01      ', N'Tân Sân Nhất')
INSERT [dbo].[SANBAY] ([MaSB], [TenSB]) VALUES (N'SB02      ', N'Dubai')
INSERT [dbo].[SANBAY] ([MaSB], [TenSB]) VALUES (N'SB03      ', N'Hongkong')
INSERT [dbo].[SANBAY] ([MaSB], [TenSB]) VALUES (N'SB04      ', N'Hà Nội')
INSERT [dbo].[SANBAY] ([MaSB], [TenSB]) VALUES (N'SB05      ', N'Singapo')
INSERT [dbo].[SANBAY] ([MaSB], [TenSB]) VALUES (N'SB06      ', N'Tokio')
INSERT [dbo].[SANBAY] ([MaSB], [TenSB]) VALUES (N'SB07      ', N'Hàn quốc')
INSERT [dbo].[SANBAY] ([MaSB], [TenSB]) VALUES (N'SB08      ', N'Lào')
INSERT [dbo].[SANBAY] ([MaSB], [TenSB]) VALUES (N'SB09      ', N'Jakata')
INSERT [dbo].[SANBAY] ([MaSB], [TenSB]) VALUES (N'SB10      ', N'Philipin')
INSERT [dbo].[TAIKHOAN] ([username], [password], [loaiUSER]) VALUES (N'admin', N'', 1)
INSERT [dbo].[TAIKHOAN] ([username], [password], [loaiUSER]) VALUES (N'nhanvien', NULL, 0)
SET IDENTITY_INSERT [dbo].[VECHUYENBAY] ON 

INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (61, 1, N'CB11      ', 12, 1, CAST(0x0000A9CC018B3250 AS DateTime), 650000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (62, 0, N'CB12      ', 13, 1, CAST(0x0000A9C40116EB84 AS DateTime), 600000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (63, 1, N'CB24      ', 34, 1, CAST(0x0000A9BB012BE188 AS DateTime), 1500000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (64, 1, N'CB26      ', 33, 1, CAST(0x0000A9C700D99DC4 AS DateTime), 1550000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (65, 0, N'CB07      ', 43, 2, CAST(0x0000A9AF00A8F714 AS DateTime), 1200000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (66, 1, N'CB05      ', 12, 2, CAST(0x0000A9B3013D47D4 AS DateTime), 1050000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (67, 0, N'CB13      ', 30, 1, CAST(0x0000A9A800966144 AS DateTime), 600000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (68, 0, N'CB19      ', 1, 2, CAST(0x0000A9B3008758D4 AS DateTime), 1000000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (69, 0, N'CB04      ', 3, 1, CAST(0x0000A9BE00FDFFD4 AS DateTime), 450000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (70, 0, N'CB25      ', 102, 1, CAST(0x0000A9CD00BE8444 AS DateTime), NULL)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (71, 0, N'CB11      ', 2, 1, CAST(0x0000A9B9014F7A08 AS DateTime), 1400000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (72, 0, N'CB10      ', 2, 2, CAST(0x0000A9B20100C4D0 AS DateTime), 1900000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (73, 1, N'CB01      ', 1, 2, CAST(0x0000A9A301168590 AS DateTime), 1850000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (74, 0, N'CB18      ', 1, 1, CAST(0x0000A99E00EC3394 AS DateTime), 1050000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (75, 1, N'CB30      ', 2, 1, CAST(0x0000A9C500176B50 AS DateTime), 1750000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (76, 1, N'CB11      ', 1, 2, CAST(0x0000A9BC00C2AC54 AS DateTime), 1700000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (77, 0, N'CB17      ', 2, 1, CAST(0x0000A9C2004D3604 AS DateTime), 1200000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (78, 0, N'CB24      ', 1, 1, CAST(0x0000A9BC0080A084 AS DateTime), 750000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (79, 1, N'CB18      ', 2, 2, CAST(0x0000A9BE00A8F714 AS DateTime), 1000000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (80, 1, N'CB27      ', 1, 1, CAST(0x0000A9C200E120D0 AS DateTime), 1450000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (81, 1, N'CB29      ', 2, 1, CAST(0x0000A9A1004810D4 AS DateTime), 1450000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (82, 0, N'CB08      ', 1, 2, CAST(0x0000A9BF003FC30C AS DateTime), 1750000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (83, 1, N'CB06      ', 2, 1, CAST(0x0000A9C10098C04C AS DateTime), 1800000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (85, 0, N'CB22      ', 2, 1, CAST(0x0000A9AC016F1E08 AS DateTime), 1100000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (86, 0, N'CB21      ', 1, 1, CAST(0x0000A9C60144CC0C AS DateTime), 1850000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (87, 0, N'CB07      ', 2, 2, CAST(0x0000A9C5016CBDD4 AS DateTime), 1150000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (90, 0, N'CB09      ', 1, 2, CAST(0x0000A9B500A82D84 AS DateTime), 750000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (92, 1, N'CB22      ', 1, 1, CAST(0x0000A9BE00940110 AS DateTime), 1250000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (96, 1, N'CB23      ', 2, 1, CAST(0x0000A9BC014BEA50 AS DateTime), 1550000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (97, 1, N'CB02      ', 2, 2, CAST(0x0000A9AB010B72CC AS DateTime), 650000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (98, 0, N'CB07      ', 1, 1, CAST(0x0000A9B50158928C AS DateTime), 1200000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (99, 0, N'CB04      ', 2, 1, CAST(0x0000A9AE00A63344 AS DateTime), 1000000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (100, 1, N'CB23      ', 1, 1, CAST(0x0000A9B3004D9ACC AS DateTime), 1150000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (102, 1, N'CB14      ', 1, 2, CAST(0x0000A9AC01025A48 AS DateTime), 900000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (103, 1, N'CB08      ', 2, 2, CAST(0x0000A99C01303AD0 AS DateTime), 1100000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (104, 1, N'CB29      ', 1, 2, CAST(0x0000A9C800939C48 AS DateTime), 650000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (105, 1, N'CB05      ', 2, 1, CAST(0x0000A9C20157C7D0 AS DateTime), 950000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (106, 0, N'CB30      ', 1, 2, CAST(0x0000A9BB011CDA44 AS DateTime), 2000000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (107, 1, N'CB20      ', 2, 2, CAST(0x0000A9BB014E4A84 AS DateTime), 800000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (108, 1, N'CB28      ', 1, 1, CAST(0x0000A9AF00551F04 AS DateTime), 950000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (109, 1, N'CB13      ', 2, 2, CAST(0x0000A9A200CDC044 AS DateTime), 1900000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (111, 1, N'CB09      ', 2, 1, CAST(0x0000A9AD00E96FC4 AS DateTime), 1650000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (112, 0, N'CB14      ', 2, 1, CAST(0x0000A9A50186D908 AS DateTime), 1100000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (113, 0, N'CB02      ', 1, 1, CAST(0x0000A9B90150A98C AS DateTime), 2000000)
INSERT [dbo].[VECHUYENBAY] ([MaVe], [Loai], [MaCB], [MaKH], [GheHang], [NgayDat], [GiaVe]) VALUES (114, 0, N'CB04      ', 1, 2, CAST(0x0000A9BA00A23EC4 AS DateTime), 1100000)
SET IDENTITY_INSERT [dbo].[VECHUYENBAY] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_TenHangVe]    Script Date: 1/6/2019 10:00:11 PM ******/
ALTER TABLE [dbo].[HANGVE] ADD  CONSTRAINT [UQ_TenHangVe] UNIQUE NONCLUSTERED 
(
	[TenHangVe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_CMND]    Script Date: 1/6/2019 10:00:11 PM ******/
ALTER TABLE [dbo].[KHACHHANG] ADD  CONSTRAINT [UQ_CMND] UNIQUE NONCLUSTERED 
(
	[CMND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_MaCB_MaKH]    Script Date: 1/6/2019 10:00:11 PM ******/
ALTER TABLE [dbo].[VECHUYENBAY] ADD  CONSTRAINT [UQ_MaCB_MaKH] UNIQUE NONCLUSTERED 
(
	[MaCB] ASC,
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BANGGIA]  WITH CHECK ADD  CONSTRAINT [FK_BANGGIA_FK_BANGGI_SANBAYDEN] FOREIGN KEY([SBDen])
REFERENCES [dbo].[SANBAY] ([MaSB])
GO
ALTER TABLE [dbo].[BANGGIA] CHECK CONSTRAINT [FK_BANGGIA_FK_BANGGI_SANBAYDEN]
GO
ALTER TABLE [dbo].[BANGGIA]  WITH CHECK ADD  CONSTRAINT [FK_BANGGIA_FK_BANGGI_SANBAYDI] FOREIGN KEY([SBDi])
REFERENCES [dbo].[SANBAY] ([MaSB])
GO
ALTER TABLE [dbo].[BANGGIA] CHECK CONSTRAINT [FK_BANGGIA_FK_BANGGI_SANBAYDI]
GO
ALTER TABLE [dbo].[CHUYENBAY]  WITH CHECK ADD  CONSTRAINT [FK_CHUYENBA_FK_CHUYEN_SANBAY] FOREIGN KEY([SBDi])
REFERENCES [dbo].[SANBAY] ([MaSB])
GO
ALTER TABLE [dbo].[CHUYENBAY] CHECK CONSTRAINT [FK_CHUYENBA_FK_CHUYEN_SANBAY]
GO
ALTER TABLE [dbo].[CHUYENBAY]  WITH CHECK ADD  CONSTRAINT [FK_CHUYENBA_REFERENCE_SANBAY] FOREIGN KEY([SBDen])
REFERENCES [dbo].[SANBAY] ([MaSB])
GO
ALTER TABLE [dbo].[CHUYENBAY] CHECK CONSTRAINT [FK_CHUYENBA_REFERENCE_SANBAY]
GO
ALTER TABLE [dbo].[VECHUYENBAY]  WITH CHECK ADD  CONSTRAINT [FK_VECHUYEN_REFERENCE_CHUYENBA] FOREIGN KEY([MaCB])
REFERENCES [dbo].[CHUYENBAY] ([MaCB])
GO
ALTER TABLE [dbo].[VECHUYENBAY] CHECK CONSTRAINT [FK_VECHUYEN_REFERENCE_CHUYENBA]
GO
ALTER TABLE [dbo].[VECHUYENBAY]  WITH CHECK ADD  CONSTRAINT [FK_VECHUYEN_REFERENCE_HANGVE] FOREIGN KEY([GheHang])
REFERENCES [dbo].[HANGVE] ([MaHangVe])
GO
ALTER TABLE [dbo].[VECHUYENBAY] CHECK CONSTRAINT [FK_VECHUYEN_REFERENCE_HANGVE]
GO
ALTER TABLE [dbo].[VECHUYENBAY]  WITH CHECK ADD  CONSTRAINT [FK_VECHUYEN_REFERENCE_KHACHHAN] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[VECHUYENBAY] CHECK CONSTRAINT [FK_VECHUYEN_REFERENCE_KHACHHAN]
GO
USE [master]
GO
ALTER DATABASE [DoAnUDQL] SET  READ_WRITE 
GO
