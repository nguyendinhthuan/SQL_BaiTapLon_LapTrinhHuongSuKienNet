create database QuanLyLinhKien

create table tblKhachHang(
	maKhachHang nvarchar(50) primary key,
	tenKhachHang nvarchar(50) NOT NULL,
	diaChi nvarchar (50) NOT NULL,
	soDienThoai nvarchar(50) NOT NULL,
	email nvarchar(50) NOT NULL
)

create table tblNhaCungCap(
	maNhaCungCap nvarchar(50) primary key,
	tenNhaCungCap nvarchar(50)
)

create table tblLoaiLinhKien(
	maLoaiLinhKien nvarchar(50) primary key,
	tenLoaiLinhKien nvarchar(50)
)

create table tblLinhKien(
	maLinhKien nvarchar(50) primary key,
	tenLinhKien nvarchar(50) NOT NULL,
	donGia float NOT NULL,
	ngayNhap date NOT NULL,
	maNhaCungCap nvarchar (50) NOT NULL,
	trangThai nvarchar(50) NOT NULL,
	maLoaiLinhKien nvarchar(50),
	FOREIGN KEY (maNhaCungCap) REFERENCES tblNhaCungCap(maNhaCungCap),
	FOREIGN KEY (maLoaiLinhKien) REFERENCES tblLoaiLinhKien(maLoaiLinhKien)
)

create table tblPhanQuyen(
	maPhanQuyen nvarchar(50) primary key,
	tenPhanQuyen nvarchar(50) NOT NULL,
	ghiChu nvarchar(50)
)

create table tblNhanVien(
	maNhanVien nvarchar(50) primary key,
	tenNhanVien nvarchar(50) NOT NULL,
	diaChi nvarchar(50) NOT NULL, 
	soDienThoai nvarchar(50) NOT NULL
)

create table tblTaiKhoan(
	maTaiKhoan nvarchar(50) primary key,
	tenTaiKhoan nvarchar(50) NOT NULL,
	matKhau nvarchar(50) NOT NULL,
	maNhanVien nvarchar(50),
	FOREIGN KEY (maNhanVien) REFERENCES tblNhanVien(maNhanVien)
)

create table tblNhanVien_PhanQuyen(
	maPhanQuyen nvarchar(50) NOT NULL,
	maTaiKhoan nvarchar(50) NOT NULL,
	FOREIGN KEY (maTaiKhoan) REFERENCES tblTaiKhoan(maTaiKhoan),
	FOREIGN KEY (maPhanQuyen) REFERENCES tblPhanQuyen(maPhanQuyen)
)

create table tblHoaDon(
	maHoaDon nvarchar(50) primary key,
	maNhanVien nvarchar(50) NOT NULL,
	maKhachHang nvarchar(50) NOT NULL,
	maLinhKien nvarchar(50) NOT NULL,
	ngayDatHang date NOT NULL,
	ngayGiaoHang date NOT NULL,
	noiNhan nvarchar(50),
	tongTien float NOT NULL,
	ghiChu nvarchar(50),
	trangThai nvarchar(50),
	FOREIGN KEY (maNhanVien) REFERENCES tblNhanVien(maNhanVien),
	FOREIGN KEY (maKhachHang) REFERENCES tblKhachHang(maKhachHang)
)

create table tblChiTietHoaDon(
	maHoaDon nvarchar(50),
	maLinhKien nvarchar(50),
	soLuong int NOT NULL,
	donGia float NOT NULL,
	giamGia nvarchar(50),
	FOREIGN KEY (maHoaDon) REFERENCES tblHoaDon(maHoaDon),
	FOREIGN KEY (maLinhKien) REFERENCES tblLinhKien(maLinhKien)
)
