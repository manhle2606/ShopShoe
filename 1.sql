USE [master]
GO
/****** Object:  Database [ShoeShop]    . ******/
CREATE DATABASE [ShoeShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoeShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ShoeShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShoeShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ShoeShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ShoeShop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoeShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoeShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoeShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoeShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoeShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoeShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoeShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShoeShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoeShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoeShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoeShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoeShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoeShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoeShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoeShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoeShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShoeShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoeShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoeShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoeShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoeShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoeShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoeShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoeShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShoeShop] SET  MULTI_USER 
GO
ALTER DATABASE [ShoeShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoeShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoeShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoeShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShoeShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShoeShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShoeShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [ShoeShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ShoeShop]
GO
/****** Object:  Table [dbo].[Brands]    . ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Image] [text] NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    . ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Image] [text] NULL,
 CONSTRAINT [PK_Categorys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    . ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Fullname] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Phone] [int] NULL,
	[Address] [varchar](50) NULL,
	[RoleId] [nchar](10) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    . ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    . ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Order_date] [date] NULL,
	[Total] [float] NULL,
	[Notes] [varchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    . ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[BrandId] [int] NULL,
	[Name] [varchar](50) NULL,
	[Image] [text] NULL,
	[Price] [float] NULL,
	[Stock] [int] NULL,
	[Created_date] [date] NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([BrandId], [Name], [Image]) VALUES (1, N'Adidas', N'https://i.pinimg.com/564x/19/0e/43/190e434dd8da20da009cf532dacdda55.jpg')
INSERT [dbo].[Brands] ([BrandId], [Name], [Image]) VALUES (2, N'Nike', N'https://i.pinimg.com/564x/be/a9/4c/bea94cd38b7caef4a8a279fd44858f9b.jpg')
INSERT [dbo].[Brands] ([BrandId], [Name], [Image]) VALUES (3, N'Ananas', N'https://i.pinimg.com/736x/58/70/4d/58704d4fdf480ce77309dd75725d354c.jpg')
INSERT [dbo].[Brands] ([BrandId], [Name], [Image]) VALUES (4, N'Vans', N'https://i.pinimg.com/564x/35/cc/d4/35ccd458c82a5055de1d236e2c830756.jpg')
INSERT [dbo].[Brands] ([BrandId], [Name], [Image]) VALUES (5, N'Converse', N'https://i.pinimg.com/564x/3d/2b/eb/3d2bebb2ef45f2b41e2ea9ce3b4ee436.jpg')
INSERT [dbo].[Brands] ([BrandId], [Name], [Image]) VALUES (6, N'The wolf', N'https://cf.shopee.vn/file/0bf0861412862f6e224faf3607e8b684')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Image]) VALUES (1, N'Sports', N'https://i.pinimg.com/564x/79/c5/9b/79c59b1a66a361555293ed57182224dc.jpg')
INSERT [dbo].[Categories] ([Id], [Name], [Image]) VALUES (2, N'Tennis', N'https://i.pinimg.com/564x/f9/a9/23/f9a923a0b940a25eea577ee98322b20c.jpg')
INSERT [dbo].[Categories] ([Id], [Name], [Image]) VALUES (3, N'Basketball', N'https://i.pinimg.com/564x/ad/64/bf/ad64bfba5cbd00b2799b84a5029798a4.jpg')
INSERT [dbo].[Categories] ([Id], [Name], [Image]) VALUES (4, N'Football', N'https://i.pinimg.com/564x/29/12/ec/2912eca5cf1b5353d8b78508704e8237.jpg')
INSERT [dbo].[Categories] ([Id], [Name], [Image]) VALUES (5, N'Fashion', N'https://i.pinimg.com/564x/5e/8f/fa/5e8ffa3c3848c516d13ae2b28312985b.jpg')
INSERT [dbo].[Categories] ([Id], [Name], [Image]) VALUES (6, N'Office', N'https://i.pinimg.com/564x/15/64/f4/1564f43527c624ba57470ba351818aba.jpg')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [Username], [Fullname], [Password], [Phone], [Address], [RoleId]) VALUES (1, N'abc', N'ABC', N'123', 987654321, N'Ha Noi', N'US        ')
INSERT [dbo].[Customers] ([Id], [Username], [Fullname], [Password], [Phone], [Address], [RoleId]) VALUES (2, N'admin', N'Admin', N'123', 1234567890, N'Ho Chi Minh', N'AD        ')
INSERT [dbo].[Customers] ([Id], [Username], [Fullname], [Password], [Phone], [Address], [RoleId]) VALUES (3, N'student1', N'Minh Hoang', N'123', 123, N'Ha Noi', N'US        ')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1, 2, 2, 100, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (2, 2, 7, 123, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (3, 3, 5, 210, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (4, 3, 1, 100, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (5, 4, 2, 100, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [UserId], [Order_date], [Total], [Notes]) VALUES (2, 1, CAST(N'2023-07-12' AS Date), 223, N'please carefully')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Order_date], [Total], [Notes]) VALUES (3, 1, CAST(N'2023-07-12' AS Date), 610, N'please careful')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Order_date], [Total], [Notes]) VALUES (4, 1, CAST(N'2023-07-16' AS Date), 100, N'please careful')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [CategoryId], [BrandId], [Name], [Image], [Price], [Stock], [Created_date], [Description]) VALUES (1, 6, 6, N'The wolf lady', N'https://product.hstatic.net/200000033444/product/2_4e77dc31f1ac478f85b839a374a40f75_master.jpg', 100, 96, CAST(N'2023-07-08' AS Date), N'Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.')
INSERT [dbo].[Products] ([Id], [CategoryId], [BrandId], [Name], [Image], [Price], [Stock], [Created_date], [Description]) VALUES (2, 1, 1, N'Adidas Samba', N'https://i.pinimg.com/564x/fe/76/73/fe76734e2ccc90877676501130f40ebd.jpg', 100, 98, CAST(N'2023-07-08' AS Date), N'Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.')
INSERT [dbo].[Products] ([Id], [CategoryId], [BrandId], [Name], [Image], [Price], [Stock], [Created_date], [Description]) VALUES (3, 1, 2, N'Brooks Men', N'https://m.media-amazon.com/images/I/81C6pdykxDL._AC_UY575_.jpg', 100, 100, CAST(N'2023-07-08' AS Date), N'Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.')
INSERT [dbo].[Products] ([Id], [CategoryId], [BrandId], [Name], [Image], [Price], [Stock], [Created_date], [Description]) VALUES (4, 1, 2, N'O - 9', N'https://i.pinimg.com/564x/16/a1/b1/16a1b19267a6fd5b649cdc721333b4b6.jpg', 200, 100, CAST(N'2023-07-08' AS Date), N'Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.')
INSERT [dbo].[Products] ([Id], [CategoryId], [BrandId], [Name], [Image], [Price], [Stock], [Created_date], [Description]) VALUES (5, 2, 2, N'Speed FF2', N'https://i.pinimg.com/564x/74/cf/bd/74cfbde6c111b8c0d23ee7358a873d06.jpg', 210, 99, CAST(N'2023-07-08' AS Date), N'Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.')
INSERT [dbo].[Products] ([Id], [CategoryId], [BrandId], [Name], [Image], [Price], [Stock], [Created_date], [Description]) VALUES (6, 2, 1, N'Gel-Dedicate 7 Light Blue', N'https://i.pinimg.com/564x/c7/b7/23/c7b723d0f4f90a62794167b032f19def.jpg', 123, 100, CAST(N'2023-07-08' AS Date), N'Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.')
INSERT [dbo].[Products] ([Id], [CategoryId], [BrandId], [Name], [Image], [Price], [Stock], [Created_date], [Description]) VALUES (7, 4, 2, N'Nike Soccer Shoes', N'https://i.pinimg.com/564x/1a/7e/a0/1a7ea0f5d21fbe5fbbe3cc975bddae9a.jpg', 123, 99, CAST(N'2023-07-08' AS Date), N'Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.')
INSERT [dbo].[Products] ([Id], [CategoryId], [BrandId], [Name], [Image], [Price], [Stock], [Created_date], [Description]) VALUES (10, 2, 1, N'Gel-Dedicate 7 Women''s Tennis', N'https://i.pinimg.com/564x/43/b2/7b/43b27b9e1f8ed94325394f2d010d28dc.jpg', 122, 199, CAST(N'2023-07-08' AS Date), N'Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.')
INSERT [dbo].[Products] ([Id], [CategoryId], [BrandId], [Name], [Image], [Price], [Stock], [Created_date], [Description]) VALUES (11, 1, 2, N'Stadium Goods x K-Swiss Si-18', N'https://i.pinimg.com/564x/bb/08/fe/bb08fedd799d8b04ca95ca54ce5d4b89.jpg', 111, 111, CAST(N'2023-07-08' AS Date), N'Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.')
INSERT [dbo].[Products] ([Id], [CategoryId], [BrandId], [Name], [Image], [Price], [Stock], [Created_date], [Description]) VALUES (12, 1, 2, N'IN THE AIR - NIKE', N'https://i.pinimg.com/736x/fd/04/40/fd04400d11b02b7d57a17f1819bf2223.jpg', 111, 111, CAST(N'2023-07-08' AS Date), N'Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.')
INSERT [dbo].[Products] ([Id], [CategoryId], [BrandId], [Name], [Image], [Price], [Stock], [Created_date], [Description]) VALUES (13, 1, 1, N'Ocean Jordan', N'https://i.pinimg.com/564x/3b/0f/c0/3b0fc0850c87198fb65f1587beb6ef11.jpg', 111, 111, CAST(N'2023-07-08' AS Date), N'Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.')
INSERT [dbo].[Products] ([Id], [CategoryId], [BrandId], [Name], [Image], [Price], [Stock], [Created_date], [Description]) VALUES (14, 1, 2, N'Pink Jordan', N'https://i.pinimg.com/736x/fd/04/40/fd04400d11b02b7d57a17f1819bf2223.jpg', 111, 221, CAST(N'2023-07-08' AS Date), N'Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
USE [master]
GO
ALTER DATABASE [ShoeShop] SET  READ_WRITE 
GO
CREATE TABLE OrderDetails (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    OrderId INT NULL,
    ProductId INT NULL,
    Price FLOAT NULL,
    Quantity INT NULL,
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
    FOREIGN KEY (ProductId) REFERENCES Products(Id)
);
-- Tạo bảng Products
CREATE TABLE Products (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    CategoryId INT NULL,
    BrandId INT NULL,
    Name VARCHAR(50) NULL,
    Image TEXT NULL,
    Price FLOAT NULL,
    Stock INT NULL,
    Created_date DATE NULL,
    Description TEXT NULL,
    FOREIGN KEY (CategoryId) REFERENCES Categories(Id),
    FOREIGN KEY (BrandId) REFERENCES Brands(BrandId)
);
-- Tạo bảng Brands
CREATE TABLE Brands (
    BrandId INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) NULL,
    Image TEXT NULL
);

-- Tạo bảng Categories
CREATE TABLE Categories (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) NULL,
    Image TEXT NULL
);

-- Tạo bảng Customers
CREATE TABLE Customers (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Username VARCHAR(50) NULL,
    Fullname VARCHAR(50) NULL,
    Password VARCHAR(50) NULL,
    Phone INT NULL,
    Address VARCHAR(50) NULL,
    RoleId NCHAR(10) NULL
);

-- Tạo bảng Orders
CREATE TABLE Orders (
    OrderId INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NULL,
    Order_date DATE NULL,
    Total FLOAT NULL,
    Notes VARCHAR(50) NULL,
    FOREIGN KEY (UserId) REFERENCES Customers(Id)
);

-- Tạo bảng OrderDetails



