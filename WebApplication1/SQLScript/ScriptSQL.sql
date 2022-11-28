USE [TicketTour]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/28/2022 9:57:52 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 11/28/2022 9:57:52 PM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 11/28/2022 9:57:52 PM ******/
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
/****** Object:  Table [dbo].[Hotel]    Script Date: 11/28/2022 9:57:52 PM ******/
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
/****** Object:  Table [dbo].[Location]    Script Date: 11/28/2022 9:57:52 PM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 11/28/2022 9:57:52 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 11/28/2022 9:57:52 PM ******/
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
/****** Object:  Table [dbo].[Ticket]    Script Date: 11/28/2022 9:57:52 PM ******/
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
/****** Object:  Table [dbo].[Tour]    Script Date: 11/28/2022 9:57:52 PM ******/
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
/****** Object:  Table [dbo].[TourImage]    Script Date: 11/28/2022 9:57:52 PM ******/
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
/****** Object:  Table [dbo].[TourSchedule]    Script Date: 11/28/2022 9:57:52 PM ******/
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
/****** Object:  Table [dbo].[TourStaff]    Script Date: 11/28/2022 9:57:52 PM ******/
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
/****** Object:  Table [dbo].[Vehicle]    Script Date: 11/28/2022 9:57:52 PM ******/
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
SET IDENTITY_INSERT [dbo].[Account] ON 
GO
INSERT [dbo].[Account] ([AccountId], [UserName], [Password], [Email], [Phone], [AccountType], [Admin], [Active], [Balance]) VALUES (1, N'tiennn', N'123', N'admin@novaon.vn', N'0123', 2, 0, 1, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[Account] ([AccountId], [UserName], [Password], [Email], [Phone], [AccountType], [Admin], [Active], [Balance]) VALUES (2, N'test1', N'123', N'test@gmail.com', N'12345', 2, 0, 1, CAST(0 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [DOB], [PassPortCode], [Gender], [Address], [AccountId]) VALUES (1, N'Nguyễn Ngọc Tiến', CAST(N'2022-11-09' AS Date), N'123', NULL, N'1234', 1)
GO
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [DOB], [PassPortCode], [Gender], [Address], [AccountId]) VALUES (2, N'Nguyễn Ngọc Tiến', CAST(N'2022-11-01' AS Date), N'123', NULL, N'HA NOI', 2)
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
SET IDENTITY_INSERT [dbo].[Ticket] ON 
GO
INSERT [dbo].[Ticket] ([TicketId], [Status], [TicketType], [Price], [TourId]) VALUES (1, NULL, 2, CAST(20000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[Ticket] ([TicketId], [Status], [TicketType], [Price], [TourId]) VALUES (2, NULL, 1, CAST(3000000 AS Decimal(18, 0)), 2)
GO
SET IDENTITY_INSERT [dbo].[Ticket] OFF
GO
SET IDENTITY_INSERT [dbo].[Tour] ON 
GO
INSERT [dbo].[Tour] ([TourId], [TourName], [StartDate], [EndDate], [TourTime], [LocationFrom], [LocationTo], [Price], [Poster], [Descrip], [VehicleId]) VALUES (2, N'DU LỊCH ĐÀ NẴNG', CAST(N'2022-11-01' AS Date), CAST(N'2022-11-03' AS Date), N'3 ngày 2 đêm', N'Hà Nội', N'Đà Nẵng', CAST(3000000 AS Decimal(18, 0)), N'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2022/08/1-2.gif', N'NEW', 1)
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
