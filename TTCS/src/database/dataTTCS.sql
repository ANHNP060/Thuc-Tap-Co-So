create database DatabaseTTCS ON PRIMARY
( NAME = N'DatabaseTTCS', FILENAME = N'D:\Elearn\DatabaseTTCS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ) 
LOG ON 
( NAME = N'DatabaseTTCS_log', FILENAME = N'D:\Elearn\DatabaseTTCS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 COLLATE Vietnamese_CI_AS;
go

   backup database DatabaseTTCS
to disk = N'D:\Elearn\DatabaseTTCS.bak'
with noformat, noinit, name = N'dDatabaseTTCS-Full Database Backup',
skip, norewind, nounload, stats = 10;
go

use DatabaseTTCS
go

create table Categories
(
	CateId int primary key,
	[NameCate] [varchar](50) not null
)

create table Describe
(
	DesId int primary key,
	MauSac nvarchar(50),
	KichThuoc nvarchar(max),
	ChatLieu nvarchar(250),
	NoiSanXuat nvarchar(150),
	DacDiemNoiBat [nvarchar](max),
)

create table Users
(
	userId int primary key identity(1,1),
	fullname nvarchar(50) not null,
	password nvarchar(50) not null,
	email nvarchar(50) not null,
	phone_number nvarchar(20),
	address nvarchar(100),
	role_user int,
	created_at datetime
);
go


create table Products 
(
	ProId int primary key,
	NamePro nvarchar(50),
	ImagePro nvarchar(50),
	Price int,
	Quantity int,
	CateId int references Categories(CateId),
	DesId int references Describe(DesId)
)

insert Categories(CateId,NameCate) values(1,'Men');
insert Categories(CateId,NameCate) values(2,'Women');
insert Categories(CateId,NameCate) values(3,'Kid');
insert Categories(CateId,NameCate) values(4,'Bags');
insert Categories(CateId,NameCate) values(5,'Shoes');
insert Categories(CateId,NameCate) values(6,'Clothing');
insert Categories(CateId,NameCate) values(7,'Accessories')
insert Categories(CateId,NameCate) values(8,'Hat')
insert Categories(CateId,NameCate) values(9,'Glass')



insert Describe(DesId,MauSac,KichThuoc,ChatLieu,NoiSanXuat,DacDiemNoiBat) 
values(1,N'Nâu sẫm','XL',N'Nhung tăm','England',
N'Áo khoác bomber nam vải gió giúp giữ ấm cơ thể tốt .n@

Kiểu dáng thời trang cùng màu sắc trẻ trung, năng động, dễ dàng phối với nhiều trang phục khác nhau .n@

Thiết kế bo len cổ, tay và gấu áo tạo độ ôm vừa phải mang đến cảm giác thoải mái khi mặc .n@

Tay áo có túi khóa tạo sự khỏe khoắn và để đồ tiện lợi, chắc chắn .n@

Đường may tỉ mỉ, có độ bền cao khi sử dụng .n@

BOONBOON - Look good. Feel good.')

insert Describe(DesId,MauSac,KichThuoc,ChatLieu,NoiSanXuat,DacDiemNoiBat) 
values(12,N'Xanh quân lục','XXL',N'Cotton gió','China',
N'
Chất liệu vải 95% Polyester + 5% cotton. .n@

Vải có bề mặt lỳ, mềm mịn, ít nhăn, chắc chắn hơn so với chất liệu vải gió thông thường .n@

Áo có thiết kế trẻ trung đơn giản, đường cắt xẻ khỏe khoắn nam tính .n@

Chun tại cổ tay giúp người mặc trông gọn gàng, vừa vặn hơn .n@

Phần mũ có thể tháo rời và miệng mũ có luồn chun rất trẻ trung và tinh tế .n@
BOONBOON - Look good. Feel good.
')
insert Describe(DesId,MauSac,KichThuoc,ChatLieu,NoiSanXuat,DacDiemNoiBat) 
values(3,N'Xanh đen','XL',N'Jacket','New York',
N'
Chất liệu cafe dệt tổ ong .n@

Thành phần: 100% Recycle SCafe Poly .n@

Vải cafe thấm hút mồ hôi, kiểm soát khử mùi cơ thể tốt .n@

Có khả năng chống tia UV đến 98% .n@

Kiểu dáng năng động, trẻ trung .n@

Kết hợp cùng quần jeans, quần short, kaki,... để đi làm, đi chơi .n@
BOONBOON - Look good. Feel good.')
insert Describe(DesId,MauSac,KichThuoc,ChatLieu,NoiSanXuat,DacDiemNoiBat) 
values(11,N'Đen',N'43x31x13 cm',N' Polyester','VietNam',N'
Balo Laptop nhỏ gọn, tiện dụng là tiêu chí của rất nhiều người dùng khi chọn lựa balo. .n@
Chiếc balo không chỉ tiện dụng giúp chúng ta đựng được rất nhiều đồ mà còn là phụ kiện thời trang không thể thiếu khi đi ra ngoài. .n@
Nếu bạn là người ưa thích phong cách tối giản, tiện dụng thì mẫu balo BL3749 này sinh ra để dành cho bạn. .n@
BOONBOON - Look good. Feel good.
')
insert Describe(DesId,MauSac,KichThuoc,ChatLieu,NoiSanXuat,DacDiemNoiBat) 
values(5,N'Nâu đất',N'33 lít',N'Polyester,EVA,PVC...','Chiana',N'
Balo du lịch nhỏ gọn, tiện dụng là tiêu chí của rất nhiều người dùng khi chọn lựa balo. .n@
Chiếc balo không chỉ tiện dụng giúp chúng ta đựng được rất nhiều đồ mà còn là phụ kiện thời trang không thể thiếu khi đi ra ngoài. .n@
Nếu bạn là người ưa thích phong cách tối giản, tiện dụng thì mẫu balo BL3749 này sinh ra để dành cho bạn. .n@
BOONBOON - Look good. Feel good.')
insert Describe(DesId,MauSac,KichThuoc,ChatLieu,NoiSanXuat,DacDiemNoiBat) 
values(10,N'Vàng đen',N'51-21-145',N'Kim loại',N'Trung Quốc',
N'
Chân gọng làm từ nhựa dẻo .n@
Chốt gọng chắc .n@
Kính thời trang. .n@
BOONBOON - Look good. Feel good.')
insert Describe(DesId,MauSac,KichThuoc,ChatLieu,NoiSanXuat,DacDiemNoiBat) 
values(9,N'Hồng cánh sen',N'40x110 cm',N'Cotton',N'USA',
N'
Chất liệu 100% Cotton USA .n@

Sợi Cotton tốt nhất thế giới đến từ Mỹ với độ mảnh và khả năng nhuộm tối ưu hơn .n@

Thấm hút mồ hôi rất phù hợp với thời tiết tại Việt Nam .n@

Co giãn nhẹ, phù hợp với chuyển động của cơ thể .n@

Hình in phía trước tạo điểm nhấn cá tính .n@
BOONBOON - Look good. Feel good.')
insert Describe(DesId,MauSac,KichThuoc,ChatLieu,NoiSanXuat,DacDiemNoiBat) 
values(6,N'Đen',N'42x120 cm',N'Cotton, Spandex...',N'Vietnam',N'
Áo thun nữ chất liệu Zib, thành phần  80% Cotton + 15% Polyester + 5% Spandex .n@

Bề mặt vài mịn màng, thông thoáng, thấm hút, co giãn thoải mái, không bai gião .n@

Dệt kẻ trẻ trung, phom dáng ôm sát tay lửng phù hợp cho đầu mùa thu đông .n@

Có thể mix với quần nỉ, jean hay chân váy để mặc đi chơi, đi làm hay ở nhà đều được .n@
BOONBOON - Look good. Feel good.')
insert Describe(DesId,MauSac,KichThuoc,ChatLieu,NoiSanXuat,DacDiemNoiBat) 
values(2,N'Đen trắng',N'40',N'nappa',N'Japan',
N'Giày nam mocca có kiểu dáng hiện đại .n@

Thiết kế đục lỗ trước mũi giày tạo sự thông thoáng khi đi .n@

Chất liệu da nappa mềm mại, bóng đẹp tự nhiên, không bong tróc, không bị nổ da, thoáng khí, không gây bí chân .n@

Giày có thể kết hợp cùng nhiều trang phục, thích hợp diện đi chơi, đi làm .n@
BOONBOON - Look good. Feel good.')
insert Describe(DesId,MauSac,KichThuoc,ChatLieu,NoiSanXuat,DacDiemNoiBat) 
values(4,N'Xám bạc',N'20x150 cm',N'Bông mềm',N'Trung quốc',
N'Combo 2 đôi tất nam kháng khuẩn hiệu quả .n@

Thoải mái, co giãn ôm theo bàn chân của bạn .n@

Chất liệu kháng khuẩn thông thoáng .n@

Thiết kế cổ ngắn không lo lộ tất với hầu hết các loại giày thông dụng cho nam giới .n@
BOONBOON - Look good. Feel good.')
insert Describe(DesId,MauSac,KichThuoc,ChatLieu,NoiSanXuat,DacDiemNoiBat) 
values(7,N'Nước hoa',N'Chai nhỏ',N'Cao cấp',N'Pháp',
N'Hương đầu: Bạch đậu khấu, Cây vòi voi, Tiêu hồng và Cam Bergamot .n@
Hương giữa: Hạnh nhân đắng, Oải hương, Hoa nhài và Phong lữ .n@
Hương cuối: Vani, Gỗ Guaiac, Gỗ trầm hương (Oud), Gỗ đàn hương và Hổ phách. .n@
BOONBOON - Look good. Feel good.')
insert Describe(DesId,MauSac,KichThuoc,ChatLieu,NoiSanXuat,DacDiemNoiBat) 
values(8,N'Trắng',N'33 lít',N'Polyester,EVA,PVC...','Chiana',N'
Balo đi học nhỏ gọn, tiện dụng là tiêu chí của rất nhiều người dùng khi chọn lựa balo. .n@
Chiếc balo không chỉ tiện dụng giúp chúng ta đựng được rất nhiều đồ mà còn là phụ kiện thời trang không thể thiếu khi đi ra ngoài. .n@
Nếu bạn là người ưa thích phong cách tối giản, tiện dụng thì mẫu balo này sinh ra để dành cho bạn. .n@
BOONBOON - Look good. Feel good.')


insert Products(ProId, NamePro, ImagePro, Price, Quantity, CateId, DesId)
values (1,N'Áo khoác Gile','product-2.jpg',16.42,10,1,1)
insert Products(ProId, NamePro, ImagePro, Price, Quantity, CateId, DesId)
values (2,N'Giày thể thao','product-3.jpg',25.10,10,5,2)
insert Products(ProId, NamePro, ImagePro, Price, Quantity, CateId, DesId)
values (3,N'Áo khoác gió','product-4.jpg',60.9,10,1,3)
insert Products(ProId, NamePro, ImagePro, Price, Quantity, CateId, DesId)
values (4,N'Khăn lông','product-6.jpg',14.22,10,6,4)
insert Products(ProId, NamePro, ImagePro, Price, Quantity, CateId, DesId)
values (5,N'Balo thời trang','product-7.jpg',26.45,10,4,5)
insert Products(ProId, NamePro, ImagePro, Price, Quantity, CateId, DesId)
values (6,N'Áo thun nữ','product-9.jpg',18.11,10,2,6)
insert Products(ProId, NamePro, ImagePro, Price, Quantity, CateId, DesId)
values (7,N'Multi-pocket Chest Bags','product-10.jpg',120.6,10,6,7)
insert Products(ProId, NamePro, ImagePro, Price, Quantity, CateId, DesId)
values (8,N'Balo du lịch','product-11.jpg',30.99,10,4,8)
insert Products(ProId, NamePro, ImagePro, Price, Quantity, CateId, DesId)
values (9,N'Áo thun Slapa','product-8.jpg',8.20,10,2,9)
insert Products(ProId, NamePro, ImagePro, Price, Quantity, CateId, DesId)
values (10,N'Kính râm','product-14.jpg',14.57,10,9,10)
insert Products(ProId, NamePro, ImagePro, Price, Quantity, CateId, DesId)
values (11,N'Balo công sở','product-13.jpg',10.99,10,4,11)
insert Products(ProId, NamePro, ImagePro, Price, Quantity, CateId, DesId)
values (12,N'Áo quân lục','product-12.jpg',40.66,10,1,12)

----------------------------------------------------------------------------
--------------------create Order--------------------------------------------
----------------------------------------------------------------------------

CREATE TABLE Orders
(
	oId INT(11) NOT NULL identity(1,1),
    ProId int(11) not null,
    userId int(11) not null,
    oQuantity int(11) NOT null,
    oDate varchar(255) not null,
    primary key(oId),
	FOREIGN KEY (userId) REFERENCES Users(UserID),
    FOREIGN KEY (ProId) REFERENCES Products(ProId)
);
go
