go
----Cau 1a---------
INSERT INTO NhanVien (manv, tennv,  gioitinh, diachi, sodt, email, phong)
VALUES ('NV08', 'Nguyen Van D', 'Nam', 'Ha Noi', '0987654321', 'nva@example.com', N'Kế toán')
----Thực hiện full back up
BACKUP DATABASE [QLBanHang] TO DISK = 'F:\Users\NguyenTrungKien\Desktop\Lab_thuc_hanh_tuan\QLyBanHang.bak' WITH INIT
go

go
----Cau 1b---------
Use QLBanHang
go
INSERT INTO Nhanvien (manv, tennv,  gioitinh, diachi, sodt, email, phong)
VALUES ('NV09', 'Nguyen Van B', 'Nam', 'Ha Noi', '0987654321', 'nva@example.com', N'Kế toán')
----Thực hiện different backup
BACKUP DATABASE [QLBanHang] TO DISK = 'C:\Users\NguyenTrungKien\Desktop\Lab_thuc_hanh_tuan\dif_backup.bak' WITH INIT
go

go
----Cau 1c---------
use QLBanHang
INSERT INTO NhanVien (manv, tennv,  gioitinh, diachi, sodt, email, phong)
VALUES ('NV17', 'Nguyen Van C', 'Nam', 'Ha Noi', '0987654321', 'nva@example.com', N'Kế toán')
----Thực hiện BACKUP LOG
BACKUP LOG [QLBanHang] TO DISK = 'C:\Users\NguyenTrungKien\Desktop\Lab_thuc_hanh_tuan\QLBanHangLog.trn' WITH  FORMAT;
go

go
----Cau 1d---------
INSERT INTO Nhanvien (manv, tennv,  gioitinh, diachi, sodt, email, phong)
VALUES ('NV19', 'Nguyen Van C', 'Nam', 'Ha Noi', '0987654321', 'nva@example.com', N'Kế toán')
----Thực hiện BACKUP LOG
BACKUP LOG [QLBanHang] TO DISK = 'C:\Users\NguyenTrungKien\Desktop\Lab_thuc_hanh_tuan\Tuan5.trn' WITH  NOINIT;
go

go
----Cau 2---------
DROP DATABASE QLBanHang;

RESTORE DATABASE QLBanHang
FROM DISK = 'C:\Users\NguyenTrungKien\Desktop\Lab_thuc_hanh_tuan\QLBanHang.bak'
WITH STANDBY = 'C:\Users\NguyenTrungKien\Desktop\Lab_thuc_hanh_tuan.undo'
go