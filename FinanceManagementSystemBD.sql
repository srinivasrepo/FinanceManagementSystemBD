USE [master]
GO
/****** Object:  Database [Finance]    Script Date: 15-11-2020 11:48:09 ******/
CREATE DATABASE [Finance]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Finance', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER_PRAC\MSSQL\DATA\Finance.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Finance_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER_PRAC\MSSQL\DATA\Finance_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Finance] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Finance].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Finance] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Finance] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Finance] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Finance] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Finance] SET ARITHABORT OFF 
GO
ALTER DATABASE [Finance] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Finance] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Finance] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Finance] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Finance] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Finance] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Finance] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Finance] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Finance] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Finance] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Finance] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Finance] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Finance] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Finance] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Finance] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Finance] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Finance] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Finance] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Finance] SET  MULTI_USER 
GO
ALTER DATABASE [Finance] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Finance] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Finance] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Finance] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Finance] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Finance] SET QUERY_STORE = OFF
GO
USE [Finance]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 15-11-2020 11:48:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] NOT NULL,
	[AdminName] [nvarchar](20) NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[ActivationStatus] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 15-11-2020 11:48:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank](
	[BankID] [int] NULL,
	[BankName] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BankName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardTable]    Script Date: 15-11-2020 11:48:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardTable](
	[CardNumber] [bigint] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[ValidTill] [nvarchar](20) NOT NULL,
	[CardType] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardTypeTable]    Script Date: 15-11-2020 11:48:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardTypeTable](
	[CardType] [nvarchar](20) NOT NULL,
	[JoiningFee] [int] NULL,
	[TotalCredit] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CardType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConsumerTable]    Script Date: 15-11-2020 11:48:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsumerTable](
	[UserName] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[DateofBirth] [date] NOT NULL,
	[PhoneNo] [bigint] NOT NULL,
	[Email] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](80) NULL,
	[Password] [nvarchar](20) NOT NULL,
	[CardType] [nvarchar](20) NULL,
	[SelectBank] [nvarchar](20) NULL,
	[IFSC_Code] [nvarchar](20) NULL,
	[AccountNumber] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 15-11-2020 11:48:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[TotalAmount] [int] NOT NULL,
	[ProcessingFee] [float] NOT NULL,
	[EMI_Tenure_in_Months] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 15-11-2020 11:48:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(120001,1) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[BillAmountperMonth] [float] NOT NULL,
	[CardNumber] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OTP_Validation]    Script Date: 15-11-2020 11:48:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OTP_Validation](
	[UserName] [nvarchar](20) NOT NULL,
	[OTP_Sent] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 15-11-2020 11:48:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(5000,1) NOT NULL,
	[ProductName] [nvarchar](40) NULL,
	[ProductDetails] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[CostPerUnit] [int] NOT NULL,
	[AvailableQuantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([AdminID], [AdminName], [UserName], [ActivationStatus]) VALUES (4001, N'Rajiv', N'Aravind', 0)
INSERT [dbo].[Admin] ([AdminID], [AdminName], [UserName], [ActivationStatus]) VALUES (4001, N'Rajiv', N'Arulselvan', 1)
INSERT [dbo].[Admin] ([AdminID], [AdminName], [UserName], [ActivationStatus]) VALUES (4001, N'Rajiv', N'Harshit', 1)
INSERT [dbo].[Admin] ([AdminID], [AdminName], [UserName], [ActivationStatus]) VALUES (4001, N'Rajiv', N'Karthik24', 1)
INSERT [dbo].[Admin] ([AdminID], [AdminName], [UserName], [ActivationStatus]) VALUES (4001, N'Rajiv', N'RamKumar', 0)
GO
INSERT [dbo].[Bank] ([BankID], [BankName]) VALUES (1001, N'Indian Bank')
INSERT [dbo].[Bank] ([BankID], [BankName]) VALUES (1002, N'HDFC Bank')
INSERT [dbo].[Bank] ([BankID], [BankName]) VALUES (1003, N'CanaraBank')
INSERT [dbo].[Bank] ([BankID], [BankName]) VALUES (1004, N'State Bank of India')
INSERT [dbo].[Bank] ([BankID], [BankName]) VALUES (1005, N'Punjab National Bank')
GO
INSERT [dbo].[CardTable] ([CardNumber], [Name], [ValidTill], [CardType]) VALUES (4386323526003214, N'Harshit', N'12/24', N'Titanium')
INSERT [dbo].[CardTable] ([CardNumber], [Name], [ValidTill], [CardType]) VALUES (6051232536001234, N'Arulselvan', N'07/22', N'Titanium')
INSERT [dbo].[CardTable] ([CardNumber], [Name], [ValidTill], [CardType]) VALUES (6201635624009600, N'Karthik24', N'06/26', N'Gold')
GO
INSERT [dbo].[CardTypeTable] ([CardType], [JoiningFee], [TotalCredit]) VALUES (N'Gold', 1000, 40000)
INSERT [dbo].[CardTypeTable] ([CardType], [JoiningFee], [TotalCredit]) VALUES (N'Titanium', 2000, 100000)
GO
INSERT [dbo].[ConsumerTable] ([UserName], [Name], [DateofBirth], [PhoneNo], [Email], [Address], [Password], [CardType], [SelectBank], [IFSC_Code], [AccountNumber]) VALUES (N'Aravind', N'Aravin Krishna', CAST(N'1989-03-21' AS Date), 8715426925, N'aravind21@gmail.com', N'No.5, princess street, fort kochi, Ernakulam-682001', N'aravind@123', N'Gold', N'Punjab National Bank', N'PNB000T623', 1000325647891)
INSERT [dbo].[ConsumerTable] ([UserName], [Name], [DateofBirth], [PhoneNo], [Email], [Address], [Password], [CardType], [SelectBank], [IFSC_Code], [AccountNumber]) VALUES (N'Arulselvan', N'Arul Selvan', CAST(N'1997-08-24' AS Date), 7708182180, N'arul@gmail.com', N'No.4, 11thCross, K.K Nagar,Trichy-621216', N'Arul@123', N'Titanium', N'Indian Bank', N'IDIB000T164', 6386708849)
INSERT [dbo].[ConsumerTable] ([UserName], [Name], [DateofBirth], [PhoneNo], [Email], [Address], [Password], [CardType], [SelectBank], [IFSC_Code], [AccountNumber]) VALUES (N'Harshit', N'Harshit Mishra', CAST(N'1996-09-05' AS Date), 7904958146, N'harshit.m@yahoo.com', N'1/97, Gomti Nagar, South Lucknow, 226001', N'Hmishra@123', N'Titanium', N'State Bank of India', N'SBIN000264', 738649572346)
INSERT [dbo].[ConsumerTable] ([UserName], [Name], [DateofBirth], [PhoneNo], [Email], [Address], [Password], [CardType], [SelectBank], [IFSC_Code], [AccountNumber]) VALUES (N'Karthik24', N'Karthikeyan', CAST(N'2001-05-09' AS Date), 9798141815, N'Karthik24@gmail.com', N'4th floor, Anu Apartment, Thillai Nagar, Chennai-600028', N'Karthik@123', N'Gold', N'CanaraBank', N'CNRB00A208', 4897659942)
INSERT [dbo].[ConsumerTable] ([UserName], [Name], [DateofBirth], [PhoneNo], [Email], [Address], [Password], [CardType], [SelectBank], [IFSC_Code], [AccountNumber]) VALUES (N'RamKumar', N'Ram Kumar', CAST(N'1984-02-15' AS Date), 9812345678, N'Ramkumar02@gmail.com', N'204, Vertica-B wing, Palava, Mumbai-421204', N'Ram@Kumar123', N'Gold', N'HDFC Bank', N'HDFC0000060', 9000145672)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [TotalAmount], [ProcessingFee], [EMI_Tenure_in_Months]) VALUES (120001, 5003, 1, 15000, 300, 6)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [TotalAmount], [ProcessingFee], [EMI_Tenure_in_Months]) VALUES (120002, 5006, 1, 19999, 399.98, 9)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [TotalAmount], [ProcessingFee], [EMI_Tenure_in_Months]) VALUES (120003, 5005, 1, 64999, 1299.98, 12)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [OrderDate], [BillAmountperMonth], [CardNumber]) VALUES (120001, CAST(N'2020-11-09' AS Date), 2550, 6051232536001234)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [BillAmountperMonth], [CardNumber]) VALUES (120002, CAST(N'2020-11-14' AS Date), 2266.55, 6201635624009600)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [BillAmountperMonth], [CardNumber]) VALUES (120003, CAST(N'2020-11-05' AS Date), 5524.91, 4386323526003214)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDetails], [Image], [CostPerUnit], [AvailableQuantity]) VALUES (5003, N'Nokia 6.1 Plus', N' 5.84 inch FHD Display, 3000 Mah Battery, Android 10, Snapdragon Processor', N'C:\Users\SELVA\OneDrive\Desktop\Arul\Project Gladiator\Images\Nokia 6.1 Plus.jpg', 15000, 150)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDetails], [Image], [CostPerUnit], [AvailableQuantity]) VALUES (5004, N'Iphone 12', N' 6.1 inch FHD+ Display, 2800 Mah Battery, Ios 14, A14 Processor', N'C:\Users\SELVA\OneDrive\Desktop\Arul\Project Gladiator\Images\Iphone 12.jpg', 79000, 200)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDetails], [Image], [CostPerUnit], [AvailableQuantity]) VALUES (5005, N'Dell Inspiron 15 5590', N' 15.6 inch FHD Display, i5- 10th Gen Processor, 8-gb Ram, 512 GB SSD , Windows 10, 3000 Mah Battery', N'C:\Users\SELVA\OneDrive\Desktop\Arul\Project Gladiator\Images\Dell inspiron 15 5590.jpg', 64999, 120)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDetails], [Image], [CostPerUnit], [AvailableQuantity]) VALUES (5006, N'LG Refrigerator', N'Double Door, Extra-cool, Advanced Cooling technology, 256 litre capacity', N'C:\Users\SELVA\OneDrive\Desktop\Arul\Project Gladiator\Images\LG Refrigerator.jpg', 19999, 75)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
/****** Object:  Index [UQ__Bank__AA08CB328C141E3E]    Script Date: 15-11-2020 11:48:10 ******/
ALTER TABLE [dbo].[Bank] ADD UNIQUE NONCLUSTERED 
(
	[BankID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Consumer__A9D10534FF674AB9]    Script Date: 15-11-2020 11:48:10 ******/
ALTER TABLE [dbo].[ConsumerTable] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Consumer__F3EE33E24DA612CF]    Script Date: 15-11-2020 11:48:10 ******/
ALTER TABLE [dbo].[ConsumerTable] ADD UNIQUE NONCLUSTERED 
(
	[PhoneNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD FOREIGN KEY([UserName])
REFERENCES [dbo].[ConsumerTable] ([UserName])
GO
ALTER TABLE [dbo].[CardTable]  WITH CHECK ADD FOREIGN KEY([Name])
REFERENCES [dbo].[Admin] ([UserName])
GO
ALTER TABLE [dbo].[ConsumerTable]  WITH CHECK ADD FOREIGN KEY([CardType])
REFERENCES [dbo].[CardTypeTable] ([CardType])
GO
ALTER TABLE [dbo].[ConsumerTable]  WITH CHECK ADD FOREIGN KEY([SelectBank])
REFERENCES [dbo].[Bank] ([BankName])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CardNumber])
REFERENCES [dbo].[CardTable] ([CardNumber])
GO
ALTER TABLE [dbo].[OTP_Validation]  WITH CHECK ADD FOREIGN KEY([UserName])
REFERENCES [dbo].[ConsumerTable] ([UserName])
GO
USE [master]
GO
ALTER DATABASE [Finance] SET  READ_WRITE 
GO
