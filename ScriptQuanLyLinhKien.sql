USE [master]
GO
/****** Object:  Database [QuanLyLinhKien]    Script Date: 11/25/2020 11:19:26 PM ******/
CREATE DATABASE [QuanLyLinhKien]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyLinhKien', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyLinhKien.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyLinhKien_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyLinhKien_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyLinhKien] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyLinhKien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyLinhKien] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyLinhKien] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyLinhKien] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyLinhKien] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyLinhKien] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyLinhKien] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLyLinhKien] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyLinhKien] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyLinhKien] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyLinhKien] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyLinhKien] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyLinhKien] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyLinhKien] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyLinhKien] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyLinhKien] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyLinhKien] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyLinhKien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyLinhKien] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyLinhKien] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyLinhKien] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyLinhKien] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyLinhKien] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyLinhKien] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyLinhKien] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyLinhKien] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyLinhKien] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyLinhKien] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyLinhKien] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyLinhKien] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QuanLyLinhKien]
GO
/****** Object:  Table [dbo].[tblChiTietHoaDon]    Script Date: 11/25/2020 11:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChiTietHoaDon](
	[maHoaDon] [int] NULL,
	[maLinhKien] [int] NULL,
	[soLuong] [int] NOT NULL,
	[donGia] [float] NOT NULL,
	[giamGia] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHoaDon]    Script Date: 11/25/2020 11:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHoaDon](
	[maHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[maNhanVien] [int] NOT NULL,
	[maKhachHang] [int] NOT NULL,
	[ngayBanHang] [date] NOT NULL,
	[tongTien] [float] NOT NULL,
	[ghiChu] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[maHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblKhachHang]    Script Date: 11/25/2020 11:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKhachHang](
	[maKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[tenKhachHang] [nvarchar](50) NOT NULL,
	[diaChi] [nvarchar](50) NOT NULL,
	[soDienThoai] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLinhKien]    Script Date: 11/25/2020 11:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLinhKien](
	[maLinhKien] [int] IDENTITY(1,1) NOT NULL,
	[tenLinhKien] [nvarchar](50) NOT NULL,
	[donGia] [float] NOT NULL,
	[ngayNhap] [date] NOT NULL,
	[soLuong] [int] NOT NULL,
	[maNhaCungCap] [int] NOT NULL,
	[maLoaiLinhKien] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[maLinhKien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLoaiLinhKien]    Script Date: 11/25/2020 11:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLoaiLinhKien](
	[maLoaiLinhKien] [nvarchar](50) NOT NULL,
	[tenLoaiLinhKien] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[maLoaiLinhKien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNhaCungCap]    Script Date: 11/25/2020 11:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNhaCungCap](
	[maNhaCungCap] [int] IDENTITY(1,1) NOT NULL,
	[tenNhaCungCap] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[maNhaCungCap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNhanVien]    Script Date: 11/25/2020 11:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNhanVien](
	[maNhanVien] [int] IDENTITY(1,1) NOT NULL,
	[tenNhanVien] [nvarchar](50) NOT NULL,
	[diaChi] [nvarchar](50) NOT NULL,
	[soDienThoai] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTaiKhoan]    Script Date: 11/25/2020 11:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTaiKhoan](
	[maTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[tenTaiKhoan] [nvarchar](50) NOT NULL,
	[matKhau] [nvarchar](50) NOT NULL,
	[maNhanVien] [int] NULL,
	[quyen] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[maTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tblChiTietHoaDon] ([maHoaDon], [maLinhKien], [soLuong], [donGia], [giamGia]) VALUES (1, 1, 1, 100000, N'1')
INSERT [dbo].[tblChiTietHoaDon] ([maHoaDon], [maLinhKien], [soLuong], [donGia], [giamGia]) VALUES (NULL, 5, 1, 10000, N'0')
INSERT [dbo].[tblChiTietHoaDon] ([maHoaDon], [maLinhKien], [soLuong], [donGia], [giamGia]) VALUES (NULL, 1, 1, 100000, N'0')
INSERT [dbo].[tblChiTietHoaDon] ([maHoaDon], [maLinhKien], [soLuong], [donGia], [giamGia]) VALUES (NULL, 1, 1, 100000, N'0')
INSERT [dbo].[tblChiTietHoaDon] ([maHoaDon], [maLinhKien], [soLuong], [donGia], [giamGia]) VALUES (NULL, 1, 1, 100000, N'0')
INSERT [dbo].[tblChiTietHoaDon] ([maHoaDon], [maLinhKien], [soLuong], [donGia], [giamGia]) VALUES (NULL, 1, 10, 100000, N'20')
INSERT [dbo].[tblChiTietHoaDon] ([maHoaDon], [maLinhKien], [soLuong], [donGia], [giamGia]) VALUES (NULL, 1, 1, 100000, N'0')
INSERT [dbo].[tblChiTietHoaDon] ([maHoaDon], [maLinhKien], [soLuong], [donGia], [giamGia]) VALUES (NULL, 6, 1, 10000, N'0')
INSERT [dbo].[tblChiTietHoaDon] ([maHoaDon], [maLinhKien], [soLuong], [donGia], [giamGia]) VALUES (NULL, 2, 1, 20000, N'0')
INSERT [dbo].[tblChiTietHoaDon] ([maHoaDon], [maLinhKien], [soLuong], [donGia], [giamGia]) VALUES (13, 2, 1, 20000, N'0')
INSERT [dbo].[tblChiTietHoaDon] ([maHoaDon], [maLinhKien], [soLuong], [donGia], [giamGia]) VALUES (14, 1, 1, 20000, N'0')
INSERT [dbo].[tblChiTietHoaDon] ([maHoaDon], [maLinhKien], [soLuong], [donGia], [giamGia]) VALUES (14, 2, 1, 20000, N'0')
SET IDENTITY_INSERT [dbo].[tblHoaDon] ON 

INSERT [dbo].[tblHoaDon] ([maHoaDon], [maNhanVien], [maKhachHang], [ngayBanHang], [tongTien], [ghiChu]) VALUES (1, 1, 1, CAST(0xAB410B00 AS Date), 100000, N'ok')
INSERT [dbo].[tblHoaDon] ([maHoaDon], [maNhanVien], [maKhachHang], [ngayBanHang], [tongTien], [ghiChu]) VALUES (2, 1, 1, CAST(0xAB410B00 AS Date), 100000, N'ok')
INSERT [dbo].[tblHoaDon] ([maHoaDon], [maNhanVien], [maKhachHang], [ngayBanHang], [tongTien], [ghiChu]) VALUES (3, 1, 1, CAST(0xAB410B00 AS Date), 150000, N'ok ne')
INSERT [dbo].[tblHoaDon] ([maHoaDon], [maNhanVien], [maKhachHang], [ngayBanHang], [tongTien], [ghiChu]) VALUES (4, 1, 1, CAST(0xAB410B00 AS Date), 150000, N'ok ne')
INSERT [dbo].[tblHoaDon] ([maHoaDon], [maNhanVien], [maKhachHang], [ngayBanHang], [tongTien], [ghiChu]) VALUES (5, 1, 1, CAST(0xD9410B00 AS Date), 100000, N'ok')
INSERT [dbo].[tblHoaDon] ([maHoaDon], [maNhanVien], [maKhachHang], [ngayBanHang], [tongTien], [ghiChu]) VALUES (6, 1, 1, CAST(0xD9410B00 AS Date), 20000, N'new')
INSERT [dbo].[tblHoaDon] ([maHoaDon], [maNhanVien], [maKhachHang], [ngayBanHang], [tongTien], [ghiChu]) VALUES (7, 1, 1, CAST(0xD9410B00 AS Date), 10000, N'bán con i7')
INSERT [dbo].[tblHoaDon] ([maHoaDon], [maNhanVien], [maKhachHang], [ngayBanHang], [tongTien], [ghiChu]) VALUES (8, 1, 1, CAST(0xD9410B00 AS Date), 10000, N'e')
INSERT [dbo].[tblHoaDon] ([maHoaDon], [maNhanVien], [maKhachHang], [ngayBanHang], [tongTien], [ghiChu]) VALUES (9, 1, 1, CAST(0xD9410B00 AS Date), 20000, N'e')
INSERT [dbo].[tblHoaDon] ([maHoaDon], [maNhanVien], [maKhachHang], [ngayBanHang], [tongTien], [ghiChu]) VALUES (10, 1, 1, CAST(0xD9410B00 AS Date), 160000, N'new new')
INSERT [dbo].[tblHoaDon] ([maHoaDon], [maNhanVien], [maKhachHang], [ngayBanHang], [tongTien], [ghiChu]) VALUES (11, 1, 1, CAST(0xD9410B00 AS Date), 160000, N'new new')
INSERT [dbo].[tblHoaDon] ([maHoaDon], [maNhanVien], [maKhachHang], [ngayBanHang], [tongTien], [ghiChu]) VALUES (12, 1, 1, CAST(0xD9410B00 AS Date), 200000, N'à')
INSERT [dbo].[tblHoaDon] ([maHoaDon], [maNhanVien], [maKhachHang], [ngayBanHang], [tongTien], [ghiChu]) VALUES (13, 1, 1, CAST(0xD9410B00 AS Date), 200000, N'á')
INSERT [dbo].[tblHoaDon] ([maHoaDon], [maNhanVien], [maKhachHang], [ngayBanHang], [tongTien], [ghiChu]) VALUES (14, 1, 1, CAST(0xD9410B00 AS Date), 200000, N'test ok')
SET IDENTITY_INSERT [dbo].[tblHoaDon] OFF
SET IDENTITY_INSERT [dbo].[tblKhachHang] ON 

INSERT [dbo].[tblKhachHang] ([maKhachHang], [tenKhachHang], [diaChi], [soDienThoai], [email]) VALUES (1, N'KH Thuậne', N'Bình Thạnh', N'123456', N'ndt@gmail.com')
SET IDENTITY_INSERT [dbo].[tblKhachHang] OFF
SET IDENTITY_INSERT [dbo].[tblLinhKien] ON 

INSERT [dbo].[tblLinhKien] ([maLinhKien], [tenLinhKien], [donGia], [ngayNhap], [soLuong], [maNhaCungCap], [maLoaiLinhKien]) VALUES (1, N'Intel i5 new', 100000, CAST(0xAB410B00 AS Date), 5, 1, N'1')
INSERT [dbo].[tblLinhKien] ([maLinhKien], [tenLinhKien], [donGia], [ngayNhap], [soLuong], [maNhaCungCap], [maLoaiLinhKien]) VALUES (2, N'Ram 8GB', 20000, CAST(0x8C410B00 AS Date), 1, 2, N'3')
INSERT [dbo].[tblLinhKien] ([maLinhKien], [tenLinhKien], [donGia], [ngayNhap], [soLuong], [maNhaCungCap], [maLoaiLinhKien]) VALUES (5, N'i3', 10000, CAST(0xAB410B00 AS Date), 9, 1, N'1')
INSERT [dbo].[tblLinhKien] ([maLinhKien], [tenLinhKien], [donGia], [ngayNhap], [soLuong], [maNhaCungCap], [maLoaiLinhKien]) VALUES (6, N'i7', 10000, CAST(0x8C410B00 AS Date), 0, 1, N'1')
SET IDENTITY_INSERT [dbo].[tblLinhKien] OFF
INSERT [dbo].[tblLoaiLinhKien] ([maLoaiLinhKien], [tenLoaiLinhKien]) VALUES (N'1', N'CPU')
INSERT [dbo].[tblLoaiLinhKien] ([maLoaiLinhKien], [tenLoaiLinhKien]) VALUES (N'2', N'MAIN')
INSERT [dbo].[tblLoaiLinhKien] ([maLoaiLinhKien], [tenLoaiLinhKien]) VALUES (N'3', N'RAM')
INSERT [dbo].[tblLoaiLinhKien] ([maLoaiLinhKien], [tenLoaiLinhKien]) VALUES (N'4', N'PSU')
INSERT [dbo].[tblLoaiLinhKien] ([maLoaiLinhKien], [tenLoaiLinhKien]) VALUES (N'5', N'MONITOR')
INSERT [dbo].[tblLoaiLinhKien] ([maLoaiLinhKien], [tenLoaiLinhKien]) VALUES (N'6', N'CASE')
INSERT [dbo].[tblLoaiLinhKien] ([maLoaiLinhKien], [tenLoaiLinhKien]) VALUES (N'7', N'FAN')
INSERT [dbo].[tblLoaiLinhKien] ([maLoaiLinhKien], [tenLoaiLinhKien]) VALUES (N'8', N'CABLE')
SET IDENTITY_INSERT [dbo].[tblNhaCungCap] ON 

INSERT [dbo].[tblNhaCungCap] ([maNhaCungCap], [tenNhaCungCap]) VALUES (1, N'Phong Vũ')
INSERT [dbo].[tblNhaCungCap] ([maNhaCungCap], [tenNhaCungCap]) VALUES (2, N'GearVN')
INSERT [dbo].[tblNhaCungCap] ([maNhaCungCap], [tenNhaCungCap]) VALUES (3, N'XGear')
SET IDENTITY_INSERT [dbo].[tblNhaCungCap] OFF
SET IDENTITY_INSERT [dbo].[tblNhanVien] ON 

INSERT [dbo].[tblNhanVien] ([maNhanVien], [tenNhanVien], [diaChi], [soDienThoai]) VALUES (1, N'NV Thuận', N'Gò Vấp', N'123456')
INSERT [dbo].[tblNhanVien] ([maNhanVien], [tenNhanVien], [diaChi], [soDienThoai]) VALUES (2, N'NV Hiếu', N'Bình Thạnh', N'123456')
SET IDENTITY_INSERT [dbo].[tblNhanVien] OFF
SET IDENTITY_INSERT [dbo].[tblTaiKhoan] ON 

INSERT [dbo].[tblTaiKhoan] ([maTaiKhoan], [tenTaiKhoan], [matKhau], [maNhanVien], [quyen]) VALUES (3, N'admin', N'123', 1, N'admin')
INSERT [dbo].[tblTaiKhoan] ([maTaiKhoan], [tenTaiKhoan], [matKhau], [maNhanVien], [quyen]) VALUES (4, N'nhanvien', N'123', 2, N'user')
SET IDENTITY_INSERT [dbo].[tblTaiKhoan] OFF
ALTER TABLE [dbo].[tblChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([maHoaDon])
REFERENCES [dbo].[tblHoaDon] ([maHoaDon])
GO
ALTER TABLE [dbo].[tblChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([maLinhKien])
REFERENCES [dbo].[tblLinhKien] ([maLinhKien])
GO
ALTER TABLE [dbo].[tblHoaDon]  WITH CHECK ADD FOREIGN KEY([maKhachHang])
REFERENCES [dbo].[tblKhachHang] ([maKhachHang])
GO
ALTER TABLE [dbo].[tblHoaDon]  WITH CHECK ADD FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[tblNhanVien] ([maNhanVien])
GO
ALTER TABLE [dbo].[tblLinhKien]  WITH CHECK ADD FOREIGN KEY([maLoaiLinhKien])
REFERENCES [dbo].[tblLoaiLinhKien] ([maLoaiLinhKien])
GO
ALTER TABLE [dbo].[tblLinhKien]  WITH CHECK ADD FOREIGN KEY([maNhaCungCap])
REFERENCES [dbo].[tblNhaCungCap] ([maNhaCungCap])
GO
ALTER TABLE [dbo].[tblTaiKhoan]  WITH CHECK ADD FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[tblNhanVien] ([maNhanVien])
GO
USE [master]
GO
ALTER DATABASE [QuanLyLinhKien] SET  READ_WRITE 
GO
