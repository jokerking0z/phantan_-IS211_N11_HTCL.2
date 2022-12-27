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
('G05', 'NIKE3', 
'Black', 'Large', To_Date('20/11/2022', 'dd/mm/yyyy'), 
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
'Small', To_Date ('20/11/2022', 'dd/mm/yyyy'), '620000', 
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
('G17', 'Adidas4', 'Stell Blue', 'Small', 
To_Date ('20/11/2022', 
'dd/mm/yyyy'), '2410000', 
'Adidas'); 

INSERT INTO GIAY VALUES 
('G18', 'Adidas5', 'Ivory', 'Small', 
To_Date ('20/11/2022', 
'dd/mm/yyyy'), '1949000', 
'Adidas'); 

INSERT INTO GIAY VALUES 
('G19', 'Adidas6', 'Brick', 'Small',
To_Date ('20/11/2022', 
'dd/mm/yyyy'), '2990000', 
'Adidas'); 

INSERT INTO GIAY VALUES 
('G20', 'Adidas8', 'Cream', 'Small', 
To_Date ('20/11/2022', 
'dd/mm/yyyy'), '2490000',
'Adidas'); 
 
INSERT INTO GIAY VALUES 
('G21', 'Zara1', 'Gold', 'Small', 
To_Date ('1/4/2019', 
'dd/mm/yyyy'), '999000', 
'Zara'); 

INSERT INTO GIAY VALUES 
('G22', 'Zara2', 'White', 'Medium', 
To_Date ('1/4/2019', 
'dd/mm/yyyy'), '799000', 
'Zara'); 


INSERT INTO GIAY VALUES 
('G23', 'Zara3', 'Red','Large', 
To_Date ('1/4/2019', 
'dd/mm/yyyy'), '390000', 
'Zara'); 

INSERT INTO GIAY VALUES 
('G24', 'Zara4', 'Black', 'Medium', 
To_Date ('1/4/2019', 
'dd/mm/yyyy'), '470000', 
'Zara'); 


INSERT INTO GIAY VALUES 
('G25', 'Zara5', 'Yellow', 'Small', 
To_Date ('1/4/2019', 
'dd/mm/yyyy'), '290000', 
'Zara'); 

INSERT INTO GIAY VALUES 
('G26', 'Zara6', 'Red', 'Small', 
To_Date ('1/4/2019', 
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
'dd/mm/yyyy'), '290000', 
'Zara'); 

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
('G40', 'BalenciagaZgolden', 'Yellow', 
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
('CN01', 'Quan 9, TPHCM', 
'0386645926'); 

-- khach hang --

INSERT INTO KHACHHANG VALUES 
('KH01', 'Le Thi Thanh Huong', 
'Nu', 'Quan 2, TPHCM', 
'0342565857', '22', 'CN01'); 

INSERT INTO KHACHHANG VALUES 
('KH02', 'Tran Kha My', 'Nu', 
'Quan 9, TPHCM', '0981249458', 
'18', 'CN01'); 

INSERT INTO KHACHHANG VALUES 
('KH03', 'Do Thi Bich Tuyen', 
'Nu', 'Quan 3, TPHCM', 
'0983216950', '25', 'CN01'); 

INSERT INTO KHACHHANG VALUES 
('KH04', 'Nguyen Hong Nhung', 
'Nu', 'Quan 4, TPHCM', 
'0356721980', '50', 'CN01'); 

INSERT INTO KHACHHANG VALUES 
('KH05', 'Tran Minh Vuong', 
'Nam', 'Quan 5, TPHCM', 
'0914469424', '34', 'CN01');

INSERT INTO KHACHHANG VALUES 
('KH06', 'Le Thi Thu Hoai', 
'Nu', 'Quan Go Vap, TPHCM', 
'0522004039', '42', 'CN01'); 

INSERT INTO KHACHHANG VALUES 
('KH07', 'Do Minh Quan', 'Nam', 
'Quan 7, TPHCM', '0682144611', 
'28', 'CN01'); 

INSERT INTO KHACHHANG VALUES 
('KH08', 'Nguyen Truong Hoang Nam', 'Nam', 'Quan 8, TPHCM', 
'0949449996', '26', 'CN01');

INSERT INTO KHACHHANG VALUES ('KH09', 'Nguyen Phan Bao Chau', 
'Nu', 'Quan 9, TPHCM', 
'0982785612', '21', 'CN01'); 

INSERT INTO KHACHHANG VALUES 
('KH10', 'Nguyen Le Nhat Vy', 
'Nu', 'Quan 10, TPHCM', 
'0998456210', '24', 'CN01');  

INSERT INTO KHACHHANG VALUES 
('KH11', 'Nguyen Thai Bao Ngoc', 
'Nu', 'Quan 11, TPHCM', 
'0914235619', '31', 'CN01'); 

INSERT INTO KHACHHANG VALUES 
('KH12', 'Truong Hoang Gia Bao', 
'Nam', 'Quan 12, TPHCM', 
'0938241489', '27', 'CN01'); 

INSERT INTO KHACHHANG VALUES 
('KH13', 'Ngo Manh Hung', 'Nam', 
'Quan Tan Binh, TPHCM', 
'0982991868', '26', 'CN01'); 

INSERT INTO KHACHHANG VALUES 
('KH14', 'Bui Nguyen Trung 
Thang', 'Nam', 'Quan 7, TPHCM', 
'0949449969', '20', 'CN01'); 

INSERT INTO KHACHHANG VALUES 
('KH15', 'Ngac Bao Quang Vinh', 
'Nam', 'Quan Binh Thanh, TPHCM', 
'0749165339', '21', 'CN01'); 

INSERT INTO KHACHHANG VALUES 
('KH16', 'Phan Thi Bao Chau', 
'Nu', 'Quan Go Vap, TPHCM', 
'09494495969', '28', 'CN01'); 

INSERT INTO KHACHHANG VALUES 
('KH17', 'Tran Nguyen Phuoc 
Tai', 'Nam', 'Quan PHU NHUAN,
TPHCM', '0952839286', '29', 
'CN01'); 

INSERT INTO KHACHHANG VALUES 
('KH18','Tran Dang An Nguyen', 
'Nu', 'Quan TAN PHU, TPHCM', 
'0933941476', '37', 'CN01'); 

INSERT INTO KHACHHANG VALUES 
('KH19', 'Huynh Hoang Bao Ngoc', 
'Nu', 'Quan THU DUC, TPHCM', 
'0952832386', '47', 'CN01'); 

INSERT INTO KHACHHANG VALUES 
('KH20', 'Nguyen Dang Yen Nhi', 
'Nu', 'Quan 2, TPHCM', 
'0994499969', '17', 'CN01');

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
('NV05', 'Tran Dang An Nhien', 
'Quan 2, TPHCM', '0944924928', 
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
('NV08', 'Nguyen Hoang Minh Quan',
'Quan 8, TPHCM', '0642353179', 7000000); 

INSERT INTO NHANVIEN VALUES 
('NV09', 'Pham Thi Thanh Truc', 
'Quan 9, TPHCM', '0982999343', 
7900000); 

INSERT INTO NHANVIEN VALUES 
('NV10', 'Nguyen Minh Cuong', 
'Quan 10, TPHCM', '0998555372', 
5900000); 
 
INSERT INTO NHANVIEN VALUES 
('NV11', 'Bui Thanh Trang', 
'Quan 11, TPHCM', '0453299276',
5900000); 

INSERT INTO NHANVIEN VALUES 
('NV12', 'Banh Van Tran Phat', 
'Quan 12, TPHCM', '0978241489',
3900000); 

INSERT INTO NHANVIEN VALUES 
('NV13', 'Tran Gia Han', 'Quan 
Tan Binh, TPHCM', '0982991868', 
4200000); 

INSERT INTO NHANVIEN VALUES 
('NV14', 'Pham Khanh Han', 'Quan 
Binh Thanh, TPHCM', 
'0949449969', 
5200000); 

INSERT INTO NHANVIEN VALUES 
('NV15', 'Nguyen Huu Cuong',
'Quan Binh Tan, TPHCM', '0949165339', 
7200000); 

INSERT INTO NHANVIEN VALUES 
('NV16', 'Nguyen Anh Tuan', 
'Quan Go Vap, TPHCM', 
'09494499969', 4200000); 

INSERT INTO NHANVIEN VALUES 
('NV17', 'Tran Doan Kim Ngan', 
'Quan Phu Nhuan, TPHCM', '09528392386',
7500000); 

INSERT INTO NHANVIEN VALUES 
('NV18', 'Duong Minh Khang', 
'Quan Phu Nhuan, TPHCM', 
'0993394146', 7500000); 


INSERT INTO NHANVIEN VALUES 
('NV19', 'Hoang Tran Bao Long', 
'Quan Phu Nhuan, TPHCM', '09528392386',
7500000); 

INSERT INTO NHANVIEN VALUES 
('NV20', 'Le Nhat Nam', 
'Quan 3, TPHCM', '09494499969',
7900000); 

-- ql kho --

INSERT INTO G_QLKHO VALUES 
('CN01', 'G01', 100, To_date 
('19/9/2021', 'dd/mm/yyyy'));

INSERT INTO G_QLKHO VALUES 
('CN01', 'G02', 300, To_date 
('10/10/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN01', 'G03', 200, To_date 
('11/10/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN01', 'G04', 500, To_date 
('19/10/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN01', 'G05', 240, To_date 
('20/10/2021', 'dd/mm/yyyy')); 
 
INSERT INTO G_QLKHO VALUES 
('CN01', 'G06', 100, To_date 
('01/11/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN01', 'G07', 200, To_date 
('02/11/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN01', 'G08', 270, To_date 
('05/11/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN01', 'G09', 106, To_date 
('07/11/2021', 'dd/mm/yyyy'));

INSERT INTO G_QLKHO VALUES 
('CN01', 'G10', 100, To_date 
('29/11/2021', 'dd/mm/yyyy')); 
 
INSERT INTO G_QLKHO VALUES 
('CN01', 'G11', 3, To_date 
('19/11/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN01', 'G12', 150, To_date 
('23/11/2021', 'dd/mm/yyyy'));

INSERT INTO G_QLKHO VALUES 
('CN01', 'G13', 72, To_date 
('1/12/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN01', 'G14', 250, To_date 
('2/12/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN01', 'G15', 150, To_date 
('5/12/2021', 'dd/mm/yyyy')); 
 
INSERT INTO G_QLKHO VALUES 
('CN01', 'G16', 120, To_date 
('6/12/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN01', 'G17', 25, To_date 
('6/12/2021', 'dd/mm/yyyy'));

INSERT INTO G_QLKHO VALUES 
('CN01', 'G18', 300, To_date 
('6/12/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN01', 'G19', 450, To_date 
('6/12/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN01', 'G20', 100, To_date
('6/12/2021', 'dd/mm/yyyy')); 
 
INSERT INTO G_QLKHO VALUES 
('CN01', 'G21', 8, To_date 
('7/12/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN01', 'G22', 20, To_date 
('7/12/2021', 'dd/mm/yyyy')); 

INSERT INTO G_QLKHO VALUES 
('CN01', 'G23', 7, To_date 
('7/12/2021', 'dd/mm/yyyy'));

INSERT INTO G_QLKHO VALUES 
('CN01', 'G24', 10, To_date 
('7/12/2021', 'dd/mm/yyyy'));

INSERT INTO G_QLKHO VALUES 
('CN01', 'G25', 12, To_date 
('7/12/2021', 'dd/mm/yyyy'));

-- g_qlbh --

INSERT INTO G_QLBH VALUES 
('CN01','G01','Het hang',0); 

INSERT INTO G_QLBH VALUES 
('CN01','G02','Con hang',10); 

INSERT INTO G_QLBH VALUES 
('CN01','G03','Het hang',20); 

INSERT INTO G_QLBH VALUES 
('CN01','G04','Con hang',15); 

INSERT INTO G_QLBH VALUES 
('CN01','G05','Het hang',0); 
 
INSERT INTO G_QLBH VALUES 
('CN01','G06','Het hang',0);

INSERT INTO G_QLBH VALUES 
('CN01','G07','Con hang',10); 

INSERT INTO G_QLBH VALUES 
('CN01','G08','Het hang',0); 

INSERT INTO G_QLBH VALUES 
('CN01','G09','Con hang',25); 

INSERT INTO G_QLBH VALUES 
('CN01','G10','Het hang',0);

INSERT INTO G_QLBH VALUES 
('CN01','G11','Het hang',0); 

INSERT INTO G_QLBH VALUES 
('CN01','G12','Con hang',10); 

INSERT INTO G_QLBH VALUES 
('CN01','G13','Het hang',50); 

INSERT INTO G_QLBH VALUES 
('CN01','G14','Con hang',30); 

INSERT INTO G_QLBH VALUES 
('CN01','G15','Het hang',0); 
 
INSERT INTO G_QLBH VALUES 
('CN01','G16','Het hang',40); 

INSERT INTO G_QLBH VALUES 
('CN01','G17','Con hang',0); 

INSERT INTO G_QLBH VALUES 
('CN01','G18','Het hang',20); 

INSERT INTO G_QLBH VALUES 
('CN01','G19','Het hang',7); 

INSERT INTO G_QLBH VALUES 
('CN01','G20','Con hang',90); 

INSERT INTO G_QLBH VALUES 
('CN01','G21','Con hang',20);

INSERT INTO G_QLBH VALUES 
('CN01','G22','Het hang',0);

INSERT INTO G_QLBH VALUES 
('CN01','G23','Con hang',50);

INSERT INTO G_QLBH VALUES 
('CN01','G24','Con hang',10);

INSERT INTO G_QLBH VALUES 
('CN01','G25','Con hang',1);

-- hoa don --

INSERT INTO HOADON VALUES 
('HD01', 'NV01', 'KH01', 'CN01', 
To_date ('01/9/2021', 
'dd/mm/yyyy'), 2390000);  

INSERT INTO HOADON VALUES 
('HD02', 'NV01', 'KH01', 'CN01', 
To_date ('01/9/2021', 
'dd/mm/yyyy'), 24780000); 

INSERT INTO HOADON VALUES 
('HD03', 'NV01', 'KH02', 'CN01',
To_date ('01/9/2021', 
'dd/mm/yyyy'), 1590000); 

INSERT INTO HOADON VALUES 
('HD04', 'NV05', 'KH03', 'CN01', 
To_date ('01/9/2021', 
'dd/mm/yyyy'), 4770000); 

INSERT INTO HOADON VALUES 
('HD05', 'NV10', 'KH02', 'CN01', 
To_date ('01/9/2021', 
'dd/mm/yyyy'), 2190000); 

INSERT INTO HOADON VALUES 
('HD06', 'NV15', 'KH02', 'CN01', 
To_date ('01/7/2021', 
'dd/mm/yyyy'), 4190000); 

INSERT INTO HOADON VALUES 
('HD07', 'NV19', 'KH08', 'CN01', 
To_date ('02/7/2021', 
'dd/mm/yyyy'), 9490000); 

INSERT INTO HOADON VALUES 
('HD08', 'NV03', 'KH11', 'CN01', 
To_date ('05/7/2021', 
'dd/mm/yyyy'), 41999000); 

INSERT INTO HOADON VALUES 
('HD09', 'NV04', 'KH06', 'CN01', 
To_date ('05/7/2021', 
'dd/mm/yyyy'), 5200000); 

INSERT INTO HOADON VALUES 
('HD10', 'NV06', 'KH12', 'CN01', 
To_date ('06/7/2021', 
'dd/mm/yyyy'), 9000000); 
 
INSERT INTO HOADON VALUES 
('HD11', 'NV07', 'KH15', 'CN01', 
To_date ('07/7/2021', 
'dd/mm/yyyy'), 4980000);

INSERT INTO HOADON VALUES 
('HD12', 'NV20', 'KH02', 'CN01', 
To_date ('07/7/2021', 
'dd/mm/yyyy'), 7970000); 

INSERT INTO HOADON VALUES 
('HD13', 'NV02', 'KH11', 'CN01', 
To_date ('07/8/2021', 
'dd/mm/yyyy'), 8970000); 

INSERT INTO HOADON VALUES 
('HD14', 'NV01', 'KH02', 'CN01', 
To_date ('07/8/2021', 
'dd/mm/yyyy'), 2990000); 

INSERT INTO HOADON VALUES 
('HD15', 'NV03', 'KH05', 'CN01', 
To_date ('07/8/2021', 
'dd/mm/yyyy'), 2690000); 
 
INSERT INTO HOADON VALUES 
('HD16', 'NV07', 'KH02', 'CN01', 
To_date ('9/9/2021', 
'dd/mm/yyyy'), 548000); 

INSERT INTO HOADON VALUES 
('HD17', 'NV09', 'KH02', 'CN01', 
To_date ('9/9/2021', 
'dd/mm/yyyy'), 15480000); 

INSERT INTO HOADON VALUES 
('HD18', 'NV05', 'KH07', 'CN01', 
To_date ('9/9/2021', 
'dd/mm/yyyy'), 5190000); 

INSERT INTO HOADON VALUES 
('HD19', 'NV06', 'KH13', 'CN01', 
To_date ('10/9/2021', 
'dd/mm/yyyy'), 2209000); 

INSERT INTO HOADON VALUES 
('HD20', 'NV04', 'KH11', 'CN01', 
To_date ('15/09/2021', 
'dd/mm/yyyy'), 2290000);

-- cthd --

INSERT INTO CTHD VALUES ('HD01','G09',01); 

INSERT INTO CTHD VALUES ('HD02','G10',05); 

INSERT INTO CTHD VALUES ('HD03','G05',04); 

INSERT INTO CTHD VALUES ('HD04','G14',09); 

INSERT INTO CTHD VALUES ('HD05','G10',01); 
 
INSERT INTO CTHD VALUES ('HD06','G15',05); 

INSERT INTO CTHD VALUES ('HD07','G18',12); 

INSERT INTO CTHD VALUES ('HD08','G09',01); 

INSERT INTO CTHD VALUES ('HD09','G20',02); 

INSERT INTO CTHD VALUES ('HD10','G09',02); 

INSERT INTO CTHD VALUES ('HD11','G17',02); 

INSERT INTO CTHD VALUES ('HD12','G22',03); 

INSERT INTO CTHD VALUES ('HD13','G09',16); 

INSERT INTO CTHD VALUES ('HD14','G20',01);

INSERT INTO CTHD VALUES ('HD15','G17',03);

INSERT INTO CTHD VALUES ('HD16','G04',09);

INSERT INTO CTHD VALUES ('HD17','G02',12);

INSERT INTO CTHD VALUES ('HD18','G19',11);

INSERT INTO CTHD VALUES ('HD19','G10',02);

INSERT INTO CTHD VALUES ('HD20','G07',03);

commit;

--trigger
CREATE OR REPLACE TRIGGER INSERT_CTHD
AFTER INSERT ON CTHD
FOR EACH ROW
DECLARE
V_GIATIEN GIAY.GiaTien%TYPE;
CN CHINHANH.MACN%TYPE;
BEGIN
SELECT GIAY.GIATIEN INTO V_GIATIEN FROM GIAY
WHERE MAGIAY = :NEW.MAGIAY;
SELECT MACN INTO CN FROM HOADON WHERE MAHD=:NEW.MAHD;
UPDATE HOADON
SET HOADON.ThanhTien = HOADON.ThanhTien + V_GIATIEN
* :NEW.SOLUONG
WHERE HOADON.MaHD = :NEW.MaHD;
IF (CN ='CN01') THEN
UPDATE G_QLKHO
SET G_QLKHO.SOLUONG = G_QLKHO.SOLUONG - :NEW.SOLUONG
WHERE G_QLKHO.MAGIAY = :NEW.MAGIAY;
ELSE
UPDATE CN2_BTL1.G_QLKHO@DBL_CN2
SET SOLUONG = SOLUONG - :NEW.SOLUONG
WHERE MAGIAY = :NEW.MAGIAY;
END IF;
END;

--stament 2
CREATE OR REPLACE TRIGGER Update_CTHD
AFTER UPDATE ON CTHD
FOR EACH ROW
DECLARE
V_GIATIEN GIAY.GiaTien%TYPE;
DIFF NUMBER;
CN CHINHANH.MACN%TYPE;
BEGIN
SELECT GIAY.GIATIEN INTO V_GIATIEN FROM GIAY
WHERE MAGIAY = :NEW.MAGIAY;
SELECT MACN INTO CN FROM HOADON WHERE MAHD=:NEW.MAHD;
DIFF := :NEW.SOLUONG - :OLD.SOLUONG;
UPDATE HOADON
SET ThanhTien = ThanhTien + V_GIATIEN * DIFF
WHERE MaHD = :NEW.MaHD;
IF (CN = 'CN01') THEN
UPDATE G_QLKHO
SET SOLUONG = SOLUONG - DIFF
WHERE MAGIAY = :NEW.MAGIAY;
ELSE
UPDATE CN2_BTL1.G_QLKHO@DBL_CN2
SET SOLUONG=SOLUONG - DIFF
WHERE MAGIAY = :NEW.MAGIAY;
END IF;
END;

--stament 3
CREATE OR REPLACE TRIGGER Update_TinhTrang
AFTER UPDATE ON G_QLKHO
FOR EACH ROW
BEGIN
IF (:NEW.SOLUONG = 0) THEN
UPDATE G_QLBH
SET TINHTRANG = 'Het Hang'
WHERE MAGIAY = :NEW.MAGIAY;
ELSE
UPDATE G_QLBH
SET TINHTRANG = 'Con Hang'
WHERE MAGIAY = :NEW.MAGIAY;
END IF;
END;

--function
CREATE OR REPLACE FUNCTION TongHD(v_MaNV IN VARCHAR2)
RETURN number IS
tong1 number := 0;
tong2 number := 0;
BEGIN
select COUNT(MAHD) into tong1 FROM HOADON WHERE
MANV=v_MaNV;
select COUNT(MAHD) into tong2 FROM CN2_BTL1.HOADON@DBL_CN2
WHERE MANV=v_MaNV;
RETURN tong1+tong2;
END;
begin
    NhapKho('G25', 8);
end;
--Procedure 1:
create or replace procedure NhapKho(v_MaGiay in varchar2,v_SoLuong in Number)
As
dem int;
Begin
select count(MaGiay) into dem from G_QLKHO where MaGiay
= v_MaGiay;
if(dem>0) then
update G_QLKHO
set SoLuong = SoLuong + v_SoLuong,
NgayNhapKho = CURRENT_DATE
where MaGiay = v_MaGiay;
else
insert into G_QLKHO values ('CN01',
v_MaGiay, v_SoLuong, CURRENT_DATE);
insert into G_QLBH values ('CN01',
v_MaGiay, 'Con Hang', 0);
end if;
COMMIT;
End;

--Proceduce 2

create or replace procedure TaoHD(v_MaNV in varchar2,v_MaKH varchar2)
As
sodong int;
dem int;
Begin
select count(MaKH) into dem from KHACHHANG where MaKH
= v_MaKH;
if(dem>0) then
select count(MaHD) into sodong from HOADON;
insert into HOADON values (CONCAT ('HD', sodong+1),v_MaNV,v_MaKH,'CN01',CURRENT_DATE,0);
else
select count(MaKH) into dem from
CN2_BTL1.KHACHHANG@DBL_CN2 where MaKH = v_MaKH;
if(dem>0) then
select count(MaHD) into sodong
from CN2_BTL1.HOADON@DBL_CN2;
insert into CN2_BTL1.HOADON@DBL_CN2
values(CONCAT('HD',sodong+1),v_MaNV,v_MaKH,'CN01',
CURRENT_DATE,0);
end if;
end if;

End;


-- Proceduce 3
create or replace procedure BanHang (v_MaHD in varchar2, v_MaKH in varchar2, v_MaGiay in varchar2, v_SoLuong in Number)
As
dem NUMBER;
soluong NUMBER;
tim NUMBER;
DEM_MAHD NUMBER;
CN CHINHANH.MACN%TYPE;
Begin
-- Tìm xem Mã HD n?m ? CN1 hay CN2
select count(MaHD) into DEM_MAHD from HOADON where
MaHD = v_MaHD AND MACN='CN01' AND MAKH=v_MaKH;
IF (DEM_MAHD>0) THEN
-- Mã HD ? CN1
-- Ki?m tra s? l??ng hàng trong kho CN1 ?? xu?t kho bán hàng
select count(MaGiay) into dem from G_QLKHO where
MaGiay = v_MaGiay;
select SoLuong into soluong from G_QLKHO where
MaGiay = v_MaGiay;
if ((dem>0) and (soluong - v_SoLuong>=0)) then
-- Ki?m tra hoá ??n ?ã mua túi xách này ch?a, n?u r?i thì c?p nh?t s? l??ng, ch?a thì insert vào CTHD
select count(MaGiay) into tim from CTHD where
MaHD = v_MaHD and MaGiay = v_MaGiay;
if (tim>0) then
update CTHD
set SOLUONG=SOLUONG + v_SoLuong
where MaHD=v_MaHD and MaGiay=v_MaGiay;
else
insert into CTHD values
(v_MaHD,v_MaGiay, v_SoLuong);
end if;
else
-- Thông báo không ?? hàng
RAISE_APPLICATION_ERROR(-20000, 'Khong du
hang de xuat kho');
ROLLBACK;
end if;
ELSE
--Mã HD ? CN2
select count(MaHD) into DEM_MAHD from
CN2_BTL1.HOADON@DBL_CN2 where MaHD = v_MaHD AND MACN='CN01'
AND MAKH=v_MaKH;
IF (DEM_MAHD>0) THEN
-- Mã HD ? CN2
-- Ki?m tra s? l??ng hàng trong kho CN1 ?? xu?t kho bán hàng
select count(MaGiay) into dem from G_QLKHO
where MaGiay = v_MaGiay;
select SoLuong into soluong from G_QLKHO
where MaGiay = v_MaGiay;
if ((dem>0) and (soluong - v_SoLuong>=0))
then
-- Ki?m tra hoá ??n ?ã mua giày này ch?a, n?u r?i thì c?p nh?t s? l??ng, ch?a thì insert vào CTHD
select count(MaGiay) into tim from
CN2_BTL1.CTHD@DBL_CN2 where MaHD = v_MaHD and MaGiay = v_MaGiay;
if (tim>0) then
update CN2_BTL1.CTHD@DBL_CN2
set SOLUONG=SOLUONG + v_SoLuong
where MaHD = v_MaHD and MaGiay = v_MaGiay;
else
insert into CN2_BTL1.CTHD@DBL_CN2
values (v_MaHD,v_MaGiay,v_SoLuong);
end if;
else
-- Thông báo không ?? hàng
RAISE_APPLICATION_ERROR(-20000, 'Khong du hang de xuat kho');
ROLLBACK;
end if;
ELSE
RAISE_APPLICATION_ERROR(-20000, 'Khong tim thay hoa don');
END IF;
END IF;
COMMIT;
End;

create or replace procedure ThongTinNV (v_MaNV in varchar2)
AS
TENNV NHANVIEN.TENNV%TYPE;
DIACHI NHANVIEN.DIACHI%TYPE;
SODT NHANVIEN.SODT%TYPE;
BEGIN
SELECT TENNV, DIACHI, SODT
INTO TENNV, DIACHI, SODT
FROM NHANVIEN
WHERE MANV=v_MaNV;
DBMS_OUTPUT.PUT_LINE('----------------------------------------');
DBMS_OUTPUT.PUT_LINE('Ten NV: ' || TENNV);
DBMS_OUTPUT.PUT_LINE('Dia Chi: ' || DIACHI);
DBMS_OUTPUT.PUT_LINE('So DT: ' || SODT);
DBMS_OUTPUT.PUT_LINE('----------------------------------------');
DBMS_OUTPUT.PUT_LINE('Tong so HD: ' ||
TongHD(v_MaNV));
END;

begin
    NhapKho('NV20');
end;
begin
    TaoHD('NV20');
end;
begin
    BanHang('NV20');
end;
begin
    ThongTinNV('NV20');
end;
--set serveroutput on size 30000;


-- RBTV
ALTER TABLE KHACHHANG ADD CONSTRAINT ck_kh CHECK (GIOITINH='Nam' OR GIOITINH='Nu');

-- Querry
--1: ??a ra thông tin t?t c? giày t?i c? 2 chi nhánh v?i s? l??ng d??i 10 s?p x?p gi?m d?n. 
SELECT
    *
FROM
    (
        SELECT
            g.*,
            g_qlkho.soluong
        FROM
            giay g
            JOIN g_qlkho ON g_qlkho.magiay = g.magiay
        WHERE
            soluong < 10
        UNION
        SELECT
            g.*,
            qlk.soluong
        FROM
            cn2_btl1.giay@dbl_cn2      g
            JOIN cn2_btl1.g_qlkho@dbl_cn2   qlk ON qlk.magiay = g.magiay
        WHERE
            qlk.soluong < 10
    )
ORDER BY
    soluong DESC;

--Câu 2: Tìm nh?ng m?u giày v?i tình tr?ng là  “Con hang” và có s? l??ng l?n h?n 20 còn l?i trong kho ? c? 02 chi nhánh

SELECT
    *
FROM
    (
        SELECT
            g.*,
            qlk.soluong,
            qlk.macn,
            qlbh.tinhtrang
        FROM
            giay g, g_qlkho qlk, g_qlbh qlbh
        WHERE
            g.magiay = qlk.magiay 
            and qlbh.magiay = g.magiay 
            and qlbh.tinhtrang = 'Con hang'
            and soluong > 20
        UNION
        SELECT
            g.*,
            qlk.soluong,
            qlk.macn,
            qlbh.tinhtrang
        FROM
            cn2_btl1.giay@dbl_cn2 g, cn2_btl1.g_qlkho@dbl_cn2 qlk, cn2_btl1.g_qlbh@dbl_cn2 qlbh
        WHERE
            g.magiay = qlk.magiay 
            and qlbh.magiay = g.magiay 
            and qlbh.tinhtrang = 'Con hang'
            and soluong > 20
    )
ORDER BY
    soluong DESC;

-- câu 3: Tìm nh?ng m?u giày ???c phân ph? t?i chi nhánh 2 nh?ng không có t?i chi nhánh 1 v?i tình tr?ng “Con hang”
SELECT G.*
FROM GIAY G JOIN CN2_BTL1.G_QLBH@DBL_CN2 QLBH
ON G.MAGIAY = QLBH.MAGIAY
WHERE QLBH.TINHTRANG = 'Con hang'
MINUS
SELECT G.*
FROM GIAY G JOIN G_QLBH QLBH
ON G.MAGIAY = QLBH.MAGIAY
WHERE QLBH.TINHTRANG = 'Con hang';

-- câu 4: Tìm mã khách hàng mua hàng nhi?u nh?t trong tháng 7  t?i chi nhánh 1.
SELECT HD.MAKH, COUNT(DISTINCT CT.MAGIAY)
FROM HOADON HD JOIN CTHD CT
ON HD.MAHD = CT.MAHD
WHERE TO_CHAR(HD.NGAYHD, 'MM') = 7
GROUP BY HD.MAKH
HAVING COUNT(DISTINCT CT.MAGIAY) >= ALL
(SELECT COUNT(DISTINCT CT.MAGIAY)
FROM HOADON HD JOIN CTHD CT
ON HD.MAHD = CT.MAHD
WHERE TO_CHAR(HD.NGAYHD, 'MM') = 7
GROUP BY HD.MAKH);

--câu 5:Tìm mã nhân viên ? chi nhánh 2 có s? l??ng hóa ??n nhi?u nh?t trong c? hai chi nhánh.
SELECT HD.MANV, COUNT(HD.MAHD)
FROM
(SELECT *
FROM NHANVIEN
UNION
SELECT *
FROM cn2_btl1.NHANVIEN@DBL_CN2) NV
JOIN
(SELECT *
FROM HOADON
UNION
SELECT *
FROM cn2_btl1.HOADON@DBL_CN2) HD
ON NV.MANV = HD.MANV
GROUP BY HD.MANV
HAVING COUNT(HD.MAHD) >= ALL
(SELECT COUNT(HD.MAHD)
FROM
(SELECT *
FROM NHANVIEN
UNION
SELECT *
FROM cn2_btl1.NHANVIEN@DBL_CN2) NV
JOIN
(SELECT *
FROM HOADON
UNION
SELECT *
FROM cn2_btl1.HOADON@DBL_CN2) HD
ON NV.MANV = HD.MANV
GROUP BY HD.MANV);

--câu 6:V?i m?i màu s?c giày, li?t kê s? l??ng mua c?a khách hàng tu 18 den 25 tu?i ? c? 2 chi nhánh
SELECT
    mausac,
    SUM(soluong)
FROM
    giay g,
    (
        SELECT
            *
        FROM
            cthd,
            hoadon hd
        WHERE
            cthd.mahd = hd.mahd
        UNION
        SELECT
            *
        FROM
            cn2_btl1.cthd@dbl_cn2     cthd,
            cn2_btl1.hoadon@dbl_cn2   hd
        WHERE
            cthd.mahd = hd.mahd
    ) hd
WHERE
    g.magiay = hd.magiay
    AND hd.makh IN (
        SELECT
            makh
        FROM
            (
                SELECT
                    makh,
                    tuoi
                FROM
                    khachhang
                UNION
                SELECT
                    makh,
                    tuoi
FROM
                    cn2_btl1.khachhang@dbl_cn2
            )
        WHERE
            tuoi BETWEEN 18 AND 25
    )
GROUP BY
    mausac;

--Câu 7: Tìm các hóa on mua hàng trong tháng 7 v?i t?ng s? l??ng giày có trên 5 s?n ph?m, 
--s?p x?p theo th? t? gi?m d?n ? c? 02 chi nhánh.

SELECT
    a.mahd,
    a.tsl
FROM
    (
        SELECT
            hd.mahd,
            SUM(hd.soluong) tsl
        FROM
            (
                SELECT
                    cthd.mahd,
                    ngayhd,
                    magiay,
                    soluong
                FROM
                    cn2_btl1.hoadon@dbl_cn2   hd,
                    cn2_btl1.cthd@dbl_cn2     cthd
                WHERE
                    hd.mahd = cthd.mahd
                UNION
                SELECT
                    cthd.mahd,
                    ngayhd,
                    magiay,
                    soluong
                FROM
                    hoadon   hd,
                    cthd     cthd
                WHERE
                    hd.mahd = cthd.mahd
            ) hd
WHERE
            TO_CHAR(hd.ngayhd, 'MM') = 7
GROUP BY
            hd.mahd
        HAVING
            SUM(hd.soluong) > 5
    ) a
ORDER BY
    a.tsl DESC;

--CÂU 8: Tìm m?u giày có s? l??ng bán ít nh?t trong n?m 2021 ? c? 02 chi nhánh.


SELECT
    magiay,
    SUM(tsl)
FROM
    (
        SELECT
            magiay,
            SUM(soluong) tsl
        FROM
            cn2_btl1.cthd@dbl_cn2     ct1,
            cn2_btl1.hoadon@dbl_cn2   hd1
        WHERE
            ct1.mahd = hd1.mahd
            AND TO_CHAR(hd1.ngayhd, 'YYYY') = 2021
        GROUP BY
            magiay
        UNION
        SELECT
            magiay,
            SUM(soluong) tsl
        FROM
            cthd     ct2,
            hoadon   hd2
        WHERE
            ct2.mahd = hd2.mahd
            AND TO_CHAR(hd2.ngayhd, 'YYYY') = 2021
        GROUP BY
            magiay
    ) ct
GROUP BY MAGIAY
HAVING
    SUM(tsl) <= ALL (
        SELECT SUM(tsl)
        FROM
            (
                SELECT
                    magiay,
                    SUM(soluong) tsl
                FROM
                    cn2_btl1.cthd@dbl_cn2     ct1,
                    cn2_btl1.hoadon@dbl_cn2   hd1
                WHERE
                    ct1.mahd = hd1.mahd
                    AND TO_CHAR(hd1.ngayhd, 'YYYY') = 2021
GROUP BY
                    magiay
                UNION
                SELECT
                    magiay,
                    SUM(soluong) tsl
                FROM
                    cthd     ct2,
                    hoadon   hd2
                WHERE
                    ct2.mahd = hd2.mahd
                    AND TO_CHAR(hd2.ngayhd, 'YYYY') = 2021
                GROUP BY
                    magiay
            ) ct
        GROUP BY
            magiay
    );

--CÂU 9: Tìm mau giày duoc mua bii ca khách hàng nam và nu o ca 02 chi nhánh.

SELECT
    a.magiay,
    b.sl   sl_nu,
    c.sl   sl_nam
FROM
    (
        SELECT DISTINCT
            hd.magiay
        FROM
            (
                SELECT
                    *
                FROM
                    khachhang
                UNION
                SELECT
                    *
                FROM
                    cn2_btl1.khachhang@dbl_cn2
            ) kh
            JOIN (
                SELECT
                    *
                FROM
                    hoadon
                    JOIN cthd ON hoadon.mahd = cthd.mahd
                UNION
                SELECT
                    *
                FROM
                    cn2_btl1.hoadon@dbl_cn2
                    JOIN cn2_btl1.cthd@dbl_cn2 ON hoadon.mahd = cthd.mahd
            ) hd ON kh.makh = hd.makh
        WHERE
            kh.gioitinh = 'Nu'
        INTERSECT
SELECT DISTINCT
            hd.magiay
        FROM
            (
                SELECT
                    *
                FROM
                    khachhang
UNION
                SELECT
                    *
                FROM
                    cn2_btl1.khachhang@dbl_cn2
            ) kh
            JOIN (
                SELECT
                    *
                FROM
                    hoadon
                    JOIN cthd ON hoadon.mahd = cthd.mahd
                UNION
                SELECT
                    *
                FROM
                    cn2_btl1.hoadon@dbl_cn2
                    JOIN cn2_btl1.cthd@dbl_cn2 ON hoadon.mahd = cthd.mahd
            ) hd ON kh.makh = hd.makh
        WHERE
            kh.gioitinh = 'Nam'
    ) a,
    (
        SELECT
            hd.magiay,
            SUM(hd.soluong) sl
        FROM
            (
                SELECT
                    *
                FROM
                    khachhang
                UNION
                SELECT
                    *
                FROM
                    cn2_btl1.khachhang@dbl_cn2
            ) kh
            JOIN (
                SELECT
                    *
                FROM
                    hoadon
                    JOIN cthd ON hoadon.mahd = cthd.mahd
                UNION
                SELECT
                    *
                FROM
                    cn2_btl1.hoadon@dbl_cn2
                    JOIN cn2_btl1.cthd@dbl_cn2 ON hoadon.mahd = cthd.mahd
            ) hd ON kh.makh = hd.makh
        WHERE
            kh.gioitinh = 'Nu'
        GROUP BY
            hd.magiay
    ) b,
    (
        SELECT
            hd.magiay,
            SUM(hd.soluong) sl
        FROM
            (
                SELECT
                    *
                FROM
                    khachhang
                UNION
                SELECT
                    *
                FROM
                    cn2_btl1.khachhang@dbl_cn2
            ) kh
            JOIN (
                SELECT
                    *
                FROM
                    hoadon
                    JOIN cthd ON hoadon.mahd = cthd.mahd
                UNION
                SELECT
                    *
                FROM
                    cn2_btl1.hoadon@dbl_cn2
                    JOIN cn2_btl1.cthd@dbl_cn2 ON hoadon.mahd = cthd.mahd
            ) hd ON kh.makh = hd.makh
        WHERE
            kh.gioitinh = 'Nam'
        GROUP BY
            hd.magiay
    ) c
WHERE
    a.magiay = b.magiay
    AND a.magiay = c.magiay;
commit;

-- MuC CÔ LaP 
declare 
trans_id Varchar2(100); 
begin 
trans_id := dbms_transaction.local_transaction_id(TRUE); 
end; 

--XEM M?C CÔ L?P
SELECT s.sid, s.serial#, 
CASE BITAND(t.flag, POWER(2, 28)) 
WHEN 0 THEN 'READ COMMITTED' 
ELSE 'SERIALIZABLE' 
END AS isolation_level 
FROM v$transaction t 
JOIN v$session s ON t.addr = s.taddr AND s.sid = sys_context('USERENV', 'SID');

CREATE OR REPLACE PROCEDURE sleep (in_time number) 
AS 
v_now date; 
BEGIN 
SELECT SYSDATE 
INTO v_now 
FROM DUAL; 
LOOP 
EXIT WHEN v_now + (in_time * (1/86400)) <= SYSDATE; 
END LOOP; 
end;
begin
sleep(10);
end;

--LOST UPDATE
select * from G_QLBH where MAGIAY = 'G01';
UPDATE G_QLBH SET KHUYENMAI = 10 WHERE MAGIAY = 'G01'; 
COMMIT;

--DEADLOCK
select * from khachhang;
UPDATE KHACHHANG SET DIACHI = 'Quan 2, TP HCM' WHERE MAKH = 'KH01'; 
UPDATE KHACHHANG SET DIACHI = 'Quan 3, TP HCM' WHERE MAKH = 'KH02'; 


--NON-REPATABLE
SELECT * FROM G_QLBH WHERE MAGIAY = 'G02'; 
SELECT * FROM G_QLBH WHERE MAGIAY = 'G02'; 
COMMIT; 

--PHANTOM READ
BEGIN
TAOHD('NV01','KH01');
END;
COMMIT;

--CÁCH KH?C PH?C;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE; 
--LOST UPDATE
select * from G_QLBH where MAGIAY = 'G01';
UPDATE G_QLBH SET KHUYENMAI = 0 WHERE MAGIAY = 'G01';
COMMIT;
--DEADLOCK
UPDATE KHACHHANG SET DIACHI = 'Thu Duc' WHERE MAKH = 'KH01'; 
UPDATE KHACHHANG SET DIACHI = 'Quan 3, TP HCM' WHERE MAKH = 'KH02'; 
COMMIT;
--NON-REPEATABLE
SELECT * FROM G_QLBH WHERE MAGIAY = 'G03';
COMMIT;
--PHANTOM READ
BEGIN
TAOHD('NV01','KH01');
END;


--Toi uu cau truy van
-- câu g?c
SELECT G.MAGIAY, TENGIAY, QLBH.MACN 
FROM GIAY G, 
G_QLKHO QLK, 
G_QLBH QLBH 
WHERE G.MAGIAY = QLK.MAGIAY 
AND G.MAGIAY = QLBH.MAGIAY 
AND QLK.MAGIAY = QLBH.MAGIAY 
AND G.GIATIEN <= 1500000 
AND QLK.SOLUONG < 20 
AND QLBH.KHUYENMAI <= 20; 


-- T?i ?u t?i máy 1
SELECT
    ql.magiay,
    tengiay,
    ql.macn
FROM
    (
        SELECT
            kho.magiay,
            bh.macn
        FROM
            (
                SELECT
                    magiay
                FROM
                    g_qlkho
                WHERE
                    soluong < 20
            ) kho
            JOIN (
                SELECT
                    magiay,
                    macn
                FROM
                    g_qlbh
                WHERE
                    khuyenmai <= 20
            ) bh ON kho.magiay = bh.magiay
    ) ql
    JOIN (
        SELECT
            magiay,
            tengiay
        FROM
            giay
        WHERE
            giatien <= 1500000
    ) g ON ql.magiay = g.magiay;


-- T?i ?u trong môi tr??ng phân tán
SELECT
    ql.magiay,
    tengiay,
    ql.macn
FROM
    (
        SELECT
            kho.magiay,
            bh.macn
        FROM
            (
                SELECT
                    magiay
                FROM
                    g_qlkho
                WHERE
                    soluong < 20
            ) kho
            JOIN (
                SELECT
                    magiay,
                    macn
                FROM
                    g_qlbh
                WHERE
                    khuyenmai <= 20
            ) bh ON kho.magiay = bh.magiay
    ) ql
    JOIN (
        SELECT
            magiay,
            tengiay
        FROM
            giay
        WHERE
            giatien <= 1500000
    ) g ON ql.magiay = g.magiay
UNION
SELECT
    ql.magiay,
    tengiay,
    ql.macn
FROM
    (
        SELECT KHO.magiay,
            bh.macn
        FROM
            (
                SELECT
                    magiay 
	FROM
                    cn2_btl1.g_qlkho@dbl_cn2
                WHERE
                    soluong < 20
            ) kho
            JOIN (
                SELECT
                    magiay,
                    macn
                FROM
                    cn2_btl1.g_qlbh@dbl_cn2
                WHERE
                    khuyenmai <= 20
            ) bh ON kho.magiay = bh.magiay
    ) ql
    JOIN (
        SELECT
            magiay,
            tengiay 
FROM
            cn2_btl1.giay@dbl_cn2
        WHERE
            giatien <= 1500000) g ON ql.magiay = g.magiay;

