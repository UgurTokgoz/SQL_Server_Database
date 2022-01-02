--IMDB
Create Database IMDB
Go
Use IMDB

--Actors
Create Table Actors
(
	ID int primary key identity(1,1),
	FirstName nvarchar(50) not null,
	LastName nvarchar(50) not null,
	Gender nvarchar(15)
)

-- Movies
Create Table Movies
(
	ID int primary key identity(1,1),
	Name nvarchar(50) not null,
	Year smallint not null,
	Rank float
)

-- Roles
Create Table Roles
(
	ActorID int foreign key references Actors(ID),
	MovieID int foreign key references Movies(ID),
	Role nvarchar(50) not null,
	primary key (ActorID,MovieID)
)

-- MovieGenres
Create Table MovieGenres
(
	MovieID int primary key references Movies(ID),
	Genre nvarchar(50) not null,	
)

-- Directors
Create Table Directors
(
	ID int primary key identity(1,1),
	FirstName nvarchar(50) not null,
	LastName nvarchar(50) not null
)

-- MovieDirectors
Create Table MovieDirectors
(
	DirectorID int foreign key references Directors(ID),
	MovieID int foreign key references Movies(ID),
	primary key (DirectorID,MovieID)
)

Go

-- Veri Ekleme
Insert into Actors (FirstName,LastName,Gender)
	Values ('Hazal','KAYA','Kadýn'),
			('Tuba','BÜYÜKÜSTÜN','Kadýn'),
			('Eda','ECE','Kadýn'),
			('Demet','ÖZDEMÝR','Kadýn'),
			('Gizem','KARACA','Kadýn'),
			('Taner','ÖLMEZ','Erkek'),
			('Kadir','DOÐULU','Erkek'),
			('Burak','ÖZÇÝVÝT','Erkek'),
			('Murat','YILDIRIM','Erkek'),
			('Burak','ALKAÞ','Erkek')

Go
Insert into Movies (Name,Year,Rank)
	Values ('Pirates of the Caribbean: At World''s End',2007,4.8),
			('John Carter',2012,4.5),
			('Avatar',2009,4.9),
			('The Avengers',2012,4.7),
			('X-Men: The Last Stand',2006,4.4),
			('Titanic',1997,4.9),
			('Transformers: Dark of the Moon',2011,4.6),
			('Poseidon',2006,4.3),
			('Inception',2010,4.4),
			('Robin Hood',2010,4.3),
			('G.I. Joe: The Rise of Cobra',2009,4.5),
			('Terminator 3: Rise of the Machines',2003,4.3),
			('Up',2009,4.7),
			('2012',2009,4.8),
			('Superman Returns',2006,4.5)

Go
Insert into Roles (ActorID,MovieID,Role)
	Values (6,1,'Jack Sparow'),
			(7,2,'John Wick'),
			(1,3,'Neytiri'),
			(2,4,'Natalia'),
			(8,5,'Wolverine'),
			(3,6,'Rose'),
			(9,7,'Bumblebee'),
			(10,8,'Zeus'),
			(4,9,'Ariadne'),
			(5,10,'Lady Marian'),
			(10,11,'Captain Duke'),
			(9,12,'John Connor'),
			(8,13,'Carl'),
			(7,14,'Jackson'),
			(6,15,'Superman')

Go
Insert into MovieGenres (Genre,MovieID)
	Values ('Aksiyon',1),
			('Bilim Kurgu',2),
			('Bilim Kurgu',3),
			('Bilim Kurgu',4),
			('Bilim Kurgu',5),
			('Romantik',6),
			('Bilim Kurgu',7),
			('Macera',8),
			('Macera',9),
			('Fantastik',10),
			('Macera',11),
			('Bilim Kurgu',12),
			('Animasyon',13),
			('Aksiyon',14),
			('Fantastik',15)

Go
Insert into Directors (FirstName,LastName)
	Values ('Orson','WELLES'),
			('Akira','KUROSAWA'),
			('Andrey','TARKOVSKI'),
			('Sergei','EISENSTEIN'),
			('Ingmar','BERGMAN')

Go
Insert into MovieDirectors (DirectorID,MovieID)
	Values (1,1),
			(1,2),
			(1,3),
			(2,4),
			(2,5),
			(2,6),
			(2,7),
			(3,8),
			(3,9),
			(3,10),
			(4,11),
			(4,12),
			(4,13),
			(5,14),
			(5,15)

-- Kontrol
Go
Select * From Actors
Select * From Movies
Select * From Roles
Select * From Directors
Select * From MovieGenres
Select * From MovieDirectors

-- Sorgular
Go
Select
	COUNT(*) as 'Mevcut Film Sayýsý'
From Movies 

Select
	COUNT(*) as 'Mevcut Kadýn Oyuncu Sayýsý'
From Actors 
Where Gender = 'Kadýn'


Select
	Genre as 'Film Türü',
	COUNT(*) as 'Film Sayýsý'
From MovieGenres
Group By Genre
Order By 1

