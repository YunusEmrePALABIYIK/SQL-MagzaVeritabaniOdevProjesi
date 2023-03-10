USE [master]
GO
/****** Object:  Database [Veritabaniodevyunusmagazasi]    Script Date: 20.05.2021 16:26:49 ******/
CREATE DATABASE [Veritabaniodevyunusmagazasi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Veritabaniodevyunusmagazasi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Veritabaniodevyunusmagazasi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Veritabaniodevyunusmagazasi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Veritabaniodevyunusmagazasi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Veritabaniodevyunusmagazasi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET ARITHABORT OFF 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET  MULTI_USER 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET QUERY_STORE = OFF
GO
USE [Veritabaniodevyunusmagazasi]
GO
/****** Object:  Table [dbo].[Faturalistesi]    Script Date: 20.05.2021 16:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faturalistesi](
	[urunid] [int] NOT NULL,
	[urunadi] [nvarchar](50) NOT NULL,
	[urunadeti] [int] NOT NULL,
	[urunfiyati] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[satisgetir]    Script Date: 20.05.2021 16:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[satisgetir] (@urunid int)
returns table
AS


	RETURN select*from Faturalistesi where @urunid=urunid
GO
/****** Object:  UserDefinedFunction [dbo].[fiyatgetir]    Script Date: 20.05.2021 16:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE FUNCTION [dbo].[fiyatgetir] (@urunid int)
returns table
AS


	RETURN select  urunfiyati from Faturalistesi where @urunid=urunid
GO
/****** Object:  Table [dbo].[Urunlistesi]    Script Date: 20.05.2021 16:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunlistesi](
	[urunid] [int] IDENTITY(1,1) NOT NULL,
	[urunadi] [nvarchar](50) NOT NULL,
	[urunuretimyeri] [varchar](50) NOT NULL,
	[urununuretimyili] [int] NOT NULL,
 CONSTRAINT [PK_Urunlistesi] PRIMARY KEY CLUSTERED 
(
	[urunid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Faturalistesi] ([urunid], [urunadi], [urunadeti], [urunfiyati]) VALUES (1, N'Nokia Telefon', 4, 50)
INSERT [dbo].[Faturalistesi] ([urunid], [urunadi], [urunadeti], [urunfiyati]) VALUES (2, N'Samsung Telefon', 2, 200)
INSERT [dbo].[Faturalistesi] ([urunid], [urunadi], [urunadeti], [urunfiyati]) VALUES (5, N'Terlik', 5, 10)
INSERT [dbo].[Faturalistesi] ([urunid], [urunadi], [urunadeti], [urunfiyati]) VALUES (5, N'Terlik', 8, 10)
INSERT [dbo].[Faturalistesi] ([urunid], [urunadi], [urunadeti], [urunfiyati]) VALUES (10, N'Gömlek', 3, 80)
INSERT [dbo].[Faturalistesi] ([urunid], [urunadi], [urunadeti], [urunfiyati]) VALUES (11, N'Bardak', 6, 20)
INSERT [dbo].[Faturalistesi] ([urunid], [urunadi], [urunadeti], [urunfiyati]) VALUES (3, N'Xiaomi Telefon', 2, 900)
INSERT [dbo].[Faturalistesi] ([urunid], [urunadi], [urunadeti], [urunfiyati]) VALUES (3, N'Xiaomi Telefon', 9, 900)
GO
SET IDENTITY_INSERT [dbo].[Urunlistesi] ON 

INSERT [dbo].[Urunlistesi] ([urunid], [urunadi], [urunuretimyeri], [urununuretimyili]) VALUES (1, N'Nokia Telefon', N'Japonya', 2018)
INSERT [dbo].[Urunlistesi] ([urunid], [urunadi], [urunuretimyeri], [urununuretimyili]) VALUES (2, N'Samsung Telefon', N'İsveç', 2019)
INSERT [dbo].[Urunlistesi] ([urunid], [urunadi], [urunuretimyeri], [urununuretimyili]) VALUES (3, N'Xiaomi Telefon', N'Çin', 2021)
INSERT [dbo].[Urunlistesi] ([urunid], [urunadi], [urunuretimyeri], [urununuretimyili]) VALUES (4, N'Iphone Telefon', N'Amerika', 2010)
INSERT [dbo].[Urunlistesi] ([urunid], [urunadi], [urunuretimyeri], [urununuretimyili]) VALUES (5, N'Terlik', N'Türkiye', 2018)
INSERT [dbo].[Urunlistesi] ([urunid], [urunadi], [urunuretimyeri], [urununuretimyili]) VALUES (6, N'Bot', N'Türkiye', 2019)
INSERT [dbo].[Urunlistesi] ([urunid], [urunadi], [urunuretimyeri], [urununuretimyili]) VALUES (7, N'Mont', N'Türkiye', 2020)
INSERT [dbo].[Urunlistesi] ([urunid], [urunadi], [urunuretimyeri], [urununuretimyili]) VALUES (8, N'Ceket', N'Türkiye', 2021)
INSERT [dbo].[Urunlistesi] ([urunid], [urunadi], [urunuretimyeri], [urununuretimyili]) VALUES (9, N'Pantalon', N'Türkiye', 2019)
INSERT [dbo].[Urunlistesi] ([urunid], [urunadi], [urunuretimyeri], [urununuretimyili]) VALUES (10, N'Gömlek', N'Türkiye', 2018)
INSERT [dbo].[Urunlistesi] ([urunid], [urunadi], [urunuretimyeri], [urununuretimyili]) VALUES (11, N'Bardak', N'Almanya', 2015)
INSERT [dbo].[Urunlistesi] ([urunid], [urunadi], [urunuretimyeri], [urununuretimyili]) VALUES (12, N'Kova', N'Suriye', 2012)
SET IDENTITY_INSERT [dbo].[Urunlistesi] OFF
GO
/****** Object:  StoredProcedure [dbo].[Urunadilistele]    Script Date: 20.05.2021 16:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Urunadilistele]
as
select urunadi from Urunlistesi


GO
/****** Object:  StoredProcedure [dbo].[Urunkayit]    Script Date: 20.05.2021 16:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Urunkayit]

(
@urunadi nvarchar(50),

@urunuretimyeri varchar(50),

@urununuretimyili int
)

As
Begin

Insert into Urunlistesi (urunadi,urunuretimyeri,urununuretimyili)

Values(@urunadi,@urunuretimyeri,@urununuretimyili)

End

GO
/****** Object:  StoredProcedure [dbo].[Urunyilvead]    Script Date: 20.05.2021 16:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[Urunyilvead]
as
select urunadi,urununuretimyili from Urunlistesi
GO
USE [master]
GO
ALTER DATABASE [Veritabaniodevyunusmagazasi] SET  READ_WRITE 
GO
