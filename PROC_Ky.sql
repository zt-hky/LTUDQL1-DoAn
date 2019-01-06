create PROC uc_getTK_by_Username @username VARCHAR(30)
AS
begin
SELECT * FROM dbo.TAIKHOAN WHERE username = @username
END

go

CREATE PROC uc_getSanBayAll 
AS
BEGIN
SELECT * FROM dbo.SANBAY
END

GO


CREATE PROC uc_getCTCBbyMaSB @MaSB VARCHAR(10)
AS
BEGIN
	SELECT *
	FROM dbo.CHITIETCHUYENBAY
	WHERE MaCB = @MaSB

end