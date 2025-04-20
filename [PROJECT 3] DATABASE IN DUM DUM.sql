create database DUM DUM
USE DUM DUM
-- membuat skema
CREATE SCHEMA HUMAN
CREATE SCHEMA PRODUCT

--BUAT TABEL PEGAWAI DALAM SCHEMA HUMAN
create table HUMAN.SUPPLIER(
id_supplier VARCHAR (15) PRIMARY KEY NOT NULL, --PK
CONSTRAINT pkid_supplier
CHECK (id_supplier LIKE ('[S][0-9][0-9][0-9]')), --VALIDASI
id_sproduct VARCHAR (15) NOT NULL,
name_supplier VARCHAR (50) NOT NULL,
address_supplier VARCHAR (50) NOT NULL,
phone_number VARCHAR (50) NOT NULL,
CHECK (phone_number LIKE '%08__'), --VALIDASI PHONE NUMBER
);

INSERT INTO HUMAN.SUPPLIER(id_supplier,name_supplier,address_supplier,phone_number)
VALUES
('S001', 'Jean', 'Puri Street','0801878302856'),
('S002', 'Natasya', 'Gading Street','0883602917298'),
('S003', 'Kevin', 'Kemang Street','088390552813'),
('S004', 'Aldo', 'Serpong Street','087389182456');

-- BUAT TABEL CUSTOMER DALAM SCHEMA HUMAN --
create TABLE HUMAN.CUSTOMER(
id_customer VARCHAR (15) PRIMARY KEY NOT NULL, --PK
CONSTRAINT pkid_customer
CHECK (id_customer LIKE ('[C][0-9][0-9][0-9]')), --VALIDASI
id_employee VARCHAR (50) NOT NULL,
name_customer VARCHAR (50) NOT NULL,
email_customer VARCHAR (50) NOT NULL,
CHECK (email_customer LIKE '__%@gmail.com'), --VALIDASI GMAIL
);

INSERT INTO HUMAN.CUSTOMER (id_customer, id_employee, name_customer, email_customer)
VALUES
('C001', 'E001', 'Stark','tonyystark@gmail.com'),
('C002', 'E004', 'Steve','rogers5@gmail.com');

-- BUAT TABLE MENU DALAM SCHEMA PRODUCT--
create table PRODUCT.MENU(
id_menu VARCHAR (15) primary key not null, --PK
CONSTRAINT pkid_menu
CHECK (id_menu LIKE ('[M][0-9][0-9][0-9]')), --VALIDASI
id_supplier varchar (50) not null,
name_menu varchar (300) not null,
price varchar (50) not null,
stock int
);

INSERT INTO PRODUCT.MENU (id_menu, id_supplier, name_menu, price, stock)
VALUES(
('M001', 'S001','Thai Tea Original', 'Rp24.000', 50),
('M002', 'S002','Thai Green Tea', 'Rp28.000', 50),
('M003', 'S003','Roasted Thai Tea', 'Rp32.000', 35),
('M004', 'S004','Dumilo Dinosaur', 'Rp25.000', 45),
('M005', 'S003','Aren Thai Coffee', 'Rp35.000', 32),
('M006', 'S002','Dark Chocolate', 'Rp34.000', 30),
);

--BUAT TABLE ORDER--
create TABLE ORDER(
id_order VARCHAR (15) primary key not null, --PK,
id_menu VARCHAR (15) FOREIGN KEY REFERENCES PRODUCT.MENU(id_menu),
id_customer VARCHAR (15) FOREIGN KEY REFERENCES HUMAN.CUSTOMER(id_customer),
order_date DATE,
quantity int,
total_ammount VARCHAR (255)
);

--INPUT DATA ORDER--
INSERT INTO ORDER (id_order, id_menu, id_customer, order_date, quantity, total_ammount)
VALUES 
(1, 'M001', 'C001', '2023-12-19', 7, (SELECT price FROM product.menu WHERE id_menu = 'M001') * 7);
(2, 'M003', 'C002', '2023-12-19', 4, (SELECT price FROM product.menu WHERE id_menu = 'M003') * 4);

-- BUAT TABLE STOCK_BARANG DALAM SCHEMA PRODUCT--
create table PRODUCT.STOCK_BARANG(
id_sproduct VARCHAR (15) primary key not null, --PK
CONSTRAINT pkid_sproduct
CHECK (id_sproduct LIKE ('[SPR][0-9][0-9][0-9]')), --VALIDASI
id_supplier varchar (50) not null,
id_menu varchar (50) not null,
name_sproduct varchar (300) not null,
quantity int
);

INSERT INTO PRODUCT.STOCK_BARANG (id_sproduct, id_supplier, name_menu, price, stock)
VALUES(
('M001', 'S001','Thai Tea Original', 'Rp24.000', 50),
('M002', 'S002','Thai Green Tea', 'Rp28.000', 50),
);

--BUAT TABEL SUPLIER DALAM SCHEMA PRODUCT--
CREATE table PRODUCT.SUPLIER (
IDSUPLIER VARCHAR (15) primary key not null, --PK
CONSTRAINT PKIDSUPLIER
CHECK (IDSUPLIER LIKE ('[S][0-9][0-9][0-9]')), --VALIDASI
NAMASUPLIER varchar (50) not null,
ALAMATSUPLIER varchar (50) not null,
PICSUPLIER varchar (50) not null,
NOTELSUPLIER varchar (50) not null,
EMAILSUPLIER varchar (50)not null,
 );











--inputan data tabel suplier skema product
INSERT INTO PRODUCT.SUPLIER (IDSUPLIER,NAMASUPLIER,ALAMATSUPLIER,PICSUPLIER,NOTELSUPLIER,EMAILSUPLIER)
VALUES
('S002','PT. WOPIGOOD', 'JL.KECIL NO3 - GUNUNG KAPUR', 'BARY ALEN', '087654','BA@WOPIGOOD.COM'),
('S001','PT. ABX INDO', 'JL.BESAR NO3 - TAPOS', 'JOHN CENA', '087654','JC@ABXINDO.COM')


--SP untuk lihat seluruh table
create procedure SPALL
AS
BEGIN
SELECT * FROM HUMAN.PEGAWAI
SELECT * FROM HUMAN.ANGGOTA
SELECT * FROM PRODUCT.SUPLIER
SELECT * FROM PRODUCT.BARANG
SELECT * FROM TRANSAKSI
END
--sp all
EXEC SPALL

--INPUT DATA PEGAWAI PAKAI PROSEDURE
create procedure SPINPUTDATAPEGAWAI
@IDPEG VARCHAR (15),
@NAMAPEG varchar (50),
@ALAMATPEG varchar (50),
@JABATANPEG varchar (50),
@GENDER varchar (50),
@NOTELPEG varchar (50),
@EMAILPEG varchar (50),
@TANGGALLAHIRPEG  DATE
as
begin
	insert into HUMAN.PEGAWAI VALUES (
@IDPEG ,
@NAMAPEG ,
@ALAMATPEG ,
@JABATANPEG ,
@GENDER ,
@NOTELPEG ,
@EMAILPEG ,
@TANGGALLAHIRPEG )
end

exec SPINPUTDATAPEGAWAI 
--INPUT PEGAWAI PAKAI SP
exec SPINPUTDATAPEGAWAI 'P008', 'AGUS', 'JL JUANDA', 'KASIR', 'PRIA', '070707', 'AGUS@GMAIL.COM', '2011-1-1'

@IDPEG = 'P007',
@NAMAPEG = 'RIYADI',
@ALAMATPEG= 'JL JALAN NO 34' ,
@JABATANPEG = 'KASIR',
@GENDER ='PRIA',
@NOTELPEG ='09871114',
@EMAILPEG ='RIYADI@GMAIL.COM',
@TANGGALLAHIRPEG ='2010-10-10'

--BUAT TABEL BARANG DI SHECMA PRODUCT
CREATE TABLE PRODUCT.BARANG (
IDBARANG VARCHAR (15) primary key not null, --PK
CONSTRAINT PKIDBARANG
CHECK (IDBARANG LIKE ('[B][0-9][0-9][0-9]')), --VALIDASI
IDSUPLIER VARCHAR (15) FOREIGN KEY REFERENCES  PRODUCT.SUPLIER (IDSUPLIER),
NAMABARANG varchar (50) not null,
HARGAJUAL INT not null,
KETBARANG varchar (50) not null,
STOCKBARANG INT not null, 
EXPDATE DATE);

--input data pada table barang
INSERT INTO PRODUCT.BARANG (IDBARANG,IDSUPLIER,NAMABARANG,HARGAJUAL,KETBARANG,STOCKBARANG,EXPDATE)
VALUES
('B004','S001','SSD 2 Terra', 1000000,'VGEN', 100,'2024-12-12'),
('B003','S002','LCD CURVE 32" 120HZ', 4000000,'XIAOMI', 100,'2024-12-12'),
('B002','S002','VGA GTX 16 GIGA', 1000000,'VODOO', 100,'2024-12-12'),
('B001','S001','MEMORY DDR4 8GIGA', 500000,'SAMSUNG', 100,'2024-12-12')


--buat  table transaksi
create TABLE TRANSAKSI(
IDTRANSAKSI VARCHAR (15) primary key not null, --PK,
IDPEG VARCHAR (15) FOREIGN KEY REFERENCES HUMAN.PEGAWAI(IDPEG),
IDANGGOTA VARCHAR (15) FOREIGN KEY REFERENCES HUMAN.ANGGOTA(IDANGGOTA),
IDBARANG  VARCHAR (15) FOREIGN KEY REFERENCES PRODUCT.BARANG(IDBARANG),
TANGGALTRANSAKSI DATE,
QUANTITY int,
TOTALHARGA int
);

--input data transaksi
INSERT INTO transaksi (idtransaksi, idpeg, idanggota, idbarang, tanggaltransaksi, quantity, totalharga)
VALUES 
('O001', 'P001', 'A001', 'B002', '2023-12-19', 2, (SELECT hargajual FROM product.barang WHERE idbarang = 'b002') * 2);
(2, 'P003', 'A001', 'B002', '2023-12-19', 10, (SELECT hargajual FROM product.barang WHERE idbarang = 'b002') * 10);


--hapus transaksi ke 
delete from TRANSAKSI where IDTRANSAKSI ='2'

--buat triger notifikasi untuk setiap input barang


create trigger TRINPUTBARANG;
ON PRODUCT.BARANG
FOR INSERT
AS
BEGIN
DECLARE @IDBARANG VARCHAR (15) 
DECLARE @IDSUPLIER VARCHAR (15) 
DECLARE @NAMABARANG VARCHAR (50) 
DECLARE @HARGAJUAL INT
DECLARE @KETBARANG VARCHAR (50) 
DECLARE @STOCKBARANG INT 
DECLARE @EXPDATE DATE

SELECT @IDBARANG=IDBARANG,@IDSUPLIER=IDSUPLIER,@NAMABARANG=NAMABARANG,@HARGAJUAL=HARGAJUAL,
@KETBARANG=KETBARANG,@STOCKBARANG=STOCKBARANG,@EXPDATE=EXPDATE 
FROM INSERTED

PRINT '===================NOTIFICATION======================'
PRINT 'ID BARANG		:'+@IDBARANG
PRINT 'ID SUPLIER		:'+@IDBARANG
PRINT 'NAMA BARANG		:'+@NAMABARANG
PRINT 'HARGA JUAL		:'+cast(@HARGAJUAL AS VARCHAR)
PRINT 'KETERANGAN		:'+@KETBARANG
PRINT 'STOK BARANG		:'+cast(@STOCKBARANG AS VARCHAR)
PRINT 'TANGGAL EXP		:'+cast(@EXPDATE AS VARCHAR)
PRINT ''
PRINT 'DATA SUDAH DIMASUKAN KEDALAM TABLE BARANG '
PRINT '===================NOTIFICATION======================'
END

-------------to be countinue -------------------

-- terapkan disetiap inputan pada table