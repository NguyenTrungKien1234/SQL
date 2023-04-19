--câu 1--
go
CREATE PROCEDURE lab8_cau1
    @manv NVARCHAR(10),
	@tennv NVARCHAR(50),
    @gioitinh NVARCHAR(3),
    @diachi NVARCHAR(50),
    @email NVARCHAR(50),
    @phong NVARCHAR(50),
    @flag INT
AS
BEGIN
   
    IF (@gioitinh <> N'Nam' AND @gioitinh <> N'Nữ')
    BEGIN
        SELECT 1 AS 'MaLoi', 'Giới tính không hợp lệ' AS 'MoTaLoi'
        RETURN
    END
    
  
    IF (@flag = 0)
    BEGIN
        INSERT INTO nhanvien (manv,tennv, gioitinh, diachi, email, phong)
        VALUES (@manv,@tennv, @gioitinh, @diachi, @email, @phong)
        SELECT 0 AS 'MaLoi', 'Thêm mới nhân viên thành công' AS 'MoTaLoi'
    END
    -- Ngược lại, flag = 1 thì cập nhật thông tin nhân viên
    ELSE
    BEGIN
        UPDATE nhanvien
        SET tennv=@tennv,
			gioitinh = @gioitinh,
            diachi = @diachi,
            email = @email,
            phong = @phong
        WHERE manv = @manv
        SELECT 0 AS 'MaLoi', 'Cập nhật thông tin nhân viên thành công' AS 'MoTaLoi'
    END
END
go
go
EXEC lab8_cau1 @manv = 'NV001',@tennv=N'Nguyên', @gioitinh = N'Nam', @diachi = N'Hà Nội', @email = N'example@gmail.com', 
    @phong = N'Vật tư', @flag = 0

go

--câu 2--
go
CREATE PROCEDURE lab8_cau2
    @masp INT,
    @tenhang NVARCHAR(50),
    @tensp NVARCHAR(50),
    @soluong INT,
    @mausac NVARCHAR(20),
    @giaban FLOAT,
    @donvitinh NVARCHAR(10),
    @mota NVARCHAR(MAX),
    @flag INT
AS
BEGIN
    DECLARE @mahangsx INT

    -- Kiểm tra xem tenhang có tồn tại trong bảng hangsx hay không
    SELECT @mahangsx = mahangsx FROM hangsx WHERE tenhang = @tenhang
    IF @mahangsx IS NULL
    BEGIN
        -- Trả về mã lỗi 1 nếu tenhang không tồn tại trong bảng hangsx
        SELECT 1 AS [ErrorCode], 'Ten hang khong ton tai' AS [Message]
        RETURN
    END

    -- Kiểm tra số lượng sản phẩm
    IF @soluong < 0
    BEGIN
        -- Trả về mã lỗi 2 nếu soluong < 0
        SELECT 2 AS [ErrorCode], 'So luong khong hop le' AS [Message]
        RETURN
    END

    IF @flag = 0 -- Thêm mới sản phẩm
    BEGIN
        INSERT INTO sanpham(masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota)
        VALUES(@masp, @mahangsx, @tensp, @soluong, @mausac, @giaban, @donvitinh, @mota)

        SELECT 0 AS [ErrorCode], 'Them san pham thanh cong' AS [Message]
    END
    ELSE -- Cập nhật thông tin sản phẩm
    BEGIN
        UPDATE sanpham
        SET mahangsx = @mahangsx,
            tensp = @tensp,
            soluong = @soluong,
            mausac = @mausac,
            giaban = @giaban,
            donvitinh = @donvitinh,
            mota = @mota
        WHERE masp = @masp

        SELECT 0 AS [ErrorCode], 'Cap nhat san pham thanh cong' AS [Message]
    END
END
go
--câu 3--
go
CREATE PROCEDURE lab8_cau3
    @manv NVARCHAR(10)
AS
BEGIN

    IF NOT EXISTS (SELECT * FROM nhanvien WHERE manv = @manv)
    BEGIN
SELECT 1 AS 'ErrorCode'
        RETURN
    END
    
    DELETE FROM Nhap WHERE manv = @manv
    DELETE FROM Xuat WHERE manv = @manv
    
    DELETE FROM nhanvien WHERE manv = @manv
    
    SELECT 0 AS 'ErrorCode'
END

go

--câu 4--
go
CREATE PROCEDURE lab8_cau4(@masp VARCHAR(10))
AS
BEGIN

    IF NOT EXISTS (SELECT * FROM sanpham WHERE masp = @masp)
    BEGIN
        SELECT 1 AS 'ErrorCode'
        RETURN
    END
    
    DELETE FROM Nhap WHERE masp = @masp
    
    DELETE FROM Xuat WHERE masp = @masp
    
    DELETE FROM sanpham WHERE masp = @masp
    
    SELECT 0 AS 'ErrorCode'
END
go

--Câu 5--
go
CREATE PROCEDURE lab8_cau5
    @mahangsx varchar(10),
    @tenhang nvarchar(50),
    @diachi nvarchar(100),
    @sodt varchar(20),
    @email varchar(50)
AS
BEGIN
    IF EXISTS (SELECT * FROM Hangsx WHERE tenhang = @tenhang)
    BEGIN
        SELECT 1 AS [ErrorCode]
        RETURN
    END
    INSERT INTO Hangsx (mahangsx, tenhang, diachi, sodt, email)
    VALUES (@mahangsx, @tenhang, @diachi, @sodt, @email)
    SELECT 0 AS [ErrorCode]
    RETURN
END

go

--câu 6--
go
CREATE PROCEDURE lab8_cau6
    @sohdn nvarchar(50),
    @masp nvarchar(50),
    @manv nvarchar(50),
    @ngaynhap date,
    @soluongN int,
    @dongiaN float
AS
BEGIN
    -- Kiểm tra xem masp có tồn tại trong bảng Sanpham hay không
    IF NOT EXISTS (SELECT * FROM Sanpham WHERE masp = @masp)
    BEGIN
        -- Nếu không, trả về mã lỗi 1
        SELECT 1 AS ErrorCode, 'Mã sản phẩm không tồn tại' AS ErrorMessage
        RETURN
    END
    
    -- Kiểm tra xem manv có tồn tại trong bảng Nhanvien hay không
    IF NOT EXISTS (SELECT * FROM Nhanvien WHERE manv = @manv)
    BEGIN
        -- Nếu không, trả về mã lỗi 2
        SELECT 2 AS ErrorCode, 'Mã nhân viên không tồn tại' AS ErrorMessage
        RETURN
    END
    
    -- Kiểm tra xem sohdn đã tồn tại trong bảng Nhap hay chưa
    IF EXISTS (SELECT * FROM Nhap WHERE sohdn = @sohdn)
    BEGIN
        -- Nếu đã tồn tại, cập nhật bảng Nhap theo sohdn
        UPDATE Nhap
        SET masp = @masp,
            manv = @manv,
            ngaynhap = @ngaynhap,
            soluongN = @soluongN,
            dongiaN = @dongiaN
        WHERE sohdn = @sohdn
        
        -- Trả về mã lỗi 0
        SELECT 0 AS ErrorCode, 'Cập nhật dữ liệu thành công' AS ErrorMessage
        RETURN
    END
    ELSE
    BEGIN
        -- Nếu chưa tồn tại, thêm mới bảng Nhap
        INSERT INTO Nhap (sohdn, masp, manv, ngaynhap, soluongN, dongiaN)
        VALUES (@sohdn, @masp, @manv, @ngaynhap, @soluongN, @dongiaN)
        
        -- Trả về mã lỗi 0
        SELECT 0 AS ErrorCode, 'Thêm mới dữ liệu thành công' AS ErrorMessage
        RETURN
    END
END
go

--câu 7--
go
CREATE PROCEDURE lab8_cau7
    @sohdx INT,
    @masp INT,
    @manv INT,
    @ngayxuat DATE,
    @soluongX INT
AS
BEGIN
--Kiểm tra sự tồn tại của masp trong bảng Sanpham
    IF NOT EXISTS(SELECT * FROM Sanpham WHERE masp = @masp)
    BEGIN
        RETURN 1 --Mã lỗi 1: masp không tồn tại trong bảng Sanpham
    END
    
    --Kiểm tra sự tồn tại của manv trong bảng Nhanvien
    IF NOT EXISTS(SELECT * FROM Nhanvien WHERE manv = @manv)
    BEGIN
        RETURN 2 --Mã lỗi 2: manv không tồn tại trong bảng Nhanvien
    END
    
    --Kiểm tra số lượng tồn kho của sản phẩm
    IF @soluongX > (SELECT soluong FROM Sanpham WHERE masp = @masp)
    BEGIN
        RETURN 3 --Mã lỗi 3: số lượng xuất vượt quá số lượng tồn kho của sản phẩm
    END
    
    --Kiểm tra sự tồn tại của sohdx
    IF EXISTS(SELECT * FROM Xuat WHERE sohdx = @sohdx)
    BEGIN
        --Cập nhật bảng Xuat
        UPDATE Xuat
        SET masp = @masp,
            manv = @manv,
            ngayxuat = @ngayxuat,
            soluongX = @soluongX
        WHERE sohdx = @sohdx
    END
    ELSE
    BEGIN
        --Thêm mới bảng Xuat
        INSERT INTO Xuat(sohdx, masp, manv, ngayxuat, soluongX)
        VALUES(@sohdx, @masp, @manv, @ngayxuat, @soluongX)
    END
    
    --Trả về mã lỗi 0: không có lỗi
    RETURN 0
END
go