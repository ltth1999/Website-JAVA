USE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM06]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 7/4/2020 11:40:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[maSP] [nchar](20) NOT NULL,
	[maHD] [nchar](20) NOT NULL,
	[soLuong] [int] NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[maSP] ASC,
	[maHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 7/4/2020 11:40:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[maHD] [nchar](20) NOT NULL,
	[tongTien] [float] NULL,
	[ngayTT] [date] NULL,
	[maTK] [nchar](20) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[maHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 7/4/2020 11:40:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[maSP] [nchar](20) NOT NULL,
	[tenSP] [nvarchar](255) NULL,
	[soLuongTon] [int] NULL,
	[moTa] [nvarchar](255) NULL,
	[image] [nchar](50) NULL,
	[loaiSP] [nvarchar](50) NULL,
	[gia] [float] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[maSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 7/4/2020 11:40:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[maTK] [nchar](20) NOT NULL,
	[email] [nchar](100) NULL,
	[matKhau] [nchar](20) NULL,
	[ten] [nvarchar](255) NULL,
	[diaChi] [nvarchar](255) NULL,
	[sdt] [nchar](10) NULL,
	[loaiTK] [nchar](20) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[maTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ChiTietHoaDon] ([maSP], [maHD], [soLuong]) VALUES (N'11                  ', N'2                   ', 1)
INSERT [dbo].[ChiTietHoaDon] ([maSP], [maHD], [soLuong]) VALUES (N'11                  ', N'3                   ', 1)
INSERT [dbo].[ChiTietHoaDon] ([maSP], [maHD], [soLuong]) VALUES (N'11                  ', N'4                   ', 1)
INSERT [dbo].[ChiTietHoaDon] ([maSP], [maHD], [soLuong]) VALUES (N'31                  ', N'2                   ', 1)
INSERT [dbo].[ChiTietHoaDon] ([maSP], [maHD], [soLuong]) VALUES (N'32                  ', N'2                   ', 1)
INSERT [dbo].[ChiTietHoaDon] ([maSP], [maHD], [soLuong]) VALUES (N'4                   ', N'4                   ', 1)
INSERT [dbo].[HoaDon] ([maHD], [tongTien], [ngayTT], [maTK]) VALUES (N'1                   ', 10100000, CAST(N'2020-07-04' AS Date), N'2                   ')
INSERT [dbo].[HoaDon] ([maHD], [tongTien], [ngayTT], [maTK]) VALUES (N'2                   ', 19734003, CAST(N'2020-07-04' AS Date), N'4                   ')
INSERT [dbo].[HoaDon] ([maHD], [tongTien], [ngayTT], [maTK]) VALUES (N'3                   ', 2300000, CAST(N'2020-07-04' AS Date), N'4                   ')
INSERT [dbo].[HoaDon] ([maHD], [tongTien], [ngayTT], [maTK]) VALUES (N'4                   ', 7300000, CAST(N'2020-07-04' AS Date), N'8                   ')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'10                  ', N'fujifilm-xf10-vang', 89, N'Dai ISO: 200-12800', N'/resources/images/fu6.jpg                         ', N'Fujifilm', 3450000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'11                  ', N'fujifilm-x-t3', 30, N'Quay video UHD 4K
', N'/resources/images/fu7.jpg                         ', N'Fujifilm', 2300000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'12                  ', N'fujifilm-x-t3-silver-1', 34, N'Chup toi da 6 khung hinh / giay
', N'/resources/images/fu10.jpg                        ', N'Fujifilm', 7800000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'13                  ', N'fujifilm-x-t20
', 54, N'Tich hop he thong Hybrid
', N'/resources/images/fu11.jpg                        ', N'Fujifilm', 3400000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'14                  ', N'fujifilm-x-t30-charcoal-silver-4
', 66, N'Ket noi Bluetooth
', N'/resources/images/fu12.jpg                        ', N'Fujifilm', 5466677)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'15                  ', N'fujifilm-x-t30-silver-1', 77, N'Kich thuoc: 119x67.7x42 mm
', N'/resources/images/fu13.jpg                        ', N'Fujifilm', 9860000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'16                  ', N'fujifilm-x-t100-xc-15-45mm-dark-silver
', 43, N'Trong luong 320g
', N'/resources/images/fu14.jpg                        ', N'Fujifilm', 3490000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'17                  ', N'fujifilm-xa3-body-bac
', 100, N'Thoi luong pin: 450 tam/1 lan sac day
', N'/resources/images/fu15.jpg                        ', N'Fujifilm', 9840000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'18                  ', N'fujifilm-xt200-body-vang-champagne1
', 5, N'Video 4K
', N'/resources/images/fu16.jpg                        ', N'Fujifilm', 2304000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'19                  ', N'nikon-coolpix-a1000-bac
', 67, N'Man hinh xoay lat
', N'/resources/images/ni1.jpg                         ', N'Nikon', 7800000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'2                   ', N'CANON 50D', 50, N'Cảm biến ', N'/resources/images/ca1.jpg                         ', N'Canon', 7000000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'20                  ', N'nikon-coolpix-p900
', 7, N'ISO tieu chuan
', N'/resources/images/ni2.jpg                         ', N'Nikon', 2300000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'21                  ', N'nikon-coolpix-p1000
', 89, N'Do phan giai: 24.2 MP
', N'/resources/images/ni3.jpg                         ', N'Nikon', 8704000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'22                  ', N'nikon-d5600-body-sigma-1750for
', 12, N'Ong kinh XC
', N'/resources/images/ni4.jpg                         ', N'Nikon', 2300000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'23                  ', N'nikon-z50-body-nikkor-z-dx-16
', 32, N'He thong lay net tu dong
', N'/resources/images/ni5.jpg                         ', N'Nikon', 7840000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'24                  ', N'nikon-coolpix-w300-vang
', 12, N'Toc do chup lien tuc 8fps
', N'/resources/images/ni6.jpg                         ', N'Nikon', 4500000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'25                  ', N'Sony Alpha ILCE-7M2K
', 13, N'Khung ngam OLED
', N'/resources/images/so2.jpg                         ', N'Sony', 6578000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'26                  ', N'Sony Alpha ILCE-6400-B AP2
', 14, N'Khung ngam OLED
', N'/resources/images/so4.jpg                         ', N'Sony', 7840000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'27                  ', N'Sony Alpha ILCE-6500
', 4, N'Video UHD
', N'/resources/images/so8.jpg                         ', N'Sony', 8482900)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'28                  ', N'Sony DSC_W830S
', 5, N'Video UHD
', N'/resources/images/so1.png                         ', N'Sony', 2398000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'29                  ', N'Sony DSC-RX1RM2 E32
', 6, N'Pin: NP-W126S
', N'/resources/images/so3.png                         ', N'Sony', 8949300)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'3                   ', N'CANON 5000D', 10, N'Ho tro ket noi Wifi', N'/resources/images/ca2.jpg                         ', N'Canon', 7500000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'30                  ', N'Sony DSC-RX10M3 E32 20.1
', 7, N'Ong ngam dien tu OLED
', N'/resources/images/so5.png                         ', N'Sony', 3540000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'31                  ', N'Sony DSC-RX10M4 E32
', 22, N'Kich thuoc: 100x20x30 mm
', N'/resources/images/so5.png                         ', N'Sony', 8940003)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'32                  ', N'Sony DSC-W830P', 7, N'ISO: 160-12800
', N'/resources/images/so7.png                         ', N'Sony', 8494000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'4                   ', N'Canon EOS 40D', 19, N'Ho tro the SD', N'/resources/images/ca3.png                         ', N'Canon', 5000000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'5                   ', N'Fujifilm XA5', 25, N'Ong kinh EF-S', N'/resources/images/fu1.jpg                         ', N'Fujifilm', 2500000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'6                   ', N'FujiFilm X-A20', 30, N'Chup lien tuc 3 hinh/s', N'/resources/images/fu2.jpg                         ', N'Fujifilm', 4500000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'7                   ', N'fujifilm X-6Y', 90, N'ISO: 160-12800', N'/resources/images/fu3.jpg                         ', N'Fujifilm', 2700000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'8                   ', N'fujifilm-finepix', 56, N'Cam bien APS-C', N'/resources/images/fu4.jpg                         ', N'Fujifilm', 9000000)
INSERT [dbo].[SanPham] ([maSP], [tenSP], [soLuongTon], [moTa], [image], [loaiSP], [gia]) VALUES (N'9                   ', N'fujifilm-x100v', 29, N'Man hinh LCD', N'/resources/images/fu5.jpg                         ', N'Fujifilm', 4500000)
INSERT [dbo].[TaiKhoan] ([maTK], [email], [matKhau], [ten], [diaChi], [sdt], [loaiTK]) VALUES (N'1                   ', N'hamanhtrung@gmail.com                                                                               ', N'12345678            ', N'Ha Manh Trung', N'Quan 3', N'0929292922', N'Nhan Vien           ')
INSERT [dbo].[TaiKhoan] ([maTK], [email], [matKhau], [ten], [diaChi], [sdt], [loaiTK]) VALUES (N'2                   ', N'bach@gmail.com                                                                                      ', N'23456789            ', N'Phan Bach', N'Binh Thanh', N'0988888889', N'Khach Hang          ')
INSERT [dbo].[TaiKhoan] ([maTK], [email], [matKhau], [ten], [diaChi], [sdt], [loaiTK]) VALUES (N'3                   ', N'Lyvy@gmail.com                                                                                      ', N'12213234            ', N'Ly Vy', N'Quan 2', N'0152452156', N'Khach Hang          ')
INSERT [dbo].[TaiKhoan] ([maTK], [email], [matKhau], [ten], [diaChi], [sdt], [loaiTK]) VALUES (N'4                   ', N'Nguyenan@gmail.com                                                                                  ', N'25525452            ', N'Nguyen An', N'Quan 5', N'0956563225', N'Khach Hang          ')
INSERT [dbo].[TaiKhoan] ([maTK], [email], [matKhau], [ten], [diaChi], [sdt], [loaiTK]) VALUES (N'5                   ', N'Nguyenhoang@gmail.com                                                                               ', N'35435465            ', N'Hoang Anh', N'Quan 12', N'0524446655', N'Nhan Vien           ')
INSERT [dbo].[TaiKhoan] ([maTK], [email], [matKhau], [ten], [diaChi], [sdt], [loaiTK]) VALUES (N'6                   ', N'Longcute@gmail.com                                                                                  ', N'26535652            ', N'Long Hai', N'Phu Nhuan', N'0956558554', N'Nhan Vien           ')
INSERT [dbo].[TaiKhoan] ([maTK], [email], [matKhau], [ten], [diaChi], [sdt], [loaiTK]) VALUES (N'7                   ', N'phananh@gmail.com                                                                                   ', N'25525451            ', N'Cam Tu', N'Binh Tan', N'0965652355', N'Nhan Vien           ')
INSERT [dbo].[TaiKhoan] ([maTK], [email], [matKhau], [ten], [diaChi], [sdt], [loaiTK]) VALUES (N'8                   ', N'Nguyenhanh@gmail.com                                                                                ', N'25345561            ', N'Hoang Tuan', N'Quan 1', N'0985652204', N'Khach Hang          ')
