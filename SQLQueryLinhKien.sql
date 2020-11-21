create database QuanLyLinhKien

create table tblKhachHang(
	maKhachHang int identity(1,1) primary key,
	tenKhachHang nvarchar(50) NOT NULL,
	diaChi nvarchar (50) NOT NULL,
	soDienThoai nvarchar(50) NOT NULL,
	email nvarchar(50) NOT NULL
)

create table tblNhaCungCap(
	maNhaCungCap int identity(1,1) primary key,
	tenNhaCungCap nvarchar(50)
)

create table tblLoaiLinhKien(
	maLoaiLinhKien int identity(1,1) primary key,
	tenLoaiLinhKien nvarchar(50)
)

create table tblLinhKien(
	maLinhKien int identity(1,1) primary key,
	tenLinhKien nvarchar(50) NOT NULL,
	donGia float NOT NULL,
	ngayNhap date NOT NULL,
	soLuong int NOT NULL,
	maNhaCungCap int NOT NULL,
	maLoaiLinhKien int,
	FOREIGN KEY (maNhaCungCap) REFERENCES tblNhaCungCap(maNhaCungCap),
	FOREIGN KEY (maLoaiLinhKien) REFERENCES tblLoaiLinhKien(maLoaiLinhKien)
)

/*Bo*/
--create table tblPhanQuyen(
--	maPhanQuyen nvarchar(50) primary key,
--	tenPhanQuyen nvarchar(50) NOT NULL,
--	ghiChu nvarchar(50)
--)

create table tblNhanVien(
	maNhanVien int identity(1,1) primary key,
	tenNhanVien nvarchar(50) NOT NULL,
	diaChi nvarchar(50) NOT NULL, 
	soDienThoai nvarchar(50) NOT NULL
)

create table tblTaiKhoan(
	maTaiKhoan int identity(1,1) primary key,
	tenTaiKhoan nvarchar(50) NOT NULL,
	matKhau nvarchar(50) NOT NULL,
	maNhanVien int,
	FOREIGN KEY (maNhanVien) REFERENCES tblNhanVien(maNhanVien)
)

/*Bo*/
--create table tblNhanVien_PhanQuyen(
--	maPhanQuyen nvarchar(50) NOT NULL,
--	maTaiKhoan nvarchar(50) NOT NULL,
--	FOREIGN KEY (maTaiKhoan) REFERENCES tblTaiKhoan(maTaiKhoan),
--	FOREIGN KEY (maPhanQuyen) REFERENCES tblPhanQuyen(maPhanQuyen)
--)

create table tblHoaDon(
	maHoaDon int identity(1,1) primary key,
	maNhanVien int NOT NULL,
	maKhachHang int NOT NULL,
	ngayBanHang date NOT NULL,
	tongTien float NOT NULL,
	ghiChu nvarchar(50),
	FOREIGN KEY (maNhanVien) REFERENCES tblNhanVien(maNhanVien),
	FOREIGN KEY (maKhachHang) REFERENCES tblKhachHang(maKhachHang)
)

create table tblChiTietHoaDon(
	maHoaDon int,
	maLinhKien int,
	soLuong int NOT NULL,
	donGia float NOT NULL,
	giamGia nvarchar(50),
	FOREIGN KEY (maHoaDon) REFERENCES tblHoaDon(maHoaDon),
	FOREIGN KEY (maLinhKien) REFERENCES tblLinhKien(maLinhKien)
)
