USE DoAnUDQL




--****** TABLE: TAIKHOAN
--Clear:
DELETE FROM dbo.TAIKHOAN

-- Insert:
INSERT dbo.TAIKHOAN
        ( username, password, loaiUSER )
VALUES  ( 'admin', -- username - varchar(30)
          '', -- password - char(120)
          1  -- loaiUSER - int
          ),
		  ( 'nhanvien', -- username - varchar(30)
          '', -- password - char(120)
          0  -- loaiUSER - int
          )