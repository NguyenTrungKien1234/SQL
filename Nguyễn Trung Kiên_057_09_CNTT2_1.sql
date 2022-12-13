create table VatTu (
MAVT int,
TenVT varchar(50),
DVTinh money,
SLCon int
constraint pk_vt primary key(MAVT)
);

create table HDBan(
MAHD int,
NgayXuat smalldatetime,
HoTenKhach nvarchar(50)
constraint pk_hdb primary key(MAHD)
);


create table HangXuat (
MAHD int,
MAVT int,
DonGia money,
SLBan int
constraint pk_hx primary key(MAHD,MAVT)
);
ALTER TABLE HangXuat ADD CONSTRAINT fk01_hgx FOREIGN KEY(MAHD) REFERENCES HDBan(MAHD)
ALTER TABLE HangXuat ADD CONSTRAINT fk02_hx FOREIGN KEY(MAVT) REFERENCES VatTu(MAVT)