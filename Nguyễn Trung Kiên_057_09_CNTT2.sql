--Câu 2
use QLHANG
go
select top 1 MaHD, sum(DonGia) as TongTien from HangXuat group by MaHD, DonGia order by DonGia desc
--Câu 3
CREATE FUNCTION f3 (
    @MAHD varchar(10)
)
RETURNS TABLE
AS
RETURN
    SELECT 
        HX.MaHD,
        HD.NgayXuat,
        HD.MaVT,
        HX.DonGia,
        HX.SLBan,  
        CASE
            WHEN WEEKDAY(HD.NgayXuat) = 0 THEN N'Thứ hai'            
            WHEN WEEKDAY(HD.NgayXuat) = 1 THEN N'Thứ ba'
            WHEN WEEKDAY(HD.NgayXuat) = 2 THEN N'Thứ tư'
            WHEN WEEKDAY(HD.NgayXuat) = 3 THEN N'Thứ năm'
            WHEN WEEKDAY(HD.NgayXuat) = 4 THEN N'Thứ sáu'
            WHEN WEEKDAY(HD.NgayXuat) = 5 THEN N'Thứ bảy'
            ELSE N'Chủ nhật'
        END AS NGAYTHU
    FROM HANGXUAT HX
    INNER JOIN HDBAN HD ON HX.MAHD = HD.MAHD
    WHERE HX.MAHD = @MAHD;
--Câu 4
CREATE PROCEDURE p4 
@thang int, @nam int 
AS
SELECT 
SUM(SLBan * DonGia)
FROM HangXuat HX
INNER JOIN HDBan HD ON HX.MaHD = HD.MaHD
where MONTH(HD.NgayXuat) = @THANG AND YEAR(HD.NgayXuat) = @NAM;

