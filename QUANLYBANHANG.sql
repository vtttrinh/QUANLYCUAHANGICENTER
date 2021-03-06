CREATE DATABASE QUANLYCUAHANGDT
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
CREATE TABLE NGUOINHAPHANG
(
	MaNNH    CHAR(8) not null,
	TenNNH   NVARCHAR(50) not null,
	ChiNhanh NVARCHAR(100) not null,
	PRIMARY  KEY (MaNNH)
)
GO
CREATE TABLE NHACUNGCAP
(
	MaNCC   CHAR(8) not null,
	NhaCC   NVARCHAR(50) not null,
	DiaChi  NVARCHAR(100) not null,
	PRIMARY KEY(MaNCC)
)
GO
CREATE TABLE NHAP
(
	MaNH         CHAR(8) not null,
	MaNNH        CHAR(8) not null,
	MaNCC        CHAR(8) not null,
	NgayNhap     DATE not null,
	TongSL		 INT,
	Chietkhau	 INT not null,
	TongTienHang FLOAT,
	TongCong     FLOAT,
	PRIMARY      KEY (MaNH),
	FOREIGN      KEY (MaNNH) REFERENCES NGUOINHAPHANG,
	FOREIGN      KEY (MaNCC) REFERENCES NHACUNGCAP
)
GO
CREATE TABLE HANG
(
	MaH     CHAR(5) not null,
	TenHang VARCHAR(20) not null,
	DGN     FLOAT not null,
	DGB     FLOAT not null,
    SL      INT not null,
	PRIMARY KEY (MaH)
)
GO
CREATE TABLE NHAP_CHI_TIET
(
	MaNH      CHAR(8) not null,
	MaH       CHAR (5) not null,
	ThanhTien FLOAT,
	Soluong   INT not null,
	FOREIGN   KEY (MaNH) REFERENCES NHAP,
	FOREIGN   KEY (MaH)  REFERENCES HANG
)
GO
CREATE TABLE KHACHHANG
(
	MaKH     CHAR(8) not null,
	Name     NVARCHAR(50) not null,
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
	Chietkhau	 INT not null,
	TongTienHang FLOAT,
	TongCong     FLOAT,
	PRIMARY      KEY (MaHD),
	FOREIGN      KEY (MaKH) REFERENCES KHACHHANG,
	FOREIGN		 KEY (MaNBH) REFERENCES NGUOIBANHANG
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

-------------------------------------------
INSERT INTO ACCOUNT VALUES ('01', 'quanly', N'Quản Lý Bán Hàng', 'quanly001', 0)
INSERT INTO ACCOUNT VALUES ('02', 'nhanvien1', N'Tố Trinh', 'nhanvien002', 1)
INSERT INTO ACCOUNT VALUES ('03', 'nhanvien2', N'Hoài Việt', 'nhanvien003', 1)
INSERT INTO ACCOUNT VALUES ('04', 'nhanvien3', N'Hoàng Vương', 'nhanvien004', 1)
INSERT INTO ACCOUNT VALUES ('05', 'nhanvien4', N'Thủy Trinh', 'nhanvien005', 1)

INSERT INTO NGUOINHAPHANG VALUES ('NNH00001', N'Mr - Phương', N'Icenter Cẩm Phả')
INSERT INTO NGUOINHAPHANG VALUES ('NNH00002', N'Mr - Hải', N'Icenter Cẩm Phả')

INSERT INTO NHACUNGCAP VALUES ('NCC00001', N'Nguyễn Thị Hoa', N'Thành phố Cẩm Phả, Quảng Ninh')
INSERT INTO NHACUNGCAP VALUES ('NCC00002', N'Cửa hàng Hải Huy', N'Thành phố Cẩm Phả, Quảng Ninh')
INSERT INTO NHACUNGCAP VALUES ('NCC00003', N'Trần Văn', N'Thành phố Cẩm Phả, Quảng Ninh')
INSERT INTO NHACUNGCAP VALUES ('NCC00004', N'Cửa hàng TTC', N'Thành phố Cẩm Phả, Quảng Ninh')
INSERT INTO NHACUNGCAP VALUES ('NCC00005', N'Lương Thế Vinh', N'Thành phố Cẩm Phả, Quảng Ninh')

INSERT INTO HANG VALUES ('SP001', N'iphone 12', 20000000, 20490000, 30)
INSERT INTO HANG VALUES ('SP002', N'iphone 13 Pro Max', 33000000, 33990000, 35)
INSERT INTO HANG VALUES ('SP003', N'iphone 13 Pro', 29000000, 29990000, 40)
INSERT INTO HANG VALUES ('SP004', N'iphone 12 Pro Max', 30000000, 31490000, 45)
INSERT INTO HANG VALUES ('SP005', N'iphone 12 Pro', 28000000, 28490000, 50)
INSERT INTO HANG VALUES ('SP006', N'iphone 13', 23000000, 23990000, 45)
INSERT INTO HANG VALUES ('SP007', N'iphone 13 mini', 21000000, 21990000, 45)
INSERT INTO HANG VALUES ('SP008', N'iphone 12 mini', 15000000, 16490000, 40)
INSERT INTO HANG VALUES ('SP009', N'iphone 11', 16000000, 16990000, 30)
INSERT INTO HANG VALUES ('SP010', N'iphone XR', 13000000, 13490000, 25)
INSERT INTO HANG VALUES ('SP011', N'iphone SE 2020', 12000000, 12490000, 10)
INSERT INTO HANG VALUES ('SP012', N'iphone SE 2020 new', 11000000, 11990000, 15)

INSERT INTO NGUOIBANHANG VALUES ('NBH00001', N'Mr - Phương')
INSERT INTO NGUOIBANHANG VALUES ('NBH00002', N'Mr - Hải')

INSERT INTO KHACHHANG VALUES ('00000001', N'Nguyễn Thị Hiền', N'Thành phố Cẩm Phả, Quảng Ninh', '0943078855')
INSERT INTO KHACHHANG VALUES ('00000002', N'Nguyễn Hùng Dũng', N'Thành phố Cẩm Phả, Quảng Ninh', '0982805825')
INSERT INTO KHACHHANG VALUES ('00000003', N'Trần Văn Hùng', N'Thành phố Cẩm Phả, Quảng Ninh', '0969590517')
INSERT INTO KHACHHANG VALUES ('00000004', N'Lê Đình Lý', N'Thành phố Cẩm Phả, Quảng Ninh', '0935700123')
INSERT INTO KHACHHANG VALUES ('00000005', N'Nguyễn Thị Dung', N'Thành phố Cẩm Phả, Quảng Ninh', '0975208772')

--Khi nhập hàng(SoLuong) trong bảng NHAP_CHI_TIET, tính lại hàng tồn kho(SL) trong bảng HANG
GO
CREATE TRIGGER NhapHang ON dbo.NHAP_CHI_TIET
FOR INSERT
AS
	DECLARE @SoLuongN INT 
BEGIN
	SELECT @SoLuongN = SoLuong FROM Inserted
	UPDATE dbo.HANG
	SET SL = SL + (SELECT @SoLuongN FROM Inserted)
	WHERE HANG.MaH = (SELECT MaH FROM Inserted)
END
---------
--Khi bán hàng(SoLuong) trong bảng BAN_CHI_TIET, tính lại hàng tồn kho(SL) trong bảng HANG
GO
CREATE TRIGGER BanHang ON dbo.BAN_CHI_TIET
FOR INSERT
AS
	DECLARE @SoLuongB INT 
BEGIN
	SELECT @SoLuongB = SoLuong FROM Inserted
	UPDATE dbo.HANG
	SET SL = SL - (SELECT @SoLuongB FROM Inserted)
	WHERE HANG.MaH = (SELECT MaH FROM Inserted)
END
---------

INSERT INTO NHAP (MaNH, MaNNH, MaNCC, NgayNhap, Chietkhau)
VALUES ('HDNH0001', 'NNH00001', 'NCC00001', '2021/01/05', 0)
INSERT INTO NHAP (MaNH, MaNNH, MaNCC, NgayNhap, Chietkhau)
VALUES ('HDNH0002', 'NNH00002', 'NCC00002', '2021/02/21', 0)
INSERT INTO NHAP (MaNH, MaNNH, MaNCC, NgayNhap, Chietkhau)
VALUES ('HDNH0003', 'NNH00001', 'NCC00003', '2021/06/12', 0)
INSERT INTO NHAP (MaNH, MaNNH, MaNCC, NgayNhap, Chietkhau)
VALUES ('HDNH0004', 'NNH00001', 'NCC00004', '2021/08/20', 0)
INSERT INTO NHAP (MaNH, MaNNH, MaNCC, NgayNhap, Chietkhau)
VALUES ('HDNH0005', 'NNH00002', 'NCC00005', '2021/09/10', 0)

INSERT INTO NHAP_CHI_TIET(MaNH, MaH, SoLuong)
VALUES('HDNH0001', 'SP002', 5)
INSERT INTO NHAP_CHI_TIET(MaNH, MaH, SoLuong)
VALUES('HDNH0001', 'SP003', 10)
INSERT INTO NHAP_CHI_TIET(MaNH, MaH, SoLuong)
VALUES('HDNH0001', 'SP004', 12)
INSERT INTO NHAP_CHI_TIET(MaNH, MaH, SoLuong)
VALUES('HDNH0001', 'SP005', 8)
INSERT INTO NHAP_CHI_TIET(MaNH, MaH, SoLuong)
VALUES('HDNH0001', 'SP006', 4)
INSERT INTO NHAP_CHI_TIET(MaNH, MaH, SoLuong)
VALUES('HDNH0001', 'SP007', 6)
INSERT INTO NHAP_CHI_TIET(MaNH, MaH, SoLuong)
VALUES('HDNH0001', 'SP008', 15)
INSERT INTO NHAP_CHI_TIET(MaNH, MaH, SoLuong)
VALUES('HDNH0002', 'SP001', 8)
INSERT INTO NHAP_CHI_TIET(MaNH, MaH, SoLuong)
VALUES('HDNH0002', 'SP011', 10)
INSERT INTO NHAP_CHI_TIET(MaNH, MaH, SoLuong)
VALUES('HDNH0002', 'SP012', 15)
INSERT INTO NHAP_CHI_TIET(MaNH, MaH, SoLuong)
VALUES('HDNH0002', 'SP010', 10)
INSERT INTO NHAP_CHI_TIET(MaNH, MaH, SoLuong)
VALUES('HDNH0003', 'SP001', 10)
INSERT INTO NHAP_CHI_TIET(MaNH, MaH, SoLuong)
VALUES('HDNH0003', 'SP009', 10)
INSERT INTO NHAP_CHI_TIET(MaNH, MaH, SoLuong)
VALUES('HDNH0003', 'SP008', 15)
INSERT INTO NHAP_CHI_TIET(MaNH, MaH, SoLuong)
VALUES('HDNH0003', 'SP007', 15)
INSERT INTO NHAP_CHI_TIET(MaNH, MaH, SoLuong)
VALUES('HDNH0004', 'SP002', 5)
INSERT INTO NHAP_CHI_TIET(MaNH, MaH, SoLuong)
VALUES('HDNH0004', 'SP003', 6)
INSERT INTO NHAP_CHI_TIET(MaNH, MaH, SoLuong)
VALUES('HDNH0004', 'SP004', 5)
INSERT INTO NHAP_CHI_TIET(MaNH, MaH, SoLuong)
VALUES('HDNH0004', 'SP007', 4)
INSERT INTO NHAP_CHI_TIET(MaNH, MaH, SoLuong)
VALUES('HDNH0005', 'SP010', 6)
INSERT INTO NHAP_CHI_TIET(MaNH, MaH, SoLuong)
VALUES('HDNH0005', 'SP009', 6)

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
VALUES('HD000001', 'SP001', 5)
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
VALUES('HD000001', 'SP007', 1)
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

-------------------------------------------
UPDATE NHAP_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGN FROM HANG WHERE MaH = 'SP002')
WHERE MaNH = 'HDNH0001' AND MaH = 'SP002' 
UPDATE NHAP_CHI_TIET  
SET ThanhTien = SoLuong * (SELECT DGN FROM HANG WHERE MaH = 'SP003')
WHERE MaNH = 'HDNH0001' AND MaH = 'SP003' 
UPDATE NHAP_CHI_TIET  
SET ThanhTien = SoLuong * (SELECT DGN FROM HANG WHERE MaH = 'SP004')
WHERE MaNH = 'HDNH0001' AND MaH = 'SP004'  
UPDATE NHAP_CHI_TIET  
SET ThanhTien = SoLuong * (SELECT DGN FROM HANG WHERE MaH = 'SP005')
WHERE MaNH = 'HDNH0001' AND MaH = 'SP005' 
UPDATE NHAP_CHI_TIET  
SET ThanhTien = SoLuong * (SELECT DGN FROM HANG WHERE MaH = 'SP006')
WHERE MaNH = 'HDNH0001' AND MaH = 'SP006' 
UPDATE NHAP_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGN FROM HANG WHERE MaH = 'SP007')
WHERE MaNH = 'HDNH0001' AND MaH = 'SP007' 
UPDATE NHAP_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGN FROM HANG WHERE MaH = 'SP008')
WHERE MaNH = 'HDNH0001' AND MaH = 'SP008' 

UPDATE NHAP_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGN FROM HANG WHERE MaH = 'SP001')
WHERE MaNH = 'HDNH0002' AND MaH = 'SP001'
UPDATE NHAP_CHI_TIET  
SET ThanhTien = SoLuong * (SELECT DGN FROM HANG WHERE MaH = 'SP011')
WHERE MaNH = 'HDNH0002' AND MaH = 'SP011' 
UPDATE NHAP_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGN FROM HANG WHERE MaH = 'SP012')
WHERE MaNH = 'HDNH0002' AND MaH = 'SP012' 
UPDATE NHAP_CHI_TIET  
SET ThanhTien = SoLuong * (SELECT DGN FROM HANG WHERE MaH = 'SP010')
WHERE MaNH = 'HDNH0002' AND MaH = 'SP010'

UPDATE NHAP_CHI_TIET  
SET ThanhTien = SoLuong * (SELECT DGN FROM HANG WHERE MaH = 'SP001')
WHERE MaNH = 'HDNH0003' AND MaH = 'SP001'
UPDATE NHAP_CHI_TIET  
SET ThanhTien = SoLuong * (SELECT DGN FROM HANG WHERE MaH = 'SP009')
WHERE MaNH = 'HDNH0003' AND MaH = 'SP009'
UPDATE NHAP_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGN FROM HANG WHERE MaH = 'SP008')
WHERE MaNH = 'HDNH0003' AND MaH = 'SP008'
UPDATE NHAP_CHI_TIET  
SET ThanhTien = SoLuong * (SELECT DGN FROM HANG WHERE MaH = 'SP007')
WHERE MaNH = 'HDNH0003' AND MaH = 'SP007'

UPDATE NHAP_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGN FROM HANG WHERE MaH = 'SP002')
WHERE MaNH = 'HDNH0004' AND MaH = 'SP002'
UPDATE NHAP_CHI_TIET  
SET ThanhTien = SoLuong * (SELECT DGN FROM HANG WHERE MaH = 'SP003')
WHERE MaNH = 'HDNH0004' AND MaH = 'SP003'
UPDATE NHAP_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGN FROM HANG WHERE MaH = 'SP004')
WHERE MaNH = 'HDNH0004' AND MaH = 'SP004'
UPDATE NHAP_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGN FROM HANG WHERE MaH = 'SP007')
WHERE MaNH = 'HDNH0004' AND MaH = 'SP007'

UPDATE NHAP_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGN FROM HANG WHERE MaH = 'SP010')
WHERE MaNH = 'HDNH0005' AND MaH = 'SP010'
UPDATE NHAP_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGN FROM HANG WHERE MaH = 'SP009')
WHERE MaNH = 'HDNH0005' AND MaH = 'SP009'

-------------------------------------------
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGB FROM HANG WHERE MaH = 'SP001')
WHERE MaHD = 'HD000001' AND MaH = 'SP001' 
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGB FROM HANG WHERE MaH = 'SP002')
WHERE MaHD = 'HD000001' AND MaH = 'SP002' 
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGB FROM HANG WHERE MaH = 'SP003')
WHERE MaHD = 'HD000001' AND MaH = 'SP003'  
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGB FROM HANG WHERE MaH = 'SP004')
WHERE MaHD = 'HD000001' AND MaH = 'SP004' 
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGB FROM HANG WHERE MaH = 'SP005')
WHERE MaHD = 'HD000001' AND MaH = 'SP005' 
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGB FROM HANG WHERE MaH = 'SP006')
WHERE MaHD = 'HD000001' AND MaH = 'SP006' 
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGB FROM HANG WHERE MaH = 'SP007')
WHERE MaHD = 'HD000001' AND MaH = 'SP007' 

UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGB FROM HANG WHERE MaH = 'SP001')
WHERE MaHD = 'HD000002' AND MaH = 'SP001'
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGB FROM HANG WHERE MaH = 'SP012')
WHERE MaHD = 'HD000002' AND MaH = 'SP012' 
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGB FROM HANG WHERE MaH = 'SP011')
WHERE MaHD = 'HD000002' AND MaH = 'SP011' 
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGB FROM HANG WHERE MaH = 'SP010')
WHERE MaHD = 'HD000002' AND MaH = 'SP010'

UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGB FROM HANG WHERE MaH = 'SP001')
WHERE MaHD = 'HD000003' AND MaH = 'SP001'
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGB FROM HANG WHERE MaH = 'SP009')
WHERE MaHD = 'HD000003' AND MaH = 'SP009'
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGB FROM HANG WHERE MaH = 'SP008')
WHERE MaHD = 'HD000003' AND MaH = 'SP008'
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGB FROM HANG WHERE MaH = 'SP007')
WHERE MaHD = 'HD000003' AND MaH = 'SP007'

UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGB FROM HANG WHERE MaH = 'SP002')
WHERE MaHD = 'HD000004' AND MaH = 'SP002'
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGB FROM HANG WHERE MaH = 'SP003')
WHERE MaHD = 'HD000004' AND MaH = 'SP003'
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGB FROM HANG WHERE MaH = 'SP004')
WHERE MaHD = 'HD000004' AND MaH = 'SP004'
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGB FROM HANG WHERE MaH = 'SP007')
WHERE MaHD = 'HD000004' AND MaH = 'SP007'

UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGB FROM HANG WHERE MaH = 'SP010')
WHERE MaHD = 'HD000005' AND MaH = 'SP010'
UPDATE BAN_CHI_TIET 
SET ThanhTien = SoLuong * (SELECT DGB FROM HANG WHERE MaH = 'SP009')
WHERE MaHD = 'HD000005' AND MaH = 'SP009'

-------------------------------------------
UPDATE NHAP
SET TongTienHang = (SELECT SUM(ThanhTien) FROM NHAP_CHI_TIET WHERE MaNH = 'HDNH0001')
WHERE MaNH = 'HDNH0001'
UPDATE NHAP
SET TongTienHang = (SELECT SUM(ThanhTien) FROM NHAP_CHI_TIET WHERE MaNH = 'HDNH0002')
WHERE MaNH = 'HDNH0002'
UPDATE NHAP
SET TongTienHang = (SELECT SUM(ThanhTien) FROM NHAP_CHI_TIET WHERE MaNH = 'HDNH0003')
WHERE MaNH = 'HDNH0003'
UPDATE NHAP
SET TongTienHang = (SELECT SUM(ThanhTien) FROM NHAP_CHI_TIET WHERE MaNH = 'HDNH0004')
WHERE MaNH = 'HDNH0004'
UPDATE NHAP
SET TongTienHang = (SELECT SUM(ThanhTien) FROM NHAP_CHI_TIET WHERE MaNH = 'HDNH0005')
WHERE MaNH = 'HDNH0005'
-----
UPDATE NHAP
SET TongCong = TongTienHang - Chietkhau
WHERE MaNH = 'HDNH0001'
UPDATE NHAP
SET TongCong = TongTienHang - Chietkhau
WHERE MaNH = 'HDNH0002'
UPDATE NHAP
SET TongCong = TongTienHang - Chietkhau
WHERE MaNH = 'HDNH0003'
UPDATE NHAP
SET TongCong = TongTienHang - Chietkhau
WHERE MaNH = 'HDNH0004'
UPDATE NHAP
SET TongCong = TongTienHang - Chietkhau
WHERE MaNH = 'HDNH0005'
-----
UPDATE NHAP
SET TongSL = (SELECT SUM(Soluong) FROM NHAP_CHI_TIET WHERE MaNH = 'HDNH0001')
WHERE MaNH = 'HDNH0001'
UPDATE NHAP
SET TongSL = (SELECT SUM(Soluong) FROM NHAP_CHI_TIET WHERE MaNH = 'HDNH0002')
WHERE MaNH = 'HDNH0002'
UPDATE NHAP
SET TongSL = (SELECT SUM(Soluong) FROM NHAP_CHI_TIET WHERE MaNH = 'HDNH0003')
WHERE MaNH = 'HDNH0003'
UPDATE NHAP
SET TongSL = (SELECT SUM(Soluong) FROM NHAP_CHI_TIET WHERE MaNH = 'HDNH0004')
WHERE MaNH = 'HDNH0004'
UPDATE NHAP
SET TongSL = (SELECT SUM(Soluong) FROM NHAP_CHI_TIET WHERE MaNH = 'HDNH0005')
WHERE MaNH = 'HDNH0005'
-------------------------------------------
UPDATE BAN
SET TongTienHang = (SELECT SUM(ThanhTien) FROM BAN_CHI_TIET WHERE MaHD = 'HD000001')
WHERE MaHD = 'HD000001'
UPDATE BAN
SET TongTienHang = (SELECT SUM(ThanhTien) FROM BAN_CHI_TIET WHERE MaHD = 'HD000002')
WHERE MaHD = 'HD000002'
UPDATE BAN
SET TongTienHang = (SELECT SUM(ThanhTien) FROM BAN_CHI_TIET WHERE MaHD = 'HD000003')
WHERE MaHD = 'HD000003'
UPDATE BAN
SET TongTienHang = (SELECT SUM(ThanhTien) FROM BAN_CHI_TIET WHERE MaHD = 'HD000004')
WHERE MaHD = 'HD000004'
UPDATE BAN
SET TongTienHang = (SELECT SUM(ThanhTien) FROM BAN_CHI_TIET WHERE MaHD = 'HD000005')
WHERE MaHD = 'HD000005'
-----
UPDATE BAN
SET TongCong = TongTienHang - Chietkhau
WHERE MaHD = 'HD000001'
UPDATE BAN
SET TongCong = TongTienHang - Chietkhau
WHERE MaHD = 'HD000002'
UPDATE BAN
SET TongCong = TongTienHang - Chietkhau
WHERE MaHD = 'HD000003'
UPDATE BAN
SET TongCong = TongTienHang - Chietkhau
WHERE MaHD = 'HD000004'
UPDATE BAN
SET TongCong = TongTienHang - Chietkhau
WHERE MaHD = 'HD000005'

------INDEX
CREATE INDEX MaHang ON dbo.HANG(MaH)

------Security
CREATE LOGIN QUANLYBANHANG WITH PASSWORD='12345'
CREATE LOGIN NHANVIENBANHANG WITH PASSWORD='12345'

CREATE USER QUANLYBH FOR LOGIN QUANLYBANHANG
CREATE USER NHANVIENBH FOR LOGIN NHANVIENBANHANG
