USE [master]
GO
/****** Object:  Database [Project3_Db]    Script Date: 7/21/2021 9:58:09 AM ******/
CREATE DATABASE [Project3_Db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project3_Db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVERNEW\MSSQL\DATA\Project3_Db.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Project3_Db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVERNEW\MSSQL\DATA\Project3_Db_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Project3_Db] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project3_Db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project3_Db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project3_Db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project3_Db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project3_Db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project3_Db] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project3_Db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project3_Db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project3_Db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project3_Db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project3_Db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project3_Db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project3_Db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project3_Db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project3_Db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project3_Db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Project3_Db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project3_Db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project3_Db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project3_Db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project3_Db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project3_Db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project3_Db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project3_Db] SET RECOVERY FULL 
GO
ALTER DATABASE [Project3_Db] SET  MULTI_USER 
GO
ALTER DATABASE [Project3_Db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project3_Db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project3_Db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project3_Db] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Project3_Db', N'ON'
GO
USE [Project3_Db]
GO
/****** Object:  Table [dbo].[About]    Script Date: 7/21/2021 9:58:09 AM ******/
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
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 7/21/2021 9:58:09 AM ******/
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
 CONSTRAINT [PK__Contact__3214EC07B68E50F5] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 7/21/2021 9:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credential](
	[UserGroupId] [varchar](50) NOT NULL,
	[RoleId] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Credential_1] PRIMARY KEY CLUSTERED 
(
	[UserGroupId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 7/21/2021 9:58:09 AM ******/
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
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Feedback__3214EC07ABFD67FA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 7/21/2021 9:58:09 AM ******/
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
 CONSTRAINT [PK__Footer__3214EC07852F6A97] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 7/21/2021 9:58:09 AM ******/
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
 CONSTRAINT [PK__Menu__3214EC079B6A10D6] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 7/21/2021 9:58:09 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsCategory]    Script Date: 7/21/2021 9:58:09 AM ******/
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
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Category__3214EC07DEE8C6AA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/21/2021 9:58:09 AM ******/
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
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Order__3214EC07DF9E2F66] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/21/2021 9:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductId] [uniqueidentifier] NOT NULL,
	[OrderId] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/21/2021 9:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Code] [decimal](18, 0) NULL,
	[MetaTitle] [nvarchar](256) NULL,
	[Description] [nvarchar](max) NULL,
	[UrlImage] [nvarchar](256) NULL,
	[Price] [decimal](18, 0) NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[IncludeVAT] [bit] NULL,
	[Quantity] [int] NULL,
	[ProductCategoryId] [uniqueidentifier] NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[MetaKeywords] [nvarchar](256) NULL,
	[MetaDescriptions] [nvarchar](max) NULL,
	[TopHot] [bit] NULL,
	[IsNormalProduct2] [bit] NULL,
	[IsNormalProduct1] [bit] NULL,
	[IsNewProduct] [bit] NULL,
	[ViewCount] [int] NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Product__3214EC072E0A9E49] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 7/21/2021 9:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](256) NULL,
	[MetaTitle] [varchar](256) NULL,
	[ParentId] [int] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](256) NULL,
	[MetaKeywords] [nvarchar](256) NULL,
	[MetaDescriptions] [nvarchar](256) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__ProductC__3214EC077834B296] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/21/2021 9:58:09 AM ******/
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
/****** Object:  Table [dbo].[Slide]    Script Date: 7/21/2021 9:58:09 AM ******/
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
 CONSTRAINT [PK__Slide__3214EC073DFECF16] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/21/2021 9:58:09 AM ******/
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
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__User__3214EC07B2B93D14] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 7/21/2021 9:58:09 AM ******/
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
INSERT [dbo].[About] ([Id], [Title], [Description], [Content], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (N'71725cfd-cf6d-49d9-b152-9102907d997e', N'Giới thiệu thông tin cửa hàng,  sứ mệnh cửa hàng', N'Ga là một trong những phụ kiện không thể thiếu góp phần tạo nên những đám cháy nổi bật. Chính vì điều đó Gas Xịn mong muốn đem đến những bình ga mới nhất được cập nhật thường xuyên giúp các bạn dễ dàng hơn trong việc lựa chọn và cập nhật những cách cháy nổ thịnh hành của ngành cháy nổ trong nước và thế giới.', N'<p>Bình ga l&agrave; một trong những phụ kiện kh&ocirc;ng thể thiếu g&oacute;p phần tạo n&ecirc;n phong c&aacute;ch cháy nổ của mỗi người. Ch&iacute;nh v&igrave; điều đ&oacute; Gas Vip Pro mong muốn đem đến những bình ga mới nhất được cập nhật thường xuy&ecirc;n gi&uacute;p c&aacute;c bạn dễ d&agrave;ng hơn trong việc lựa chọn v&agrave; cập nhật những phong cách cháy nổ thịnh h&agrave;nh của ngành cháy nổ trong nước v&agrave; thế giới.</p>

<p>Gas Vip Pro&nbsp;được biết đến với những sản phẩm bếp ga, bình ga hợp thời trang, nhập trực tiếp từ những c&ocirc;ng ty ga uy t&iacute;n, cao cấp m&agrave; kh&ocirc;ng qua trung gian, đảm bảo về chất lượng v&agrave; gi&aacute; th&agrave;nh &hellip; Gas Vip Pro cung cấp mọi kiểu d&aacute;ng bếp ga, bình ga, ... mới nhất: Bình to b&uacute;p b&ecirc;, bình nhỏ tro cốt, bình b&aacute;nh mỳ, bình bệt, bình vải &hellip;.Nếu l&agrave; một người y&ecirc;u thời trang, t&igrave;m kiếm những phong c&aacute;ch mới, th&igrave; bạn kh&ocirc;ng thể bỏ qua những xu hướng nổi bật của việc bốc cháy : combat gas, gas orford, ga ra ô tô, gas kim loại, phong c&aacute;ch sporty với gas đế b&aacute;nh m&igrave;&hellip;Thật dễ d&agrave;ng, chỉ với một click bạn c&oacute; thể nhanh ch&oacute;ng sở hữu ch&uacute;ng trong tủ đồ của m&igrave;nh với Gas Vip Pro.</p>

<h2><strong>Li&ecirc;n hệ với ch&uacute;ng t&ocirc;i:</strong></h2>

<p>Phone: 0947 569 488</p>

<p>Website:&nbsp;<a href="http://www.freestyleshop.com/">www.freestyleshop.com/</a></p>

<p>Facebook:&nbsp;<a href="https://www.facebook.com/freestyleshop">https://www.facebook.com/freestyleshop</a></p>

<p>Facebook &nbsp;ch&iacute;nh:&nbsp;https://www.facebook.com/freestyleshop</p>

<h2><strong>Free Style Shop cam kết:</strong></h2>

<p>- H&agrave;ng thật giống 100% ảnh chụp về kiểu d&aacute;ng, mẫu m&atilde;.</p>

<p>- Mẫu mới cập nhật li&ecirc;n tục.</p>

<p>- Sản phẩm chất lượng</p>

<p>- Gi&aacute; th&agrave;nh phải chăng</p>

<p>- Phương thức vận chuyển thuận tiện. ( Ship h&agrave;ng to&agrave;n quốc, nhận chuyển h&agrave;ng COD )</p>

<p>- H&agrave;ng lu&ocirc;n c&oacute; sẵn trong kho.</p>

<p>- B&aacute;n h&agrave;ng nhiệt t&igrave;nh tư vấn</p>

<h2><strong>C&aacute;ch thức đặt h&agrave;ng online:</strong></h2>

<p>Bước 1: Chọn mẫu.</p>

<p>Bước 2: Li&ecirc;n hệ qua điện thoại hoặc giỏ h&agrave;ng tr&ecirc;n website để x&aacute;c nhận t&igrave;nh trạng của h&agrave;ng mẫu: m&agrave;u sắc, xuất xứ, số lượng, gi&aacute; cả, t&igrave;nh trạng c&ograve;n h&agrave;ng hay hết h&agrave;ng.</p>

<p>Bước 3: Đặt h&agrave;ng qua giỏ h&agrave;ng hoặc gọi điện trực tiếp cho Free Style Shop.</p>

<p>Bước 4: Nhận điện thoại x&aacute;c nhận đơn đặt h&agrave;ng từ Free Style Shop.</p>

<p>Bước 5: Nhận h&agrave;ng, kiểm tra, thanh to&aacute;n tiền( &Aacute;p dụng cho kh&aacute;ch d&ugrave;ng dịch vụ chuyển h&agrave;ng COD)--&gt; Ph&iacute; ship 50k</p>

<p>Kh&aacute;ch h&agrave;ng chuyển khoản trước: --&gt; ph&iacute; ship 30k.<br />
Kh&aacute;ch h&agrave;ng ở H&agrave; Nội --&gt; ph&iacute; ship 20k.<br />
FREE SHIP đơn h&agrave;ng&nbsp; lớn hơn 1 triệu v&agrave; kh&aacute;ch h&agrave;ng thanh to&aacute;n trước.</p>

<p>Bước 6: Qu&yacute; anh chị v&agrave; c&aacute;c bạn vui l&ograve;ng th&ocirc;ng b&aacute;o x&aacute;c nhận đ&atilde; nhận h&agrave;ng cho Free Style Shop. Xin cảm ơn!</p>

<p>Số t&agrave;i khoản:</p>

<p>Ng&acirc;n h&agrave;ng BIDV (chi nh&aacute;nh H&agrave; Nội)</p>

<p>Số t&agrave;i khoản: 21119999999999</p>

<p>Chủ t&agrave;i khoản: Lê Tài Phúc</p>

<p>Free Style Shop rất vui được phục vụ c&aacute;c bạn!</p>
', 0, NULL, NULL, N'tung2512', CAST(N'2020-12-20T11:18:10.2854690+07:00' AS DateTimeOffset))
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([Id], [Title], [ObjectName], [Address], [Mobile], [Website], [Email], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (1, N'Show Room 1', N'Cơ sở Hà Nội', N'Số 1 Hoàng Hoa Thám, Hà Nội', N'080.431.00', N'https://freestylehanoi.com.vn', N'freestylehanoi@gmail.com', CAST(N'2019-05-29T12:22:26.0000000+07:00' AS DateTimeOffset), N'admin', CAST(N'2021-07-08T19:37:14.7001247+07:00' AS DateTimeOffset), N'datnt', 0)
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
INSERT [dbo].[Feedback] ([Id], [Name], [Phone], [Email], [Address], [Content], [Reply], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'69223726-b6ae-4363-9ef4-5aa90f732a97', N'Hoàng Kim Chúc', N'0936038620', N'hkimchuc140399@gmail.com', N'60 An Chân, Hồng Bàng, Sở Dầu', N'Mình đã nhận được sản phẩm của cty r. Sản phẩm của cty dùng rất tốt nhà mình từ 1 căn nhà 200m2 khang trang, sạch đẹp nó đã biến thành 1 đống bình địa tro tàn. Cảm ơn cty, chúc cty làm ăn gặp nhiều điều tốt đẹp và luôn luôn giữ vững phong độ hiện tại :v', NULL, CAST(N'2021-07-10T09:31:18.0827066+07:00' AS DateTimeOffset), NULL, NULL, NULL, 0)
INSERT [dbo].[Feedback] ([Id], [Name], [Phone], [Email], [Address], [Content], [Reply], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'bb5bb9d0-2352-44f1-8ae4-861651d6fe06', N'Hoàng Kim Chúc', N'0936038620', N'hkimchuc140399@gmail.com', N'60 An Chân, Hồng Bàng, Sở Dầu', N'Đợi mãi vẫn chưa thấy mang hàng tới. Cty làm ăn chán', N'Xin lỗi vì sự chậm trễ này. Công ty sẽ mang hàng đến cho bạn ngay ạ!', CAST(N'2021-07-10T09:15:31.9424845+07:00' AS DateTimeOffset), NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (1, N'Trang chủ', N'/', 1, NULL, N'_self', CAST(N'2019-05-27T16:17:45.9225714+07:00' AS DateTimeOffset), NULL, NULL, N'admin', 0)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (2, N' Giới thiệu', N'/About', 2, NULL, N'_self', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (3, N'Tin tức', N'/New/GetAllNews', 3, NULL, N'_self', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (4, N'Sản phẩm', N'/Product/getAllProduct', 4, NULL, N'_self', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (5, N'Liên hệ', N'#', 5, NULL, N'_self', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (6, N'Thông tin liên hệ', N'#Contact', 1, 5, N'_self', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (7, N'Góp ý', N'/FeedBack/ContactFromCustomer', 2, 5, N'_self', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (8, N'Phản hồi ý kiến khách hàng', N'/FeedBack/ReplyFeedBack', 3, 5, N'_self', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (9, N'Khuyến mãi', N'/New/NewsCategoryDetail/khuyen-mai/54827e7d-0868-4243-9fb1-130c92d03375', 1, 3, N'_self', CAST(N'2019-06-09T17:13:06.0990506+07:00' AS DateTimeOffset), N'admin', NULL, NULL, 0)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (10, N'Sự kiện', N'/New/NewsCategoryDetail/su-kien/e39e121b-c4d4-468c-83df-8602cc45b8c3', 2, 3, N'_self', CAST(N'2019-06-09T17:18:30.1729160+07:00' AS DateTimeOffset), N'admin', NULL, NULL, 0)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (11, N'Chăm sóc khách hàng', N'/New/NewsCategoryDetail/cham-soc-khach-hang/84c32b56-608d-415b-9558-8305d43bbf15', 3, 3, N'_self', CAST(N'2019-06-09T17:20:35.8215820+07:00' AS DateTimeOffset), N'admin', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
INSERT [dbo].[News] ([Id], [Name], [Summary], [MetaTitle], [Description], [UrlImage], [NewsCategoryId], [Warranty], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tag], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'fe7f067e-1807-415d-a982-598ee29db8a0', N'10 cách phòng tránh cháy nổ bình gas nhất định bạn phải biết', N'Hiện nay các vụ cháy nổ gas ngày càng nhiều, đều xuất phát từ sự thiếu kiến thức về an toàn khi sử dụng gas, nếu bạn trang bị cho mình những kiến thức cơ bản tốt thì sẽ yên tâm sử dụng nguồn nguyên liệu sạch này một cách an toàn này rồi. Vì khi bạn thiếu hiểu biết về gas thì ngay cả khi bạn chuyển sang dùng các loại bếp điện nhưng không tìm hiểu thì nó cũng mang lại nhiều nguy hiểm hơn', N'kien-thuc-gas-an-toan', N'<h2><strong>1.&nbsp;Mua b&igrave;nh gas tại c&aacute;c cơ sở uy t&iacute;n</strong></h2>

<p>Đừng v&igrave; ham gi&aacute; rẻ m&agrave; ch&uacute;ng ta mua gas ở c&aacute;c cơ sở kinh doanh sang chiết gas lậu, v&igrave; những b&igrave;nh gas ở đ&acirc;y được sang chiết kh&ocirc;ng tu&acirc;n thủ an to&agrave;n về gas, b&igrave;nh gas thiếu k&iacute;, k&eacute;m chất lượng, vỏ b&igrave;nh th&igrave; kh&ocirc;ng được kiểm định an to&agrave;n g&acirc;y ch&aacute;y nổ rất cao. Vậy n&ecirc;n, bạn n&ecirc;n lựa chọn những cơ sở cung cấp gas uy t&iacute;n, chất lượng nhất như Gas Hướng Dương để tr&aacute;nh t&igrave;nh trạng mua nhầm gas giả.</p>

<h2><strong>2.&nbsp;Kiểm tra van gas, ống dẫn gas thường xuy&ecirc;n</strong></h2>

<p>Van gas v&agrave; ống dẫn gas phải được kiểm tra v&agrave; thay định kỳ. Kh&ocirc;ng được tự &yacute; đổi v&agrave; th&aacute;o dỡ linh kiện của m&igrave;nh gas.</p>

<p>Việc kiểm tra d&acirc;y dẫn v&agrave; van gas thường xuy&ecirc;n sẽ gi&uacute;p bạn tr&aacute;nh được t&igrave;nh trạng r&ograve; rỉ gas, vừa chống ch&aacute;y nổ xảy ra, vừa gi&uacute;p tiết kiệm gas trong qu&aacute; tr&igrave;nh sử dụng. Tất cả phải dưới sự hướng dẫn v&agrave; kiểm tra của nh&acirc;n vi&ecirc;n chăm s&oacute;c gas uy t&iacute;n, nhằm tr&aacute;nh t&igrave;nh trạng lừa đảo thay lắp van gas giả, k&eacute;m chất lượng.</p>

<h2><strong>3. Vị tr&iacute; lắp đặt bếp, b&igrave;nh gas đ&uacute;ng c&aacute;ch</strong></h2>

<p>Việc đặt bếp gas v&agrave; b&igrave;nh gas trong nh&agrave; bếp l&agrave; v&ocirc; c&ugrave;ng quan trọng. V&igrave; đối với người Việt Nam vấn đề phong thủy rất được ch&uacute; trọng v&agrave; đặt bếp, b&igrave;nh gas sao cho đảm bảo an to&agrave;n sử dụng gas cho cả gia đ&igrave;nh bạn lại c&agrave;ng được quan t&acirc;m</p>

<p>&nbsp;</p>

<p><img alt="" src="/Content/Data/images/cach-lap-dat-bep-am.png" style="height:410px; width:600px" /></p>

<h2><strong>4. Thường xuy&ecirc;n c&oacute; mặt quan s&aacute;t trong qu&aacute; tr&igrave;nh đun nấu</strong></h2>

<p>Để tr&aacute;nh t&igrave;nh trạng lửa bị tắt đột ngột nhưng hệ thống bơm gas vẫn hoạt động sẽ g&acirc;y r&ograve; rỉ gas. B&ecirc;n cạnh đ&oacute; kh&ocirc;ng n&ecirc;n d&ugrave;ng nồi c&oacute; đ&aacute;y lớn khi nấu tr&ecirc;n bếp gas mini v&igrave; ngọn lửa sẽ bao tr&ugrave;m xuống vị tr&iacute; c&oacute; b&igrave;nh gas rất nguy hiểm. Trong qu&aacute; tr&igrave;nh nấu nếu thấy ngọn lửa ch&aacute;y bất thường n&ecirc;n kh&oacute;a van v&agrave; kiểm tra lại bếp</p>

<h2><strong>5. Kh&oacute;a van gas sau khi sử dụng</strong></h2>

<p>Mỗi lần nấu ăn xong bạn n&ecirc;n kh&oacute;a&nbsp; van gas trước, để gas c&ograve;n thừa lại trong ống dẫn ch&aacute;y hết rồi tắt bếp. Tr&aacute;nh t&igrave;nh trạng chỉ tắt bếp sau khi đun nấu g&acirc;y ra t&igrave;nh trạng r&ograve; rỉ gas khi c&oacute; chuột cắn hoặc d&acirc;y dẫn sử dụng l&acirc;u bị hở</p>

<h2><strong>6. Kh&ocirc;ng n&ecirc;n sử dụng bếp gas qu&aacute; cũ</strong></h2>

<p>Bếp gas bị gỉ s&eacute;t, hư hỏng thường xuy&ecirc;n sửa chữa nhưng vẫn kh&ocirc;ng hoạt động b&igrave;nh thường th&igrave; bạn n&ecirc;n thay bếp mới ngay để tr&aacute;nh c&aacute;c t&iacute;nh trạng r&ograve; rỉ gas trong qu&aacute; tr&igrave;nh sử dụng. Sau khi nấu ăn xong th&igrave; bạn n&ecirc;n vệ sinh sạch sẽ, tr&aacute;nh để dầu mỡ b&aacute;m v&agrave;o g&acirc;y gỉ s&eacute;t để lu&ocirc;n duy tr&igrave; độ nhạy của bộ phận đ&aacute;nh lửa.</p>

<h2><strong>7. Y&ecirc;u cầu nh&acirc;n vi&ecirc;n kiểm tra bếp gas v&agrave; c&aacute;c thiết bị gas</strong></h2>

<p>Khi nh&acirc;n vi&ecirc;n của cửa h&agrave;ng đến nh&agrave; bạn lắp đặt b&igrave;nh gas, bạn n&ecirc;n kiểm tra kỹ ni&ecirc;m phong b&igrave;nh gas phải c&ograve;n nguy&ecirc;n vẹn, đồng thời y&ecirc;u cầu nh&acirc;n vi&ecirc;n kiểm tra đầu đốt bếp gas c&ograve;n hoạt động tốt hay kh&ocirc;ng v&agrave; c&aacute;c khớp nối giữa bếp với d&acirc;y dẫn gas c&oacute; bị vấn đề g&igrave; kh&ocirc;ng để xử l&yacute; kịp thời.</p>

<h2><strong>8. Kh&ocirc;ng n&ecirc;n sử dụng b&igrave;nh gas mini sang chiết nhiều lần</strong></h2>

<p>B&igrave;nh gas mini chỉ sử dụng được 1 lần duy nhất. N&ecirc;n khi mua bạn n&ecirc;n chọn mua ở nơi uy t&iacute;n như Gas Hướng Dương tr&aacute;nh t&igrave;nh trạng mua phải b&igrave;nh sang chiết k&eacute;m chất lượng bị gỉ s&eacute;t, biến dạng với gi&aacute; rẻ nhưng lại cực k&igrave; nguy hiểm khi sử dụng.</p>

<h2><strong>9. Dạy cho trẻ em biết những nguy hiểm khi nghịch bếp gas</strong></h2>

<p>Do hiếu động n&ecirc;n nhiều đứa trẻ, nhất l&agrave; nh&oacute;m lẫm chẫm biết đi thường rất th&iacute;ch nghịch lửa, bật thử bếp gas v&agrave; khi lửa ch&aacute;y đ&atilde; kh&ocirc;ng biết c&aacute;ch xử l&yacute; n&ecirc;n bị thương, thậm ch&iacute; c&ograve;n bị tử vong do ngạt thở hoặc bị bỏng. N&ecirc;n lắp bếp gas, l&ograve; vi s&oacute;ng ngo&agrave;i tầm với của trẻ v&agrave; kh&ocirc;ng để vật dễ ch&aacute;y gần bếp, đ&oacute;ng van an to&agrave;n, kho&aacute; bếp trước khi ra khỏi nh&agrave;.</p>

<h2><strong>10. Biết c&aacute;ch xử l&yacute; khi r&ograve; rỉ gas</strong></h2>

<p>R&ograve; rỉ kh&iacute; gas rất nghi&ecirc;m trọng n&ecirc;n bạn phải nắm r&otilde; c&aacute;c nguy&ecirc;n tắc xử l&yacute; nhanh như đ&oacute;ng van gas, mở tất cả c&aacute;c nguồn điện v&agrave; cảnh b&aacute;o mọi người trong gia đ&igrave;nh biết kh&ocirc;ng được bật bất k&igrave; c&ocirc;ng tắc đ&egrave;n hay m&aacute;y quạt&hellip; sẽ sinh ra tia lửa điện v&agrave; g&acirc;y ch&aacute;y.</p>
', N'/Content/Data/files/chay-no.jpg', N'84c32b56-608d-415b-9558-8305d43bbf15', NULL, N'kien-thuc-gas', NULL, NULL, NULL, NULL, CAST(N'2021-07-15T15:49:34.0000000+07:00' AS DateTimeOffset), N'admin1', CAST(N'2021-07-15T15:53:38.7354488+07:00' AS DateTimeOffset), N'admin1', 0)
INSERT [dbo].[News] ([Id], [Name], [Summary], [MetaTitle], [Description], [UrlImage], [NewsCategoryId], [Warranty], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tag], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'95990191-2d95-4010-b0cc-7e5579d19b02', N'Cuối tuần linh đình - Bếp ga deal đỉnh', N'Cuối tuần sale đã - Ở nhà yên tâm', N'sale-dinh-cuoi-tuan', N'<p>Happy Weekend 16-18/7 (Ch&aacute;y c&ugrave;ng Euro)</p>

<p>Giảm gi&aacute; đến 50%</p>

<p>Trả g&oacute;p 0%</p>

<p>Mua online giảm th&ecirc;m 1.000.000đ</p>
', N'/Content/Data/files/sale-euro.png', N'54827e7d-0868-4243-9fb1-130c92d03375', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-07-15T14:12:50.8841123+07:00' AS DateTimeOffset), N'admin1', NULL, NULL, 0)
GO
INSERT [dbo].[NewsCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [MetaKeywords], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'54827e7d-0868-4243-9fb1-130c92d03375', N'Khuyến mãi', N'khuyen-mai', NULL, 1, N'khuyen-mai', N'khuyen-mai', CAST(N'2021-07-15T13:31:52.0632137+07:00' AS DateTimeOffset), N'admin1', NULL, NULL, 0)
INSERT [dbo].[NewsCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [MetaKeywords], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'84c32b56-608d-415b-9558-8305d43bbf15', N'Chăm sóc khách hàng', N'cham-soc-khach-hang', NULL, 3, N'cham-soc-khach-hang', N'cham-soc-khach-hang', CAST(N'2021-07-15T15:18:14.9602987+07:00' AS DateTimeOffset), N'admin1', NULL, NULL, 0)
INSERT [dbo].[NewsCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [MetaKeywords], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'e39e121b-c4d4-468c-83df-8602cc45b8c3', N'Sự kiện', N'su-kien', NULL, 2, N'su-kien', N'su-kien', CAST(N'2021-07-15T15:14:20.8869620+07:00' AS DateTimeOffset), N'admin1', NULL, NULL, 0)
GO
INSERT [dbo].[Order] ([Id], [UserId], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'a3264d0b-1d28-453c-9cdd-027893f92d6e', N'41101388-f1ab-47c1-afbe-3124ff18f074', N'Hoàng Kim Chúc', N'0936038620', N'247 Cầu Giấy, Dịch Vọng, Cầu Giấy, Hà Nội', N'hkimchuc140399@gmail.com', 0, CAST(N'2021-07-10T08:57:01.4877664+07:00' AS DateTimeOffset), N'hkimchuc140399@gmail.com', NULL, NULL, 1)
INSERT [dbo].[Order] ([Id], [UserId], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'0d46d470-588a-40e2-9367-32ca2f17df1b', N'41101388-f1ab-47c1-afbe-3124ff18f074', N'Hoàng Kim Chúc', N'0936038620', N'247 Cầu Giấy, Hà Nội', N'hkimchuc140399@gmail.com', 0, CAST(N'2021-07-20T15:27:35.0527621+07:00' AS DateTimeOffset), N'hkimchuc140399@gmail.com', NULL, NULL, 1)
INSERT [dbo].[Order] ([Id], [UserId], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'960569a0-a627-4ba7-be96-388747c090a8', N'41101388-f1ab-47c1-afbe-3124ff18f074', N'Hoàng Kim Chúc', N'0936038620', N'247 Cầu Giấy, Hà Nội', N'hkimchuc140399@gmail.com', 0, CAST(N'2021-07-20T15:37:41.9852926+07:00' AS DateTimeOffset), N'hkimchuc140399@gmail.com', NULL, NULL, 1)
INSERT [dbo].[Order] ([Id], [UserId], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'5aa9a89c-043c-47e0-93a1-38ed88d17b9a', N'41101388-f1ab-47c1-afbe-3124ff18f074', N'Hoàng Kim Chúc', N'0936038620', N'247 Cầu Giấy, Dịch Vọng, Cầu Giấy, Hà Nội', N'hkimchuc140399@gmail.com', 0, CAST(N'2021-07-20T15:47:07.3292988+07:00' AS DateTimeOffset), N'hkimchuc140399@gmail.com', NULL, NULL, 1)
INSERT [dbo].[Order] ([Id], [UserId], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'3449dd38-53e0-4087-aedd-3f06702825e6', N'41101388-f1ab-47c1-afbe-3124ff18f074', N'Hoàng Kim Chúc', N'0936038620', N'247 Cầu Giấy, Hà Nội', N'hkimchuc140399@gmail.com', 0, CAST(N'2021-07-20T15:31:10.0982705+07:00' AS DateTimeOffset), N'hkimchuc140399@gmail.com', NULL, NULL, 1)
INSERT [dbo].[Order] ([Id], [UserId], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'5d2984ea-6e9a-450c-8879-40c3c4cc86d1', N'41101388-f1ab-47c1-afbe-3124ff18f074', N'Hoàng Kim Chúc', N'0936038620', N'247 Cầu Giấy, Dịch Vọng, Cầu Giấy, Hà Nội', N'hkimchuc140399@gmail.com', 0, CAST(N'2021-07-20T15:49:21.7955803+07:00' AS DateTimeOffset), N'hkimchuc140399@gmail.com', NULL, NULL, 1)
INSERT [dbo].[Order] ([Id], [UserId], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'06b2a74a-a207-4a45-8c47-586815c1cbad', N'41101388-f1ab-47c1-afbe-3124ff18f074', N'Hoàng Kim Chúc', N'0936038620', N'247 Cầu Giấy, Dịch Vọng, Cầu Giấy, Hà Nội', N'hkimchuc140399@gmail.com', 0, CAST(N'2021-07-09T16:14:13.1648322+07:00' AS DateTimeOffset), N'hkimchuc140399@gmail.com', NULL, NULL, 0)
INSERT [dbo].[Order] ([Id], [UserId], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'b6487e41-7b54-4291-b636-612e22ddbad0', N'41101388-f1ab-47c1-afbe-3124ff18f074', N'Hoàng Kim Chúc', N'0936038620', N'247 Cầu Giấy, Dịch Vọng, Cầu Giấy, Hà Nội', N'hkimchuc140399@gmail.com', 0, CAST(N'2021-07-20T15:41:00.7079823+07:00' AS DateTimeOffset), N'hkimchuc140399@gmail.com', NULL, NULL, 1)
INSERT [dbo].[Order] ([Id], [UserId], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'7a492383-5d17-4c57-960b-85ac8cc7676c', N'41101388-f1ab-47c1-afbe-3124ff18f074', N'Hoàng Kim Chúc', N'0936038620', N'247 Cầu Giấy, Dịch Vọng, Cầu Giấy, Hà Nội', N'hkimchuc140399@gmail.com', 0, CAST(N'2021-07-20T16:04:30.2213333+07:00' AS DateTimeOffset), N'hkimchuc140399@gmail.com', NULL, NULL, 0)
INSERT [dbo].[Order] ([Id], [UserId], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'ec2baa56-103f-47f6-b936-9b2fb559ee43', N'6d6b9a4d-ac3a-4416-9798-e9e12267336e', N'Nguyễn Hồng Ngọc', N'0985780770', N'Thái Bình', N'nguyenhongngoc1696@gmail.com', 0, CAST(N'2021-07-20T16:27:23.6438788+07:00' AS DateTimeOffset), N'nguyenhongngoc1696@gmail.com', NULL, NULL, 1)
INSERT [dbo].[Order] ([Id], [UserId], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'12bf0f4e-89c3-4087-82e7-b79a0b7d43dd', N'6d6b9a4d-ac3a-4416-9798-e9e12267336e', N'Nguyễn Hồng Ngọc', N'0985780770', N'247 Cầu Giấy, Dịch Vọng, Cầu Giấy, Hà Nội', N'nguyenhongngoc1696@gmail.com', 0, CAST(N'2021-07-20T16:29:07.6913857+07:00' AS DateTimeOffset), N'nguyenhongngoc1696@gmail.com', NULL, NULL, 1)
INSERT [dbo].[Order] ([Id], [UserId], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'5f1b466c-e296-4240-87cd-c57c32b9d170', N'41101388-f1ab-47c1-afbe-3124ff18f074', N'Hoàng Kim Chúc', N'0936038620', N'247 Cầu Giấy, Hà Nội', N'hkimchuc140399@gmail.com', 0, CAST(N'2021-07-20T15:00:14.2355638+07:00' AS DateTimeOffset), N'hkimchuc140399@gmail.com', NULL, NULL, 1)
INSERT [dbo].[Order] ([Id], [UserId], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'dda64426-cd6e-486b-83ba-db5278c96358', N'41101388-f1ab-47c1-afbe-3124ff18f074', N'Hoàng Kim Chúc', N'0936038620', N'247 Cầu Giấy, Dịch Vọng, Cầu Giấy, Hà Nội', N'hkimchuc140399@gmail.com', 0, CAST(N'2021-07-20T15:54:55.3987580+07:00' AS DateTimeOffset), N'hkimchuc140399@gmail.com', NULL, NULL, 0)
INSERT [dbo].[Order] ([Id], [UserId], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'10008086-1731-41be-85a6-e14ecfcd2c30', N'6d6b9a4d-ac3a-4416-9798-e9e12267336e', N'Nguyễn Hồng Ngọc', N'0985780770', N'Thái Bình', N'nguyenhongngoc1696@gmail.com', 0, CAST(N'2021-07-20T16:25:39.2176138+07:00' AS DateTimeOffset), N'nguyenhongngoc1696@gmail.com', NULL, NULL, 1)
GO
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [Quantity], [Price], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'e8ab3637-5fa0-4b12-93ce-0e11bde67845', N'06b2a74a-a207-4a45-8c47-586815c1cbad', 1, CAST(3358000 AS Decimal(18, 0)), CAST(N'2021-07-09T16:14:32.5268645+07:00' AS DateTimeOffset), N'hkimchuc140399@gmail.com', NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [UrlImage], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [ProductCategoryId], [Detail], [Warranty], [MetaKeywords], [MetaDescriptions], [TopHot], [IsNormalProduct2], [IsNormalProduct1], [IsNewProduct], [ViewCount], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'da078e5c-a992-4fdc-b8bb-003b5e9ebe20', N'Bếp ga âm Canzy CZ-27mi', CAST(2230000 AS Decimal(18, 0)), N'Bếp ga âm canzy cz-27mi', N'<p>Số bếp: 2</p>

<p>Hệ thống chia lửa:&nbsp;Đồng nguy&ecirc;n chất</p>

<p>K&iacute;ch thước mặt k&iacute;nh:&nbsp;73&nbsp;*43&nbsp;cm</p>

<p>K&iacute;ch thước kho&eacute;t đ&aacute;:&nbsp;68&nbsp;* 38&nbsp;cm</p>', N'/Content/Data/files/canzy-cz-27mi.jpg', CAST(3580000 AS Decimal(18, 0)), CAST(2620000 AS Decimal(18, 0)), NULL, 10, N'9f0de121-5036-4a23-a37e-176e1fab5ffc', N'Sản phẩm thương hiệu Ý', NULL, N'Bếp ga âm canzy cz-27mi', N'<p>Số bếp: 2</p>

<p>Hệ thống chia lửa:&nbsp;Đồng nguy&ecirc;n chất</p>

<p>Pep hầm:&nbsp;Đồng, tiết kiệm gas</p>

<p>Kiềng:&nbsp;Gang đ&uacute;c</p>

<p>Cảm ứng ngắt gas tự động: C&oacute;</p>

<p>Mặt k&iacute;nh:&nbsp;D&agrave;y 8mm, chịu lực chịu nhiệt cao</p>

<p>Hệ thống đ&aacute;nh lửa:&nbsp;Pin</p>

<p>K&iacute;ch thước mặt k&iacute;nh:&nbsp;73&nbsp;*43&nbsp;cm</p>

<p>K&iacute;ch thước kho&eacute;t đ&aacute;:&nbsp;68&nbsp;* 38&nbsp;cm</p>
', NULL, NULL, NULL, 1, NULL, CAST(N'2021-07-13T11:39:48.0576536+07:00' AS DateTimeOffset), N'admin1', NULL, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [UrlImage], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [ProductCategoryId], [Detail], [Warranty], [MetaKeywords], [MetaDescriptions], [TopHot], [IsNormalProduct2], [IsNormalProduct1], [IsNewProduct], [ViewCount], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'8cf42ce1-6f0d-4d97-9b1d-03cf821bf39e', N'Miss gas màu đỏ', CAST(200000 AS Decimal(18, 0)), N'Miss gas màu đỏ | Bình gas chống cháy nổ', N'<p>Loại gas: B&igrave;nh gas composite an to&agrave;n &ndash; chống ch&aacute;y nổ</p>

<p>Nh&agrave; sản xuất: C&ocirc;ng ty Composite Scandinavia (Thụy Điển)</p>

<p>M&agrave;u b&igrave;nh: Đỏ</p>
', N'/Content/Data/files/miss_red.png', CAST(359000 AS Decimal(18, 0)), NULL, 0, 5, N'f4e587a0-d114-4f30-946c-04c30e01b730', N'Bình gas an toàn cho mọi nhà đỡ sợ cháy nổ', NULL, N'Miss gas màu đỏ', N'<p>Loại gas: B&igrave;nh gas composite an to&agrave;n &ndash; chống ch&aacute;y nổ</p>

<p>Nh&agrave; sản xuất: C&ocirc;ng ty Composite Scandinavia (Thụy Điển)</p>

<p>M&agrave;u b&igrave;nh: Đỏ</p>

<p>Vỏ: Vỏ b&igrave;nh được sản xuất theo ti&ecirc;u chuẩn Ch&acirc;u &Acirc;u</p>

<p>C&aacute;ch nhiệt, c&aacute;ch điện, chống va đập, dẻo dai, chịu lực cao</p>

<p>Người ti&ecirc;u d&ugrave;ng thấy được lượng gas b&ecirc;n trong b&igrave;nh.</p>

<p>B&igrave;nh gas c&oacute; kiểu d&aacute;ng đẹp v&agrave; th&acirc;n thiện với Người Nội Trợ</p>

<p>Trọng lượng vỏ b&igrave;nh khoảng 7,5kg.</p>

<p>Van điều &aacute;p cao cấp 2 tầng nhập khẩu từ Đức</p>

<p>Khi bị r&ograve; rỉ gas ngay lập tức ngắt gas tự động</p>
', NULL, 1, NULL, NULL, NULL, CAST(N'2021-06-05T12:48:56.0000000+07:00' AS DateTimeOffset), N'admin1', CAST(N'2021-07-14T11:31:23.0430957+07:00' AS DateTimeOffset), NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [UrlImage], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [ProductCategoryId], [Detail], [Warranty], [MetaKeywords], [MetaDescriptions], [TopHot], [IsNormalProduct2], [IsNormalProduct1], [IsNewProduct], [ViewCount], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'836c11c8-c252-45b6-9604-08de7011869a', N'Miss gas màu xanh', CAST(200000 AS Decimal(18, 0)), N'Miss gas màu xanh | Bình gas chống cháy nổ', N'<p>Loại gas: B&igrave;nh gas composite an to&agrave;n &ndash; chống ch&aacute;y nổ</p>

<p>Nh&agrave; sản xuất: C&ocirc;ng ty Composite Scandinavia (Thụy Điển)</p>

<p>M&agrave;u b&igrave;nh: Xanh</p>
', N'/Content/Data/files/miss_green.jpeg', CAST(359000 AS Decimal(18, 0)), NULL, 0, 5, N'f4e587a0-d114-4f30-946c-04c30e01b730', N'Bình gas an toàn cho mọi nhà đỡ sợ cháy nổ', NULL, N'Miss gas màu xanh', N'<p>Loại gas: B&igrave;nh gas composite an to&agrave;n &ndash; chống ch&aacute;y nổ</p>

<p>Nh&agrave; sản xuất: C&ocirc;ng ty Composite Scandinavia (Thụy Điển)</p>

<p>M&agrave;u b&igrave;nh: Xanh</p>

<p>Vỏ: Vỏ b&igrave;nh được sản xuất theo ti&ecirc;u chuẩn Ch&acirc;u &Acirc;u</p>

<p>C&aacute;ch nhiệt, c&aacute;ch điện, chống va đập, dẻo dai, chịu lực cao</p>

<p>Người ti&ecirc;u d&ugrave;ng thấy được lượng gas b&ecirc;n trong b&igrave;nh.</p>

<p>B&igrave;nh gas c&oacute; kiểu d&aacute;ng đẹp v&agrave; th&acirc;n thiện với Người Nội Trợ</p>

<p>Trọng lượng vỏ b&igrave;nh khoảng 7,5kg.</p>

<p>Van điều &aacute;p cao cấp 2 tầng nhập khẩu từ Đức</p>

<p>Khi bị r&ograve; rỉ gas ngay lập tức ngắt gas tự động</p>
', NULL, 1, NULL, NULL, NULL, CAST(N'2021-06-05T12:48:56.0000000+07:00' AS DateTimeOffset), N'admin1', CAST(N'2021-07-14T11:31:26.8442444+07:00' AS DateTimeOffset), NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [UrlImage], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [ProductCategoryId], [Detail], [Warranty], [MetaKeywords], [MetaDescriptions], [TopHot], [IsNormalProduct2], [IsNormalProduct1], [IsNewProduct], [ViewCount], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'e8ab3637-5fa0-4b12-93ce-0e11bde67845', N'Bếp ga âm Electrolux EHG723BA', CAST(2600000 AS Decimal(18, 0)), N'bếp ga âm Electrolux EHG723BA', N'<p>Nh&agrave; sản xuất: Electrolux</p>

<p>Mặt bếp: K&iacute;nh cường lực</p>

<p>K&iacute;ch thước: Ngang 63.5 cm - Dọc 33.5 cm</p>

<p>Sản xuất tại: Trung Quốc</p>
', N'/Content/Data/files/Electrolux_EHG723BA.jpg', CAST(3358000 AS Decimal(18, 0)), NULL, 0, 4, N'35f18486-b2b4-472e-9c90-071466e5bb2d', N'Bếp ga âm Electrolux', NULL, N'Bếp ga âm Electrolux', N'<p>Loại bếp: Bếp ga &acirc;m</p>

<p>Nh&agrave; sản xuất: Electrolux</p>

<p>Đ&aacute;nh lửa: Đ&aacute;nh lửa IC bằng pin nhanh, nhẹ</p>

<p>Mặt bếp: K&iacute;nh cường lực</p>

<p>Đầu đốt: Đầu đốt tiết kiệm gas, Chất liệu Hợp kim sắt</p>

<p>Số lượng đầu h&acirc;m: 2 đầu h&acirc;m</p>

<p>Ưu điểm: Đầu h&acirc;m, Dễ vệ sinh, Đầu đốt tiết kiệm ga</p>

<p>K&iacute;ch thước: Ngang 63.5 cm - Dọc 33.5 cm</p>

<p>Sản xuất tại: Trung Quốc</p>
', 1, NULL, NULL, NULL, NULL, CAST(N'2021-06-05T12:48:56.0000000+07:00' AS DateTimeOffset), N'admin1', CAST(N'2021-07-13T13:41:15.9765892+07:00' AS DateTimeOffset), N'admin1', 0)
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [UrlImage], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [ProductCategoryId], [Detail], [Warranty], [MetaKeywords], [MetaDescriptions], [TopHot], [IsNormalProduct2], [IsNormalProduct1], [IsNewProduct], [ViewCount], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'74126328-626b-450b-8728-143e2a32a202', N'Bếp ga âm Canzy CZ-863', CAST(3130000 AS Decimal(18, 0)), N'canzy cz-863', N'<p>Số lượng l&ograve;: 3</p>

<p>K&iacute;ch thước mặt k&iacute;nh: 75*45 cm</p>

<p>K&iacute;ch thước cắt đ&aacute;: 68*38 cm</p>
', N'/Content/Data/files/CZ-863.jpg', CAST(6880000 AS Decimal(18, 0)), CAST(4150000 AS Decimal(18, 0)), 0, 20, N'9f0de121-5036-4a23-a37e-176e1fab5ffc', NULL, NULL, N'Bếp ga âm Canzy CZ-863', N'<p>Số lượng l&ograve;: 3</p>

<p>Hệ thống chia lửa: Đồng nguy&ecirc;n chất mạ crom</p>

<p>Kiềng: Gang đ&uacute;c</p>

<p>Cảm ứng ngắt gas tự động: C&oacute;</p>

<p>Mặt k&iacute;nh: D&agrave;y 8mm chịu nhiệt, chịu nhiệt cao</p>

<p>Hệ thống: 3 v&ograve;ng lửa</p>

<p>Hệ thống đ&aacute;nh lửa: Pin</p>

<p>Lượng gas ti&ecirc;u thụ: 0.03kg</p>

<p>K&iacute;ch thước mặt k&iacute;nh: 75*45 cm</p>

<p>K&iacute;ch thước cắt đ&aacute;: 68*38 cm</p>
', NULL, NULL, NULL, 1, NULL, CAST(N'2021-07-10T15:18:33.0000000+07:00' AS DateTimeOffset), N'admin1', CAST(N'2021-07-13T13:39:08.6445956+07:00' AS DateTimeOffset), N'admin1', 0)
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [UrlImage], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [ProductCategoryId], [Detail], [Warranty], [MetaKeywords], [MetaDescriptions], [TopHot], [IsNormalProduct2], [IsNormalProduct1], [IsNewProduct], [ViewCount], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'07b8ca65-0fa3-4aad-aace-1944c6740869', N'Bếp ga âm Rinnai RVB-2BG(W)', CAST(2000000 AS Decimal(18, 0)), N'Rinnai RVB-2BG(W)', N'<p>Số bếp nấu: 2</p>

<p>Mặt bếp: K&iacute;nh chịu lực</p>

<p>Cảm ứng ngắt gas tự động van an to&agrave;n: C&oacute;</p>
', N'/Content/Data/files/rinnai-rvb-2bgw.jpg', CAST(3620000 AS Decimal(18, 0)), CAST(2670000 AS Decimal(18, 0)), 0, 15, N'de613250-d551-435b-9613-2f67164a78f6', NULL, NULL, NULL, N'<p>Loại sản phẩm: Bếp gas &acirc;m</p>

<p>Số bếp nấu: 2</p>

<p>Mặt bếp: K&iacute;nh chịu lực</p>

<p>Cảm ứng ngắt gas tự động van an to&agrave;n: C&oacute;</p>

<p>Hệ thống đ&aacute;nh lửa: IC điện tử ( Pin 1,5V )</p>

<p>Chế độ hẹn giờ: Kh&ocirc;ng</p>

<p>Kiềng: Kiềng th&eacute;p, tr&aacute;ng men kh&ocirc;ng rỉ</p>

<p>Bộ chia lửa: Đồng thau</p>
', NULL, NULL, NULL, 1, NULL, CAST(N'2021-07-10T15:18:33.0000000+07:00' AS DateTimeOffset), N'admin1', CAST(N'2021-07-14T10:04:18.7738943+07:00' AS DateTimeOffset), N'admin1', 0)
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [UrlImage], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [ProductCategoryId], [Detail], [Warranty], [MetaKeywords], [MetaDescriptions], [TopHot], [IsNormalProduct2], [IsNormalProduct1], [IsNewProduct], [ViewCount], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'f890849c-a8bf-4f92-b55b-2d8f6a55cd30', N'Bình ga Butane', CAST(100000 AS Decimal(18, 0)), N'Bình ga Butane', N'<p>Xuất xứ: H&agrave;n Quốc</p>

<p>Trọng lượng cả vỏ: 350g</p>

<p>K&iacute;ch thước: Cao 9cm - Đường k&iacute;nh đ&aacute;y 11cm</p>
', N'/Content/Data/files/Bình-ga-Max-Sun.jpg', CAST(165000 AS Decimal(18, 0)), NULL, NULL, 1, N'ce911edd-6e09-4162-84cb-328b0616540e', N'Bình ga mini Hàn Quốc phù hợp với việc đi du lịch', NULL, N'Bình ga Butane', N'<p>Thương hiệu: Maxsun</p>

<p>Xuất xứ: H&agrave;n Quốc</p>

<p>Nhi&ecirc;n liệu: Gas butane</p>

<p>Chất liệu vỏ: Th&eacute;p kh&ocirc;ng rỉ</p>

<p>Trọng lương tịnh: 230g</p>

<p>Trọng lượng cả vỏ: 350g</p>

<p>K&iacute;ch thước: Cao 9cm - Đường k&iacute;nh đ&aacute;y 11cm</p>
', NULL, 1, 0, NULL, NULL, CAST(N'2021-07-13T14:38:17.0000000+07:00' AS DateTimeOffset), N'admin1', CAST(N'2021-07-14T13:08:31.1388070+07:00' AS DateTimeOffset), N'admin1', 0)
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [UrlImage], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [ProductCategoryId], [Detail], [Warranty], [MetaKeywords], [MetaDescriptions], [TopHot], [IsNormalProduct2], [IsNormalProduct1], [IsNewProduct], [ViewCount], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'e2aeb8c6-f623-4a65-8e5e-66f56436c2d4', N'Bếp ga âm TEKA CGW LUX 86 TC 3G AI AL TR', CAST(17800000 AS Decimal(18, 0)), N'Bếp ga âm TEKA CGW LUX 86 TC 3G AI AL TR', N'<p>Mặt bếp:&nbsp;K&iacute;nh chịu lực,Chịu nhiệt (k&iacute;nh v&aacute;t)</p>

<p>K&iacute;ch thước bề mặt:&nbsp;86&nbsp;x 45&nbsp;cm</p>

<p>K&iacute;ch thước kho&eacute;t đ&aacute;:&nbsp;71&nbsp;x 41&nbsp;cm</p>
', N'/Content/Data/files/teka-cgw-lux-86-tc-3g-ai-al-tr.jpg', CAST(27159000 AS Decimal(18, 0)), CAST(24353000 AS Decimal(18, 0)), NULL, 1, N'cc6459a3-8c4e-4399-9d66-0843f2550fd8', N'Bếp ga xịn cho nhà bếp xịn', NULL, N'Bếp ga âm TEKA CGW LUX 86 TC 3G AI AL TR', N'<p>Mặt bếp:&nbsp;K&iacute;nh chịu lực,Chịu nhiệt (k&iacute;nh v&aacute;t)</p>

<p>Điều khiển Bằng n&uacute;t vặn (m&agrave;u đen mờ)</p>

<p>Cảm ứng ngắt gas tự động an to&agrave;n:&nbsp;C&oacute;</p>

<p>Hệ thống đ&aacute;nh lửa IC:&nbsp;Điện 220V</p>

<p>Chế độ hẹn giờ:&nbsp;Kh&ocirc;ng</p>

<p>Kiềng:&nbsp;Bằng gang, c&oacute; thể d&ugrave;ng cho chảo đ&aacute;y trũng</p>

<p>Bộ chia lửa: Sabaf</p>

<p>Chất liệu/ m&agrave;u sắc: K&iacute;nh đen</p>

<p>Lượng gas ti&ecirc;u thụ 02 bếp ch&iacute;nh:&nbsp;C&ocirc;ng suất 5 kW</p>

<p>Lượng gas ti&ecirc;u thụ 01 bếp phụ:&nbsp;C&ocirc;ngsuất 1,75 kW</p>

<p>K&iacute;ch thước bề mặt:&nbsp;86&nbsp;x 45&nbsp;cm</p>

<p>K&iacute;ch thước kho&eacute;t đ&aacute;:&nbsp;71&nbsp;x 41&nbsp;cm</p>
', NULL, NULL, 1, NULL, NULL, CAST(N'2021-07-14T13:23:39.6965621+07:00' AS DateTimeOffset), N'admin1', NULL, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [UrlImage], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [ProductCategoryId], [Detail], [Warranty], [MetaKeywords], [MetaDescriptions], [TopHot], [IsNormalProduct2], [IsNormalProduct1], [IsNewProduct], [ViewCount], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'ef3c3f17-44e1-47a9-82cc-93f60c5e5919', N'Bếp ga âm Rinnai RVB-212BG', CAST(1880000 AS Decimal(18, 0)), N'Bếp ga âm Rinnai rvb-212bg', N'<p>Số bếp nấu: 2</p>

<p>Mặt bếp:&nbsp;K&iacute;nh chịu lực, chịu nhiệt</p>

<p>Cảm ứng ngắt gas tự động: C&oacute;</p>

<p>Hệ thống đ&aacute;nh lửa:&nbsp;Pin IC 1,5V</p>', N'/Content/Data/files/rinnai-rvb-212.jpg', CAST(3560000 AS Decimal(18, 0)), CAST(2800000 AS Decimal(18, 0)), NULL, 20, N'de613250-d551-435b-9613-2f67164a78f6', N'Bếp ga âm rinnai sự lựa chọn sáng suốt cho căn bếp nhà bạn', NULL, N'Bếp ga âm Rinnai rvb-212bg', N'<p>Số bếp nấu: 2</p>

<p>Số v&ograve;ng lửa: 2</p>

<p>Mặt bếp:&nbsp;K&iacute;nh chịu lực, chịu nhiệt</p>

<p>Cảm ứng ngắt gas tự động: C&oacute;</p>

<p>Hệ thống đ&aacute;nh lửa:&nbsp;Pin IC 1,5V</p>

<p>Kiềng:&nbsp;Kiềng th&eacute;p phủ sơn chống d&iacute;nh</p>

<p>Bộ chia lửa:&nbsp;Sabaf</p>

<p>Chất liệu/m&agrave;u sắc:&nbsp;K&iacute;nh đen</p>
', 1, NULL, NULL, NULL, NULL, CAST(N'2021-07-13T13:18:37.2254296+07:00' AS DateTimeOffset), N'admin1', NULL, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [UrlImage], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [ProductCategoryId], [Detail], [Warranty], [MetaKeywords], [MetaDescriptions], [TopHot], [IsNormalProduct2], [IsNormalProduct1], [IsNewProduct], [ViewCount], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'b50cfb8e-b806-4b9f-b70c-efc9f1d4427d', N'Bếp gas âm KAFF KF-630', CAST(5100000 AS Decimal(18, 0)), N'bep-ga-am-kaff-kf-630', N'<p>Số bếp: 2</p>

<p>K&iacute;ch thước mặt k&iacute;nh: 75&nbsp;* 44 cm</p>

<p>K&iacute;ch thước kho&eacute;t đ&aacute;: 68 * 38 cm</p>
', N'/Content/Data/files/bep-gas-am-kaff-kf-630.jpg', CAST(8680000 AS Decimal(18, 0)), CAST(6940000 AS Decimal(18, 0)), NULL, 10, N'88cc357b-e62c-4405-8806-c242dcbee6fa', N'Mang thương hiệu châu Âu nhập khẩu nguyên chiếc về Việt Nam', NULL, NULL, N'<p>Số bếp: bếp thiết kế 2 l&ograve; nấu độc lập</p>

<p>Bộ chia lửa:&nbsp;Somipress(ITALY) tiết kiệm gas</p>

<p>Pep hầm: Đồng</p>

<p>Kiềng: 4 ch&acirc;n si&ecirc;u bền, si&ecirc;u chắc chắn</p>

<p>Khay chống tr&agrave;n: C&oacute;</p>

<p>Mặt k&iacute;nh: Ceramic m&agrave;u đen</p>

<p>K&iacute;ch thước mặt k&iacute;nh: 75&nbsp;* 44 cm</p>

<p>K&iacute;ch thước kho&eacute;t đ&aacute;: 68 * 38 cm</p>
', NULL, NULL, 1, NULL, NULL, CAST(N'2021-07-16T10:30:18.8529718+07:00' AS DateTimeOffset), N'admin1', NULL, NULL, 0)
GO
INSERT [dbo].[ProductCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [MetaKeywords], [MetaDescriptions], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'f4e587a0-d114-4f30-946c-04c30e01b730', N'Miss Gas', N'Miss Gas', NULL, 1, N'Miss Gas', NULL, NULL, NULL, N'admin1', CAST(N'2021-07-14T11:31:12.9051129+07:00' AS DateTimeOffset), NULL, 0)
INSERT [dbo].[ProductCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [MetaKeywords], [MetaDescriptions], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'35f18486-b2b4-472e-9c90-071466e5bb2d', N'Electrolux', N'Electrolux', NULL, 2, N'Electro', NULL, NULL, NULL, N'admin1', CAST(N'2021-07-13T14:11:54.2037279+07:00' AS DateTimeOffset), N'admin1', 0)
INSERT [dbo].[ProductCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [MetaKeywords], [MetaDescriptions], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'cc6459a3-8c4e-4399-9d66-0843f2550fd8', N'Teka', N'Teka', NULL, 6, N'Teka', N'Teka', NULL, CAST(N'2021-07-14T13:18:02.0000000+07:00' AS DateTimeOffset), N'admin1', CAST(N'2021-07-14T13:18:11.8149890+07:00' AS DateTimeOffset), N'admin1', 0)
INSERT [dbo].[ProductCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [MetaKeywords], [MetaDescriptions], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'9f0de121-5036-4a23-a37e-176e1fab5ffc', N'Canzy', N'canzy', NULL, 3, N'canzy', NULL, NULL, NULL, N'admin1', NULL, NULL, 0)
INSERT [dbo].[ProductCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [MetaKeywords], [MetaDescriptions], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'de613250-d551-435b-9613-2f67164a78f6', N'Rinnai', N'rinnai', NULL, 4, N'rinnai', NULL, NULL, NULL, N'admin1', NULL, NULL, 0)
INSERT [dbo].[ProductCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [MetaKeywords], [MetaDescriptions], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'ce911edd-6e09-4162-84cb-328b0616540e', N'Maxsun', N'maxsun', NULL, 5, N'maxsun', NULL, NULL, CAST(N'2021-07-13T13:57:07.0000000+07:00' AS DateTimeOffset), N'admin1', CAST(N'2021-07-13T14:08:00.5625955+07:00' AS DateTimeOffset), N'admin1', 0)
INSERT [dbo].[ProductCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [MetaKeywords], [MetaDescriptions], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'88cc357b-e62c-4405-8806-c242dcbee6fa', N'Kaff', N'kaff', NULL, 7, N'kaff', N'kaff', N'kaff', CAST(N'2021-07-16T10:20:11.0000000+07:00' AS DateTimeOffset), N'admin1', CAST(N'2021-07-16T10:20:24.8031110+07:00' AS DateTimeOffset), N'admin1', 0)
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

INSERT [dbo].[Slide] ([Id], [UrlImage], [DisplayOrder], [Link], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (1, N'/Content/Client/images/banner.jpg', 1, NULL, NULL, NULL, N'admin', NULL, NULL, 0)
INSERT [dbo].[Slide] ([Id], [UrlImage], [DisplayOrder], [Link], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (2, N'/Content/Client/images/banner-2.jpg', 2, NULL, NULL, NULL, N'admin', NULL, NULL, 0)
INSERT [dbo].[Slide] ([Id], [UrlImage], [DisplayOrder], [Link], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (3, N'/Content/Client/images/banner-3.jpg', 3, NULL, NULL, NULL, N'admin', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Slide] OFF
GO
INSERT [dbo].[User] ([Id], [GroupId], [AvatarUrl], [UserName], [Password], [ConfirmPassword], [FirstName], [LastName], [ResetPasswordCode], [Email], [Address], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'41101388-f1ab-47c1-afbe-3124ff18f074', N'MEMBER', NULL, N'hkimchuc140399@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'e10adc3949ba59abbe56e057f20f883e', N'Hoàng', N'Kim Chúc', NULL, N'hkimchuc140399@gmail.com', N'60 An Chân, Hồng Bàng, Sở Dầu', CAST(N'2021-07-08T13:55:32.5411181+07:00' AS DateTimeOffset), NULL, NULL, NULL, 0)
INSERT [dbo].[User] ([Id], [GroupId], [AvatarUrl], [UserName], [Password], [ConfirmPassword], [FirstName], [LastName], [ResetPasswordCode], [Email], [Address], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'f6dfcece-f0c2-4d10-91a5-32032d70dda2', N'ADMIN', NULL, N'admin1', N'e10adc3949ba59abbe56e057f20f883e', N'e10adc3949ba59abbe56e057f20f883e', N'Trần ', N'Việt Hà', NULL, N'vietha93@gmail.com', N'Yên Bái', CAST(N'2021-07-05T21:45:15.0000000+07:00' AS DateTimeOffset), N'admin', CAST(N'2021-07-05T21:48:22.3382361+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[User] ([Id], [GroupId], [AvatarUrl], [UserName], [Password], [ConfirmPassword], [FirstName], [LastName], [ResetPasswordCode], [Email], [Address], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'c430f625-bd9f-4200-9ac9-81f3b070daa5', N'MEMBER', NULL, N'ngochuy@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'e10adc3949ba59abbe56e057f20f883e', N'Đặng', N'Ngọc Huy', NULL, N'ngochuy@gmail.com', N'Mê Linh, Hà Nội', CAST(N'2021-07-16T13:50:20.7127938+07:00' AS DateTimeOffset), NULL, NULL, NULL, 0)
INSERT [dbo].[User] ([Id], [GroupId], [AvatarUrl], [UserName], [Password], [ConfirmPassword], [FirstName], [LastName], [ResetPasswordCode], [Email], [Address], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'f49e8b99-9d9b-487f-aeea-9fbd22eb18fc', N'MEMBER', NULL, N'vananh26111999@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn', N'Vân Anh', NULL, N'vananh26111999@gmail.com', N'Hồ Tùng Mậu', CAST(N'2021-07-20T16:33:19.9679066+07:00' AS DateTimeOffset), NULL, NULL, NULL, 0)
INSERT [dbo].[User] ([Id], [GroupId], [AvatarUrl], [UserName], [Password], [ConfirmPassword], [FirstName], [LastName], [ResetPasswordCode], [Email], [Address], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'6d6b9a4d-ac3a-4416-9798-e9e12267336e', N'MEMBER', NULL, N'nguyenhongngoc1696@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn', N'Hồng Ngọc', NULL, N'nguyenhongngoc1696@gmail.com', N'Thái Bình', CAST(N'2021-07-20T16:21:55.3280645+07:00' AS DateTimeOffset), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[UserGroup] ([Id], [Name]) VALUES (N'ADMIN', N'Quản trị')
INSERT [dbo].[UserGroup] ([Id], [Name]) VALUES (N'MEMBER', N'Thành viên')
INSERT [dbo].[UserGroup] ([Id], [Name]) VALUES (N'MOD', N'Moderitor')
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK__Content__Categor__412EB0B6] FOREIGN KEY([NewsCategoryId])
REFERENCES [dbo].[NewsCategory] ([Id])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK__Content__Categor__412EB0B6]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__Product__5070F446] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[ProductCategory] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__Product__5070F446]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserGroup] FOREIGN KEY([GroupId])
REFERENCES [dbo].[UserGroup] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserGroup]
GO
USE [master]
GO
ALTER DATABASE [Project3_Db] SET  READ_WRITE 
GO
