USE [master]
GO
/****** Object:  Database [Project3_Db_Star_Security]    Script Date: 4/4/2022 10:03:06 PM ******/
CREATE DATABASE [Project3_Db_Star_Security]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project3_Db_Star_Security', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVERNEW\MSSQL\DATA\Project3_Db_Star_Security.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Project3_Db_Star_Security_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVERNEW\MSSQL\DATA\Project3_Db_Star_Security_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Project3_Db_Star_Security] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project3_Db_Star_Security].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project3_Db_Star_Security] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET RECOVERY FULL 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET  MULTI_USER 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project3_Db_Star_Security] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Project3_Db_Star_Security', N'ON'
GO
USE [Project3_Db_Star_Security]
GO
/****** Object:  Table [dbo].[About]    Script Date: 4/4/2022 10:03:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Business]    Script Date: 4/4/2022 10:03:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Business](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[UrlImage] [nvarchar](max) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Career]    Script Date: 4/4/2022 10:03:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Career](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Description] [nvarchar](max) NULL,
	[UrlImage] [nvarchar](max) NULL,
	[BusinessId] [uniqueidentifier] NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 4/4/2022 10:03:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[UrlImage] [nvarchar](256) NULL,
	[Email] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [varchar](20) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 4/4/2022 10:03:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](256) NULL,
	[ObjectName] [nvarchar](256) NULL,
	[Address] [nvarchar](256) NULL,
	[Mobile] [varchar](20) NULL,
	[Website] [varchar](256) NULL,
	[Email] [varchar](256) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 4/4/2022 10:03:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credential](
	[UserGroupId] [varchar](50) NOT NULL,
	[RoleId] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 4/4/2022 10:03:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](256) NULL,
	[Address] [nvarchar](256) NULL,
	[Content] [nvarchar](max) NULL,
	[Reply] [nvarchar](max) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 4/4/2022 10:03:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[Id] [uniqueidentifier] NOT NULL,
	[CoppyRight] [nvarchar](100) NULL,
	[Address] [nvarchar](256) NULL,
	[PhoneNumber] [nvarchar](256) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 4/4/2022 10:03:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](256) NOT NULL,
	[Link] [nvarchar](256) NULL,
	[DisplayOrder] [int] NULL,
	[ParentId] [int] NULL,
	[Target] [nvarchar](256) NOT NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 4/4/2022 10:03:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ShipName] [nvarchar](256) NOT NULL,
	[ShipPhone] [nvarchar](50) NOT NULL,
	[ShipAddress] [nvarchar](256) NOT NULL,
	[ShipEmail] [varchar](256) NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 4/4/2022 10:03:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[UserId] [uniqueidentifier] NOT NULL,
	[OrderId] [uniqueidentifier] NOT NULL,
	[Day] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 4/4/2022 10:03:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 4/4/2022 10:03:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UrlImage] [nvarchar](256) NOT NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](256) NULL,
	[Description] [nvarchar](256) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/4/2022 10:03:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[GroupId] [varchar](50) NULL,
	[AvatarUrl] [nvarchar](256) NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[ConfirmPassword] [varchar](50) NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[ResetPasswordCode] [nvarchar](100) NULL,
	[Email] [varchar](256) NULL,
	[Address] [nvarchar](max) NULL,
	[Age] [int] NULL,
	[Code] [varchar](50) NULL,
	[Phone] [varchar](20) NULL,
	[Qualification] [nvarchar](max) NULL,
	[DepartmentId] [uniqueidentifier] NULL,
	[Grade] [nvarchar](max) NULL,
	[ClientId] [uniqueidentifier] NULL,
	[Achievements] [nvarchar](max) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 4/4/2022 10:03:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[Id] [varchar](50) NOT NULL,
	[Name] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Business] ([Id], [Name], [Description], [UrlImage], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'41101388-f1ab-47c1-afbe-3124ff18f074', N'Dịch vụ bảo vệ', N'Dịch vụ cung cấp nhân viên bảo vệ để bảo vệ các hội nghị, sự kiện, ...', NULL, NULL, N'admin', NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([Id], [Title], [ObjectName], [Address], [Mobile], [Website], [Email], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (1, N'Show Room 1', N'Cơ sở Hà Nội', N'Số 1 Hoàng Hoa Thám, Hà Nội', N'080.431.00', N'https://starsecutiry.com', N'starsecurity@gmail.com', NULL, N'admin', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (1, N'Trang chủ', N'/', 1, NULL, N'_self', NULL, NULL, NULL, N'admin', 0)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (2, N'Giới thiệu', N'/About', 2, NULL, N'_self', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (3, N'Tin tức', N'/New/GetAllNews', 3, NULL, N'_self', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (4, N'Liên hệ', N'#', 4, NULL, N'_self', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (5, N'Thông tin liên hệ', N'#Contact', 1, 4, N'_self', NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([Id], [UrlImage], [DisplayOrder], [Link], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (1, N'/Content/Client/images/security_banner_1.jpg', 1, NULL, NULL, NULL, N'admin', NULL, NULL, 0)
INSERT [dbo].[Slide] ([Id], [UrlImage], [DisplayOrder], [Link], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (2, N'/Content/Client/images/security_banner_2.jpg', 2, NULL, NULL, NULL, N'admin', NULL, NULL, 0)
INSERT [dbo].[Slide] ([Id], [UrlImage], [DisplayOrder], [Link], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (3, N'/Content/Client/images/security_banner_3.jpg', 3, NULL, NULL, NULL, N'admin', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Slide] OFF
GO
ALTER TABLE [dbo].[Career]  WITH CHECK ADD FOREIGN KEY([BusinessId])
REFERENCES [dbo].[Business] ([Id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Career] ([Id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([GroupId])
REFERENCES [dbo].[UserGroup] ([Id])
GO
USE [master]
GO
ALTER DATABASE [Project3_Db_Star_Security] SET  READ_WRITE 
GO
