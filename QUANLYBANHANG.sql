﻿CREATE DATABASE QUANLYCUAHANGDT
USE QUANLYCUAHANGDT

GO
CREATE TABLE ACCOUNT
( 
	Acc_id       INT not null,
	Username     VARCHAR(20) not null,
	Display_name NVARCHAR(50) not null,
	MatKhau      VARCHAR(30) not null,
	LoaiTaiKhoan BIT not null,
	PRIMARY      KEY (Acc_id)
)
GO
CREATE TABLE KHACHHANG
(
	MaKH     CHAR(8) not null,
	Name     NVARCHAR(50) not null,
	GioiTinh NVARCHAR(5) not null,
	Diachi   NVARCHAR(100) not null,
	Phone    VARCHAR(11) not null,
	PRIMARY  KEY (MaKH)
)
GO 
CREATE TABLE NGUOIBANHANG
(
	MaNBH   CHAR(8) not null,
	TenNBH  NVARCHAR(50) not null,
	PRIMARY KEY (MaNBH)
)
GO
CREATE TABLE BAN
( 
	MaHD         CHAR(8) not null,
	MaKH         CHAR(8) not null,
	MaNBH        CHAR(8) not null,
	NgayBan      DATE not null,
	TongCong     FLOAT,
	Chietkhau	 INT,
	TongTienHang FLOAT,
	PRIMARY      KEY (MaHD),
	FOREIGN      KEY (MaKH) REFERENCES KHACHHANG,
	FOREIGN		 KEY (MaNBH) REFERENCES NGUOIBANHANG
)
GO 
CREATE TABLE HANG
(
	MaH     CHAR(5) not null,
	TenHang NVARCHAR(50) not null,
	DonGia  FLOAT not null,
	PRIMARY KEY (MaH)
)
GO 
CREATE TABLE BAN_CHI_TIET
(
	MaHD      CHAR(8) not null,
	MaH       CHAR(5) not null,
	ThanhTien FLOAT,
	SoLuong   INT not null,
	FOREIGN   KEY (MaHD) REFERENCES BAN,
	FOREIGN   KEY (MaH) REFERENCES HANG
)

------
INSERT INTO ACCOUNT VALUES ('01', 'quanly', N'Quản Lý Bán Hàng', 'quanly001', 0)
INSERT INTO ACCOUNT VALUES ('02', 'nhanvien1', N'Tố Trinh', 'nhanvien002', 1)
INSERT INTO ACCOUNT VALUES ('03', 'nhanvien2', N'Hoài Việt', 'nhanvien003', 1)
INSERT INTO ACCOUNT VALUES ('04', 'nhanvien3', N'Hoàng Vương', 'nhanvien004', 1)	

INSERT INTO KHACHHANG VALUES ('00000001', N'Nguyễn Thị Hiền', N'Nữ', N'Thành phố Cẩm Phả, Quảng Ninh', '0943078855')
INSERT INTO KHACHHANG VALUES ('00000002', N'Nguyễn Hùng Dũng', N'Nam', N'Thành phố Cẩm Phả, Quảng Ninh', '0982805825')
INSERT INTO KHACHHANG VALUES ('00000003', N'Trần Văn Hùng', N'Nam', N'Thành phố Cẩm Phả, Quảng Ninh', '0969590517')
INSERT INTO KHACHHANG VALUES ('00000004', N'Lê Đình Lý', N'Nam', N'Thành phố Cẩm Phả, Quảng Ninh', '0935700123')
INSERT INTO KHACHHANG VALUES ('00000005', N'Nguyễn Thị Dung', N'Nữ', N'Thành phố Cẩm Phả, Quảng Ninh', '0975208772')

INSERT INTO NGUOIBANHANG VALUES ('NBH00001', N'Mr - Phương')
INSERT INTO NGUOIBANHANG VALUES ('NBH00002', N'Mr - Hải')

INSERT INTO HANG VALUES ('SP001', N'iphone 12', 20490000)
INSERT INTO HANG VALUES ('SP002', N'iphone 13 Pro Max', 33990000)
INSERT INTO HANG VALUES ('SP003', N'iphone 13 Pro', 29990000)
INSERT INTO HANG VALUES ('SP004', N'iphone 12 Pro Max', 31490000)
INSERT INTO HANG VALUES ('SP005', N'iphone 12 Pro', 28490000)
INSERT INTO HANG VALUES ('SP006', N'iphone 13', 23990000)
INSERT INTO HANG VALUES ('SP007', N'iphone 13 mini', 21990000)
INSERT INTO HANG VALUES ('SP008', N'iphone 12 mini', 16490000)
INSERT INTO HANG VALUES ('SP009', N'iphone 11', 16990000)
INSERT INTO HANG VALUES ('SP010', N'iphone XR', 13490000)
INSERT INTO HANG VALUES ('SP011', N'iphone SE 2020', 12490000)
INSERT INTO HANG VALUES ('SP012', N'iphone SE 2020 new', 11990000)

INSERT INTO BAN (MaHD, MaKH, MaNBH, NgayBan, Chietkhau)
VALUES ('HD000001', '00000001', 'NBH00001', '2021/02/05', 0)
INSERT INTO BAN (MaHD, MaKH, MaNBH, NgayBan, Chietkhau)
VALUES ('HD000002', '00000002', 'NBH00001', '2021/02/26', 0)
INSERT INTO BAN (MaHD, MaKH, MaNBH, NgayBan, Chietkhau)
VALUES ('HD000003', '00000003', 'NBH00001', '2021/06/16', 0)
INSERT INTO BAN (MaHD, MaKH, MaNBH, NgayBan, Chietkhau)
VALUES ('HD000004', '00000004', 'NBH00002', '2021/08/22', 0)
INSERT INTO BAN (MaHD, MaKH, MaNBH, NgayBan, Chietkhau)
VALUES ('HD000005', '00000005', 'NBH00002', '2021/09/18', 0)

INSERT INTO BAN_CHI_TIET(MaHD, MaH, SoLuong)
VALUES('HD000001', 'SP001', 15)
INSERT INTO BAN_CHI_TIET(MaHD, MaH, SoLuong)
VALUES('HD000001', 'SP002', 5)
INSERT INTO BAN_CHI_TIET(MaHD, MaH, SoLuong)
VALUES('HD000001', 'SP003', 6)
INSERT INTO BAN_CHI_TIET(MaHD, MaH, SoLuong)
VALUES('HD000001', 'SP004', 4)
INSERT INTO BAN_CHI_TIET(MaHD, MaH, SoLuong)
VALUES('HD000001', 'SP005', 2)
INSERT INTO BAN_CHI_TIET(MaHD, MaH, SoLuong)
VALUES('HD000001', 'SP006', 3)
INSERT INTO BAN_CHI_TIET(MaHD, MaH, SoLuong)
VALUES('HD000001', 'SP007', 10)
INSERT INTO BAN_CHI_TIET(MaHD, MaH, SoLuong)
VALUES('HD000002', 'SP001', 4)
INSERT INTO BAN_CHI_TIET(MaHD, MaH, SoLuong)
VALUES('HD000002', 'SP012', 4)
INSERT INTO BAN_CHI_TIET(MaHD, MaH, SoLuong)
VALUES('HD000002', 'SP011', 6)
INSERT INTO BAN_CHI_TIET(MaHD, MaH, SoLuong)
VALUES('HD000002', 'SP010', 8)
INSERT INTO BAN_CHI_TIET(MaHD, MaH, SoLuong)
VALUES('HD000003', 'SP001', 5)
INSERT INTO BAN_CHI_TIET(MaHD, MaH, SoLuong)
VALUES('HD000003', 'SP009', 5)
INSERT INTO BAN_CHI_TIET(MaHD, MaH, SoLuong)
VALUES('HD000003', 'SP008', 9)
INSERT INTO BAN_CHI_TIET(MaHD, MaH, SoLuong)
VALUES('HD000003', 'SP007', 7)
INSERT INTO BAN_CHI_TIET(MaHD, MaH, SoLuong)
VALUES('HD000004', 'SP002', 2)
INSERT INTO BAN_CHI_TIET(MaHD, MaH, SoLuong)
VALUES('HD000004', 'SP003', 3)
INSERT INTO BAN_CHI_TIET(MaHD, MaH, SoLuong)
VALUES('HD000004', 'SP004', 2)
INSERT INTO BAN_CHI_TIET(MaHD, MaH, SoLuong)
VALUES('HD000004', 'SP007', 1)
INSERT INTO BAN_CHI_TIET(MaHD, MaH, SoLuong)
VALUES('HD000005', 'SP010', 3)
INSERT INTO BAN_CHI_TIET(MaHD, MaH, SoLuong)
VALUES('HD000005', 'SP009', 3)

-----   
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DonGia FROM HANG WHERE MaH = 'SP001')
WHERE MaHD = 'HD000001' AND MaH = 'SP001' 
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DonGia FROM HANG WHERE MaH = 'SP002')
WHERE MaHD = 'HD000001' AND MaH = 'SP002' 
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DonGia FROM HANG WHERE MaH = 'SP003')
WHERE MaHD = 'HD000001' AND MaH = 'SP003'  
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DonGia FROM HANG WHERE MaH = 'SP004')
WHERE MaHD = 'HD000001' AND MaH = 'SP004' 
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DonGia FROM HANG WHERE MaH = 'SP005')
WHERE MaHD = 'HD000001' AND MaH = 'SP005' 
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DonGia FROM HANG WHERE MaH = 'SP006')
WHERE MaHD = 'HD000001' AND MaH = 'SP006' 
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DonGia FROM HANG WHERE MaH = 'SP007')
WHERE MaHD = 'HD000001' AND MaH = 'SP007' 

UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DonGia FROM HANG WHERE MaH = 'SP001')
WHERE MaHD = 'HD000002' AND MaH = 'SP001'
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DonGia FROM HANG WHERE MaH = 'SP012')
WHERE MaHD = 'HD000002' AND MaH = 'SP012' 
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DonGia FROM HANG WHERE MaH = 'SP011')
WHERE MaHD = 'HD000002' AND MaH = 'SP011' 
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DonGia FROM HANG WHERE MaH = 'SP010')
WHERE MaHD = 'HD000002' AND MaH = 'SP010'

UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DonGia FROM HANG WHERE MaH = 'SP001')
WHERE MaHD = 'HD000003' AND MaH = 'SP001'
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DonGia FROM HANG WHERE MaH = 'SP009')
WHERE MaHD = 'HD000003' AND MaH = 'SP009'
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DonGia FROM HANG WHERE MaH = 'SP008')
WHERE MaHD = 'HD000003' AND MaH = 'SP008'
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DonGia FROM HANG WHERE MaH = 'SP007')
WHERE MaHD = 'HD000003' AND MaH = 'SP007'

UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DonGia FROM HANG WHERE MaH = 'SP002')
WHERE MaHD = 'HD000004' AND MaH = 'SP002'
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DonGia FROM HANG WHERE MaH = 'SP003')
WHERE MaHD = 'HD000004' AND MaH = 'SP003'
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DonGia FROM HANG WHERE MaH = 'SP004')
WHERE MaHD = 'HD000004' AND MaH = 'SP004'
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DonGia FROM HANG WHERE MaH = 'SP007')
WHERE MaHD = 'HD000004' AND MaH = 'SP007'

UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DonGia FROM HANG WHERE MaH = 'SP010')
WHERE MaHD = 'HD000005' AND MaH = 'SP010'
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DonGia FROM HANG WHERE MaH = 'SP009')
WHERE MaHD = 'HD000005' AND MaH = 'SP009'

-------
UPDATE BAN
SET TongCong = (SELECT SUM(ThanhTien) FROM BAN_CHI_TIET WHERE MaHD = 'HD000001')
WHERE MaHD = 'HD000001'
UPDATE BAN
SET TongCong = (SELECT SUM(ThanhTien) FROM BAN_CHI_TIET WHERE MaHD = 'HD000002')
WHERE MaHD = 'HD000002'
UPDATE BAN
SET TongCong = (SELECT SUM(ThanhTien) FROM BAN_CHI_TIET WHERE MaHD = 'HD000003')
WHERE MaHD = 'HD000003'
UPDATE BAN
SET TongCong = (SELECT SUM(ThanhTien) FROM BAN_CHI_TIET WHERE MaHD = 'HD000004')
WHERE MaHD = 'HD000004'
UPDATE BAN
SET TongCong = (SELECT SUM(ThanhTien) FROM BAN_CHI_TIET WHERE MaHD = 'HD000005')
WHERE MaHD = 'HD000005'

-----
UPDATE BAN
SET TongTienHang = TongCong - Chietkhau
WHERE MaHD = 'HD000001'
UPDATE BAN
SET TongTienHang = TongCong - Chietkhau
WHERE MaHD = 'HD000002'
UPDATE BAN
SET TongTienHang = TongCong - Chietkhau
WHERE MaHD = 'HD000003'
UPDATE BAN
SET TongTienHang = TongCong - Chietkhau
WHERE MaHD = 'HD000004'
UPDATE BAN
SET TongTienHang = TongCong - Chietkhau
WHERE MaHD = 'HD000005'

------INDEX
CREATE INDEX IX_MaHang ON dbo.HANG(MaH)

------Security
CREATE LOGIN QUANLYBANHANG WITH PASSWORD='12345'
CREATE LOGIN NHANVIENBANHANG WITH PASSWORD='12345'

CREATE USER QUANLYBH FOR LOGIN QUANLYBANHANG
CREATE USER NHANVIENBH FOR LOGIN NHANVIENBANHANG


