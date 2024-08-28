USE [master]
GO
/****** Object:  Database [Enduro]    Script Date: 26/08/2024 20:35:28 ******/
CREATE DATABASE [Enduro]
 CONTAINMENT = NONE
 ON  PRIMARY
( NAME = N'Enduro', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Enduro.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON
( NAME = N'Enduro_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Enduro_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Enduro] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Enduro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Enduro] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Enduro] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Enduro] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Enduro] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Enduro] SET ARITHABORT OFF
GO
ALTER DATABASE [Enduro] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Enduro] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Enduro] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Enduro] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Enduro] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Enduro] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Enduro] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Enduro] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Enduro] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Enduro] SET  DISABLE_BROKER
GO
ALTER DATABASE [Enduro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Enduro] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Enduro] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Enduro] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Enduro] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Enduro] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Enduro] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Enduro] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Enduro] SET  MULTI_USER
GO
ALTER DATABASE [Enduro] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Enduro] SET DB_CHAINING OFF
GO
ALTER DATABASE [Enduro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO
ALTER DATABASE [Enduro] SET TARGET_RECOVERY_TIME = 60 SECONDS
GO
ALTER DATABASE [Enduro] SET DELAYED_DURABILITY = DISABLED
GO
ALTER DATABASE [Enduro] SET ACCELERATED_DATABASE_RECOVERY = OFF
GO
ALTER DATABASE [Enduro] SET QUERY_STORE = ON
GO
ALTER DATABASE [Enduro] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Enduro]
GO
/****** Object:  Table [dbo].[BibColors]    Script Date: 26/08/2024 20:35:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BibColors](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Label] [nvarchar](255) NOT NULL,
    [BackgroundColor] [nvarchar](255) NOT NULL,
    [TextColor] [nvarchar](255) NOT NULL,
    CONSTRAINT [PK_BibColors] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Bibs]    Script Date: 26/08/2024 20:35:28 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Bibs](
    [Number] [int] NOT NULL,
    [IdColor] [int] NOT NULL,
    [IdDriver] [int] NULL,
     CONSTRAINT [PK_Bibs] PRIMARY KEY CLUSTERED
    (
[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Countries]    Script Date: 26/08/2024 20:35:28 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Countries](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [NAME] [char](100) NOT NULL,
    [ISO] [char](2) NOT NULL,
    PRIMARY KEY CLUSTERED
(
[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Drivers]    Script Date: 26/08/2024 20:35:28 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Drivers](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](255) NOT NULL,
    [Surname] [nvarchar](255) NOT NULL,
    [Birthdate] [datetime2](7) NULL,
    [IdCountry] [int] NULL,
    [PostalCode] [nvarchar](255) NULL,
    [City] [nvarchar](255) NULL,
    [Number] [nvarchar](255) NULL,
    [Street] [nvarchar](255) NULL,
    [Payed] [bit] NOT NULL,
    [DepositReturned] [bit] NOT NULL,
    CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Vehicules]    Script Date: 26/08/2024 20:35:28 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Vehicules](
    [Plate] [nvarchar](255) NOT NULL,
    [IdType] [int] NOT NULL,
    [TicketNumber] [int] NOT NULL,
    [IdDriver] [int] NOT NULL,
    CONSTRAINT [PK_Vehicule] PRIMARY KEY CLUSTERED
(
[Plate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[VehiculeTypes]    Script Date: 26/08/2024 20:35:28 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[VehiculeTypes](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Label] [nvarchar](255) NOT NULL,
    [Price] [decimal](10, 2) NOT NULL,
    CONSTRAINT [PK_VehiculeType] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
    SET IDENTITY_INSERT [dbo].[BibColors] ON
    GO
    INSERT [dbo].[BibColors] ([Id], [Label], [BackgroundColor], [TextColor]) VALUES (1, N'Bleu avec texte en blanc', N'blue', N'white')
    GO
    INSERT [dbo].[BibColors] ([Id], [Label], [BackgroundColor], [TextColor]) VALUES (2, N'Vert avec texte en noir', N'green', N'black')
    GO
    INSERT [dbo].[BibColors] ([Id], [Label], [BackgroundColor], [TextColor]) VALUES (3, N'Bleu avec texte en noir', N'blue', N'black')
    GO
    INSERT [dbo].[BibColors] ([Id], [Label], [BackgroundColor], [TextColor]) VALUES (4, N'Vert avec text en blanc', N'green', N'white')
    GO
    SET IDENTITY_INSERT [dbo].[BibColors] OFF
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (1, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (2, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (3, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (4, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (5, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (6, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (7, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (8, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (9, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (10, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (11, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (12, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (13, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (14, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (15, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (16, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (17, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (18, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (19, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (20, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (21, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (22, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (23, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (24, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (25, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (26, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (27, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (28, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (29, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (30, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (31, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (32, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (33, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (34, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (35, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (36, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (37, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (38, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (39, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (40, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (41, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (42, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (43, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (44, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (45, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (46, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (47, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (48, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (49, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (50, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (51, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (52, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (53, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (54, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (55, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (56, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (57, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (58, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (59, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (60, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (61, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (62, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (63, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (64, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (65, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (66, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (67, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (68, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (69, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (70, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (71, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (72, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (73, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (74, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (75, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (76, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (77, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (78, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (79, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (80, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (81, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (82, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (83, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (84, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (85, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (86, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (87, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (88, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (89, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (90, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (91, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (92, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (93, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (94, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (95, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (96, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (97, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (98, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (99, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (100, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (101, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (102, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (103, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (104, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (105, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (106, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (107, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (108, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (109, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (110, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (111, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (112, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (113, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (114, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (115, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (116, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (117, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (118, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (119, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (120, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (121, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (122, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (123, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (124, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (125, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (126, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (127, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (128, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (129, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (130, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (131, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (132, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (133, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (134, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (135, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (136, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (137, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (138, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (139, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (140, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (141, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (142, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (143, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (144, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (145, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (146, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (147, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (148, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (149, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (150, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (151, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (152, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (153, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (154, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (155, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (156, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (157, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (158, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (159, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (160, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (161, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (162, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (163, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (164, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (165, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (166, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (167, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (168, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (169, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (170, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (171, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (172, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (173, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (174, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (175, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (176, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (177, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (178, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (179, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (180, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (181, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (182, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (183, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (184, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (185, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (186, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (187, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (188, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (189, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (190, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (191, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (192, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (193, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (194, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (195, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (196, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (197, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (198, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (199, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (200, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (201, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (202, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (203, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (204, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (205, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (206, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (207, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (208, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (209, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (210, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (211, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (212, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (213, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (214, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (215, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (216, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (217, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (218, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (219, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (220, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (221, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (222, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (223, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (224, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (225, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (226, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (227, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (228, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (229, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (230, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (231, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (232, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (233, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (234, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (235, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (236, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (237, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (238, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (239, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (240, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (241, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (242, 2, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (243, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (244, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (245, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (246, 3, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (247, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (248, 1, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (249, 4, NULL)
    GO
    INSERT [dbo].[Bibs] ([Number], [IdColor], [IdDriver]) VALUES (250, 3, NULL)
    GO
    SET IDENTITY_INSERT [dbo].[Countries] ON
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (1, N'Afghanistan                                                                                         ', N'AF')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (2, N'Albania                                                                                             ', N'AL')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (3, N'Algeria                                                                                             ', N'DZ')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (4, N'American Samoa                                                                                      ', N'AS')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (5, N'Andorra                                                                                             ', N'AD')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (6, N'Angola                                                                                              ', N'AO')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (7, N'Anguilla                                                                                            ', N'AI')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (8, N'Antarctica                                                                                          ', N'AQ')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (9, N'Antigua and Barbuda                                                                                 ', N'AG')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (10, N'Argentina                                                                                           ', N'AR')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (11, N'Armenia                                                                                             ', N'AM')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (12, N'Aruba                                                                                               ', N'AW')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (13, N'Australia                                                                                           ', N'AU')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (14, N'Austria                                                                                             ', N'AT')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (15, N'Azerbaijan                                                                                          ', N'AZ')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (16, N'Bahamas                                                                                             ', N'BS')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (17, N'Bahrain                                                                                             ', N'BH')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (18, N'Bangladesh                                                                                          ', N'BD')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (19, N'Barbados                                                                                            ', N'BB')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (20, N'Belarus                                                                                             ', N'BY')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (21, N'Belgium                                                                                             ', N'BE')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (22, N'Belize                                                                                              ', N'BZ')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (23, N'Benin                                                                                               ', N'BJ')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (24, N'Bermuda                                                                                             ', N'BM')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (25, N'Bhutan                                                                                              ', N'BT')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (26, N'Bosnia and Herzegovina                                                                              ', N'BA')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (27, N'Botswana                                                                                            ', N'BW')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (28, N'Bouvet Island                                                                                       ', N'BV')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (29, N'Brazil                                                                                              ', N'BR')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (30, N'British Indian Ocean Territory                                                                      ', N'IO')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (31, N'Brunei Darussalam                                                                                   ', N'BN')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (32, N'Bulgaria                                                                                            ', N'BG')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (33, N'Burkina Faso                                                                                        ', N'BF')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (34, N'Burundi                                                                                             ', N'BI')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (35, N'Cambodia                                                                                            ', N'KH')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (36, N'Cameroon                                                                                            ', N'CM')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (37, N'Canada                                                                                              ', N'CA')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (38, N'Cape Verde                                                                                          ', N'CV')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (39, N'Cayman Islands                                                                                      ', N'KY')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (40, N'Central African Republic                                                                            ', N'CF')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (41, N'Chad                                                                                                ', N'TD')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (42, N'Chile                                                                                               ', N'CL')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (43, N'China                                                                                               ', N'CN')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (44, N'Christmas Island                                                                                    ', N'CX')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (45, N'Cocos (Keeling) Islands                                                                             ', N'CC')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (46, N'Colombia                                                                                            ', N'CO')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (47, N'Comoros                                                                                             ', N'KM')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (48, N'Congo                                                                                               ', N'CG')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (49, N'Cook Islands                                                                                        ', N'CK')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (50, N'Costa Rica                                                                                          ', N'CR')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (51, N'Croatia                                                                                             ', N'HR')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (52, N'Cuba                                                                                                ', N'CU')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (53, N'Cyprus                                                                                              ', N'CY')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (54, N'Czech Republic                                                                                      ', N'CZ')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (55, N'Denmark                                                                                             ', N'DK')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (56, N'Djibouti                                                                                            ', N'DJ')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (57, N'Dominica                                                                                            ', N'DM')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (58, N'Dominican Republic                                                                                  ', N'DO')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (59, N'Ecuador                                                                                             ', N'EC')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (60, N'Egypt                                                                                               ', N'EG')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (61, N'El Salvador                                                                                         ', N'SV')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (62, N'Equatorial Guinea                                                                                   ', N'GQ')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (63, N'Eritrea                                                                                             ', N'ER')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (64, N'Estonia                                                                                             ', N'EE')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (65, N'Ethiopia                                                                                            ', N'ET')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (66, N'Falkland Islands (Malvinas)                                                                         ', N'FK')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (67, N'Faroe Islands                                                                                       ', N'FO')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (68, N'Fiji                                                                                                ', N'FJ')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (69, N'Finland                                                                                             ', N'FI')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (70, N'France                                                                                              ', N'FR')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (71, N'French Guiana                                                                                       ', N'GF')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (72, N'French Polynesia                                                                                    ', N'PF')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (73, N'French Southern Territories                                                                         ', N'TF')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (74, N'Gabon                                                                                               ', N'GA')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (75, N'Gambia                                                                                              ', N'GM')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (76, N'Georgia                                                                                             ', N'GE')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (77, N'Germany                                                                                             ', N'DE')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (78, N'Ghana                                                                                               ', N'GH')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (79, N'Gibraltar                                                                                           ', N'GI')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (80, N'Greece                                                                                              ', N'GR')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (81, N'Greenland                                                                                           ', N'GL')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (82, N'Grenada                                                                                             ', N'GD')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (83, N'Guadeloupe                                                                                          ', N'GP')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (84, N'Guam                                                                                                ', N'GU')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (85, N'Guatemala                                                                                           ', N'GT')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (86, N'Guernsey                                                                                            ', N'GG')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (87, N'Guinea                                                                                              ', N'GN')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (88, N'Guinea-Bissau                                                                                       ', N'GW')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (89, N'Guyana                                                                                              ', N'GY')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (90, N'Haiti                                                                                               ', N'HT')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (91, N'Heard Island and McDonald Islands                                                                   ', N'HM')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (92, N'Holy See (Vatican City State)                                                                       ', N'VA')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (93, N'Honduras                                                                                            ', N'HN')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (94, N'Hong Kong                                                                                           ', N'HK')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (95, N'Hungary                                                                                             ', N'HU')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (96, N'Iceland                                                                                             ', N'IS')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (97, N'India                                                                                               ', N'IN')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (98, N'Indonesia                                                                                           ', N'ID')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (99, N'Iran                                                                                                ', N'IR')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (100, N'Iraq                                                                                                ', N'IQ')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (101, N'Ireland                                                                                             ', N'IE')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (102, N'Isle of Man                                                                                         ', N'IM')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (103, N'Israel                                                                                              ', N'IL')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (104, N'Italy                                                                                               ', N'IT')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (105, N'Jamaica                                                                                             ', N'JM')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (106, N'Japan                                                                                               ', N'JP')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (107, N'Jersey                                                                                              ', N'JE')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (108, N'Jordan                                                                                              ', N'JO')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (109, N'Kazakhstan                                                                                          ', N'KZ')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (110, N'Kenya                                                                                               ', N'KE')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (111, N'Kiribati                                                                                            ', N'KI')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (112, N'Kuwait                                                                                              ', N'KW')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (113, N'Kyrgyzstan                                                                                          ', N'KG')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (114, N'Lao Peoples Democratic Republic                                                                     ', N'LA')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (115, N'Latvia                                                                                              ', N'LV')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (116, N'Lebanon                                                                                             ', N'LB')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (117, N'Lesotho                                                                                             ', N'LS')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (118, N'Liberia                                                                                             ', N'LR')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (119, N'Libya                                                                                               ', N'LY')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (120, N'Liechtenstein                                                                                       ', N'LI')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (121, N'Lithuania                                                                                           ', N'LT')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (122, N'Luxembourg                                                                                          ', N'LU')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (123, N'Macao                                                                                               ', N'MO')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (124, N'Madagascar                                                                                          ', N'MG')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (125, N'Malawi                                                                                              ', N'MW')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (126, N'Malaysia                                                                                            ', N'MY')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (127, N'Maldives                                                                                            ', N'MV')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (128, N'Mali                                                                                                ', N'ML')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (129, N'Malta                                                                                               ', N'MT')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (130, N'Marshall Islands                                                                                    ', N'MH')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (131, N'Martinique                                                                                          ', N'MQ')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (132, N'Mauritania                                                                                          ', N'MR')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (133, N'Mauritius                                                                                           ', N'MU')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (134, N'Mayotte                                                                                             ', N'YT')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (135, N'Mexico                                                                                              ', N'MX')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (136, N'Monaco                                                                                              ', N'MC')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (137, N'Mongolia                                                                                            ', N'MN')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (138, N'Montenegro                                                                                          ', N'ME')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (139, N'Montserrat                                                                                          ', N'MS')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (140, N'Morocco                                                                                             ', N'MA')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (141, N'Mozambique                                                                                          ', N'MZ')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (142, N'Myanmar                                                                                             ', N'MM')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (143, N'Namibia                                                                                             ', N'NA')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (144, N'Nauru                                                                                               ', N'NR')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (145, N'Nepal                                                                                               ', N'NP')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (146, N'Netherlands                                                                                         ', N'NL')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (147, N'New Caledonia                                                                                       ', N'NC')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (148, N'New Zealand                                                                                         ', N'NZ')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (149, N'Nicaragua                                                                                           ', N'NI')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (150, N'Niger                                                                                               ', N'NE')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (151, N'Nigeria                                                                                             ', N'NG')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (152, N'Niue                                                                                                ', N'NU')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (153, N'Norfolk Island                                                                                      ', N'NF')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (154, N'Northern Mariana Islands                                                                            ', N'MP')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (155, N'Norway                                                                                              ', N'NO')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (156, N'Oman                                                                                                ', N'OM')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (157, N'Pakistan                                                                                            ', N'PK')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (158, N'Palau                                                                                               ', N'PW')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (159, N'Panama                                                                                              ', N'PA')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (160, N'Papua New Guinea                                                                                    ', N'PG')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (161, N'Paraguay                                                                                            ', N'PY')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (162, N'Peru                                                                                                ', N'PE')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (163, N'Philippines                                                                                         ', N'PH')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (164, N'Pitcairn                                                                                            ', N'PN')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (165, N'Poland                                                                                              ', N'PL')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (166, N'Portugal                                                                                            ', N'PT')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (167, N'Puerto Rico                                                                                         ', N'PR')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (168, N'Qatar                                                                                               ', N'QA')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (169, N'Romania                                                                                             ', N'RO')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (170, N'Russian Federation                                                                                  ', N'RU')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (171, N'Rwanda                                                                                              ', N'RW')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (172, N'Saint Kitts and Nevis                                                                               ', N'KN')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (173, N'Saint Lucia                                                                                         ', N'LC')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (174, N'Saint Martin (French part)                                                                          ', N'MF')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (175, N'Saint Pierre and Miquelon                                                                           ', N'PM')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (176, N'Saint Vincent and the Grenadines                                                                    ', N'VC')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (177, N'Samoa                                                                                               ', N'WS')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (178, N'San Marino                                                                                          ', N'SM')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (179, N'Sao Tome and Principe                                                                               ', N'ST')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (180, N'Saudi Arabia                                                                                        ', N'SA')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (181, N'Senegal                                                                                             ', N'SN')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (182, N'Serbia                                                                                              ', N'RS')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (183, N'Seychelles                                                                                          ', N'SC')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (184, N'Sierra Leone                                                                                        ', N'SL')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (185, N'Singapore                                                                                           ', N'SG')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (186, N'Sint Maarten (Dutch part)                                                                           ', N'SX')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (187, N'Slovakia                                                                                            ', N'SK')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (188, N'Slovenia                                                                                            ', N'SI')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (189, N'Solomon Islands                                                                                     ', N'SB')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (190, N'Somalia                                                                                             ', N'SO')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (191, N'South Africa                                                                                        ', N'ZA')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (192, N'South Georgia and the South Sandwich Islands                                                        ', N'GS')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (193, N'South Sudan                                                                                         ', N'SS')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (194, N'Spain                                                                                               ', N'ES')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (195, N'Sri Lanka                                                                                           ', N'LK')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (196, N'State of Palestine                                                                                  ', N'PS')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (197, N'Sudan                                                                                               ', N'SD')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (198, N'Suriname                                                                                            ', N'SR')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (199, N'Svalbard and Jan Mayen                                                                              ', N'SJ')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (200, N'Swaziland                                                                                           ', N'SZ')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (201, N'Sweden                                                                                              ', N'SE')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (202, N'Switzerland                                                                                         ', N'CH')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (203, N'Syrian Arab Republic                                                                                ', N'SY')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (204, N'Tajikistan                                                                                          ', N'TJ')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (205, N'Thailand                                                                                            ', N'TH')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (206, N'Timor-Leste                                                                                         ', N'TL')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (207, N'Togo                                                                                                ', N'TG')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (208, N'Tokelau                                                                                             ', N'TK')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (209, N'Tonga                                                                                               ', N'TO')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (210, N'Trinidad and Tobago                                                                                 ', N'TT')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (211, N'Tunisia                                                                                             ', N'TN')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (212, N'Turkey                                                                                              ', N'TR')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (213, N'Turkmenistan                                                                                        ', N'TM')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (214, N'Turks and Caicos Islands                                                                            ', N'TC')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (215, N'Tuvalu                                                                                              ', N'TV')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (216, N'Uganda                                                                                              ', N'UG')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (217, N'Ukraine                                                                                             ', N'UA')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (218, N'United Arab Emirates                                                                                ', N'AE')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (219, N'United Kingdom                                                                                      ', N'GB')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (220, N'United States                                                                                       ', N'US')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (221, N'United States Minor Outlying Islands                                                                ', N'UM')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (222, N'Uruguay                                                                                             ', N'UY')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (223, N'Uzbekistan                                                                                          ', N'UZ')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (224, N'Vanuatu                                                                                             ', N'VU')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (225, N'Viet Nam                                                                                            ', N'VN')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (226, N'Wallis and Futuna                                                                                   ', N'WF')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (227, N'Western Sahara                                                                                      ', N'EH')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (228, N'Yemen                                                                                               ', N'YE')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (229, N'Zambia                                                                                              ', N'ZM')
    GO
    INSERT [dbo].[Countries] ([ID], [NAME], [ISO]) VALUES (230, N'Zimbabwe                                                                                            ', N'ZW')
    GO
    SET IDENTITY_INSERT [dbo].[Countries] OFF
    GO
    SET IDENTITY_INSERT [dbo].[Drivers] ON
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (1, N'Ricki', N'Pennings', CAST(N'2005-10-07T00:00:00.0000000' AS DateTime2), 12, N'134548', N'Morales', N'04630', N'Grasskamp', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (3, N'Shirline', N'Lamers', CAST(N'1993-05-03T04:21:38.0000000' AS DateTime2), 41, N'6415', N'Prado Siongco', N'1', N'Elmside', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (4, N'Winona', N'Whyley', CAST(N'1989-03-08T13:43:41.0000000' AS DateTime2), 202, NULL, N'Heka', N'66', N'Moland', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (5, N'Kaitlynn', N'Liell', CAST(N'1999-06-17T20:22:56.0000000' AS DateTime2), 162, NULL, N'Diavatá', N'552', N'Garrison', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (6, N'Olav', N'Isacoff', CAST(N'1987-06-16T23:37:53.0000000' AS DateTime2), 204, NULL, N'Zhongdong', N'9608', N'Shopko', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (7, N'Daryle', N'Philp', CAST(N'1976-01-25T16:30:41.0000000' AS DateTime2), 215, NULL, N'Yishui', N'4474', N'Corben', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (8, N'Keven', N'Chesterton', CAST(N'1990-11-08T18:29:23.0000000' AS DateTime2), 87, N'H7V', N'Côte-Saint-Luc', N'141', N'Bluestem', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (9, N'Ilyssa', N'Whetland', CAST(N'1978-09-30T00:36:43.0000000' AS DateTime2), 76, NULL, N'Yingchuan', N'42', N'Rowland', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (10, N'Hedvige', N'Fussie', CAST(N'1988-06-18T13:11:07.0000000' AS DateTime2), 201, N'665220', N'Perfilovo', N'1', N'Shasta', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (11, N'Gusti', N'Cuttelar', CAST(N'1980-02-29T05:47:16.0000000' AS DateTime2), 223, N'46015', N'Valencia', N'93', N'Rowland', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (12, N'Wilburt', N'Luna', CAST(N'1994-04-26T09:12:06.0000000' AS DateTime2), 128, NULL, N'Balungkopi', N'60948', N'Charing Cross', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (13, N'Constantina', N'Blenkharn', CAST(N'1995-12-27T12:12:29.0000000' AS DateTime2), 197, NULL, N'Xiaozhi', N'03465', N'Mesta', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (14, N'Shay', N'Seery', CAST(N'1987-05-20T19:54:07.0000000' AS DateTime2), 177, N'521529', N'La Unión', N'0053', N'Toban', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (15, N'Barrie', N'Faier', CAST(N'1990-05-25T23:56:44.0000000' AS DateTime2), 125, NULL, N'Hefu', N'17490', N'Corscot', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (16, N'Claribel', N'Markel', CAST(N'1972-05-10T15:15:11.0000000' AS DateTime2), 222, NULL, N'Kon Tum', N'56', N'Shelley', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (17, N'Madelin', N'Mintram', CAST(N'1998-06-19T07:19:39.0000000' AS DateTime2), 134, NULL, N'Qiagai', N'9207', N'Sutherland', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (18, N'Myranda', N'Stappard', CAST(N'1994-07-14T22:29:18.0000000' AS DateTime2), 26, NULL, N'Luo’ao', N'96099', N'Brentwood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (19, N'Kit', N'Wingham', CAST(N'1974-08-27T15:41:03.0000000' AS DateTime2), 220, NULL, N'Dongyangzhen', N'3', N'Dwight', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (20, N'Mahala', N'Snalham', CAST(N'1976-02-25T10:42:47.0000000' AS DateTime2), 198, N'357323', N'Nikolayevsk', N'54840', N'Jackson', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (21, N'Cecil', N'Syrad', CAST(N'1991-05-06T01:54:18.0000000' AS DateTime2), 70, N'157460', N'Makar’yev', N'88479', N'Mariners Cove', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (22, N'Malva', N'McClary', CAST(N'1971-11-23T18:13:09.0000000' AS DateTime2), 146, NULL, N'Sittwe', N'0', N'Thackeray', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (23, N'Cedric', N'Maddison', CAST(N'1972-10-10T00:49:54.0000000' AS DateTime2), 92, NULL, N'Chapayevka', N'70675', N'Kipling', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (24, N'Daven', N'Meenehan', CAST(N'1990-03-04T11:55:19.0000000' AS DateTime2), 190, N'186755', N'Temizhbekskaya', N'16066', N'Hansons', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (25, N'Angelle', N'Ruggier', CAST(N'1987-11-14T11:13:37.0000000' AS DateTime2), 147, N'652577', N'Krasnoye', N'3', N'Magdeline', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (26, N'Karly', N'Cattach', CAST(N'1994-12-24T08:36:37.0000000' AS DateTime2), 125, NULL, N'Kyparissía', N'454', N'Acker', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (27, N'Adams', N'Duckerin', CAST(N'1981-02-16T21:50:34.0000000' AS DateTime2), 175, NULL, N'Plagiári', N'5696', N'Eggendart', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (28, N'Shirleen', N'Sermin', CAST(N'1978-09-01T02:55:00.0000000' AS DateTime2), 80, N'14922 CEDEX 9', N'Caen', N'1322', N'Straubel', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (29, N'Adelice', N'Burchatt', CAST(N'1972-06-16T06:00:08.0000000' AS DateTime2), 89, NULL, N'Mrganush', N'1798', N'Jenifer', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (30, N'Dyana', N'Golbourn', CAST(N'2000-07-11T14:46:12.0000000' AS DateTime2), 191, NULL, N'Sebewe', N'9', N'Pond', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (31, N'Tasia', N'Wheldon', CAST(N'1974-12-05T06:35:15.0000000' AS DateTime2), 214, N'922 81', N'Vindeln', N'49508', N'Del Sol', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (32, N'Ertha', N'Pirot', CAST(N'1994-11-18T06:42:29.0000000' AS DateTime2), 210, N'6005', N'General Arenales', N'0', N'Troy', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (33, N'Cheslie', N'Sorton', CAST(N'1978-07-20T00:39:55.0000000' AS DateTime2), 171, NULL, N'Mataloko', N'96', N'Weeping Birch', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (34, N'Korrie', N'Eakly', CAST(N'1991-11-15T12:54:57.0000000' AS DateTime2), 179, N'32835', N'Orlando', N'5', N'South', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (35, N'Drusilla', N'Moss', CAST(N'1992-11-01T15:20:23.0000000' AS DateTime2), 166, NULL, N'Shishang', N'44887', N'Sutherland', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (36, N'Vinni', N'Shortell', CAST(N'1982-02-27T06:15:23.0000000' AS DateTime2), 205, NULL, N'Suizhong', N'32', N'Arizona', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (37, N'Esdras', N'Archibould', CAST(N'1982-01-31T08:00:42.0000000' AS DateTime2), 8, NULL, N'Hetian', N'60', N'Rigney', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (38, N'Burnaby', N'Parrington', CAST(N'1988-11-29T00:37:18.0000000' AS DateTime2), 92, NULL, N'Güira de Melena', N'7330', N'Eastlawn', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (39, N'Andie', N'Antonich', CAST(N'1997-12-12T03:54:00.0000000' AS DateTime2), 110, N'V7A', N'Ladner', N'823', N'Tomscot', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (40, N'Karee', N'Yukhtin', CAST(N'1988-02-04T10:54:50.0000000' AS DateTime2), 71, N'36110', N'Phu Khiao', N'3', N'Banding', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (41, N'Wilhelmine', N'Yanele', CAST(N'1982-07-28T09:06:06.0000000' AS DateTime2), 73, N'5600', N'San Rafael', N'8', N'Clemons', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (42, N'Nelli', N'Lukianov', CAST(N'2000-01-01T03:15:42.0000000' AS DateTime2), 93, N'34-530', N'Bukowina Tatrzanska', N'69930', N'Debra', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (43, N'Cordelie', N'Sinnocke', CAST(N'1981-06-10T01:42:35.0000000' AS DateTime2), 228, N'34-530', N'Bukowina Tatrzanska', N'5632', N'Bowman', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (44, N'Florrie', N'Pantling', CAST(N'1989-10-07T04:06:20.0000000' AS DateTime2), 1, NULL, N'Yueshan', N'75', N'Dahle', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (45, N'Emmi', N'Matusiak', CAST(N'1975-08-27T02:10:44.0000000' AS DateTime2), 176, N'051059', N'Bello', N'54', N'Northview', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (46, N'Jeff', N'Pallatina', CAST(N'1994-11-14T23:18:51.0000000' AS DateTime2), 6, NULL, N'Xujiafang', N'10', N'Waxwing', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (47, N'Jennie', N'Rothera', CAST(N'1981-02-03T21:17:18.0000000' AS DateTime2), 224, NULL, N'Jatirejo', N'167', N'Transport', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (48, N'Alexei', N'Barrell', CAST(N'2001-10-30T08:28:09.0000000' AS DateTime2), 115, N'4610-475', N'Ponte', N'782', N'Iowa', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (49, N'Philipa', N'Slobom', CAST(N'1983-02-07T05:26:29.0000000' AS DateTime2), 226, N'22559', N'Hamburg', N'334', N'Mendota', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (50, N'Dorrie', N'Peyton', CAST(N'1995-03-25T10:39:32.0000000' AS DateTime2), 157, NULL, N'Agnibilékrou', N'48184', N'Mosinee', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (51, N'Greggory', N'Vasyaev', CAST(N'1979-06-09T09:13:09.0000000' AS DateTime2), 53, NULL, N'Lebao', N'2', N'Sheridan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (52, N'Eleen', N'Kingstne', CAST(N'1983-03-12T07:53:28.0000000' AS DateTime2), 5, N'78051', N'Rustam jo Goth', N'56', N'Trailsway', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (53, N'Ethan', N'Stanford', CAST(N'1980-12-31T09:30:01.0000000' AS DateTime2), 58, N'102042', N'Priupskiy', N'0', N'Cambridge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (54, N'Debbie', N'Bartle', CAST(N'1993-06-20T02:03:35.0000000' AS DateTime2), 19, N'5155-104', N'Custóias', N'4', N'Moland', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (55, N'Aldrich', N'Pyke', CAST(N'1991-07-31T10:35:03.0000000' AS DateTime2), 174, N'92924 CEDEX', N'Paris La Défense', N'77', N'Mallory', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (56, N'Selle', N'Lorraway', CAST(N'2004-08-22T13:02:14.0000000' AS DateTime2), 63, N'92762 CEDEX', N'Antony', N'7', N'Scott', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (57, N'Finn', N'Gillani', CAST(N'2001-02-16T09:50:33.0000000' AS DateTime2), 214, N'0390', N'Rustenburg', N'7', N'Sullivan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (58, N'Dayna', N'Deny', CAST(N'2005-07-03T15:40:31.0000000' AS DateTime2), 179, NULL, N'Shuangyang', N'4327', N'Bluejay', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (59, N'Faulkner', N'Shankland', CAST(N'1984-09-21T09:26:24.0000000' AS DateTime2), 82, NULL, N'Hedi', N'622', N'Truax', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (60, N'Isaac', N'Stitch', CAST(N'1973-07-08T11:07:57.0000000' AS DateTime2), 82, NULL, N'Rokytne', N'141', N'Summerview', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (61, N'Deidre', N'Pile', CAST(N'1984-05-21T21:45:01.0000000' AS DateTime2), 29, N'3707', N'Almaguer North', N'05052', N'Sunbrook', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (62, N'Briggs', N'McVicker', CAST(N'1994-02-13T21:47:08.0000000' AS DateTime2), 42, N'J9P', N'Val-d''Or', N'7', N'Hooker', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (63, N'Jabez', N'Durgan', CAST(N'1981-12-16T12:40:33.0000000' AS DateTime2), 115, N'3840-032', N'Choca do Mar', N'864', N'Wayridge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (64, N'Deerdre', N'Blandamore', CAST(N'1991-05-15T04:53:19.0000000' AS DateTime2), 201, NULL, N'Chaodi', N'4685', N'Talmadge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (65, N'Leigh', N'Piddington', CAST(N'1987-01-05T10:25:41.0000000' AS DateTime2), 139, NULL, N'Natakoli', N'0188', N'Chinook', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (66, N'Genni', N'Geldert', CAST(N'1979-12-21T17:50:29.0000000' AS DateTime2), 67, NULL, N'Pidvolochys’k', N'89198', N'Anderson', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (67, N'Adolpho', N'Gieves', CAST(N'1987-11-21T00:43:15.0000000' AS DateTime2), 131, NULL, N'Santiago del Torno', N'26', N'Karstens', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (68, N'Aubrie', N'Leggate', CAST(N'1982-03-12T08:19:51.0000000' AS DateTime2), 212, N'660017', N'Pereira', N'98', N'Welch', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (69, N'Aryn', N'Pithcock', CAST(N'1984-01-01T12:47:31.0000000' AS DateTime2), 101, N'187052', N'Lyuban’', N'448', N'Spaight', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (70, N'Alica', N'Camous', CAST(N'1995-03-10T14:33:28.0000000' AS DateTime2), 25, NULL, N'Daojiang', N'23862', N'Haas', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (71, N'Elwira', N'Scoines', CAST(N'1979-12-13T01:02:16.0000000' AS DateTime2), 76, N'21-077', N'Spiczyn', N'0190', N'Transport', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (72, N'Drona', N'Salmond', CAST(N'1971-06-24T04:38:02.0000000' AS DateTime2), 122, N'6541', N'Andres Bonifacio', N'07', N'Golf View', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (73, N'Clarie', N'Scheu', CAST(N'1983-11-24T15:00:56.0000000' AS DateTime2), 52, N'51571 CEDEX 2', N'Reims', N'8', N'Everett', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (74, N'Ermengarde', N'Chander', CAST(N'2005-07-19T07:49:38.0000000' AS DateTime2), 191, NULL, N'Talok', N'4199', N'Aberg', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (75, N'Terra', N'Layne', CAST(N'1980-07-30T05:12:56.0000000' AS DateTime2), 49, N'59762', N'Francisco J Mujica', N'21182', N'Bartillon', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (76, N'Emmery', N'Bossel', CAST(N'1983-03-04T13:03:21.0000000' AS DateTime2), 81, NULL, N'Bunda', N'89540', N'Susan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (77, N'Lorant', N'Tonsley', CAST(N'1995-06-26T15:25:24.0000000' AS DateTime2), 61, NULL, N'Lamu', N'6153', N'Debra', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (78, N'Adora', N'Campelli', CAST(N'2000-08-21T11:36:08.0000000' AS DateTime2), 46, N'3304', N'Tabor', N'8', N'Longview', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (79, N'Cullan', N'Izhak', CAST(N'1982-10-22T07:51:55.0000000' AS DateTime2), 142, N'98109', N'Seattle', N'77067', N'Toban', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (80, N'Veronique', N'Margery', CAST(N'1974-07-17T17:20:28.0000000' AS DateTime2), 177, N'83000-000', N'São José dos Pinhais', N'6', N'Sheridan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (81, N'Killian', N'Coysh', CAST(N'1995-05-23T18:05:01.0000000' AS DateTime2), 55, N'2620-188', N'Ramada', N'996', N'Anhalt', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (82, N'Fey', N'Adess', CAST(N'1987-03-10T06:16:41.0000000' AS DateTime2), 182, N'1211', N'København', N'1', N'Donald', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (83, N'Brewster', N'Seagrove', CAST(N'1981-02-22T13:26:44.0000000' AS DateTime2), 181, N'601672', N'Strunino', N'49469', N'Petterle', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (84, N'Alejandrina', N'Thomerson', CAST(N'1994-11-19T12:16:32.0000000' AS DateTime2), 157, NULL, N'Dobropillya', N'1', N'Spaight', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (85, N'Mab', N'Benedikt', CAST(N'2001-01-07T07:09:32.0000000' AS DateTime2), 83, NULL, N'Higuerote', N'163', N'Debra', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (86, N'Logan', N'Feeley', CAST(N'1977-03-19T09:49:01.0000000' AS DateTime2), 114, NULL, N'Waikambila', N'0500', N'Washington', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (87, N'Eugine', N'Sibary', CAST(N'1972-08-11T03:42:30.0000000' AS DateTime2), 230, NULL, N'Baisha', N'77973', N'5th', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (88, N'Irene', N'Philpault', CAST(N'1999-12-07T19:40:48.0000000' AS DateTime2), 68, N'80000-000', N'Curitiba', N'959', N'Hauk', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (89, N'Katrina', N'Lightwing', CAST(N'1994-02-12T11:55:52.0000000' AS DateTime2), 187, NULL, N'Osogbo', N'4196', N'Redwing', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (90, N'Sonny', N'Hannigane', CAST(N'1972-01-07T03:35:14.0000000' AS DateTime2), 222, N'999-2171', N'Ishioka', N'8', N'Hoffman', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (91, N'Bernice', N'Walbrun', CAST(N'2004-12-06T11:36:33.0000000' AS DateTime2), 206, NULL, N'Ujungpangkah', N'77525', N'Loftsgordon', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (92, N'Madelyn', N'Adney', CAST(N'1998-02-15T05:06:43.0000000' AS DateTime2), 13, N'65213-000', N'Penalva', N'18075', N'Sullivan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (93, N'Cissy', N'McAulay', CAST(N'1997-08-18T03:01:38.0000000' AS DateTime2), 134, N'738 23', N'Norberg', N'2', N'Heffernan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (94, N'Robby', N'Esmead', CAST(N'1997-02-21T13:38:51.0000000' AS DateTime2), 59, N'75600-000', N'Goiatuba', N'46406', N'Grover', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (95, N'Yorker', N'Barck', CAST(N'1972-02-16T14:37:24.0000000' AS DateTime2), 99, NULL, N'Puan', N'5976', N'Algoma', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (96, N'Chrissie', N'Counsell', CAST(N'2000-05-27T22:43:47.0000000' AS DateTime2), 25, N'62214', N'Benito Juarez', N'55832', N'Kipling', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (97, N'Chuck', N'Whitcomb', CAST(N'2002-01-20T10:24:42.0000000' AS DateTime2), 226, NULL, N'Xuguang', N'52327', N'Rigney', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (98, N'Ariana', N'Fossick', CAST(N'1998-04-02T11:56:50.0000000' AS DateTime2), 149, NULL, N'Maundai', N'371', N'School', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (99, N'Danell', N'Karolewski', CAST(N'1972-09-27T07:55:22.0000000' AS DateTime2), 115, N'9202', N'Kauswagan', N'7481', N'Schurz', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (100, N'Fitzgerald', N'Jordon', CAST(N'2002-06-20T23:46:44.0000000' AS DateTime2), 75, NULL, N'Tanjung Palas', N'78326', N'Nevada', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (101, N'Virgil', N'Dikes', CAST(N'1988-10-25T10:06:16.0000000' AS DateTime2), 148, N'14074 CEDEX 5', N'Caen', N'36751', N'Warner', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (102, N'Janos', N'Christoforou', CAST(N'1988-07-30T20:50:15.0000000' AS DateTime2), 219, NULL, N'Bayt ‘Anan', N'43', N'Morning', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (103, N'Dela', N'Mackley', CAST(N'1974-01-11T18:00:49.0000000' AS DateTime2), 28, NULL, N'Qukës-Skënderbe', N'3706', N'Farragut', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (104, N'Duke', N'Veschambre', CAST(N'1975-02-09T19:45:58.0000000' AS DateTime2), 13, NULL, N'Torbat-e Jam', N'90', N'Pennsylvania', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (105, N'Coralyn', N'Errett', CAST(N'1997-02-10T14:13:48.0000000' AS DateTime2), 174, NULL, N'Triánta', N'2', N'John Wall', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (106, N'Ronna', N'Peel', CAST(N'1982-06-28T14:14:30.0000000' AS DateTime2), 42, N'84-240', N'Reda', N'488', N'Eastwood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (107, N'Marcella', N'Goodyear', CAST(N'1984-03-27T08:45:01.0000000' AS DateTime2), 165, NULL, N'Shuangxi', N'2', N'Pawling', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (108, N'Frances', N'Calton', CAST(N'1991-12-10T14:43:27.0000000' AS DateTime2), 90, N'63455', N'Amado Nervo', N'7668', N'Towne', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (109, N'Kaela', N'Elks', CAST(N'1991-06-01T16:13:05.0000000' AS DateTime2), 101, N'65712-000', N'Lago dos Rodrigues', N'1', N'Brentwood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (110, N'Jo-ann', N'Baguley', CAST(N'2005-03-05T01:39:16.0000000' AS DateTime2), 152, N'35590-000', N'Lagoa da Prata', N'160', N'Sunnyside', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (111, N'Sheelagh', N'Fife', CAST(N'1982-07-28T18:25:12.0000000' AS DateTime2), 189, N'55014', N'Jonava', N'01', N'Larry', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (112, N'Osborn', N'Macilhench', CAST(N'1975-09-18T01:53:12.0000000' AS DateTime2), 88, N'1105', N'Panan', N'9', N'Monica', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (113, N'Cathlene', N'Abrahamian', CAST(N'1981-01-24T08:48:40.0000000' AS DateTime2), 93, N'2445-204', N'Pataias', N'83', N'Schurz', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (114, N'Bancroft', N'Guerner', CAST(N'1991-10-27T01:50:06.0000000' AS DateTime2), 187, N'51107', N'Köln', N'90', N'Roth', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (115, N'Max', N'Kausche', CAST(N'1970-09-12T05:04:08.0000000' AS DateTime2), 156, NULL, N'Punaauia', N'4', N'Randy', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (116, N'Danila', N'Torresi', CAST(N'1993-12-07T23:51:16.0000000' AS DateTime2), 32, NULL, N'Ersekë', N'29', N'Pierstorff', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (117, N'Clarine', N'Coverly', CAST(N'1992-04-23T02:41:38.0000000' AS DateTime2), 81, NULL, N'Permas', N'666', N'Troy', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (118, N'Marten', N'Lagde', CAST(N'1983-04-18T07:06:02.0000000' AS DateTime2), 164, N'270 21', N'Všetaty', N'8404', N'Karstens', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (119, N'Norrie', N'Twentyman', CAST(N'1993-10-12T02:24:14.0000000' AS DateTime2), 178, N'055018', N'La Ceja', N'2', N'Atwood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (120, N'Nissy', N'Sparling', CAST(N'2001-11-13T00:38:12.0000000' AS DateTime2), 51, N'6036', N'Barili', N'72', N'Schlimgen', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (121, N'Patrick', N'Radin', CAST(N'2001-12-28T17:36:26.0000000' AS DateTime2), 66, N'4710', N'Kokstad', N'44', N'Service', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (122, N'Vonny', N'Braine', CAST(N'1996-02-18T22:54:38.0000000' AS DateTime2), 116, NULL, N'Xiliu', N'3599', N'Holmberg', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (123, N'Darby', N'Stanistreet', CAST(N'1999-12-19T15:25:50.0000000' AS DateTime2), 180, N'24740', N'Landi Kotal', N'956', N'Sloan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (124, N'Burt', N'Jeff', CAST(N'1973-04-13T05:19:20.0000000' AS DateTime2), 80, NULL, N'Wensu', N'657', N'Summer Ridge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (125, N'Natalya', N'Yesson', CAST(N'1978-04-26T19:52:46.0000000' AS DateTime2), 76, N'28239', N'Bremen', N'82584', N'Paget', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (126, N'Brant', N'Sink', CAST(N'1997-12-25T04:02:16.0000000' AS DateTime2), 127, NULL, N'Tân Tru?', N'64488', N'Riverside', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (127, N'Isabeau', N'Braunstein', CAST(N'2000-01-07T12:13:26.0000000' AS DateTime2), 87, NULL, N'Wu’an', N'0322', N'Lighthouse Bay', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (128, N'Tessi', N'Perchard', CAST(N'2002-01-02T05:57:50.0000000' AS DateTime2), 78, NULL, N'Ogurugu', N'591', N'Division', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (129, N'Ilka', N'Peterson', CAST(N'1981-04-16T13:02:21.0000000' AS DateTime2), 35, N'2540-557', N'Baraçais', N'7', N'Quincy', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (130, N'Tresa', N'Worstall', CAST(N'1999-04-13T14:15:30.0000000' AS DateTime2), 185, N'597-0095', N'Izumiotsu', N'6625', N'Dapin', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (131, N'Aeriela', N'Cowhig', CAST(N'1985-06-28T13:04:55.0000000' AS DateTime2), 46, N'79083 CEDEX 9', N'Niort', N'1739', N'Arrowood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (132, N'Nickie', N'Boar', CAST(N'1987-10-15T13:34:02.0000000' AS DateTime2), 82, N'20005', N'Donostia-San Sebastian', N'66', N'Union', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (133, N'Ashli', N'Sones', CAST(N'2004-06-27T23:50:05.0000000' AS DateTime2), 184, NULL, N'Jiangkou', N'076', N'Londonderry', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (134, N'Celeste', N'Milam', CAST(N'1976-12-18T15:39:29.0000000' AS DateTime2), 112, N'3328', N'Masipi West', N'39158', N'Bultman', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (135, N'Marsiella', N'Jellard', CAST(N'1973-05-02T12:27:24.0000000' AS DateTime2), 128, NULL, N'Tiko', N'414', N'Ramsey', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (136, N'Tamera', N'Rickert', CAST(N'1991-11-02T05:05:10.0000000' AS DateTime2), 25, NULL, N'Wasagu', N'7', N'Lakewood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (137, N'Maudie', N'Riccione', CAST(N'1979-07-31T07:50:08.0000000' AS DateTime2), 223, NULL, N'Staryy Krym', N'10', N'Roth', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (138, N'Aylmar', N'Deniskevich', CAST(N'2002-05-14T18:16:34.0000000' AS DateTime2), 217, NULL, N'Longka', N'1', N'Packers', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (139, N'Ynez', N'Tracy', CAST(N'1999-07-08T01:38:27.0000000' AS DateTime2), 183, NULL, N'Wuhu', N'8072', N'Butternut', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (140, N'Brandie', N'Izakov', CAST(N'1977-11-16T03:28:20.0000000' AS DateTime2), 67, NULL, N'Langxi', N'2301', N'2nd', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (141, N'Jonell', N'MacCostigan', CAST(N'1987-08-19T13:54:32.0000000' AS DateTime2), 93, N'1219', N'Mancilang', N'94', N'Melody', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (142, N'Heath', N'Gradon', CAST(N'1981-03-30T05:37:48.0000000' AS DateTime2), 101, NULL, N'Pangawaren', N'23844', N'Linden', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (143, N'Marney', N'Lidierth', CAST(N'1987-03-25T08:38:33.0000000' AS DateTime2), 14, N'69424 CEDEX 03', N'Lyon', N'992', N'Huxley', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (144, N'Addie', N'Suche', CAST(N'1982-06-17T21:40:15.0000000' AS DateTime2), 205, NULL, N'Raydah', N'0', N'Pine View', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (145, N'Tad', N'Lunn', CAST(N'2000-09-14T10:25:21.0000000' AS DateTime2), 20, NULL, N'Diên Khánh', N'36958', N'Prentice', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (146, N'Deedee', N'Manjin', CAST(N'1978-01-16T07:56:57.0000000' AS DateTime2), 36, N'14276', N'Buffalo', N'9', N'Rowland', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (147, N'Janella', N'Burnsall', CAST(N'1994-05-03T14:45:35.0000000' AS DateTime2), 62, NULL, N'Dobropillya', N'2917', N'6th', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (148, N'Romona', N'Wackly', CAST(N'1997-11-29T04:55:32.0000000' AS DateTime2), 174, NULL, N'Casablanca', N'83', N'Mifflin', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (149, N'Margaretha', N'Pouton', CAST(N'1994-01-08T07:41:16.0000000' AS DateTime2), 193, N'441-3155', N'Kosai-shi', N'54738', N'Westend', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (150, N'Regina', N'Hathway', CAST(N'2005-06-16T19:53:10.0000000' AS DateTime2), 65, N'4690-667', N'Santo António', N'47', N'Forest Dale', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (151, N'Linn', N'Renneke', CAST(N'1972-08-31T00:30:09.0000000' AS DateTime2), 11, N'70051', N'Tando Jam', N'2795', N'Bonner', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (152, N'Josias', N'Taig', CAST(N'1976-12-10T01:13:42.0000000' AS DateTime2), 97, N'188680', N'Koltushi', N'7', N'Cody', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (153, N'Uriah', N'Mathouse', CAST(N'1988-02-17T21:36:48.0000000' AS DateTime2), 8, NULL, N'Castle Bruce', N'810', N'Stang', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (154, N'Isador', N'O''Griffin', CAST(N'1985-09-22T22:46:00.0000000' AS DateTime2), 24, NULL, N'Shurugwi', N'5371', N'Twin Pines', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (155, N'Madelena', N'McNirlan', CAST(N'1981-08-13T07:02:30.0000000' AS DateTime2), 158, N'10905', N'Santa Cruz de El Seibo', N'4', N'Dwight', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (156, N'Meredithe', N'Uden', CAST(N'1976-08-18T09:50:14.0000000' AS DateTime2), 86, NULL, N'Qinjia', N'58', N'Briar Crest', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (157, N'Jared', N'Grimble', CAST(N'1997-04-22T20:37:34.0000000' AS DateTime2), 75, NULL, N'Nazca', N'6', N'Warner', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (158, N'Sigmund', N'Blaxill', CAST(N'1977-06-14T13:21:01.0000000' AS DateTime2), 208, N'692 81', N'Kumla', N'6123', N'Linden', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (159, N'Lidia', N'Gammage', CAST(N'1984-07-30T06:15:26.0000000' AS DateTime2), 41, NULL, N'Axili', N'62077', N'Rieder', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (160, N'Tilda', N'Billany', CAST(N'1982-02-01T14:54:01.0000000' AS DateTime2), 173, NULL, N'La Labor', N'340', N'Merrick', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (161, N'Horatia', N'MacTurlough', CAST(N'1975-09-03T15:10:57.0000000' AS DateTime2), 130, N'5030-213', N'Fornelos', N'39', N'East', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (162, N'Frederigo', N'Fairham', CAST(N'2001-10-22T01:59:31.0000000' AS DateTime2), 64, NULL, N'Rizokárpaso', N'780', N'Butternut', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (163, N'Reggis', N'Viggers', CAST(N'1998-06-06T18:00:14.0000000' AS DateTime2), 115, N'162 61', N'Vällingby', N'8128', N'Namekagon', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (164, N'Darlleen', N'Samsin', CAST(N'1984-10-20T09:48:54.0000000' AS DateTime2), 77, N'00822', N'Charlotte Amalie', N'89', N'Dorton', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (165, N'Alaine', N'Verrier', CAST(N'1995-08-10T11:53:22.0000000' AS DateTime2), 186, NULL, N'Lisala', N'88', N'Steensland', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (166, N'Tine', N'De Wolfe', CAST(N'2000-03-11T01:42:33.0000000' AS DateTime2), 37, N'244 24', N'Kävlinge', N'9704', N'Delladonna', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (167, N'Angelica', N'Crush', CAST(N'1999-02-27T15:26:23.0000000' AS DateTime2), 54, NULL, N'B?ng Lung', N'08', N'Karstens', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (168, N'Northrop', N'Rue', CAST(N'2000-11-01T19:34:57.0000000' AS DateTime2), 206, NULL, N'Kojagete', N'1', N'Truax', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (169, N'Dionisio', N'Foldes', CAST(N'1986-02-23T19:31:22.0000000' AS DateTime2), 61, N'48400-000', N'Ribeira do Pombal', N'6', N'Monica', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (170, N'Joaquin', N'Shallcroff', CAST(N'1982-06-11T07:21:57.0000000' AS DateTime2), 17, NULL, N'Xinchengzi', N'34', N'Packers', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (171, N'Gunner', N'Bowers', CAST(N'1994-02-23T04:39:22.0000000' AS DateTime2), 13, N'42-674', N'Zbroslawice', N'644', N'Badeau', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (172, N'Elyssa', N'Dryburgh', CAST(N'1997-12-03T12:11:32.0000000' AS DateTime2), 58, N'4424', N'Maagnas', N'1', N'Clove', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (173, N'Jerald', N'Biesty', CAST(N'1972-09-27T20:43:29.0000000' AS DateTime2), 182, N'929-1811', N'Ninomiya', N'19', N'Buell', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (174, N'Vincent', N'Kilroy', CAST(N'1974-01-07T18:00:33.0000000' AS DateTime2), 79, N'622937', N'Vyatskiye Polyany', N'879', N'Holy Cross', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (175, N'Ede', N'Tuffey', CAST(N'1985-08-18T18:32:18.0000000' AS DateTime2), 26, NULL, N'Mazhonghe', N'4574', N'Lindbergh', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (176, N'Bendite', N'Halpeine', CAST(N'1975-10-22T06:52:29.0000000' AS DateTime2), 131, NULL, N'Juai', N'27627', N'Carpenter', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (177, N'Marika', N'Sudran', CAST(N'1995-01-13T02:47:32.0000000' AS DateTime2), 7, N'36109', N'Montgomery', N'50643', N'Clyde Gallagher', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (178, N'Zachary', N'O'' Meara', CAST(N'1972-08-16T12:53:23.0000000' AS DateTime2), 56, NULL, N'Volnovakha', N'46048', N'Mallory', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (179, N'Georas', N'Stanmer', CAST(N'1993-05-10T13:13:58.0000000' AS DateTime2), 177, N'661008', N'Dos Quebradas', N'44', N'Sutherland', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (180, N'Laryssa', N'Gahan', CAST(N'1971-03-11T03:29:43.0000000' AS DateTime2), 119, NULL, N'Tiko', N'596', N'Vernon', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (181, N'Lacey', N'Cromley', CAST(N'1992-12-15T03:53:40.0000000' AS DateTime2), 25, NULL, N'Unión', N'83', N'Kropf', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (182, N'Nealon', N'Stitson', CAST(N'1994-12-04T01:41:54.0000000' AS DateTime2), 174, N'463 31', N'Chrastava', N'13268', N'Florence', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (183, N'Dareen', N'Orlton', CAST(N'1983-08-25T06:54:48.0000000' AS DateTime2), 136, N'12300-000', N'Jacareí', N'997', N'Village', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (184, N'Guglielma', N'Alpes', CAST(N'2003-03-02T02:17:30.0000000' AS DateTime2), 190, NULL, N'Xiying', N'53', N'Monterey', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (185, N'Felipe', N'Fosbraey', CAST(N'1972-11-19T11:41:25.0000000' AS DateTime2), 131, NULL, N'Xiaxindian', N'6', N'Londonderry', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (186, N'Kendall', N'Atterbury', CAST(N'1985-06-24T09:16:46.0000000' AS DateTime2), 184, NULL, N'Cikabuyutan Barat', N'51435', N'Vidon', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (187, N'Rozanne', N'Annies', CAST(N'1994-09-22T22:57:37.0000000' AS DateTime2), 108, N'357859', N'Galyugayevskaya', N'17223', N'Macpherson', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (188, N'Chester', N'Fedynski', CAST(N'2001-05-10T02:14:03.0000000' AS DateTime2), 15, NULL, N'Guiyang', N'5', N'Washington', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (189, N'Gram', N'Forge', CAST(N'2004-01-13T15:33:35.0000000' AS DateTime2), 222, NULL, N'Abu Dhabi', N'26958', N'Twin Pines', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (190, N'Mab', N'Casarili', CAST(N'1977-07-04T03:09:23.0000000' AS DateTime2), 103, N'L0P', N'Senneterre', N'725', N'Fuller', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (191, N'Carola', N'Jansema', CAST(N'1972-05-20T10:32:14.0000000' AS DateTime2), 166, NULL, N'Anle', N'38378', N'Carpenter', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (192, N'Bel', N'Agastina', CAST(N'2005-01-06T15:36:57.0000000' AS DateTime2), 150, N'64525-000', N'Várzea Grande', N'557', N'Mcbride', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (193, N'Georgianne', N'Ebbage', CAST(N'1974-01-19T17:05:50.0000000' AS DateTime2), 69, N'H62', N'Loughrea', N'785', N'Cambridge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (194, N'Erma', N'Guesford', CAST(N'1983-05-15T17:23:05.0000000' AS DateTime2), 223, N'18650-000', N'São Manuel', N'56', N'Pearson', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (195, N'Star', N'Paradyce', CAST(N'1981-08-26T19:00:39.0000000' AS DateTime2), 149, N'2785-220', N'Mato Cheirinhos', N'08082', N'Northview', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (196, N'Issi', N'De Witt', CAST(N'1984-08-18T15:14:51.0000000' AS DateTime2), 32, N'75610', N'Melaka', N'57', N'Roth', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (197, N'Neil', N'Penton', CAST(N'1977-01-24T23:04:32.0000000' AS DateTime2), 2, NULL, N'Khoshi', N'855', N'Merry', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (198, N'Camala', N'Piggford', CAST(N'1999-05-01T08:43:32.0000000' AS DateTime2), 23, N'22015', N'Pasaco', N'0', N'Surrey', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (199, N'Phillipp', N'Gullyes', CAST(N'1975-11-15T23:24:00.0000000' AS DateTime2), 141, NULL, N'Umm al Qaywayn', N'290', N'Superior', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (200, N'Amy', N'Castane', CAST(N'1972-07-23T09:53:03.0000000' AS DateTime2), 229, NULL, N'Sukabumi', N'2407', N'Mandrake', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (201, N'Kimbra', N'Archbald', CAST(N'2000-05-25T08:45:22.0000000' AS DateTime2), 179, N'59000-000', N'Natal', N'98731', N'Sachtjen', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (202, N'Sig', N'Ashforth', CAST(N'1993-06-05T09:18:09.0000000' AS DateTime2), 79, NULL, N'Acobambilla', N'5025', N'Rutledge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (203, N'Norry', N'Wedderburn', CAST(N'1992-01-09T14:23:13.0000000' AS DateTime2), 92, N'45208', N'Cincinnati', N'6586', N'Sullivan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (204, N'Anderson', N'Cambell', CAST(N'2004-08-28T16:17:30.0000000' AS DateTime2), 125, NULL, N'Mujiangping', N'47', N'Jenna', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (205, N'Elbertine', N'Dewing', CAST(N'1987-08-15T14:56:01.0000000' AS DateTime2), 16, NULL, N'Wasogolo', N'09', N'Lien', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (206, N'Leesa', N'Mandrier', CAST(N'1997-09-30T11:35:29.0000000' AS DateTime2), 117, N'80501', N'Shikarpur', N'12629', N'Kennedy', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (207, N'Mickey', N'Crowne', CAST(N'1980-08-25T23:45:58.0000000' AS DateTime2), 181, N'999-3145', N'Kawasaki', N'4656', N'Daystar', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (208, N'Kerri', N'Ure', CAST(N'2003-11-24T09:23:57.0000000' AS DateTime2), 113, N'11704', N'Sabana Grande de Palenque', N'41464', N'Hanover', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (209, N'Mona', N'Wray', CAST(N'2001-06-16T11:34:36.0000000' AS DateTime2), 67, N'D6W', N'Greenhills', N'11071', N'Veith', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (210, N'Filip', N'Harcourt', CAST(N'1988-06-21T14:01:38.0000000' AS DateTime2), 77, NULL, N'Caballococha', N'9854', N'Gale', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (211, N'Emmery', N'Probyn', CAST(N'1971-06-20T08:47:12.0000000' AS DateTime2), 222, NULL, N'Alivéri', N'95783', N'Blue Bill Park', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (212, N'Lucita', N'McHugh', CAST(N'1990-10-09T17:24:11.0000000' AS DateTime2), 85, N'284 32', N'Perstorp', N'9', N'Dottie', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (213, N'Gayle', N'Gerdts', CAST(N'1982-11-18T07:34:33.0000000' AS DateTime2), 174, N'52120', N'Suan Luang', N'21737', N'Carpenter', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (214, N'Joela', N'Edards', CAST(N'1980-09-15T02:54:43.0000000' AS DateTime2), 136, NULL, N'Mönhbulag', N'10', N'Commercial', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (215, N'Arlana', N'MacIlwrick', CAST(N'1989-04-09T05:38:01.0000000' AS DateTime2), 162, N'2821', N'Gjøvik', N'276', N'Dunning', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (216, N'Emyle', N'Mayes', CAST(N'1972-10-30T03:18:10.0000000' AS DateTime2), 142, N'301260', N'Kireyevsk', N'96', N'International', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (217, N'Eleni', N'O'' Culligan', CAST(N'2001-07-31T22:57:28.0000000' AS DateTime2), 38, N'141960', N'Zaprudnya', N'8', N'Eliot', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (218, N'Carrol', N'Sille', CAST(N'1990-11-30T10:33:24.0000000' AS DateTime2), 97, NULL, N'Fandriana', N'33518', N'Northport', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (219, N'Emera', N'Ilyinykh', CAST(N'1994-02-28T15:34:23.0000000' AS DateTime2), 187, N'76-002', N'Lazy', N'08114', N'Talisman', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (220, N'Leanna', N'Penna', CAST(N'1986-12-06T11:40:59.0000000' AS DateTime2), 47, N'997-0753', N'Tagawa', N'87567', N'Welch', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (221, N'Northrup', N'Tatum', CAST(N'2001-11-21T20:50:03.0000000' AS DateTime2), 193, N'357748', N'Kislovodsk', N'3269', N'Manufacturers', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (222, N'Sal', N'Clausson', CAST(N'1999-03-15T22:49:17.0000000' AS DateTime2), 48, NULL, N'Dasha', N'167', N'Charing Cross', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (223, N'Fran', N'Westmancoat', CAST(N'1990-11-21T17:36:10.0000000' AS DateTime2), 225, N'3302', N'Communal', N'940', N'Delladonna', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (224, N'Kippy', N'Bispham', CAST(N'1986-08-29T21:08:46.0000000' AS DateTime2), 146, NULL, N'Yangyu', N'956', N'Mccormick', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (225, N'Philbert', N'Heffron', CAST(N'1991-07-03T23:07:26.0000000' AS DateTime2), 172, N'230559', N'Cereté', N'57', N'Dottie', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (226, N'Myrvyn', N'Vaggers', CAST(N'2001-10-25T02:27:03.0000000' AS DateTime2), 14, N'762008', N'El Águila', N'236', N'Upham', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (227, N'Beatrice', N'Bernardet', CAST(N'1995-01-28T12:06:29.0000000' AS DateTime2), 121, NULL, N'Bojonglarang', N'5156', N'Forest', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (228, N'Gilberto', N'Walcher', CAST(N'1983-09-05T20:25:05.0000000' AS DateTime2), 103, NULL, N'Janeng', N'9869', N'Nevada', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (229, N'Euphemia', N'Dossetter', CAST(N'1984-07-26T08:16:57.0000000' AS DateTime2), 225, N'55500-000', N'Escada', N'97913', N'Fordem', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (230, N'Franciska', N'Tysack', CAST(N'1996-01-14T20:07:09.0000000' AS DateTime2), 91, NULL, N'Muyuzi', N'76', N'Ruskin', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (231, N'Cherish', N'Haet', CAST(N'1976-03-07T10:37:55.0000000' AS DateTime2), 97, NULL, N'Ayteke Bi', N'569', N'Utah', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (232, N'Domenico', N'Potten', CAST(N'1991-03-31T16:23:06.0000000' AS DateTime2), 137, NULL, N'Changxingbao', N'0', N'Meadow Valley', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (233, N'Effie', N'Philipp', CAST(N'1997-02-12T17:41:46.0000000' AS DateTime2), 12, N'86000', N'Phatthalung', N'766', N'Old Shore', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (234, N'Jeremias', N'Elstone', CAST(N'1974-10-19T23:48:59.0000000' AS DateTime2), 183, NULL, N'Dongchuan', N'873', N'Merrick', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (235, N'Gerti', N'Tarren', CAST(N'1970-12-28T21:48:37.0000000' AS DateTime2), 25, N'369160', N'Storozhevaya', N'726', N'Hoard', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (236, N'Roberta', N'Aimeric', CAST(N'1975-09-19T11:27:16.0000000' AS DateTime2), 53, NULL, N'Ibeto', N'2', N'Fair Oaks', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (237, N'Justinian', N'Moulder', CAST(N'1997-01-02T17:53:16.0000000' AS DateTime2), 138, NULL, N'Dula’er Ewenke Minzu', N'07', N'Buena Vista', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (238, N'Ajay', N'Essel', CAST(N'1980-12-14T04:44:52.0000000' AS DateTime2), 144, N'5212', N'Avellaneda', N'74', N'East', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (239, N'Hermione', N'Vedekhov', CAST(N'1993-10-09T04:54:59.0000000' AS DateTime2), 39, N'14-230', N'Zalewo', N'90', N'5th', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (240, N'Major', N'Cobello', CAST(N'1981-12-12T04:30:48.0000000' AS DateTime2), 13, N'9970-244', N'Fazenda de Santa Cruz', N'1', N'Surrey', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (241, N'Genny', N'Dubber', CAST(N'1997-10-09T10:27:04.0000000' AS DateTime2), 125, N'3006', N'Baliuag', N'111', N'Del Mar', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (242, N'Lizette', N'Mariolle', CAST(N'1977-06-02T20:08:28.0000000' AS DateTime2), 93, NULL, N'Kiuola', N'54', N'Bartillon', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (243, N'Salvatore', N'Bestwall', CAST(N'2003-06-06T03:42:35.0000000' AS DateTime2), 126, NULL, N'Hoçisht', N'5', N'Melrose', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (244, N'Bennie', N'Cranshaw', CAST(N'1985-10-29T07:14:51.0000000' AS DateTime2), 30, N'6307', N'Garcia Hernandez', N'083', N'Stone Corner', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (245, N'Brocky', N'MacAndrew', CAST(N'1973-07-02T23:56:22.0000000' AS DateTime2), 81, NULL, N'Beigang', N'54519', N'Kipling', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (246, N'Mathilde', N'Mintoff', CAST(N'1976-08-26T20:37:11.0000000' AS DateTime2), 137, N'17017', N'Eišiškes', N'20', N'Dennis', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (247, N'Glenden', N'Merrell', CAST(N'1977-02-14T20:41:35.0000000' AS DateTime2), 100, NULL, N'Babakan', N'771', N'Corry', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (248, N'Gian', N'Bartot', CAST(N'1987-04-08T05:49:38.0000000' AS DateTime2), 189, N'95113', N'San Jose', N'9', N'Warner', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (249, N'Erna', N'Rhymes', CAST(N'2005-03-08T08:13:20.0000000' AS DateTime2), 45, NULL, N'Baalbek', N'68717', N'Dawn', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (250, N'Marlyn', N'Martyntsev', CAST(N'1994-02-20T12:22:22.0000000' AS DateTime2), 205, N'2580', N'Marcos Juárez', N'535', N'Rockefeller', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (251, N'Clyde', N'Mountford', CAST(N'1972-08-14T05:31:34.0000000' AS DateTime2), 194, NULL, N'Port Louis', N'671', N'Mallory', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (252, N'Berk', N'Novelli', CAST(N'1981-10-04T00:37:16.0000000' AS DateTime2), 229, NULL, N'Santa Marta', N'4044', N'Ilene', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (253, N'Fidole', N'Faich', CAST(N'1971-04-24T22:05:12.0000000' AS DateTime2), 130, NULL, N'Tai Po', N'975', N'Park Meadow', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (254, N'Vannie', N'Hearfield', CAST(N'2001-04-09T10:34:41.0000000' AS DateTime2), 154, NULL, N'Sungaikupang', N'57', N'Veith', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (255, N'Kiersten', N'Longridge', CAST(N'2001-07-19T13:31:48.0000000' AS DateTime2), 113, NULL, N'Tissa', N'20', N'Logan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (256, N'Gottfried', N'Dain', CAST(N'1992-06-16T20:31:35.0000000' AS DateTime2), 215, NULL, N'Xingshou', N'2092', N'Sutherland', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (257, N'Sheelagh', N'Osgardby', CAST(N'1991-10-29T10:42:48.0000000' AS DateTime2), 63, NULL, N'Gongchenqiao', N'037', N'Ridgeview', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (258, N'Sena', N'Mesnard', CAST(N'1993-07-30T20:02:06.0000000' AS DateTime2), 230, NULL, N'Rasony', N'73150', N'Golf View', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (259, N'Alvis', N'Mathwen', CAST(N'1974-10-31T19:57:37.0000000' AS DateTime2), 88, N'531 36', N'Lidköping', N'73', N'6th', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (260, N'Rubi', N'Sange', CAST(N'1989-07-26T08:09:42.0000000' AS DateTime2), 2, NULL, N'Goma', N'8', N'Dapin', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (261, N'Amalee', N'Weedon', CAST(N'1972-11-22T05:30:41.0000000' AS DateTime2), 38, N'301086', N'Kupavna', N'7275', N'Kensington', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (262, N'Timmy', N'Gennrich', CAST(N'1980-12-29T17:43:15.0000000' AS DateTime2), 151, N'2415', N'Aguilar', N'7', N'Dwight', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (263, N'Chelsey', N'Bougen', CAST(N'2002-01-09T19:14:50.0000000' AS DateTime2), 206, NULL, N'Paine', N'2461', N'Independence', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (264, N'Dominique', N'Richemond', CAST(N'1988-06-10T06:34:14.0000000' AS DateTime2), 130, N'1804', N'Ezeiza', N'17335', N'Hayes', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (265, N'Gustave', N'Kruger', CAST(N'1997-03-12T14:58:36.0000000' AS DateTime2), 185, NULL, N'Yuyao', N'20', N'Pepper Wood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (266, N'Hoyt', N'Woliter', CAST(N'1984-05-13T11:50:44.0000000' AS DateTime2), 206, NULL, N'Zhongshangang', N'85832', N'Cherokee', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (267, N'Ibbie', N'Muggleston', CAST(N'1987-09-05T08:04:35.0000000' AS DateTime2), 217, NULL, N'Báguanos', N'246', N'Summit', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (268, N'Ron', N'McKeurton', CAST(N'1986-11-07T03:01:37.0000000' AS DateTime2), 98, NULL, N'Taojiahe', N'571', N'Corry', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (269, N'Esme', N'Woehler', CAST(N'1988-11-11T12:16:26.0000000' AS DateTime2), 31, N'3780-204', N'Anadia', N'2', N'3rd', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (270, N'Kimbell', N'Merryweather', CAST(N'1997-10-04T10:39:58.0000000' AS DateTime2), 65, N'25220', N'Na Di', N'0', N'Crescent Oaks', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (271, N'Charil', N'Blenkiron', CAST(N'1984-06-03T01:07:06.0000000' AS DateTime2), 107, N'73190', N'Oklahoma City', N'9', N'Northwestern', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (272, N'Reinwald', N'Kuhwald', CAST(N'1977-12-09T09:26:11.0000000' AS DateTime2), 220, N'425359', N'Koz’modem’yansk', N'117', N'Fairfield', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (273, N'Brady', N'Dodsley', CAST(N'1971-09-26T22:09:40.0000000' AS DateTime2), 154, NULL, N'Matanzas', N'04187', N'Summit', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (274, N'Dulcea', N'Jacobsson', CAST(N'1977-02-12T13:56:00.0000000' AS DateTime2), 78, NULL, N'Gornje Moštre', N'81', N'Upham', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (275, N'Lenee', N'Dowbekin', CAST(N'1982-07-18T15:50:09.0000000' AS DateTime2), 131, NULL, N'Kerasochóri', N'22', N'Dapin', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (276, N'Karlotta', N'Ilyasov', CAST(N'1993-12-26T10:23:43.0000000' AS DateTime2), 218, NULL, N'Dukuhtengah', N'39039', N'Eagle Crest', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (277, N'Zacharias', N'Dabney', CAST(N'1983-01-14T08:26:03.0000000' AS DateTime2), 187, N'142279', N'Obolensk', N'8927', N'Ronald Regan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (278, N'Waring', N'Gershom', CAST(N'1974-08-29T11:10:12.0000000' AS DateTime2), 223, N'5180-344', N'Poiares', N'5', N'Schurz', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (279, N'Renato', N'Curless', CAST(N'1992-11-06T18:08:33.0000000' AS DateTime2), 10, NULL, N'Xixiang', N'15056', N'Ryan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (280, N'Cindee', N'Majury', CAST(N'1988-05-29T04:51:16.0000000' AS DateTime2), 91, NULL, N'Gaoshibei', N'997', N'Comanche', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (281, N'Ruthi', N'Lesor', CAST(N'1973-01-30T09:12:09.0000000' AS DateTime2), 211, N'3530', N'Quitilipi', N'537', N'Gulseth', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (282, N'Berrie', N'Callacher', CAST(N'2002-08-27T19:02:23.0000000' AS DateTime2), 80, N'3070-125', N'Ermida', N'430', N'Kingsford', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (283, N'Lynnet', N'Paulillo', CAST(N'1972-05-27T10:39:00.0000000' AS DateTime2), 3, N'665375', N'Kimil’tey', N'1', N'Eastlawn', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (284, N'Lucias', N'Fellini', CAST(N'2003-12-12T03:39:58.0000000' AS DateTime2), 119, NULL, N'Apuri', N'52', N'Dexter', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (285, N'Rodie', N'Jone', CAST(N'1999-09-09T03:40:56.0000000' AS DateTime2), 46, N'8657', N'Mosjøen', N'886', N'Buell', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (286, N'Sybille', N'Gumn', CAST(N'1975-06-18T13:58:08.0000000' AS DateTime2), 210, NULL, N'Qidu', N'00', N'Schlimgen', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (287, N'Emmet', N'Tartt', CAST(N'1974-04-24T22:42:51.0000000' AS DateTime2), 109, N'32-327', N'Nowa Góra', N'874', N'Oakridge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (288, N'Nancey', N'Hollyer', CAST(N'2005-03-03T22:38:48.0000000' AS DateTime2), 126, NULL, N'Kijang', N'160', N'Comanche', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (289, N'Britte', N'Massie', CAST(N'1989-11-11T07:52:57.0000000' AS DateTime2), 40, NULL, N'Jevremovac', N'37656', N'Little Fleur', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (290, N'Royall', N'Coysh', CAST(N'1983-12-07T00:20:15.0000000' AS DateTime2), 210, N'603 86', N'Norrköping', N'6', N'Heffernan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (291, N'Thomas', N'Marples', CAST(N'1976-12-21T21:59:47.0000000' AS DateTime2), 31, NULL, N'Shiquan', N'18774', N'Moose', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (292, N'Deonne', N'Eckert', CAST(N'1978-11-24T19:05:07.0000000' AS DateTime2), 17, NULL, N'Sukamaju', N'41102', N'Butternut', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (293, N'Isaiah', N'Maier', CAST(N'2005-02-14T21:31:59.0000000' AS DateTime2), 179, N'5711', N'Boston', N'28296', N'Ramsey', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (294, N'Giulietta', N'Zimmermanns', CAST(N'1982-08-31T13:05:50.0000000' AS DateTime2), 63, NULL, N'Serednye Vodyane', N'2493', N'West', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (295, N'Grazia', N'Elmhurst', CAST(N'1978-03-01T18:52:54.0000000' AS DateTime2), 36, N'157510', N'Shar’ya', N'551', N'North', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (296, N'Clyde', N'McCorkindale', CAST(N'1990-02-06T19:11:30.0000000' AS DateTime2), 152, NULL, N'Krajan Tegalombo', N'03', N'Northview', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (297, N'Jonis', N'Daice', CAST(N'1977-11-07T11:51:45.0000000' AS DateTime2), 196, N'77-141', N'Borzytuchom', N'099', N'Crest Line', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (298, N'Luella', N'Scahill', CAST(N'1988-06-20T04:23:42.0000000' AS DateTime2), 184, N'V14', N'Rathdrum', N'76', N'Fairview', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (299, N'Elisha', N'Lyal', CAST(N'1972-12-30T02:55:58.0000000' AS DateTime2), 171, NULL, N'Yaojiagou', N'3749', N'Elka', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (300, N'Klaus', N'Dougal', CAST(N'1974-05-21T15:13:28.0000000' AS DateTime2), 137, N'667 01', N'Židlochovice', N'007', N'Mallard', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (301, N'Tilly', N'Weaben', CAST(N'1972-11-13T04:09:22.0000000' AS DateTime2), 87, NULL, N'Shicha', N'453', N'Glendale', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (302, N'Nola', N'Sinclaire', CAST(N'2003-04-18T02:32:32.0000000' AS DateTime2), 104, N'9488', N'Welkom', N'03', N'Graedel', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (303, N'Wenona', N'Wisdish', CAST(N'1973-01-12T08:31:09.0000000' AS DateTime2), 199, N'4023', N'San Pedro', N'90', N'Mifflin', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (304, N'Brantley', N'Hambly', CAST(N'1986-01-14T16:24:49.0000000' AS DateTime2), 195, NULL, N'Khafizan', N'8', N'Erie', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (305, N'Felita', N'Ende', CAST(N'1974-10-07T00:17:06.0000000' AS DateTime2), 153, NULL, N'Made', N'4', N'Marquette', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (306, N'Wade', N'Proffer', CAST(N'1974-08-22T07:28:26.0000000' AS DateTime2), 149, N'2727', N'Cabittaogan', N'322', N'Delladonna', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (307, N'Taddeo', N'Rentcome', CAST(N'1975-07-01T00:17:39.0000000' AS DateTime2), 194, NULL, N'Tapakrejo', N'4', N'Spohn', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (308, N'Dewie', N'Novakovic', CAST(N'1974-03-30T04:46:05.0000000' AS DateTime2), 208, NULL, N'Camasca', N'7510', N'Westerfield', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (309, N'Serge', N'Rosenberg', CAST(N'1983-03-02T03:39:35.0000000' AS DateTime2), 43, N'563 01', N'Strážná', N'8', N'Granby', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (310, N'Petronia', N'Jacobbe', CAST(N'1984-09-05T10:06:22.0000000' AS DateTime2), 71, NULL, N'Banjarbaru', N'42415', N'Melody', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (311, N'Carlen', N'Mc Ilory', CAST(N'1993-08-11T14:41:04.0000000' AS DateTime2), 29, N'9214', N'Rebe', N'428', N'Bowman', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (312, N'Briggs', N'Netherclift', CAST(N'1988-09-01T11:25:04.0000000' AS DateTime2), 180, N'65810', N'Springfield', N'703', N'Mcbride', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (313, N'Christian', N'Damper', CAST(N'1995-05-21T12:42:03.0000000' AS DateTime2), 86, NULL, N'Dongsheng', N'52582', N'Corry', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (314, N'Dolli', N'Cholonin', CAST(N'1995-02-15T03:17:10.0000000' AS DateTime2), 21, N'77281', N'Houston', N'82', N'Rigney', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (315, N'Elicia', N'Heake', CAST(N'1991-06-15T23:07:03.0000000' AS DateTime2), 135, NULL, N'Mstsislaw', N'2998', N'Karstens', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (316, N'Jodie', N'Le Sieur', CAST(N'2002-12-25T02:52:05.0000000' AS DateTime2), 74, N'445359', N'Zhigulevsk', N'42460', N'Green Ridge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (317, N'Standford', N'Clayborn', CAST(N'1997-08-28T03:07:39.0000000' AS DateTime2), 124, NULL, N'Baiguo', N'67895', N'7th', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (318, N'Ulises', N'Klehn', CAST(N'1992-03-27T03:51:34.0000000' AS DateTime2), 42, NULL, N'Guzhen', N'4', N'Lighthouse Bay', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (319, N'Erv', N'Pendrigh', CAST(N'1974-10-29T05:30:21.0000000' AS DateTime2), 183, NULL, N'Kulonkali', N'333', N'Onsgard', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (320, N'Mitchell', N'Lethieulier', CAST(N'1986-12-04T10:07:34.0000000' AS DateTime2), 108, N'433310', N'Isheyevka', N'5', N'Kropf', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (321, N'Garner', N'Deary', CAST(N'2001-04-25T02:55:33.0000000' AS DateTime2), 13, NULL, N'Gechuan', N'19152', N'Commercial', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (322, N'Cordy', N'Thridgould', CAST(N'1999-02-23T04:43:29.0000000' AS DateTime2), 222, N'49082', N'Osnabrück', N'8', N'Moulton', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (323, N'Hamel', N'Marchment', CAST(N'1999-09-18T11:29:29.0000000' AS DateTime2), 105, NULL, N'Gwangtan', N'01200', N'Hooker', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (324, N'Levey', N'Strewthers', CAST(N'1984-06-21T14:11:28.0000000' AS DateTime2), 181, N'144 30', N'Rönninge', N'3', N'Blackbird', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (325, N'Alfonse', N'Lukock', CAST(N'1971-03-19T03:32:13.0000000' AS DateTime2), 41, N'164670', N'Leshukonskoye', N'495', N'Red Cloud', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (326, N'Sayre', N'Tetlow', CAST(N'1998-01-13T00:17:29.0000000' AS DateTime2), 138, NULL, N'Handaqi', N'84556', N'Texas', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (327, N'Matty', N'Waldocke', CAST(N'1976-01-22T00:46:48.0000000' AS DateTime2), 124, NULL, N'Brokopondo', N'1565', N'Hollow Ridge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (328, N'Rubie', N'Aggus', CAST(N'1992-02-06T10:01:21.0000000' AS DateTime2), 115, NULL, N'Irshava', N'9223', N'Gateway', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (329, N'Bobette', N'Tsarovic', CAST(N'1997-03-11T22:08:09.0000000' AS DateTime2), 225, N'73700-000', N'Padre Bernardo', N'40', N'Riverside', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (330, N'Whitby', N'Piddle', CAST(N'2005-07-03T07:04:21.0000000' AS DateTime2), 16, NULL, N'Baolong', N'32752', N'Melrose', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (331, N'Valle', N'Baradel', CAST(N'2005-07-10T10:50:50.0000000' AS DateTime2), 84, N'4726', N'Capayán', N'08', N'Maryland', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (332, N'Beilul', N'Hasney', CAST(N'1984-09-20T13:58:56.0000000' AS DateTime2), 3, N'544 75', N'Zadní Mostek', N'1', N'Mallory', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (333, N'Suzette', N'Kopta', CAST(N'1971-05-11T18:06:02.0000000' AS DateTime2), 1, NULL, N'Yitang', N'8330', N'Oriole', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (334, N'Nicki', N'Bauman', CAST(N'1995-10-16T23:14:40.0000000' AS DateTime2), 77, N'16130', N'Bang Racham', N'43426', N'Carioca', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (335, N'Antoine', N'Kimble', CAST(N'1972-07-01T08:08:57.0000000' AS DateTime2), 220, N'87030 CEDEX 1', N'Limoges', N'703', N'Main', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (336, N'Alethea', N'Seargeant', CAST(N'1987-04-27T04:06:09.0000000' AS DateTime2), 21, N'347686', N'Krivyanskaya', N'333', N'Kinsman', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (337, N'Nickolas', N'Riordan', CAST(N'2001-02-23T13:40:04.0000000' AS DateTime2), 74, N'4635-115', N'Cortinhas', N'414', N'Marcy', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (338, N'Ronica', N'Claughton', CAST(N'2003-09-30T20:03:06.0000000' AS DateTime2), 28, N'251017', N'Gachancipá', N'92', N'Shopko', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (339, N'Marlena', N'Jocelyn', CAST(N'1994-09-16T15:25:35.0000000' AS DateTime2), 170, NULL, N'Xiaoyi', N'3', N'Lillian', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (340, N'Gwenni', N'Skoof', CAST(N'1999-02-04T11:44:32.0000000' AS DateTime2), 154, N'2718', N'Cervantes', N'07', N'Badeau', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (341, N'Pascale', N'Earpe', CAST(N'1987-11-15T21:46:32.0000000' AS DateTime2), 12, N'665229', N'Ikey', N'729', N'Rowland', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (342, N'Patrizius', N'Delicate', CAST(N'1981-04-13T16:01:36.0000000' AS DateTime2), 45, N'5935', N'Villa Ascasubi', N'89', N'Bobwhite', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (343, N'Yul', N'Hefford', CAST(N'1999-01-13T17:34:49.0000000' AS DateTime2), 96, NULL, N'Qukou', N'95', N'Blaine', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (344, N'Gilberto', N'Lacase', CAST(N'1973-08-22T17:40:45.0000000' AS DateTime2), 181, N'330 02', N'Dýšina', N'6', N'Raven', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (345, N'Zarla', N'Withull', CAST(N'1991-10-04T10:30:36.0000000' AS DateTime2), 228, N'K45', N'Lusk', N'04', N'Mallard', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (346, N'Farly', N'Bracey', CAST(N'1973-08-05T05:39:36.0000000' AS DateTime2), 56, N'12022', N'Pajapita', N'34814', N'Buena Vista', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (347, N'Camile', N'Bulpitt', CAST(N'2003-09-27T20:08:35.0000000' AS DateTime2), 160, NULL, N'Haci Zeynalabdin', N'28', N'Almo', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (348, N'Haywood', N'Hodjetts', CAST(N'1978-06-18T05:57:27.0000000' AS DateTime2), 98, NULL, N'Chaoyang', N'70', N'Elmside', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (349, N'Bari', N'Adkin', CAST(N'1988-02-05T12:36:29.0000000' AS DateTime2), 132, NULL, N'Mochumí', N'78', N'Carey', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (350, N'Aloisia', N'Lanchberry', CAST(N'1981-04-14T19:16:20.0000000' AS DateTime2), 5, N'39390-000', N'Bocaiúva', N'739', N'Center', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (351, N'Chicky', N'Caston', CAST(N'1986-03-21T18:21:26.0000000' AS DateTime2), 204, N'98-160', N'Sedziejowice', N'27148', N'Katie', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (352, N'Faith', N'Kauschke', CAST(N'1988-06-24T07:45:41.0000000' AS DateTime2), 109, NULL, N'Hu?', N'762', N'Hooker', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (353, N'Emmy', N'Gruszka', CAST(N'1996-11-13T23:38:14.0000000' AS DateTime2), 203, NULL, N'Hongyang', N'2', N'Nova', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (354, N'Janaye', N'Winridge', CAST(N'1978-05-19T08:52:20.0000000' AS DateTime2), 226, N'31110', N'Non Suwan', N'8964', N'Elka', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (355, N'Thurstan', N'Fideler', CAST(N'1978-05-31T11:31:36.0000000' AS DateTime2), 225, NULL, N'Margoyoso', N'0703', N'Utah', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (356, N'Langsdon', N'Spaule', CAST(N'1993-10-11T12:06:37.0000000' AS DateTime2), 85, N'85271', N'Scottsdale', N'624', N'Milwaukee', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (357, N'Patience', N'Whether', CAST(N'2000-12-03T12:02:41.0000000' AS DateTime2), 75, NULL, N'Telouet', N'1', N'Arizona', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (358, N'Teodora', N'Bompass', CAST(N'1971-12-20T07:42:12.0000000' AS DateTime2), 162, N'756 27', N'Valašská Bystrice', N'82', N'Swallow', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (359, N'Shae', N'Amyes', CAST(N'1985-06-14T06:09:17.0000000' AS DateTime2), 87, NULL, N'Buga', N'1705', N'Sachs', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (360, N'Consuelo', N'Esser', CAST(N'1979-02-11T16:56:53.0000000' AS DateTime2), 65, NULL, N'Liangyaping', N'13', N'Merry', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (361, N'Reggi', N'Clements', CAST(N'1977-11-27T10:47:59.0000000' AS DateTime2), 96, NULL, N'Murmuiža', N'82170', N'Clemons', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (362, N'Tresa', N'Asher', CAST(N'1983-09-23T20:22:21.0000000' AS DateTime2), 154, N'92170', N'San Diego', N'0', N'Thompson', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (363, N'Marwin', N'Primarolo', CAST(N'1980-05-05T02:49:00.0000000' AS DateTime2), 18, N'94785 CEDEX', N'Vitry-sur-Seine', N'27054', N'Glacier Hill', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (364, N'Uri', N'Wressell', CAST(N'1988-05-09T17:12:36.0000000' AS DateTime2), 27, N'6813', N'Mayo', N'793', N'Blackbird', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (365, N'Bobby', N'Shutle', CAST(N'1979-05-18T17:38:04.0000000' AS DateTime2), 44, N'641080', N'Safakulevo', N'50', N'1st', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (366, N'Conni', N'Dax', CAST(N'1982-01-18T12:45:46.0000000' AS DateTime2), 167, N'13670-000', N'Santa Rita do Passa Quatro', N'7756', N'Logan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (367, N'Glenine', N'Petters', CAST(N'1972-02-26T08:08:24.0000000' AS DateTime2), 181, N'168 32', N'Bromma', N'6422', N'Sundown', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (368, N'Lem', N'Marcoolyn', CAST(N'1990-01-19T16:27:57.0000000' AS DateTime2), 168, N'30935 CEDEX 9', N'Nîmes', N'82', N'Melrose', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (369, N'Carrie', N'Coiley', CAST(N'1971-03-09T07:36:27.0000000' AS DateTime2), 143, N'13409', N'Berlin', N'79', N'Bayside', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (370, N'Ethelda', N'Waine', CAST(N'1973-09-16T15:30:13.0000000' AS DateTime2), 117, NULL, N'Zomba', N'8915', N'Porter', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (371, N'Thorny', N'Dressel', CAST(N'1987-02-10T21:03:07.0000000' AS DateTime2), 186, NULL, N'Harhorin', N'613', N'Hanson', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (372, N'Harley', N'Musslewhite', CAST(N'1976-10-20T15:12:42.0000000' AS DateTime2), 162, N'4500', N'Bascaron', N'64679', N'Ludington', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (373, N'Alanah', N'Rimour', CAST(N'1973-03-23T19:11:13.0000000' AS DateTime2), 90, N'37-723', N'Stubno', N'25', N'Killdeer', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (374, N'Consolata', N'Cuddehy', CAST(N'1993-12-11T19:48:42.0000000' AS DateTime2), 18, N'4242', N'Tostado', N'36', N'Crest Line', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (375, N'Lucretia', N'Radden', CAST(N'1972-03-02T11:53:24.0000000' AS DateTime2), 196, NULL, N'San José de Río Tinto', N'548', N'Parkside', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (376, N'Drucill', N'Mougeot', CAST(N'2000-04-16T04:23:08.0000000' AS DateTime2), 198, NULL, N'Blagaj', N'0', N'Farragut', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (377, N'Antin', N'Brocklesby', CAST(N'1988-06-10T21:59:09.0000000' AS DateTime2), 81, NULL, N'Podbuzh', N'5664', N'Declaration', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (378, N'Garrik', N'Laye', CAST(N'2003-04-04T11:18:27.0000000' AS DateTime2), 159, NULL, N'Gostovici', N'8780', N'Merry', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (379, N'Rustie', N'Cotte', CAST(N'1981-06-16T11:46:36.0000000' AS DateTime2), 79, N'71605', N'Guadalupe', N'9889', N'Wayridge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (380, N'Madelon', N'O''Sesnane', CAST(N'1982-09-06T14:15:43.0000000' AS DateTime2), 160, N'919-0222', N'Hino', N'99', N'7th', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (381, N'Carley', N'Varley', CAST(N'1978-01-24T00:44:41.0000000' AS DateTime2), 168, N'114 84', N'Stockholm', N'477', N'Sheridan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (382, N'Rosalinda', N'Vallack', CAST(N'1976-05-15T07:03:24.0000000' AS DateTime2), 217, N'592 40', N'Vadstena', N'4', N'Cody', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (383, N'Kevyn', N'Broadbere', CAST(N'1999-01-17T07:11:05.0000000' AS DateTime2), 104, NULL, N'Bizerte', N'546', N'Arkansas', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (384, N'Theresita', N'Rudsdale', CAST(N'1989-10-08T16:44:13.0000000' AS DateTime2), 179, NULL, N'Olupona', N'24872', N'Stang', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (385, N'Renell', N'Nott', CAST(N'2000-07-25T18:01:48.0000000' AS DateTime2), 229, NULL, N'Kulpin', N'638', N'Cottonwood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (386, N'Alec', N'Beckmann', CAST(N'1976-08-15T18:32:25.0000000' AS DateTime2), 163, NULL, N'Na?ay', N'6', N'Anhalt', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (387, N'Luelle', N'Btham', CAST(N'1988-12-07T04:34:42.0000000' AS DateTime2), 140, NULL, N'Lampuyang', N'184', N'Continental', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (388, N'Cyndie', N'Hardson', CAST(N'1971-10-19T16:42:20.0000000' AS DateTime2), 15, N'6545', N'Kawayan', N'37', N'Daystar', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (389, N'El', N'Guitte', CAST(N'1983-03-06T16:08:15.0000000' AS DateTime2), 217, NULL, N'San Francisco', N'08322', N'Truax', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (390, N'Rebeca', N'McIntee', CAST(N'2002-05-10T02:05:19.0000000' AS DateTime2), 30, NULL, N'Hongmiao', N'028', N'Lien', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (391, N'Pauletta', N'Turnbull', CAST(N'1999-09-02T12:02:23.0000000' AS DateTime2), 183, NULL, N'Meiyuan', N'689', N'Colorado', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (392, N'Shaine', N'Dibdin', CAST(N'1993-05-07T05:18:54.0000000' AS DateTime2), 144, N'4655', N'La Cruz', N'25333', N'Troy', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (393, N'Llewellyn', N'Marple', CAST(N'1992-08-07T14:22:25.0000000' AS DateTime2), 189, NULL, N'Sandaohezi', N'2', N'Petterle', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (394, N'Rory', N'Bicksteth', CAST(N'1995-11-13T06:12:12.0000000' AS DateTime2), 87, NULL, N'Peranap', N'8', N'Monterey', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (395, N'Andie', N'Salerg', CAST(N'1993-02-19T00:09:26.0000000' AS DateTime2), 31, N'12683', N'Berlin', N'323', N'Oxford', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (396, N'Goddard', N'Aggiss', CAST(N'2004-04-29T11:05:58.0000000' AS DateTime2), 223, N'9674', N'Winschoten', N'476', N'Oak', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (397, N'Tobie', N'Sired', CAST(N'1983-03-11T02:38:03.0000000' AS DateTime2), 185, NULL, N'Incheon', N'452', N'Killdeer', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (398, N'Nessy', N'Farriar', CAST(N'1992-04-11T20:19:07.0000000' AS DateTime2), 51, N'K36', N'Malahide', N'37', N'South', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (399, N'Lynnett', N'Saville', CAST(N'2001-12-18T17:03:02.0000000' AS DateTime2), 63, N'46852', N'Fort Wayne', N'933', N'Kim', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (400, N'Lexy', N'Garioch', CAST(N'1988-02-28T05:39:50.0000000' AS DateTime2), 220, N'13495-000', N'Iracemápolis', N'234', N'Evergreen', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (401, N'Berkeley', N'Wilmut', CAST(N'1977-12-30T04:20:56.0000000' AS DateTime2), 230, NULL, N'Guantian', N'87', N'Bluejay', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (402, N'Sallyann', N'Harden', CAST(N'1992-11-04T20:22:18.0000000' AS DateTime2), 141, N'192289', N'Severo-Yeniseyskiy', N'7', N'Annamark', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (403, N'Burt', N'MacAfee', CAST(N'1983-08-13T10:55:06.0000000' AS DateTime2), 162, NULL, N'Zolotyy Potik', N'11', N'Merchant', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (404, N'Frederique', N'Skade', CAST(N'1990-09-10T00:28:51.0000000' AS DateTime2), 108, N'12280-000', N'Caçapava', N'92419', N'Manufacturers', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (405, N'Sisile', N'Dowall', CAST(N'1983-03-16T12:08:10.0000000' AS DateTime2), 102, N'4806', N'Panganiban', N'91258', N'Buell', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (406, N'Karyl', N'Blay', CAST(N'1975-01-01T17:39:20.0000000' AS DateTime2), 119, N'K8B', N'Pembroke', N'6831', N'North', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (407, N'Udale', N'Ander', CAST(N'2001-05-11T19:50:44.0000000' AS DateTime2), 57, N'660004', N'Solnechnyy', N'10820', N'Messerschmidt', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (408, N'Ardine', N'Gonnin', CAST(N'1987-10-04T03:50:13.0000000' AS DateTime2), 104, N'620995', N'Shirokaya Rechka', N'70', N'Corry', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (409, N'Farah', N'Lyness', CAST(N'1971-10-25T07:49:43.0000000' AS DateTime2), 91, NULL, N'Aíyira', N'33801', N'Ronald Regan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (410, N'Clem', N'Wintle', CAST(N'1997-06-07T00:13:50.0000000' AS DateTime2), 190, NULL, N'Zahvizdya', N'16', N'Banding', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (411, N'Pammi', N'Laydel', CAST(N'1997-05-16T09:14:27.0000000' AS DateTime2), 149, NULL, N'Kapuan', N'72677', N'Village Green', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (412, N'Rubie', N'Mariault', CAST(N'1976-07-11T20:08:57.0000000' AS DateTime2), 115, NULL, N'Xinjian', N'59', N'Kings', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (413, N'Ettie', N'MacCathay', CAST(N'1985-04-02T22:25:45.0000000' AS DateTime2), 110, N'9663', N'Bothaville', N'8', N'Eagan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (414, N'Creight', N'Jobey', CAST(N'2004-02-18T08:35:02.0000000' AS DateTime2), 105, N'085068', N'Luruaco', N'6275', N'Orin', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (415, N'Damaris', N'Petrashov', CAST(N'1982-02-03T13:28:04.0000000' AS DateTime2), 174, NULL, N'Tlogosari', N'04', N'Lotheville', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (416, N'Arlen', N'Knox', CAST(N'1974-06-26T09:55:22.0000000' AS DateTime2), 152, N'33010 CEDEX', N'Bordeaux', N'50', N'Pawling', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (417, N'Armand', N'Nipper', CAST(N'1981-07-06T00:38:31.0000000' AS DateTime2), 187, NULL, N'Qingyang', N'6705', N'Oakridge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (418, N'Kyle', N'Witherop', CAST(N'1985-08-16T17:15:42.0000000' AS DateTime2), 186, N'11630-000', N'Ilhabela', N'6845', N'Dryden', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (419, N'Lenora', N'Breawood', CAST(N'1986-03-27T20:41:49.0000000' AS DateTime2), 167, N'2671', N'General Viamonte', N'6851', N'Stone Corner', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (420, N'Rodi', N'Doul', CAST(N'1974-05-31T23:45:45.0000000' AS DateTime2), 164, NULL, N'Staryy Krym', N'08', N'Ramsey', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (421, N'Werner', N'Musprat', CAST(N'1982-06-10T20:17:40.0000000' AS DateTime2), 174, NULL, N'Charopó', N'68650', N'Dahle', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (422, N'Minni', N'Ronald', CAST(N'1979-10-29T06:00:31.0000000' AS DateTime2), 155, NULL, N'Gikongoro', N'8', N'Wayridge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (423, N'Jobie', N'Trickett', CAST(N'1977-07-11T08:12:18.0000000' AS DateTime2), 102, NULL, N'Zapatero', N'7', N'Upham', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (424, N'Roselin', N'Yurocjhin', CAST(N'1985-05-18T16:10:12.0000000' AS DateTime2), 105, NULL, N'Chuanbu', N'868', N'Holmberg', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (425, N'Andie', N'Giovannoni', CAST(N'1993-07-11T04:36:15.0000000' AS DateTime2), 2, N'76600-000', N'Goiás', N'9227', N'Elmside', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (426, N'Stewart', N'Basso', CAST(N'1998-06-02T18:58:42.0000000' AS DateTime2), 143, N'353769', N'Krylovskaya', N'6904', N'Vahlen', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (427, N'Andriana', N'Iozefovich', CAST(N'2003-11-25T09:33:48.0000000' AS DateTime2), 154, NULL, N'Aqsu', N'450', N'Sycamore', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (428, N'Misti', N'Romke', CAST(N'1996-01-14T14:12:56.0000000' AS DateTime2), 2, N'4480-014', N'Arcos', N'777', N'Blaine', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (429, N'Cordey', N'Cattroll', CAST(N'1989-09-25T07:11:57.0000000' AS DateTime2), 71, N'68660', N'Jakobstad', N'7627', N'Nobel', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (430, N'Eleonore', N'Ride', CAST(N'2001-12-28T12:19:10.0000000' AS DateTime2), 178, NULL, N'Wailebe', N'11724', N'Dixon', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (431, N'Heida', N'Le Blanc', CAST(N'1987-02-13T17:47:51.0000000' AS DateTime2), 144, N'2435-609', N'Seiça', N'72', N'Leroy', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (432, N'Briny', N'Dronsfield', CAST(N'1997-09-05T23:59:36.0000000' AS DateTime2), 113, N'880028', N'Providencia', N'66', N'Russell', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (433, N'Whitman', N'Flanders', CAST(N'1985-08-10T15:23:48.0000000' AS DateTime2), 182, NULL, N'Al Fayyum', N'4471', N'Warner', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (434, N'Wenonah', N'Taw', CAST(N'1992-07-03T15:57:01.0000000' AS DateTime2), 83, N'184621', N'Safonovo', N'149', N'Badeau', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (435, N'Gisele', N'Frenzl', CAST(N'1991-02-08T17:25:58.0000000' AS DateTime2), 135, NULL, N'Probolinggo', N'181', N'Lyons', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (436, N'Gwenni', N'Witchell', CAST(N'1971-12-07T02:57:38.0000000' AS DateTime2), 227, NULL, N'Tanagara', N'676', N'Towne', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (437, N'Hasty', N'Butcher', CAST(N'1988-02-15T12:00:41.0000000' AS DateTime2), 147, NULL, N'Purwosari', N'1', N'Iowa', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (438, N'Randolf', N'Pering', CAST(N'1981-02-14T19:39:04.0000000' AS DateTime2), 115, N'01059', N'San Juan Sacatepéquez', N'2', N'Crowley', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (439, N'Brantley', N'Allinson', CAST(N'1997-12-17T05:46:46.0000000' AS DateTime2), 31, NULL, N'Bantarmangu', N'42', N'Dunning', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (440, N'Ozzie', N'Armytage', CAST(N'2005-06-09T09:46:12.0000000' AS DateTime2), 15, N'100 52', N'Stockholm', N'3969', N'Nobel', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (441, N'Hali', N'Adenet', CAST(N'1998-06-25T10:23:45.0000000' AS DateTime2), 134, N'35000-000', N'Governador Valadares', N'9', N'Valley Edge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (442, N'Filberte', N'Trussler', CAST(N'1986-04-24T15:31:46.0000000' AS DateTime2), 198, NULL, N'Rasony', N'8758', N'Sutteridge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (443, N'Randee', N'Rivelin', CAST(N'2001-01-18T01:13:46.0000000' AS DateTime2), 96, NULL, N'Nacala', N'7', N'Ilene', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (444, N'Cornelle', N'Perrycost', CAST(N'2002-05-12T23:57:14.0000000' AS DateTime2), 158, N'8505', N'Pápa', N'611', N'Hollow Ridge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (445, N'Nerta', N'Gianulli', CAST(N'1988-05-13T09:07:23.0000000' AS DateTime2), 78, NULL, N'Oenpeotnai', N'70', N'Redwing', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (446, N'Alika', N'Benny', CAST(N'1975-07-31T18:16:21.0000000' AS DateTime2), 220, NULL, N'Tangxian', N'314', N'Express', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (447, N'Maighdiln', N'Pharro', CAST(N'1990-01-25T12:55:02.0000000' AS DateTime2), 45, NULL, N'Youludu Sibage', N'959', N'Kennedy', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (448, N'Hillary', N'McIlhone', CAST(N'1999-10-13T20:36:26.0000000' AS DateTime2), 180, NULL, N'Aibura', N'6153', N'Texas', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (449, N'Valdemar', N'Bathersby', CAST(N'1998-03-06T00:50:53.0000000' AS DateTime2), 85, N'5254', N'Paraparaumu', N'4', N'Columbus', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (450, N'Hana', N'Kleinsmuntz', CAST(N'1979-04-26T13:29:59.0000000' AS DateTime2), 98, N'8400-603', N'Parchal', N'1804', N'Arizona', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (451, N'Miles', N'Slograve', CAST(N'1999-05-08T01:31:34.0000000' AS DateTime2), 101, N'5120', N'Laboulaye', N'874', N'Meadow Ridge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (452, N'Jamie', N'Quodling', CAST(N'1973-10-30T13:57:07.0000000' AS DateTime2), 146, N'660017', N'Pereira', N'887', N'Namekagon', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (453, N'Terese', N'Voyce', CAST(N'1971-04-14T13:02:19.0000000' AS DateTime2), 215, N'86-122', N'Bukowiec', N'5', N'Bonner', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (454, N'Janelle', N'Camfield', CAST(N'1998-06-21T22:04:26.0000000' AS DateTime2), 160, NULL, N'Guanyang', N'10', N'Warbler', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (455, N'Nikaniki', N'Short', CAST(N'2001-06-06T08:23:56.0000000' AS DateTime2), 125, NULL, N'Yahotyn', N'9732', N'Nevada', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (456, N'Mag', N'Yallowley', CAST(N'1988-05-13T05:10:17.0000000' AS DateTime2), 112, NULL, N'A’ershan', N'79', N'Trailsway', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (457, N'Gail', N'Baigent', CAST(N'1974-05-18T23:29:29.0000000' AS DateTime2), 19, N'1430', N'Kavadarci', N'22', N'Oriole', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (458, N'Analiese', N'Sankey', CAST(N'1981-12-22T11:18:56.0000000' AS DateTime2), 7, NULL, N'Ya’erya', N'280', N'Village', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (459, N'Gaelan', N'Kaubisch', CAST(N'1984-12-21T17:25:58.0000000' AS DateTime2), 75, NULL, N'Lëbushë', N'2', N'Monument', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (460, N'Wolfgang', N'Streatley', CAST(N'1993-02-23T10:43:45.0000000' AS DateTime2), 92, N'69924 CEDEX', N'Oullins', N'77458', N'Hudson', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (461, N'Gardie', N'Cuppitt', CAST(N'1989-09-10T20:28:59.0000000' AS DateTime2), 18, N'50923', N'Kuala Lumpur', N'34', N'Ryan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (462, N'Mar', N'Jerzykiewicz', CAST(N'1998-04-01T06:34:04.0000000' AS DateTime2), 39, N'4690-588', N'Vila Nova', N'59664', N'Clove', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (463, N'Sarita', N'Bernardin', CAST(N'1983-04-11T11:52:35.0000000' AS DateTime2), 181, NULL, N'Guxi', N'72249', N'Iowa', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (464, N'Filippo', N'Breed', CAST(N'1995-03-11T22:02:31.0000000' AS DateTime2), 85, N'938-0014', N'Ueki', N'09', N'Autumn Leaf', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (465, N'Antonin', N'Stannislawski', CAST(N'1970-10-21T13:12:17.0000000' AS DateTime2), 30, N'00971', N'Guaynabo', N'89', N'Lunder', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (466, N'Christoper', N'Capper', CAST(N'1974-07-09T06:57:08.0000000' AS DateTime2), 111, NULL, N'Tintafor', N'0', N'Warner', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (467, N'Marcela', N'Gieves', CAST(N'1974-09-14T02:59:30.0000000' AS DateTime2), 206, NULL, N'Khanaqah', N'2099', N'Hermina', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (468, N'Obadiah', N'Dockrell', CAST(N'1982-08-08T02:48:49.0000000' AS DateTime2), 188, NULL, N'Cañete', N'59782', N'Lindbergh', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (469, N'Deedee', N'Simmens', CAST(N'1985-01-14T02:15:43.0000000' AS DateTime2), 157, N'69475-000', N'Alvarães', N'320', N'Harper', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (470, N'Tammy', N'Krelle', CAST(N'1970-11-12T14:21:47.0000000' AS DateTime2), 222, N'4215', N'Guinabsan', N'73', N'1st', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (471, N'Chane', N'Ventris', CAST(N'1983-04-14T05:39:21.0000000' AS DateTime2), 10, N'2420-173', N'Agodim', N'00', N'Service', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (472, N'Jasmin', N'Jacobsson', CAST(N'1990-10-13T13:41:44.0000000' AS DateTime2), 131, N'709-4306', N'Mino', N'55', N'Killdeer', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (473, N'Clive', N'Yetts', CAST(N'2004-12-03T05:49:49.0000000' AS DateTime2), 226, N'40510', N'Lexington', N'43402', N'Acker', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (474, N'Isabella', N'Gabits', CAST(N'1972-07-26T03:01:22.0000000' AS DateTime2), 121, N'03017', N'San Miguel Dueñas', N'5', N'Maywood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (475, N'Gillie', N'Popland', CAST(N'1997-10-29T08:49:03.0000000' AS DateTime2), 51, NULL, N'Nara', N'8735', N'Coolidge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (476, N'Brnaby', N'Carnie', CAST(N'2003-02-23T14:07:13.0000000' AS DateTime2), 54, NULL, N'Llano de Piedra', N'415', N'Hudson', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (477, N'Nicolai', N'Stroder', CAST(N'1973-03-15T22:23:40.0000000' AS DateTime2), 82, N'663490', N'Kodinsk', N'0279', N'Waxwing', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (478, N'Pattin', N'Cristou', CAST(N'1995-05-02T13:01:57.0000000' AS DateTime2), 222, NULL, N'Camilaca', N'2786', N'Division', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (479, N'Burt', N'Dymock', CAST(N'1993-07-28T05:17:40.0000000' AS DateTime2), 93, NULL, N'Longquan', N'8', N'Bartelt', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (480, N'Ira', N'Tournie', CAST(N'1991-11-06T16:57:25.0000000' AS DateTime2), 28, NULL, N'Yangzhong', N'6780', N'International', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (481, N'Ame', N'Lambertini', CAST(N'1973-04-13T02:09:28.0000000' AS DateTime2), 106, N'47894', N'Poggio di Chiesanuova', N'8234', N'Merry', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (482, N'Michele', N'Robardley', CAST(N'1991-05-05T18:56:37.0000000' AS DateTime2), 180, N'37-403', N'Pysznica', N'31', N'Fuller', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (483, N'Tamar', N'Smorthit', CAST(N'1989-01-18T18:55:10.0000000' AS DateTime2), 192, N'92727 CEDEX', N'Nanterre', N'0897', N'Morning', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (484, N'Hugo', N'Bladon', CAST(N'1982-07-11T14:30:27.0000000' AS DateTime2), 175, NULL, N'Zhoujia', N'8266', N'Twin Pines', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (485, N'Armstrong', N'Farron', CAST(N'1999-12-12T21:16:38.0000000' AS DateTime2), 202, NULL, N'Divjakë', N'1', N'Center', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (486, N'Chaddie', N'Meeron', CAST(N'1994-03-31T22:27:24.0000000' AS DateTime2), 4, NULL, N'Huangsha', N'17714', N'Roxbury', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (487, N'Cullen', N'Lavrick', CAST(N'1982-12-25T14:47:11.0000000' AS DateTime2), 230, NULL, N'Zaltan', N'8503', N'Kipling', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (488, N'Petronia', N'Roumier', CAST(N'1986-07-07T20:36:40.0000000' AS DateTime2), 101, N'16999 CEDEX 9', N'Angoulême', N'2', N'Gina', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (489, N'Hilario', N'Downey', CAST(N'1996-10-26T19:46:14.0000000' AS DateTime2), 128, NULL, N'Indramayu', N'8462', N'Gulseth', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (490, N'Brande', N'Lorimer', CAST(N'1998-06-16T01:14:45.0000000' AS DateTime2), 103, N'33130', N'Nam Kliang', N'1082', N'Golf Course', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (491, N'Rheta', N'Beckerleg', CAST(N'1986-02-27T08:12:44.0000000' AS DateTime2), 117, N'29000-000', N'Vitória', N'87597', N'Springview', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (492, N'Gardner', N'Paydon', CAST(N'1981-01-14T00:18:59.0000000' AS DateTime2), 9, NULL, N'Niuzhuang', N'0', N'Butternut', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (493, N'Meggi', N'Collumbine', CAST(N'1990-02-13T07:35:51.0000000' AS DateTime2), 206, N'8511', N'San Luis', N'0843', N'Continental', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (494, N'Lanette', N'Karel', CAST(N'1979-10-10T23:04:26.0000000' AS DateTime2), 89, NULL, N'Bondowoso', N'1493', N'Ilene', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (495, N'Alison', N'Clowley', CAST(N'1971-01-03T10:38:29.0000000' AS DateTime2), 119, NULL, N'Cotaparaco', N'339', N'Monica', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (496, N'Seline', N'Paulton', CAST(N'1986-03-18T10:07:41.0000000' AS DateTime2), 25, N'73-155', N'Wegorzyno', N'81', N'Valley Edge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (497, N'Torrey', N'Seabright', CAST(N'1998-12-27T10:18:04.0000000' AS DateTime2), 126, NULL, N'Gaotai', N'99534', N'Bartelt', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (498, N'Burg', N'Karlsson', CAST(N'1992-01-12T10:46:05.0000000' AS DateTime2), 32, NULL, N'Gaoliang', N'17311', N'Karstens', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (499, N'Beverly', N'Goricke', CAST(N'1999-02-06T23:49:09.0000000' AS DateTime2), 219, NULL, N'Mangai', N'2798', N'Brickson Park', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (500, N'Rhona', N'Devote', CAST(N'1974-03-23T08:40:43.0000000' AS DateTime2), 47, N'4890-341', N'Escola', N'1', N'North', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (501, N'Julissa', N'Duxbarry', CAST(N'1996-07-07T21:25:25.0000000' AS DateTime2), 93, N'93393', N'Niños Heroes', N'4', N'Bunker Hill', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (502, N'Mattie', N'Cawdell', CAST(N'1986-05-21T05:26:16.0000000' AS DateTime2), 2, N'6817', N'Dolores', N'7', N'Daystar', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (503, N'Harriett', N'Croucher', CAST(N'1997-08-07T23:13:42.0000000' AS DateTime2), 230, NULL, N'Potrerillos Arriba', N'1180', N'Randy', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (504, N'Hugh', N'Tideswell', CAST(N'1991-06-25T00:23:42.0000000' AS DateTime2), 102, N'671454', N'Novokizhinginsk', N'57', N'Schurz', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (505, N'Lemar', N'Nesfield', CAST(N'1992-04-09T02:23:57.0000000' AS DateTime2), 91, NULL, N'Aigínio', N'11', N'Grayhawk', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (506, N'Niko', N'Tineman', CAST(N'1976-12-04T12:01:28.0000000' AS DateTime2), 139, N'41004 CEDEX', N'Blois', N'67', N'New Castle', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (507, N'Kilian', N'Farnill', CAST(N'1995-04-08T06:10:53.0000000' AS DateTime2), 230, NULL, N'Pushkino', N'6326', N'Pleasure', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (508, N'Aggy', N'Fletham', CAST(N'1993-01-26T06:07:03.0000000' AS DateTime2), 193, N'79160', N'Kandhkot', N'9', N'Duke', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (509, N'Jennie', N'Langsdon', CAST(N'1992-12-06T19:34:06.0000000' AS DateTime2), 41, N'ZTN', N'Vittoriosa', N'29', N'Bluestem', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (510, N'Gonzales', N'Roux', CAST(N'2002-10-25T22:33:33.0000000' AS DateTime2), 207, N'64-930', N'Szydlowo', N'8', N'Saint Paul', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (511, N'Lynnet', N'Winslett', CAST(N'1980-10-10T13:42:40.0000000' AS DateTime2), 56, N'65000', N'Phitsanulok', N'12', N'Hayes', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (512, N'Darin', N'Gwioneth', CAST(N'1997-04-05T10:17:23.0000000' AS DateTime2), 164, NULL, N'Kauman', N'519', N'Browning', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (513, N'Lazar', N'Herrema', CAST(N'2001-04-04T10:46:04.0000000' AS DateTime2), 207, NULL, N'Néa Tríglia', N'969', N'Surrey', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (514, N'Bird', N'Diggons', CAST(N'1981-11-22T17:51:29.0000000' AS DateTime2), 74, N'87270-000', N'Engenheiro Beltrão', N'5', N'Shelley', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (515, N'Crawford', N'Dolley', CAST(N'1992-04-30T21:55:01.0000000' AS DateTime2), 183, NULL, N'Fangqiang', N'6', N'Vahlen', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (516, N'Ardis', N'Keith', CAST(N'1973-03-22T10:04:57.0000000' AS DateTime2), 192, NULL, N'Kapinango', N'493', N'Surrey', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (517, N'Meghan', N'Chevolleau', CAST(N'2003-12-12T22:42:47.0000000' AS DateTime2), 183, N'4620-297', N'Capela', N'364', N'Springs', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (518, N'Linus', N'Bottell', CAST(N'1996-07-02T03:13:47.0000000' AS DateTime2), 157, NULL, N'Mao’ershan', N'93', N'American', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (519, N'Eugenius', N'Wraighte', CAST(N'1998-03-13T13:14:50.0000000' AS DateTime2), 129, N'963-7856', N'Shiroishi', N'99', N'Oneill', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (520, N'Addi', N'Rogeron', CAST(N'1982-08-12T21:39:03.0000000' AS DateTime2), 103, N'48410-000', N'Cícero Dantas', N'496', N'Veith', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (521, N'Rosina', N'Van Arsdale', CAST(N'1980-05-08T14:23:19.0000000' AS DateTime2), 57, N'417018', N'Elías', N'00', N'Marcy', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (522, N'Joella', N'Rawling', CAST(N'2001-03-11T13:19:15.0000000' AS DateTime2), 101, NULL, N'Aleksinac', N'1', N'Waywood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (523, N'Brody', N'Rowlinson', CAST(N'1982-04-15T23:48:59.0000000' AS DateTime2), 138, NULL, N'Caja', N'730', N'Warbler', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (524, N'Emma', N'Thacke', CAST(N'1996-03-11T10:22:53.0000000' AS DateTime2), 33, NULL, N'Muta Khan', N'874', N'Killdeer', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (525, N'Pollyanna', N'Pauletto', CAST(N'1998-09-18T07:26:16.0000000' AS DateTime2), 153, NULL, N'Yerazgavors', N'70', N'Browning', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (526, N'Henka', N'Sorbie', CAST(N'1981-04-22T01:44:41.0000000' AS DateTime2), 168, N'06124', N'Perugia', N'7204', N'Bartelt', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (527, N'Berna', N'Barrington', CAST(N'1973-10-16T14:37:00.0000000' AS DateTime2), 95, NULL, N'Xinglongjie', N'18', N'Mariners Cove', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (528, N'Waverley', N'Bendle', CAST(N'1998-12-20T18:58:33.0000000' AS DateTime2), 113, N'10606 CEDEX', N'Troyes', N'5', N'Mayfield', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (529, N'Jenn', N'Shillito', CAST(N'2001-08-13T09:20:11.0000000' AS DateTime2), 199, N'175310', N'Demyansk', N'2188', N'Kennedy', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (530, N'Stanley', N'Roan', CAST(N'1989-10-16T00:03:31.0000000' AS DateTime2), 87, N'50000', N'Chiang Mai', N'9', N'Twin Pines', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (531, N'Curran', N'Conring', CAST(N'1974-09-23T08:13:00.0000000' AS DateTime2), 43, N'2420-267', N'Carrasqueira', N'2', N'David', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (532, N'Kanya', N'Sebire', CAST(N'1998-01-28T01:35:19.0000000' AS DateTime2), 208, N'79042 CEDEX 9', N'Niort', N'61948', N'Eagan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (533, N'Carissa', N'Exon', CAST(N'1983-05-26T13:45:02.0000000' AS DateTime2), 31, N'46140-000', N'Livramento do Brumado', N'506', N'Merrick', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (534, N'Burgess', N'Borland', CAST(N'2004-11-19T09:58:33.0000000' AS DateTime2), 198, N'2840-051', N'Foros da Catrapona', N'0', N'Del Sol', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (535, N'Charis', N'Cassam', CAST(N'1986-09-22T09:09:32.0000000' AS DateTime2), 158, N'74-400', N'Debno', N'2', N'Tomscot', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (536, N'Odille', N'Blything', CAST(N'1992-04-27T22:34:47.0000000' AS DateTime2), 209, NULL, N'Jinghai', N'49836', N'Ridgeview', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (537, N'Lenci', N'Aldam', CAST(N'1974-11-15T11:52:03.0000000' AS DateTime2), 187, N'6807', N'Salcedo', N'76', N'Helena', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (538, N'Ashely', N'Vanini', CAST(N'1981-11-12T02:11:56.0000000' AS DateTime2), 21, NULL, N'Bantiran', N'08308', N'Lien', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (539, N'Gwenore', N'Aulsford', CAST(N'1993-06-24T16:56:42.0000000' AS DateTime2), 192, N'51360', N'Begowala', N'6', N'Hansons', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (540, N'Jennee', N'Stanlike', CAST(N'1986-04-10T14:09:18.0000000' AS DateTime2), 20, N'49530-000', N'Ribeirópolis', N'9', N'Ronald Regan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (541, N'Vernen', N'de Courcey', CAST(N'1983-07-27T08:46:39.0000000' AS DateTime2), 113, N'526529', N'Los Andes', N'62', N'Dakota', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (542, N'Eduino', N'Paddick', CAST(N'1990-07-04T00:35:04.0000000' AS DateTime2), 55, NULL, N'Tokmok', N'77870', N'Doe Crossing', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (543, N'Annabela', N'Schwanden', CAST(N'1987-07-10T16:36:56.0000000' AS DateTime2), 107, N'3508', N'Butigui', N'779', N'Debra', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (544, N'Rochelle', N'Gledhall', CAST(N'2003-04-13T04:16:04.0000000' AS DateTime2), 17, N'553 02', N'Jönköping', N'0166', N'Prairieview', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (545, N'Rikki', N'Picardo', CAST(N'1987-07-09T07:56:01.0000000' AS DateTime2), 197, NULL, N'Sandaowan', N'7', N'Graedel', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (546, N'Annadiana', N'Morford', CAST(N'1997-01-26T19:31:17.0000000' AS DateTime2), 89, NULL, N'Meilong', N'920', N'Walton', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (547, N'Zacharias', N'Broske', CAST(N'1978-03-29T18:26:55.0000000' AS DateTime2), 116, N'26-070', N'Lopuszno', N'121', N'Bashford', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (548, N'Jobi', N'Winkett', CAST(N'1982-05-22T18:41:31.0000000' AS DateTime2), 96, N'P4P', N'Timmins', N'0008', N'Delladonna', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (549, N'Olag', N'Henrie', CAST(N'1970-10-29T23:16:14.0000000' AS DateTime2), 204, N'614 94', N'Söderköping', N'0', N'Nobel', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (550, N'Curtice', N'Beggi', CAST(N'1976-11-27T04:42:15.0000000' AS DateTime2), 18, N'662174', N'Stan-Bekhtemir', N'4', N'Hayes', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (551, N'Bud', N'Alentyev', CAST(N'1980-04-28T09:39:12.0000000' AS DateTime2), 171, N'2138', N'Carcarañá', N'8460', N'Artisan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (552, N'Rod', N'Battram', CAST(N'1971-02-26T02:39:16.0000000' AS DateTime2), 6, NULL, N'El Fureidis', N'511', N'Pepper Wood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (553, N'Pauli', N'Doerffer', CAST(N'1973-09-09T08:19:58.0000000' AS DateTime2), 147, N'37890-000', N'Muzambinho', N'93', N'Grim', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (554, N'Lenard', N'Letham', CAST(N'1999-07-05T16:17:00.0000000' AS DateTime2), 149, N'429 42', N'Särö', N'911', N'Banding', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (555, N'Martita', N'Kochs', CAST(N'1997-01-22T16:52:51.0000000' AS DateTime2), 63, NULL, N'L?p Vò', N'8', N'Eastlawn', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (556, N'Carry', N'Doge', CAST(N'1984-07-18T06:59:19.0000000' AS DateTime2), 10, N'32-615', N'Grojec', N'198', N'Warbler', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (557, N'Karilynn', N'Bratcher', CAST(N'1986-07-10T12:28:52.0000000' AS DateTime2), 146, NULL, N'Chaniá', N'87', N'Stone Corner', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (558, N'Nalani', N'Elmes', CAST(N'1991-12-14T17:08:28.0000000' AS DateTime2), 50, N'161560', N'Tarnogskiy Gorodok', N'567', N'Corben', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (559, N'Avery', N'Civitillo', CAST(N'1984-08-08T22:35:36.0000000' AS DateTime2), 20, N'70150', N'Chom Bueng', N'1', N'Marquette', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (560, N'Giacobo', N'Newlove', CAST(N'2000-02-17T06:03:06.0000000' AS DateTime2), 104, N'96799', N'Tafuna', N'48441', N'Waywood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (561, N'Tomasina', N'Landeg', CAST(N'1976-03-06T12:43:01.0000000' AS DateTime2), 75, N'1656', N'Cama Juan', N'4', N'5th', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (562, N'Beniamino', N'Twist', CAST(N'1973-04-20T01:03:59.0000000' AS DateTime2), 57, N'5143', N'Miramar', N'7', N'Quincy', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (563, N'Elliott', N'Durrett', CAST(N'1977-07-24T00:47:01.0000000' AS DateTime2), 134, N'624449', N'Krasnotur’insk', N'466', N'Esch', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (564, N'Hugibert', N'Garley', CAST(N'1999-03-11T12:26:12.0000000' AS DateTime2), 17, N'49510', N'Grand Rapids', N'20', N'Tomscot', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (565, N'Harley', N'Brightwell', CAST(N'1996-06-13T15:34:02.0000000' AS DateTime2), 147, N'45435-000', N'Ituberá', N'4625', N'Merry', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (566, N'Claudian', N'Kedward', CAST(N'1974-10-25T00:58:55.0000000' AS DateTime2), 137, N'161469', N'Nikol’sk', N'96', N'Garrison', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (567, N'Wallis', N'Grenville', CAST(N'1974-10-06T11:07:37.0000000' AS DateTime2), 63, NULL, N'Jiangfeng', N'71065', N'Ohio', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (568, N'Wynny', N'Umfrey', CAST(N'2003-08-20T23:42:07.0000000' AS DateTime2), 152, N'30479', N'Las Flores', N'56', N'Vermont', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (569, N'Coletta', N'Magauran', CAST(N'1982-03-06T01:48:56.0000000' AS DateTime2), 30, NULL, N'Hedi', N'1819', N'Burning Wood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (570, N'Bran', N'Iannuzzi', CAST(N'1972-07-13T05:45:14.0000000' AS DateTime2), 122, N'1440', N'København', N'20174', N'Novick', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (571, N'Winonah', N'Burberye', CAST(N'1978-06-20T03:41:05.0000000' AS DateTime2), 198, N'644091', N'Gorelovo', N'8', N'Declaration', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (572, N'Georgiana', N'Whyard', CAST(N'1999-10-07T05:39:23.0000000' AS DateTime2), 172, N'80170', N'Hua Sai', N'92777', N'Esker', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (573, N'Boycie', N'Burleigh', CAST(N'1974-04-08T22:24:06.0000000' AS DateTime2), 177, N'19200-000', N'Pirapozinho', N'4', N'Nelson', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (574, N'Nicki', N'Whitebread', CAST(N'1971-11-13T23:35:20.0000000' AS DateTime2), 44, N'682738', N'Berëzovyy', N'21', N'Gulseth', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (575, N'Rodrigo', N'Hare', CAST(N'1976-10-14T20:03:10.0000000' AS DateTime2), 178, NULL, N'Banjar Parekan', N'1676', N'Lake View', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (576, N'Marianne', N'Punch', CAST(N'2004-10-18T18:45:50.0000000' AS DateTime2), 222, N'691 83', N'Karlskoga', N'51616', N'Mcbride', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (577, N'Reamonn', N'de Copeman', CAST(N'1978-10-21T10:33:57.0000000' AS DateTime2), 193, N'14609', N'Rochester', N'42', N'Lien', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (578, N'Heriberto', N'Suero', CAST(N'1978-08-21T15:33:11.0000000' AS DateTime2), 173, NULL, N'Zhuli', N'1864', N'Brentwood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (579, N'Melamie', N'Thowes', CAST(N'2001-03-17T16:00:05.0000000' AS DateTime2), 56, N'51009', N'Santa Maria', N'0919', N'Waubesa', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (580, N'Val', N'De Vaar', CAST(N'1984-10-21T09:50:28.0000000' AS DateTime2), 3, N'52600', N'La Palma', N'2789', N'Declaration', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (581, N'Suellen', N'Loxly', CAST(N'1979-07-28T01:43:45.0000000' AS DateTime2), 72, N'25057 CEDEX', N'Besançon', N'703', N'Grim', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (582, N'Rickey', N'Barhams', CAST(N'1971-03-05T07:02:22.0000000' AS DateTime2), 158, N'59800', N'Kuala Lumpur', N'07', N'Michigan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (583, N'Goraud', N'Kennefick', CAST(N'1993-10-01T14:56:56.0000000' AS DateTime2), 180, NULL, N'Gamawa', N'13064', N'Dottie', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (584, N'Janean', N'Jaffray', CAST(N'1984-05-21T14:09:21.0000000' AS DateTime2), 131, N'7479', N'Trondheim', N'3294', N'Nelson', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (585, N'Seamus', N'Mullins', CAST(N'1974-04-12T04:16:12.0000000' AS DateTime2), 142, NULL, N'Bacem', N'7623', N'Gale', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (586, N'Caz', N'Hamflett', CAST(N'1970-10-02T08:55:02.0000000' AS DateTime2), 69, NULL, N'Merefa', N'354', N'Doe Crossing', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (587, N'Jammal', N'Micheu', CAST(N'2005-04-11T17:26:19.0000000' AS DateTime2), 63, N'N2B', N'East Angus', N'4', N'Manitowish', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (588, N'Janeta', N'Hubbins', CAST(N'1996-05-03T05:07:29.0000000' AS DateTime2), 205, NULL, N'Karavan', N'6', N'Westend', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (589, N'Land', N'Redholes', CAST(N'1975-10-21T19:55:26.0000000' AS DateTime2), 193, NULL, N'Cidadap', N'3346', N'Cottonwood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (590, N'Lammond', N'Landman', CAST(N'1979-06-22T05:58:43.0000000' AS DateTime2), 184, NULL, N'Wotan', N'138', N'Hallows', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (591, N'Alic', N'Phebey', CAST(N'1991-08-24T14:09:26.0000000' AS DateTime2), 109, NULL, N'Liangyaping', N'0658', N'Ryan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (592, N'Tye', N'Speek', CAST(N'1982-09-29T03:00:44.0000000' AS DateTime2), 161, N'34-321', N'Lekawica', N'9483', N'Monica', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (593, N'Frederico', N'Handrek', CAST(N'1986-05-07T18:33:13.0000000' AS DateTime2), 167, NULL, N'Berezovo', N'413', N'Lakeland', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (594, N'Madelin', N'Tremblot', CAST(N'1978-08-11T06:59:10.0000000' AS DateTime2), 41, NULL, N'Huquan', N'4', N'Karstens', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (595, N'Matthaeus', N'Jakubovicz', CAST(N'1994-10-25T21:55:37.0000000' AS DateTime2), 78, NULL, N'Miaotou', N'3170', N'Trailsway', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (596, N'Elbert', N'Stanger', CAST(N'2001-01-08T19:15:21.0000000' AS DateTime2), 178, N'87300-000', N'Campo Mourão', N'72', N'Myrtle', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (597, N'Dar', N'Battill', CAST(N'1983-04-12T00:46:57.0000000' AS DateTime2), 169, N'33619', N'Bielefeld', N'4', N'Summit', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (598, N'Vicki', N'Cure', CAST(N'1990-10-08T09:41:08.0000000' AS DateTime2), 141, N'5105', N'Santa Cruz', N'577', N'Memorial', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (599, N'Amelina', N'Ramos', CAST(N'1972-07-08T05:52:54.0000000' AS DateTime2), 148, N'259-1335', N'Hadano', N'76738', N'Lakewood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (600, N'Melisse', N'Errey', CAST(N'1991-07-29T12:39:12.0000000' AS DateTime2), 121, N'6401', N'Bobon', N'85', N'Pawling', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (601, N'Casey', N'De la Yglesia', CAST(N'1997-11-16T15:33:52.0000000' AS DateTime2), 24, N'31139 CEDEX', N'Balma', N'8196', N'Summit', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (602, N'Tyrus', N'Haszard', CAST(N'1998-11-23T02:45:27.0000000' AS DateTime2), 186, NULL, N'Yavne', N'72825', N'Porter', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (603, N'Ardith', N'Mattheissen', CAST(N'1998-07-25T17:54:31.0000000' AS DateTime2), 230, N'25057 CEDEX', N'Besançon', N'15', N'Huxley', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (604, N'Talbert', N'Brewood', CAST(N'1986-07-30T06:24:23.0000000' AS DateTime2), 39, NULL, N'Cigadog', N'32', N'Clarendon', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (605, N'Kati', N'Paulton', CAST(N'1980-07-21T04:55:37.0000000' AS DateTime2), 57, NULL, N'Shetangpo', N'7', N'1st', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (606, N'Pincas', N'Kirkebye', CAST(N'1977-12-29T07:57:13.0000000' AS DateTime2), 79, NULL, N'Abu Tij', N'946', N'Hoffman', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (607, N'Yetty', N'Clewer', CAST(N'2005-03-22T07:52:31.0000000' AS DateTime2), 114, NULL, N'Sutysky', N'21', N'Garrison', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (608, N'Ardisj', N'Corrado', CAST(N'1996-10-08T20:54:38.0000000' AS DateTime2), 180, NULL, N'Piskivka', N'8488', N'Bashford', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (609, N'Mandy', N'John', CAST(N'1999-05-11T12:14:58.0000000' AS DateTime2), 27, NULL, N'Hobonio', N'05932', N'Kenwood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (610, N'Hilda', N'Dudding', CAST(N'1982-08-31T18:24:38.0000000' AS DateTime2), 48, NULL, N'Rokytne', N'504', N'Everett', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (611, N'Curtice', N'Coles', CAST(N'1988-12-13T00:18:30.0000000' AS DateTime2), 184, N'18600-000', N'Botucatu', N'4', N'Forster', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (612, N'Yoko', N'Deacon', CAST(N'1992-08-26T07:04:49.0000000' AS DateTime2), 145, N'663510', N'Shalinskoye', N'7', N'Straubel', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (613, N'Barth', N'Haverson', CAST(N'1974-01-17T22:29:11.0000000' AS DateTime2), 198, NULL, N'Jiaogong', N'0', N'1st', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (614, N'Peyton', N'Saffon', CAST(N'1992-08-15T08:09:33.0000000' AS DateTime2), 76, N'788 32', N'Staré Mesto', N'131', N'Mcguire', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (615, N'Ann-marie', N'Edmenson', CAST(N'1991-12-22T03:24:30.0000000' AS DateTime2), 118, N'353254', N'Smolenskaya', N'58', N'Dixon', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (616, N'Tansy', N'Willoughby', CAST(N'1974-01-03T10:56:10.0000000' AS DateTime2), 153, NULL, N'Krajandadapmulyo', N'62', N'Oriole', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (617, N'Sada', N'Mays', CAST(N'1996-10-24T06:52:26.0000000' AS DateTime2), 183, N'65760-000', N'Presidente Dutra', N'962', N'Reindahl', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (618, N'Dillie', N'Heathfield', CAST(N'2003-06-27T19:43:04.0000000' AS DateTime2), 112, N'8006', N'Hagonoy', N'8', N'Thompson', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (619, N'Nicol', N'Irving', CAST(N'1981-08-04T10:36:09.0000000' AS DateTime2), 174, NULL, N'Hamhung', N'3598', N'Buena Vista', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (620, N'Pennie', N'Peak', CAST(N'1990-10-16T06:01:00.0000000' AS DateTime2), 154, NULL, N'Quellouno', N'33', N'Waywood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (621, N'Eve', N'Bernardy', CAST(N'1981-10-06T16:03:46.0000000' AS DateTime2), 219, NULL, N'Banjar Madangan Kaja', N'6275', N'Judy', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (622, N'Deirdre', N'Inglesent', CAST(N'1984-10-21T13:49:58.0000000' AS DateTime2), 100, NULL, N'Nerokoúros', N'043', N'Huxley', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (623, N'Birdie', N'Symondson', CAST(N'1977-02-10T23:05:42.0000000' AS DateTime2), 172, NULL, N'Tai Po', N'44', N'Arizona', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (624, N'Nollie', N'De Francesco', CAST(N'1995-03-08T21:12:04.0000000' AS DateTime2), 157, N'2425-838', N'Marinha', N'83556', N'Acker', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (625, N'Sayre', N'Varsey', CAST(N'1972-12-02T00:49:07.0000000' AS DateTime2), 210, NULL, N'Palcamayo', N'6682', N'Gale', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (626, N'Gareth', N'McGarrell', CAST(N'1978-08-17T12:14:21.0000000' AS DateTime2), 36, NULL, N'Jishi', N'063', N'Comanche', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (627, N'Marabel', N'Tharme', CAST(N'2000-04-04T05:36:38.0000000' AS DateTime2), 53, NULL, N'Dong’an', N'84', N'Maple', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (628, N'Toby', N'Ledram', CAST(N'1973-10-21T16:13:23.0000000' AS DateTime2), 206, NULL, N'Viesite', N'5119', N'Thompson', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (629, N'Vance', N'Brimming', CAST(N'2001-08-04T16:14:53.0000000' AS DateTime2), 101, NULL, N'Otukpa', N'26585', N'Carpenter', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (630, N'Perl', N'Swainsbury', CAST(N'1990-09-28T20:51:59.0000000' AS DateTime2), 167, N'366218', N'Oyskhara', N'15', N'Milwaukee', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (631, N'Clem', N'Boar', CAST(N'1996-11-02T19:14:55.0000000' AS DateTime2), 54, NULL, N'Laizhou', N'2879', N'Ridgeview', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (632, N'Arvie', N'Curnow', CAST(N'1990-04-22T17:02:53.0000000' AS DateTime2), 78, N'16005', N'Tamahú', N'4', N'Coleman', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (633, N'Baxter', N'Toop', CAST(N'1983-09-28T19:52:05.0000000' AS DateTime2), 216, NULL, N'Wantou', N'8', N'1st', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (634, N'Kahaleel', N'Riccard', CAST(N'1997-04-11T18:37:30.0000000' AS DateTime2), 104, NULL, N'Yongding', N'4658', N'Redwing', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (635, N'Archibald', N'Tuley', CAST(N'1992-07-09T12:34:13.0000000' AS DateTime2), 176, NULL, N'Mahdia', N'80682', N'Burrows', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (636, N'Adriane', N'Crebo', CAST(N'1995-12-02T13:58:22.0000000' AS DateTime2), 100, NULL, N'Ngrayun', N'63117', N'Tomscot', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (637, N'Linnea', N'Smithend', CAST(N'1986-09-02T03:58:55.0000000' AS DateTime2), 180, N'98516', N'Olympia', N'14', N'Badeau', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (638, N'Harlan', N'Kayes', CAST(N'1998-08-23T06:45:44.0000000' AS DateTime2), 195, N'MD-3200', N'Bender', N'72', N'Golf Course', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (639, N'Jocelyne', N'Conre', CAST(N'1970-09-07T05:05:08.0000000' AS DateTime2), 74, NULL, N'Turpay', N'4916', N'Alpine', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (640, N'Dugald', N'Nozzolinii', CAST(N'1991-06-04T06:01:21.0000000' AS DateTime2), 13, NULL, N'Yangkang', N'7', N'Lawn', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (641, N'Tori', N'Durbin', CAST(N'1998-10-13T21:06:09.0000000' AS DateTime2), 43, NULL, N'Shuiche', N'970', N'Rowland', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (642, N'Horatius', N'Shilvock', CAST(N'2000-05-24T20:15:14.0000000' AS DateTime2), 202, NULL, N'Gangdong', N'04', N'Hooker', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (643, N'Tedi', N'Spilsted', CAST(N'1976-08-18T16:46:16.0000000' AS DateTime2), 163, N'4430', N'Ballitoville', N'6', N'Fair Oaks', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (644, N'Beverly', N'Breach', CAST(N'1994-01-16T19:47:55.0000000' AS DateTime2), 16, N'SLC', N'Santa Lucija', N'37', N'Fieldstone', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (645, N'Hartley', N'Stoyell', CAST(N'2003-10-27T10:58:30.0000000' AS DateTime2), 124, NULL, N'Churubamba', N'0', N'Dennis', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (646, N'Winne', N'Squibbes', CAST(N'1986-11-22T14:19:21.0000000' AS DateTime2), 227, N'677907', N'Tabaga', N'9527', N'Mcguire', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (647, N'Ashton', N'Grimmer', CAST(N'1971-07-19T16:49:21.0000000' AS DateTime2), 13, NULL, N'Al ?ajar al Aswad', N'14639', N'Reindahl', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (648, N'Anson', N'Bagworth', CAST(N'1978-03-24T16:46:03.0000000' AS DateTime2), 218, N'419-0125', N'Hita', N'42', N'Blue Bill Park', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (649, N'Finley', N'McCaughran', CAST(N'1985-10-31T21:39:57.0000000' AS DateTime2), 76, NULL, N'Tobilolong', N'053', N'Cordelia', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (650, N'Opal', N'Bilton', CAST(N'1975-10-24T22:53:39.0000000' AS DateTime2), 201, NULL, N'?alwan', N'989', N'Arkansas', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (651, N'Jolee', N'Altoft', CAST(N'1997-10-11T04:08:05.0000000' AS DateTime2), 2, N'48960-000', N'Jaguarari', N'67176', N'Bashford', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (652, N'Birch', N'Spohr', CAST(N'2003-07-27T11:21:49.0000000' AS DateTime2), 137, N'79309 CEDEX', N'Bressuire', N'160', N'Donald', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (653, N'Lucina', N'Perview', CAST(N'1983-11-01T20:34:43.0000000' AS DateTime2), 95, N'G6E', N'Ucluelet', N'2441', N'Sachs', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (654, N'Joyous', N'Heinreich', CAST(N'1994-04-04T09:58:13.0000000' AS DateTime2), 135, N'15740', N'Kota Bharu', N'526', N'Hermina', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (655, N'Willdon', N'Burlingame', CAST(N'1996-02-20T06:35:39.0000000' AS DateTime2), 138, NULL, N'Guangfu', N'6', N'Barnett', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (656, N'Leoine', N'Dinjes', CAST(N'1979-12-02T14:45:53.0000000' AS DateTime2), 107, N'4640-545', N'Sobreira', N'5019', N'Katie', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (657, N'Kerrin', N'Enticknap', CAST(N'1978-01-05T23:26:08.0000000' AS DateTime2), 47, NULL, N'Bakixanov', N'369', N'Caliangt', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (658, N'Goldie', N'Le febre', CAST(N'1987-02-21T06:01:01.0000000' AS DateTime2), 193, NULL, N'Jiefangyan', N'8', N'Buell', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (659, N'Devinne', N'Tolchar', CAST(N'2003-07-27T09:26:30.0000000' AS DateTime2), 154, NULL, N'Changhe', N'681', N'Merry', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (660, N'Lisetta', N'Paternoster', CAST(N'2003-03-28T07:50:03.0000000' AS DateTime2), 101, NULL, N'Dublje', N'8737', N'Sunfield', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (661, N'Odo', N'Kinson', CAST(N'1984-12-23T01:24:11.0000000' AS DateTime2), 90, NULL, N'Lijiaping', N'5', N'Surrey', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (662, N'Konstanze', N'Feechum', CAST(N'1970-11-07T08:46:40.0000000' AS DateTime2), 7, N'27120', N'Wang Nam Yen', N'6', N'Bunker Hill', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (663, N'Betsy', N'Elgood', CAST(N'1987-05-14T18:47:22.0000000' AS DateTime2), 55, NULL, N'Engure', N'99245', N'Monterey', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (664, N'Spence', N'Brain', CAST(N'2000-01-25T16:50:45.0000000' AS DateTime2), 166, N'289 37', N'Loucen', N'7', N'Saint Paul', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (665, N'Margarethe', N'Ginger', CAST(N'1982-05-25T23:28:17.0000000' AS DateTime2), 115, N'7113', N'Siayan', N'9964', N'Bartillon', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (666, N'Dion', N'Begg', CAST(N'1973-08-22T09:57:23.0000000' AS DateTime2), 206, N'1114', N'Salvacion', N'4', N'Charing Cross', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (667, N'Celka', N'MacCroary', CAST(N'1972-07-25T16:05:58.0000000' AS DateTime2), 217, NULL, N'Baiyinnuole', N'700', N'Raven', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (668, N'Monro', N'Dennert', CAST(N'1988-06-30T00:02:46.0000000' AS DateTime2), 34, N'8150-045', N'Malhão', N'0680', N'Westend', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (669, N'Skylar', N'Baddam', CAST(N'1974-02-24T01:08:10.0000000' AS DateTime2), 28, NULL, N'Talu', N'61757', N'Arapahoe', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (670, N'Almira', N'Crush', CAST(N'1999-09-14T04:17:55.0000000' AS DateTime2), 75, NULL, N'Rimpakgede', N'66873', N'Cambridge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (671, N'Derby', N'Guille', CAST(N'2003-08-26T16:56:00.0000000' AS DateTime2), 190, NULL, N'Jiahe', N'47', N'Rieder', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (672, N'Tressa', N'Crockford', CAST(N'2002-04-27T08:08:24.0000000' AS DateTime2), 46, NULL, N'La Caleta Culebras', N'0', N'Spenser', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (673, N'Oates', N'Milne', CAST(N'1987-12-08T07:28:32.0000000' AS DateTime2), 151, N'937 91', N'Burträsk', N'31115', N'Eastwood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (674, N'Pace', N'Henke', CAST(N'1971-01-11T00:19:33.0000000' AS DateTime2), 125, NULL, N'San Francisco', N'34412', N'Milwaukee', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (675, N'Shaylyn', N'Goulbourn', CAST(N'1979-03-28T14:14:14.0000000' AS DateTime2), 199, N'5411', N'Mandaon', N'904', N'Crowley', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (676, N'Calida', N'Bickerdyke', CAST(N'1983-08-25T12:14:21.0000000' AS DateTime2), 99, N'664 24', N'Drásov', N'97651', N'Grover', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (677, N'Rosemary', N'Merrgen', CAST(N'1971-11-27T08:37:06.0000000' AS DateTime2), 88, NULL, N'Sabá', N'4', N'Lukken', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (678, N'Christoforo', N'Harkness', CAST(N'1972-03-06T22:22:19.0000000' AS DateTime2), 47, N'186956', N'Sukkozero', N'6', N'Schlimgen', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (679, N'Kerry', N'Pickhaver', CAST(N'1980-10-19T09:39:07.0000000' AS DateTime2), 211, NULL, N'Sanjiang', N'9732', N'Tennessee', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (680, N'Janey', N'Halfacre', CAST(N'1990-10-27T09:19:03.0000000' AS DateTime2), 105, NULL, N'Larangan', N'73765', N'Petterle', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (681, N'Meghan', N'Ollivier', CAST(N'1977-03-10T07:32:59.0000000' AS DateTime2), 108, NULL, N'Jinka', N'610', N'Vahlen', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (682, N'Danella', N'Kemwal', CAST(N'1982-01-30T07:01:12.0000000' AS DateTime2), 95, NULL, N'Bin Yauri', N'87601', N'Scott', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (683, N'Florance', N'Lewens', CAST(N'1985-06-01T12:05:20.0000000' AS DateTime2), 65, N'451 32', N'Uddevalla', N'8633', N'Maryland', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (684, N'Clyve', N'Dugue', CAST(N'1987-09-23T00:20:47.0000000' AS DateTime2), 220, N'949-0544', N'Itoigawa', N'6', N'Loomis', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (685, N'Tani', N'Rushmer', CAST(N'1997-12-29T04:50:54.0000000' AS DateTime2), 134, N'5155-406', N'Mós', N'17', N'Anthes', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (686, N'Ber', N'Le Grys', CAST(N'1977-05-22T03:44:20.0000000' AS DateTime2), 45, N'32-200', N'Miechów Charsznica', N'86317', N'Dennis', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (687, N'Elsi', N'Sneddon', CAST(N'2001-12-14T21:03:55.0000000' AS DateTime2), 37, N'2529', N'Unión', N'7', N'Blaine', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (688, N'Inessa', N'Arnecke', CAST(N'1990-04-28T20:04:01.0000000' AS DateTime2), 184, NULL, N'Houmen', N'5', N'Annamark', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (689, N'Marlon', N'Monksfield', CAST(N'1976-09-09T19:13:40.0000000' AS DateTime2), 69, N'91265 CEDEX', N'Juvisy-sur-Orge', N'6', N'Mcguire', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (690, N'Cristian', N'Catterick', CAST(N'1986-10-03T06:18:14.0000000' AS DateTime2), 54, NULL, N'Gutian', N'0904', N'Fulton', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (691, N'Sena', N'Lutas', CAST(N'1973-02-18T19:56:15.0000000' AS DateTime2), 170, N'5815', N'Panitan', N'92185', N'Novick', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (692, N'Ethelred', N'Fowley', CAST(N'1995-03-26T01:14:41.0000000' AS DateTime2), 26, NULL, N'Liucun', N'0', N'Kennedy', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (693, N'Conrad', N'Rosenwasser', CAST(N'1996-10-26T21:33:55.0000000' AS DateTime2), 32, N'115 77', N'Stockholm', N'03226', N'Hintze', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (694, N'Alon', N'Spencock', CAST(N'1997-08-28T15:52:15.0000000' AS DateTime2), 23, NULL, N'Santiago de Baney', N'19', N'Fairview', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (695, N'Gabbey', N'Talmadge', CAST(N'1973-08-18T22:06:24.0000000' AS DateTime2), 32, NULL, N'Zhangzhu', N'0', N'Cottonwood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (696, N'Ansell', N'Leel', CAST(N'1982-10-26T07:16:50.0000000' AS DateTime2), 70, N'9787', N'Barkly East', N'05275', N'Del Mar', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (697, N'Chaddy', N'Brannigan', CAST(N'2004-08-24T13:37:02.0000000' AS DateTime2), 212, NULL, N'Yuyapichis', N'57', N'Wayridge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (698, N'Zonnya', N'Rutter', CAST(N'2002-12-28T06:02:33.0000000' AS DateTime2), 197, NULL, N'Dasoguz', N'4102', N'Monica', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (699, N'Deirdre', N'Beinisch', CAST(N'2003-08-12T22:45:56.0000000' AS DateTime2), 184, N'684009', N'Los Santos', N'8', N'Hoffman', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (700, N'Billy', N'Dorset', CAST(N'1982-12-23T06:59:48.0000000' AS DateTime2), 60, N'42250', N'Lepoglava', N'93', N'Washington', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (701, N'Deloris', N'Heliet', CAST(N'1987-09-13T23:44:09.0000000' AS DateTime2), 213, NULL, N'Nueva Germania', N'35', N'Westport', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (702, N'Alia', N'Tipler', CAST(N'1991-07-12T11:29:20.0000000' AS DateTime2), 154, N'21-310', N'Wohyn', N'36', N'Blackbird', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (703, N'Shina', N'Dodgshun', CAST(N'2003-09-17T13:22:03.0000000' AS DateTime2), 193, N'27001', N'Vilnius', N'9580', N'Sunfield', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (704, N'Carmela', N'Chant', CAST(N'1989-10-29T05:27:56.0000000' AS DateTime2), 56, NULL, N'Saqayn', N'71606', N'Ilene', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (705, N'Gabriela', N'Gerrett', CAST(N'1980-03-18T23:29:42.0000000' AS DateTime2), 38, NULL, N'Oesao', N'5', N'Manley', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (706, N'Alf', N'Wrigley', CAST(N'1987-12-13T00:12:06.0000000' AS DateTime2), 185, NULL, N'Becej', N'0', N'Basil', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (707, N'Erskine', N'Vaillant', CAST(N'1983-03-07T08:52:48.0000000' AS DateTime2), 159, NULL, N'Bektemir', N'381', N'Twin Pines', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (708, N'Birgitta', N'Newey', CAST(N'1979-08-07T12:43:18.0000000' AS DateTime2), 145, NULL, N'Chojata', N'886', N'Melvin', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (709, N'Isa', N'Whewell', CAST(N'2002-07-27T18:18:09.0000000' AS DateTime2), 29, NULL, N'Raffingora', N'5657', N'Sundown', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (710, N'Bernardina', N'Sprionghall', CAST(N'1990-03-10T17:37:31.0000000' AS DateTime2), 209, NULL, N'Gampingan', N'7', N'Mesta', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (711, N'Hayden', N'Challen', CAST(N'1977-04-05T18:48:55.0000000' AS DateTime2), 17, N'CH48', N'Wirral', N'48842', N'Moulton', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (712, N'Edd', N'Nibley', CAST(N'2004-10-16T18:43:27.0000000' AS DateTime2), 148, NULL, N'Shidu', N'6602', N'Melvin', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (713, N'Quintin', N'Rhubottom', CAST(N'1978-10-21T08:51:20.0000000' AS DateTime2), 112, NULL, N'Diez de Octubre', N'3457', N'Old Shore', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (714, N'Wat', N'Aizic', CAST(N'2004-01-08T08:55:44.0000000' AS DateTime2), 24, N'39501', N'Ikaalinen', N'1', N'Carpenter', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (715, N'Marianna', N'Jaher', CAST(N'1990-10-24T17:33:07.0000000' AS DateTime2), 105, NULL, N'Hitura', N'56', N'Doe Crossing', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (716, N'Aldus', N'Hargraves', CAST(N'1979-01-09T04:59:00.0000000' AS DateTime2), 38, NULL, N'Zhendong', N'37', N'Bashford', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (717, N'Cathee', N'Giovannilli', CAST(N'1983-10-22T04:52:25.0000000' AS DateTime2), 123, NULL, N'Lebedinovka', N'4774', N'Di Loreto', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (718, N'Lisetta', N'Gowland', CAST(N'1999-06-07T12:33:50.0000000' AS DateTime2), 49, NULL, N'Nanyi', N'94', N'Mandrake', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (719, N'Leonie', N'Knowler', CAST(N'1983-03-15T08:30:25.0000000' AS DateTime2), 144, NULL, N'Boyu', N'861', N'Delaware', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (720, N'Lorinda', N'Ochterlony', CAST(N'1976-03-30T21:55:48.0000000' AS DateTime2), 165, NULL, N'Dahe', N'10266', N'Golden Leaf', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (721, N'Lebbie', N'Vowels', CAST(N'2001-07-29T02:57:18.0000000' AS DateTime2), 153, NULL, N'Placencia', N'910', N'Westend', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (722, N'Ree', N'Wychard', CAST(N'1979-04-21T17:41:53.0000000' AS DateTime2), 108, N'7305', N'Tiglauigan', N'1', N'Ludington', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (723, N'Worthy', N'Narraway', CAST(N'2001-10-11T13:46:48.0000000' AS DateTime2), 173, NULL, N'Xinglong', N'97492', N'Green', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (724, N'Gram', N'Patington', CAST(N'1990-03-09T20:18:13.0000000' AS DateTime2), 37, N'32-840', N'Zakliczyn', N'988', N'Beilfuss', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (725, N'Romeo', N'Fortin', CAST(N'1974-11-20T04:58:02.0000000' AS DateTime2), 55, N'15640-000', N'Tomé Açu', N'71193', N'Sunbrook', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (726, N'Stacia', N'Rummery', CAST(N'1982-08-20T06:58:05.0000000' AS DateTime2), 26, N'61015 CEDEX', N'Alençon', N'804', N'Myrtle', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (727, N'Hagen', N'Purves', CAST(N'2001-05-14T16:32:37.0000000' AS DateTime2), 19, N'94110', N'San Francisco', N'43457', N'Esch', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (728, N'Thatch', N'Sowthcote', CAST(N'1989-02-27T19:26:32.0000000' AS DateTime2), 164, N'29601', N'Noormarkku', N'42', N'Hollow Ridge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (729, N'Camella', N'Braksper', CAST(N'1974-04-29T04:26:30.0000000' AS DateTime2), 43, NULL, N'Liuzhi', N'578', N'Pond', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (730, N'Ozzy', N'Perrottet', CAST(N'2004-09-14T08:28:18.0000000' AS DateTime2), 217, NULL, N'Fuan', N'1161', N'Shopko', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (731, N'Kara', N'Martindale', CAST(N'1996-11-06T18:47:10.0000000' AS DateTime2), 31, N'271058', N'Bagadó', N'1001', N'Grover', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (732, N'Georgeta', N'Dominelli', CAST(N'2004-01-08T14:52:50.0000000' AS DateTime2), 137, N'203-0044', N'Chofugaoka', N'3964', N'Miller', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (733, N'Andi', N'Woollhead', CAST(N'2005-07-08T02:25:39.0000000' AS DateTime2), 167, NULL, N'Cimanglid', N'31', N'Claremont', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (734, N'Maxwell', N'Poulter', CAST(N'2002-01-24T14:38:10.0000000' AS DateTime2), 210, NULL, N'Hwasun', N'9256', N'Amoth', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (735, N'Seward', N'Vasyunkin', CAST(N'1990-03-13T04:55:59.0000000' AS DateTime2), 128, N'34-436', N'Maniowy', N'67', N'Talmadge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (736, N'Coretta', N'Bushell', CAST(N'2000-06-12T07:34:33.0000000' AS DateTime2), 53, NULL, N'Jishigang', N'62', N'Springs', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (737, N'Hope', N'Senechell', CAST(N'1988-04-11T20:25:29.0000000' AS DateTime2), 174, NULL, N'Anding', N'7', N'Elmside', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (738, N'Sadye', N'Cockran', CAST(N'1975-03-20T02:09:11.0000000' AS DateTime2), 109, NULL, N'Krasnapollye', N'2246', N'Monterey', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (739, N'Alexei', N'Geillier', CAST(N'1997-04-06T05:31:06.0000000' AS DateTime2), 67, NULL, N'Svojat', N'85', N'Delladonna', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (740, N'Tani', N'MacPhaden', CAST(N'1980-04-08T06:04:36.0000000' AS DateTime2), 153, N'672530', N'Atamanovka', N'71', N'Ohio', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (741, N'Kory', N'Chimes', CAST(N'1998-04-10T04:02:51.0000000' AS DateTime2), 69, NULL, N'Gracias', N'55896', N'Monument', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (742, N'Evanne', N'Latour', CAST(N'1978-09-08T03:40:15.0000000' AS DateTime2), 175, NULL, N'Pilaya', N'206', N'Bartelt', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (743, N'Thadeus', N'D''Agostino', CAST(N'1985-11-28T08:09:12.0000000' AS DateTime2), 91, NULL, N'La Asunción', N'17', N'Atwood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (744, N'Tawsha', N'Nisbet', CAST(N'1973-05-19T10:17:21.0000000' AS DateTime2), 130, NULL, N'Banjar Swastika', N'4', N'Mendota', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (745, N'Husain', N'Wettern', CAST(N'1998-11-04T01:44:21.0000000' AS DateTime2), 38, N'4511', N'Bairan', N'49435', N'Tomscot', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (746, N'Leese', N'Keuning', CAST(N'1998-08-13T18:13:42.0000000' AS DateTime2), 1, NULL, N'Kotovs’k', N'1', N'Riverside', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (747, N'Germana', N'Sewill', CAST(N'2005-08-14T12:35:44.0000000' AS DateTime2), 227, N'69091', N'Haveli', N'7320', N'Tomscot', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (748, N'Farrand', N'Matchett', CAST(N'1992-11-09T02:48:30.0000000' AS DateTime2), 4, N'70180', N'Stuttgart Stuttgart-Mitte', N'0985', N'Merry', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (749, N'Jakie', N'Feathersby', CAST(N'1999-03-09T23:43:52.0000000' AS DateTime2), 110, N'2614', N'Delft', N'167', N'Mandrake', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (750, N'Jamaal', N'Rossi', CAST(N'1999-07-26T11:41:07.0000000' AS DateTime2), 105, N'2775-035', N'Junqueiro', N'51047', N'Marquette', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (751, N'Joceline', N'Bradd', CAST(N'1990-07-04T11:06:30.0000000' AS DateTime2), 196, NULL, N'Hushan', N'67', N'Eagan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (752, N'Hendrick', N'Haxbie', CAST(N'1986-10-20T12:21:13.0000000' AS DateTime2), 3, N'51690', N'San Miguel', N'363', N'Prentice', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (753, N'Flora', N'Hughf', CAST(N'1989-04-14T00:53:55.0000000' AS DateTime2), 176, NULL, N'Mayqayyng', N'00856', N'Harbort', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (754, N'Shaun', N'Parrott', CAST(N'2002-06-24T12:03:57.0000000' AS DateTime2), 133, N'3712', N'Los Frentones', N'768', N'Pepper Wood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (755, N'Elinore', N'MacSherry', CAST(N'1982-11-05T06:01:38.0000000' AS DateTime2), 12, NULL, N'Chrysó', N'3343', N'Pierstorff', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (756, N'Emalia', N'Cutill', CAST(N'2003-09-21T01:25:46.0000000' AS DateTime2), 108, N'2477', N'Trun', N'3', N'Carberry', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (757, N'Pearla', N'Guyan', CAST(N'1992-06-01T22:08:10.0000000' AS DateTime2), 121, N'VCT', N'Victoria', N'49017', N'Towne', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (758, N'Gaile', N'Dalinder', CAST(N'1998-02-25T15:50:30.0000000' AS DateTime2), 218, N'1333', N'????? ???????', N'46302', N'Vidon', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (759, N'Kania', N'Cruikshank', CAST(N'1985-11-12T17:09:11.0000000' AS DateTime2), 55, NULL, N'Diego de Almagro', N'48', N'Spenser', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (760, N'Iggie', N'Hurworth', CAST(N'1986-04-15T22:31:40.0000000' AS DateTime2), 184, NULL, N'Malka', N'36', N'Birchwood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (761, N'Horatius', N'Morgon', CAST(N'1988-05-06T19:23:33.0000000' AS DateTime2), 145, N'90716', N'Sandakan', N'14856', N'Moland', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (762, N'Lesly', N'Paynton', CAST(N'1974-03-30T08:25:23.0000000' AS DateTime2), 132, N'4762', N'Teknaf', N'1723', N'Elka', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (763, N'Ayn', N'Yule', CAST(N'2002-05-10T09:59:23.0000000' AS DateTime2), 124, N'42285', N'Wuppertal', N'08', N'8th', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (764, N'Gris', N'Mateo', CAST(N'1978-10-18T10:44:49.0000000' AS DateTime2), 182, NULL, N'Al Qararah', N'83', N'Mendota', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (765, N'Ezekiel', N'Beentjes', CAST(N'1988-04-04T22:54:38.0000000' AS DateTime2), 15, NULL, N'Hecun', N'955', N'Myrtle', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (766, N'Rubia', N'Woodhams', CAST(N'1976-02-03T16:50:26.0000000' AS DateTime2), 101, NULL, N'Ngadipuro', N'33', N'Oriole', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (767, N'Bambi', N'Allred', CAST(N'1998-04-27T19:37:28.0000000' AS DateTime2), 162, N'4803', N'Baras', N'1', N'Meadow Valley', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (768, N'Rik', N'Pougher', CAST(N'1980-06-15T14:09:47.0000000' AS DateTime2), 18, N'97670-000', N'São Borja', N'25026', N'Washington', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (769, N'Georgine', N'Woolforde', CAST(N'1998-10-17T15:47:50.0000000' AS DateTime2), 38, N'88850-000', N'Forquilhinha', N'409', N'Montana', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (770, N'Clayson', N'Fehner', CAST(N'2001-10-22T04:18:47.0000000' AS DateTime2), 19, N'1480', N'Gevgelija', N'31', N'Annamark', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (771, N'Hadleigh', N'Rodgier', CAST(N'1975-09-18T17:29:23.0000000' AS DateTime2), 101, NULL, N'Bailang', N'1', N'Manufacturers', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (772, N'Liam', N'Vedeneev', CAST(N'1972-12-31T02:37:25.0000000' AS DateTime2), 184, NULL, N'Jiangmen', N'60093', N'Leroy', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (773, N'Ardelle', N'Vinson', CAST(N'2002-06-23T09:17:01.0000000' AS DateTime2), 83, N'01009 CEDEX', N'Bourg-en-Bresse', N'21334', N'Bartelt', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (774, N'Wat', N'McNalley', CAST(N'1973-01-18T11:12:19.0000000' AS DateTime2), 214, NULL, N'Khuma', N'8710', N'Kim', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (775, N'Laetitia', N'Irons', CAST(N'1997-11-07T22:40:52.0000000' AS DateTime2), 18, NULL, N'Tepusteca', N'1483', N'Fordem', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (776, N'Janene', N'Axe', CAST(N'1980-02-06T06:54:40.0000000' AS DateTime2), 102, NULL, N'Paujiles', N'369', N'Meadow Valley', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (777, N'Constantina', N'MacFadin', CAST(N'1981-09-09T16:47:25.0000000' AS DateTime2), 161, NULL, N'Pekijing', N'6698', N'Southridge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (778, N'Cathlene', N'Rittmeier', CAST(N'1970-10-27T11:12:15.0000000' AS DateTime2), 132, N'58-140', N'Jaworzyna Slaska', N'01', N'Fulton', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (779, N'Theodora', N'Wrightim', CAST(N'1981-03-15T08:23:02.0000000' AS DateTime2), 230, NULL, N'Shizong', N'53097', N'Butternut', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (780, N'Lanni', N'Towns', CAST(N'1977-08-23T13:29:33.0000000' AS DateTime2), 225, NULL, N'Tartu', N'7525', N'Namekagon', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (781, N'Katharine', N'Teare', CAST(N'1976-08-02T10:54:29.0000000' AS DateTime2), 111, NULL, N'Guankou', N'3346', N'Talmadge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (782, N'Aeriell', N'Schenkel', CAST(N'1976-05-25T03:19:57.0000000' AS DateTime2), 199, NULL, N'Danghara', N'996', N'Badeau', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (783, N'Donny', N'Iacoboni', CAST(N'1988-03-19T15:23:19.0000000' AS DateTime2), 96, N'23-302', N'Godziszów Pierwszy', N'096', N'Lake View', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (784, N'Jazmin', N'Zorzoni', CAST(N'1991-12-16T09:29:00.0000000' AS DateTime2), 25, NULL, N'Zagora', N'44', N'Lunder', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (785, N'Pete', N'Danilin', CAST(N'1995-08-01T02:58:06.0000000' AS DateTime2), 165, N'01901', N'Nurmijärvi', N'77090', N'South', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (786, N'Greta', N'Renhard', CAST(N'1973-01-05T10:23:28.0000000' AS DateTime2), 221, NULL, N'Beizhuang', N'5', N'Spaight', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (787, N'Ashley', N'Baptie', CAST(N'1982-07-24T09:25:44.0000000' AS DateTime2), 176, N'188919', N'Vyborg', N'17', N'Forster', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (788, N'Shermy', N'McKiddin', CAST(N'1971-12-15T17:15:13.0000000' AS DateTime2), 64, N'10400', N'Phaya Thai', N'212', N'Swallow', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (789, N'Beatrice', N'Skells', CAST(N'1980-07-18T03:57:07.0000000' AS DateTime2), 106, NULL, N'Tam K?', N'84', N'Lawn', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (790, N'Vernon', N'Lehenmann', CAST(N'1975-06-01T10:03:07.0000000' AS DateTime2), 137, NULL, N'Rudnyy', N'297', N'Scott', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (791, N'Terri-jo', N'Fairlie', CAST(N'1987-02-13T08:55:14.0000000' AS DateTime2), 146, NULL, N'La Paz de Oriente', N'328', N'Lukken', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (792, N'Rustie', N'Smails', CAST(N'1975-05-01T21:48:48.0000000' AS DateTime2), 150, N'K45', N'Lusk', N'9702', N'Hintze', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (793, N'Anestassia', N'Melbourne', CAST(N'1977-04-29T04:20:57.0000000' AS DateTime2), 49, NULL, N'Obesi', N'23', N'Vermont', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (794, N'Ephrem', N'Corradetti', CAST(N'1976-10-16T07:48:09.0000000' AS DateTime2), 1, N'301420', N'Khanino', N'0', N'Hauk', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (795, N'Ethyl', N'Liebrecht', CAST(N'1997-02-16T19:59:55.0000000' AS DateTime2), 34, NULL, N'Mafinga', N'3039', N'Elka', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (796, N'Minette', N'Neles', CAST(N'2005-03-16T12:10:32.0000000' AS DateTime2), 172, N'9488', N'Welkom', N'22', N'Pennsylvania', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (797, N'Marlo', N'Van der Beken', CAST(N'1978-11-08T08:13:57.0000000' AS DateTime2), 113, N'44004 CEDEX 1', N'Nantes', N'25', N'Carioca', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (798, N'Garwood', N'Rettie', CAST(N'2004-12-26T09:56:36.0000000' AS DateTime2), 226, NULL, N'Broceni', N'72', N'Gale', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (799, N'Horatia', N'Milne', CAST(N'1996-09-30T09:29:25.0000000' AS DateTime2), 154, NULL, N'Phú Vang', N'4471', N'Colorado', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (800, N'Nona', N'Fridaye', CAST(N'1980-01-21T05:14:51.0000000' AS DateTime2), 39, NULL, N'Guangming', N'7415', N'Tennessee', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (801, N'Brew', N'Brownfield', CAST(N'2001-10-09T09:55:11.0000000' AS DateTime2), 44, NULL, N'Zhaowu', N'40669', N'Katie', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (802, N'Mildred', N'Glanz', CAST(N'2005-07-14T05:21:21.0000000' AS DateTime2), 25, N'172372', N'Vykhino-Zhulebino', N'33', N'1st', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (803, N'Neilla', N'Rannie', CAST(N'1991-11-03T23:57:49.0000000' AS DateTime2), 118, NULL, N'Bejucal', N'10', N'Rutledge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (804, N'Ardyce', N'Tuffs', CAST(N'1991-10-26T10:00:37.0000000' AS DateTime2), 119, NULL, N'Nangahale', N'2140', N'Brickson Park', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (805, N'Alfonso', N'Bittany', CAST(N'1988-01-05T13:04:36.0000000' AS DateTime2), 205, N'91194 CEDEX', N'Gif-sur-Yvette', N'85', N'Randy', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (806, N'Bathsheba', N'MacAirt', CAST(N'2000-01-31T04:10:36.0000000' AS DateTime2), 133, N'22710', N'Föglö', N'563', N'Waxwing', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (807, N'Joyann', N'Wegman', CAST(N'1985-08-13T10:11:51.0000000' AS DateTime2), 26, NULL, N'Tanjungbatu', N'363', N'Johnson', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (808, N'Rodrique', N'Souness', CAST(N'1996-09-26T22:39:59.0000000' AS DateTime2), 74, N'N9V', N'Osoyoos', N'79156', N'Union', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (809, N'Dorotea', N'Chesterfield', CAST(N'2001-05-30T01:33:11.0000000' AS DateTime2), 40, N'658972', N'Bastan', N'64', N'Buena Vista', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (810, N'Quillan', N'Lathee', CAST(N'1996-07-08T22:40:16.0000000' AS DateTime2), 175, NULL, N'Kafr Zayta', N'2745', N'Ohio', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (811, N'Drucie', N'Novacek', CAST(N'1986-04-10T06:34:03.0000000' AS DateTime2), 205, N'3706', N'Aviá Terai', N'94276', N'Muir', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (812, N'Ad', N'De Fraine', CAST(N'1994-11-14T13:16:20.0000000' AS DateTime2), 186, N'77895-000', N'Nazaré', N'74697', N'Thackeray', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (813, N'Jennie', N'Skally', CAST(N'1975-03-09T11:11:35.0000000' AS DateTime2), 24, NULL, N'Maba', N'1', N'Dawn', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (814, N'Thomasin', N'Schust', CAST(N'1995-03-29T03:07:26.0000000' AS DateTime2), 92, NULL, N'Majiang', N'12579', N'Maple', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (815, N'Rosie', N'Bispo', CAST(N'1997-12-07T16:46:10.0000000' AS DateTime2), 186, N'2776', N'Delareyville', N'599', N'5th', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (816, N'Norry', N'MacGraith', CAST(N'1983-04-19T02:50:01.0000000' AS DateTime2), 115, NULL, N'Martil', N'0', N'Algoma', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (817, N'Bogey', N'Wederell', CAST(N'1994-10-31T04:58:53.0000000' AS DateTime2), 27, NULL, N'Tanggulangin', N'0', N'Helena', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (818, N'Dionne', N'Pargiter', CAST(N'1972-04-08T06:03:17.0000000' AS DateTime2), 156, N'9004', N'Claveria', N'5123', N'Brickson Park', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (819, N'Rhianna', N'Ascrofte', CAST(N'1982-05-07T00:21:59.0000000' AS DateTime2), 17, NULL, N'Queniquea', N'7', N'Lyons', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (820, N'Asher', N'Bediss', CAST(N'1997-02-28T05:12:55.0000000' AS DateTime2), 87, N'8510', N'Talacogon', N'38152', N'Twin Pines', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (821, N'Malia', N'Richold', CAST(N'1974-11-25T10:52:29.0000000' AS DateTime2), 70, N'34260', N'Chanuman', N'422', N'Beilfuss', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (822, N'Skippie', N'Neads', CAST(N'1997-12-07T06:54:32.0000000' AS DateTime2), 182, NULL, N'Kolympári', N'0569', N'Hanson', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (823, N'Clement', N'Choppen', CAST(N'1971-12-17T15:36:22.0000000' AS DateTime2), 219, N'4600', N'Villa Santa Rita', N'5022', N'Loeprich', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (824, N'Kaitlin', N'Duffield', CAST(N'1985-08-17T18:27:56.0000000' AS DateTime2), 188, NULL, N'Tessaoua', N'69', N'Hansons', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (825, N'Erskine', N'Beldom', CAST(N'1997-04-08T10:32:15.0000000' AS DateTime2), 176, NULL, N'Talcahuano', N'3787', N'Hanover', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (826, N'Keven', N'Ceely', CAST(N'1977-09-25T17:28:14.0000000' AS DateTime2), 168, NULL, N'Bayt ‘Anan', N'0', N'Valley Edge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (827, N'Addison', N'Briereton', CAST(N'1982-01-11T03:36:40.0000000' AS DateTime2), 218, N'4328', N'Lucban', N'83', N'Hollow Ridge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (828, N'Noemi', N'Parradine', CAST(N'1984-09-24T13:29:37.0000000' AS DateTime2), 24, N'630-2355', N'Omagari', N'54', N'Truax', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (829, N'Susanna', N'Kemery', CAST(N'2004-05-31T04:40:25.0000000' AS DateTime2), 34, N'D13', N'Bayside', N'790', N'Redwing', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (830, N'Sandra', N'Chanter', CAST(N'1981-05-30T11:05:48.0000000' AS DateTime2), 46, N'412292', N'Luga', N'76', N'Kenwood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (831, N'Darcy', N'Jerratsch', CAST(N'1989-03-11T16:53:59.0000000' AS DateTime2), 39, N'35900-000', N'Itabira', N'514', N'Cherokee', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (832, N'Ginny', N'Schuricke', CAST(N'2002-10-28T23:26:20.0000000' AS DateTime2), 57, NULL, N'Batangafo', N'5097', N'Glendale', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (833, N'Welch', N'Espinos', CAST(N'1984-01-29T06:19:57.0000000' AS DateTime2), 189, NULL, N'Maubara', N'28148', N'Paget', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (834, N'Justina', N'Diego', CAST(N'1992-05-18T20:26:10.0000000' AS DateTime2), 36, N'2800-011', N'Almada', N'333', N'Menomonie', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (835, N'Maryann', N'Bridgewood', CAST(N'1983-11-07T13:32:57.0000000' AS DateTime2), 128, N'97-413', N'Belchatów', N'7151', N'Hallows', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (836, N'Kellsie', N'Whitmarsh', CAST(N'1976-03-26T02:40:26.0000000' AS DateTime2), 12, N'9033', N'Alto Río Senguer', N'37', N'Pine View', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (837, N'Patrizius', N'Brimicombe', CAST(N'2000-01-05T04:52:08.0000000' AS DateTime2), 220, N'53285', N'Milwaukee', N'06', N'Muir', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (838, N'Felix', N'Marcq', CAST(N'2004-02-18T06:39:26.0000000' AS DateTime2), 91, N'3913', N'Chhagalnaiya', N'042', N'Scofield', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (839, N'Romeo', N'Hanscome', CAST(N'1995-01-08T01:16:13.0000000' AS DateTime2), 134, NULL, N'Majiang', N'53', N'Stephen', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (840, N'Peder', N'Bendel', CAST(N'1991-07-16T15:03:06.0000000' AS DateTime2), 189, N'528539', N'Tumaco', N'8260', N'Logan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (841, N'Sharon', N'Cookney', CAST(N'1981-01-07T23:11:27.0000000' AS DateTime2), 148, NULL, N'Shezhu', N'20601', N'Algoma', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (842, N'Leigh', N'Whyley', CAST(N'1981-03-15T06:49:42.0000000' AS DateTime2), 139, N'9650-015', N'Água Retorta', N'68', N'Basil', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (843, N'Gale', N'Bennison', CAST(N'1981-05-05T02:41:54.0000000' AS DateTime2), 118, N'2550-523', N'Vermelha', N'7', N'Harper', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (844, N'Lynnelle', N'Rupert', CAST(N'2005-07-06T00:56:11.0000000' AS DateTime2), 14, NULL, N'Nubma', N'018', N'Merrick', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (845, N'Cilka', N'Bothwell', CAST(N'1977-05-22T04:27:44.0000000' AS DateTime2), 157, N'34-330', N'Zywiec', N'4969', N'Muir', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (846, N'Brooke', N'Whissell', CAST(N'1990-04-29T11:44:08.0000000' AS DateTime2), 133, N'62-060', N'Steszew', N'80723', N'Lotheville', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (847, N'Holden', N'Dansken', CAST(N'1985-03-17T18:15:20.0000000' AS DateTime2), 98, NULL, N'Praia', N'68062', N'Hanson', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (848, N'Fraser', N'Pullar', CAST(N'1983-09-01T17:29:35.0000000' AS DateTime2), 197, NULL, N'Wailolong', N'61620', N'Dennis', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (849, N'Edin', N'Wearing', CAST(N'1987-03-23T01:16:37.0000000' AS DateTime2), 95, NULL, N'Hrazdan', N'71253', N'2nd', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (850, N'Drusi', N'Hancox', CAST(N'1989-01-02T10:02:46.0000000' AS DateTime2), 2, NULL, N'Osveya', N'4', N'Arapahoe', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (851, N'Tammie', N'Bocock', CAST(N'1996-01-20T11:20:30.0000000' AS DateTime2), 198, N'87330', N'Jardin', N'8', N'Knutson', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (852, N'Lancelot', N'Maddin', CAST(N'1971-11-17T21:07:44.0000000' AS DateTime2), 77, N'12300-000', N'Jacareí', N'433', N'Transport', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (853, N'Audrye', N'Migheli', CAST(N'1996-06-30T19:05:12.0000000' AS DateTime2), 31, NULL, N'Hupalivka', N'1660', N'Dawn', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (854, N'Tamera', N'Folling', CAST(N'1994-12-26T01:46:29.0000000' AS DateTime2), 88, NULL, N'Brak', N'2106', N'Miller', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (855, N'Vittoria', N'Mattersley', CAST(N'1995-05-31T22:13:47.0000000' AS DateTime2), 210, N'45204 CEDEX', N'Montargis', N'7527', N'Lyons', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (856, N'Logan', N'Mohammad', CAST(N'1971-12-13T15:40:29.0000000' AS DateTime2), 36, NULL, N'Dzhalilabad', N'0', N'Amoth', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (857, N'Devonne', N'Yarwood', CAST(N'1996-05-01T15:02:23.0000000' AS DateTime2), 34, NULL, N'Áno Liósia', N'0818', N'Maywood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (858, N'Alexandre', N'Parry', CAST(N'2002-04-06T11:43:53.0000000' AS DateTime2), 113, N'39271', N'El Limon', N'61158', N'Golf Course', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (859, N'Laural', N'Blance', CAST(N'1974-02-11T15:00:06.0000000' AS DateTime2), 140, N'3019', N'Marilao', N'77', N'Pepper Wood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (860, N'Leela', N'Galbraith', CAST(N'1992-03-24T13:59:09.0000000' AS DateTime2), 71, NULL, N'Jiaozuo', N'1963', N'Thompson', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (861, N'Eda', N'Telford', CAST(N'1971-08-22T17:33:49.0000000' AS DateTime2), 2, NULL, N'Carahue', N'31', N'Cordelia', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (862, N'Anstice', N'Androsik', CAST(N'1982-11-06T02:05:36.0000000' AS DateTime2), 225, NULL, N'Na?iyat Hiran', N'6642', N'Buhler', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (863, N'Rona', N'Guille', CAST(N'1983-02-19T03:56:57.0000000' AS DateTime2), 67, NULL, N'Jiefang', N'8', N'Kingsford', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (864, N'Roseanne', N'Polly', CAST(N'1986-05-28T18:48:20.0000000' AS DateTime2), 189, NULL, N'Ewarton', N'2033', N'Magdeline', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (865, N'Bobette', N'Rennox', CAST(N'1975-11-04T09:56:16.0000000' AS DateTime2), 206, NULL, N'Wushishi', N'1182', N'Upham', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (866, N'Lois', N'Mitchelson', CAST(N'1971-04-25T01:05:04.0000000' AS DateTime2), 16, NULL, N'Etinan', N'86007', N'Dakota', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (867, N'Sibilla', N'Vivyan', CAST(N'1988-07-29T22:33:55.0000000' AS DateTime2), 25, N'50009 CEDEX', N'Saint-Lô', N'5686', N'Merry', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (868, N'Franny', N'Dumbelton', CAST(N'2001-11-09T08:07:56.0000000' AS DateTime2), 198, N'2402', N'Malbug', N'2021', N'Warner', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (869, N'Helaina', N'Impson', CAST(N'1985-03-25T19:25:44.0000000' AS DateTime2), 140, N'T1S', N'Okotoks', N'9812', N'Shoshone', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (870, N'Rodney', N'Raye', CAST(N'1987-04-18T12:12:03.0000000' AS DateTime2), 226, N'47951', N'New Mirpur', N'75346', N'Holmberg', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (871, N'Willis', N'Long', CAST(N'1997-12-19T17:36:24.0000000' AS DateTime2), 164, N'79114', N'Freiburg im Breisgau', N'636', N'Hallows', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (872, N'Bard', N'Winterbotham', CAST(N'1994-10-09T16:30:36.0000000' AS DateTime2), 47, NULL, N'Quanxi', N'1324', N'Sunnyside', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (873, N'Marten', N'Luparto', CAST(N'1981-01-05T04:11:45.0000000' AS DateTime2), 228, NULL, N'Yamango', N'304', N'Cambridge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (874, N'Ramona', N'Keach', CAST(N'1985-09-30T20:45:31.0000000' AS DateTime2), 214, N'793 50', N'Leksand', N'5608', N'Waubesa', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (875, N'Almira', N'Davidovits', CAST(N'1972-12-27T18:55:32.0000000' AS DateTime2), 33, N'5049', N'Veliko Turnovo', N'9358', N'Armistice', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (876, N'Ginger', N'Jeratt', CAST(N'1997-06-28T00:47:06.0000000' AS DateTime2), 21, N'11024', N'Great Neck', N'51', N'Surrey', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (877, N'Flory', N'Stollwerck', CAST(N'2001-09-17T13:15:09.0000000' AS DateTime2), 32, N'100 52', N'Stockholm', N'2829', N'Dahle', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (878, N'Humfrey', N'Markushkin', CAST(N'1973-12-29T16:16:41.0000000' AS DateTime2), 69, N'0850', N'Dinahican', N'06935', N'Fair Oaks', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (879, N'Allene', N'Shackleford', CAST(N'1975-12-06T04:46:04.0000000' AS DateTime2), 131, NULL, N'Dongtian', N'52965', N'Thompson', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (880, N'Vachel', N'Burnsyde', CAST(N'2003-03-03T12:37:39.0000000' AS DateTime2), 27, N'12640', N'Kalvola', N'51951', N'Londonderry', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (881, N'Jaquelin', N'Elcomb', CAST(N'2000-09-12T19:37:50.0000000' AS DateTime2), 194, N'14900-000', N'Itápolis', N'0', N'Kennedy', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (882, N'Kathie', N'Keri', CAST(N'1974-11-02T15:12:21.0000000' AS DateTime2), 131, N'8306', N'Marihatag', N'387', N'Union', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (883, N'Marshal', N'Tunkin', CAST(N'1992-11-18T09:18:15.0000000' AS DateTime2), 202, N'29094', N'Loma Bonita', N'89', N'Dottie', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (884, N'Bronson', N'Rodenburg', CAST(N'1973-08-04T21:51:50.0000000' AS DateTime2), 144, N'7305', N'Tiglauigan', N'881', N'Esker', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (885, N'Murial', N'Scrivener', CAST(N'1979-11-06T19:04:16.0000000' AS DateTime2), 221, NULL, N'Konkwesso', N'8770', N'Mccormick', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (886, N'Ebba', N'Lazarus', CAST(N'1990-05-29T04:42:45.0000000' AS DateTime2), 37, NULL, N'Songbo', N'97135', N'Prairie Rose', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (887, N'Kenyon', N'Kmiec', CAST(N'1989-12-11T01:44:24.0000000' AS DateTime2), 3, N'65951 CEDEX 9', N'Tarbes', N'2577', N'Butterfield', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (888, N'Myrvyn', N'Francescone', CAST(N'1974-08-07T05:20:31.0000000' AS DateTime2), 186, NULL, N'Pameungpeuk', N'3', N'Sage', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (889, N'Harlen', N'Raynton', CAST(N'1980-01-05T23:11:17.0000000' AS DateTime2), 160, N'103 98', N'Stockholm', N'1', N'Hagan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (890, N'Lanny', N'Yapp', CAST(N'1985-06-28T07:53:06.0000000' AS DateTime2), 184, NULL, N'Mufulira', N'330', N'Macpherson', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (891, N'Antonetta', N'Doumerc', CAST(N'1995-06-26T00:03:18.0000000' AS DateTime2), 130, NULL, N'Shencun', N'17', N'Fairview', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (892, N'Josepha', N'Anstee', CAST(N'1982-07-21T09:40:32.0000000' AS DateTime2), 26, NULL, N'Baranti', N'9232', N'Fair Oaks', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (893, N'Larisa', N'Warrilow', CAST(N'2004-04-22T12:13:28.0000000' AS DateTime2), 54, NULL, N'Gungguh', N'13586', N'Northport', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (894, N'Nikoletta', N'Alphege', CAST(N'1986-08-03T22:03:32.0000000' AS DateTime2), 223, N'91295 CEDEX', N'Arpajon', N'00313', N'Mandrake', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (895, N'Jacquette', N'Cowitz', CAST(N'1971-09-08T06:59:29.0000000' AS DateTime2), 167, NULL, N'Zhangcunping', N'39311', N'Chinook', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (896, N'Waldon', N'Kellart', CAST(N'1985-10-07T21:10:01.0000000' AS DateTime2), 7, NULL, N'Longbu', N'7', N'Maple', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (897, N'Tanney', N'Northern', CAST(N'1996-10-29T01:40:13.0000000' AS DateTime2), 127, N'239 35', N'Skanör', N'42', N'Rieder', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (898, N'Alfons', N'Mumby', CAST(N'1985-05-27T01:28:36.0000000' AS DateTime2), 100, N'2425-207', N'Vale da Bajouca', N'0', N'Talmadge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (899, N'Latrina', N'Enriquez', CAST(N'1996-07-21T04:22:40.0000000' AS DateTime2), 127, NULL, N'Timbrangan', N'0095', N'Blackbird', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (900, N'Ardeen', N'Llewelyn', CAST(N'1995-08-11T02:39:38.0000000' AS DateTime2), 58, N'35000', N'Yasothon', N'17', N'Swallow', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (901, N'Claudine', N'Firbanks', CAST(N'1979-01-23T13:55:21.0000000' AS DateTime2), 186, NULL, N'Kufayrit', N'7', N'Hovde', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (902, N'Arvie', N'Plows', CAST(N'1986-12-29T14:12:44.0000000' AS DateTime2), 132, N'33394 CEDEX', N'Blaye', N'43621', N'Mcguire', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (903, N'Blondell', N'Bittlestone', CAST(N'2002-09-13T01:28:15.0000000' AS DateTime2), 114, N'44966 CEDEX 9', N'Nantes', N'19', N'Sachs', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (904, N'Mariellen', N'Ruslen', CAST(N'1987-03-05T19:36:28.0000000' AS DateTime2), 16, N'330 27', N'Vejprnice', N'452', N'Bonner', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (905, N'Nobe', N'Fellis', CAST(N'2003-08-29T11:05:01.0000000' AS DateTime2), 168, NULL, N'Vishow', N'8945', N'Anthes', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (906, N'Mirabella', N'Lapsley', CAST(N'2005-06-11T09:40:51.0000000' AS DateTime2), 32, N'164 30', N'Kista', N'85332', N'Hayes', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (907, N'Windy', N'Horlick', CAST(N'1989-10-09T22:00:13.0000000' AS DateTime2), 152, N'931 22', N'Skellefteå', N'4', N'Old Shore', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (908, N'Corey', N'Tilson', CAST(N'1993-10-11T10:40:29.0000000' AS DateTime2), 31, NULL, N'Bi’r al ‘Abd', N'04', N'Loeprich', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (909, N'Base', N'Goodfield', CAST(N'1972-05-30T07:59:23.0000000' AS DateTime2), 111, N'9103', N'Sagay', N'5', N'Surrey', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (910, N'Morty', N'Howkins', CAST(N'1975-01-31T22:38:41.0000000' AS DateTime2), 65, N'732028', N'Mariquita', N'0', N'Spohn', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (911, N'Gabi', N'Beauchamp', CAST(N'1996-01-29T20:53:41.0000000' AS DateTime2), 186, NULL, N'Mufushan', N'43', N'Sauthoff', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (912, N'Norri', N'Pottie', CAST(N'1977-07-04T12:07:11.0000000' AS DateTime2), 124, N'5570', N'San Martín', N'42', N'Melrose', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (913, N'Briana', N'Skrzynski', CAST(N'2004-05-08T06:31:56.0000000' AS DateTime2), 33, N'L2T', N'Swan Hills', N'176', N'David', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (914, N'Eddie', N'Mustarde', CAST(N'2003-01-06T22:14:58.0000000' AS DateTime2), 78, NULL, N'Daying', N'9931', N'Anhalt', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (915, N'Gunther', N'Magog', CAST(N'1980-02-21T19:50:53.0000000' AS DateTime2), 135, N'25800-000', N'Três Rios', N'6335', N'Bunting', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (916, N'Justin', N'Cleverley', CAST(N'1971-05-11T04:38:01.0000000' AS DateTime2), 2, NULL, N'Georgievka', N'85688', N'Southridge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (917, N'Jennine', N'Carnew', CAST(N'1971-07-28T00:36:23.0000000' AS DateTime2), 1, N'682 33', N'Filipstad', N'530', N'Laurel', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (918, N'Gelya', N'Lesser', CAST(N'2005-07-21T16:02:52.0000000' AS DateTime2), 41, N'22004', N'Agua Blanca', N'7', N'Mandrake', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (919, N'Josh', N'Minchella', CAST(N'1988-12-03T19:32:11.0000000' AS DateTime2), 139, N'64525-000', N'Várzea Grande', N'7232', N'Burning Wood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (920, N'Frazier', N'Graalman', CAST(N'2001-07-07T22:39:21.0000000' AS DateTime2), 73, N'8430', N'El Bolsón', N'7', N'Hazelcrest', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (921, N'Neall', N'Duckit', CAST(N'2000-01-29T03:28:54.0000000' AS DateTime2), 200, N'1804', N'Alkmaar', N'1', N'Delaware', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (922, N'Yves', N'Darinton', CAST(N'1996-05-19T21:36:05.0000000' AS DateTime2), 189, NULL, N'Tân Châu', N'3', N'Sloan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (923, N'Martyn', N'Mc Kellen', CAST(N'1981-05-24T10:20:52.0000000' AS DateTime2), 173, NULL, N'Parajara', N'5', N'Nova', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (924, N'Bren', N'Nuss', CAST(N'1992-02-02T04:43:26.0000000' AS DateTime2), 209, NULL, N'Kuje', N'40', N'Arrowood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (925, N'Isacco', N'Garrad', CAST(N'2003-03-15T20:19:52.0000000' AS DateTime2), 109, N'MD-5519', N'Rîbnita', N'2', N'Rockefeller', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (926, N'Clementine', N'Bohey', CAST(N'2005-06-20T13:19:15.0000000' AS DateTime2), 95, N'89519', N'Reno', N'4', N'Loeprich', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (927, N'Storm', N'Glastonbury', CAST(N'1975-01-21T04:43:33.0000000' AS DateTime2), 26, NULL, N'Mbandaka', N'305', N'Scott', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (928, N'Tory', N'De Few', CAST(N'2002-01-13T12:26:53.0000000' AS DateTime2), 159, NULL, N'Datong', N'44', N'Randy', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (929, N'Beryle', N'Burnett', CAST(N'2002-11-25T16:46:56.0000000' AS DateTime2), 112, NULL, N'Kuala Baru', N'21', N'Ruskin', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (930, N'Elyssa', N'Eadie', CAST(N'1973-09-17T15:32:42.0000000' AS DateTime2), 21, NULL, N'Taiping', N'2', N'Sugar', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (931, N'Judas', N'Wakelin', CAST(N'1975-02-04T20:28:46.0000000' AS DateTime2), 228, N'551 21', N'Jönköping', N'10', N'Grover', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (932, N'Papagena', N'Cahani', CAST(N'1985-11-03T00:39:25.0000000' AS DateTime2), 158, NULL, N'Sanlanbahai', N'75', N'Florence', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (933, N'Phil', N'Ollander', CAST(N'1972-07-28T14:51:46.0000000' AS DateTime2), 186, N'8311', N'Kabuynan', N'89', N'Delladonna', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (934, N'Rodi', N'Cesaric', CAST(N'1988-04-26T06:32:29.0000000' AS DateTime2), 53, N'37-121', N'Husów', N'00765', N'Mccormick', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (935, N'Tymothy', N'Gothrup', CAST(N'1973-06-14T23:09:27.0000000' AS DateTime2), 46, NULL, N'Cuihuangkou', N'8', N'Hermina', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (936, N'Sherlock', N'Falconer', CAST(N'2005-05-13T10:23:23.0000000' AS DateTime2), 129, NULL, N'Walakeri', N'414', N'Kinsman', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (937, N'Eldon', N'Creenan', CAST(N'2001-08-05T22:58:38.0000000' AS DateTime2), 122, N'4635-084', N'Constance', N'56902', N'Lunder', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (938, N'Rafael', N'Moseley', CAST(N'1990-12-03T18:52:23.0000000' AS DateTime2), 225, NULL, N'Pengandonan', N'6243', N'New Castle', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (939, N'Glendon', N'Dalgarnocht', CAST(N'2005-04-20T21:47:01.0000000' AS DateTime2), 39, N'1116', N'Acao', N'6', N'Evergreen', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (940, N'Lewes', N'Pitchford', CAST(N'2000-06-16T06:20:42.0000000' AS DateTime2), 154, NULL, N'Wushi', N'49698', N'Hermina', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (941, N'Bobina', N'Cristofolini', CAST(N'1972-08-13T10:07:52.0000000' AS DateTime2), 138, NULL, N'Banjeru', N'05', N'Westerfield', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (942, N'Paton', N'Glayzer', CAST(N'1970-11-14T05:27:04.0000000' AS DateTime2), 102, N'92684 CEDEX', N'Levallois-Perret', N'84', N'Main', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (943, N'Indira', N'Dykes', CAST(N'1990-08-28T09:09:00.0000000' AS DateTime2), 199, NULL, N'Medan', N'6544', N'Sachtjen', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (944, N'Emmalynn', N'Zavattiero', CAST(N'1991-12-29T20:08:45.0000000' AS DateTime2), 108, N'10430', N'Samobor', N'60', N'Autumn Leaf', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (945, N'Livvy', N'Mulryan', CAST(N'1988-06-03T18:19:14.0000000' AS DateTime2), 199, N'68517', N'Lincoln', N'9114', N'Sutteridge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (946, N'Blinnie', N'Paulitschke', CAST(N'2005-07-17T04:18:31.0000000' AS DateTime2), 225, N'94019 CEDEX', N'Créteil', N'2718', N'Knutson', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (947, N'Delcine', N'Teanby', CAST(N'1974-03-12T01:51:38.0000000' AS DateTime2), 69, N'E8K', N'Grand Bank', N'58821', N'Barnett', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (948, N'Barbey', N'Stoltz', CAST(N'2004-02-14T19:27:24.0000000' AS DateTime2), 23, N'94475', N'Linda Vista', N'24059', N'Becker', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (949, N'Joaquin', N'MacMenamy', CAST(N'1980-12-12T05:23:05.0000000' AS DateTime2), 157, NULL, N'Banjar Tengahbelayu', N'83287', N'Washington', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (950, N'Bride', N'Gransden', CAST(N'1992-06-10T19:37:00.0000000' AS DateTime2), 89, NULL, N'Panunggangan', N'847', N'Michigan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (951, N'Claiborn', N'Swancott', CAST(N'1971-11-08T11:24:20.0000000' AS DateTime2), 108, N'7012', N'Lumatil', N'2', N'Brentwood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (952, N'Dalt', N'Balma', CAST(N'1996-06-20T14:59:40.0000000' AS DateTime2), 152, NULL, N'Esuk Oron', N'7889', N'Susan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (953, N'Cori', N'Thurber', CAST(N'1999-07-08T23:39:29.0000000' AS DateTime2), 177, NULL, N'Campamento', N'83737', N'Arrowood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (954, N'Reeva', N'Shotbolt', CAST(N'2003-10-24T14:59:46.0000000' AS DateTime2), 114, N'341 23', N'Ljungby', N'8854', N'Armistice', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (955, N'Barty', N'Lipsett', CAST(N'1985-12-31T21:03:29.0000000' AS DateTime2), 99, N'55810-000', N'Carpina', N'6081', N'Holy Cross', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (956, N'Reginald', N'Burkman', CAST(N'1992-09-12T10:48:44.0000000' AS DateTime2), 193, NULL, N'Margasana', N'56845', N'Schmedeman', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (957, N'Hubey', N'Stancliffe', CAST(N'1988-03-11T14:12:09.0000000' AS DateTime2), 34, N'5105', N'Santa Cruz', N'69502', N'Thackeray', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (958, N'Marion', N'Lackie', CAST(N'1982-04-14T13:25:14.0000000' AS DateTime2), 99, NULL, N'Watoona', N'52423', N'Waywood', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (959, N'Jacob', N'O''Gormley', CAST(N'1992-12-23T21:09:09.0000000' AS DateTime2), 68, NULL, N'Maralal', N'943', N'Nobel', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (960, N'Rich', N'Tippings', CAST(N'1973-11-02T14:02:40.0000000' AS DateTime2), 89, NULL, N'San Lorenzo', N'9598', N'Alpine', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (961, N'Odette', N'Wooton', CAST(N'1990-10-17T23:39:37.0000000' AS DateTime2), 205, NULL, N'Mentaraman Satu', N'71', N'Warner', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (962, N'Fania', N'Chittey', CAST(N'1983-05-27T22:50:57.0000000' AS DateTime2), 111, N'281 32', N'Hässleholm', N'2516', N'Fordem', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (963, N'Alonso', N'Barnardo', CAST(N'1987-05-24T08:26:19.0000000' AS DateTime2), 77, NULL, N'Changning', N'78546', N'Dwight', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (964, N'Lainey', N'Jeanenet', CAST(N'1985-06-04T06:11:05.0000000' AS DateTime2), 54, N'413545', N'Gornyy', N'23', N'South', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (965, N'Susann', N'Pudge', CAST(N'1977-03-11T02:15:05.0000000' AS DateTime2), 213, NULL, N'Badaogu', N'09839', N'Pennsylvania', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (966, N'Ursala', N'Becker', CAST(N'1970-10-15T17:18:32.0000000' AS DateTime2), 166, NULL, N'Xingtai', N'7', N'Randy', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (967, N'Cesare', N'Applegate', CAST(N'1991-11-23T15:47:53.0000000' AS DateTime2), 115, N'38150', N'Memphis', N'0493', N'Judy', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (968, N'Allina', N'Witcher', CAST(N'1977-06-19T06:07:13.0000000' AS DateTime2), 222, NULL, N'Shahba', N'9615', N'Summer Ridge', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (969, N'Ede', N'Fear', CAST(N'1996-05-16T20:44:36.0000000' AS DateTime2), 144, N'3105', N'Pato-o', N'3', N'Mallory', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (970, N'Rose', N'Eliaz', CAST(N'1998-05-24T22:22:26.0000000' AS DateTime2), 7, NULL, N'Banyo', N'202', N'Summit', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (971, N'Xenia', N'McGruar', CAST(N'1988-08-01T07:46:56.0000000' AS DateTime2), 57, N'655735', N'Biskamzha', N'917', N'Banding', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (972, N'Delphinia', N'Birkbeck', CAST(N'1998-04-01T23:37:11.0000000' AS DateTime2), 11, NULL, N'Cheping', N'01', N'Oriole', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (973, N'Steven', N'Nabbs', CAST(N'1971-08-11T01:05:58.0000000' AS DateTime2), 60, N'93658', N'Kuching', N'40', N'Steensland', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (974, N'Erroll', N'Le Noire', CAST(N'1990-10-23T13:25:20.0000000' AS DateTime2), 163, N'2775-381', N'Arneiro', N'833', N'Forest Dale', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (975, N'Kev', N'Jeanel', CAST(N'1986-10-21T15:27:03.0000000' AS DateTime2), 40, N'30240', N'Ban Huai Thalaeng', N'36614', N'Victoria', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (976, N'Hally', N'Thickens', CAST(N'1977-09-11T09:03:02.0000000' AS DateTime2), 192, N'382 33', N'Nybro', N'0780', N'Macpherson', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (977, N'Ursala', N'Martinolli', CAST(N'1993-01-23T16:15:23.0000000' AS DateTime2), 230, NULL, N'Xinjie', N'014', N'Mayfield', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (978, N'Guthrey', N'Borrill', CAST(N'2000-10-21T00:08:00.0000000' AS DateTime2), 163, NULL, N'Kisii', N'022', N'Melrose', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (979, N'Hildagarde', N'Whorlton', CAST(N'1987-12-09T12:00:44.0000000' AS DateTime2), 1, NULL, N'Oubei', N'4', N'Michigan', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (980, N'Elfreda', N'Greenlees', CAST(N'1985-02-20T12:43:29.0000000' AS DateTime2), 30, N'2420', N'Alangilanan', N'64265', N'Clyde Gallagher', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (981, N'Fernandina', N'Stoves', CAST(N'2004-08-15T09:27:52.0000000' AS DateTime2), 86, N'37-565', N'Pawlosiów', N'190', N'Stephen', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (982, N'Neille', N'Sheekey', CAST(N'1978-01-22T05:58:19.0000000' AS DateTime2), 33, NULL, N'Jinji', N'48512', N'Hoard', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (983, N'Jo-ann', N'Hachette', CAST(N'1997-02-12T12:13:01.0000000' AS DateTime2), 131, N'L-5465', N'Waldbredimus', N'29581', N'Fair Oaks', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (984, N'Gabriele', N'Darter', CAST(N'1993-07-04T12:25:38.0000000' AS DateTime2), 14, NULL, N'Lianhe', N'4', N'Nova', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (985, N'Michail', N'Haydn', CAST(N'1995-11-11T08:04:44.0000000' AS DateTime2), 120, NULL, N'Kedungreja', N'184', N'Service', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (986, N'Enoch', N'Mandel', CAST(N'2000-04-04T07:00:59.0000000' AS DateTime2), 23, N'658059', N'Sannikovo', N'2995', N'Farmco', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (987, N'Joni', N'Fratson', CAST(N'1983-05-13T02:42:36.0000000' AS DateTime2), 128, N'19300-000', N'Presidente Bernardes', N'9850', N'Dahle', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (988, N'Terese', N'Riquet', CAST(N'1975-01-26T11:20:33.0000000' AS DateTime2), 222, N'391237', N'Tyoply Stan', N'6', N'Rieder', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (989, N'Orren', N'Miroy', CAST(N'1993-08-24T22:42:28.0000000' AS DateTime2), 115, NULL, N'Ketara', N'64', N'Westend', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (990, N'Clayson', N'Postance', CAST(N'1973-12-31T23:31:20.0000000' AS DateTime2), 23, N'640961', N'Kurgan', N'061', N'Mccormick', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (991, N'Cherry', N'Grason', CAST(N'1987-09-27T23:40:14.0000000' AS DateTime2), 59, N'4228', N'Banaybanay', N'37303', N'Anderson', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (992, N'Maurie', N'Chilcotte', CAST(N'1979-04-30T19:53:59.0000000' AS DateTime2), 192, N'07309 CEDEX', N'Tournon-sur-Rhône', N'2', N'Fieldstone', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (993, N'Karrie', N'Boulder', CAST(N'2004-03-27T03:51:10.0000000' AS DateTime2), 140, N'5875', N'San Javier', N'4', N'Commercial', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (994, N'Boycie', N'Boydle', CAST(N'1973-12-24T12:56:18.0000000' AS DateTime2), 148, NULL, N'Citeureup', N'09', N'Carioca', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (995, N'Mirella', N'Slaten', CAST(N'1983-05-05T17:41:06.0000000' AS DateTime2), 130, N'F45', N'Caherconlish', N'3', N'Monument', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (996, N'Grete', N'Fasse', CAST(N'1974-07-12T13:42:53.0000000' AS DateTime2), 156, N'242750', N'Dubrovka', N'6723', N'Lake View', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (997, N'Elisa', N'Sirmon', CAST(N'1981-08-10T01:05:00.0000000' AS DateTime2), 124, N'65000', N'Phitsanulok', N'29944', N'Hanson', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (998, N'Oswald', N'Garm', CAST(N'1989-02-12T02:35:35.0000000' AS DateTime2), 97, NULL, N'Gornja Koprivna', N'89945', N'Sunnyside', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (999, N'Elsa', N'Sybry', CAST(N'1999-06-30T23:09:05.0000000' AS DateTime2), 222, NULL, N'Chengjiang', N'6', N'Nelson', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (1000, N'Lydon', N'Allberry', CAST(N'1972-10-08T14:52:07.0000000' AS DateTime2), 68, N'4830-813', N'Chãos', N'822', N'Bellgrove', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (1001, N'Shelden', N'Fransson', CAST(N'1985-06-25T10:11:46.0000000' AS DateTime2), 194, NULL, N'Jiamachi', N'232', N'Rieder', 0, 0)
    GO
    INSERT [dbo].[Drivers] ([Id], [Name], [Surname], [Birthdate], [IdCountry], [PostalCode], [City], [Number], [Street], [Payed], [DepositReturned]) VALUES (1002, N'Maryjane', N'Waddoups', CAST(N'1988-03-15T04:29:21.0000000' AS DateTime2), 152, NULL, N'Petit Raffray', N'349', N'Sommers', 0, 0)
    GO
    SET IDENTITY_INSERT [dbo].[Drivers] OFF
    GO
    SET IDENTITY_INSERT [dbo].[VehiculeTypes] ON
    GO
    INSERT [dbo].[VehiculeTypes] ([Id], [Label], [Price]) VALUES (1, N'Moto', CAST(90.00 AS Decimal(10, 2)))
    GO
    INSERT [dbo].[VehiculeTypes] ([Id], [Label], [Price]) VALUES (2, N'Quad', CAST(90.00 AS Decimal(10, 2)))
    GO
    INSERT [dbo].[VehiculeTypes] ([Id], [Label], [Price]) VALUES (3, N'SSV', CAST(105.00 AS Decimal(10, 2)))
    GO
    INSERT [dbo].[VehiculeTypes] ([Id], [Label], [Price]) VALUES (4, N'Quad + Passager', CAST(105.00 AS Decimal(10, 2)))
    GO
    SET IDENTITY_INSERT [dbo].[VehiculeTypes] OFF
    GO
    SET ANSI_PADDING ON
    GO
/****** Object:  Index [UQ__Countrie__C4979A23F55D8078]    Script Date: 26/08/2024 20:35:28 ******/
ALTER TABLE [dbo].[Countries] ADD UNIQUE NONCLUSTERED
    (
    [ISO] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    GO
    SET ANSI_PADDING ON
    GO
/****** Object:  Index [UQ__Countrie__D9C1FA007750E159]    Script Date: 26/08/2024 20:35:28 ******/
ALTER TABLE [dbo].[Countries] ADD UNIQUE NONCLUSTERED
    (
    [NAME] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    GO
ALTER TABLE [dbo].[Drivers] ADD  CONSTRAINT [DF_Driver_Payed]  DEFAULT ((0)) FOR [Payed]
    GO
ALTER TABLE [dbo].[Drivers] ADD  CONSTRAINT [DF_Driver_DepositReturned]  DEFAULT ((0)) FOR [DepositReturned]
    GO
ALTER TABLE [dbo].[Bibs]  WITH CHECK ADD  CONSTRAINT [FK_Bibs_BibColors] FOREIGN KEY([IdColor])
    REFERENCES [dbo].[BibColors] ([Id])
    GO
ALTER TABLE [dbo].[Bibs] CHECK CONSTRAINT [FK_Bibs_BibColors]
    GO
ALTER TABLE [dbo].[Bibs]  WITH CHECK ADD  CONSTRAINT [FK_Bibs_Driver] FOREIGN KEY([IdDriver])
    REFERENCES [dbo].[Drivers] ([Id])
    GO
ALTER TABLE [dbo].[Bibs] CHECK CONSTRAINT [FK_Bibs_Driver]
    GO
ALTER TABLE [dbo].[Drivers]  WITH CHECK ADD  CONSTRAINT [FK_Driver_Countries] FOREIGN KEY([IdCountry])
    REFERENCES [dbo].[Countries] ([ID])
    GO
ALTER TABLE [dbo].[Drivers] CHECK CONSTRAINT [FK_Driver_Countries]
    GO
ALTER TABLE [dbo].[Vehicules]  WITH CHECK ADD  CONSTRAINT [FK_Vehicule_VehiculeType] FOREIGN KEY([IdType])
    REFERENCES [dbo].[VehiculeTypes] ([Id])
    GO
ALTER TABLE [dbo].[Vehicules] CHECK CONSTRAINT [FK_Vehicule_VehiculeType]
    GO
ALTER TABLE [dbo].[Vehicules]  WITH CHECK ADD  CONSTRAINT [FK_Vehicules_Driver] FOREIGN KEY([IdDriver])
    REFERENCES [dbo].[Drivers] ([Id])
    GO
ALTER TABLE [dbo].[Vehicules] CHECK CONSTRAINT [FK_Vehicules_Driver]
    GO
    USE [master]
    GO
ALTER DATABASE [Enduro] SET  READ_WRITE
GO
