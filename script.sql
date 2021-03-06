USE [facturacion]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 08/05/2020 13:59:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[age] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 08/05/2020 13:59:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NULL,
	[id_customer] [int] NULL,
	[date_order] [date] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 08/05/2020 13:59:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](100) NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 08/05/2020 13:59:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NULL,
	[stock] [int] NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([id], [name], [age]) VALUES (4, N'ALVARO', 34)
INSERT [dbo].[Customer] ([id], [name], [age]) VALUES (5, N'JOSE', 22)
INSERT [dbo].[Customer] ([id], [name], [age]) VALUES (6, N'MARIA', 23)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [id_product], [id_customer], [date_order], [quantity]) VALUES (5, 1, 4, CAST(N'2000-01-10' AS Date), 2)
INSERT [dbo].[Order] ([id], [id_product], [id_customer], [date_order], [quantity]) VALUES (6, 2, 5, CAST(N'2000-03-10' AS Date), 5)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [product_name], [price]) VALUES (1, N'MANZANAS', 3000)
INSERT [dbo].[Products] ([id], [product_name], [price]) VALUES (2, N'PERAS', 5000)
INSERT [dbo].[Products] ([id], [product_name], [price]) VALUES (3, N'PIÑAS', 3400)
INSERT [dbo].[Products] ([id], [product_name], [price]) VALUES (4, N'LIMONES', 2000)
INSERT [dbo].[Products] ([id], [product_name], [price]) VALUES (5, N'TOMATES', 1000)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Stock] ON 

INSERT [dbo].[Stock] ([id], [id_product], [stock]) VALUES (1, 1, 10)
INSERT [dbo].[Stock] ([id], [id_product], [stock]) VALUES (2, 2, 5)
INSERT [dbo].[Stock] ([id], [id_product], [stock]) VALUES (3, 3, 5)
INSERT [dbo].[Stock] ([id], [id_product], [stock]) VALUES (4, 4, 9)
INSERT [dbo].[Stock] ([id], [id_product], [stock]) VALUES (5, 5, 8)
SET IDENTITY_INSERT [dbo].[Stock] OFF
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([id_customer])
REFERENCES [dbo].[Customer] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Products] FOREIGN KEY([id_product])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Products]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Products] FOREIGN KEY([id_product])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Products]
GO
