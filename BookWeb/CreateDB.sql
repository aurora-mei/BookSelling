CREATE DATABASE BookstoreDB;
GO

USE BookstoreDB;
GO

CREATE TABLE Publisher (
    PublisherID INT PRIMARY KEY identity,
    PublisherName NVARCHAR(100),
    PublisherEmail NVARCHAR(100)
);
--drop table Publisher
CREATE TABLE Users (
    UserID INT PRIMARY KEY identity,
    UserName NVARCHAR(100),
    Passwords NVARCHAR(100),
    Roles NVARCHAR(50),
    Email NVARCHAR(100),
    PhoneNum NVARCHAR(15),
    Names NVARCHAR(100),
    DOB DATE,
    Gender NVARCHAR(10),
    Avatar NVARCHAR(255)
);

CREATE TABLE AddressInfo (
    AddressID INT PRIMARY KEY identity,
    Street NVARCHAR(255),
    BuildingNo NVARCHAR(50),
    City NVARCHAR(100)
);

CREATE TABLE UserAddress (
    UserAddressID INT PRIMARY KEY,
    UserID INT,
    AddressID INT,
    AddressStatus NVARCHAR(2),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (AddressID) REFERENCES AddressInfo(AddressID),
);

CREATE TABLE PaymentMethod (
    PaymentMethodID INT PRIMARY KEY identity,
    PaymentName NVARCHAR(50)
);

CREATE TABLE Cards (
    CardID INT PRIMARY KEY identity,
    PaymentMethodID INT,
    UserID INT,
    ExpireDates DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (PaymentMethodID) REFERENCES PaymentMethod(PaymentMethodID)
);
--drop table Cards

CREATE TABLE BookInfo (
    BookID INT PRIMARY KEY identity,
    PublisherID INT,
    Title NVARCHAR(255),
    Price DECIMAL(10, 2),
	PriceDiscount DECIMAL(10, 2),
    Pages INT,
    AvaQuantity INT,
    PublishDate DATE,
    Descriptions NVARCHAR(500),
	LongDescriptions NVARCHAR(2000),
    ImageURL NVARCHAR(255),
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID)
);

CREATE TABLE ImageInfo (
	ImageID INT PRIMARY KEY identity,
    ImageURL NVARCHAR(255),
);
CREATE TABLE BookImage (
    BookID INT,
    ImageID INT,
    FOREIGN KEY (BookID) REFERENCES BookInfo(BookID),
	FOREIGN KEY (ImageID) REFERENCES ImageInfo(ImageID),
	PRIMARY KEY(BookID,ImageID)
);

CREATE TABLE BookLanguageInfo (
    LanguageID INT PRIMARY KEY identity,
    LanguageName NVARCHAR(100)
);

CREATE TABLE BookLanguage (
    BookID INT,
    LanguageID INT,
    PRIMARY KEY (BookID, LanguageID),
    FOREIGN KEY (BookID) REFERENCES BookInfo(BookID),
    FOREIGN KEY (LanguageID) REFERENCES BookLanguageInfo(LanguageID)
);

CREATE TABLE Author (
    AuthorID INT PRIMARY KEY identity,
    AuthorName NVARCHAR(100),
    AuthorDOB DATE,
    AuthorImageURL NVARCHAR(255),
    AuthorEmail NVARCHAR(100),
    AuthorDescript NVARCHAR(255)
);

CREATE TABLE BookAuthor (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES BookInfo(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
);

CREATE TABLE CategoryInfo (
    CategoryID INT PRIMARY KEY identity,
    CategoryName NVARCHAR(100),
    Quantity INT
);

CREATE TABLE BookCategory (
    BookID INT,
    CategoryID INT,
    PRIMARY KEY (BookID, CategoryID),
    FOREIGN KEY (BookID) REFERENCES BookInfo(BookID),
    FOREIGN KEY (CategoryID) REFERENCES CategoryInfo(CategoryID)
);

CREATE TABLE Discount (
    DiscountID INT PRIMARY KEY identity,
    DiscountName NVARCHAR(100),
    DiscountValue DECIMAL(5, 2)
);

CREATE TABLE BookDiscount (
    BookID INT,
    DiscountID INT,
    PRIMARY KEY (BookID, DiscountID),
    FOREIGN KEY (BookID) REFERENCES BookInfo(BookID),
    FOREIGN KEY (DiscountID) REFERENCES Discount(DiscountID)
);

CREATE TABLE CartItem (
	CartItemID INT PRIMARY KEY identity,
    UserID INT,
    BookID INT,
    Quantity INT,
    Price DECIMAL(10, 2),--giá gốc
	PriceDiscount DECIMAL(10, 2),--giá áp dụng khuyến mãi
	LanguageID INT,
	TotalPrice DECIMAL(10, 2),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES BookInfo(BookID),
	FOREIGN KEY (LanguageID) REFERENCES BookLanguageInfo(LanguageID)
);

CREATE TABLE ShippingMethodInfo (
    ShippingMethodID INT PRIMARY KEY identity,
    MethodName NVARCHAR(100),
    Cost DECIMAL(10, 2)
);

CREATE TABLE OrderStatusInfo (
    StatusID INT PRIMARY KEY identity,
    StatusValue NVARCHAR(100)
);

CREATE TABLE Comment (
    CommentID INT PRIMARY KEY identity,
    BookID INT,
    UserID INT,
    Comment NVARCHAR(1000),
    Rating DECIMAL(10, 2),
	CommentDate DATE,
    FOREIGN KEY (BookID) REFERENCES BookInfo(BookID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
GO


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY identity,
    UserID INT,
    ShippingMethodID INT,
    UserAddressID INT,
    CardID INT,
    TotalPrice DECIMAL(10, 2),--giá gốc (không quan tâm discount hay không)
	TotalPriceShipping DECIMAL(10, 2),--giá cộng sau tính phí ship
    OrderDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ShippingMethodID) REFERENCES ShippingMethodInfo(ShippingMethodID),
    FOREIGN KEY (UserAddressID) REFERENCES UserAddress(UserAddressID),
    FOREIGN KEY (CardID) REFERENCES Cards(CardID)
);

CREATE TABLE OrderItem (
	OrderItemID INT PRIMARY KEY,
    OrderID INT,
    BookID INT,
    Quantity INT,
	LanguageID INT,
    Price DECIMAL(10, 2),--giá gốc
	PriceDiscount DECIMAL(10, 2),--giá áp dụng khuyến mãi
	TotalPrice DECIMAL(10, 2),--tổng giá sách
    FOREIGN KEY (OrderID) REFERENCES [Orders](OrderID),
	FOREIGN KEY (LanguageID) REFERENCES BookLanguageInfo(LanguageID),
    FOREIGN KEY (BookID) REFERENCES BookInfo(BookID)
);
CREATE TABLE OrderHistory (
    OrderHistoryID INT PRIMARY KEY identity,
    OrderID INT,
    StatusID INT,
    StatusDate DATE,
    FOREIGN KEY (OrderID) REFERENCES [Orders](OrderID),
    FOREIGN KEY (StatusID) REFERENCES OrderStatusInfo(StatusID)
);

--drop database BookstoreDB

-------============ INSERT DATA =============-----
USE BookstoreDB;
GO

-- Insert data into Publisher table
INSERT INTO Publisher (PublisherName, PublisherEmail)
VALUES 
    (N'NXB Kim Đồng', 'kimdong@gmail.com'),
    (N'NXB Trẻ', 'tre@gmail.com'),
    (N'NXB Nhã Nam', 'nhanam@gmail.com');
	select * from Publisher
-- Insert data into Users table
INSERT INTO Users ( UserName, Passwords, Roles, Email, PhoneNum, Names, DOB, Gender, Avatar)
VALUES 
( 'john_doe', '123', 'admin', 'john@example.com', '1234567890', 'John Doe', '1990-01-01', 'Male', 'images/avatar1.jpg'),
('jane_smith', '456', 'user', 'jane@example.com', '0987654321', 'Jane Smith', '1992-02-02', 'Female', 'images/avatar2.jpg'),
('bob_brown', '789', 'user', 'bob@example.com', '1231231234', 'Bob Brown', '1985-03-03', 'Male', 'images/avatar3.jpg');
--select * from Users
-- Insert data into AddressInfo table
INSERT INTO AddressInfo (AddressID, Street, BuildingNo, City)
VALUES (1, 'Street 1', 'Building 1', 'City 1');

-- Insert data into UserAddress table
INSERT INTO UserAddress (UserAddressID, UserID, AddressID, AddressStatus)
VALUES (1, 1, 1, 'A');

-- Insert data into PaymentMethod table
INSERT INTO PaymentMethod (PaymentMethodID, PaymentName)
VALUES (1, 'Credit Card');

-- Insert data into Cards table
INSERT INTO Cards (CardID, PaymentMethodID, UserID, ExpireDates)
VALUES (1, 1, 1, '2025-12-31');

-- Insert data into BookInfo table
INSERT INTO BookInfo (Title, PublisherID, Price, Pages, AvaQuantity, PublishDate,ImageURL, Descriptions, LongDescriptions )
VALUES 
    (N'Hoàng Tử Bé', 1, 19.99, 300, 100, '2023-10-12', 'images/sale4.jpg', 'A thrilling fiction novel about adventures.', 'The Little Prince travels across different planets and meets various inhabitants, learning valuable life lessons. His journey is a profound exploration of love, loneliness, and friendship. Through his encounters, he reflects on the nature of human relationships and the essence of what truly matters. The story delves into the philosophical aspects of life and the innocence of childhood. It is a timeless tale that resonates with readers of all ages.'),
    (N'Mắt Biếc', 2, 19.99, 300, 100, '2023-05-20','images/sale36.jpg', 'A nostalgic story of unrequited love.', 'The story of Ngan, a boy from a small village, and his lifelong love for Ha Lan, his childhood friend. As they grow up, their paths diverge, but Ngan''s love remains steadfast. The novel captures the essence of rural Vietnam and the bittersweet nature of first love. Through Ngan''s eyes, readers experience the joys and sorrows of a love that endures despite the odds. The narrative is filled with vivid descriptions and poignant moments that highlight the complexities of human emotions.'),
    (N'Chân Lý Và Sự Thật', 1, 19.99, 300, 100, '2023-10-12','images/sale46.jpg', 'A thought-provoking exploration of truth and justice.', 'This book provides an in-depth analysis of political theories and their impact on modern society. It challenges readers to think critically about the nature of truth and justice. Through a series of essays and case studies, the author examines how different ideologies shape our understanding of these concepts. The book encourages readers to question established norms and consider alternative perspectives. It is a compelling read for anyone interested in political philosophy and social justice.'),
    (N'Yêu, Cần Phải Học', 2, 19.99, 300, 100, '2023-05-20','images/sale47.jpg', 'A guide to understanding and practicing love.', 'Love, a complex and multifaceted emotion, is explored in this comprehensive guide. The book delves into various aspects of love, from romantic relationships to familial bonds. Through real-life examples and expert insights, it offers practical advice on how to nurture and sustain loving relationships. Readers will learn about the importance of communication, trust, and empathy in building strong connections. The book also addresses common challenges and provides strategies for overcoming them. It is an essential read for anyone looking to deepen their understanding of love.'),
    (N'Vượt Bẫy Cảm Xúc', 3, 19.99, 300, 100, '2023-05-15','images/sale1.jpg', 'A thrilling fiction novel about adventures.', 'This novel takes readers on an emotional journey through the highs and lows of life. The protagonist faces various challenges that test their resilience and strength. Through their experiences, readers gain insight into the power of emotions and the importance of self-awareness. The narrative is filled with gripping moments and thought-provoking reflections. It is a story of personal growth and transformation, highlighting the importance of embracing one''s emotions. The book encourages readers to face their fears and pursue their dreams.'),
    (N'Bước Nhảy Tới Mùa Hè', 2, 29.99, 450, 75, '2022-10-20','images/sale41.jpg', 'A comprehensive guide to SQL databases.', 'This book offers step-by-step tutorials and real-world examples for mastering SQL. It covers everything from basic queries to advanced techniques. Readers will learn how to design, implement, and optimize SQL databases. The book also includes tips on troubleshooting and best practices for database management. With clear explanations and practical exercises, it is a valuable resource for both beginners and experienced professionals. The author''s expertise and experience shine through in this comprehensive guide.'),
    (N'Cảm Ơn Người Lớn', 1, 14.50, 200, 120, '2024-01-08','images/sale33.jpg', 'An exploration of modern scientific discoveries.', 'This book takes readers on a journey through the latest advancements in various scientific fields. It covers groundbreaking research and technological innovations. The author explains complex concepts in a way that is accessible to a broad audience. Through detailed descriptions and real-world examples, readers gain a deeper understanding of how science is transforming our world. The book also explores the ethical implications of scientific progress. It is a must-read for anyone interested in the future of science and technology.');

	--delete BookImage
	INSERT INTO BookLanguageInfo (LanguageName)
VALUES 
    ('English'),
    ('French'),
    ('Spanish'),
    ('German'),
    ('Chinese');
INSERT INTO BookLanguage (BookID, LanguageID)
VALUES 
	(5, 1),
	(5, 4),
    (1, 1), -- BookID 1 is available in English
    (1, 2), -- BookID 1 is also available in French
    (2, 3), -- BookID 2 is available in Spanish
    (2, 4), -- BookID 2 is also available in German
    (3, 5); -- BookID 3 is available in Chinese
	select * from BookLanguage
	-- Step 1: Insert Image URLs into ImageInfo table
INSERT INTO ImageInfo (ImageURL) VALUES 
	('images/sale1.jpg'),--vượt bẫy
    ('images/sale52.jpg'),
    ('images/sale53.jpg'),
	('images/sale4.jpg'),--hoàng tử bé
    ('images/sale54.jpg'),
    ('images/sale55.jpg');
	select * from ImageInfo
-- Step 2: Insert BookIDs and ImageIDs into BookImage table
INSERT INTO BookImage (BookID, ImageID) VALUES 
    (1, 4),  
    (1, 5),
    (1, 6),  
    (5, 1), 
    (5, 2), 
    (5, 3); 

INSERT INTO Comment (BookID, UserID, Comment, Rating,CommentDate) VALUES
    (1, 1, 'A timeless classic that everyone should read.', 5,'2024-05-08'),
    (5, 2, 'A beautiful story of love and nostalgia.', 4.5,'2024-04-08'),
    (5, 1, 'Very insightful and thought-provoking.', 5,'2024-07-08'),
    (5, 3, 'Great tips on understanding and practicing love.', 4,'2024-11-08'),
    (5, 2, 'An emotional rollercoaster of a book.', 4.5,'2024-06-08'),
    (1, 2, 'Very detailed and useful guide on SQL databases.', 5,'2024-03-08'),
    (1, 3, 'Fascinating insights into modern scientific discoveries.', 4,'2024-05-08');

INSERT INTO CategoryInfo (CategoryName, Quantity)
VALUES 
    (N'Tâm Lý', 4),
    (N'Cách Mạng-Chính Trị', 20),
    (N'Tình Cảm Học Đường', 5),
    (N'Manga', 35),
	(N'Comic Book', 35);
	select * from BookCategory
-- Insert data into BookCategory table
INSERT INTO BookCategory ( CategoryID,BookID)
VALUES 
   (1,1),
   (1,4),
   (1,5),
   (1,7),
   (1,9),
   (2,3),
   (3,2),
   (3,6),
   (4,12),
   (4,15),
   (5,11),
   (5,13);

   INSERT INTO Author (AuthorName, AuthorDOB, AuthorEmail, AuthorDescript, AuthorImageURL)
VALUES
(N'Nguyễn Nhật Ánh', '1955-05-07', 'nhatanh@example.com', 'Famous Vietnamese author', 'images/author1.jpg'),
('Karuho Shiina', '1975-10-08', 'karuhoshiina@example.com', 'Popular Japanese manga artist', 'images/author2.jpg'),
('Clamp', '1989-04-01', 'clamp@example.com', 'Japanese manga artist team', 'images/author3.jpg'),
('Antoine de Saint-Exupéry', '1900-06-29', 'exupery@example.com', 'French writer and aviator', 'images/author4.jpg'),
('Susan David', '1970-09-13', 'susandavid@example.com', 'Psychologist and author', 'images/author5.jpg');

-- Books by Nguyễn Nhật Ánh
INSERT INTO BookInfo (Title, PublisherID, Price, Pages, AvaQuantity, PublishDate, ImageURL, Descriptions, LongDescriptions)
VALUES 
    (N'Kính Vạn Hoa', 1, 25.00, 150, 50, '1995-01-01', 'images/kinhvanhoa1.jpg', 'A series of stories about the adventures of a group of children.', 'Kính Vạn Hoa is a popular series of children’s books by Nguyễn Nhật Ánh. The series follows the adventures and humorous exploits of a group of friends, providing readers with insights into Vietnamese culture and the experiences of youth.'),
    (N'Cho Tôi Xin Một Vé Đi Tuổi Thơ', 1, 30.00, 200, 80, '2008-01-01', 'images/chotoixinmotve.jpg', 'A nostalgic journey back to childhood.', 'In "Cho Tôi Xin Một Vé Đi Tuổi Thơ", Nguyễn Nhật Ánh takes readers on a nostalgic journey back to childhood. The book reflects on the innocence and imagination of youth, capturing the essence of growing up in Vietnam.'),
    (N'Ngồi Khóc Trên Cây', 1, 28.00, 250, 60, '2013-01-01', 'images/ngoikhoctrencay.jpg', 'A touching story of love and friendship.', 'Ngồi Khóc Trên Cây is a touching story of love and friendship set in the Vietnamese countryside. The novel explores the emotional journey of its characters, highlighting the values of compassion and understanding.');

-- Books by Karuho Shiina
INSERT INTO BookInfo (Title, PublisherID, Price, Pages, AvaQuantity, PublishDate, ImageURL, Descriptions, LongDescriptions)
VALUES 
    ('Kimi ni Todoke Vol.1', 2, 15.99, 180, 200, '2006-05-10', 'images/kiminitodoke1.jpg', 'A heartwarming story of friendship and love.', 'Kimi ni Todoke follows the life of Sawako Kuronuma, who is often misunderstood because of her resemblance to the horror movie character Sadako. However, her life changes when she befriends the popular boy, Shota Kazehaya.'),
    ('Crazy For You', 2, 16.99, 190, 180, '2003-02-13', 'images/crazyforyou1.jpg', 'A story of complicated teenage love.', 'Crazy For You is a manga that explores the emotional highs and lows of teenage love and relationships. The main character navigates her feelings and the complexities of growing up.'),
    ('Kimi ni Todoke Vol.2', 2, 17.99, 200, 170, '2008-09-26', 'images/kiminitodoke2.jpg', 'A romantic journey of self-discovery and love.', 'This manga continues the story of Sawako Kuronuma, a high school girl often misunderstood because of her resemblance to the horror film character Sadako. In this volume, Sawako starts to open up more to her classmates and develops deeper relationships, particularly with Shouta Kazehaya. The themes of self-discovery, overcoming social anxiety, and developing friendships and romance are beautifully illustrated. It’s a heartwarming tale that resonates with readers through its portrayal of personal growth and love.');

--select * from BookInfo
-- Books by Clamp
INSERT INTO BookInfo (Title, PublisherID, Price, Pages, AvaQuantity, PublishDate, ImageURL, Descriptions, LongDescriptions)
VALUES 
    ('Cardcaptor Sakura', 3, 20.99, 150, 150, '1996-05-15', 'images/cardcaptorsakura.jpg', 'A magical adventure of a young girl.', 'Cardcaptor Sakura follows the adventures of Sakura Kinomoto, who accidentally releases a set of magical cards and must retrieve them to prevent catastrophe. The series combines elements of fantasy, magic, and romance.'),
    ('Tsubasa: Reservoir Chronicle', 3, 22.99, 220, 140, '2003-04-12', 'images/tsubasa.jpg', 'A cross-dimensional journey of love and friendship.', 'Tsubasa: Reservoir Chronicle is a story about Syaoran and Sakura, who travel through different dimensions to collect pieces of Sakura''s lost memories. The series is known for its complex plot and crossover with other Clamp works.'),
    ('XXXHolic', 3, 21.99, 210, 130, '2003-02-24', 'images/xxxholic.jpg', 'A supernatural tale of wishes and consequences.', 'XXXHolic follows Kimihiro Watanuki, who has the ability to see spirits and works for Yuko Ichihara, a witch who grants wishes. The series explores themes of fate, destiny, and the supernatural.');

-- Books by Antoine de Saint-Exupéry
INSERT INTO BookInfo (Title, PublisherID, Price, Pages, AvaQuantity, PublishDate, ImageURL, Descriptions, LongDescriptions)
VALUES 
    ('Flight to Arras', 2, 21.99, 160, 300, '1942-12-01', 'images/flighttoarras.jpg', 'A reflective account of a wartime reconnaissance mission.', 'Flight to Arras is a poignant memoir by Antoine de Saint-Exupéry, chronicling his experiences during a reconnaissance mission over Arras, France, in World War II. The book reflects on themes of bravery, loss, and the futility of war, offering deep insights into the human condition'),
    ('Night Flight', 2, 19.99, 160, 400, '1931-10-21', 'images/nightflight.jpg', 'A story of aviation and human spirit.', 'Night Flight is a novel that captures the excitement and dangers of early aviation. It explores the courage and determination of pilots and the challenges they face.'),
    ('Wind, Sand and Stars', 2, 20.99, 180, 350, '1939-02-20', 'images/windsandstars.jpg', 'A memoir of flying and reflections on life.', 'Wind, Sand and Stars is a memoir by Antoine de Saint-Exupéry that recounts his experiences as a pilot. It is a reflection on life, human nature, and the beauty of the world seen from the sky.');

-- Books by Susan David
INSERT INTO BookInfo (Title, PublisherID, Price, Pages, AvaQuantity, PublishDate, ImageURL, Descriptions, LongDescriptions)
VALUES 
    ('Emotional Agility', 3, 24.99, 240, 300, '2016-09-06', 'images/emotionalagility.jpg', 'A guide to managing emotions and thriving in life.', 'Emotional Agility is a practical guide that helps readers understand and manage their emotions to navigate life''s challenges and achieve personal growth. It offers strategies for developing emotional resilience and living a fulfilling life.'),
    ('The Gifts of Imperfection', 3, 22.99, 220, 250, '2010-08-27', 'images/giftsofimperfection.jpg', 'A journey to embrace your true self.', 'The Gifts of Imperfection encourages readers to embrace their true selves and let go of the fear of imperfection. It provides insights and practices for cultivating self-compassion, authenticity, and wholehearted living.'),
    ('Rising Strong', 3, 23.99, 230, 280, '2015-08-25', 'images/risingstrong.jpg', 'A powerful book about resilience and recovery.', 'Rising Strong is about the process of recovering from setbacks and failures. Susan David explores how embracing our vulnerabilities and learning from our experiences can lead to greater strength and resilience.');

	-- Book-Author Relationships for Nguyễn Nhật Ánh
INSERT INTO BookAuthor (BookID, AuthorID)
VALUES 
    ((SELECT BookID FROM BookInfo WHERE Title = N'Kính Vạn Hoa'), (SELECT AuthorID FROM Author WHERE AuthorName = N'Nguyễn Nhật Ánh')),
    ((SELECT BookID FROM BookInfo WHERE Title = N'Cho Tôi Xin Một Vé Đi Tuổi Thơ'), (SELECT AuthorID FROM Author WHERE AuthorName = N'Nguyễn Nhật Ánh')),
    ((SELECT BookID FROM BookInfo WHERE Title = N'Ngồi Khóc Trên Cây'), (SELECT AuthorID FROM Author WHERE AuthorName = N'Nguyễn Nhật Ánh'));

-- Book-Author Relationships for Karuho Shiina
INSERT INTO BookAuthor (BookID, AuthorID)
VALUES 
    ((SELECT BookID FROM BookInfo WHERE Title = 'Kimi ni Todoke Vol.1'), (SELECT AuthorID FROM Author WHERE AuthorName = 'Karuho Shiina')),
    ((SELECT BookID FROM BookInfo WHERE Title = 'Crazy For You'), (SELECT AuthorID FROM Author WHERE AuthorName = 'Karuho Shiina')),
    ((SELECT BookID FROM BookInfo WHERE Title =  'Kimi ni Todoke Vol.2'), (SELECT AuthorID FROM Author WHERE AuthorName = 'Karuho Shiina'));

-- Book-Author Relationships for Clamp
INSERT INTO BookAuthor (BookID, AuthorID)
VALUES 
    ((SELECT BookID FROM BookInfo WHERE Title = 'Cardcaptor Sakura'), (SELECT AuthorID FROM Author WHERE AuthorName = 'Clamp')),
    ((SELECT BookID FROM BookInfo WHERE Title = 'Tsubasa: Reservoir Chronicle'), (SELECT AuthorID FROM Author WHERE AuthorName = 'Clamp')),
    ((SELECT BookID FROM BookInfo WHERE Title = 'XXXHolic'), (SELECT AuthorID FROM Author WHERE AuthorName = 'Clamp'));

-- Book-Author Relationships for Antoine de Saint-Exupéry
INSERT INTO BookAuthor (BookID, AuthorID)
VALUES 
    ((SELECT BookID FROM BookInfo WHERE Title = 'Flight to Arras'), (SELECT AuthorID FROM Author WHERE AuthorName = 'Antoine de Saint-Exupéry')),
    ((SELECT BookID FROM BookInfo WHERE Title = 'Night Flight'), (SELECT AuthorID FROM Author WHERE AuthorName = 'Antoine de Saint-Exupéry')),
       ((SELECT BookID FROM BookInfo WHERE Title = N'Hoàng Tử Bé'), (SELECT AuthorID FROM Author WHERE AuthorName = 'Antoine de Saint-Exupéry')),
   ((SELECT BookID FROM BookInfo WHERE Title = 'Wind, Sand and Stars'), (SELECT AuthorID FROM Author WHERE AuthorName = 'Antoine de Saint-Exupéry'));

--for Susan David
	INSERT INTO BookAuthor (BookID, AuthorID)
VALUES 
    ((SELECT BookID FROM BookInfo WHERE Title = 'Emotional Agility'), (SELECT AuthorID FROM Author WHERE AuthorName = 'Susan David')),
    ((SELECT BookID FROM BookInfo WHERE Title = 'The Gifts of Imperfection'), (SELECT AuthorID FROM Author WHERE AuthorName = 'Susan David')),
    ((SELECT BookID FROM BookInfo WHERE Title = 'Rising Strong'), (SELECT AuthorID FROM Author WHERE AuthorName = 'Susan David'));

INSERT INTO CartItem (UserID, BookID, LanguageID, Quantity, Price,TotalPrice) VALUES
(2, 5,4, 2, 31.98,2*31.98),
(2, 2,3, 3, 53.97,3*53.97),
(3, 1,2, 1, 15.99,1*15.99);

--insert shippingMethod
INSERT INTO ShippingMethodInfo (MethodName, Cost) VALUES ('Standard Shipping', 5.99);
INSERT INTO ShippingMethodInfo (MethodName, Cost) VALUES ('Express Shipping', 9.99);
INSERT INTO ShippingMethodInfo (MethodName, Cost) VALUES ('Overnight Shipping', 19.99);
INSERT INTO ShippingMethodInfo (MethodName, Cost) VALUES ('International Shipping', 29.99);

--insert discountinfo
INSERT INTO Discount (DiscountName, DiscountValue) VALUES ('Summer Sale', 10);
INSERT INTO Discount (DiscountName, DiscountValue) VALUES ('Black Friday', 20);
INSERT INTO Discount (DiscountName, DiscountValue) VALUES ('Holiday Special', 15);
INSERT INTO Discount (DiscountName, DiscountValue) VALUES ('Clearance', 5);

--insert BookDiscount
INSERT INTO BookDiscount (BookID, DiscountID) VALUES (12, 1);
INSERT INTO BookDiscount (BookID, DiscountID) VALUES (10, 1);
INSERT INTO BookDiscount (BookID, DiscountID) VALUES (14, 1);
INSERT INTO BookDiscount (BookID, DiscountID) VALUES (11, 1);
INSERT INTO BookDiscount (BookID, DiscountID) VALUES (1, 1);
INSERT INTO BookDiscount (BookID, DiscountID) VALUES (3, 2);
INSERT INTO BookDiscount (BookID, DiscountID) VALUES (2, 2);
INSERT INTO BookDiscount (BookID, DiscountID) VALUES (5, 3);
INSERT INTO BookDiscount (BookID, DiscountID) VALUES (4, 4);

drop table Discount

select * from Users

 SELECT CartItem.UserID, BookID, Quantity, Price
 FROM CartItem inner join Users on CartItem.UserID=Users.UserID
 WHERE Users.UserName = 'john_doe'

 select * from CartItem
 select * from BookInfo

 --============== TRIGGER ================
 CREATE TRIGGER trg_UpdateDiscountPrice
ON BookDiscount
AFTER INSERT, UPDATE
AS
BEGIN
    -- Update PriceDiscount for books in BookDiscount
    UPDATE BookInfo
    SET PriceDiscount = Price - (Price * d.DiscountValue / 100)
    FROM BookInfo b
    INNER JOIN inserted i ON b.BookID = i.BookID
    INNER JOIN Discount d ON d.DiscountID = i.DiscountID

    -- Update PriceDiscount for books not in BookDiscount
    UPDATE BookInfo
    SET PriceDiscount = Price
    FROM BookInfo b
    LEFT JOIN BookDiscount bd ON b.BookID = bd.BookID
    WHERE bd.BookID IS NULL
END

update BookInfo set PriceDiscount = NULL
 --========================================

update CartItem set quantity = 3 where CartItemID=1
update CartItem set TotalPrice =Quantity*Price

 Delete CartItem where CartItemID= 6
--drop database BookstoreDB
--drop table Author
--drop table BookAuthor
--drop table BookCategory
--drop table CategoryInfo
--drop table Comment
--drop table BookLanguage
--drop table CartItem