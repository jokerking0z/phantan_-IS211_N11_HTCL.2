ALTER SESSION SET nls_date_format = 'DD/MM/YYYY HH24:MI:SS';

CREATE TABLE giay (
    magiay        VARCHAR2(10) NOT NULL,
    tengiay       VARCHAR2(50) NOT NULL,
    mausac        VARCHAR2(50),
    kichco        VARCHAR2(50),
    ngaysanxuat   DATE,
    giatien       NUMBER,
    thuonghieu    VARCHAR2(50) NOT NULL,
    CONSTRAINT pk_g PRIMARY KEY ( magiay )
);

CREATE TABLE chinhanh (
    macn    VARCHAR2(10) NOT NULL,
    tencn   VARCHAR2(50) NOT NULL,
    sodt varchar2(50),
    CONSTRAINT pk_cn PRIMARY KEY ( macn)
);

CREATE TABLE khachhang (
    makh       VARCHAR2(10) NOT NULL,
    tenkh      VARCHAR2(50) NOT NULL,
    gioitinh   VARCHAR2(3),
    diachi     VARCHAR2(50),
    sodt       VARCHAR2(50),
    tuoi       VARCHAR2(3),
    macn       VARCHAR2(10),
    CONSTRAINT pk_kh PRIMARY KEY ( makh,
                                   macn ),
    CONSTRAINT fk_kh_cn FOREIGN KEY ( macn )
        REFERENCES chinhanh ( macn )
);

CREATE TABLE nhanvien (
    manv     VARCHAR2(10) NOT NULL,
    tennv    VARCHAR2(50) NOT NULL,
    diachi   VARCHAR2(50),
    sodt     VARCHAR2(50),
    luong    NUMBER,
    CONSTRAINT pk_nv PRIMARY KEY ( manv )
);

CREATE TABLE g_qlkho (
    macn          VARCHAR2(10) NOT NULL,
    magiay        VARCHAR2(10) NOT NULL,
    soluong       NUMBER,
    ngaynhapkho   DATE,
    CONSTRAINT pk_g_qlkho PRIMARY KEY ( macn,
                                        magiay ),
    CONSTRAINT fk_g_qlkho_cn FOREIGN KEY ( macn )
        REFERENCES chinhanh ( macn ),
    CONSTRAINT fk_g_qlkho_g FOREIGN KEY ( magiay )
        REFERENCES giay ( magiay )
);

CREATE TABLE g_qlbh (
    macn        VARCHAR2(10) NOT NULL,
    magiay      VARCHAR2(10) NOT NULL,
    tinhtrang   VARCHAR2(50),
    khuyenmai   NUMBER NOT NULL,
    CONSTRAINT pk_g_qlbh PRIMARY KEY ( magiay,
                                       macn ),
    CONSTRAINT fk_cn_qlbh FOREIGN KEY ( macn )
        REFERENCES chinhanh ( macn ),
    CONSTRAINT fk_g_qlbh FOREIGN KEY ( magiay )
        REFERENCES giay ( magiay )
);

CREATE TABLE hoadon (
    mahd        VARCHAR2(10) NOT NULL,
    manv        VARCHAR2(10) NOT NULL,
    makh        VARCHAR2(10) NOT NULL,
    macn        VARCHAR2(10) NOT NULL,
    ngayhd      DATE,
    thanhtien   NUMBER,
    CONSTRAINT pk_g_hd PRIMARY KEY ( mahd ),
    CONSTRAINT fk_hoadon_nhanvien FOREIGN KEY ( manv )
        REFERENCES nhanvien ( manv ),
    CONSTRAINT fk_hoadon_khachhang FOREIGN KEY ( makh,
                                                 macn )
        REFERENCES khachhang ( makh,
                               macn )
);

CREATE TABLE cthd (
    mahd      VARCHAR2(10) NOT NULL,
    magiay    VARCHAR2(10) NOT NULL,
    soluong   NUMBER NOT NULL,
    CONSTRAINT pk_cthd PRIMARY KEY ( mahd,
                                     magiay ),
    CONSTRAINT fk_cthd_hd FOREIGN KEY ( mahd )
        REFERENCES hoadon ( mahd ),
    CONSTRAINT fk_cthd_g FOREIGN KEY ( magiay )
        REFERENCES giay ( magiay )
);

--insert giay--
--GIAY-- 
INSERT INTO GIAY VALUES 
('G01', 'NIKE1', 'Black', 
'Small', To_Date ('20/11/2022', 
'dd/mm/yyyy'), '10000', 'Nike'); 

INSERT INTO GIAY VALUES 
('G02', 'Nike2', 'White', 'Medium', To_Date ('20/11/2022', 
'dd/mm/yyyy'), '990000', 'Nike'); 

INSERT INTO GIAY VALUES 
('G03', 'NIKE3', 
'Black', 'Medium', To_Date 
('20/11/2022', 'dd/mm/yyyy'), '18290000', 'Nike'); 

INSERT INTO GIAY VALUES 
('G04', 'NIKE4', 
'Black', 'Small', To_Date 
('20/11/2022', 'dd/mm/yyyy'), 
'704000', 'Nike'); 

INSERT INTO GIAY VALUES 
('G05','NIKE3','Black','Large',To_Date ('20/11/2022', 'dd/mm/yyyy'), 
'1415500', 'Nike'); 
 
INSERT INTO GIAY VALUES 
('G06', 'Converse1', 'Navy', 
'Small', To_Date ('20/11/2022', 
'dd/mm/yyyy'), '650000', 
'Converse'); 

INSERT INTO GIAY VALUES 
('G07', 'Converse2', 
'Blue', 'Small', To_Date 
('20/11/2022', 'dd/mm/yyyy'), 
'395000', 'Converse'); 

INSERT INTO GIAY VALUES 
('G08', 'Converse3', 'Navy', 
'Large', To_Date ('20/11/2022', 
'dd/mm/yyyy'), '380000', 
'Converse'); 

INSERT INTO GIAY VALUES 
('G09', 'Kappa1', 
'Orange', 'Medium', To_Date 
('20/11/2022', 'dd/mm/yyyy'), 
'715500', 'Kappa'); 

INSERT INTO GIAY VALUES 
('G10', 'Kappa2', 'Pink', 
'Small', To_Date ('20/11/2022', 
'dd/mm/yyyy'), '697500', 
'Kappa'); 
 
INSERT INTO GIAY VALUES 
('G11', 'Kappa3', 'Pink', 
'Small', To_Date ('20/11/2022', 
'dd/mm/yyyy'), '620000', 
'Kappa'); 

INSERT INTO GIAY VALUES 
('G12', 'Multi-Bag', 'Navy', 
'Small', To_Date ('20/11/2022',
'dd/mm/yyyy'), '620000', 
'Kappa'); 

INSERT INTO GIAY VALUES 
('G13', 'Kappa4', 'Brown', 
'Large', To_Date ('20/11/2022', 
'dd/mm/yyyy'), '795000', 
'Kappa'); 

INSERT INTO GIAY VALUES 
('G14', 'Adidas1', 'Taupe', 
'Medium', To_Date ('20/11/2022', 
'dd/mm/yyyy'), '1607700', 
'Adidas'); 

INSERT INTO GIAY VALUES 
('G15', 'Adidas2', 'Brown', 'Medium', To_Date 
('20/11/2022', 'dd/mm/yyyy'), 
'2500000', 'Adidas'); 
 
INSERT INTO GIAY VALUES 
('G16', 'Adidas3', 'Light Pink', 'Small', 
To_Date ('20/11/2022', 
'dd/mm/yyyy'), '2490000', 
'Adidas'); 

INSERT INTO GIAY VALUES 
('G17', 'Adidas4', 'Stell 
Blue', 'Small', To_Date 
('20/11/2022', 'dd/mm/yyyy'), 
'2410000', 'Adidas'); 

INSERT INTO GIAY VALUES 
('G18', 'Adidas5', 'Ivory', 
'Small', To_Date ('20/11/2022', 
'dd/mm/yyyy'), '1949000', 
'Adidas'); 

INSERT INTO GIAY VALUES 
('G19', 'Adidas6', 'Brick', 'Small', To_Date ('20/11/2022', 
'dd/mm/yyyy'), '2990000', 
'Adidas'); 

INSERT INTO GIAY VALUES 
('G20', 'Adidas8', 
'Cream', 'Small', To_Date 
('20/11/2022', 'dd/mm/yyyy'), 
'2490000', 'Adidas'); 
 
INSERT INTO GIAY VALUES 
('G21', 'Zara1', 'Gold', 'Small', To_Date 
('1/4/2019', 'dd/mm/yyyy'), 
'999000', 'Zara'); 

INSERT INTO GIAY VALUES 
('G22', 'Zara2', 'White', 'Medium', To_Date 
('1/4/2019', 'dd/mm/yyyy'), 
'799000', 'Zara'); 

INSERT INTO GIAY VALUES 
('G23', 'Zara3', 'Red', 
'Large', To_Date ('1/4/2019', 
'dd/mm/yyyy'), '390000', 
'Zara'); 

INSERT INTO GIAY VALUES 
('G24', 'Zara4', 
'Black', 'Medium', To_Date 
('1/4/2019', 'dd/mm/yyyy'), 
'470000', 'Zara'); 

INSERT INTO GIAY VALUES 
('G25', 'Zara5', 'Yellow', 
'Small', To_Date ('1/4/2019', 
'dd/mm/yyyy'), '290000', 
'Zara');

INSERT INTO GIAY VALUES 
('G26', 'Zara6', 'Red', 
'Small', To_Date ('1/4/2019', 
'dd/mm/yyyy'), '370000', 
'Zara'); 

INSERT INTO GIAY VALUES 
('G27', 'ZaraBlue', 'Blue', 
'Medium', To_Date ('2/5/2019', 
'dd/mm/yyyy'), '990000', 
'Zara'); 

INSERT INTO GIAY VALUES 
('G28', 'Zara5', 'Yellow', 
'Small', To_Date ('1/4/2019', 
'dd/mm/yyyy'), '290000', 'Zara'); 

INSERT INTO GIAY VALUES 
('G29', 'ZaraPro', 'Grey', 
'Medium', To_Date ('1/1/2019', 
'dd/mm/yyyy'), '1290000', 
'Zara'); 

INSERT INTO GIAY VALUES 
('G30', 'Zara5', 'Yellow', 
'Small', To_Date ('1/4/2019', 
'dd/mm/yyyy'), '290000', 
'Zara'); 

INSERT INTO GIAY VALUES 
('G31', 'PumaGold', 'Yellow', 
'Small', To_Date ('4/9/2018', 
'dd/mm/yyyy'), '490000', 
'Puma'); 

INSERT INTO GIAY VALUES 
('G32', 'PumaS', 'Balck', 
'Small', To_Date ('5/5/2020', 
'dd/mm/yyyy'), '1290000', 
'Puma'); 

INSERT INTO GIAY VALUES 
('G33', 'PumaZType', 'Blue', 
'Medium', To_Date ('5/5/2022', 
'dd/mm/yyyy'), '550000', 
'Puma'); 

INSERT INTO GIAY VALUES 
('G34', 'PumaLuffy', 'Red', 
'Lagre', To_Date ('5/10/2020', 
'dd/mm/yyyy'), '2290000', 
'Puma'); 

INSERT INTO GIAY VALUES 
('G35', 'PumaZoro', 'Green', 
'Medium', To_Date ('5/10/2020', 
'dd/mm/yyyy'), '2190000', 
'Puma'); 

INSERT INTO GIAY VALUES 
('G36', 'PumaSanji', 'Yellow', 
'Small', To_Date ('5/10/2020', 
'dd/mm/yyyy'), '2090000', 
'Puma'); 

INSERT INTO GIAY VALUES 
('G37', 'PumaChoper', 'Yellow', 
'Small', To_Date ('5/10/2020', 
'dd/mm/yyyy'), '1990000', 
'Puma');

INSERT INTO GIAY VALUES 
('G38', 'PumaNami', 'Pink', 
'Small', To_Date ('5/10/2020', 
'dd/mm/yyyy'), '1890000', 
'Puma'); 

INSERT INTO GIAY VALUES 
('G39', 'PumaFranky', 'Cyan', 
'Large', To_Date ('5/10/2020', 
'dd/mm/yyyy'), '1790000', 
'Puma'); 

INSERT INTO GIAY VALUES 
('G40', 'Balenciaga Zgolden', 'Yellow', 
'Small', To_Date ('2/4/2021', 
'dd/mm/yyyy'), '1290000', 
'Balenciaga'); 
INSERT INTO GIAY VALUES 
('G41', 'Balenciaga Paris', 'Light', 
'Megium', To_Date ('2/4/2021', 
'dd/mm/yyyy'), '990000', 
'Balenciaga'); 

INSERT INTO GIAY VALUES 
('G42', 'Balenciaga Ha Noi', 'Brown', 
'Lagre', To_Date ('2/4/2021', 
'dd/mm/yyyy'), '1190000', 
'Balenciaga'); 

INSERT INTO GIAY VALUES 
('G43', 'Balenciaga Da Nang', 'Blue', 
'Lagre', To_Date ('2/4/2021', 
'dd/mm/yyyy'), '1750000', 
'Balenciaga');

INSERT INTO GIAY VALUES 
('G44', 'Balenciaga Sai Gon', 'Brown', 
'Lagre', To_Date ('2/4/2021', 
'dd/mm/yyyy'), '890000', 
'Balenciaga'); 

INSERT INTO GIAY VALUES 
('G45', 'Balenciaga Hoi An', 'Cyan', 
'Medium', To_Date ('2/4/2021', 
'dd/mm/yyyy'), '1790000', 
'Balenciaga'); 

INSERT INTO GIAY VALUES 
('G46', 'Balenciaga Phu Quoc', 'Green', 
'Small', To_Date ('2/4/2021', 
'dd/mm/yyyy'), '1290000', 'Balenciaga');
INSERT INTO GIAY VALUES 
('G47', 'Balenciaga Ha Long', 'Gold', 
'Medium', To_Date ('2/4/2021', 
'dd/mm/yyyy'), '990000', 
'Balenciaga');

INSERT INTO GIAY VALUES 
('G48', 'Balenciaga Sa Pa', 'White', 
'Lagre', To_Date ('4/7/2022', 
'dd/mm/yyyy'), '1190000', 
'Balenciaga'); 

INSERT INTO GIAY VALUES 
('G49', 'Balenciaga Da Lat', 'Snow', 
'Lagre', To_Date ('7/9/2021', 
'dd/mm/yyyy'), '1150000', 
'Balenciaga'); 

INSERT INTO GIAY VALUES 
('G50', 'Balenciaga Viet Nam', 'Red', 
'Lagre', To_Date ('22/2/2022', 
'dd/mm/yyyy'), '999999999', 
'Balenciaga'); 


-- chi nhanh--

INSERT INTO CHINHANH VALUES 
('CN02', 'Quan 1, TPHCM', 
'0386645926');

-- khach hang --

INSERT INTO KHACHHANG VALUES 
('KH21', 'Le Thi Huong', 'Nu', 'Quan 8, TPHCM', '0342565857', 
'27', 'CN02'); 

INSERT INTO KHACHHANG VALUES 
('KH22', 'Tran Khanh My', 'Nu', 'Quan 9, TPHCM', '09812749458', 
'22', 'CN02'); 

INSERT INTO KHACHHANG VALUES 
('KH23', 'Le Thi Bich Tuyen', 'Nu', 'Quan 3, TPHCM', 
'09832826950', '20', 'CN02'); 
INSERT INTO KHACHHANG VALUES 
('KH24', 'Nguyen Thi Hong 
Nhung', 'Nu', 'Quan 4, TPHCM', 
'0356721980', '25', 'CN02'); 

INSERT INTO KHACHHANG VALUES 
('KH25', 'Tran Dang Minh Vuong', 
'Nam', 'Quan 5, TPHCM', 
'09124469424', '18', 'CN02'); 
 
INSERT INTO KHACHHANG VALUES 
('KH26', 'Le Hoai Thu', 'Nu', 'Quan Go Vap, TPHCM', 
'05220404039', '20', 'CN02'); 

INSERT INTO KHACHHANG VALUES 
('KH27', 'Do Minh Phong', 'Nam', 
'Quan 7, TPHCM', '06821446141', 
'25', 'CN02'); 
INSERT INTO KHACHHANG VALUES 
('KH28', 'Truong Hoang Nam', 
'Nam', 'Quan 8, TPHCM', 
'09749449996', '27', 'CN02');

INSERT INTO KHACHHANG VALUES 
('KH29', 'Phan Bao Chau', 'Nu', 
'Quan 9, TPHCM', '09852785612', 
'21', 'CN02'); 

INSERT INTO KHACHHANG VALUES 
('KH30', 'Nguyen Nhat Vy', 'Nu', 
'Quan 10, TPHCM', '09984562210', 
'32', 'CN02'); 
 
INSERT INTO KHACHHANG VALUES 
('KH31', 'Thai Bao Ngoc', 'Nu', 
'Quan 11, TPHCM', '09142385619', 
'42', 'CN02'); 

INSERT INTO KHACHHANG VALUES 
('KH32', 'Truong Hoang Gia', 
'Nam', 'Quan 12, TPHCM', 
'09382441489', '30', 'CN02'); 

INSERT INTO KHACHHANG VALUES 
('KH33', 'Ngo Manh Hung Nhat', 
'Nam', 'Quan Tan Binh, TPHCM', 
'09829918668', '42', 'CN02'); 

INSERT INTO KHACHHANG VALUES 
('KH34', 'Bui Nguyen Thang', 
'Nam', 'Quan 7, TPHCM', 
'09494499169', '32', 'CN02');
INSERT INTO KHACHHANG VALUES ('KH35', 'Ngac Quang Vinh', 
'Nam', 'Quan Binh Thanh, TPHCM', 
'07419165339', '22', 'CN02'); 
 
INSERT INTO KHACHHANG VALUES 
('KH36', 'Phan Thi Chau', 'Nu', 
'Quan Go Vap, TPHCM', 
'094944959690', '22', 'CN02'); 

INSERT INTO KHACHHANG VALUES 
('KH37', 'Tran Phuoc Tai',
'Nam', 'Quan PHU NHUAN, TPHCM', 
'0952839286', '24', 'CN02'); 

INSERT INTO KHACHHANG VALUES 
('KH38', 'Tran Dang Nguyen', 
'Nam', 'Quan TAN PHU, TPHCM', 
'09339414726', '25', 'CN02'); 

INSERT INTO KHACHHANG VALUES 
('KH39', 'Dang Hoang Bao Ngoc', 
'Nu', 'Quan THU DUC, TPHCM', 
'09528323816', '29', 'CN02'); 

INSERT INTO KHACHHANG VALUES 
('KH40', 'Dang Yen Nhi', 'Nu', 
'Quan 2, TPHCM', '09944999769', 
'28', 'CN02');

-- nhan vien --
INSERT INTO NHANVIEN VALUES 
('NV01', 'Dao Thi Hong Ngoc', 
'Quan 1, TPHCM', '0714521035', 
6300000); 

INSERT INTO NHANVIEN VALUES 
('NV02', 'Ngo Thi Anh', 'Quan 1, 
TPHCM', '0991596624', 4000000); 

INSERT INTO NHANVIEN VALUES 
('NV03', 'Nguyen Minh Anh', 
'Quan 2, TPHCM', '0982234355', 
5000000); 

INSERT INTO NHANVIEN VALUES 
('NV04', 'Nguyen Hoang Khoi', 
'Quan 2, TPHCM', '0936914644', 
6500000); 

INSERT INTO NHANVIEN VALUES 
('NV05', 'Tran Dang An Nhien', 'Quan 2, TPHCM', '0944924928', 
15000000); 
 
INSERT INTO NHANVIEN VALUES 
('NV06', 'Le Huynh Lan', 'Quan
6, TPHCM', '0652346271', 
16600000); 

INSERT INTO NHANVIEN VALUES 
('NV07', 'Nguyen Dang Khoa', 
'Quan 7, TPHCM', '0949821299', 
6000000); 

INSERT INTO NHANVIEN VALUES 
('NV08', 'Nguyen Hoang Minh 
Quan', 'Quan 8, TPHCM', '0642353179', 7000000); 

INSERT INTO NHANVIEN VALUES ('NV09', 'Pham Thi Thanh Truc', 
'Quan 9, TPHCM', '0982999343', 
7900000); 

INSERT INTO NHANVIEN VALUES 
('NV10', 'Nguyen Minh Cuong', 
'Quan 10, TPHCM', '0998555372', 
5900000); 
 
INSERT INTO NHANVIEN VALUES ('NV11', 'Bui Thanh Trang', 
'Quan 11, TPHCM', '0453299276', 5900000); 

INSERT INTO NHANVIEN VALUES ('NV12', 'Banh Van Tran Phat', 
'Quan 12, TPHCM', '0978241489', 3900000); 

INSERT INTO NHANVIEN VALUES ('NV13', 'Tran Gia Han', 'Quan 
Tan Binh, TPHCM', '0982991868', 4200000); 

INSERT INTO NHANVIEN VALUES 
('NV14', 'Pham Khanh Han', 'Quan 
Binh Thanh, TPHCM', 
'0949449969', 5200000); 

INSERT INTO NHANVIEN VALUES 
('NV15', 'Nguyen Huu Cuong',
'Quan Binh Tan, TPHCM', 
'0949165339', 7200000); 

INSERT INTO NHANVIEN VALUES 
('NV16', 'Nguyen Anh Tuan', 
'Quan Go Vap, TPHCM', 
'09494499969', 4200000); 

INSERT INTO NHANVIEN VALUES 
('NV17', 'Tran Doan Kim Ngan', 
'Quan Phu Nhuan, TPHCM', 
'09528392386', 7500000); 

INSERT INTO NHANVIEN VALUES 
('NV18', 'Duong Minh Khang', 
'Quan Phu Nhuan, TPHCM', 
'0993394146', 7500000); 

INSERT INTO NHANVIEN VALUES 
('NV19', 'Hoang Tran Bao Long', 
'Quan Phu Nhuan, TPHCM', 
'09528392386', 7500000); 

INSERT INTO NHANVIEN VALUES 
('NV20', 'Le Nhat Nam', 
'Quan 3, TPHCM',
'09494499969', 7900000);

-- ql kho --

INSERT INTO G_QLKHO VALUES 
('CN02', 'G26', 100, To_date 
('19/9/2021', 'dd/mm/yyyy'));

INSERT INTO G_QLKHO VALUES 
('CN02', 'G27', 7, To_date 
('19/9/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN02', 'G28', 209, To_date 
('11/10/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN02', 'G29', 5, To_date 
('19/10/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN02', 'G30', 240, To_date 
('20/10/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN02', 'G31', 7, To_date 
('01/11/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN02', 'G32', 287, To_date 
('02/11/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN02', 'G33', 290, To_date 
('05/11/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN02', 'G34', 206, To_date 
('07/11/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN02', 'G35', 145, To_date 
('09/11/2021', 'dd/mm/yyyy')); 
 
INSERT INTO G_QLKHO VALUES 
('CN02', 'G36', 9, To_date 
('09/11/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN02', 'G37', 157, To_date 
('13/11/2021', 'dd/mm/yyyy'));

INSERT INTO G_QLKHO VALUES 
('CN02', 'G38', 6, To_date 
('14/11/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN02', 'G39', 54, To_date 
('15/11/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN02', 'G40', 150, To_date 
('15/11/2021', 'dd/mm/yyyy')); 
 
INSERT INTO G_QLKHO VALUES 
('CN02', 'G41', 120, To_date 
('15/11/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN02', 'G42', 250, To_date 
('15/11/2021', 'dd/mm/yyyy'));

INSERT INTO G_QLKHO VALUES 
('CN02', 'G43', 3, To_date 
('15/11/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN02', 'G44', 95, To_date 
('15/11/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN02', 'G45', 7, To_date 
('15/11/2021', 'dd/mm/yyyy')); 
 
INSERT INTO G_QLKHO VALUES 
('CN02', 'G46', 100, To_date 
('19/11/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN02', 'G47', 307, To_date 
('19/11/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN02', 'G48', 8, To_date 
('19/11/2021', 'dd/mm/yyyy'));

INSERT INTO G_QLKHO VALUES 
('CN02', 'G49', 20, To_date 
('19/11/2021', 'dd/mm/yyyy'));

INSERT INTO G_QLKHO VALUES 
('CN02', 'G50', 1, To_date 
('19/11/2021', 'dd/mm/yyyy'));


-- g_qlbh --

INSERT INTO G_QLBH VALUES 
('CN02','G26','Het hang',0); 

INSERT INTO G_QLBH VALUES 
('CN02','G27','Con hang',10); 

INSERT INTO G_QLBH VALUES 
('CN02','G28','Het hang',0); 

INSERT INTO G_QLBH VALUES 
('CN02','G29','Con hang',25); 

INSERT INTO G_QLBH VALUES 
('CN02','G30','Het hang',0); 
 
INSERT INTO G_QLBH VALUES 
('CN02','G31','Het hang',0); 

INSERT INTO G_QLBH VALUES 
('CN02','G32','Con hang',10); 

INSERT INTO G_QLBH VALUES 
('CN02','G33','Het hang',50); 

INSERT INTO G_QLBH VALUES 
('CN02','G34','Con hang',30); 

INSERT INTO G_QLBH VALUES 
('CN02','G35','Het hang',0); 
 
INSERT INTO G_QLBH VALUES 
('CN02','G36','Het hang',40); 

INSERT INTO G_QLBH VALUES 
('CN02','G37','Con hang',0); 

INSERT INTO G_QLBH VALUES 
('CN02','G38','Het hang',20);

INSERT INTO G_QLBH VALUES 
('CN02','G39','Het hang',7); 

INSERT INTO G_QLBH VALUES 
('CN02','G40','Con hang',90); 

INSERT INTO G_QLBH VALUES 
('CN02','G41','Het hang',0);

INSERT INTO G_QLBH VALUES 
('CN02','G42','Con hang',10); 

INSERT INTO G_QLBH VALUES 
('CN02','G43','Het hang',20); 

INSERT INTO G_QLBH VALUES 
('CN02','G44','Con hang',15); 

INSERT INTO G_QLBH VALUES 
('CN02','G45','Het hang',0); 

INSERT INTO G_QLBH VALUES 
('CN02','G46','Con hang',10); 

INSERT INTO G_QLBH VALUES 
('CN02','G47','Con hang',65); 

INSERT INTO G_QLBH VALUES 
('CN02','G48','Het hang',0); 

INSERT INTO G_QLBH VALUES 
('CN02','G49','Con hang',45); 

INSERT INTO G_QLBH VALUES 
('CN02','G50','Con hang',1); 

-- hoa don --
INSERT INTO HOADON VALUES 
('HD01', 'NV11', 'KH21', 'CN02', 
To_date ('1/7/2021', 
'dd/mm/yyyy'), 2970000); 

INSERT INTO HOADON VALUES 
('HD02', 'NV17', 'KH31', 'CN02', 
To_date ('1/7/2021', 
'dd/mm/yyyy'), 2480000); 

INSERT INTO HOADON VALUES 
('HD03', 'NV11', 'KH27', 'CN02',
To_date ('01/7/2021', 
'dd/mm/yyyy'), 590000); 

INSERT INTO HOADON VALUES 
('HD04', 'NV15', 'KH33', 'CN02', 
To_date ('02/7/2021', 
'dd/mm/yyyy'), 6770000); 

INSERT INTO HOADON VALUES 
('HD05', 'NV10', 'KH24', 'CN02', 
To_date ('03/7/2021', 
'dd/mm/yyyy'), 2970000); 

 INSERT INTO HOADON VALUES 
('HD06', 'NV15', 'KH36', 'CN02', 
To_date ('15/7/2021', 
'dd/mm/yyyy'), 4195000); 

INSERT INTO HOADON VALUES 
('HD07', 'NV09', 'KH28', 'CN02', 
To_date ('16/7/2021', 
'dd/mm/yyyy'), 10490000); 

INSERT INTO HOADON VALUES 
('HD08', 'NV13', 'KH27', 'CN02', 
To_date ('17/7/2021', 
'dd/mm/yyyy'), 4199000); 

INSERT INTO HOADON VALUES 
('HD09', 'NV14', 'KH39', 'CN02', 
To_date ('19/7/2021', 
'dd/mm/yyyy'), 5209000); 

INSERT INTO HOADON VALUES 
('HD10', 'NV16', 'KH23', 'CN02', 
To_date ('22/7/2021', 
'dd/mm/yyyy'), 9008000); 
 
INSERT INTO HOADON VALUES 
('HD11', 'NV17', 'KH25', 'CN02', 
To_date ('23/10/2021', 
'dd/mm/yyyy'), 7980000);

INSERT INTO HOADON VALUES 
('HD12', 'NV11', 'KH31', 'CN02', 
To_date ('27/11/2021', 
'dd/mm/yyyy'), 7977000); 

INSERT INTO HOADON VALUES 
('HD13', 'NV02', 'KH25', 'CN02', 
To_date ('27/11/2021', 
'dd/mm/yyyy'), 10970000); 

INSERT INTO HOADON VALUES 
('HD14', 'NV11', 'KH40', 'CN02', 
To_date ('27/11/2021', 
'dd/mm/yyyy'), 3990000); 

INSERT INTO HOADON VALUES 
('HD15', 'NV11', 'KH25', 'CN02', 
To_date ('28/11/2021', 
'dd/mm/yyyy'), 2690000); 
 
INSERT INTO HOADON VALUES 
('HD16', 'NV17', 'KH35', 'CN02', 
To_date ('29/11/2021', 
'dd/mm/yyyy'), 548000); 

INSERT INTO HOADON VALUES 
('HD17', 'NV09', 'KH36', 'CN02', 
To_date ('30/11/2021', 
'dd/mm/yyyy'), 15480000); 

INSERT INTO HOADON VALUES 
('HD18', 'NV15', 'KH27', 'CN02', 
To_date ('01/12/2021', 
'dd/mm/yyyy'), 6190000); 

INSERT INTO HOADON VALUES 
('HD19', 'NV16', 'KH32', 'CN02', 
To_date ('02/12/2021', 
'dd/mm/yyyy'), 229000); 

INSERT INTO HOADON VALUES 
('HD20', 'NV14', 'KH35', 'CN02', 
To_date ('05/12/2021', 
'dd/mm/yyyy'), 22900000);


-- cthd --

INSERT INTO CTHD VALUES ('HD01','G29',01);   

INSERT INTO CTHD VALUES ('HD02','G40',20); 

INSERT INTO CTHD VALUES ('HD03','G07',04); 

INSERT INTO CTHD VALUES ('HD04','G40',09); 

INSERT INTO CTHD VALUES ('HD05','G01',01); 
 
INSERT INTO CTHD VALUES ('HD06','G27',05); 

INSERT INTO CTHD VALUES ('HD07','G38',12); 

INSERT INTO CTHD VALUES ('HD08','G22',05); 

INSERT INTO CTHD VALUES ('HD09','G35',02); 

INSERT INTO CTHD VALUES ('HD10','G16',02); 
 
INSERT INTO CTHD VALUES ('HD11','G27',02); 

INSERT INTO CTHD VALUES ('HD12','G07',03); 

INSERT INTO CTHD VALUES ('HD13','G01',16); 

INSERT INTO CTHD VALUES ('HD14','G10',01);

INSERT INTO CTHD VALUES ('HD15','G16',03);

INSERT INTO CTHD VALUES ('HD16','G03',09);

INSERT INTO CTHD VALUES ('HD17','G12',12);

INSERT INTO CTHD VALUES ('HD18','G09',11);

INSERT INTO CTHD VALUES ('HD19','G08',02);

INSERT INTO CTHD VALUES ('HD20','G17',03);

commit;

--Querry 
--Cau 10: 
SELECT DISTINCT
    ( makh )
FROM
    cn1_btl1.hoadon@dbl_cn1 hd1,
    cn1_btl1.cthd@dbl_cn1   ct1,
    giay                    g1
WHERE
        hd1.mahd = ct1.mahd
    AND ct1.magiay = g1.magiay
    AND thuonghieu NOT IN (
        SELECT DISTINCT
            ( thuonghieu )
        FROM
            giay g
        WHERE
                giatien > 500000
            AND NOT EXISTS (
                SELECT
                    *
                FROM
                    cn1_btl1.cthd@dbl_cn1   ct2, cn1_btl1.hoadon@dbl_cn1 hd2
                WHERE
                        g.magiay = ct2.magiay
                    AND hd2.mahd = ct2.mahd
                    AND hd2.mahd = hd1.mahd
            )
    );
-- TRIGGER INSERT_CTHD:

CREATE OR REPLACE TRIGGER insert_cthd AFTER
    INSERT ON cthd
    FOR EACH ROW
DECLARE
    v_giatien giay.giatien%TYPE;
    cn        chinhanh.macn%TYPE;
BEGIN
    SELECT
        giay.giatien
    INTO v_giatien
    FROM
        giay
    WHERE
        magiay = :new.magiay;

    SELECT
        macn
    INTO cn
    FROM
        hoadon
    WHERE
        mahd = :new.mahd;

    UPDATE hoadon
    SET
        hoadon.thanhtien = hoadon.thanhtien + v_giatien * :new.soluong
    WHERE
        hoadon.mahd = :new.mahd;

    IF ( cn = 'CN02' ) THEN
        UPDATE g_qlkho
        SET
            g_qlkho.soluong = g_qlkho.soluong - :new.soluong
        WHERE
            g_qlkho.magiay = :new.magiay;

    ELSE
        UPDATE cn1_btl1.g_qlkho@dbl_cn1
        SET
            soluong = soluong - :new.soluong
        WHERE
            magiay = :new.magiay;

    END IF;

END;

--TRIGGER Update_CTHD

CREATE OR REPLACE TRIGGER update_cthd AFTER
    UPDATE ON cthd
    FOR EACH ROW
DECLARE
    v_giatien giay.giatien%TYPE;
    diff      NUMBER;
    cn        chinhanh.macn%TYPE;
BEGIN
    SELECT
        giay.giatien
    INTO v_giatien
    FROM
        giay
    WHERE
        magiay = :new.magiay;

    SELECT
        macn
    INTO cn
    FROM
        hoadon
    WHERE
        mahd = :new.mahd;

    diff := :new.soluong - :old.soluong;
    UPDATE hoadon
    SET
        thanhtien = thanhtien + v_giatien * diff
    WHERE
        mahd = :new.mahd;

    IF ( cn = 'CN02' ) THEN
        UPDATE g_qlkho
        SET
            soluong = soluong - diff
        WHERE
            magiay = :new.magiay;

    ELSE
        UPDATE cn1_btl1.g_qlkho@dbl_cn1
        SET
            soluong = soluong - diff
        WHERE
            magiay = :new.magiay;

    END IF;

END;

--TRIGGER Update_TinhTrang

CREATE OR REPLACE TRIGGER update_tinhtrang AFTER
    UPDATE ON g_qlkho
    FOR EACH ROW
BEGIN
    IF ( :new.soluong = 0 ) THEN
        UPDATE g_qlbh
        SET
            tinhtrang = 'Het Hang'
        WHERE
            magiay = :new.magiay;

    ELSE
        UPDATE g_qlbh
        SET
            tinhtrang = 'Con Hang'
        WHERE
            magiay = :new.magiay;

    END IF;
END;

--Function

CREATE OR REPLACE FUNCTION tonghd (
    v_manv IN VARCHAR2
) RETURN NUMBER IS
    tong1 NUMBER := 0;
    tong2 NUMBER := 0;
BEGIN
    SELECT
        COUNT(mahd)
    INTO tong1
    FROM
        hoadon
    WHERE
        manv = v_manv;

    SELECT
        COUNT(mahd)
    INTO tong2
    FROM
        cn1_btl1.hoadon@dbl_cn1
    WHERE
        manv = v_manv;

    RETURN tong1 + tong2;
END;
--set serveroutput on size 30000;

--Procedure

CREATE OR REPLACE PROCEDURE nhapkho (
    v_magiay  IN VARCHAR2,
    v_soluong IN NUMBER
) AS
    dem INT;
BEGIN
    SELECT
        COUNT(magiay)
    INTO dem
    FROM
        g_qlkho
    WHERE
        magiay = v_magiay;

    IF ( dem > 0 ) THEN
        UPDATE g_qlkho
        SET
            soluong = soluong + v_soluong,
            ngaynhapkho = current_date
        WHERE
            magiay = v_magiay;

    ELSE
        INSERT INTO g_qlkho VALUES (
            'CN02',
            v_magiay,
            v_soluong,
            current_date
        );

        INSERT INTO g_qlbh VALUES (
            'CN02',
            v_magiay,
            'Con Hang',
            0
        );

    END IF;

    COMMIT;
END;

--procedure TaoHD
CREATE OR REPLACE PROCEDURE taohd (
    v_manv IN VARCHAR2,
    v_makh VARCHAR2
) AS
    sodong INT;
    dem    INT;
BEGIN
    SELECT
        COUNT(makh)
    INTO dem
    FROM
        khachhang
    WHERE
        makh = v_makh;

    IF ( dem > 0 ) THEN
        SELECT
            COUNT(mahd)
        INTO sodong
        FROM
            hoadon;

        INSERT INTO hoadon VALUES (
            concat('HD', sodong + 1),
            v_manv,
            v_makh,
            'CN02',
            current_date,
            0
        );

    ELSE
        SELECT
            COUNT(makh)
        INTO dem
        FROM
            cn1_btl1.khachhang@dbl_cn2
        WHERE
            makh = v_makh;

        IF ( dem > 0 ) THEN
            SELECT
                COUNT(mahd)
            INTO sodong
            FROM
                cn1_btl1.hoadon@dbl_cn1;

            INSERT INTO cn1_btl1.hoadon@dbl_cn1 VALUES (
                concat('HD', sodong + 1),
                v_manv,
                v_makh,
                'CN02',
                current_date,
                0
            );

        END IF;

    END IF;

    COMMIT;
END;

--procedure BanHang

CREATE OR REPLACE PROCEDURE banhang (
    v_mahd    IN VARCHAR2,
    v_makh    IN VARCHAR2,
    v_magiay  IN VARCHAR2,
    v_soluong IN NUMBER
) AS
    dem      NUMBER;
    soluong  NUMBER;
    tim      NUMBER;
    dem_mahd NUMBER;
    cn       chinhanh.macn%TYPE;
BEGIN -- T?m xem M? HD n?m ? CN1 hay CN2
    SELECT
        COUNT(mahd)
    INTO dem_mahd
    FROM
        hoadon
    WHERE
            mahd = v_mahd
        AND macn = 'CN02'
        AND makh = v_makh;

    IF ( dem_mahd > 0 ) THEN 
-- M? HD ? CN1 
-- Ki?m tra s? lý?ng hàng trong kho CN1 ð? xu?t kho bán hàng
        SELECT
            COUNT(magiay)
        INTO dem
        FROM
            g_qlkho
        WHERE
            magiay = v_magiay;

        SELECT
            soluong
        INTO soluong
        FROM
            g_qlkho
        WHERE
            magiay = v_magiay;

        IF (
            ( dem > 0 )
            AND ( soluong - v_soluong >= 0 )
        ) THEN
-- Ki?m tra hoá ðõn ð? mua túi xách này chýa, n?u r?i th? c?p nh?t s? lý?ng, chýa th? insert vào CTHD
            SELECT
                COUNT(magiay)
            INTO tim
            FROM
                cthd
            WHERE
                    mahd = v_mahd
                AND magiay = v_magiay;

            IF ( tim > 0 ) THEN
                UPDATE cthd
                SET
                    soluong = soluong + v_soluong
                WHERE
                        mahd = v_mahd
                    AND magiay = v_magiay;

            ELSE
                INSERT INTO cthd VALUES (
                    v_mahd,
                    v_magiay,
                    v_soluong
                );

            END IF;

        ELSE
-- Thông báo không ð? hàng 
            raise_application_error(-20000, 'Khong du hang de xuat kho');
            ROLLBACK;
        END IF;

    ELSE
--M? HD ? CN2
        SELECT
            COUNT(mahd)
        INTO dem_mahd
        FROM
            cn1_btl1.hoadon@dbl_cn1
        WHERE
                mahd = v_mahd
            AND macn = 'CN02'
            AND makh = v_makh;

        IF ( dem_mahd > 0 ) THEN
-- M? HD ? CN2
-- Ki?m tra s? lý?ng hàng trong kho CN1 ð? xu?t kho bán hàng
            SELECT
                COUNT(magiay)
            INTO dem
            FROM
                g_qlkho
            WHERE
                magiay = v_magiay;

            SELECT
                soluong
            INTO soluong
            FROM
                g_qlkho
            WHERE
                magiay = v_magiay;

            IF (
                ( dem > 0 )
                AND ( soluong - v_soluong >= 0 )
            ) THEN
-- Ki?m tra hoá ðõn ð? mua giày này chýa, n?u r?i th? c?p nh?t s? lý?ng, chýa th? insert vào CTHD
                SELECT
                    COUNT(magiay)
                INTO tim
                FROM
                    cn1_btl1.cthd@dbl_cn1
                WHERE
                        mahd = v_mahd
                    AND magiay = v_magiay;

                IF ( tim > 0 ) THEN
                    UPDATE cn1_btl1.cthd@dbl_cn1
                    SET
                        soluong = soluong + v_soluong
                    WHERE
                            mahd = v_mahd
                        AND magiay = v_magiay;

                ELSE
                    INSERT INTO cn1_btl1.cthd@dbl_cn1 VALUES (
                        v_mahd,
                        v_magiay,
                        v_soluong
                    );

                END IF;

            ELSE
-- Thông báo không ð? hàng
                raise_application_error(-20000, 'Khong du hang de xuat kho');
                ROLLBACK;
            END IF;

        ELSE
            raise_application_error(-20000, 'Khong tim thay hoa don');
        END IF;

    END IF;

    COMMIT;
END;

--procedure ThongTinNV
CREATE OR REPLACE PROCEDURE thongtinnv (
    v_manv IN VARCHAR2
) AS

    tennv  nhanvien.tennv%TYPE;
    diachi nhanvien.diachi%TYPE;
    sodt   nhanvien.sodt%TYPE;
BEGIN
    SELECT
        tennv,
        diachi,
        sodt
    INTO
        tennv,
        diachi,
        sodt
    FROM
        nhanvien
    WHERE
        manv = v_manv;

    dbms_output.put_line('-----------------------------
-----------');
    dbms_output.put_line('Ten NV: ' || tennv);
    dbms_output.put_line('Dia Chi: ' || diachi);
    dbms_output.put_line('So DT: ' || sodt);
    dbms_output.put_line('-----------------------------
-----------');
    dbms_output.put_line('Tong so HD: ' || tonghd(v_manv));
END;


--Lost update 
select * from  CN1_BTL1.G_QLBH@DBL_CN1
UPDATE CN1_BTL1.G_QLBH@DBL_CN1 SET KHUYENMAI = 20 WHERE MAGIAY = 'G01';
--cach khac phuc
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE; 
UPDATE CN1_BTL1.G_QLBH@DBL_CN1 SET KHUYENMAI = 10 WHERE MAGIAY = 'G01'; 
commit;
--deadlock 
UPDATE CN1_BTL1.KHACHHANG@DBL_CN1 SET DIACHI = 'Quan Go Vap, TP HCM' WHERE MAKH = 'KH02'; 
UPDATE CN1_BTL1.KHACHHANG@DBL_CN1 SET DIACHI = 'TP Da Lat, Lam Dong' WHERE MAKH = 'KH01'; 
    --cach khac phuc 
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE; 
UPDATE CN1_BTL1.KHACHHANG@DBL_CN1 SET DIACHI = 'Quan Go Vap, TP HCM' WHERE MAKH = 'KH02'; 
UPDATE CN1_BTL1.KHACHHANG@DBL_CN1 SET DIACHI = 'TP Da Lat, Lam Dong' WHERE MAKH = 'KH01'; 
commit;


--	Non-repeatable: 
select * from  CN1_BTL1.G_QLBH@DBL_CN1
UPDATE CN1_BTL1.G_QLBH@DBL_CN1 SET KHUYENMAI = 20 WHERE MAGIAY = 'G02'; 
--Cach khac phuc
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE; 
UPDATE CN1_BTL1.G_QLBH@DBL_CN1 SET KHUYENMAI = 10 WHERE MAGIAY = 'G02'; 
commit;

--Phantom read: 
SELECT * FROM CN1_BTL1.HOADON@DBL_CN1; 
--cach khac phuc
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE; 
SELECT * FROM CN1_BTL1.HOADON@DBL_CN1; 
commit;