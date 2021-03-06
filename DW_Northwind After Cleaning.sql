USE [DW_Northwind]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 04/07/2022 11:34:52 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [nchar](15) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[City] [nvarchar](15) NOT NULL,
	[Country] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 04/07/2022 11:34:52 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] NOT NULL,
	[FirstName] [nvarchar](10) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[Reports] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 04/07/2022 11:34:52 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ProductID] [int] NOT NULL,
	[CustomerID] [nchar](15) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
	[TimeID] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Amount] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 04/07/2022 11:34:52 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[Category] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products_Clean]    Script Date: 04/07/2022 11:34:52 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_Clean](
	[ProductID] [int] NULL,
	[ProductName] [nvarchar](max) NULL,
	[Category] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 04/07/2022 11:34:52 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[Country] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Time]    Script Date: 04/07/2022 11:34:52 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Time](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [varchar](20) NOT NULL,
	[Day] [int] NOT NULL,
 CONSTRAINT [PK_Time] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Suppliers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Time] FOREIGN KEY([TimeID])
REFERENCES [dbo].[Time] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Time]
GO

-- DATOS EN LA TABLA ORIGINAL DE 'PRODUCTS'
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (1, N'Chai', N'Beverages')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (2, N'Chang', N'Beverages')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (3, N'Aniseed Syrup', N'Condiments')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (4, N'Chef Anton''s Cajun Seasoning', N'Condiments')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (5, N'Chef Anton''s Gumbo Mix', N'Condiments')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (6, N'Grandma''s Boysenberry Spread', N'Condiments')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (7, N'Uncle Bob''s Organic Dried Pears', N'Produce')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (8, N'Northwoods Cranberry Sauce', N'Condiments')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (9, N'Mishi Kobe Niku', N'Meat/Poultry')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (10, N'Ikura', N'Seafood')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (11, N'Queso Cabrales', N'Dairy Products')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (12, N'Queso Manchego La Pastora', N'Dairy Products')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (13, N'Konbu', N'Seafood')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (14, N'Tofu', N'Produce')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (15, N'Genen Shouyu', N'Condiments')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (16, N'Pavlova', N'Confections')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (17, N'Alice Mutton', N'Meat/Poultry')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (18, N'Carnarvon Tigers', N'Seafood')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (19, N'Teatime Chocolate Biscuits', N'Confections')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (20, N'Sir Rodney''s Marmalade', N'Confections')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (21, N'Sir Rodney''s Scones', N'Confections')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (22, N'Gustaf''s Knäckebröd', N'Grains/Cereals')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (23, N'Tunnbröd', N'Grains/Cereals')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (24, N'Guaraná Fantástica', N'Beverages')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (25, N'NuNuCa Nuß-Nougat-Creme', N'Confections')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (26, N'Gumbär Gummibärchen', N'Confections')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (27, N'Schoggi Schokolade', N'Confections')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (28, N'Rössle Sauerkraut', N'Produce')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (29, N'Thüringer Rostbratwurst', N'Meat/Poultry')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (30, N'Nord-Ost Matjeshering', N'Seafood')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (31, N'Gorgonzola Telino', N'Dairy Products')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (32, N'Mascarpone Fabioli', N'Dairy Products')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (33, N'Geitost', N'Dairy Products')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (34, N'Sasquatch Ale', N'Beverages')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (35, N'Steeleye Stout', N'Beverages')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (36, N'Inlagd Sill', N'Seafood')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (37, N'Gravad lax', N'Seafood')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (38, N'Côte de Blaye', N'Beverages')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (39, N'Chartreuse verte', N'Beverages')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (40, N'Boston Crab Meat', N'Seafood')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (41, N'Jack''s New England Clam Chowder', N'Seafood')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (42, N'Singaporean Hokkien Fried Mee', N'Grains/Cereals')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (43, N'Ipoh Coffee', N'Beverages')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (44, N'Gula Malacca', N'Condiments')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (45, N'Rogede sild', N'Seafood')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (46, N'Spegesild', N'Seafood')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (47, N'Zaanse koeken', N'Confections')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (48, N'Chocolade', N'Confections')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (49, N'Maxilaku', N'Confections')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (50, N'Valkoinen suklaa', N'Confections')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (51, N'Manjimup Dried Apples', N'Produce')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (52, N'Filo Mix', N'Grains/Cereals')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (53, N'Perth Pasties', N'Meat/Poultry')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (54, N'Tourtière', N'Meat/Poultry')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (55, N'Pâté chinois', N'Meat/Poultry')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (56, N'Gnocchi di nonna Alice', N'Grains/Cereals')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (57, N'Ravioli Angelo', N'Grains/Cereals')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (58, N'Escargots de Bourgogne', N'Seafood')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (59, N'Raclette Courdavault', N'Dairy Products')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (60, N'Camembert Pierrot', N'Dairy Products')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (61, N'Sirop d''érable', N'Condiments')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (62, N'Tarte au sucre', N'Confections')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (63, N'Vegie-spread', N'Condiments')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (64, N'Wimmers gute Semmelknödel', N'Grains/Cereals')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (65, N'Louisiana Fiery Hot Pepper Sauce', N'Condiments')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (66, N'Louisiana Hot Spiced Okra', N'Condiments')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (67, N'Laughing Lumberjack Lager', N'Beverages')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (68, N'Scottish Longbreads', N'Confections')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (69, N'Gudbrandsdalsost', N'Dairy Products')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (70, N'Outback Lager', N'Beverages')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (71, N'Flotemysost', N'Dairy Products')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (72, N'Mozzarella di Giovanni', N'Dairy Products')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (73, N'Röd Kaviar', N'Seafood')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (74, N'Longlife Tofu', N'Produce')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (75, N'Rhönbräu Klosterbier', N'Beverages')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (76, N'Lakkalikööri', N'Beverages')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (77, N'Original Frankfurter grüne Soße', N'Condiments')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (78, N'Changg', N'Beverages')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (79, N'Chaang', N'Beverages')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (80, N'Outback Logarr', N'Beverages')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (81, N'Kanbu', N'Seafood')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category]) VALUES (82, N'', N'Dairy Products')

-- DATOS EXPORTADOS 'PRODUCTS_CLEAN'
GO
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (1, N'Chang', N'Beverages')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (2, N'Chang', N'Beverages')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (3, N'Aniseed Syrup', N'Condiments')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (4, N'Chef Anton''s Cajun Seasoning', N'Condiments')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (5, N'Chef Anton''s Gumbo Mix', N'Condiments')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (6, N'Grandma''s Boysenberry Spread', N'Condiments')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (7, N'Uncle Bob''s Organic Dried Pears', N'Produce')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (8, N'Northwoods Cranberry Sauce', N'Condiments')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (9, N'Mishi Kobe Niku', N'Meat/Poultry')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (10, N'Ikura', N'Seafood')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (11, N'Queso Cabrales', N'Dairy Products')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (12, N'Queso Manchego La Pastora', N'Dairy Products')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (13, N'Konbu', N'Seafood')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (14, N'Tofu', N'Produce')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (15, N'Genen Shouyu', N'Condiments')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (16, N'Pavlova', N'Confections')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (17, N'Alice Mutton', N'Meat/Poultry')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (18, N'Carnarvon Tigers', N'Seafood')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (19, N'Teatime Chocolate Biscuits', N'Confections')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (20, N'Sir Rodney''s Marmalade', N'Confections')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (21, N'Sir Rodney''s Scones', N'Confections')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (22, N'Gustaf''s Knäckebröd', N'Grains/Cereals')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (23, N'Tunnbröd', N'Grains/Cereals')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (24, N'Guaraná Fantástica', N'Beverages')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (25, N'NuNuCa Nuß-Nougat-Creme', N'Confections')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (26, N'Gumbär Gummibärchen', N'Confections')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (27, N'Schoggi Schokolade', N'Confections')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (28, N'Rössle Sauerkraut', N'Produce')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (29, N'Thüringer Rostbratwurst', N'Meat/Poultry')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (30, N'Nord-Ost Matjeshering', N'Seafood')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (31, N'Gorgonzola Telino', N'Dairy Products')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (32, N'Mascarpone Fabioli', N'Dairy Products')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (33, N'Geitost', N'Dairy Products')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (34, N'Sasquatch Ale', N'Beverages')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (35, N'Steeleye Stout', N'Beverages')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (36, N'Inlagd Sill', N'Seafood')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (37, N'Gravad lax', N'Seafood')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (38, N'Côte de Blaye', N'Beverages')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (39, N'Chartreuse verte', N'Beverages')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (40, N'Boston Crab Meat', N'Seafood')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (41, N'Jack''s New England Clam Chowder', N'Seafood')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (42, N'Singaporean Hokkien Fried Mee', N'Grains/Cereals')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (43, N'Ipoh Coffee', N'Beverages')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (44, N'Gula Malacca', N'Condiments')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (45, N'Rogede sild', N'Seafood')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (46, N'Spegesild', N'Seafood')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (47, N'Zaanse koeken', N'Confections')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (48, N'Chocolade', N'Confections')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (49, N'Maxilaku', N'Confections')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (50, N'Valkoinen suklaa', N'Confections')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (51, N'Manjimup Dried Apples', N'Produce')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (52, N'Filo Mix', N'Grains/Cereals')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (53, N'Perth Pasties', N'Meat/Poultry')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (54, N'Tourtière', N'Meat/Poultry')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (55, N'Pâté chinois', N'Meat/Poultry')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (56, N'Gnocchi di nonna Alice', N'Grains/Cereals')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (57, N'Ravioli Angelo', N'Grains/Cereals')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (58, N'Escargots de Bourgogne', N'Seafood')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (59, N'Raclette Courdavault', N'Dairy Products')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (60, N'Camembert Pierrot', N'Dairy Products')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (61, N'Sirop d''érable', N'Condiments')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (62, N'Tarte au sucre', N'Confections')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (63, N'Vegie-spread', N'Condiments')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (64, N'Wimmers gute Semmelknödel', N'Grains/Cereals')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (65, N'Louisiana Fiery Hot Pepper Sauce', N'Condiments')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (66, N'Louisiana Hot Spiced Okra', N'Condiments')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (67, N'Outback Lager', N'Beverages')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (68, N'Scottish Longbreads', N'Confections')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (69, N'Gudbrandsdalsost', N'Dairy Products')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (70, N'Outback Lager', N'Beverages')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (71, N'Flotemysost', N'Dairy Products')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (72, N'Mozzarella di Giovanni', N'Dairy Products')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (73, N'Röd Kaviar', N'Seafood')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (74, N'Longlife Tofu', N'Produce')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (75, N'Rhönbräu Klosterbier', N'Beverages')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (76, N'Lakkalikööri', N'Beverages')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (77, N'Original Frankfurter grüne Soße', N'Condiments')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (78, N'Chang', N'Beverages')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (79, N'Chang', N'Beverages')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (80, N'Outback Lager', N'Beverages')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (81, N'Konbu', N'Seafood')
INSERT [dbo].[Products_Clean] ([ProductID], [ProductName], [Category]) VALUES (82, NULL, N'Dairy Products')
GO

