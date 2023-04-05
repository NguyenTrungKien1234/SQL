-- 1.Hiển thị thông tin các bảng dữ liệu trên.
go
Create view lab2c1sp as
SELECT * FROM Sanpham;
go
Select  * FROM lab2c1sp;

go
Create view lab2c1hsx as
SELECT * FROM Hangsx;
go
Select  * FROM lab2c1hsx;

go
Create view lab2c1nv as
SELECT * FROM Nhanvien;
go
Select  * FROM lab2c1nv;

go
Create view lab2c1n as
SELECT * FROM Nhap;
go
Select  * FROM lab2c1n;

go
Create view lab2c1x as
SELECT * FROM Xuat;
go
Select  * FROM lab2c1x;

-- 2.Đưa ra thông tin masp, tensp, tenhang, soluong, mausac, giaban, donvitinh, mota của các sản phẩm sắp xếp theo chiều giảm dần giá bán.
go 

CREATE VIEW Lab2c2r AS
SELECT Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Sanpham.soluong, Sanpham.mausac, Sanpham.giaban, Sanpham.donvitinh, Sanpham.mota
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
go
go
Select * from Lab2c2r ORDER BY Lab2c2r.giaban DESC;
go
-- 3.Đưa ra thông tin các sản phẩm có trong cửa hàng do công ty có tên hãng là Samsung sản xuất.
go
CREATE VIEW Lab2C3 AS
SELECT Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Sanpham.soluong, Sanpham.mausac, Sanpham.giaban, 
Sanpham.donvitinh, Sanpham.mota
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung'
go
go
Select * from Lab2C3 
go
-- 4.Đưa ra thông tin các nhân viên Nữ ở trong phòng "Kế toán".
go
CREATE VIEW Lab2C4 AS
SELECT * FROM nhanvien
WHERE gioitinh = 'Nữ' AND phong = 'Kế toán'
go
go
Select * from Lab2C4
go
/* 5.Đưa ra thông tin phiếu nhập gồm: sohdn, masp, tensp, tenhang, soluongN, dongian, tiennhap, soluongN, 
dongiaN, mausac, donvitinh, ngaynhap, tennv, phong. Sắp xếp theo chiều tăng dần của hóa đơn nhập.*/
go
CREATE VIEW Lab2C5 AS
SELECT Nhap.sohdn, Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Nhap.soluongN, Nhap.dongiaN, 
Nhap.soluongN*Nhap.dongiaN AS tiennhap, Sanpham.mausac, Sanpham.donvitinh, Nhap.ngaynhap,
Nhanvien.tennv, Nhanvien.phong
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv

go
go
Select * from Lab2C5 ORDER BY Lab2C5.sohdn ASC;
go

/* 6.Đưa ra thông tin phiếu xuất gồm: sohdx, masp, tensp, tenhang, soluongX, giaban,tienxuat = soluongX*giaban, mausac, donvitinh, ngayxuat, 
tennv, phong trong tháng 10 năm 2018, sắp xếp theo chiều tăng dần của sohdx.*/
go
CREATE VIEW Lab2C6 AS
SELECT Xuat.sohdx, Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Xuat.soluongX, Sanpham.giaban, 
       Xuat.soluongX*Sanpham.giaban AS tienxuat, Sanpham.mausac, Sanpham.donvitinh, Xuat.ngayxuat, 
       Nhanvien.tennv, Nhanvien.phong
FROM Xuat
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
INNER JOIN Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE MONTH(Xuat.ngayxuat) = 10 AND YEAR(Xuat.ngayxuat) = 2018

go
go
Select * from Lab2C6 ORDER BY Lab2C6.sohdx ASC;
go

-- 7.Đưa ra các thông tin về các hóa đơn mà hãng samsung đã nhập trong năm 2017, gồm: sohdn, masp, tensp, soluongN, dongiaN, ngaynhap, tennv, phong.
go
CREATE VIEW Lab2C7 AS
SELECT sohdn, Sanpham.masp, tensp, soluongN, dongiaN, ngaynhap, tennv, phong
FROM Nhap 
JOIN Sanpham ON Nhap.masp = Sanpham.masp 
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE Hangsx.tenhang = 'Samsung' AND YEAR(ngaynhap) = 2017;

go
go
Select * from Lab2C7 
go
-- 8.Đưa ra Top 10 hóa đơn xuất có số lượng xuất nhiều nhất trong năm 2018, sắp xếp theo chiều giảm dần của soluongX. 
go
CREATE VIEW Lab2C8 AS
SELECT TOP 10 Xuat.sohdx, Sanpham.tensp, Xuat.soluongX
FROM Xuat 
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE YEAR(Xuat.ngayxuat) = '2018' 
ORDER BY Xuat.soluongX DESC;

go
go
Select * from Lab2C8 ORDER BY Lab2C8.soluongX DESC
go

-- 9.Đưa ra thông tin 10 sản phẩm có giả bản cao nhất trong cửa hàng, theo chiều giảm dần giá bán.
go
CREATE VIEW Lab2C9 AS
SELECT TOP 10 tenSP, giaBan
FROM SanPham
ORDER BY giaBan DESC;

go
go
Select * from Lab2C9 ORDER BY Lab2C9.giaBan DESC
go
--10 Hãy đưa ra danh sách các nhân viên vừa nhập vừa xuất.--
go
CREATE VIEW Lab2C10 AS
SELECT masp, tensp, tenhang, soluong, mausac, giaban, donvitinh, mota
FROM Sanpham
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND Sanpham.giaban >= 100000 AND Sanpham.giaban <= 500000

go
go
Select * from Lab2C10 
go
-- 11.Tính tổng tiền đã nhập trong năm 2018 của hãng samsung. 
go
CREATE VIEW Lab2C11 AS
SELECT SUM(soluongN * dongiaN) AS tongtien
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND YEAR(ngaynhap) = 2018

go
go
Select * from Lab2C11 
go
-- 12.Thống kê tổng tiền đã xuất trong ngày 2/9/2018.
	go
CREATE VIEW Lab2C12 AS
SELECT SUM(Xuat.soluongX * Sanpham.giaban) AS Tongtien
FROM Xuat
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE Xuat.ngayxuat = '2018-09-02'

go
go
Select * from Lab2C12 
go
-- 13.Đưa ra sohdn, ngaynhap có tiền nhập phải trả cao nhất trong năm 2018.
go
CREATE VIEW Lab2C13 AS
SELECT TOP 1 sohdn, ngaynhap, dongiaN
FROM Nhap
ORDER BY dongiaN DESC

go
go
Select * from Lab2C13 
go
-- 14.Đưa ra 10 mặt hàng có soluongN nhiều nhất trong năm 2019.
go
CREATE VIEW Lab2C14 AS
SELECT TOP 10 Sanpham.tensp, SUM(Nhap.soluongN) AS TongSoLuongN 
FROM Sanpham 
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp 
WHERE YEAR(Nhap.ngaynhap) = 2019 
GROUP BY Sanpham.tensp 
ORDER BY TongSoLuongN DESC

go
go
Select * from Lab2C14 
go
-- 15.Đưa ra masp,tensp của các sản phẩm do công ty 'Samsung' sản xuất do nhân viên có mã 'NV01' nhập.
go
CREATE VIEW Lab2C15 AS
SELECT Sanpham.masp, Sanpham.tensp
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp
INNER JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE Hangsx.tenhang = 'Samsung' AND Nhanvien.manv = 'NV01';

go
go
Select * from Lab2C15
go
-- 16.Đưa ra sohda, masp, soluongN, ngayN của mặt hàng có masp là 'SPO2', được nhân viên 'NVG2' xuất.
go
CREATE VIEW Lab2C16 AS
SELECT sohdn, masp, soluongN, ngaynhap
FROM Nhap
WHERE masp = 'SP02' AND manv = 'NV02'

go
go
Select * from Lab2C16
go

-- 17.Đưa ra manv, tennv, đã xuất mặt hàng có mã 'SPO2' ngày '03-02-2020'.
go
CREATE VIEW Lab2C17 AS
SELECT Nhanvien.manv, Nhanvien.tennv
FROM Nhanvien
INNER JOIN Xuat ON Nhanvien.manv = Xuat.manv
WHERE Xuat.masp = 'SP02' AND Xuat.ngayxuat = '2020-03-02'

go
go
Select * from Lab2C17
go


--------------------------------------------------------------------------------------------------


--lab3--
--câu 1
go
CREATE VIEW Lab_3_C_1 AS
SELECT Hangsx.tenhang, COUNT(Sanpham.masp) AS SoLuongLoaiSP
FROM Hangsx
JOIN Sanpham ON Hangsx.mahangsx = Sanpham.mahangsx
GROUP BY Hangsx.tenhang;

go
go
Select * from Lab_3_C_1
go
--câu 2
go
CREATE VIEW Lab_3_C_2 AS
SELECT Sanpham.tensp, SUM(Nhap.soluongN * Nhap.dongiaN) AS TongTienNhap
FROM Sanpham
JOIN Nhap ON Sanpham.masp = Nhap.masp
WHERE YEAR(Nhap.ngaynhap) = 2018
GROUP BY Sanpham.tensp;

go
go
Select * from Lab_3_C_2
go
--câu 3
go
CREATE VIEW Lab_3_C_3 AS
SELECT Sanpham.tensp, SUM(Xuat.soluongX) AS TongSoLuongXuat
FROM Sanpham
JOIN Xuat ON Sanpham.masp = Xuat.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'samsung' AND YEAR(Xuat.ngayxuat) = 2018
GROUP BY Sanpham.tensp
HAVING SUM(Xuat.soluongX) > 10000

go
go
Select * from Lab_3_C_3
go
--câu 4
go
CREATE VIEW Lab_3_C_4 AS
SELECT Nhanvien.phong, COUNT(Nhanvien.manv) AS SoLuongNam
FROM Nhanvien
WHERE Nhanvien.gioitinh = 'Nam'
GROUP BY Nhanvien.phong;

go
go
Select * from Lab_3_C_4
go
--câu 5
go
CREATE VIEW Lab_3_C_5 AS
SELECT Hangsx.tenhang, SUM(Nhap.soluongN) AS TongSoLuongNhap
FROM Hangsx
JOIN Sanpham ON Hangsx.mahangsx = Sanpham.mahangsx
JOIN Nhap ON Sanpham.masp = Nhap.masp
WHERE YEAR(Nhap.ngaynhap) = 2018
GROUP BY Hangsx.tenhang;

go
go
Select * from Lab_3_C_5
go
--câu 6
go
CREATE VIEW Lab_3_C_6 AS
SELECT Nhanvien.tennv, SUM(Sanpham.giaban * Xuat.soluongX) AS TongTienXuat
FROM Nhanvien
JOIN Xuat ON Nhanvien.manv = Xuat.manv
JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE YEAR(Xuat.ngayxuat) = 2018
GROUP BY Nhanvien.tennv;

go
go
Select * from Lab_3_C_6
go
--câu 7
go
CREATE VIEW Lab_3_C_7 AS
SELECT Nhanvien.tennv, SUM(Nhap.soluongN * Nhap.dongiaN) AS TongTienNhap
FROM Nhanvien
JOIN Nhap ON Nhanvien.manv = Nhap.manv
WHERE MONTH(Nhap.ngaynhap) = 8 AND YEAR(Nhap.ngaynhap) = 2018
GROUP BY Nhanvien.tennv
HAVING SUM(Nhap.soluongN * Nhap.dongiaN) > 100000;

go
go
Select * from Lab_3_C_7
go
--câu 8
go
CREATE VIEW Lab_3_C_8 AS
SELECT *
FROM Sanpham
WHERE NOT EXISTS (
    SELECT *
    FROM Xuat
    WHERE Sanpham.masp = Xuat.masp
);

go
go
Select * from Lab_3_C_8
go
--câu 9
go
CREATE VIEW Lab_3_C_9 AS
SELECT DISTINCT Sanpham.*
FROM Sanpham
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp
INNER JOIN Xuat ON Sanpham.masp = Xuat.masp
WHERE YEAR(Nhap.ngaynhap) = 2018 AND YEAR(Xuat.ngayxuat) = 2018;

go
go
Select * from Lab_3_C_9
go
--câu 10
go
CREATE VIEW Lab_3_C_10 AS
SELECT DISTINCT Nhanvien.*
FROM Nhanvien
INNER JOIN Nhap ON Nhanvien.manv = Nhap.manv
INNER JOIN Xuat ON Nhanvien.manv = Xuat.manv;

go
go
Select * from Lab_3_C_10
go
--câu 11
go
CREATE VIEW Lab_3_C_11 AS
	SELECT *
FROM Nhanvien
WHERE Nhanvien.manv NOT IN (SELECT DISTINCT manv FROM Nhap)
  AND Nhanvien.manv NOT IN (SELECT DISTINCT manv FROM Xuat);
go
go
Select * from Lab_3_C_11
go