USE [master]
GO
/****** Object:  Database [ssm]    Script Date: 2019/1/14 13:49:46 ******/
CREATE DATABASE [ssm]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ssm', FILENAME = N'G:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ssm.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ssm_log', FILENAME = N'G:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ssm_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ssm] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ssm].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ssm] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ssm] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ssm] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ssm] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ssm] SET ARITHABORT OFF 
GO
ALTER DATABASE [ssm] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ssm] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ssm] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ssm] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ssm] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ssm] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ssm] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ssm] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ssm] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ssm] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ssm] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ssm] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ssm] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ssm] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ssm] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ssm] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ssm] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ssm] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ssm] SET  MULTI_USER 
GO
ALTER DATABASE [ssm] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ssm] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ssm] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ssm] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ssm] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ssm]
GO
/****** Object:  Table [dbo].[tbl_admin]    Script Date: 2019/1/14 13:49:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_admin](
	[adminID] [int] IDENTITY(1,1) NOT NULL,
	[adminName] [varchar](11) NOT NULL,
	[password] [varchar](16) NOT NULL,
	[adminTrueName] [varchar](10) NULL,
	[sex] [char](1) NULL,
 CONSTRAINT [PK_tbl_admin] PRIMARY KEY CLUSTERED 
(
	[adminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_customer]    Script Date: 2019/1/14 13:49:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_customer](
	[customerID] [int] IDENTITY(1,1) NOT NULL,
	[customerName] [varchar](11) NOT NULL,
	[password] [varchar](16) NOT NULL,
	[customerTrueName] [varchar](10) NULL,
	[customerAddress] [varchar](max) NULL,
	[sex] [char](1) NULL,
	[customerEmail] [varchar](20) NULL,
	[customerPhone] [varchar](20) NULL,
	[customerRegDate] [smalldatetime] NULL,
 CONSTRAINT [PK_tbl_customer] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_goods]    Script Date: 2019/1/14 13:49:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_goods](
	[goodsID] [int] IDENTITY(1,1) NOT NULL,
	[goodsName] [varchar](500) NOT NULL,
	[detailedTypeID] [int] NULL,
	[goodsPrice] [money] NULL,
	[goodsInCount] [int] NULL,
	[goodsSellCount] [int] NULL,
	[goodsDescript] [varchar](500) NULL,
	[goodsImageUrl] [varchar](500) NULL,
	[goodsDate] [smalldatetime] NULL,
	[goodsDiscountPrice] [money] NULL,
 CONSTRAINT [PK_tbl_goods] PRIMARY KEY CLUSTERED 
(
	[goodsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_goodstype]    Script Date: 2019/1/14 13:49:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_goodstype](
	[goodsTypeID] [int] IDENTITY(1,1) NOT NULL,
	[goodsTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_goodstype] PRIMARY KEY CLUSTERED 
(
	[goodsTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_goodstype_detailed]    Script Date: 2019/1/14 13:49:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_goodstype_detailed](
	[detailedTypeID] [int] IDENTITY(1,1) NOT NULL,
	[goodsTypeID] [int] NOT NULL,
	[detailedTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_goodstype_detailed] PRIMARY KEY CLUSTERED 
(
	[detailedTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_order]    Script Date: 2019/1/14 13:49:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_order](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[customerName] [varchar](11) NOT NULL,
	[orderAddress] [varchar](max) NOT NULL,
	[orderPhone] [varchar](20) NOT NULL,
	[orderAddressee] [varchar](10) NOT NULL,
	[totalMoney] [money] NOT NULL,
	[orderDate] [smalldatetime] NOT NULL,
	[orderState] [char](1) NOT NULL,
 CONSTRAINT [PK_tbl_order] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_order_detailed]    Script Date: 2019/1/14 13:49:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_order_detailed](
	[orderID] [int] NOT NULL,
	[goodsID] [int] NOT NULL,
	[goodsPrice] [money] NOT NULL,
	[goodCount] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_shopcart]    Script Date: 2019/1/14 13:49:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_shopcart](
	[shopcartID] [int] IDENTITY(1,1) NOT NULL,
	[customerName] [varchar](11) NOT NULL,
	[goodsID] [int] NOT NULL,
	[goodCount] [int] NOT NULL,
 CONSTRAINT [PK_tbl_ shopcart] PRIMARY KEY CLUSTERED 
(
	[shopcartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_admin] ON 

INSERT [dbo].[tbl_admin] ([adminID], [adminName], [password], [adminTrueName], [sex]) VALUES (2, N'admin', N'admin', N'李保龙', N'0')
INSERT [dbo].[tbl_admin] ([adminID], [adminName], [password], [adminTrueName], [sex]) VALUES (3, N'admin1', N'admin1', N'标哥', N'1')
SET IDENTITY_INSERT [dbo].[tbl_admin] OFF
SET IDENTITY_INSERT [dbo].[tbl_customer] ON 

INSERT [dbo].[tbl_customer] ([customerID], [customerName], [password], [customerTrueName], [customerAddress], [sex], [customerEmail], [customerPhone], [customerRegDate]) VALUES (1, N'1702040031', N'123456', N'宇哥', N'广西南宁西乡塘区大学西路169号', N'1', N'108080801@qq.com', N'10086', CAST(N'2019-01-01 14:48:00' AS SmallDateTime))
INSERT [dbo].[tbl_customer] ([customerID], [customerName], [password], [customerTrueName], [customerAddress], [sex], [customerEmail], [customerPhone], [customerRegDate]) VALUES (2, N'1702040011', N'123456', N'标哥', N'', N'0', N'', N'', CAST(N'2019-01-13 16:25:00' AS SmallDateTime))
INSERT [dbo].[tbl_customer] ([customerID], [customerName], [password], [customerTrueName], [customerAddress], [sex], [customerEmail], [customerPhone], [customerRegDate]) VALUES (3, N'test1', N'123456', N'waijiba', N'', N'0', N'', N'', CAST(N'2019-01-13 16:30:00' AS SmallDateTime))
INSERT [dbo].[tbl_customer] ([customerID], [customerName], [password], [customerTrueName], [customerAddress], [sex], [customerEmail], [customerPhone], [customerRegDate]) VALUES (4, N'test2', N'123456', N'标哥', N'', N'0', N'', N'', CAST(N'2019-01-13 16:32:00' AS SmallDateTime))
INSERT [dbo].[tbl_customer] ([customerID], [customerName], [password], [customerTrueName], [customerAddress], [sex], [customerEmail], [customerPhone], [customerRegDate]) VALUES (5, N'test3', N'123456', N'标哥', N'', N'0', N'', N'', CAST(N'2019-01-13 16:34:00' AS SmallDateTime))
INSERT [dbo].[tbl_customer] ([customerID], [customerName], [password], [customerTrueName], [customerAddress], [sex], [customerEmail], [customerPhone], [customerRegDate]) VALUES (6, N'test4', N'123456', N'标哥', N'', N'0', N'', N'', CAST(N'2019-01-13 16:40:00' AS SmallDateTime))
INSERT [dbo].[tbl_customer] ([customerID], [customerName], [password], [customerTrueName], [customerAddress], [sex], [customerEmail], [customerPhone], [customerRegDate]) VALUES (7, N'test5', N'123456', N'标哥', N'', N'0', N'', N'', CAST(N'2019-01-13 16:42:00' AS SmallDateTime))
INSERT [dbo].[tbl_customer] ([customerID], [customerName], [password], [customerTrueName], [customerAddress], [sex], [customerEmail], [customerPhone], [customerRegDate]) VALUES (8, N'test6', N'123456', N'标哥', N'', N'0', N'', N'', CAST(N'2019-01-13 16:45:00' AS SmallDateTime))
INSERT [dbo].[tbl_customer] ([customerID], [customerName], [password], [customerTrueName], [customerAddress], [sex], [customerEmail], [customerPhone], [customerRegDate]) VALUES (9, N'test7', N'123456', N'标哥', N'', N'0', N'', N'', CAST(N'2019-01-13 16:47:00' AS SmallDateTime))
INSERT [dbo].[tbl_customer] ([customerID], [customerName], [password], [customerTrueName], [customerAddress], [sex], [customerEmail], [customerPhone], [customerRegDate]) VALUES (10, N'test8', N'123456', N'标哥', N'', N'0', N'', N'', CAST(N'2019-01-13 16:48:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[tbl_customer] OFF
SET IDENTITY_INSERT [dbo].[tbl_goods] ON 

INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (242, N'Budweiser/百威啤酒经典500ml*18听新年欢聚罐礼盒装麦芽整箱包邮', 1, 228.0000, 45, 30, N'Budweiser/百威啤酒经典500ml*18听新年欢聚罐礼盒装麦芽整箱包邮', N'./upload/20190112210530O1CN010vskaE2IMcoZo1bz3_!!2508879272.jpg', CAST(N'2019-01-12 21:06:00' AS SmallDateTime), 200.0000)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (243, N'Budweiser/百威啤酒经典醇正500ml*18听麦芽熟啤酒整箱装促销', 1, 109.0000, 78, 12, N'Budweiser/百威啤酒经典醇正500ml*18听麦芽熟啤酒整箱装促销', N'./upload/20190112210606O1CN010GoFki2IMcoW8yZ29_!!2508879272.jpg_q30.jpg', CAST(N'2019-01-12 21:06:00' AS SmallDateTime), 99.0000)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (244, N'Budweiser/百威啤酒美式拉格460ml*12瓶装大瓶装麦芽整箱促销', 1, 79.0000, 18, 5, N'Budweiser/百威啤酒美式拉格460ml*12瓶装大瓶装麦芽整箱促销', N'./upload/20190112210640O1CN01CEtqmj2IMcoXq5FgN_!!2508879272.jpg_q30.jpg', CAST(N'2019-01-12 21:07:00' AS SmallDateTime), 69.0000)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (245, N'Budweiser/百威啤酒经典醇正330ml*24罐装麦芽熟啤酒整箱促销', 1, 129.0000, 33, 12, N'Budweiser/百威啤酒经典醇正330ml*24罐装麦芽熟啤酒整箱促销', N'./upload/20190112210709O1CN01OI5qCH2IMcoXq0Hob_!!2508879272.jpg_q30.jpg', CAST(N'2019-01-12 21:07:00' AS SmallDateTime), 119.0000)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (246, N'Budweiser/百威美式拉格啤酒600ml*12瓶整箱装麦芽', 1, 89.0000, 241, 198, N'Budweiser/百威美式拉格啤酒600ml*12瓶整箱装麦芽', N'./upload/20190112210800O1CN01IXK2De2IMcoWazT3P_!!0-item_pic.jpg', CAST(N'2019-01-12 21:08:00' AS SmallDateTime), 79.0000)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (247, N'百威啤酒经典醇正定制罐500ml*18听罐装熟啤酒包邮', 1, 109.0000, 54, 20, N'百威啤酒经典醇正定制罐500ml*18听罐装熟啤酒包邮', N'./upload/20190112210915O1CN017DCL7p2IMcoXGrUgA_!!2508879272.jpg', CAST(N'2019-01-12 21:09:00' AS SmallDateTime), 99.0000)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (248, N'Budweiser/百威啤酒纯生330ml*24罐装麦芽啤酒整箱促销包邮', 1, 139.0000, 96, 60, N'Budweiser/百威啤酒纯生330ml*24罐装麦芽啤酒整箱促销包邮', N'./upload/20190112211022O1CN01zK6yTH2IMcoVQrIkk_!!2508879272.jpg_q30.jpg', CAST(N'2019-01-12 21:10:00' AS SmallDateTime), 129.0000)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (249, N'Budweiser/百威金尊啤酒500ml*12瓶麦芽啤酒瓶装整箱促销包邮', 1, 169.0000, 65, 20, N'Budweiser/百威金尊啤酒500ml*12瓶麦芽啤酒瓶装整箱促销包邮', N'./upload/20190112211055O1CN01B7PtTx2IMcoZUAAPE_!!2508879272.jpg_q30.jpg', CAST(N'2019-01-12 21:11:00' AS SmallDateTime), 159.0000)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (250, N'Budweiser/百威啤酒猪年生肖瓶355ml*6瓶麦芽熟啤酒包邮', 1, 460.0000, 643, 461, N'Budweiser/百威啤酒猪年生肖瓶355ml*6瓶麦芽熟啤酒包邮', N'./upload/20190112211135O1CN01wUZ4VU2IMcoZQVOUD_!!2508879272.jpg_q30.jpg', CAST(N'2019-01-12 21:12:00' AS SmallDateTime), 399.0000)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (251, N'百威啤酒2018世界杯国家罐500ml*18听单一国家罐整箱装包邮', 1, 109.0000, 45, 17, N'百威啤酒2018世界杯国家罐500ml*18听单一国家罐整箱装包邮', N'./upload/20190112211214O1CN016pMQSA2IMcoYXvjFf_!!2508879272.jpg_q30.jpg', CAST(N'2019-01-12 21:12:00' AS SmallDateTime), 99.0000)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (252, N'Budweiser/百威啤酒精酿大师臻藏798ml*1瓶官方正品礼盒装促销', 1, 188.0000, 20, 5, N'Budweiser/百威啤酒精酿大师臻藏798ml*1瓶官方正品礼盒装促销', N'./upload/20190112211301O1CN01F7oUX72IMcoYSrY5n_!!2508879272.jpg_q30.jpg', CAST(N'2019-01-12 21:13:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (253, N'蓝带啤酒经典11度500ml*12罐听装优质麦芽醇厚口感黄啤酒整箱装', 1, 67.0000, 34, 15, N'蓝带啤酒经典11度500ml*12罐听装优质麦芽醇厚口感黄啤酒整箱装', N'./upload/20190112211403TB1VtFdieuSBuNjSsziXXbq8pXa_!!0-item_pic.jpg_q30.jpg', CAST(N'2019-01-12 21:14:00' AS SmallDateTime), 62.0000)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (254, N'蓝带领航者纪念版1L*1单支瓶装高浓度进口麦芽橡木桶高端精酿啤酒', 1, 63.0000, 643, 489, N'蓝带领航者纪念版1L*1单支瓶装高浓度进口麦芽橡木桶高端精酿啤酒', N'./upload/20190112211427TB1fgg7o4TI8KJjSspiXXbM4FXa_!!0-item_pic.jpg_q30.jpg', CAST(N'2019-01-12 21:14:00' AS SmallDateTime), 59.0000)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (255, N'蓝带将军啤酒500ml*12罐装优质麦芽IPA精酿橡木桶浓色啤酒整箱装', 1, 102.0000, 34, 21, N'蓝带将军啤酒500ml*12罐装优质麦芽IPA精酿橡木桶浓色啤酒整箱装', N'./upload/20190112211457TB1wpk4hZnI8KJjSsziXXb8QpXa_!!0-item_pic.jpg_q30.jpg', CAST(N'2019-01-12 21:15:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (256, N'蓝带将军啤酒500ml*12玻璃瓶装IPA精酿橡木桶优质浓色啤酒整箱装', 1, 106.0000, 54, 34, N'蓝带将军啤酒500ml*12玻璃瓶装IPA精酿橡木桶优质浓色啤酒整箱装', N'./upload/20190112211515TB27og5o4TI8KJjSspiXXbM4FXa_!!3166380687.jpg_q30.jpg', CAST(N'2019-01-12 21:15:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (257, N'6听 拾捌精酿 随便先生IPA啤酒 国产精酿 330ML', 2, 120.0000, 56, 45, N'6听 拾捌精酿 随便先生IPA啤酒 国产精酿 330ML', N'./upload/20190112211552O1CN01hE17NV1bhD8AdaXEf_!!832423496.jpg', CAST(N'2019-01-12 21:16:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (258, N'4瓶组合 国产精酿 京A啤酒 凸豪金/阿白/工人/飞拳IPA啤酒 330ml', 2, 76.0000, 634, 540, N'4瓶组合 国产精酿 京A啤酒 凸豪金/阿白/工人/飞拳IPA啤酒 330ml', N'./upload/20190112211630O1CN01jBtlsC1bhD88b8ZLZ_!!832423496.jpg', CAST(N'2019-01-12 21:17:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (259, N'牛啤堂 帝都海盐古斯/牛壁小麦（易拉罐）330mlx6听礼盒装', 2, 150.0000, 56, 34, N'牛啤堂 帝都海盐古斯/牛壁小麦（易拉罐）330mlx6听礼盒装', N'./upload/20190112211658O1CN01T1QltX1bhD8DJJ4Nr_!!832423496.jpg', CAST(N'2019-01-12 21:17:00' AS SmallDateTime), 149.0000)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (260, N'6瓶 金色岸线啤酒 国产精酿 GOLDEN BEACH 330ML 启德', 2, 79.0000, 78, 48, N'6瓶 金色岸线啤酒 国产精酿 GOLDEN BEACH 330ML 启德', N'./upload/20190112211753O1CN011bhD7PLBOLQUp9C_!!832423496.jpg', CAST(N'2019-01-12 21:18:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (261, N'整箱 莱宝黑色兔子哈密瓜味小麦啤酒307ml 精酿啤酒水果味啤酒', 2, 185.0000, 345, 149, N'整箱 莱宝黑色兔子哈密瓜味小麦啤酒307ml 精酿啤酒水果味啤酒', N'./upload/20190112211837O1CN011bhD68pAqW7fOsU_!!832423496.jpg', CAST(N'2019-01-12 21:19:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (262, N'24听装 不接受评价社交印度淡色艾尔啤酒 国产精酿 330ML 启德', 2, 299.0000, 12, 3, N'24听装 不接受评价社交印度淡色艾尔啤酒 国产精酿 330ML 启德', N'./upload/20190112211859O1CN011bhD6wYT7kaG5a7_!!832423496.jpg', CAST(N'2019-01-12 21:19:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (263, N'整箱 国产福佳白啤酒Hoegaarden 精酿啤酒330ML 启德', 2, 120.0000, 12, 4, N'整箱 国产福佳白啤酒Hoegaarden 精酿啤酒330ML 启德', N'./upload/20190112211946O1CN011bhD68pYPaBF1P0_!!832423496.jpg', CAST(N'2019-01-12 21:20:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (264, N'6瓶 拳击猫搏击者超淡色艾尔啤酒 国产精酿啤酒 355ml 启德酒水', 2, 79.0000, 412, 340, N'6瓶 拳击猫搏击者超淡色艾尔啤酒 国产精酿啤酒 355ml 启德酒水', N'./upload/20190112212017TB2qM2DecyYBuNkSnfoXXcWgVXa_!!832423496.jpg', CAST(N'2019-01-12 21:20:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (265, N'整箱 莱宝黑色兔子蓝莓味小麦啤酒307ml 精酿啤酒水果味啤酒启德', 2, 185.0000, 421, 680, N'整箱 莱宝黑色兔子蓝莓味小麦啤酒307ml 精酿啤酒水果味啤酒启德', N'./upload/20190112212041TB2mqAJfpXXXXXpXpXXXXXXXXXX_!!832423496.jpg', CAST(N'2019-01-12 21:21:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (266, N'6听 中国精酿婴儿肥 BABY LAGER 婴儿肥茉莉花茶拉格啤酒 500ml', 2, 60.0000, 34, 12, N'6听 中国精酿婴儿肥 BABY LAGER 婴儿肥茉莉花茶拉格啤酒', N'./upload/20190112212107O1CN01dEeNkw1bhD8WxqwQ3_!!832423496.png', CAST(N'2019-01-12 21:21:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (267, N'整箱 巴兰德真味啤酒 精酿拉格 世界杯啤酒 330ML 国产精酿 启德', 2, 220.0000, 123, 100, N'整箱 巴兰德真味啤酒 精酿拉格 世界杯啤酒 330ML 国产精酿 启德', N'./upload/20190112212201TB25FJPuQ9WBuNjSspeXXaz5VXa_!!832423496.jpg', CAST(N'2019-01-12 21:22:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (268, N'波兰进口伏特加 洋酒 MONACO摩纳哥至尊伏特加 700ML 启德', 3, 35.0000, 76, 50, N'波兰进口伏特加 洋酒 MONACO摩纳哥至尊伏特加 700ML 启德', N'./upload/20190112212227O1CN01EUrVdT1bhD8V9EWVk_!!832423496.jpg', CAST(N'2019-01-12 21:22:00' AS SmallDateTime), 30.0000)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (269, N'英国优质利口酒 DRAMBUIE 杜林标利娇酒力娇酒 700ML 启德', 3, 125.0000, 345, 312, N'英国优质利口酒 DRAMBUIE 杜林标利娇酒力娇酒 700ML 启德', N'./upload/20190112212253O1CN01a1KGTT1bhD8a94bFm_!!832423496.jpg', CAST(N'2019-01-12 21:23:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (270, N'6瓶 内华达 热带鱼雷印度淡色艾尔啤酒 美国进口 355ML 启德', 3, 145.0000, 6, 0, N'6瓶 内华达 热带鱼雷印度淡色艾尔啤酒 美国进口 355ML 启德', N'./upload/20190112212319O1CN01QtoVOM1bhD8PD16DB_!!832423496.jpg', CAST(N'2019-01-12 21:23:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (271, N'6瓶 WELLS维尔斯焦香艾尔啤酒 英国进口精酿 330ML 启德', 3, 99.0000, 74, 55, N'6瓶 WELLS维尔斯焦香艾尔啤酒 英国进口精酿 330ML 启德', N'./upload/20190112212350O1CN01C9aFRw1bhD8Mr454Y_!!832423496.jpg', CAST(N'2019-01-12 21:24:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (272, N'6瓶BROTHER/兄弟苹果西打酒 英国进口西打酒 275ml 启德', 3, 118.0000, 14, 0, N'6瓶BROTHER/兄弟苹果西打酒 英国进口西打酒 275ml 启德', N'./upload/20190112212433O1CN01w6Fkpd1bhD8JElalJ_!!832423496.jpg', CAST(N'2019-01-12 21:25:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (273, N'整箱 武汉二厂汽百香果汽水玻璃瓶装 网红碳酸饮料 275ml 启德', 4, 180.0000, 36, 10, N'整箱 武汉二厂汽百香果汽水玻璃瓶装 网红碳酸饮料 275ml 启德', N'./upload/20190112212518O1CN011bhD72SO6SZpzvb_!!832423496.jpg', CAST(N'2019-01-12 21:25:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (274, N'单瓶 SK牌葡萄饮料 塞浦路斯进口果汁 1L 启德酒水', 4, 14.0000, 754, 694, N'单瓶 SK牌葡萄饮料 塞浦路斯进口果汁 1L 启德酒水', N'./upload/20190112212541O1CN011bhD6Zv31G56WEv_!!832423496.jpg', CAST(N'2019-01-12 21:26:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (275, N'6瓶 宾得宝青柠汁饮料375mL 澳大利亚进口Bundaberg 宾得宝汽水', 4, 90.0000, 74, 11, N'6瓶 宾得宝青柠汁饮料375mL 澳大利亚进口Bundaberg 宾得宝汽水', N'./upload/20190112212717O1CN011bhD6Ej0pn0uaQl_!!832423496.jpg', CAST(N'2019-01-12 21:27:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (276, N'6瓶 宾得宝葡萄柚汁饮料375mL 澳大利亚进口Bundaberg 宾得宝汽水', 4, 90.0000, 180, 162, N'6瓶 宾得宝葡萄柚汁饮料375mL 澳大利亚进口Bundaberg 宾得宝汽水', N'./upload/20190112212736O1CN011bhD6GfltLhtEyd_!!832423496.jpg', CAST(N'2019-01-12 21:28:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (277, N'单瓶 SK牌菠萝汁饮料 塞浦路斯进口果汁 1L 启德酒水', 4, 14.0000, 74, 61, N'单瓶 SK牌菠萝汁饮料 塞浦路斯进口果汁 1L 启德酒水', N'./upload/20190112212804TB2EBAlkVmWBuNjSspdXXbugXXa_!!832423496.jpg', CAST(N'2019-01-12 21:28:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (278, N'促销 单瓶 SK牌橙汁饮料 塞浦路斯进口果汁 1L 启德酒水', 4, 14.0000, 345, 340, N'促销 单瓶 SK牌橙汁饮料 塞浦路斯进口果汁 1L 启德酒水', N'./upload/20190112212834TB2ajMdkYSYBuNjSspiXXXNzpXa_!!832423496.jpg', CAST(N'2019-01-12 21:29:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (279, N'6听 屈臣氏 Watsons 苏打水 苏打汽水拉罐330ml', 4, 33.0000, 523, 499, N'6听 屈臣氏 Watsons 苏打水 苏打汽水拉罐330ml', N'./upload/20190112212927TB29JAGevSM.eBjSZFNXXbgYpXa_!!832423496.jpg', CAST(N'2019-01-12 21:29:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (280, N'整箱 怡泉 汤力水 330ml*24听/罐 调制鸡尾酒 启德酒水', 4, 70.0000, 74, 50, N'整箱 怡泉 汤力水 330ml*24听/罐 调制鸡尾酒 启德酒水', N'./upload/20190112212953TB2s3LrppXXXXXhXXXXXXXXXXXX_!!832423496.jpg', CAST(N'2019-01-12 21:30:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (281, N'整箱 巴黎水青柠天然矿泉水330ml*24瓶 法国进口青柠味 Perrie', 4, 138.0000, 567, 489, N'整箱 巴黎水青柠天然矿泉水330ml*24瓶 法国进口青柠味 Perrie', N'./upload/20190112213028TB2gwypXWigSKJjSsppXXabnpXa_!!832423496.jpg', CAST(N'2019-01-12 21:30:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (282, N'整箱 evian依云天然矿泉水(玻璃瓶) 20瓶 330mL装法国欢乐颂同款', 4, 175.0000, 74, 62, N'整箱 evian依云天然矿泉水(玻璃瓶) 20瓶 330mL装法国欢乐颂同款', N'./upload/20190112213057TB2MUyeXd3nyKJjSZFjXXcdBXXa_!!832423496.jpg', CAST(N'2019-01-12 21:31:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (283, N'恒记酸梅膏1000g浓缩酸梅汤乌梅汁 酸梅汁饮料12瓶装浓缩果汁 ', 4, 165.0000, 74, 15, N'恒记酸梅膏1000g浓缩酸梅汤乌梅汁 酸梅汁饮料12瓶装浓缩果汁 ', N'./upload/20190112213146TB2Z60pXS8mpuFjSZFMXXaxpVXa_!!351098246.jpg', CAST(N'2019-01-12 21:32:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (284, N'雀巢原味1+2咖啡速溶三合一15g*100条简装咖啡粉冲饮品18年8月产', 5, 81.8000, 45, 12, N'雀巢原味1+2咖啡速溶三合一15g*100条简装咖啡粉冲饮品18年8月产', N'./upload/20190112213303O1CN010KSiUf1JyvMmOD1qp_!!2489611098.jpg', CAST(N'2019-01-12 21:33:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (285, N'18年9月产雀巢咖啡原味48条1+2速溶咖啡15g*48杯720g盒装 3盒包邮', 5, 36.9000, 74, 65, N'18年9月产雀巢咖啡原味48条1+2速溶咖啡15g*48杯720g盒装 3盒包邮', N'./upload/20190112213755O1CN011JyvKvwZ2q8lCx7_!!2489611098.jpg', CAST(N'2019-01-12 21:38:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (286, N'雀巢金牌馆藏咖啡5条装速溶三合一咖啡 丝滑拿铁卡布奇诺10盒包邮', 5, 10.9000, 456, 320, N'雀巢金牌馆藏咖啡5条装速溶三合一咖啡 丝滑拿铁卡布奇诺10盒包邮', N'./upload/20190112213832TB2VKiHjL5TBuNjSspcXXbnGFXa_!!2489611098.jpg', CAST(N'2019-01-12 21:39:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (287, N'雀巢1+2咖啡7条装原味特浓味奶香味无糖味速溶即溶咖啡粉三合一', 5, 10.9000, 345, 248, N'雀巢1+2咖啡7条装原味特浓味奶香味无糖味速溶即溶咖啡粉三合一', N'./upload/20190112213859O1CN011JyvKUv1Cjqxzsd_!!2489611098.jpg', CAST(N'2019-01-12 21:39:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (288, N'雀巢黑咖啡醇品速溶咖啡50g瓶装苦咖啡纯黑咖啡50g 伴侣100g 包邮', 5, 14.9000, 40, 14, N'雀巢黑咖啡醇品速溶咖啡50g瓶装苦咖啡纯黑咖啡50g 伴侣100g 包邮', N'./upload/20190112213922O1CN011JyvLs48DYKZpym_!!2489611098.jpg', CAST(N'2019-01-12 21:39:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (289, N'雀巢原味咖啡100方袋简装1+2三合一咖啡粉实惠装19年8月到期包邮', 5, 78.8000, 345, 315, N'雀巢原味咖啡100方袋简装1+2三合一咖啡粉实惠装19年8月到期包邮', N'./upload/20190112213950TB2u9RgjsIrBKNjSZK9XXagoVXa_!!2489611098.jpg', CAST(N'2019-01-12 21:40:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (290, N'高乐高可可粉500g罐装固体饮料浓香巧克力粉搭配牛奶热饮品早餐', 6, 39.8000, 40, 10, N'高乐高可可粉500g罐装固体饮料浓香巧克力粉搭配牛奶热饮品早餐', N'./upload/20190112214021O1CN01xCkXaz1JyvMeXRpFp_!!2489611098.jpg', CAST(N'2019-01-12 21:40:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (291, N'高乐高可可粉固体冲饮品速溶即溶搭配牛奶饮品浓香可可早餐200g袋', 6, 14.6000, 40, 10, N'高乐高可可粉固体冲饮品速溶即溶搭配牛奶饮品浓香可可早餐200g袋', N'./upload/20190112214040O1CN01bqsHq81JyvMRob3vm_!!2489611098.jpg', CAST(N'2019-01-12 21:41:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (292, N'小猪佩奇棒棒糖520g桶装VC什锦水果味牛奶味儿童零食糖果分享礼物 ', 7, 29.8000, 345, 342, N'小猪佩奇棒棒糖520g桶装VC什锦水果味牛奶味儿童零食糖果分享礼物 ', N'./upload/20190113131908O1CN01F4zgfr1JyvMGj45cr_!!2489611098.jpg', CAST(N'2019-01-13 13:19:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (293, N'旺仔QQ糖果汁软糖橡皮水果糖多种口味休闲零食糖果大礼包20g*20包', 7, 15.5000, 40, 33, N'旺仔QQ糖果汁软糖橡皮水果糖多种口味休闲零食糖果大礼包20g*20包', N'./upload/20190113131928O1CN011JyvKZIxF7rYbDW_!!2489611098.jpg', CAST(N'2019-01-13 13:19:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (294, N'雀巢宝路有个圈的薄荷糖经典劲爽薄荷压片清凉糖果750g散装包邮', 7, 12.8000, 345, 334, N'雀巢宝路有个圈的薄荷糖经典劲爽薄荷压片清凉糖果750g散装包邮', N'./upload/20190113131948TB2h2S3BHSYBuNjSspiXXXNzpXa_!!2489611098.jpg', CAST(N'2019-01-13 13:20:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (295, N'金稻谷雪糕冰激凌水果味猫爪创意造型棒棒糖网红零食糖果2盒包邮 ', 7, 18.9000, 40, 16, N'金稻谷雪糕冰激凌水果味猫爪创意造型棒棒糖网红零食糖果2盒包邮 ', N'./upload/20190113132011TB2DxZBwStYBeNjSspaXXaOOFXa_!!2489611098.jpg', CAST(N'2019-01-13 13:20:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (296, N'棉花糖 零食果味伊卡乐棉花糖150g 牛轧糖烘焙原料 怀旧糖果软糖', 7, 2.9800, 76, 66, N'棉花糖 零食果味伊卡乐棉花糖150g 牛轧糖烘焙原料 怀旧糖果软糖', N'./upload/20190113132033TB2.Zptb9OI.eBjSspmXXatOVXa_!!2489611098.jpg', CAST(N'2019-01-13 13:21:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (297, N'滨崎迪士尼果汁软糖水果糖橡皮糖qq糖休闲食品糖果105g铁盒 包邮 ', 7, 4.5900, 40, 39, N'滨崎迪士尼果汁软糖水果糖橡皮糖qq糖休闲食品糖果105g铁盒 包邮 ', N'./upload/20190113132101O1CN011JyvKMjDcr9JYng_!!2489611098.jpg', CAST(N'2019-01-13 13:21:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (298, N'阿尔卑斯条装牛奶软糖33g 原味牛奶酸奶葡萄零食糖果 30只包邮', 7, 2.9000, 40, 40, N'阿尔卑斯条装牛奶软糖33g 原味牛奶酸奶葡萄零食糖果 30只包邮', N'./upload/20190113132137TB2NOBBzOCYBuNkSnaVXXcMsVXa_!!2489611098.jpg', CAST(N'2019-01-13 13:22:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (299, N'雀巢趣满果软糖140gx3桶装果汁果味儿童水果软糖果送女友礼物包邮', 7, 35.8000, 345, 289, N'雀巢趣满果软糖140gx3桶装果汁果味儿童水果软糖果送女友礼物包邮', N'./upload/20190113132220TB2rsJmXcnI8KJjSspeXXcwIpXa_!!2489611098.jpg', CAST(N'2019-01-13 13:22:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (300, N'雀巢糖果 趣满果软糖70g迷你桶装杂果热带果汁果味水果糖3条包邮 ', 7, 7.9000, 665, 660, N'雀巢糖果 趣满果软糖70g迷你桶装杂果热带果汁果味水果糖3条包邮 ', N'./upload/20190113132240O1CN01dllYWn1JyvMF1I0GT_!!2489611098.jpg', CAST(N'2019-01-13 13:23:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (301, N'果凝多巧果凝巧克力+纯正果凝巧克力夹心果糕蜜饯零食糖果48g袋装', 7, 1.9800, 54, 50, N'果凝多巧果凝巧克力+纯正果凝巧克力夹心果糕蜜饯零食糖果48g袋装', N'./upload/20190113132321TB2IZpvpFmWBuNjSspdXXbugXXa_!!2489611098.jpg', CAST(N'2019-01-13 13:23:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (302, N'旺旺 黑妞果汁软糖 儿童糖果礼物 38g/18条 休闲零食1盒多省包邮', 7, 37.5000, 40, 33, N'旺旺 黑妞果汁软糖 儿童糖果礼物 38g/18条 休闲零食1盒多省包邮', N'./upload/20190113132351O1CN011JyvKYgXQ7VJs7x_!!2489611098.jpg', CAST(N'2019-01-13 13:24:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (303, N'伊利原味牛奶片32g 多种口味营养干吃奶片 内蒙古特产20袋包邮', 8, 2.1000, 345, 320, N'伊利原味牛奶片32g 多种口味营养干吃奶片 内蒙古特产20袋包邮', N'./upload/20190113132418TB2xLejmgvD8KJjy0FlXXagBFXa_!!2489611098.jpg', CAST(N'2019-01-13 13:24:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (304, N'伊利原味牛奶片160g盒装干吃奶片糖儿童高钙奶贝清真零食 4盒包邮', 8, 12.6000, 40, 35, N'伊利原味牛奶片160g盒装干吃奶片糖儿童高钙奶贝清真零食 4盒包邮', N'./upload/20190113132438TB2kFngH25TBuNjSspmXXaDRVXa_!!2489611098.jpg', CAST(N'2019-01-13 13:25:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (305, N'喜之郎果冻整箱批发婚宴喜庆糖果礼合装多种口味大礼包包邮', 9, 20.9000, 345, 145, N'喜之郎果冻整箱批发婚宴喜庆糖果礼合装多种口味大礼包包邮', N'./upload/20190113132517O1CN011as0oF1idjQx4nJCh_!!4013854436.jpg_q30.jpg', CAST(N'2019-01-13 13:25:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (306, N'喜之郎蜜桔果肉果冻990g加赠30g糖果果冻布丁大包装零食', 9, 28.8000, 346, 298, N'喜之郎蜜桔果肉果冻990g加赠30g糖果果冻布丁大包装零食', N'./upload/20190113132535TB2F4awowvD8KJjy0FlXXagBFXa_!!725677994.jpg_q30.jpg', CAST(N'2019-01-13 13:26:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (307, N'马来西亚进口可康多口味椰纤果肉果冻布丁80gX6杯水果味吃货零食', 9, 10.9000, 40, 12, N'马来西亚进口可康多口味椰纤果肉果冻布丁80gX6杯水果味吃货零食', N'./upload/20190113132616O1CN01FHxzCt28vIcxlwQp1_!!725677994.jpg_q30.jpg', CAST(N'2019-01-13 13:26:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (308, N'喜之郎cici果汁果冻爽特惠装150g*10吸的冻怀旧零食品', 9, 26.7000, 634, 598, N'喜之郎cici果汁果冻爽特惠装150g*10吸的冻怀旧零食品', N'./upload/20190113132637TB2zFoLJL1TBuNjy0FjXXajyXXa_!!725677994.jpg_q30.jpg', CAST(N'2019-01-13 13:27:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (309, N'亲亲果肉果冻桔子125g*6杯儿童高颜值零食糖果创意送女友布丁', 9, 25.9000, 40, 12, N'亲亲果肉果冻桔子125g*6杯儿童高颜值零食糖果创意送女友布丁', N'./upload/20190113132752TB2Z6ouuf9TBuNjy0FcXXbeiFXa_!!725677994.jpg_q30.jpg', CAST(N'2019-01-13 13:28:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (310, N'【三只松鼠_垦丁的晚霞360g_果味果冻】休闲零食果味什锦果肉布丁', 9, 59.0000, 780, 765, N'【三只松鼠_垦丁的晚霞360g_果味果冻】休闲零食果味什锦果肉布丁', N'./upload/20190113132810TB2wmEdvBjTBKNjSZFuXXb0HFXa_!!880734502.jpg_q30.jpg', CAST(N'2019-01-13 13:28:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (311, N'阿尔卑斯棒棒糖多种水果牛奶混合口味经典棒棒糖果喜糖礼品80支装', 10, 17.5000, 34, 15, N'阿尔卑斯棒棒糖多种水果牛奶混合口味经典棒棒糖果喜糖礼品80支装', N'./upload/20190113132959O1CN01aHHg8N1JyvM43dgFm_!!2489611098.jpg', CAST(N'2019-01-13 13:30:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (312, N'清晗可伶可俐含片无糖水果维C爽口爽喉清凉无糖压片糖12g*20袋', 10, 28.5000, 56, 0, N'清晗可伶可俐含片无糖水果维C爽口爽喉清凉无糖压片糖12g*20袋', N'./upload/20190113133020TB297Q5xOCYBuNkHFCcXXcHtVXa_!!2489611098.jpg', CAST(N'2019-01-13 13:30:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (313, N'珍宝珠干杯乐硬糖棒棒糖48支啤酒杯热带水果味糖果创意造型礼物', 10, 21.5100, 63, 0, N'珍宝珠干杯乐硬糖棒棒糖48支啤酒杯热带水果味糖果创意造型礼物', N'./upload/20190113133100TB2mbpUhf9TBuNjy1zbXXXpepXa_!!2489611098.jpg', CAST(N'2019-01-13 13:31:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (314, N'清晗可伶可俐无糖爽口喉含片咀嚼片维C压片糖薄荷糖水果糖果12g', 10, 1.9500, 76, 47, N'清晗可伶可俐无糖爽口喉含片咀嚼片维C压片糖薄荷糖水果糖果12g', N'./upload/20190113133128TB21UOPaCOFJuJjSZFBXXaGxpXa_!!2489611098.jpg', CAST(N'2019-01-13 13:31:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (315, N'金稻谷超级飞侠五彩波板棒棒糖彩虹糖果礼品节日礼物创意糖85g支', 10, 5.9000, 341, 158, N'金稻谷超级飞侠五彩波板棒棒糖彩虹糖果礼品节日礼物创意糖85g支', N'./upload/20190113133156O1CN01E99GnZ1JyvMkyxl69_!!2489611098.jpg', CAST(N'2019-01-13 13:32:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (317, N'诺梵松露型黑巧克力礼盒装送女友零食400g散装批发', 11, 19.9000, 454, 354, N'诺梵松露型黑巧克力礼盒装送女友零食400g散装批发', N'./upload/20190113133529TB22wiWnj3z9KJjy0FmXXXiwXXa_!!1710482305.jpg_q30.jpg', CAST(N'2019-01-13 13:35:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (318, N'KISSES好时之吻水滴巧克力500g袋装 婚庆喜糖散装批发口味多选', 11, 49.0000, 34, 12, N'KISSES好时之吻水滴巧克力500g袋装 婚庆喜糖散装批发口味多选 49', N'./upload/20190113133558TB1_rkJRXXXXXayXXXXXXXXXXXX_!!0-item_pic.jpg_q30.jpg', CAST(N'2019-01-13 13:36:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (319, N'KISSES炫彩多口味巧克力巧克力500g袋装 婚庆喜糖散装批发口味多选', 11, 59.0000, 345, 264, N'KISSES好时之吻水滴巧克力500g袋装 婚庆喜糖散装批发口味多选 49', N'./upload/20190113133700TB2rtoqa4jaK1RjSZKzXXXVwXXa_!!725677994.jpg_q30.jpg', CAST(N'2019-01-13 13:37:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (320, N'网红美食手工饼干点心办公室零食', 12, 13.8000, 23, 0, N'网红美食手工饼干点心办公室零食', N'./upload/20190113133728O1CN010ZORzF2Ldyex8e0DW_!!628189716.jpg', CAST(N'2019-01-13 13:37:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (321, N'办公室休闲零食早餐饼干糕点', 12, 16.9000, 84, 55, N'办公室休闲零食早餐饼干糕点', N'./upload/20190113133748TB23KYjvDqWBKNjSZFxXXcpLpXa_!!880734502.jpg_q30.jpg', CAST(N'2019-01-13 13:38:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (322, N'丹麦原装进口Kjeldsens/蓝罐曲奇饼干908g礼盒装新老包装随机', 12, 118.0000, 214, 198, N'丹麦原装进口Kjeldsens/蓝罐曲奇饼干908g礼盒装新老包装随机', N'./upload/20190113133809TB26s8YgL5TBuNjSspcXXbnGFXa_!!725677994.jpg_q30.jpg', CAST(N'2019-01-13 13:38:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (323, N'Franzzi/法丽兹巧克力曲奇量贩装4口味380g饼干零食网红大礼包', 12, 39.9000, 123, 115, N'Franzzi/法丽兹巧克力曲奇量贩装4口味380g饼干零食网红大礼包', N'./upload/20190113133837TB2IJm1BKGSBuNjSspbXXciipXa_!!725677994.jpg_430x430q90.jpg', CAST(N'2019-01-13 13:39:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (324, N'Danisa皇冠丹麦曲奇饼干72g*6盒黄油味婚庆伴手礼进口零食小吃', 12, 27.9000, 4, 1, N'Danisa皇冠丹麦曲奇饼干72g*6盒黄油味婚庆伴手礼进口零食小吃', N'./upload/20190113133859TB2rHXyasiGJuJjSZFsXXaqApXa_!!2245064168.jpg_430x430q90.jpg', CAST(N'2019-01-13 13:39:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (325, N'亿滋趣多多巧克力曲奇饼干原味285g*4 零食分享装', 12, 45.9000, 41, 38, N'亿滋趣多多巧克力曲奇饼干原味285g*4 零食分享装', N'./upload/20190113133918TB25G_SXKuSBuNjSsziXXbq8pXa_!!725677994.jpg_q30.jpg', CAST(N'2019-01-13 13:39:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (326, N'lipo面包干300g 越南进口利葡早餐食品面包片 干蛋糕零食饼干', 13, 49.8000, 84, 77, N'lipo面包干300g 越南进口利葡早餐食品面包片 干蛋糕零食饼干', N'./upload/20190113134026TB135w5a6oIL1JjSZFyXXbFBpXa_!!0-item_pic.jpg_430x430q90.jpg', CAST(N'2019-01-13 13:40:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (327, N'abd吐司面包活力一餐营养早餐面包口袋夹心零食糕点食品蛋糕整箱', 13, 28.9000, 123, 68, N'abd吐司面包活力一餐营养早餐面包口袋夹心零食糕点食品蛋糕整箱', N'./upload/20190113134047TB2hpG4aMZC2uNjSZFnXXaxZpXa_!!1756933560.jpg_q30.jpg', CAST(N'2019-01-13 13:41:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (328, N'ABD乳酸菌小口袋面包200g夹心吐司面包早点点心零食营养早餐', 13, 10.1000, 21, 11, N'ABD乳酸菌小口袋面包200g夹心吐司面包早点点心零食营养早餐', N'./upload/20190113134143O1CN01vlKOLg1cAWTbUUI4Y_!!1756933560.jpg_q30.jpg', CAST(N'2019-01-13 13:42:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (329, N'abd吐司面包360g口袋面包营养早餐食品零食休闲小吃批发', 13, 9.9000, 99, 48, N'abd吐司面包360g口袋面包营养早餐食品零食休闲小吃批发', N'./upload/20190113134201TB2ilgSBVGWBuNjy0FbXXb4sXXa_!!1756933560.jpg_q30.jpg', CAST(N'2019-01-13 13:42:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (330, N'三惠蜜方鲜蛋糕1kg整箱 特产西式早餐软蒸小面包鸡蛋糕点心零食品', 13, 13.8000, 23, 1, N'三惠蜜方鲜蛋糕1kg整箱 特产西式早餐软蒸小面包鸡蛋糕点心零食品', N'./upload/20190113134224TB28Kx4cYXlpuFjy1zbXXb_qpXa_!!1756933560.jpg_430x430q90.jpg', CAST(N'2019-01-13 13:42:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (331, N'ABD丹麦鲜面包500g手撕面包整箱营养早餐食品糕点美食零食批发', 13, 12.9000, 534, 512, N'ABD丹麦鲜面包500g手撕面包整箱营养早餐食品糕点美食零食批发', N'./upload/20190113134246TB2Zr4QJAKWBuNjy1zjXXcOypXa_!!1756933560.jpg_q30.jpg', CAST(N'2019-01-13 13:43:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (332, N'ABD吐司面包420g手撕面包夹心糕点蛋糕零食食品整箱面包包邮', 13, 15.8000, 45, 25, N'ABD吐司面包420g手撕面包夹心糕点蛋糕零食食品整箱面包包邮', N'./upload/20190113134325O1CN013yuWWX1cAWTQo78qQ_!!1756933560.png_430x430q90.jpg', CAST(N'2019-01-13 13:43:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (333, N'ABD丹麦鲜面包1Kg手撕面包整箱营养早餐食品糕点美食零食批发', 13, 22.8000, 33, 18, N'ABD丹麦鲜面包1Kg手撕面包整箱营养早餐食品糕点美食零食批发', N'./upload/20190113134411TB2FCZ2v.OWBKNjSZKzXXXfWFXa_!!1756933560-2-item_pic.png_q30.jpg', CAST(N'2019-01-13 13:44:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (334, N'ABD乳酸菌小口袋面包680g*2箱夹心吐司面包早点点心零食营养早餐', 13, 49.8000, 234, 220, N'ABD乳酸菌小口袋面包680g*2箱夹心吐司面包早点点心零食营养早餐', N'./upload/20190113134432O1CN01EDWNaY1cAWTcqqTfL_!!1756933560.jpg_q30.jpg', CAST(N'2019-01-13 13:45:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (335, N'ABD胡萝卜吐司面包1Kg营养早餐手撕面包夹心糕点蛋糕零食整箱批发', 13, 29.8000, 142, 80, N'ABD胡萝卜吐司面包1Kg营养早餐手撕面包夹心糕点蛋糕零食整箱批发', N'./upload/20190113134510TB2ngNYBhWYBuNjy1zkXXXGGpXa_!!1756933560.jpg_q30.jpg', CAST(N'2019-01-13 13:45:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (336, N'星芙奶油夹心虎皮蛋糕800g整箱 蒸蛋糕小面包 早餐糕点心蛋糕零食', 13, 24.8000, 314, 288, N'星芙奶油夹心虎皮蛋糕800g整箱 蒸蛋糕小面包 早餐糕点心蛋糕零食', N'./upload/20190113134533TB1E0n7KXXXXXbvXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', CAST(N'2019-01-13 13:46:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (337, N'abd岩烧吐司面包营养早餐手撕面包夹心糕点蛋糕零食食品整箱批发', 13, 28.8000, 41, 12, N'abd岩烧吐司面包营养早餐手撕面包夹心糕点蛋糕零食食品整箱批发', N'./upload/20190113134555TB21ws_uyOYBuNjSsD4XXbSkFXa_!!1756933560.jpg_q30.jpg', CAST(N'2019-01-13 13:46:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (338, N'abd蛋黄酥330g/盒6只装榴莲红豆莲蓉味手工传统点心糕点零食包邮', 14, 19.8000, 52, 38, N'abd蛋黄酥330g/盒6只装榴莲红豆莲蓉味手工传统点心糕点零食包邮', N'./upload/20190113134624TB1xZYBerwTMeJjSszfXXXbtFXa_!!2-item_pic.png_q30.jpg', CAST(N'2019-01-13 13:46:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (339, N'abd榴莲饼1000g 新鲜特产传统糕点点心整箱装榴莲酥零食', 14, 29.8000, 124, 88, N'abd榴莲饼1000g 新鲜特产传统糕点点心整箱装榴莲酥零食', N'./upload/20190113134646TB2EesPAxSYBuNjSsphXXbGvVXa_!!1756933560.jpg_q30.jpg', CAST(N'2019-01-13 13:47:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (340, N'中冠花生酥500g*2袋装特产糖果花生糖休闲零食酥糖喜糖年货圣诞', 14, 26.8000, 123, 99, N'中冠花生酥500g*2袋装特产糖果花生糖休闲零食酥糖喜糖年货圣诞', N'./upload/20190113134702O1CN01l62pwH1cAWTjxV7Yi_!!1756933560.jpg_q30.jpg', CAST(N'2019-01-13 13:47:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (341, N'阿婆家的麻薯180g爆浆麻薯糯米糍好吃网红宿舍小零食软糯的糕点', 14, 9.9000, 12, 0, N'阿婆家的麻薯180g爆浆麻薯糯米糍好吃网红宿舍小零食软糯的糕点', N'./upload/20190113134733O1CN01jmD7mA1cAWTpoex5l_!!1756933560.jpg_q30.jpg', CAST(N'2019-01-13 13:48:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (342, N'ABD岩烧饼1000g蓝莓饼凤梨饼榴莲饼糕点休闲办公零食特产点心', 14, 29.9000, 487, 384, N'ABD岩烧饼1000g蓝莓饼凤梨饼榴莲饼糕点休闲办公零食特产点心', N'./upload/20190113134754TB2Cb5IkrZnBKNjSZFrXXaRLFXa_!!1756933560.png_q30.jpg', CAST(N'2019-01-13 13:48:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (343, N'ABD榴莲饼300g零食榴莲酥休闲食品小吃美食 饼干点心榴莲酥包邮', 14, 15.8000, 456, 412, N'ABD榴莲饼300g零食榴莲酥休闲食品小吃美食 饼干点心榴莲酥包邮', N'./upload/20190113134819TB2m_3SiTXYBeNkHFrdXXciuVXa_!!1756933560.jpg', CAST(N'2019-01-13 13:48:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (344, N'ABD细沙水果芒果蓝莓草莓榴莲饼200g袋装糕点夹心早餐茶零食', 14, 10.8000, 106, 59, N'ABD细沙水果芒果蓝莓草莓榴莲饼200g袋装糕点夹心早餐茶零食', N'./upload/20190113134841O1CN015rJtWl1cAWTnkrOI2_!!1756933560.jpg_q30.jpg', CAST(N'2019-01-13 13:49:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (345, N'三惠手工麻花400g特产好吃零食小吃美食传统糕点点心袋装食品', 14, 15.8000, 145, 99, N'三惠手工麻花400g特产好吃零食小吃美食传统糕点点心袋装食品', N'./upload/20190113134900O1CN011j1KhB1cAWTajskUx_!!1756933560.jpg_q30.jpg', CAST(N'2019-01-13 13:49:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (346, N'三惠尖角脆500g 包邮锅巴薯片薯条怀旧儿童膨化食品零食 美食小吃', 15, 10.8000, 147, 54, N'三惠尖角脆500g 包邮锅巴薯片薯条怀旧儿童膨化食品零食 美食小吃', N'./upload/20190113134953TB218EEdypnpuFjSZFIXXXh2VXa_!!1756933560.jpg_q30.jpg', CAST(N'2019-01-13 13:50:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (347, N'阿婆家的大卫贝肯熊薯片38g休闲食品零食小吃礼包膨化组合装包邮', 15, 15.1000, 123, 102, N'阿婆家的大卫贝肯熊薯片38g休闲食品零食小吃礼包膨化组合装包邮', N'./upload/20190113135012O1CN011cAWTC0hqePfXZK_!!1756933560.jpg_q30.jpg', CAST(N'2019-01-13 13:50:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (348, N'忆之味山药脆片网红食品脆薯片薄片锅巴好吃的办公室休闲零食小吃', 15, 9.9000, 157, 121, N'忆之味山药脆片网红食品脆薯片薄片锅巴好吃的办公室休闲零食小吃', N'./upload/20190113135035O1CN011cAWSq2pbmBXiAV_!!1756933560.jpg_q30.jpg', CAST(N'2019-01-13 13:51:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (349, N'水军锅巴蛋黄锅巴手工休闲食品网红零食办公室小吃海鲜糯米锅巴', 15, 19.8000, 105, 105, N'水军锅巴蛋黄锅巴手工休闲食品网红零食办公室小吃海鲜糯米锅巴', N'./upload/20190113135114O1CN011cAWSWsODnr3EEt_!!1756933560.png_q30.jpg', CAST(N'2019-01-13 13:51:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (350, N'印尼Gery芝莉奶酪味抹茶味黑巧克力夹心饼干进口芝士椰子零食', 15, 9.8000, 5, 4, N'印尼Gery芝莉奶酪味抹茶味黑巧克力夹心饼干进口芝士椰子零食', N'./upload/20190113135132O1CN01p2twTC1cAWTrHRuRu_!!1756933560.jpg_q30.jpg', CAST(N'2019-01-13 13:52:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (351, N'阿婆家的大卫贝肯熊薯片70g休闲食品零食小吃礼包膨化组合装包邮', 15, 9.9000, 66, 54, N'阿婆家的大卫贝肯熊薯片70g休闲食品零食小吃礼包膨化组合装包邮', N'./upload/20190113135156O1CN011cAWT0Avd4J8SKi_!!1756933560.png_q30.jpg', CAST(N'2019-01-13 13:52:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (352, N'宇仔大刀肉辣条8090后儿时怀旧素零食大礼包麻辣小吃湖南重庆特产', 16, 14.9000, 78, 15, N'宇仔大刀肉辣条8090后儿时怀旧素零食大礼包麻辣小吃湖南重庆特产', N'./upload/20190113135216TB2bZRFeL1TBuNjy0FjXXajyXXa_!!3624770104.jpg_q30.jpg', CAST(N'2019-01-13 13:52:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (353, N'卫龙网红辣条亲嘴烧小面筋魔芋爽麻辣一箱小吃零食休闲食品大礼包', 16, 59.9000, 63, 61, N'卫龙网红辣条亲嘴烧小面筋魔芋爽麻辣一箱小吃零食休闲食品大礼包', N'./upload/20190113135254O1CN01xZMvPA2Dna2iDeX2K_!!1791258654.jpg_q30.jpg', CAST(N'2019-01-13 13:53:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (354, N'大面筋106g*5 卫龙辣条零食大礼包儿时网红小吃', 16, 22.9000, 85, 84, N'大面筋106g*5 卫龙辣条零食大礼包儿时网红小吃', N'./upload/20190113135324O1CN011GtwCEGvajNtVCl_!!0-item_pic.jpg_q30.jpg', CAST(N'2019-01-13 13:53:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (355, N'好味屋手撕素肉50包豆干制品素牛排卷宿舍休闲怀旧麻辣条小吃零食', 16, 19.8000, 5, 1, N'好味屋手撕素肉50包豆干制品素牛排卷宿舍休闲怀旧麻辣条小吃零食', N'./upload/20190113135350TB2yZOEniMnBKNjSZFoXXbOSFXa_!!2144338924.jpg_q30.jpg', CAST(N'2019-01-13 13:54:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (356, N'好味屋魔芋辣条素毛肚50包素食馋魔芋丝爽麻辣儿时宿舍小包装零食', 16, 18.8000, 45, 41, N'好味屋魔芋辣条素毛肚50包素食馋魔芋丝爽麻辣儿时宿舍小包装零食', N'./upload/20190113135411TB2vLmEJuGSBuNjSspbXXciipXa_!!2144338924.jpg_q30.jpg', CAST(N'2019-01-13 13:54:00' AS SmallDateTime), NULL)
INSERT [dbo].[tbl_goods] ([goodsID], [goodsName], [detailedTypeID], [goodsPrice], [goodsInCount], [goodsSellCount], [goodsDescript], [goodsImageUrl], [goodsDate], [goodsDiscountPrice]) VALUES (357, N'源氏老式大辣片网红辣皮辣条小零食小吃休闲食品麻辣儿时颖儿同款', 16, 25.8000, 46, 36, N'源氏老式大辣片网红辣皮辣条小零食小吃休闲食品麻辣儿时颖儿同款', N'./upload/20190113135427O1CN01sjRMnh1nRtHFY24ZE_!!2129965087.jpg_q30.jpg', CAST(N'2019-01-13 13:54:00' AS SmallDateTime), NULL)
SET IDENTITY_INSERT [dbo].[tbl_goods] OFF
SET IDENTITY_INSERT [dbo].[tbl_goodstype] ON 

INSERT [dbo].[tbl_goodstype] ([goodsTypeID], [goodsTypeName]) VALUES (1, N'酒水饮料')
INSERT [dbo].[tbl_goodstype] ([goodsTypeID], [goodsTypeName]) VALUES (2, N'咖啡冲饮')
INSERT [dbo].[tbl_goodstype] ([goodsTypeID], [goodsTypeName]) VALUES (3, N'糖果系列')
INSERT [dbo].[tbl_goodstype] ([goodsTypeID], [goodsTypeName]) VALUES (4, N'零食糕点')
SET IDENTITY_INSERT [dbo].[tbl_goodstype] OFF
SET IDENTITY_INSERT [dbo].[tbl_goodstype_detailed] ON 

INSERT [dbo].[tbl_goodstype_detailed] ([detailedTypeID], [goodsTypeID], [detailedTypeName]) VALUES (1, 1, N'啤酒风味')
INSERT [dbo].[tbl_goodstype_detailed] ([detailedTypeID], [goodsTypeID], [detailedTypeName]) VALUES (2, 1, N'中国精酿')
INSERT [dbo].[tbl_goodstype_detailed] ([detailedTypeID], [goodsTypeID], [detailedTypeName]) VALUES (3, 1, N'各国精酿')
INSERT [dbo].[tbl_goodstype_detailed] ([detailedTypeID], [goodsTypeID], [detailedTypeName]) VALUES (4, 1, N'果汁饮料')
INSERT [dbo].[tbl_goodstype_detailed] ([detailedTypeID], [goodsTypeID], [detailedTypeName]) VALUES (5, 2, N'速溶咖啡')
INSERT [dbo].[tbl_goodstype_detailed] ([detailedTypeID], [goodsTypeID], [detailedTypeName]) VALUES (6, 2, N'固体饮料')
INSERT [dbo].[tbl_goodstype_detailed] ([detailedTypeID], [goodsTypeID], [detailedTypeName]) VALUES (7, 3, N'软糖')
INSERT [dbo].[tbl_goodstype_detailed] ([detailedTypeID], [goodsTypeID], [detailedTypeName]) VALUES (8, 3, N'奶片')
INSERT [dbo].[tbl_goodstype_detailed] ([detailedTypeID], [goodsTypeID], [detailedTypeName]) VALUES (9, 3, N'果冻')
INSERT [dbo].[tbl_goodstype_detailed] ([detailedTypeID], [goodsTypeID], [detailedTypeName]) VALUES (10, 3, N'硬糖')
INSERT [dbo].[tbl_goodstype_detailed] ([detailedTypeID], [goodsTypeID], [detailedTypeName]) VALUES (11, 3, N'巧克力')
INSERT [dbo].[tbl_goodstype_detailed] ([detailedTypeID], [goodsTypeID], [detailedTypeName]) VALUES (12, 4, N'曲奇饼干')
INSERT [dbo].[tbl_goodstype_detailed] ([detailedTypeID], [goodsTypeID], [detailedTypeName]) VALUES (13, 4, N'西式糕点')
INSERT [dbo].[tbl_goodstype_detailed] ([detailedTypeID], [goodsTypeID], [detailedTypeName]) VALUES (14, 4, N'传统糕点')
INSERT [dbo].[tbl_goodstype_detailed] ([detailedTypeID], [goodsTypeID], [detailedTypeName]) VALUES (15, 4, N'膨化食品')
INSERT [dbo].[tbl_goodstype_detailed] ([detailedTypeID], [goodsTypeID], [detailedTypeName]) VALUES (16, 4, N'辣条')
SET IDENTITY_INSERT [dbo].[tbl_goodstype_detailed] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tbl_adminName]    Script Date: 2019/1/14 13:49:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tbl_adminName] ON [dbo].[tbl_admin]
(
	[adminName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tbl_customerName]    Script Date: 2019/1/14 13:49:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tbl_customerName] ON [dbo].[tbl_customer]
(
	[customerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_goods]  WITH CHECK ADD  CONSTRAINT [FK_tbl_goods_tbl_goodstype_detailed] FOREIGN KEY([detailedTypeID])
REFERENCES [dbo].[tbl_goodstype_detailed] ([detailedTypeID])
GO
ALTER TABLE [dbo].[tbl_goods] CHECK CONSTRAINT [FK_tbl_goods_tbl_goodstype_detailed]
GO
ALTER TABLE [dbo].[tbl_goodstype_detailed]  WITH CHECK ADD  CONSTRAINT [FK_tbl_goodstype_detailed_tbl_goodstype] FOREIGN KEY([goodsTypeID])
REFERENCES [dbo].[tbl_goodstype] ([goodsTypeID])
GO
ALTER TABLE [dbo].[tbl_goodstype_detailed] CHECK CONSTRAINT [FK_tbl_goodstype_detailed_tbl_goodstype]
GO
ALTER TABLE [dbo].[tbl_order]  WITH CHECK ADD  CONSTRAINT [FK_tbl_order_tbl_customer] FOREIGN KEY([customerName])
REFERENCES [dbo].[tbl_customer] ([customerName])
GO
ALTER TABLE [dbo].[tbl_order] CHECK CONSTRAINT [FK_tbl_order_tbl_customer]
GO
ALTER TABLE [dbo].[tbl_order_detailed]  WITH CHECK ADD  CONSTRAINT [FK_tbl_order_detailed_tbl_goods] FOREIGN KEY([goodsID])
REFERENCES [dbo].[tbl_goods] ([goodsID])
GO
ALTER TABLE [dbo].[tbl_order_detailed] CHECK CONSTRAINT [FK_tbl_order_detailed_tbl_goods]
GO
ALTER TABLE [dbo].[tbl_order_detailed]  WITH CHECK ADD  CONSTRAINT [FK_tbl_order_detailed_tbl_order] FOREIGN KEY([orderID])
REFERENCES [dbo].[tbl_order] ([orderID])
GO
ALTER TABLE [dbo].[tbl_order_detailed] CHECK CONSTRAINT [FK_tbl_order_detailed_tbl_order]
GO
ALTER TABLE [dbo].[tbl_shopcart]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ shopcart_tbl_customer] FOREIGN KEY([customerName])
REFERENCES [dbo].[tbl_customer] ([customerName])
GO
ALTER TABLE [dbo].[tbl_shopcart] CHECK CONSTRAINT [FK_tbl_ shopcart_tbl_customer]
GO
ALTER TABLE [dbo].[tbl_shopcart]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ shopcart_tbl_goods] FOREIGN KEY([goodsID])
REFERENCES [dbo].[tbl_goods] ([goodsID])
GO
ALTER TABLE [dbo].[tbl_shopcart] CHECK CONSTRAINT [FK_tbl_ shopcart_tbl_goods]
GO
USE [master]
GO
ALTER DATABASE [ssm] SET  READ_WRITE 
GO
