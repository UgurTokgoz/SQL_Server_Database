create database BlogDB
go 

use BlogDB

create table AppUsers
(
  Id int identity (1,1),
  UserName nvarchar(20) not null,
  [Password] nvarchar (20) not null,
  CreateDate datetime2(7) not null,
  UpdateDate datetime2(7) null,
  DeleteDate datetime2(7)null,
  [Status] int not null
  constraint PK_AppUsers primary key clustered (Id asc)
)

create table Profiles
(
  Id int identity (1,1),
  FirstName nvarchar(20) not null,
  LastName nvarchar(20) not null,
  CreateDate datetime2(7) not null,
  UpdateDate datetime2(7) null,
  DeleteDate datetime2(7)null,
  [Status] int not null,
  AppUserID int not null,
  constraint PK_Profiles primary key clustered (Id asc),
  constraint FK_Profiles_AppUserId foreign key (AppUserId) references AppUsers(Id)
)

create table Editors
(
 Id int identity (1,1),
 UserName nvarchar(20) not null,
 [Password] nvarchar(20) not null,
 CreateDate datetime2(7) not null,
 UpdateDate datetime2(7) null,
 DeleteDate datetime2(7) null,
 [Status] int not null
 constraint PK_Editors primary key clustered (Id asc)
)

create table Categories
(
 Id int identity (1,1),
 CategoryName nvarchar(30) not null,
 [Description] nvarchar(50) not null,
 CreateDate datetime2(7) not null,
 UpdateDate datetime2(7) null,
 DeleteDate datetime2(7) null,
 [Status] int not null
 constraint PK_Categories primary key clustered (Id asc)
)

create table Articles
(
 Id int identity (1,1),
 Title nvarchar(50) not null,
 Content nvarchar (2000) not null,
 CreateDate datetime2(7) not null,
 UpdateDate datetime2(7) null,
 DeleteDate datetime2(7) null,
 [Status] int not null,
 AppUserId int not null,
 EditorId int not null,
 CategoryId int not null,
 constraint PK_Articles primary key clustered (Id asc),
 constraint FK_Articles_AppUserId foreign key (AppUserId) references AppUsers (Id),
 constraint Fk_Articles_EditorId foreign key (EditorId) references Editors (Id),
 constraint Fk_Articles_CategoryId foreign key (CategoryId) references Categories (Id)
)

create table Comments
(
 Id int identity (1,1),
 Content nvarchar (2000),
 CreateDate datetime2(7) not null,
 UpdateDate datetime2(7) null,
 DeleteDate datetime2(7) null,
 [Status] int not null,
 AppUserId int not null,
 ArticleId int not null,
 constraint PK_Comments primary key clustered (Id asc),
 constraint FK_Comments_AppUserId foreign key (AppUserId) references AppUsers (Id),
 constraint FK_Comments_ArticleId foreign key (ArticleId) references Articles (Id)
)

create table Tags
(
 Id int identity (1,1),
 TagName nvarchar(50) not null,
 CreateDate datetime2(7) not null,
 UpdateDate datetime2(7) null,
 DeleteDate datetime2(7) null,
 [Status] int not null,
 constraint PK_Tags primary key clustered (Id asc) 
)

create table ArticleTags
(
 Id int identity (1,1),
 ArticleId int not null,
 TagId int not null,
 CreateDate datetime2(7) not null,
 UpdateDate datetime2(7) null,
 DeleteDate datetime2(7) null,
 [Status] int not null,
 constraint PK_ArticleTags primary key clustered (Id asc),
 constraint FK_ArticleTags_ArticleId foreign key (ArticleId) references Articles (Id),
 constraint FK_ArticleTags_TagId foreign key (TagId) references Tags (Id)
)



