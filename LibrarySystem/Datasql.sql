﻿USE [schoolDB]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spDeleteStudent]
(
@Id int)

as 
begin 
	delete from Student where Id = @Id
end 
 

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 create proc [dbo].[spGetAllStudent]
 as 
 begin 
	select * from Student
 end 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spGetStudentById]
(
@Id int)

as 
begin 
	select * from Student where Id = @Id
end 

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spInsertStudent]
(@FName nvarchar (100)=null,
@LName nvarchar (100)=null,
@Age int,
@Sex nvarchar (50)=null)

as 
begin 
	insert into Student (FName, LName, Age, Sex) values (@FName, @LName, @Age, @Sex)
end 
 

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
     
CREATE PROCEDURE [dbo].[sprocUserinfoInsertUpdateSingleItem]    
(    
  
@Name nvarchar(50)=NULL    
,@Address nvarchar(100)=NULL    
,@EmailID nvarchar=NULL    
,@Mobilenumber varchar(10)=NULL    
    
)    
AS    
  
BEGIN    
    
 INSERT    
 INTO [Userinfo]    
 (    
  Name    
,Address    
,EmailID    
,Mobilenumber    
    
 )    
  VALUES    
  (    
  @Name    
,@Address    
,@EmailID    
,@Mobilenumber    
    
 )    
   SELECT SCOPE_IDENTITY()  
end  
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[spUpdateStudent]
(
@Id int,
@FName nvarchar (100),
@LName nvarchar (100),
@Age int,
@Sex nvarchar (50))

as 
begin 
	update Student set FName = @FName, LName = @LName, Age= @Age, Sex=@Sex where Id = @Id
end 
 
 


GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [nvarchar](100) NULL,
	[Lname] [nvarchar](100) NULL,
	[State] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](100) NULL,
	[LName] [nvarchar](100) NULL,
	[Age] [int] NULL,
	[Sex] [nvarchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Userinfo]    Script Date: 18/05/2018 2:34:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Userinfo](
	[userid] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[EmailID] [nvarchar](50) NULL,
	[Mobilenumber] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Fname], [Lname], [State], [City]) VALUES (1, N'Wasim', N'Ahmed', N'CA', N'Dhaka')
INSERT [dbo].[Employee] ([Id], [Fname], [Lname], [State], [City]) VALUES (2, N'Newaj', N'Shahriar', N'PO', N'Khilkhet')
INSERT [dbo].[Employee] ([Id], [Fname], [Lname], [State], [City]) VALUES (3, N'Faisal', N'Porag', N'CA', N'Kishoreganj')
INSERT [dbo].[Employee] ([Id], [Fname], [Lname], [State], [City]) VALUES (4, N'Sam', N'Shuvo', N'QS', N'Rangpur')
INSERT [dbo].[Employee] ([Id], [Fname], [Lname], [State], [City]) VALUES (5, N'Nur E Jahan', N'Kunjo', N'CA', N'Dhaka')
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [FName], [LName], [Age], [Sex]) VALUES (1, N'Faisal', N'Porag', 23, N'Male')
INSERT [dbo].[Student] ([Id], [FName], [LName], [Age], [Sex]) VALUES (3, N'Wasim', N'Ahmed', 24, N'Male')
INSERT [dbo].[Student] ([Id], [FName], [LName], [Age], [Sex]) VALUES (4, N'Rahman', N'Karim ', 25, N'Male')
INSERT [dbo].[Student] ([Id], [FName], [LName], [Age], [Sex]) VALUES (9, N'Rabiul', N'Kabir', 30, N'Male')
INSERT [dbo].[Student] ([Id], [FName], [LName], [Age], [Sex]) VALUES (10, N'Nue e', N'Jahan', 21, N'Female')
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[Userinfo] ON 

INSERT [dbo].[Userinfo] ([userid], [Name], [Address], [EmailID], [Mobilenumber]) VALUES (1, N'Porag', N'Dhaka', N'p', N'0174133772')
INSERT [dbo].[Userinfo] ([userid], [Name], [Address], [EmailID], [Mobilenumber]) VALUES (2, N'Porag', N'Dhaka', N'p', N'0174133772')
SET IDENTITY_INSERT [dbo].[Userinfo] OFF
