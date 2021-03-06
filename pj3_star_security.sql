USE [master]
GO
/****** Object:  Database [Project3_Db_Star_Security]    Script Date: 7/4/2022 4:46:28 PM ******/
CREATE DATABASE [Project3_Db_Star_Security]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project3_Db_Star_Security', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SA\MSSQL\DATA\Project3_Db_Star_Security.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project3_Db_Star_Security_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SA\MSSQL\DATA\Project3_Db_Star_Security_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
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
ALTER DATABASE [Project3_Db_Star_Security] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project3_Db_Star_Security] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Project3_Db_Star_Security', N'ON'
GO
ALTER DATABASE [Project3_Db_Star_Security] SET QUERY_STORE = OFF
GO
USE [Project3_Db_Star_Security]
GO
/****** Object:  Table [dbo].[About]    Script Date: 7/4/2022 4:46:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Business]    Script Date: 7/4/2022 4:46:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Career]    Script Date: 7/4/2022 4:46:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 7/4/2022 4:46:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 7/4/2022 4:46:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 7/4/2022 4:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credential](
	[UserGroupId] [varchar](50) NOT NULL,
	[RoleId] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 7/4/2022 4:46:29 PM ******/
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
/****** Object:  Table [dbo].[Footer]    Script Date: 7/4/2022 4:46:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 7/4/2022 4:46:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 7/4/2022 4:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Summary] [nvarchar](max) NULL,
	[MetaTitle] [varchar](256) NULL,
	[Description] [nvarchar](max) NULL,
	[UrlImage] [nvarchar](256) NULL,
	[NewsCategoryId] [uniqueidentifier] NULL,
	[Warranty] [int] NULL,
	[MetaKeywords] [nvarchar](256) NULL,
	[MetaDescriptions] [nvarchar](256) NULL,
	[TopHot] [datetime] NULL,
	[ViewCount] [int] NULL,
	[Tag] [nvarchar](256) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Content__3214EC0722536217] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsCategory]    Script Date: 7/4/2022 4:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsCategory](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](256) NULL,
	[MetaTitle] [varchar](256) NULL,
	[ParentId] [int] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](256) NULL,
	[MetaKeywords] [nvarchar](256) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/4/2022 4:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
	[Status] [bit] NOT NULL,
	[Price] [decimal](18, 0) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/4/2022 4:46:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 7/4/2022 4:46:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/4/2022 4:46:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 7/4/2022 4:46:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[About] ([Id], [Title], [Description], [Content], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (N'd79746dc-1669-4eef-ad50-141ff0aa768a', N'Giới thiệu thông tin sản phẩm, sứ mệnh sản phẩm', N'An toàn là một trong những điều rất quan trọng trong cuộc sống hàng ngày. Chính vì điều đó Star Security mong muốn đem đến sự những dịch vụ bảo vệ giúp các bạn dễ dàng hơn trong việc thoải mái vui chơi cũng như tận hưởng cuộc sống.', N'<p>An toàn l&agrave; một trong những điều kh&ocirc;ng thể thiếu trong cuộc sống của mỗi người. Ch&iacute;nh v&igrave; điều đ&oacute; Star Security mong muốn đem đến những dịch vụ bảo vệ mới nhất được cập nhật thường xuy&ecirc;n gi&uacute;p c&aacute;c bạn dễ d&agrave;ng hơn trong việc lựa chọn.</p>

<p>Star Security&nbsp;được biết đến với những dịch vụ bảo vệ cao cấp, liên kết trực tiếp với những c&ocirc;ng ty bảo vệ uy t&iacute;n trên thế giới, cao cấp m&agrave; kh&ocirc;ng qua trung gian, đảm bảo về chất lượng v&agrave; gi&aacute; th&agrave;nh &hellip; Star security cung cấp mọi kiểu bảo vệ: Dịch vụ nhân viên bảo vệ, dịch vụ bảo vệ từ xa, dịch vụ phòng chống cháy nổ, ...;Thật dễ d&agrave;ng, chỉ với một click bạn c&oacute; thể nhanh ch&oacute;ng nhận được sự bảo vệ còn hơn cả Chúa trời từ Star Security.</p>

<h2><strong>Li&ecirc;n hệ với ch&uacute;ng t&ocirc;i:</strong></h2>

<p>Phone: 0947 569 488</p>

<p>Website:&nbsp;<a href="http://www.freestyleshop.com/">www.starsecutiry.com/</a></p>

<p>Facebook:&nbsp;<a href="https://www.facebook.com/freestyleshop">https://www.facebook.com/starsecutiry</a></p>

<p>Facebook &nbsp;ch&iacute;nh:&nbsp;https://www.facebook.com/starsecutiry</p>

<h2><strong>Star security cam kết:</strong></h2>

<p>- Dịch vụ thật giống 100% quảng cáo;.</p>

<p>- Các hình thức bảo vệ mới cập nhật li&ecirc;n tục.</p>

<p>- Dịch vụ bảo vệ chất lượng</p>

<p>- Gi&aacute; th&agrave;nh phải chăng</p>

<p>- B&aacute;n h&agrave;ng nhiệt t&igrave;nh tư vấn</p>

<h2><strong>C&aacute;ch thức đặt h&agrave;ng online:</strong></h2>

<p>Bước 1: Chọn dịch vụ.</p>

<p>Bước 2: Li&ecirc;n hệ qua điện thoại tr&ecirc;n website để x&aacute;c nhận: gi&aacute; cả, t&igrave;nh trạng .</p>

<p>Bước 4: Nhận điện thoại x&aacute;c nhận đơn h&agrave;ng từ Star Security.</p>

<p>Bước 5: Ngồi chơi và nhận được sự bảo vệ</p>

<p>Bước 6: Qu&yacute; anh chị v&agrave; c&aacute;c bạn vui l&ograve;ng th&ocirc;ng b&aacute;o x&aacute;c nhận đ&atilde; cho Star Security. Xin cảm ơn!</p>

<p>Số t&agrave;i khoản:</p>

<p>Ng&acirc;n h&agrave;ng BIDV (chi nh&aacute;nh H&agrave; Nội)</p>

<p>Số t&agrave;i khoản: 21119999999999</p>

<p>Chủ t&agrave;i khoản: Lê Tài Phúc</p>

<p>Star Security rất vui được phục vụ c&aacute;c bạn!</p>', 0, N'admin', NULL, NULL, NULL)
GO
INSERT [dbo].[Business] ([Id], [Name], [Description], [UrlImage], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'41101388-f1ab-47c1-afbe-3124ff18f074', N'Dịch vụ bảo vệ', N'Dịch vụ cung cấp nhân viên bảo vệ để bảo vệ các hội nghị, sự kiện, ...', N'/Content/Data/files/SHIELD-guard.png', NULL, N'admin', NULL, NULL, 0)
INSERT [dbo].[Business] ([Id], [Name], [Description], [UrlImage], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'e1442f25-a15b-4c41-b5c1-39dc530958af', N'Dịch vụ khác', N'Dịch vụ khác', N'/Content/Data/files/SHIELD-other.png', NULL, N'admin', NULL, NULL, 0)
INSERT [dbo].[Business] ([Id], [Name], [Description], [UrlImage], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'8584d690-033e-4f90-af70-af670206abaa', N'Dịch vụ phòng chống cháy nổ', N'Dịch vụ cung cấp các giải pháp phòng chống cháy nổ', N'/Content/Data/files/SHIELD-fire.png', NULL, N'admin', NULL, NULL, 0)
INSERT [dbo].[Business] ([Id], [Name], [Description], [UrlImage], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'7db8eba6-e796-4e5b-a183-cca3b0b35a18', N'Dịch vụ carema', N'Dịch vụ cung cấp sự bảo vệ bằng camera', N'/Content/Data/files/SHIELD-camera.png', NULL, N'admin', NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([Id], [Title], [ObjectName], [Address], [Mobile], [Website], [Email], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (1, N'Show Room 1', N'Cơ sở Hà Nội', N'Số 1 Hoàng Hoa Thám, Hà Nội', N'080.431.00', N'https://starsecutiry.com', N'starsecurity@gmail.com', NULL, N'admin', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'ADD_USER')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'CREATE_CREDENTIAL')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'CREATE_ROLE')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'CREATE_USER_GROUP')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'DELETE_CREDENTIAL')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'DELETE_ROLE')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'DELETE_USER')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'DELETE_USER_GROUP')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'EDIT_USER')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'UPDATE_ROLE')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'UPDATE_USER_GROUP')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'VIEW_CREDENTIAL')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'VIEW_LAYOUT')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'VIEW_ROLE')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'VIEW_USER')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'VIEW_USER_GROUP')
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (1, N'Trang chủ', N'/', 1, NULL, N'_self', NULL, NULL, NULL, N'admin', 0)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (2, N'Giới thiệu', N'/About', 2, NULL, N'_self', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (3, N'Tin tức', N'/New/GetAllNews', 3, NULL, N'_self', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (4, N'Liên hệ', N'#', 4, NULL, N'_self', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (5, N'Thông tin liên hệ', N'#Contact', 1, 4, N'_self', NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
INSERT [dbo].[NewsCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [MetaKeywords], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'c10eff8e-99ae-4855-8812-6a801b312e68', N'Tin thế giới', NULL, NULL, 1, N'tin-the-gioi', N'tin-the-gioi', CAST(N'2022-04-07T13:42:08.2315550+07:00' AS DateTimeOffset), N'admin', NULL, NULL, 0)
GO
INSERT [dbo].[Order] ([Id], [UserName], [Email], [Phone], [Address], [Description], [Status], [Price], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'60b25c61-f9d2-45f5-b431-ed9266e1d2c9', N'Phạm Văn Hoàng', N'vanve@gmail.com', N'0355637536', N'Sơn La', N'Muốn thuê vệ sĩ để làm vườn', 0, CAST(3500000 AS Decimal(18, 0)), NULL, N'admin', NULL, NULL, 0)
GO
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'ADD_USER', N'Thêm User')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'CREATE_CREDENTIAL', N'Thêm Credential')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'CREATE_ROLE', N'Thêm Role')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'CREATE_USER_GROUP', N'Thêm UserGroup')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'DELETE_CREDENTIAL', N'Xóa Credential')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'DELETE_ROLE', N'Xóa Role')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'DELETE_USER', N'Xóa User')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'DELETE_USER_GROUP', N'Xóa UserGroup')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'EDIT_USER', N'Cập nhật User')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'UPDATE_CREDENTIAL', N'Cập nhật Credential')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'UPDATE_ROLE', N'Cập nhật Role')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'UPDATE_USER_GROUP', N'Cập nhật UserGroup')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'VIEW_CREDENTIAL', N'Xem Credential')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'VIEW_LAYOUT', N'Xem giao diện')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'VIEW_ROLE', N'Xem Role')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'VIEW_USER', N'Xem User')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'VIEW_USER_GROUP', N'Xem UserGroup')
GO
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([Id], [UrlImage], [DisplayOrder], [Link], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (1, N'/Content/Client/images/security_banner_1.jpg', 1, NULL, NULL, NULL, N'admin', NULL, NULL, 0)
INSERT [dbo].[Slide] ([Id], [UrlImage], [DisplayOrder], [Link], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (2, N'/Content/Client/images/security_banner_2.jpg', 2, NULL, NULL, NULL, N'admin', NULL, NULL, 0)
INSERT [dbo].[Slide] ([Id], [UrlImage], [DisplayOrder], [Link], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (3, N'/Content/Client/images/security_banner_3.jpg', 3, NULL, NULL, NULL, N'admin', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Slide] OFF
GO
INSERT [dbo].[User] ([Id], [GroupId], [AvatarUrl], [UserName], [Password], [ConfirmPassword], [FirstName], [LastName], [ResetPasswordCode], [Email], [Address], [Age], [Code], [Phone], [Qualification], [DepartmentId], [Grade], [ClientId], [Achievements], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'41101388-f1ab-47c1-afbe-3124ff18f074', N'MEMBER', NULL, N'member', N'e10adc3949ba59abbe56e057f20f883e', N'e10adc3949ba59abbe56e057f20f883e', N'Hoàng', N'Kim Chúc', NULL, N'hkimchuc140399@gmail.com', N'60 An Chân, Hồng Bàng, Sở Dầu', 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[User] ([Id], [GroupId], [AvatarUrl], [UserName], [Password], [ConfirmPassword], [FirstName], [LastName], [ResetPasswordCode], [Email], [Address], [Age], [Code], [Phone], [Qualification], [DepartmentId], [Grade], [ClientId], [Achievements], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'f6dfcece-f0c2-4d10-91a5-32032d70dda2', N'ADMIN', NULL, N'admin', N'e10adc3949ba59abbe56e057f20f883e', N'e10adc3949ba59abbe56e057f20f883e', N'Trần ', N'Việt Hà', NULL, N'vietha93@gmail.com', N'Yên Bái', 29, NULL, N'0965742351', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[User] ([Id], [GroupId], [AvatarUrl], [UserName], [Password], [ConfirmPassword], [FirstName], [LastName], [ResetPasswordCode], [Email], [Address], [Age], [Code], [Phone], [Qualification], [DepartmentId], [Grade], [ClientId], [Achievements], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'a38b955a-0a9a-4aa4-8788-752c46cf88e9', N'MEMBER', NULL, N'member2', N'e10adc3949ba59abbe56e057f20f883e', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn', N'Xuân Chi', NULL, N'chinguyen@gmail.com', N'Bắc Ninh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-04-07T16:38:42.6732077+07:00' AS DateTimeOffset), N'admin', NULL, NULL, 0)
GO
INSERT [dbo].[UserGroup] ([Id], [Name]) VALUES (N'ADMIN', N'Quản trị viên')
INSERT [dbo].[UserGroup] ([Id], [Name]) VALUES (N'MEMBER', N'Thành viên')
INSERT [dbo].[UserGroup] ([Id], [Name]) VALUES (N'MOD', N'Moderitor')
GO
ALTER TABLE [dbo].[Career]  WITH CHECK ADD FOREIGN KEY([BusinessId])
REFERENCES [dbo].[Business] ([Id])
GO
ALTER TABLE [dbo].[Credential]  WITH CHECK ADD FOREIGN KEY([UserGroupId])
REFERENCES [dbo].[UserGroup] ([Id])
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
