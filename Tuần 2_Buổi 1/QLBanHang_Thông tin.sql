USE [QLBanHang]
GO
INSERT [dbo].[Sanpham] ([masp], [mahangsx], [tensp], [soluong], [mausac], [giaban], [donvitinh], [mota]) VALUES (N'SP01      ', N'H02       ', N'F1

Plus', 100, N'Xám', 7000000.0000, N'Chiếc     ', N'Hàng
cận
cao
cấp')
INSERT [dbo].[Sanpham] ([masp], [mahangsx], [tensp], [soluong], [mausac], [giaban], [donvitinh], [mota]) VALUES (N'SP02      ', N'H01       ', N'Galaxy
Note1
1', 50, N'Ð?', 19000000.0000, N'Chiếc     ', N'Hàng
cao
cấp')
INSERT [dbo].[Sanpham] ([masp], [mahangsx], [tensp], [soluong], [mausac], [giaban], [donvitinh], [mota]) VALUES (N'SP03      ', N'H02       ', N'F3 lite', 200, N'Nâu', 3000000.0000, N'Chiếc     ', N'Hàng
phổ 
thông')
INSERT [dbo].[Sanpham] ([masp], [mahangsx], [tensp], [soluong], [mausac], [giaban], [donvitinh], [mota]) VALUES (N'SP04      ', N'H03       ', N'Vjoy3', 200, N'Xám', 1500000.0000, N'Chiếc     ', N'Hàng
phổ
 thông')
INSERT [dbo].[Sanpham] ([masp], [mahangsx], [tensp], [soluong], [mausac], [giaban], [donvitinh], [mota]) VALUES (N'SP05      ', N'H01       ', N'Galaxy V21', 500, N'Nâu', 8000000.0000, N'Chiếc     ', N'Hàng

cận
cao
cấp')
GO
INSERT [dbo].[Nhanvien] ([manv], [tennv], [gioitinh], [diachi], [sodt], [email], [phong]) VALUES (N'NV01      ', N'Nguyễ
n Thị Thu', N'Nữ        ', N'Hà Nội', N'09826265
21', N'thu@gmail.co
m', N'Kế 
toán')
INSERT [dbo].[Nhanvien] ([manv], [tennv], [gioitinh], [diachi], [sodt], [email], [phong]) VALUES (N'NV02      ', N'Lê
 Văn 
Nam', N'Nam       ', N'Bắc
 Ninh', N'09725252
52', N'nam@gmail.co
m', N'Vật tư')
INSERT [dbo].[Nhanvien] ([manv], [tennv], [gioitinh], [diachi], [sodt], [email], [phong]) VALUES (N'NV03      ', N'Trần 
Hòa 
Bình', N'Nữ        ', N'Hà Nội', N'0328388388', N'hb@gmail.com', N'Kế 
toán')
GO
INSERT [dbo].[Nhap] ([sohdn], [masp], [manv], [ngaynhap], [soluongN], [dongiaN]) VALUES (N'N01       ', N'SP02      ', N'NV01      ', CAST(N'2019-02-05' AS Date), 10, 17000000.0000)
INSERT [dbo].[Nhap] ([sohdn], [masp], [manv], [ngaynhap], [soluongN], [dongiaN]) VALUES (N'N02       ', N'SP01      ', N'NV02      ', CAST(N'2020-04-07' AS Date), 30, 6000000.0000)
INSERT [dbo].[Nhap] ([sohdn], [masp], [manv], [ngaynhap], [soluongN], [dongiaN]) VALUES (N'N03       ', N'SP04      ', N'NV02      ', CAST(N'2020-05-17' AS Date), 20, 1200000.0000)
INSERT [dbo].[Nhap] ([sohdn], [masp], [manv], [ngaynhap], [soluongN], [dongiaN]) VALUES (N'N04       ', N'SP01      ', N'NV03      ', CAST(N'2020-03-22' AS Date), 10, 6200000.0000)
INSERT [dbo].[Nhap] ([sohdn], [masp], [manv], [ngaynhap], [soluongN], [dongiaN]) VALUES (N'N05       ', N'SP05      ', N'NV01      ', CAST(N'2020-07-07' AS Date), 20, 7000000.0000)
GO
INSERT [dbo].[Xuat] ([sohdx], [masp], [manv], [ngayxuat], [soluongX]) VALUES (N'X01       ', N'SP03      ', N'NV02      ', CAST(N'2020-06-14' AS Date), 5)
INSERT [dbo].[Xuat] ([sohdx], [masp], [manv], [ngayxuat], [soluongX]) VALUES (N'X02       ', N'SP01      ', N'NV03      ', CAST(N'2019-03-05' AS Date), 3)
INSERT [dbo].[Xuat] ([sohdx], [masp], [manv], [ngayxuat], [soluongX]) VALUES (N'X03       ', N'SP02      ', N'NV01      ', CAST(N'2020-12-12' AS Date), 1)
INSERT [dbo].[Xuat] ([sohdx], [masp], [manv], [ngayxuat], [soluongX]) VALUES (N'X04       ', N'SP03      ', N'NV02      ', CAST(N'2020-06-02' AS Date), 2)
INSERT [dbo].[Xuat] ([sohdx], [masp], [manv], [ngayxuat], [soluongX]) VALUES (N'X05       ', N'SP05      ', N'NV01      ', CAST(N'2020-05-18' AS Date), 1)
GO
INSERT [dbo].[Hangsx] ([mahangsx], [tenhang], [diachi], [sodt], [email]) VALUES (N'H01       ', N'Samsung', N'Korea', N'011-08271717', N'ss@gmail.com.kr')
INSERT [dbo].[Hangsx] ([mahangsx], [tenhang], [diachi], [sodt], [email]) VALUES (N'H02       ', N'OPPO', N'China', N'081-08626262', N'oppo@gmail.com.cn')
INSERT [dbo].[Hangsx] ([mahangsx], [tenhang], [diachi], [sodt], [email]) VALUES (N'H03       ', N'Vinfone', N'Việt nam', N'084-098262626', N'vf@gmail.com.vn')
GO
