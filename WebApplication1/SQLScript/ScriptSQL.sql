USE [TicketTour]
GO
/****** Object:  Table [dbo].[VoteTour]    Script Date: 12/5/2022 9:47:02 PM ******/
DROP TABLE IF EXISTS [dbo].[VoteTour]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 12/5/2022 9:47:02 PM ******/
DROP TABLE IF EXISTS [dbo].[Vehicle]
GO
/****** Object:  Table [dbo].[TourStaff]    Script Date: 12/5/2022 9:47:02 PM ******/
DROP TABLE IF EXISTS [dbo].[TourStaff]
GO
/****** Object:  Table [dbo].[TourSchedule]    Script Date: 12/5/2022 9:47:02 PM ******/
DROP TABLE IF EXISTS [dbo].[TourSchedule]
GO
/****** Object:  Table [dbo].[TourImage]    Script Date: 12/5/2022 9:47:02 PM ******/
DROP TABLE IF EXISTS [dbo].[TourImage]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 12/5/2022 9:47:02 PM ******/
DROP TABLE IF EXISTS [dbo].[Tour]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 12/5/2022 9:47:02 PM ******/
DROP TABLE IF EXISTS [dbo].[Ticket]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 12/5/2022 9:47:02 PM ******/
DROP TABLE IF EXISTS [dbo].[Staff]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/5/2022 9:47:02 PM ******/
DROP TABLE IF EXISTS [dbo].[Orders]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 12/5/2022 9:47:02 PM ******/
DROP TABLE IF EXISTS [dbo].[Location]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 12/5/2022 9:47:02 PM ******/
DROP TABLE IF EXISTS [dbo].[Hotel]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/5/2022 9:47:02 PM ******/
DROP TABLE IF EXISTS [dbo].[Customer]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/5/2022 9:47:02 PM ******/
DROP TABLE IF EXISTS [dbo].[Category]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/5/2022 9:47:02 PM ******/
DROP TABLE IF EXISTS [dbo].[Account]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/5/2022 9:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[AccountType] [int] NULL,
	[Admin] [bit] NULL,
	[Active] [bit] NULL,
	[Balance] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/5/2022 9:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryCode] [nvarchar](50) NULL,
	[CategoryName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/5/2022 9:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[DOB] [date] NULL,
	[PassPortCode] [nvarchar](50) NULL,
	[Gender] [int] NULL,
	[Address] [nvarchar](max) NULL,
	[AccountId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 12/5/2022 9:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[HotelId] [int] IDENTITY(1,1) NOT NULL,
	[HotelName] [nvarchar](max) NULL,
	[TypeRoom] [int] NULL,
	[PricePerOne] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[HotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 12/5/2022 9:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[LocationCode] [nvarchar](50) NULL,
	[LocationName] [nvarchar](max) NULL,
	[Locate] [nvarchar](max) NULL,
	[Iframe] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/5/2022 9:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[TicketId] [int] NULL,
	[Status] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[DeletedAt] [datetime] NULL,
	[QRCode] [nvarchar](max) NULL,
	[CustomerId] [int] NULL,
	[TotalPrice] [decimal](18, 0) NULL,
	[TicketGrowup] [int] NULL,
	[TicketChild] [int] NULL,
	[TourId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 12/5/2022 9:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffId] [int] IDENTITY(1,1) NOT NULL,
	[StaffName] [nvarchar](50) NULL,
	[StaffCode] [nvarchar](50) NULL,
	[DOB] [date] NULL,
	[Gender] [int] NULL,
	[Address] [nvarchar](max) NULL,
	[StartDate] [date] NULL,
	[Position] [nvarchar](50) NULL,
	[Salary] [decimal](18, 0) NULL,
	[AccountId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 12/5/2022 9:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[TicketId] [int] IDENTITY(1,1) NOT NULL,
	[Status] [int] NULL,
	[TicketType] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[TourId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 12/5/2022 9:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[TourId] [int] IDENTITY(1,1) NOT NULL,
	[TourName] [nvarchar](max) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[TourTime] [nvarchar](max) NULL,
	[LocationFrom] [nvarchar](max) NULL,
	[LocationTo] [nvarchar](max) NULL,
	[Price] [decimal](18, 0) NULL,
	[Poster] [nvarchar](max) NULL,
	[Descrip] [nvarchar](max) NULL,
	[VehicleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourImage]    Script Date: 12/5/2022 9:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourImage](
	[TourImageId] [int] IDENTITY(1,1) NOT NULL,
	[TourId] [int] NULL,
	[Image] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[TourImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourSchedule]    Script Date: 12/5/2022 9:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourSchedule](
	[TourScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[TourScheduleName] [nvarchar](max) NULL,
	[NumDay] [int] NULL,
	[Image] [nvarchar](max) NULL,
	[Descrip] [nvarchar](max) NULL,
	[TourId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TourScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourStaff]    Script Date: 12/5/2022 9:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourStaff](
	[TourStaffId] [int] IDENTITY(1,1) NOT NULL,
	[StaffId] [int] NULL,
	[TourId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TourStaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 12/5/2022 9:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[VehicleId] [int] IDENTITY(1,1) NOT NULL,
	[VahicleName] [nvarchar](50) NULL,
	[VehicleCode] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[Slot] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[VehicleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VoteTour]    Script Date: 12/5/2022 9:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VoteTour](
	[VoteTourId] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NULL,
	[TourId] [int] NULL,
	[Star] [int] NULL,
	[Comment] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[VoteTourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 
GO
INSERT [dbo].[Account] ([AccountId], [UserName], [Password], [Email], [Phone], [AccountType], [Admin], [Active], [Balance]) VALUES (1, N'tiennn', N'123', N'admin@novaon.vn', N'0123', 1, 0, 1, CAST(10000000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Account] ([AccountId], [UserName], [Password], [Email], [Phone], [AccountType], [Admin], [Active], [Balance]) VALUES (2, N'test1', N'123', N'test@gmail.com', N'12345', 1, 0, 1, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[Account] ([AccountId], [UserName], [Password], [Email], [Phone], [AccountType], [Admin], [Active], [Balance]) VALUES (3, N'admin1', N'123', N'admin1@gmail.com', N'21421321', 1, 0, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [DOB], [PassPortCode], [Gender], [Address], [AccountId]) VALUES (1, N'Nguyễn Ngọc Tiến', CAST(N'2022-11-09' AS Date), N'123', NULL, N'1234', 1)
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [DOB], [PassPortCode], [Gender], [Address], [AccountId]) VALUES (2, N'Nguyễn Ngọc Tiến', CAST(N'2022-11-01' AS Date), N'123', NULL, N'HA NOI', 2)
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [DOB], [PassPortCode], [Gender], [Address], [AccountId]) VALUES (3, N'TESTER', CAST(N'2022-12-01' AS Date), N'1232134', NULL, N'HCM', 3)
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Hotel] ON 
GO
INSERT [dbo].[Hotel] ([HotelId], [HotelName], [TypeRoom], [PricePerOne]) VALUES (1, N'5 sao', 2, CAST(14000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Hotel] OFF
GO
SET IDENTITY_INSERT [dbo].[Location] ON 
GO
INSERT [dbo].[Location] ([LocationId], [LocationCode], [LocationName], [Locate], [Iframe]) VALUES (1, N'001', N'phường 6, Quận 6, Thành phố Hồ Chí Minh, Việt Nam', N'12312441', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.768547531678!2d106.64062891524102!3d10.752313162577492!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752e8e2a71b323%3A0xb2ef7f2590547743!2zTWluaCBQaOG7pW5nLCBwaMaw4budbmcgNiwgUXXhuq1uIDYsIFRow6BuaCBwaOG7kSBI4buTIENow60gTWluaCwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1669646847952!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>')
GO
SET IDENTITY_INSERT [dbo].[Location] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([OrderId], [TicketId], [Status], [CreatedAt], [DeletedAt], [QRCode], [CustomerId], [TotalPrice], [TicketGrowup], [TicketChild], [TourId]) VALUES (1, NULL, 1, CAST(N'2022-12-01T22:37:18.800' AS DateTime), NULL, N'{"AccountId":3,"CustomerName":null,"StatusName":null,"OrderId":0,"TicketId":null,"Status":1,"CreatedAt":"2022-12-01T22:37:15.775732+07:00","DeletedAt":null,"QRCode":null,"CustomerId":null,"TotalPrice":null,"TicketGrowup":1,"TicketChild":null,"TourId":2}', 3, NULL, 1, 0, 2)
GO
INSERT [dbo].[Orders] ([OrderId], [TicketId], [Status], [CreatedAt], [DeletedAt], [QRCode], [CustomerId], [TotalPrice], [TicketGrowup], [TicketChild], [TourId]) VALUES (2, NULL, 2, CAST(N'2022-12-01T22:38:42.483' AS DateTime), CAST(N'2022-12-01T22:38:54.140' AS DateTime), N'{"AccountId":3,"CustomerName":null,"StatusName":null,"OrderId":0,"TicketId":null,"Status":1,"CreatedAt":"2022-12-01T22:38:42.0770544+07:00","DeletedAt":null,"QRCode":null,"CustomerId":null,"TotalPrice":null,"TicketGrowup":1,"TicketChild":null,"TourId":2}', 3, CAST(100000 AS Decimal(18, 0)), 1, 0, 2)
GO
INSERT [dbo].[Orders] ([OrderId], [TicketId], [Status], [CreatedAt], [DeletedAt], [QRCode], [CustomerId], [TotalPrice], [TicketGrowup], [TicketChild], [TourId]) VALUES (3, NULL, 2, CAST(N'2022-12-01T22:39:35.970' AS DateTime), CAST(N'2022-12-01T22:39:42.830' AS DateTime), N'{"AccountId":3,"CustomerName":null,"StatusName":null,"OrderId":0,"TicketId":null,"Status":1,"CreatedAt":"2022-12-01T22:39:35.9693994+07:00","DeletedAt":null,"QRCode":null,"CustomerId":null,"TotalPrice":null,"TicketGrowup":1,"TicketChild":null,"TourId":2}', 3, CAST(100000 AS Decimal(18, 0)), 1, 0, 2)
GO
INSERT [dbo].[Orders] ([OrderId], [TicketId], [Status], [CreatedAt], [DeletedAt], [QRCode], [CustomerId], [TotalPrice], [TicketGrowup], [TicketChild], [TourId]) VALUES (4, NULL, 1, CAST(N'2022-12-01T22:43:33.067' AS DateTime), NULL, N'{"AccountId":3,"CustomerName":null,"StatusName":null,"OrderId":0,"TicketId":null,"Status":1,"CreatedAt":"2022-12-01T22:43:33.0650777+07:00","DeletedAt":null,"QRCode":null,"CustomerId":null,"TotalPrice":null,"TicketGrowup":null,"TicketChild":1,"TourId":3}', 3, CAST(50000 AS Decimal(18, 0)), 0, 1, 3)
GO
INSERT [dbo].[Orders] ([OrderId], [TicketId], [Status], [CreatedAt], [DeletedAt], [QRCode], [CustomerId], [TotalPrice], [TicketGrowup], [TicketChild], [TourId]) VALUES (5, NULL, 1, CAST(N'2022-12-01T22:44:11.253' AS DateTime), NULL, N'{"AccountId":3,"CustomerName":null,"StatusName":null,"OrderId":0,"TicketId":null,"Status":1,"CreatedAt":"2022-12-01T22:44:10.1610749+07:00","DeletedAt":null,"QRCode":null,"CustomerId":null,"TotalPrice":null,"TicketGrowup":null,"TicketChild":1,"TourId":3}', 3, CAST(50000 AS Decimal(18, 0)), 0, 1, 3)
GO
INSERT [dbo].[Orders] ([OrderId], [TicketId], [Status], [CreatedAt], [DeletedAt], [QRCode], [CustomerId], [TotalPrice], [TicketGrowup], [TicketChild], [TourId]) VALUES (1002, 0, 1, CAST(N'2022-12-05T21:07:08.463' AS DateTime), NULL, N'{ success = true, TicketId =0, OrderId = 0, AccountId = 1}', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [TicketId], [Status], [CreatedAt], [DeletedAt], [QRCode], [CustomerId], [TotalPrice], [TicketGrowup], [TicketChild], [TourId]) VALUES (1003, NULL, 1, CAST(N'2022-12-05T21:19:07.920' AS DateTime), NULL, N'{"AccountId":1,"CustomerName":null,"StatusName":null,"OrderId":0,"TicketId":null,"Status":1,"CreatedAt":"2022-12-05T21:19:07.6176811+07:00","DeletedAt":null,"QRCode":null,"CustomerId":null,"TotalPrice":null,"TicketGrowup":null,"TicketChild":1,"TourId":2}', 1, CAST(3050000 AS Decimal(18, 0)), 0, 1, 2)
GO
INSERT [dbo].[Orders] ([OrderId], [TicketId], [Status], [CreatedAt], [DeletedAt], [QRCode], [CustomerId], [TotalPrice], [TicketGrowup], [TicketChild], [TourId]) VALUES (1004, NULL, 1, CAST(N'2022-12-05T21:19:55.890' AS DateTime), NULL, N'{"AccountId":1,"CustomerName":null,"StatusName":null,"OrderId":0,"TicketId":null,"Status":1,"CreatedAt":"2022-12-05T21:19:55.878519+07:00","DeletedAt":null,"QRCode":null,"CustomerId":null,"TotalPrice":null,"TicketGrowup":null,"TicketChild":1,"TourId":2}', 1, CAST(3050000 AS Decimal(18, 0)), 0, 1, 2)
GO
INSERT [dbo].[Orders] ([OrderId], [TicketId], [Status], [CreatedAt], [DeletedAt], [QRCode], [CustomerId], [TotalPrice], [TicketGrowup], [TicketChild], [TourId]) VALUES (1005, NULL, 2, CAST(N'2022-12-05T21:21:07.780' AS DateTime), CAST(N'2022-12-05T21:22:38.363' AS DateTime), N'{"AccountId":1,"CustomerName":null,"StatusName":null,"OrderId":0,"TicketId":null,"Status":1,"CreatedAt":"2022-12-05T21:21:07.4748738+07:00","DeletedAt":null,"QRCode":null,"CustomerId":null,"TotalPrice":null,"TicketGrowup":null,"TicketChild":1,"TourId":2}', 1, CAST(3050000 AS Decimal(18, 0)), 0, 1, 2)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Ticket] ON 
GO
INSERT [dbo].[Ticket] ([TicketId], [Status], [TicketType], [Price], [TourId]) VALUES (1, NULL, 2, CAST(100000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[Ticket] ([TicketId], [Status], [TicketType], [Price], [TourId]) VALUES (2, NULL, 1, CAST(50000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[Ticket] ([TicketId], [Status], [TicketType], [Price], [TourId]) VALUES (3, NULL, 1, CAST(150000 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[Ticket] ([TicketId], [Status], [TicketType], [Price], [TourId]) VALUES (4, NULL, 2, CAST(300000 AS Decimal(18, 0)), 3)
GO
SET IDENTITY_INSERT [dbo].[Ticket] OFF
GO
SET IDENTITY_INSERT [dbo].[Tour] ON 
GO
INSERT [dbo].[Tour] ([TourId], [TourName], [StartDate], [EndDate], [TourTime], [LocationFrom], [LocationTo], [Price], [Poster], [Descrip], [VehicleId]) VALUES (2, N'DU LỊCH ĐÀ NẴNG', CAST(N'2022-11-01' AS Date), CAST(N'2022-11-03' AS Date), N'3 ngày 2 đêm', N'Hà Nội', N'Đà Nẵng', CAST(3000000 AS Decimal(18, 0)), N'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2022/08/1-2.gif', N'NEW', 1)
GO
INSERT [dbo].[Tour] ([TourId], [TourName], [StartDate], [EndDate], [TourTime], [LocationFrom], [LocationTo], [Price], [Poster], [Descrip], [VehicleId]) VALUES (3, N'DU LỊCH HẠ LONG', CAST(N'2022-11-30' AS Date), CAST(N'2022-12-23' AS Date), N'1 ngày', N'Hà Nội', N'Hạ Long', CAST(10000000 AS Decimal(18, 0)), N'data:image/jpeg;base64,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', N'Có nhân viên phục vụ đồ ăn, đồ uống trong suốt chuyến bay 111. ', 1)
GO
SET IDENTITY_INSERT [dbo].[Tour] OFF
GO
SET IDENTITY_INSERT [dbo].[TourImage] ON 
GO
INSERT [dbo].[TourImage] ([TourImageId], [TourId], [Image]) VALUES (3, 2, N'https://vcdn1-dulich.vnecdn.net/2022/06/01/Hoi-An-VnExpress-5851-16488048-4863-2250-1654057244.jpg?w=0&h=0&q=100&dpr=1&fit=crop&s=Z2ea_f0O7kgGZllKmJF92g')
GO
SET IDENTITY_INSERT [dbo].[TourImage] OFF
GO
SET IDENTITY_INSERT [dbo].[TourSchedule] ON 
GO
INSERT [dbo].[TourSchedule] ([TourScheduleId], [TourScheduleName], [NumDay], [Image], [Descrip], [TourId]) VALUES (4, N'ád', 1, N'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2022/08/1-2.gif', N'123', 2)
GO
INSERT [dbo].[TourSchedule] ([TourScheduleId], [TourScheduleName], [NumDay], [Image], [Descrip], [TourId]) VALUES (5, N'Khám phá Hạ Long BAY', 2, N'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2020/02/vinh-ha-long-1.jpg', N'Đảm bảo giá thấp nhất ưu đãi ngoài giảm giá, giá đặc biệt cho thành viên, coupon giảm liền. Đọc nhận xét từ khách hàng thực tế để biết được sự thật trước khi đặt phòng. 100% nhận xét thực. 63,000 thành phố. Nhiều sự lựa chọn. Không phí đặt phòng. +23 triệu khách hàng.', 2)
GO
SET IDENTITY_INSERT [dbo].[TourSchedule] OFF
GO
SET IDENTITY_INSERT [dbo].[Vehicle] ON 
GO
INSERT [dbo].[Vehicle] ([VehicleId], [VahicleName], [VehicleCode], [Status], [Slot]) VALUES (1, N'BOING747', N'MB1', 1, 21)
GO
SET IDENTITY_INSERT [dbo].[Vehicle] OFF
GO
SET IDENTITY_INSERT [dbo].[VoteTour] ON 
GO
INSERT [dbo].[VoteTour] ([VoteTourId], [AccountId], [TourId], [Star], [Comment], [CreatedAt]) VALUES (1, 1, 2, 3, N'Tour dat qua', CAST(N'2022-12-05T20:55:48.557' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[VoteTour] OFF
GO
