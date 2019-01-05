CREATE PROC uc_getTK_by_Username @username VARCHAR(30)
AS
begin
SELECT * FROM dbo.TAIKHOAN WHERE username = @username
END

EXEC dbo.uc_getTK_by_Username @username
EXEC dbo.uc_getTK_by_Username admin
