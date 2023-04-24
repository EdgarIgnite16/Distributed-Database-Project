IF EXISTS (SELECT name FROM master.sys.databases WHERE name = N'KingFastFood')
	BEGIN
		PRINT 'MyCheck! Drop Database and regenerate again!'
		USE master
		DROP DATABASE [KingFastFood]
	END
GO


CREATE DATABASE [KingFastFood]
GO

USE [KingFastFood]
GO

-----------------------------------------------------------------------------------------
/****** Object:  Table [dbo].[ChiNhanh] ******/
CREATE TABLE [dbo].[ChiNhanh](
	[MaCN] [varchar](13) NOT NULL,
	[TenCN] [nvarchar](20) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL
)
GO

/****** Object:  Table [dbo].[CheBien] ******/
CREATE TABLE [dbo].[CheBien](
	[MaMA] [varchar](13) NOT NULL,
	[MANL] [varchar](13) NOT NULL,
	[SoLuong] [int] NOT NULL,
 	CONSTRAINT [PK_CheBien] PRIMARY KEY (MaMA, MANL)
) 
GO

/****** Object:  Table [dbo].[ChucVu] ******/

CREATE TABLE [dbo].[ChucVu](
	[MaCV] [varchar](13) NOT NULL,
	[TenCV] [nvarchar](30) NOT NULL,
 	CONSTRAINT [PK_ChucVU] PRIMARY KEY (MaCV)
) 
GO

/****** Object:  Table [dbo].[CTHD] ******/
CREATE TABLE [dbo].[CTHD](
	[MaHD] [varchar](13) NOT NULL,
	[MaMA] [varchar](13) NOT NULL,
	[SoLuong] [int] NOT NULL,
 	CONSTRAINT [PK_CTHD] PRIMARY KEY (MaHD, MaMA)
) 
GO

/****** Object:  Table [dbo].[CTPN] ******/
CREATE TABLE [dbo].[CTPN](
	[MaPhieuNhap] [varchar](13) NOT NULL,
	[MaNL] [varchar](13) NOT NULL,
	[SL_Nhap] [int] NOT NULL,
	CONSTRAINT [PK_CTPN] PRIMARY KEY (MaPhieuNhap, MaNL)
) 
GO

/****** Object:  Table [dbo].[CTK] ******/
CREATE TABLE [dbo].[CTK](
	[MaCN] [varchar](13) NOT NULL,
	[MaNL] [varchar](13) NOT NULL,
	[SL_Nhap] [int] NOT NULL,
	CONSTRAINT [PK_CTK] PRIMARY KEY (MaCN, MaNL)
) 
GO

/****** Object:  Table [dbo].[HoaDon] ******/
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [varchar](13) NOT NULL,
	[MaNV] [varchar](13) NOT NULL,
	[MaKH] [varchar](13) NOT NULL,
	[MaGiamGia] [varchar](13) NOT NULL,
	[NgayBan] [datetime] NOT NULL,
	[TongHoaDon] [float] NOT NULL,
	CONSTRAINT [PK_HoaDon] PRIMARY KEY (MaHD)
)
GO

/****** Object:  Table [dbo].[KhachHang] ******/
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [varchar](13) NOT NULL,
	[TenKH] [nvarchar](30) NOT NULL,
	[SDT] [nchar](10) NOT NULL,
	CONSTRAINT [PK_KhachHang] PRIMARY KEY (MaKH)
)
GO

/****** Object:  Table [dbo].[MonAn] ******/
CREATE TABLE [dbo].[MonAn](
	[MaMA] [varchar](13) NOT NULL,
	[TenMA] [nvarchar](30) NOT NULL,
	[DonGia] [float] NOT NULL,
	[SoLuong] [int] NOT NULL,
 	CONSTRAINT [PK_MonAn] PRIMARY KEY (MaMA)
)
GO

/****** Object:  Table [dbo].[NguyenLieu] ******/
CREATE TABLE [dbo].[NguyenLieu](
	[MaNL] [varchar](13) NOT NULL,
	[TenNL] [nvarchar](30) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[PhanLoai] [nvarchar](30) NOT NULL,
	[DonVi] [nvarchar](10) NOT NULL,
	[MaCN] [varchar](13) NOT NULL,
	CONSTRAINT [PK_NguyenLieu] PRIMARY KEY (MaNL)
) 
GO

/****** Object:  Table [dbo].[NhaCungCap] ******/
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [varchar](13) NOT NULL,
	[TenNCC] [nvarchar](30) NOT NULL,
	[SDT] [nchar](10) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
 	CONSTRAINT [PK_NhaCungCap] PRIMARY KEY (MaNCC)
) 
GO

/****** Object:  Table [dbo].[NhanVien] ******/
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [varchar](13) NOT NULL,
	[MaCV] [varchar](13) NOT NULL,
	[TenNV] [nvarchar](30) NOT NULL,
	[CMND] [nchar](12) NOT NULL,
	[SDT] [nchar](10) NOT NULL,
	[MaCN] [varchar](13) NOT NULL,
 	CONSTRAINT [PK_NhanVien] PRIMARY KEY (MaNV)
)
GO

/****** Object:  Table [dbo].[PhieuGiamGia] ******/
CREATE TABLE [dbo].[PhieuGiamGia](
	[MaGiamGia] [varchar](13) NOT NULL,
	[NoiDung] [nvarchar](30) NOT NULL,
	[TileGiam] [float] NOT NULL,
 	CONSTRAINT [PK_PhieuGiamGia] PRIMARY KEY (MaGiamGia)
) 
GO

/****** Object:  Table [dbo].[PhieuNhap] ******/
CREATE TABLE [dbo].[PhieuNhap](
	[MaPhieuNhap] [varchar](13) NOT NULL,
	[MaNCC] [varchar](13) NOT NULL,
	[NgayNhap] [date] NOT NULL,
 	CONSTRAINT [PK_PhieuNhap] PRIMARY KEY (MaPhieuNhap)
)
GO

/****** Object:  Table [dbo].[CaLamViec] ******/
-- CREATE TABLE [dbo].[CaLamViec](
-- 	[MaCa] [varchar](13) NOT NULL,
-- 	[TenCa] [nvarchar](30) NOT NULL,
-- 	[thoiGian] [nvarchar](30) NOT NULL,
--  	CONSTRAINT [PK_CaLamViec] PRIMARY KEY (MaCa)
-- ) 
-- GO

-----------------------------------------------------------------------------------------
-- Tạo ràng buộc toàn vẹn 
-- Bảng ChiNhanh và Bảng NhanVien
ALTER TABLE [dbo].[ChiNhanh] 
ADD CONSTRAINT [FK_ChiNhanh_NhanVien] 
FOREIGN KEY([MaCN]) REFERENCES [dbo].[NhanVien] ([MaCN])
GO

-- Bảng ChiNhanh và Bảng NguyenLieu
ALTER TABLE [dbo].[ChiNhanh] 
ADD CONSTRAINT [FK_ChiNhanh_NguyenLieu] 
FOREIGN KEY([MaCN]) REFERENCES [dbo].[MonAn] ([MaCN])
GO

-- Bảng CheBien và Bảng MonAn
ALTER TABLE [dbo].[CheBien] 
ADD CONSTRAINT [FK_CheBien_MonAn] 
FOREIGN KEY([MaMA]) REFERENCES [dbo].[MonAn] ([MaMA])
GO

-- Bảng CheBien và Bảng NguyenLieu
ALTER TABLE [dbo].[CheBien] 
ADD CONSTRAINT [FK_CheBien_NguyenLieu] 
FOREIGN KEY([MANL]) REFERENCES [dbo].[NguyenLieu] ([MaNL])
GO

-- Bảng CTHD và Bảng HoaDon
ALTER TABLE [dbo].[CTHD] 
ADD CONSTRAINT [FK_CTHD_HoaDon] 
FOREIGN KEY([MaHD]) REFERENCES [dbo].[HoaDon] ([MaHD])
GO

-- Bảng CTHD và Bảng MonAn
ALTER TABLE [dbo].[CTHD] 
ADD CONSTRAINT [FK_CTHD_MonAn] 
FOREIGN KEY([MaMA]) REFERENCES [dbo].[MonAn] ([MaMA])
GO

-- Bảng CTPN và Bảng NguyenLieu
ALTER TABLE [dbo].[CTPN]
ADD CONSTRAINT [FK_CTPN_NguyenLieu] 
FOREIGN KEY([MaNL]) REFERENCES [dbo].[NguyenLieu] ([MaNL])
GO

-- Bảng CTK và Bảng ChiNhanh
ALTER TABLE [dbo].[CTK]
ADD CONSTRAINT [FK_CTK_ChiNhanh]
FOREIGN KEY([MaCN]) REFERENCES [dbo].[ChiNhanh] ([MaCN])
GO

-- Bảng CTK và Bảng NguyenLieu
ALTER TABLE [dbo].[CTK]
ADD CONSTRAINT [FK_CTK_NguyenLieu]
FOREIGN KEY([MaNL]) REFERENCES [dbo].[NguyenLieu] ([MaNL])
GO

-- Bảng CTPN và Bảng PhieuNhap
ALTER TABLE [dbo].[CTPN] 
ADD CONSTRAINT [FK_CTPN_PN] 
FOREIGN KEY([MaPhieuNhap]) REFERENCES [dbo].[PhieuNhap] ([MaPhieuNhap])
GO

-- Bảng HoaDon và Bảng KhachHang
ALTER TABLE [dbo].[HoaDon]
ADD CONSTRAINT [FK_HoaDon_KhachHang] 
FOREIGN KEY([MaKH]) REFERENCES [dbo].[KhachHang] ([MaKH])
GO

-- Bảng HoaDon và Bảng NhanVien
ALTER TABLE [dbo].[HoaDon] 
ADD CONSTRAINT [FK_HoaDon_NhanVien] 
FOREIGN KEY([MaNV]) REFERENCES [dbo].[NhanVien] ([MaNV])
GO

-- Bảng HoaDon và Bảng PhieuGiamGia
ALTER TABLE [dbo].[HoaDon] 
ADD CONSTRAINT [FK_HoaDon_PhieuGiamGia]
FOREIGN KEY([MaGiamGia]) REFERENCES [dbo].[PhieuGiamGia] ([MaGiamGia])
GO

-- Bảng NhanVien và Bảng ChucVu
ALTER TABLE [dbo].[NhanVien] 
ADD  CONSTRAINT [FK_NhanVien_ChucVU]
FOREIGN KEY([MaCV]) REFERENCES [dbo].[ChucVu] ([MaCV])
GO

-- Bảng PhieuNhap và Bảng NhaCungCap
ALTER TABLE [dbo].[PhieuNhap] 
ADD CONSTRAINT [FK_PhieuNhap_NhaCungCap] 
FOREIGN KEY([MaNCC]) REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO

-- Bảng NhanVien và Bảng CaLamViec
-- ALTER TABLE [dbo].[NhanVien] 
-- ADD  CONSTRAINT [FK_NhanVien_CaLamViec] 
-- FOREIGN KEY([MaCa]) REFERENCES [dbo].[CaLamViec] ([MaCa])
-- GO

-----------------------------------------------------------------------------------------
-- Nhập dữ liệu cho các bảng
-- Bảng ChiNhanh
INSERT [dbo].[ChiNhanh] ([MaCN], [TenCN], [DiaChi]) VALUES('MIENBAC', N'Miền Bắc', N'Số 292 Bà Triệu, P. Lê Đại Hành, Q. Hai Bà Trưng, TP. Hà Nội.')
INSERT [dbo].[ChiNhanh] ([MaCN], [TenCN], [DiaChi]) VALUES('MIENTRUGN', N'Miền Trung', N'148 Nguyễn Văn Linh, phường Nam Dương, quận Hải Châu, Đà Nẵng')
INSERT [dbo].[ChiNhanh] ([MaCN], [TenCN], [DiaChi]) VALUES('MIENNAM', N'Miền Nam', N' 446 Lý Thường Kiệt, phường 7, quận Tân Bình, TP. HCM')

-- Bảng ChucVu
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES ('AD', N'Chủ nhà hàng')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES ('BP', N'Bếp phó')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES ('BT', N'Bếp trưởng')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES ('KTT', N'Kế toán trưởng')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES ('NVBH', N'Nhân viên bán hàng')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES ('NVBV', N'Nhân viên bảo vệ')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES ('NVGH', N'Nhân viên giao hàng')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES ('NVPV', N'Nhân viên phục vụ')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES ('PB', N'Phụ bếp')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES ('QLGS', N'Quản lí giám sát')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES ('QLK', N'Quản lí kho')
GO

-- Bảng NhanVien
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV002', 'BP', N'Quang Ngọc Trinh', N'079202034889', N'0909029548', 'MIENBAC')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV012', 'BT', N'Quang Ngọc', N'08702034889', N'0349029548', 'MIENBAC')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV004', 'KTT', N'Quốc Ân', N'079202022222', N'0202054988', 'MIENBAC')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV013', 'NVBV', N'Quân Huỳnh', N'07920202562', N'0362054988', 'MIENBAC')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV015', 'NVPV', N'Quân Phạm', N'09992020562', N'0346054988', 'MIENBAC')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV008', 'NVPV', N'Nguyễn Quang Triệu', N'079202034001', N'0909099284', 'MIENBAC')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV010', 'PB', N'Trần Thanh Long', N'079202078222', N'0606029548', 'MIENBAC')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV017', 'NVGH', N'Trần Thanh', N'080092078222', N'0967729548', 'MIENBAC')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV018', 'NVPV', N'Phạm Thanh', N'090099998222', N'0888889548', 'MIENBAC')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV019', 'NVPV', N'Phạm Quân', N'090099998222', N'0777889548', 'MIENBAC')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV003', 'BT', N'Nguyên Quân', N'079202034222', N'0101029488', 'MIENTRUNG')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV020', 'BP', N'Nguyên Tấn', N'079202034222', N'0701102488', 'MIENTRUNG')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV014', 'QLK', N'Nguyễn Tấn', N'089202534222', N'0311029488', 'MIENTRUNG')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV021', 'NVPV', N'Tấn Võ', N'089225399232', N'0311023388', 'MIENTRUNG')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV006', 'NVBV', N'Hải Dương', N'079202034666', N'0909029542', 'MIENTRUNG')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV009', 'QLGS', N'Nguyên Tam Hoàng', N'079202022202', N'0101052988', 'MIENTRUNG')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV023', 'NVPV', N'Hoàng Quân', N'073242223202', N'0910105238', 'MIENTRUNG')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV022', 'PB', N'Nguyên Hoàng', N'079777722202', N'0301052988', 'MIENTRUNG')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV016', 'NVGH', N'Nguyên Hoàng', N'09202022202', N'0301053588', 'MIENTRUNG')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV024', 'QLGS', N'Hoàng Huy', N'07901122202', N'0802352588', 'MIENTRUNG')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV025', 'QLGS', N'Nguyên Lộc', N'079202011188', N'0997029548', 'MIENNAM')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV001', 'NVBH', N'Nguyên Lộc', N'08902034888', N'0738029568', 'MIENNAM')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV005', 'NVBH', N'Quốc An', N'079202039999', N'0909029549', 'MIENNAM')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV026', 'NVPV', N'Quốc Siêu', N'079202032219', N'0309033549', 'MIENNAM')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV027', 'NVPV', N'Nguyễn Siêu', N'079211132219', N'0309113549', 'MIENNAM')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV007', 'NVGH', N'Long An', N'079202034111', N'0909299542', 'MIENNAM')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV028', 'NVPV', N'Song Long', N'079203333111', N'0999296642', 'MIENNAM')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV030', 'NVBH', N'Song Ngư', N'079202222511', N'0888296642', 'MIENNAM')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV011', 'QLK', N'Trần Quốc An Khánh', N'079202054888', N'0404029548', 'MIENNAM')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV029', 'QLK', N'Trần Quốc Khánh', N'089205554888', N'0804029548', 'MIENNAM')
GO

-- Bảng KhachHang
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH000', N'Khách hàng vãng lại', N'0909098687')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH001', N'Trần Quang Long', N'0909029548')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH002', N'Hồ Sĩ Minh', N'0202054922')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH003', N'Quang Triệu', N'0202949882')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH004', N'Nguyễn Quốc Siêu', N'0101092884')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH005', N'Lâm Triệu Khánh', N'0202021938')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH006', N'Quốc Triệu Phong', N'0902932149')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH007', N'Nguyễn Lâm Chung', N'0021231234')
GO

-- Bảng PhieuGiamGia
INSERT [dbo].[PhieuGiamGia] ([MaGiamGia], [NoiDung], [TileGiam]) VALUES ('GIAMGIA10', N'Giảm giá 10%', 0.1)
INSERT [dbo].[PhieuGiamGia] ([MaGiamGia], [NoiDung], [TileGiam]) VALUES ('GIAMGIA15', N'Giảm giá 15%', 0.15)
INSERT [dbo].[PhieuGiamGia] ([MaGiamGia], [NoiDung], [TileGiam]) VALUES ('GIAMGIA20', N'Giảm giá 20%', 0.2)
INSERT [dbo].[PhieuGiamGia] ([MaGiamGia], [NoiDung], [TileGiam]) VALUES ('GIAMGIA5', N'Giảm giá 5%', 0.05)
INSERT [dbo].[PhieuGiamGia] ([MaGiamGia], [NoiDung], [TileGiam]) VALUES ('KHONG', N'Không giảm', 0)
GO

-- Bảng NhaCungCap
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES ('ATA', N'Atana Tatic Action', N'0129548726', N'299/4 Tân Thuận Mỹ, Q9, TpHCM')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES ('AVA', N'Action Venti Asstis', N'0905294874', N'199/12 Nguyễn Lâm Đồng, Q4, TpHCM')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES ('PA', N'Penta Asstis', N'0909020594', N'174/4 An Dương Vương, Q5, TpHCM')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES ('PTP', N'Penta Tatic Papic', N'0202059487', N'312/12 Nguyễn Văn Cừ, Q2, TpHCM')
GO

-- Bảng PhieuNhap
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNCC], [NgayNhap]) VALUES ('PN0001', 'ATA', CAST(N'2021-12-12' AS Date))
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNCC], [NgayNhap]) VALUES ('PN0002', 'PA', CAST(N'2022-12-21' AS Date))
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNCC], [NgayNhap]) VALUES ('PN0003', 'PTP ', CAST(N'2022-12-22' AS Date))
GO

-- Bảng NguyenLieu
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('BUT1', N'Trái Bơ', N'Trái Cây', N'kg')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('BUT1', N'Bơ', 154, N'Bơ', N'kg', 'MIENTRUNG')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('BUT1', N'Bơ', 200, N'Bơ', N'kg', 'MIENNAM')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('FLO1', N'Bột chiên giòn', 421, N'Bột', N'kg', 'MIENBAC')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('FLO1', N'Bột chiên giòn', 400, N'Bột', N'kg', 'MIENTRUNG')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('FLO1', N'Bột chiên giòn', 450, N'Bột', N'kg', 'MIENNAM')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('FLO2', N'Bột mì số 8', 10, N'Bột', N'kg', 'MIENBAC')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('FLO2', N'Bột mì số 8', 10, N'Bột', N'kg', 'MIENNAM')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('FLO3', N'Bột mì số 11', 10, N'Bột', N'kg', 'MIENTRUNG')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('FLO3', N'Bột mì số 11', 10, N'Bột', N'kg', 'MIENNAM')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('FLO4', N'Bột năng', 10, N'Bột', N'kg', 'MIENBAC')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('FLO5', N'Bột nếp', 20, N'Bột', N'kg', 'MIENTRUNG')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('FLO6', N'Bột nở', 212, N'Bột', N'kg', 'MIENNAM')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('FLO7', N'Bột xù', 20, N'Bột', N'kg', 'MIENBAC')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('FLO7', N'Bột xù', 15, N'Bột', N'kg', 'MIENTRUNG')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('FLO7', N'Bột xù', 19, N'Bột', N'kg', 'MIENNAM')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('FRUI01', N'Chanh Dây', 200, N'Hoa quả', N'kg', 'MIENBAC')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('FRUI02', N'Chanh xanh', 200, N'Hoa quả', N'kg', 'MIENTRUNG')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('FRUI03', N'Cam xanh', 200, N'Hoa quả', N'kg', 'MIENNAM')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('MEA1', N'Sườn heo', 20, N'Thịt', N'kg', 'MIENBAC')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('MEA1', N'Sườn heo', 30, N'Thịt', N'kg', 'MIENTRUNG')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('MEA1', N'Sườn heo', 25, N'Thịt', N'kg', 'MIENNAM')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('MEA2', N'Đùi gà', 20, N'Thịt', N'kg', 'MIENBAC')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('MEA3', N'Ức gà file', 20, N'Thịt', N'kg', 'MIENTRUNG')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('MEA4', N'Cánh gà', 60, N'Thịt', N'kg', 'MIENNAM')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('MEA5', N'FIle bò', 10, N'Thịt', N'kg', 'MIENBAC')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('MEA6', N'Steak bò', 100, N'Thịt', N'kg', 'MIENNAM')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('OIL1', N'Dầu ăn', 10, N'Dầu', N'L', 'MIENBAC')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('OIL1', N'Dầu ăn', 15, N'Dầu', N'L', 'MIENTRUNG')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('OIL2', N'Dầu hào', 22, N'Dầu', N'L', 'MIENNAM')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('OR1', N'Tỏi tươi', 200, N'Gia vị', N'kg', 'MIENBAC')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('RIC1', N'Gạo', 20, N'Gạo', N'kg', 'MIENBAC')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('RIC1', N'Gạo', 25, N'Gạo', N'kg', 'MIENTRUNG')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('RIC1', N'Gạo', 30, N'Gạo', N'kg', 'MIENNAM')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('SPI1', N'Bột ngọt', 12, N'Gia vị', N'kg', 'MIENBAC')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('SPI1', N'Bột ngọt', 15, N'Gia vị', N'kg', 'MIENTRUNG')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('SPI1', N'Bột ngọt', 20, N'Gia vị', N'kg', 'MIENNAM')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('SPI2', N'Đường cát trắng', 33, N'Gia vị', N'kg', 'MIENNAM')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('SPI3', N'Đường phèn', 366, N'Gia vị', N'kg', 'MIENBAC')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('SPI4', N'Muối Iot', 10, N'Gia vị', N'kg', 'MIENBAC')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('SPI4', N'Muối Iot', 10, N'Gia vị', N'kg', 'MIENTRUNG')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('SPI4', N'Muối Iot', 10, N'Gia vị', N'kg', 'MIENNAM')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('SPI5', N'Tiêu đen xay', 534, N'Gia vị', N'kg', 'MIENTRUNG')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('SPI5', N'Tiêu đen xay', 500, N'Gia vị', N'kg', 'MIENNAM')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('SPI6', N'Nước mắm', 53, N'Gia vị', N'kg', 'MIENNAM')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('SPI7', N'Nước mắm nhĩ', 200, N'Gia vị', N'kg', 'MIENBAC')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [SoLuong], [PhanLoai], [DonVi], [MaCN]) VALUES ('SPI7', N'Nước mắm nhĩ', 200, N'Gia vị', N'kg', 'MIENTRUNG')
GO

-- Bảng MonAn
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('BE01', N'Bánh mì nướng tiêu đen', 15000, 22)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('CHI01', N'Gà nướng tỏi', 125000, 10)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('CHI02', N'Gà chiên nước mắm', 75000, 20)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('CHI03', N'Gà chiên giòn', 55000, 35)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('CHI04', N'Ức gà nướng', 70000, 25)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('CHI05', N'Ức gà áp chảo', 77000, 19)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('RIC01', N'Cơm chiên sườn heo', 40000, 22)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('RIC02', N'Cơm chiên cánh gà', 45000, 12)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('RIC03', N'Cơm chiên đùi gà', 50000, 9)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('STE01', N'Steak tái chín', 1200000, 2)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('STE02', N'Steak tái mắm nhĩ', 1000000, 3)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('STE03', N'Steak tái tiêu đen', 1000000, 4)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('WT1', N'Nước lọc', 10000, 200)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('WT2', N'Nước có ga', 12000, 200)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('WT3', N'Nước chanh tươi', 15000, 10)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('WT4', N'Nước chanh dây', 15000, 14)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('WT5', N'Nước cam ', 17000, 8)
GO

-- Bảng HoaDon
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0001', 'NV004', 'KH001', N'KHONG', CAST(N'2022-12-22T17:22:17.000' AS DateTime), 30000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0002', 'NV002', 'KH004', N'KHONG', CAST(N'2022-12-30T13:12:05.000' AS DateTime), 310000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0003', 'NV002', 'KH001', N'GIAMGIA10', CAST(N'2022-11-09T08:12:01.000' AS DateTime), 1026000)
GO

-- Bảng CheBien
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('BE01', 'FLO3', 3)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('BE01', 'OIL1', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('BE01', 'OR1',1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('BE01', 'SPI4', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('BE01', 'SPI5', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('CHI01', 'BUT1', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('CHI01', 'MEA2', 2)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('CHI01', 'OR1',3)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('CHI02', 'MEA2', 2)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('CHI02', 'OIL1', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('CHI02', 'SPI6', 2)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('CHI03', 'MEA2', 2)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('CHI03', 'OIL1', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('CHI04', 'MEA3', 2)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('CHI04', 'SPI4', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('CHI05', 'BUT1', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('CHI05', 'MEA3', 2)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('RIC01', 'MEA1', 3)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('RIC01', 'OIL1', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('RIC01', 'RIC1', 3)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('RIC02', 'MEA4', 3)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('RIC02', 'OIL1', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('RIC02', 'RIC1', 3)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('RIC03', 'MEA2', 3)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('RIC03', 'OIL1', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('RIC03', 'RIC1', 3)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('STE01', 'MEA6', 2)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('STE01', 'OIL1', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('STE02', 'MEA6', 2)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('STE02', 'OIL1', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('STE02', 'SPI7', 2)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('STE03', 'MEA6', 2)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('STE03', 'OIL1', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('STE03', 'SPI5', 3)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('WT3', 'FRUI02', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('WT3', 'SPI2', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('WT4', 'FRUI01', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('WT4', 'SPI3', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('WT5', 'FRUI03', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('WT5', 'SPI2', 1)
GO

-- Bảng CTHD
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0001', 'BE01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0002', 'BE01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0002', 'CHI01', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0003', 'CHI04', 2)
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0003', 'STE02', 1)
GO

-- Bảng CTPN
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SL_Nhap]) VALUES ('PN0001', 'BUT1', 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SL_Nhap]) VALUES ('PN0001', 'FLO1', 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SL_Nhap]) VALUES ('PN0001', 'MEA4', 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SL_Nhap]) VALUES ('PN0001', 'SPI3', 20)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SL_Nhap]) VALUES ('PN0002', 'FLO3', 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SL_Nhap]) VALUES ('PN0002', 'MEA6', 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SL_Nhap]) VALUES ('PN0002', 'RIC1', 500)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SL_Nhap]) VALUES ('PN0003', 'FLO1', 120)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SL_Nhap]) VALUES ('PN0003', 'OR1', 120)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SL_Nhap]) VALUES ('PN0003', 'SPI4', 20)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SL_Nhap]) VALUES ('PN0003', 'SPI6', 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SL_Nhap]) VALUES ('PN0003', 'SPI7', 200)
GO

-- Bảng CTK
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES()

-- Bảng CaLamViec
-- INSERT [dbo].[CaLamViec] ([MaCa], [TenCa], [thoiGian]) VALUES (N'FU1', N'Fulltime sáng', N'6:00 - 14:00')
-- INSERT [dbo].[CaLamViec] ([MaCa], [TenCa], [thoiGian]) VALUES (N'FU2', N'Fulltime chiều', N'14:00 - 22:00')
-- INSERT [dbo].[CaLamViec] ([MaCa], [TenCa], [thoiGian]) VALUES (N'PA1', N'Parttime sáng', N'8:00 - 14:00')
-- INSERT [dbo].[CaLamViec] ([MaCa], [TenCa], [thoiGian]) VALUES (N'PA2', N'Parttime', N'16:00 - 22:00')
-- GO