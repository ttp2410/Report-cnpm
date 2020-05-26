create database QLNV
go

use QLNV

create table nhanvien
(
	manhanvien nvarchar(20) primary key,
	tennhanvien nvarchar(50),
	gioitinh nvarchar(1) check (gioitinh = 'N' or gioitinh = 'n'),
	cmnd nvarchar(20),
	sodienthoai nvarchar(15),
	ngaysinh date,
	chucvu nvarchar(50),
)

create table taikhoan
(
	manhanvien nvarchar(20) primary key,
	matkhau nvarchar(20),
	foreign key (manhanvien)
		references nhanvien(manhanvien),
)

create table quanli
(
	manhanvien nvarchar(20) primary key,
	foreign key (manhanvien)
		references nhanvien(manhanvien),
)

create table doanhthu
(
	maquanlithongke nvarchar(20),
	tongdoanhthu int,
	chitieu int,
	ngaythongke date,
	primary key(maquanlithongke, ngaythongke),
	foreign key (maquanlithongke)
		references quanli(manhanvien),
)

create table trangthietbi
(
	maquanlikiemtra nvarchar(20),
	mathietbi nvarchar(20),
	tenthietbi nvarchar(50),
	soluong int,
	ngaykiemtra date,
	primary key(maquanlikiemtra, mathietbi,ngaykiemtra),
	foreign key (maquanlikiemtra)
		references quanli(manhanvien),
)

create table khonguyenlieu
(
	maquanlikiemtra nvarchar(20),
	manguyenlieu nvarchar(20),
	tennguyenlieu nvarchar(50),
	noicungcap nvarchar(50),
	ngayhethan date,
	soluong int,
	ngaykiemtra date,
	primary key(maquanlikiemtra, manguyenlieu,ngaykiemtra),
	foreign key (maquanlikiemtra)
		references quanli(manhanvien),
)

create table thucdon
(
	maquanlilap nvarchar(20),
	tenthucdon nvarchar(50),
	ngaylap date,
	primary key(maquanlilap, ngaylap),
	foreign key (maquanlilap)
		references quanli(manhanvien),
)

create table hoadon
(
	mahoadon nvarchar(20) primary key,
	tonggiatien int,
)

create table khachhang
(
	makhachhang nvarchar(20),
	mahoadon nvarchar(20),
	manhanvienphucvu nvarchar(20),
	tenkhachahang nvarchar(50),
	gioitinh nvarchar(1) check (gioitinh = 'N' or gioitinh = 'n'),
	cmnd nvarchar(20),
	sodienthoai nvarchar(15),
	ngaysinh date,
	primary key(makhachhang,mahoadon,manhanvienphucvu),
	foreign key(makhachhang)
		references nhanvien(manhanvien),
	foreign key(mahoadon)
		references hoadon(mahoadon),
)

create table chitietdatmon
(
	mahoadon nvarchar(20),
	tenmatu nvarchar(50),
	giamatu int,
	soluong int,
	primary key(mahoadon,tenmatu),
	foreign key(mahoadon)
		references hoadon(mahoadon),
)

insert into nhanvien values
('NV1','So1','N','1','1','2000/04/25',N'Quản lí'),
('NV2','So2','n','2','2','2000/03/13',N'Nhân viên'),
('NV3','So3','n','3','3','2000/12/03',N'Nhân viên')

insert into taikhoan values
('NV1','123456'),
('NV2','654321')

insert into quanli values
('NV1')

insert into thucdon values
('NV1','B','2020/05/22'),
('NV1','A','2020/05/23')


select * from thucdon