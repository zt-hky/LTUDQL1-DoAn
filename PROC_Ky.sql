
if OBJECT_ID('uc_getTK_by_Username','p') is not null
DROP proc uc_getTK_by_Username
go
CREATE PROC uc_getTK_by_Username @username VARCHAR(30)
AS
begin
SELECT * FROM dbo.TAIKHOAN WHERE username = @username
END

go

-----------------
if OBJECT_ID('uc_getSanBayAll','p') is not null
DROP proc uc_getSanBayAll
go

CREATE PROC uc_getSanBayAll 
AS
BEGIN
SELECT * FROM dbo.SANBAY
END

GO

-----------------
if OBJECT_ID('uc_getCTCBbyMaSB','p') is not null
DROP proc uc_getCTCBbyMaSB
GO

CREATE PROC uc_getCTCBbyMaSB @MaSB VARCHAR(10)
AS
BEGIN
	SELECT *
	FROM dbo.CHITIETCHUYENBAY
	WHERE MaCB = @MaSB

END

GO
-----------------
if OBJECT_ID('uc_countVebyMaCB','p') is not null
DROP proc uc_countVebyMaCB
GO

CREATE PROC uc_countVebyMaCB @MaCB varchar(10)
AS
BEGIN
SELECT COUNT(*)
FROM dbo.VECHUYENBAY
WHERE MaCB = @MaCB

END 

GO

-----------------
if OBJECT_ID('uc_deleteChuyenBay','p') is not null
DROP proc uc_deleteChuyenBay
GO


CREATE PROC uc_deleteChuyenBay @MACB VARCHAR(10)
AS
BEGIN
	DELETE FROM dbo.CHUYENBAY
	WHERE MaCB = @MACB
END 
go

-----------------
if OBJECT_ID('uc_checkMaCB','p') is not null
DROP proc uc_checkMaCB
GO



CREATE PROC uc_checkMaCB @MaCB VARCHAR(10)
AS
BEGIN
	SELECT COUNT(*)
	FROM dbo.CHUYENBAY
	WHERE MaCB = @MaCB

END 
GO

-----------------
if OBJECT_ID('uc_getChuyenBayByMaCB','p') is not null
DROP proc uc_getChuyenBayByMaCB
GO


CREATE PROC uc_getChuyenBayByMaCB  @MaCB VARCHAR(10)
AS
BEGIN
	SELECT *
	FROM dbo.CHUYENBAY
	WHERE MaCB = @MaCB

END 
GO

-----------------
if OBJECT_ID('uc_ChuyenBayInsert','p') is not null
DROP proc uc_ChuyenBayInsert
GO


CREATE PROCEDURE uc_ChuyenBayInsert @MaCB VARCHAR(10), @SBDi VARCHAR(10), @SBDen VARCHAR(10), @NgayGio DATETIME,  @TGbay INT,
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

go


-----------------
if OBJECT_ID('uc_InsertCTTB','p') is not null
DROP proc uc_InsertCTTB
GO


CREATE PROC uc_InsertCTTB @stt INT, @MaCB VARCHAR(10), @SBTG VARCHAR(10), @TGDung INT, @ghichu TEXT
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

go