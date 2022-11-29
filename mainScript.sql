USE [master]
GO
/****** Object:  Database [Municipalidad]    Script Date: 29/11/2022 00:01:40 ******/
CREATE DATABASE [Municipalidad]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Municipalidad', FILENAME = N'D:\MSSQLMS\MSSQL15.MSSQLSERVER\MSSQL\DATA\Municipalidad.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Municipalidad_log', FILENAME = N'D:\MSSQLMS\MSSQL15.MSSQLSERVER\MSSQL\DATA\Municipalidad_log.ldf' , SIZE = 401408KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Municipalidad] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Municipalidad].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Municipalidad] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Municipalidad] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Municipalidad] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Municipalidad] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Municipalidad] SET ARITHABORT OFF 
GO
ALTER DATABASE [Municipalidad] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Municipalidad] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Municipalidad] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Municipalidad] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Municipalidad] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Municipalidad] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Municipalidad] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Municipalidad] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Municipalidad] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Municipalidad] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Municipalidad] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Municipalidad] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Municipalidad] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Municipalidad] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Municipalidad] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Municipalidad] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Municipalidad] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Municipalidad] SET RECOVERY FULL 
GO
ALTER DATABASE [Municipalidad] SET  MULTI_USER 
GO
ALTER DATABASE [Municipalidad] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Municipalidad] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Municipalidad] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Municipalidad] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Municipalidad] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Municipalidad] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Municipalidad', N'ON'
GO
ALTER DATABASE [Municipalidad] SET QUERY_STORE = OFF
GO
USE [Municipalidad]
GO
/****** Object:  UserDefinedTableType [dbo].[auxOrdenCorta]    Script Date: 29/11/2022 00:01:41 ******/
CREATE TYPE [dbo].[auxOrdenCorta] AS TABLE(
	[IdFactura] [int] NULL,
	[IdPropiedad] [int] NULL,
	[IdEstado] [int] NULL,
	[FechaOperación] [date] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[auxOrdenCortaA]    Script Date: 29/11/2022 00:01:41 ******/
CREATE TYPE [dbo].[auxOrdenCortaA] AS TABLE(
	[IdFactura] [int] NULL,
	[IdPropiedad] [int] NULL,
	[IdEstado] [int] NULL,
	[FechaOperación] [date] NULL
)
GO
/****** Object:  Table [dbo].[AP]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AP](
	[ID] [int] NOT NULL,
	[MontoOriginal] [money] NOT NULL,
	[IdTasaInteres] [int] NOT NULL,
	[Saldo] [nchar](10) NOT NULL,
	[AcumuladoAmortizacion] [money] NOT NULL,
	[AcumuladoPagado] [money] NOT NULL,
	[IdPropiedad] [int] NOT NULL,
 CONSTRAINT [PK_AP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArregloPago]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArregloPago](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
 CONSTRAINT [PK_ArregloPago] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CambiosEntidades]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CambiosEntidades](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEntityType] [int] NOT NULL,
	[EntityId] [int] NULL,
	[jsonAntes] [varchar](500) NULL,
	[jsonDespues] [varchar](500) NULL,
	[insertedAt] [datetime] NOT NULL,
	[insertedBy] [varchar](20) NOT NULL,
	[insertedIn] [varchar](20) NOT NULL,
 CONSTRAINT [PK_CambiosEntidades] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConceptoCobro]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConceptoCobro](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoMontoCC] [int] NOT NULL,
	[IdPeriodoMontoCC] [int] NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
 CONSTRAINT [PK_ConceptoCobro] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConsumoAgua]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsumoAgua](
	[ID] [int] NOT NULL,
	[ValorMinimo] [money] NOT NULL,
	[ValorMinimoM3] [money] NOT NULL,
	[ValorFijoM3Adicional] [money] NOT NULL,
 CONSTRAINT [PK_ConsumoAgua] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBErrors]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBErrors](
	[errorID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
	[ErrorNumber] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorLine] [int] NULL,
	[ErrorProcedure] [varchar](max) NULL,
	[ErrorMessage] [varchar](max) NULL,
	[ErrorDateTime] [datetime] NULL,
 CONSTRAINT [PK_dbo.DBErrors] PRIMARY KEY CLUSTERED 
(
	[errorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleCC]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleCC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Monto] [money] NOT NULL,
	[IdConceptoCobro] [int] NOT NULL,
	[IdFactura] [int] NOT NULL,
 CONSTRAINT [PK_DetalleCC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleCCAgua]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleCCAgua](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Monto] [money] NOT NULL,
	[IdMovimientoConsumo] [int] NULL,
	[IdDetalleCC] [int] NOT NULL,
	[NumeroMedidor] [int] NULL,
	[FechaMovimiento] [date] NULL,
 CONSTRAINT [PK_DetalleCCAgua] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleCCAP]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleCCAP](
	[ID] [int] NOT NULL,
	[Monto] [money] NOT NULL,
	[IdMovimientoAP] [int] NOT NULL,
	[IdDetalleCC] [int] NOT NULL,
 CONSTRAINT [PK_DetalleCCAP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntityType]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntityType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](32) NOT NULL,
 CONSTRAINT [PK_EntityType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoOrdenesCorta]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoOrdenesCorta](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
 CONSTRAINT [PK_EstadoOrdenesCorta] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[FechaVencimiento] [date] NOT NULL,
	[TotalOriginal] [money] NOT NULL,
	[TotalPagar] [money] NOT NULL,
	[Estado] [int] NOT NULL,
	[IdPropiedad] [int] NOT NULL,
	[IdPago] [int] NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImpuestoPropiedad]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImpuestoPropiedad](
	[ID] [int] NOT NULL,
	[ValorPorcentual] [float] NOT NULL,
 CONSTRAINT [PK_ImpuestoPropiedad] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InteresesMoratorios]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InteresesMoratorios](
	[ID] [int] NOT NULL,
	[ValorPorcentual] [float] NOT NULL,
	[ValorFijo] [money] NOT NULL,
 CONSTRAINT [PK_InteresesMoratorios] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MantenimientoParques]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MantenimientoParques](
	[ID] [int] NOT NULL,
	[ValorPorcentual] [float] NOT NULL,
	[ValorFijo] [money] NOT NULL,
 CONSTRAINT [PK_MantenimientoParques] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientoConsumo]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoConsumo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NULL,
	[Monto] [money] NOT NULL,
	[IdTipoMovimiento] [int] NOT NULL,
	[IdPropiedadCCAgua] [int] NULL,
	[NumeroMedidor] [int] NOT NULL,
 CONSTRAINT [PK_MovimientoConsumo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientosAP]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientosAP](
	[ID] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[MontoCuota] [money] NOT NULL,
	[Amortizado] [money] NOT NULL,
	[Intereses] [float] NOT NULL,
	[IdTipoMovimiento] [int] NOT NULL,
	[IdAp] [int] NOT NULL,
 CONSTRAINT [PK_MovimientosAP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenCorta]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenCorta](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdFactura] [int] NOT NULL,
	[IdPropiedad] [int] NOT NULL,
	[IdEstado] [int] NOT NULL,
	[IdPago] [int] NULL,
	[NumeroMedidor] [int] NULL,
	[FechaOperación] [date] NOT NULL,
 CONSTRAINT [PK_OrdenCorta] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NumFinca] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[TipoPago] [int] NULL,
	[Comprobante] [int] NOT NULL,
	[IdPropiedad] [int] NOT NULL,
 CONSTRAINT [PK_Pagos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatenteComercial]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatenteComercial](
	[ID] [int] NOT NULL,
	[ValorFijo] [money] NOT NULL,
 CONSTRAINT [PK_PatenteComercial] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PeriodoMontoCC]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeriodoMontoCC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[QMeses] [int] NOT NULL,
 CONSTRAINT [PK_PeriodoMontoCC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[ValorDocId] [bigint] NOT NULL,
	[IdTipoDoc] [int] NOT NULL,
	[email] [varchar](128) NOT NULL,
	[telefono1] [bigint] NOT NULL,
	[telefono2] [bigint] NOT NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propiedad]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propiedad](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Area] [float] NOT NULL,
	[ValorFiscal] [bigint] NOT NULL,
	[FechaRegistro] [date] NOT NULL,
	[IdTipoTerreno] [int] NOT NULL,
	[IdTipoZona] [int] NOT NULL,
	[NumeroFinca] [int] NOT NULL,
	[NumeroMedidor] [int] NOT NULL,
 CONSTRAINT [PK_Propiedad] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropiedadCCAgua]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropiedadCCAgua](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NumeroMedidor] [int] NOT NULL,
	[SaldoAcumulado] [money] NOT NULL,
	[SaldoAcumuladoUltima] [money] NOT NULL,
	[IdPropiedad] [int] NOT NULL,
 CONSTRAINT [PK_PropiedadCCAgua] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropiedadXCC]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropiedadXCC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdPropiedad] [int] NOT NULL,
	[IdConceptoCobro] [int] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NULL,
 CONSTRAINT [PK_PropiedadXCC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PXP]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PXP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdPersona] [int] NOT NULL,
	[IdPropiedad] [int] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PXU]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PXU](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdPropiedad] [int] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecoleccionBasura]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecoleccionBasura](
	[ID] [int] NOT NULL,
	[ValorMinimo] [money] NOT NULL,
	[ValorFijo] [money] NOT NULL,
	[ValorM2Minimo] [money] NOT NULL,
	[ValorTractosM2] [money] NOT NULL,
 CONSTRAINT [PK_RecoleccionBasura] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reconexión]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reconexión](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdFactura] [int] NOT NULL,
	[IdOrdenCorta] [int] NOT NULL,
	[NumeroMedidor] [int] NULL,
	[FechaOperación] [date] NOT NULL,
 CONSTRAINT [PK_Reconexión] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReconexionAgua]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReconexionAgua](
	[ID] [int] NOT NULL,
	[ValorFijo] [money] NOT NULL,
 CONSTRAINT [PK_ReconexionAgua] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TasaInteresAP]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TasaInteresAP](
	[ID] [int] NOT NULL,
	[PlazoMeses] [int] NOT NULL,
	[TasaInteres] [float] NOT NULL,
 CONSTRAINT [PK_TasaInteresAP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocIdent]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocIdent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[Mascara] [varchar](128) NOT NULL,
 CONSTRAINT [PK_TipoDocIdent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEstadoFactura]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEstadoFactura](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
 CONSTRAINT [PK_TipoEstadoFactura] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMontoCC]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMontoCC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
 CONSTRAINT [PK_TipoMontoCC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimiento]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimiento](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
 CONSTRAINT [PK_TipoMovimiento] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimientoConsumo]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimientoConsumo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
 CONSTRAINT [PK_TipoMovimientoConsumo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPago]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPago](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
 CONSTRAINT [PK_TipoPago] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoTerreno]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoTerreno](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
 CONSTRAINT [PK_TipoTerreno] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoZona]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoZona](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
 CONSTRAINT [PK_TipoZona] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TotalFactura]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TotalFactura](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Monto] [money] NULL,
	[idFactura] [int] NULL,
 CONSTRAINT [PK_TotalFactura] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](128) NOT NULL,
	[Passwords] [varchar](128) NOT NULL,
	[TipoUsuario] [varchar](128) NOT NULL,
	[IdPersona] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AP]  WITH CHECK ADD  CONSTRAINT [FK_AP_Propiedad] FOREIGN KEY([IdPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[AP] CHECK CONSTRAINT [FK_AP_Propiedad]
GO
ALTER TABLE [dbo].[AP]  WITH CHECK ADD  CONSTRAINT [FK_AP_TasaInteresAP] FOREIGN KEY([IdTasaInteres])
REFERENCES [dbo].[TasaInteresAP] ([ID])
GO
ALTER TABLE [dbo].[AP] CHECK CONSTRAINT [FK_AP_TasaInteresAP]
GO
ALTER TABLE [dbo].[ArregloPago]  WITH CHECK ADD  CONSTRAINT [FK_ArregloPago_ConceptoCobro] FOREIGN KEY([ID])
REFERENCES [dbo].[ConceptoCobro] ([ID])
GO
ALTER TABLE [dbo].[ArregloPago] CHECK CONSTRAINT [FK_ArregloPago_ConceptoCobro]
GO
ALTER TABLE [dbo].[CambiosEntidades]  WITH CHECK ADD  CONSTRAINT [FK_CambiosEntidades_EntityType] FOREIGN KEY([IdEntityType])
REFERENCES [dbo].[EntityType] ([ID])
GO
ALTER TABLE [dbo].[CambiosEntidades] CHECK CONSTRAINT [FK_CambiosEntidades_EntityType]
GO
ALTER TABLE [dbo].[ConceptoCobro]  WITH CHECK ADD  CONSTRAINT [FK_ConceptoCobro_PeriodoMontoCC] FOREIGN KEY([IdPeriodoMontoCC])
REFERENCES [dbo].[PeriodoMontoCC] ([ID])
GO
ALTER TABLE [dbo].[ConceptoCobro] CHECK CONSTRAINT [FK_ConceptoCobro_PeriodoMontoCC]
GO
ALTER TABLE [dbo].[ConceptoCobro]  WITH CHECK ADD  CONSTRAINT [FK_ConceptoCobro_TipoMontoCC] FOREIGN KEY([IdTipoMontoCC])
REFERENCES [dbo].[TipoMontoCC] ([ID])
GO
ALTER TABLE [dbo].[ConceptoCobro] CHECK CONSTRAINT [FK_ConceptoCobro_TipoMontoCC]
GO
ALTER TABLE [dbo].[ConsumoAgua]  WITH CHECK ADD  CONSTRAINT [FK_ConsumoAgua_ConceptoCobro] FOREIGN KEY([ID])
REFERENCES [dbo].[ConceptoCobro] ([ID])
GO
ALTER TABLE [dbo].[ConsumoAgua] CHECK CONSTRAINT [FK_ConsumoAgua_ConceptoCobro]
GO
ALTER TABLE [dbo].[DetalleCC]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCC_ConceptoCobro] FOREIGN KEY([IdConceptoCobro])
REFERENCES [dbo].[ConceptoCobro] ([ID])
GO
ALTER TABLE [dbo].[DetalleCC] CHECK CONSTRAINT [FK_DetalleCC_ConceptoCobro]
GO
ALTER TABLE [dbo].[DetalleCC]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCC_Factura] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Factura] ([ID])
GO
ALTER TABLE [dbo].[DetalleCC] CHECK CONSTRAINT [FK_DetalleCC_Factura]
GO
ALTER TABLE [dbo].[DetalleCCAgua]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCCAgua_DetalleCC] FOREIGN KEY([IdDetalleCC])
REFERENCES [dbo].[DetalleCC] ([ID])
GO
ALTER TABLE [dbo].[DetalleCCAgua] CHECK CONSTRAINT [FK_DetalleCCAgua_DetalleCC]
GO
ALTER TABLE [dbo].[DetalleCCAgua]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCCAgua_MovimientoConsumo] FOREIGN KEY([IdMovimientoConsumo])
REFERENCES [dbo].[MovimientoConsumo] ([ID])
GO
ALTER TABLE [dbo].[DetalleCCAgua] CHECK CONSTRAINT [FK_DetalleCCAgua_MovimientoConsumo]
GO
ALTER TABLE [dbo].[DetalleCCAP]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCCAP_DetalleCC] FOREIGN KEY([IdDetalleCC])
REFERENCES [dbo].[DetalleCC] ([ID])
GO
ALTER TABLE [dbo].[DetalleCCAP] CHECK CONSTRAINT [FK_DetalleCCAP_DetalleCC]
GO
ALTER TABLE [dbo].[DetalleCCAP]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCCAP_MovimientosAP] FOREIGN KEY([IdMovimientoAP])
REFERENCES [dbo].[MovimientosAP] ([ID])
GO
ALTER TABLE [dbo].[DetalleCCAP] CHECK CONSTRAINT [FK_DetalleCCAP_MovimientosAP]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Pagos] FOREIGN KEY([IdPago])
REFERENCES [dbo].[Pagos] ([ID])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Pagos]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Pagos1] FOREIGN KEY([IdPago])
REFERENCES [dbo].[Pagos] ([ID])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Pagos1]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Propiedad] FOREIGN KEY([IdPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Propiedad]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_TipoEstadoFactura] FOREIGN KEY([Estado])
REFERENCES [dbo].[TipoEstadoFactura] ([ID])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_TipoEstadoFactura]
GO
ALTER TABLE [dbo].[ImpuestoPropiedad]  WITH CHECK ADD  CONSTRAINT [FK_ImpuestoPropiedad_ConceptoCobro] FOREIGN KEY([ID])
REFERENCES [dbo].[ConceptoCobro] ([ID])
GO
ALTER TABLE [dbo].[ImpuestoPropiedad] CHECK CONSTRAINT [FK_ImpuestoPropiedad_ConceptoCobro]
GO
ALTER TABLE [dbo].[InteresesMoratorios]  WITH CHECK ADD  CONSTRAINT [FK_InteresesMoratorios_ConceptoCobro] FOREIGN KEY([ID])
REFERENCES [dbo].[ConceptoCobro] ([ID])
GO
ALTER TABLE [dbo].[InteresesMoratorios] CHECK CONSTRAINT [FK_InteresesMoratorios_ConceptoCobro]
GO
ALTER TABLE [dbo].[MantenimientoParques]  WITH CHECK ADD  CONSTRAINT [FK_MantenimientoParques_ConceptoCobro] FOREIGN KEY([ID])
REFERENCES [dbo].[ConceptoCobro] ([ID])
GO
ALTER TABLE [dbo].[MantenimientoParques] CHECK CONSTRAINT [FK_MantenimientoParques_ConceptoCobro]
GO
ALTER TABLE [dbo].[MovimientoConsumo]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoConsumo_PropiedadCCAgua] FOREIGN KEY([IdPropiedadCCAgua])
REFERENCES [dbo].[PropiedadCCAgua] ([ID])
GO
ALTER TABLE [dbo].[MovimientoConsumo] CHECK CONSTRAINT [FK_MovimientoConsumo_PropiedadCCAgua]
GO
ALTER TABLE [dbo].[MovimientoConsumo]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoConsumo_TipoMovimientoConsumo] FOREIGN KEY([IdTipoMovimiento])
REFERENCES [dbo].[TipoMovimientoConsumo] ([ID])
GO
ALTER TABLE [dbo].[MovimientoConsumo] CHECK CONSTRAINT [FK_MovimientoConsumo_TipoMovimientoConsumo]
GO
ALTER TABLE [dbo].[MovimientosAP]  WITH CHECK ADD  CONSTRAINT [FK_MovimientosAP_AP] FOREIGN KEY([IdAp])
REFERENCES [dbo].[AP] ([ID])
GO
ALTER TABLE [dbo].[MovimientosAP] CHECK CONSTRAINT [FK_MovimientosAP_AP]
GO
ALTER TABLE [dbo].[MovimientosAP]  WITH CHECK ADD  CONSTRAINT [FK_MovimientosAP_TipoMovimiento] FOREIGN KEY([IdTipoMovimiento])
REFERENCES [dbo].[TipoMovimiento] ([ID])
GO
ALTER TABLE [dbo].[MovimientosAP] CHECK CONSTRAINT [FK_MovimientosAP_TipoMovimiento]
GO
ALTER TABLE [dbo].[OrdenCorta]  WITH CHECK ADD  CONSTRAINT [FK_OrdenCorta_EstadoOrdenesCorta1] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[EstadoOrdenesCorta] ([ID])
GO
ALTER TABLE [dbo].[OrdenCorta] CHECK CONSTRAINT [FK_OrdenCorta_EstadoOrdenesCorta1]
GO
ALTER TABLE [dbo].[OrdenCorta]  WITH CHECK ADD  CONSTRAINT [FK_OrdenCorta_Pagos] FOREIGN KEY([IdPago])
REFERENCES [dbo].[Pagos] ([ID])
GO
ALTER TABLE [dbo].[OrdenCorta] CHECK CONSTRAINT [FK_OrdenCorta_Pagos]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [FK_Pagos_TipoPago] FOREIGN KEY([TipoPago])
REFERENCES [dbo].[TipoPago] ([ID])
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [FK_Pagos_TipoPago]
GO
ALTER TABLE [dbo].[PatenteComercial]  WITH CHECK ADD  CONSTRAINT [FK_PatenteComercial_ConceptoCobro] FOREIGN KEY([ID])
REFERENCES [dbo].[ConceptoCobro] ([ID])
GO
ALTER TABLE [dbo].[PatenteComercial] CHECK CONSTRAINT [FK_PatenteComercial_ConceptoCobro]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [FK_Persona_TipoDocIdent] FOREIGN KEY([IdTipoDoc])
REFERENCES [dbo].[TipoDocIdent] ([ID])
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [FK_Persona_TipoDocIdent]
GO
ALTER TABLE [dbo].[Propiedad]  WITH CHECK ADD  CONSTRAINT [FK_Propiedad_TipoTerreno] FOREIGN KEY([IdTipoTerreno])
REFERENCES [dbo].[TipoTerreno] ([ID])
GO
ALTER TABLE [dbo].[Propiedad] CHECK CONSTRAINT [FK_Propiedad_TipoTerreno]
GO
ALTER TABLE [dbo].[Propiedad]  WITH CHECK ADD  CONSTRAINT [FK_Propiedad_TipoZona] FOREIGN KEY([IdTipoZona])
REFERENCES [dbo].[TipoZona] ([ID])
GO
ALTER TABLE [dbo].[Propiedad] CHECK CONSTRAINT [FK_Propiedad_TipoZona]
GO
ALTER TABLE [dbo].[PropiedadCCAgua]  WITH CHECK ADD  CONSTRAINT [FK_PropiedadCCAgua_PropiedadXCC] FOREIGN KEY([ID])
REFERENCES [dbo].[PropiedadXCC] ([ID])
GO
ALTER TABLE [dbo].[PropiedadCCAgua] CHECK CONSTRAINT [FK_PropiedadCCAgua_PropiedadXCC]
GO
ALTER TABLE [dbo].[PropiedadXCC]  WITH CHECK ADD  CONSTRAINT [FK_PropiedadXCC_ConceptoCobro] FOREIGN KEY([IdConceptoCobro])
REFERENCES [dbo].[ConceptoCobro] ([ID])
GO
ALTER TABLE [dbo].[PropiedadXCC] CHECK CONSTRAINT [FK_PropiedadXCC_ConceptoCobro]
GO
ALTER TABLE [dbo].[PropiedadXCC]  WITH CHECK ADD  CONSTRAINT [FK_PropiedadXCC_Propiedad] FOREIGN KEY([IdPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[PropiedadXCC] CHECK CONSTRAINT [FK_PropiedadXCC_Propiedad]
GO
ALTER TABLE [dbo].[PXP]  WITH CHECK ADD  CONSTRAINT [FK_PXP_Persona] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([ID])
GO
ALTER TABLE [dbo].[PXP] CHECK CONSTRAINT [FK_PXP_Persona]
GO
ALTER TABLE [dbo].[PXP]  WITH CHECK ADD  CONSTRAINT [FK_PXP_Propiedad] FOREIGN KEY([IdPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[PXP] CHECK CONSTRAINT [FK_PXP_Propiedad]
GO
ALTER TABLE [dbo].[PXU]  WITH CHECK ADD  CONSTRAINT [FK_PXU_Propiedad] FOREIGN KEY([IdPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[PXU] CHECK CONSTRAINT [FK_PXU_Propiedad]
GO
ALTER TABLE [dbo].[PXU]  WITH CHECK ADD  CONSTRAINT [FK_PXU_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([ID])
GO
ALTER TABLE [dbo].[PXU] CHECK CONSTRAINT [FK_PXU_Usuario]
GO
ALTER TABLE [dbo].[RecoleccionBasura]  WITH CHECK ADD  CONSTRAINT [FK_RecoleccionBasura_ConceptoCobro] FOREIGN KEY([ID])
REFERENCES [dbo].[ConceptoCobro] ([ID])
GO
ALTER TABLE [dbo].[RecoleccionBasura] CHECK CONSTRAINT [FK_RecoleccionBasura_ConceptoCobro]
GO
ALTER TABLE [dbo].[Reconexión]  WITH CHECK ADD  CONSTRAINT [FK_Reconexión_Factura] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Factura] ([ID])
GO
ALTER TABLE [dbo].[Reconexión] CHECK CONSTRAINT [FK_Reconexión_Factura]
GO
ALTER TABLE [dbo].[Reconexión]  WITH CHECK ADD  CONSTRAINT [FK_Reconexión_OrdenCorta] FOREIGN KEY([IdOrdenCorta])
REFERENCES [dbo].[OrdenCorta] ([ID])
GO
ALTER TABLE [dbo].[Reconexión] CHECK CONSTRAINT [FK_Reconexión_OrdenCorta]
GO
ALTER TABLE [dbo].[Reconexión]  WITH CHECK ADD  CONSTRAINT [FK_Reconexión_OrdenCorta1] FOREIGN KEY([IdOrdenCorta])
REFERENCES [dbo].[OrdenCorta] ([ID])
GO
ALTER TABLE [dbo].[Reconexión] CHECK CONSTRAINT [FK_Reconexión_OrdenCorta1]
GO
ALTER TABLE [dbo].[ReconexionAgua]  WITH CHECK ADD  CONSTRAINT [FK_ReconexionAgua_ConceptoCobro] FOREIGN KEY([ID])
REFERENCES [dbo].[ConceptoCobro] ([ID])
GO
ALTER TABLE [dbo].[ReconexionAgua] CHECK CONSTRAINT [FK_ReconexionAgua_ConceptoCobro]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Persona] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([ID])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Persona]
GO
/****** Object:  StoredProcedure [dbo].[asociarPXP]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[asociarPXP]
	@inNumDocId BIGINT,
	@inNumeroFinca INT, 
	@outResultCode INT OUTPUT
	--Los anteriores son los parámetros de entrada de la función.
AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
		BEGIN TRY
		--Las dos siguientes variables se utilizan para validación y también para la agregación de datos.
		DECLARE @inIdPersona INT = (SELECT P.ID FROM dbo.Persona P WHERE P.ValorDocId = @inNumDocId);
		DECLARE @inIdPropiedad INT = (SELECT P.ID FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca);
		IF NOT EXISTS(SELECT P.IdPersona, P.IdPropiedad FROM dbo.PXP P WHERE 
					P.IdPersona = @inIdPersona and P.IdPropiedad = @inIdPropiedad) --Verifica que no exista la relación.
			BEGIN TRANSACTION tAsociarPXP;
			INSERT INTO dbo.PXP --Insertar en la relación de Persona con propiedad. 
				(
				IdPersona,
				IdPropiedad,
				FechaInicio,
				FechaFin
				)
			VALUES
				(
				@inIdPersona,
				@inIdPropiedad,
				FORMAT (getdate(), 'dd-MM-yy'),
				null
				)

			DECLARE @afterAdd VARCHAR(500) = (SELECT R.[ID], R.[IdPersona], R.[IdPropiedad], R.[FechaInicio], R.[FechaFin] FROM dbo.PXP R
												WHERE R.[IdPersona] = @inIdPersona and R.[IdPropiedad] = @inIdPropiedad FOR JSON AUTO);
			DECLARE @idRelacion INT = (SELECT R.ID FROM dbo.PXP R WHERE R.IdPersona = @inIdPersona and R.IdPropiedad = @inIdPropiedad);
			INSERT INTO dbo.CambiosEntidades
				(
					IdEntityType,
					EntityId,
					jsonAntes,
					jsonDespues,
					insertedAt,
					insertedBy,
					insertedIn
				)
			VALUES
				(
				4,
				@idRelacion,
				null,
				@afterAdd,
				FORMAT (getdate(), 'dd-MM-yy'),
				'Axel',
				'1.1.1.1'
				)
				COMMIT TRANSACTION;  
		END TRY
		BEGIN CATCH --Recoge los errores
			IF @@TRANCOUNT > 1
			BEGIN
			ROLLBACK TRANSACTION tAsociarPXP;
			END
			INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			Set @outResultCode=50010; --Establece el código de error 

		END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[asociarPXU]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[asociarPXU]
	@inUsername VARCHAR(128),
	@inNumeroFinca INT,
	@outResultCode INT OUTPUT
	--Los anteriores son los parámetros de entrada de la función.
AS
BEGIN
	SET	@outResultCode = 0;
	SET NOCOUNT ON;
	BEGIN TRY
	--Las siguientes variables sirven para la validaciones de las relaciones y para agregar en la tabla.
			DECLARE @inIdUsuario INT = (SELECT U.ID FROM dbo.Usuario U WHERE U.UserName = @inUsername);
			DECLARE @inIdPropiedad INT = (SELECT P.ID FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca);

			IF NOT EXISTS(SELECT P.IdUsuario, P.IdPropiedad, P.FechaInicio, P.FechaFin FROM dbo.PXU P WHERE 
				P.IdUsuario = @inIdUsuario and P.IdPropiedad = @inIdPropiedad) --Verifica que no exista la relación.
				BEGIN TRANSACTION tAsociarPXU
						INSERT INTO dbo.PXU -- Se agrega en la tabla la relación. 
						(
						IdUsuario,
						IdPropiedad,
						FechaInicio,
						FechaFin
						)
						VALUES
						(
						@inIdUsuario,
						@inIdPropiedad,
						FORMAT (getdate(), 'dd-MM-yy'),
						null
						)
						DECLARE @inEntityId INT = (SELECT R.ID FROM dbo.PXU R 
												WHERE R.IdPropiedad = @inIdPropiedad and R.IdUsuario = @inIdUsuario);
						DECLARE @afterAdd VARCHAR(500) = (SELECT R.[ID], R.[IdUsuario], R.[IdPropiedad], R.[FechaInicio], R.[FechaFin] FROM dbo.PXU R
								WHERE R.ID = @inEntityId FOR JSON AUTO);
						INSERT INTO dbo.CambiosEntidades --Inserta en la bitácora de entidades
						(
						IdEntityType,
						EntityId,
						jsonAntes,
						jsonDespues,
						insertedAt,
						insertedBy,
						insertedIn
						)
						VALUES
						(
						5,
						@inEntityId,
						null,
						@afterAdd,
						GETDATE(),
						'Javier',
						'10.10.10.0'
						)
				COMMIT TRANSACTION
	END TRY
	BEGIN CATCH --Recoge los errores de la transacción
		IF @@TRANCOUNT > 1
			BEGIN
			ROLLBACK TRANSACTION tAsociarPXU;
			END
			INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
		SET @outResultCode = 50017;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[consultarFacturasparaAP]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[consultarFacturasparaAP]
	@inNumeroFinca INT,
	@outResultCode INT OUTPUT

AS
BEGIN
	SET NOCOUNT ON;
	SET @outResultCode = 0;
BEGIN TRY
	SELECT P.[ID], P.[Area], P.[ValorFiscal], P.[FechaRegistro], 
			P.[IdTipoTerreno], P.[IdTipoZona], P.[NumeroFinca], P.[NumeroMedidor],
			F.[ID], F.[Fecha], F.[FechaVencimiento], F.[TotalOriginal], F.[TotalPagar], 	(SELECT SUM(F.TotalPagar) FROM Propiedad P
	INNER JOIN dbo.Factura F
	ON F.IdPropiedad = P.ID
	INNER JOIN dbo.DetalleCC DCC
	ON DCC.IdFactura = F.ID
	WHERE DCC.IdConceptoCobro = 6 and P.NumeroFinca = @inNumeroFinca) 'Total Morosidad',
			F.[Estado], F.[IdPropiedad], F.[IdPago], 
			DCC.[ID], DCC.[Monto], DCC.[IdConceptoCobro], [IdFactura] FROM Propiedad P
	INNER JOIN dbo.Factura F
	ON F.IdPropiedad = P.ID
	INNER JOIN dbo.DetalleCC DCC
	ON DCC.IdFactura = F.ID
	WHERE DCC.IdConceptoCobro = 6 and P.NumeroFinca = @inNumeroFinca; --Intereses moratorios


END TRY
BEGIN CATCH
		INSERT INTO dbo.DBErrors(
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		Set @outResultCode=50140;
END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[deletePerson]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deletePerson]
	@inValorDocId BIGINT,
	@outResultCode INT OUTPUT
	--Las personas se borran con su valor de documento de identidad.
AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
		BEGIN TRY
			IF EXISTS(SELECT P.ValorDocId FROM dbo.Persona P WHERE P.ValorDocId = @inValorDocId) --Si existe la persona, la borra.
				BEGIN
					BEGIN TRANSACTION tDeletePerson
					DECLARE @beforeDelete VARCHAR(500) = (SELECT P.[ID], P.[Nombre], P.[ValorDocId], P.[IdTipoDoc], P.[email], P.[telefono1], P.[telefono2], 
													P.[activo] FROM dbo.Persona P WHERE P.ValorDocId = @inValorDocId FOR JSON AUTO);
					DECLARE @idPerson INT = (SELECT P.ID FROM dbo.Persona P WHERE P.ValorDocId = @inValorDocId);  
					UPDATE dbo.Persona 
						SET activo = 0
						WHERE ValorDocId = @inValorDocId;
					DECLARE @afterDelete VARCHAR(500) = (SELECT P.[ID], P.[Nombre], P.[ValorDocId], P.[IdTipoDoc], P.[email], P.[telefono1], P.[telefono2], 
													P.[activo] FROM dbo.Persona P WHERE P.ValorDocId = @inValorDocId FOR JSON AUTO);
					INSERT INTO dbo.CambiosEntidades( --Inserta en la bitácora de entidades
						IdEntityType,
						EntityId,
						jsonAntes,
						jsonDespues,
						insertedAt,
						insertedBy,
						insertedIn
					)
					VALUES(
						2,
						@idPerson,
						@beforeDelete,
						@afterDelete,
						GETDATE(),
						'Admin',
						'192.168.12.22'
					)
					COMMIT TRANSACTION
				END
		END TRY
	BEGIN CATCH --Recoge errores durante el SP
	IF @@TRANCOUNT > 0 
		ROLLBACK TRANSACTION tDeletePerson
		INSERT INTO dbo.DBErrors( 
		--[errorID]
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			--ERROR_STATE(),
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode = 50004;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[deleteProperty]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteProperty]
	@inNumeroFinca INT,
	@outResultCode INT
	--Las propiedades se borrarán con su número de finca, por lo tanto se pide como parámetro.
AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON; 
	BEGIN TRY
		DELETE FROM dbo.Propiedad WHERE NumeroFinca = @inNumeroFinca; --Si la propiedad existe, la borra. 
	END TRY
	BEGIN CATCH --Recoge errores durante el SP.
			INSERT INTO dbo.DBErrors(
			--[errorID]
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				--ERROR_STATE(),
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
		Set @outResultCode=50008;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[desasociarPXP]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[desasociarPXP]
	@inNumDocId BIGINT,
	@inNumeroFinca INT, 
	@outResultCode INT
	--Los parámetros que permiten borrar la relación son el documento identidad y el número de finca.  

AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON; 
	BEGIN TRY
	--Los parámetros que siguen permiten encontrar la relación a borrar, para luego borrarla en caso de existir.
		DECLARE @inIdPersona INT = (SELECT P.ID FROM dbo.Persona P WHERE P.ValorDocId = @inNumDocId);
		DECLARE @inIdPropiedad INT = (SELECT P.ID FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca);
		BEGIN TRANSACTION tDesasociarPXP
		DECLARE @beforeAssociate VARCHAR(500) = (SELECT R.[ID], R.[IdPersona], R.[IdPropiedad], R.[FechaInicio], R.[FechaFin]
									FROM dbo.PXP R WHERE R.IdPersona = @inIdPersona and R.IdPropiedad = @inIdPropiedad FOR JSON AUTO)
		UPDATE dbo.PXP
		SET FechaFin = (FORMAT (getdate(), 'dd-MM-yy')) --Formato de fecha dia-mes-anno
		WHERE IdPersona = @inIdPersona and IdPropiedad = @inIdPropiedad; --Termina la relación en caso de existir.
		DECLARE @afterAssociate VARCHAR(500) = (SELECT R.[ID], R.[IdPersona], R.[IdPropiedad], R.[FechaInicio], R.[FechaFin]
									FROM dbo.PXP R WHERE R.IdPersona = @inIdPersona and R.IdPropiedad = @inIdPropiedad FOR JSON AUTO);
		DECLARE @idRelacion INT = (SELECT R.ID FROM dbo.PXP R WHERE R.IdPersona = @inIdPersona and R.IdPropiedad = @inIdPropiedad);
		PRINT @idRelacion
		INSERT INTO dbo.CambiosEntidades --Inserta en la bitácora de entidades
		(
		IdEntityType,
		EntityId,
		jsonAntes,
		jsonDespues,
		insertedAt,
		insertedBy,
		insertedIn
		)
		VALUES
		(
		4,
		@idRelacion,
		@beforeAssociate,
		@afterAssociate,
		GETDATE(),
		'Admin',
		'192.168.1.1'
		)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH --Atrapa errores en el SP
		IF @@TRANCOUNT > 1
			ROLLBACK TRANSACTION tDesasociarPXP
		INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			PRINT ERROR_MESSAGE()
			Set @outResultCode=50011;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[desasociarPXU]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[desasociarPXU]
	@inUserName VARCHAR(128),
	@inNumeroFinca INT,
	@outResultCode INT OUTPUT
	--La relación entre propiedad y usuario se borra con el nombre de usuario y el número de finca

AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
	BEGIN TRY
	--Las siguientes variables permiten encontrar la relación a borrar mediante los ID, siempre y cuando esta exista.
		BEGIN TRANSACTION tDesasociarPXU
		DECLARE @inIdUsuario INT = (SELECT U.ID FROM dbo.Usuario U WHERE U.UserName = @inUsername);
		DECLARE @inIdPropiedad INT = (SELECT P.ID FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca);
		DECLARE @beforeAssociate VARCHAR(500) = (SELECT R.[ID], R.[IdUsuario], R.[IdPropiedad], R.[FechaInicio], R.[FechaFin]
												FROM dbo.PXU R WHERE R.IdUsuario = @inIdUsuario and R.IdPropiedad = @inIdPropiedad
												FOR JSON AUTO);
		UPDATE dbo.PXU
		SET FechaFin = (FORMAT (getdate(), 'dd-MM-yy'))
		WHERE IdUsuario = @inIdUsuario and IdPropiedad = @inIdPropiedad;
		DECLARE @afterAssociate VARCHAR(500) = (SELECT R.[ID], R.[IdUsuario], R.[IdPropiedad], R.[FechaInicio], R.[FechaFin]
												FROM dbo.PXU R WHERE R.IdUsuario = @inIdUsuario and R.IdPropiedad = @inIdPropiedad
												FOR JSON AUTO);
		DECLARE @idRelacion INT = (SELECT R.ID FROM dbo.PXU R WHERE R.IdUsuario = @inIdUsuario and R.IdPropiedad = @inIdPropiedad);
		INSERT INTO dbo.CambiosEntidades --Inserta en la bitácora de entidades
		(
		IdEntityType,
		EntityId,
		jsonAntes,
		jsonDespues,
		insertedAt,
		insertedBy,
		insertedIn
		)
		VALUES
		(
		4,
		@idRelacion,
		@beforeAssociate,
		@afterAssociate,
		GETDATE(),
		'Admin',
		'192.168.0.1'
		)
		COMMIT TRANSACTION
	END TRY 
	BEGIN CATCH --Atrapa errores durante la ejecución del SP.
		IF @@TRANCOUNT > 1
			ROLLBACK TRANSACTION tDesasociarPXU
			INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
		SET @outResultCode = 50018;
		
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[detalleXF]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[detalleXF] @inIdFactura INT
AS
BEGIN
	SELECT Monto, CC.Nombre AS Concepto
	FROM DetalleCC AS DC
	INNER JOIN ConceptoCobro AS CC
	ON CC.ID = DC.IdConceptoCobro
	WHERE IdFactura = @inIdFactura
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[insertPerson]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertPerson]
	@inNombre VARCHAR(128),
	@inValorDocId BIGINT,
	@inIdTipoDoc INT,
	@inEmail VARCHAR(128),
	@inTelefono1 BIGINT,
	@inTelefono2 BIGINT,
	@outResultCode INT OUTPUT
	--Los anteriores son los parámetros para agregar a una persona. 
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
	SET @outResultCode = 0;
	--Se verifica que la persona no exista y se agrega a la tabla Persona. 
	IF NOT EXISTS(SELECT P.Nombre, P.ValorDocId, P.IdTipoDoc, P.email, P.telefono1, P.telefono2 FROM Municipalidad.dbo.Persona P 
				WHERE P.Nombre = @inNombre and P.ValorDocId = @inValorDocId and P.IdTipoDoc = @inIdTipoDoc and P.email = @inEmail and 
						P.telefono1 = @inTelefono1 and P.telefono2 = @inTelefono2) --Si la persona no existe, la agrega 
		BEGIN TRANSACTION tInsertPerson
		INSERT INTO dbo.Persona (
			Nombre
			, ValorDocId
			, IdTipoDoc
			, email
			, telefono1
			, telefono2
			,activo
			)
			VALUES (
			@inNombre
			, @inValorDocId
			, @inIdTipoDoc
			, @inEmail
			, @inTelefono1
			, @inTelefono2,
			1
			)
			DECLARE @inId INT = (SELECT P.ID FROM dbo.Persona P WHERE P.ValorDocId = @inValorDocId); --Id para insertar en CE
			DECLARE @afterInsert VARCHAR(500) = (SELECT P.[ID], P.[Nombre], P.[ValorDocId], P.[IdTipoDoc], 
												P.[email], P.[telefono1], P.[telefono2], P.[activo]
												FROM dbo.Persona P WHERE P.ValorDocId = @inIdTipoDoc FOR JSON AUTO) --JSON de CE
			INSERT INTO dbo.CambiosEntidades --Inserta en la bitácora de entidades 
			(
			IdEntityType,
			EntityId,
			jsonAntes,
			jsonDespues,
			insertedAt,
			insertedBy,
			insertedIn
			)
			VALUES 
			(
			2,
			@inId,
			null,
			@afterInsert,
			GETDATE(),
			'Admin',
			'192.168.0.1'
			)

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH		--Atrapa errores en la ejecución del SP
		IF @@TRANCOUNT > 1
			ROLLBACK TRANSACTION tInsertPerson
		INSERT INTO dbo.DBErrors(
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		Set @outResultCode=50003;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[insertProperty]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertProperty]
	@inNumeroFinca INT,
	@inArea FLOAT,
	@inValorFiscal VARCHAR(128),
	@inFechaRegistro DATE,
	@inIdTipoTerreno INT,
	@inIdTipoZona INT,
	@outResultCode INT OUTPUT
--Los anteriores son los parámetros que permiten la creación de una propiedad.

AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SET @outResultCode = 0;
		--Si la propiedad no existe, procede a crearla en la tabla Propiedad.
		IF NOT EXISTS(SELECT P.NumeroFinca, P.Area, P.ValorFiscal, P.FechaRegistro, P.IdTipoTerreno, P.IdTipoZona
			FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca) --Si no existe la propiedad, la crea
			BEGIN
			INSERT INTO dbo.Propiedad(
				NumeroFinca,
				Area,
				ValorFiscal,
				FechaRegistro,
				IdTipoTerreno,
				IdTipoZona
			)
			VALUES(
				@inNumeroFinca,
				@inArea,
				@inValorFiscal,
				@inFechaRegistro,
				@inIdTipoTerreno,
				@inIdTipoZona
			)
			END
	END TRY
	BEGIN CATCH --Si se encuentran errores, se agregan en la tabla DBErrors 

		INSERT INTO dbo.DBErrors(
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		Set @outResultCode=50005;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[pagarRecibo]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pagarRecibo]
	@inIdRecibo INT, 
	@outResultCode INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		DECLARE @idEstado INT = (SELECT F.Estado FROM dbo.Factura F WHERE F.ID = @inIdRecibo)
		DECLARE @inFecha DATE = (SELECT F.Fecha FROM dbo.Factura F WHERE F.ID = @inIdRecibo and F.Estado = 1);
		DECLARE @inIdPropiedad INT = (SELECT F.IdPropiedad FROM dbo.Factura F WHERE F.ID = @inIdRecibo and F.Estado = 1 );
		DECLARE @inPrimerFactura DATE = (SELECT MIN(F.Fecha) FROM dbo.Factura F WHERE F.IdPropiedad = @inIdPropiedad and F.Estado = 1);
		IF @inFecha > @inPrimerFactura OR @idEstado = 2
			BEGIN
			RETURN 0;
			END
		BEGIN TRANSACTION tPagarRecibo

		DECLARE @beforeUpdate VARCHAR(500) = (SELECT F.[ID], F.[Fecha], F.[FechaVencimiento], F.[TotalOriginal], F.[TotalPagar], 
											F.[Estado], F.[IdPropiedad] FROM dbo.Factura F WHERE F.ID = @inIdRecibo FOR JSON AUTO);
		UPDATE dbo.Factura
		SET Estado = 2 --Actualiza el estado del recibo a pagado, siempre y cuando este exista. 
		WHERE ID = @inIdRecibo;
		DECLARE @afterUpdate VARCHAR(500) = (SELECT F.[ID], F.[Fecha], F.[FechaVencimiento], F.[TotalOriginal], F.[TotalPagar], 
											F.[Estado], F.[IdPropiedad] FROM dbo.Factura F WHERE F.ID = @inIdRecibo FOR JSON AUTO);
		INSERT INTO dbo.CambiosEntidades --Inserta en los cambios de entidad
		(
		IdEntityType,
		EntityId,
		jsonAntes,
		jsonDespues,
		insertedAt,
		insertedBy,
		insertedIn
		)
		VALUES
		(
		7,
		@inIdRecibo,
		@beforeUpdate,
		@afterUpdate,
		GETDATE(),
		'Admin',
		'192.168.0.1'
		)
		COMMIT TRANSACTION
		RETURN 1; 
	END TRY
	BEGIN CATCH
	IF @@TRANCOUNT > 1
		ROLLBACK TRANSACTION tPagarRecibo
	INSERT INTO Municipalidad.dbo.DBErrors(
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		Set @outResultCode=50100;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[propiedadesPropietario]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[propiedadesPropietario]
	@inIdentificacion BIGINT,
	@outResultCode INT OUTPUT
	--Para mostrar las propiedades de un propietario, se utiliza su documento identidad.
AS
BEGIN

	SET @outResultCode = 0;
	SET NOCOUNT ON;
	BEGIN TRY
		DECLARE @inIdPersona INT = (SELECT P.ID FROM dbo.Persona P WHERE P.ValorDocId = @inIdentificacion);
		SELECT PR.NumeroFinca, PR.Area, TZ.Nombre AS 'Tipo Zona', TT.Nombre AS 'Tipo Terreno' FROM dbo.PXP P
		INNER JOIN dbo.Propiedad PR
		ON P.IdPropiedad = PR.ID
		INNER JOIN dbo.TipoZona TZ
		ON PR.IdTipoZona = TZ.ID
		INNER JOIN dbo.TipoTerreno TT
		ON PR.IdTipoTerreno = TT.ID
		WHERE P.IdPersona = @inIdPersona;
		/*Lo anterior hecho combina tablas para mostrar los datos, donde al encontrar el ID de la persona se le agregan las tablas de la propiedad,
		el tipo de zona y el tipo terreno para mostrar los datos de la relación correctamente. 
		*/
	END TRY
	BEGIN CATCH --Atrapa errores en la ejecución del SP y los inserta en la tabla de errores.
		INSERT INTO dbo.DBErrors(
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode = 50020;
	END CATCH 
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[propiedadesUsuario]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[propiedadesUsuario]
	@inUsername VARCHAR(128),
	@outResultCode INT OUTPUT
	--Para mostrar las propiedades visibles para un usuario, jse utiliza su username.
AS
BEGIN
	SET NOCOUNT ON;
	SET @outResultCode = 0;
BEGIN TRY
	DECLARE @inIdUsuario INT = (SELECT U.ID FROM dbo.Usuario U WHERE U.UserName = @inUsername);
	SELECT dbo.Propiedad.Area, dbo.Propiedad.FechaRegistro, dbo.Propiedad.NumeroFinca, dbo.TipoZona.Nombre AS 'Tipo Zona', dbo.TipoTerreno.Nombre AS 'Tipo Terreno'
	FROM dbo.PXU 
	INNER JOIN dbo.Propiedad ON Municipalidad.dbo.PXU.IdPropiedad = dbo.Propiedad.ID
	INNER JOIN dbo.TipoZona ON dbo.Propiedad.IdTipoZona = dbo.TipoZona.ID
	INNER JOIN dbo.TipoTerreno ON dbo.Propiedad.IdTipoTerreno = dbo.TipoTerreno.ID WHERE PXU.IdUsuario = @inIdUsuario;
	/*Lo anterior hecho se refiere a encontrar el Id del usuario usando su username, para luego unir varias tablas y encontrar la relación
	del usuario con las propiedades, para entonces usar inner join para mostrar los datos de las propiedades que corresponden a este usuario.
	*/
END TRY
BEGIN CATCH --Inserta errores en la tabla de errores, en caso de que existan.
			INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			SET @outResultCode = 50023;
END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[propietarioPropiedad]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[propietarioPropiedad]
	@inNumeroFinca INT,
	@outResultCode INT OUTPUT
	--Para mostrar el propietario de una propiedad, se utiliza el número de finca. 
AS
BEGIN
	SET NOCOUNT ON;
	SET @outResultCode = 0;
	BEGIN TRY
		DECLARE @inIdPropiedad INT = (SELECT P.ID FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca);
		SELECT dbo.Persona.Nombre, dbo.Persona.email, dbo.Persona.ValorDocId, dbo.Persona.telefono1, dbo.Persona.telefono2 FROM dbo.PXP P 
		INNER JOIN Persona ON P.IdPersona = dbo.Persona.ID
		WHERE P.IdPropiedad = @inIdPropiedad;
		/*Lo hecho anteriormente básicamente busca el id de la propiedad usando el número de finca y luego selecciona los datos de la persona
		o las personas que son dueñas de esa propiedad, todo esto guiándose por el id de la propiedad.
		*/
	END TRY 
	BEGIN CATCH --Inserta errores en la tabla de errores, en caso de que existan. 
		INSERT INTO dbo.DBErrors(
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode = 50022;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[rangoCambiosEntidades]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[rangoCambiosEntidades]
	@inFechaInicio DATETIME,
	@inFechaFin DATETIME,
	@outResultCode INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	SET @outResultCode = 0;
	BEGIN TRY
		SELECT CE.[Id], CE.[IdEntityType], CE.[EntityId], CE.[jsonAntes], 
				CE.[jsonDespues], CE.[insertedAt], CE.[insertedBy], CE.[insertedIn]
				FROM dbo.CambiosEntidades CE WHERE CE.insertedAt BETWEEN @inFechaInicio and @inFechaFin;
		--Este SP selecciona los cambios de entidades en un rango de fechas.
	END TRY
	BEGIN CATCH
	INSERT INTO dbo.DBErrors(
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		Set @outResultCode=50060;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[readPerson]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[readPerson]
	@inValorDocId BIGINT,
	@outResultCode INT
	--Las personas se consultan por su número de documento de identidad.
AS
BEGIN
	SET NOCOUNT ON;
	SET @outResultCode = 0;
	BEGIN TRY
		SELECT P.[Nombre], P.[ValorDocId], DI.Nombre AS 'Tipo Doc. Identidad', P.[email], P.[telefono1], P.[telefono2] FROM dbo.Persona P
		INNER JOIN dbo.TipoDocIdent DI
		ON P.IdTipoDoc = DI.ID
		WHERE P.ValorDocId = @inValorDocId;
		--Se consultó a la persona utilizando su documento identidad y se mostraron sus datos.
	END TRY
	BEGIN CATCH --Se insertan errores en la tabla de errores, en caso de que estos existan. 
		INSERT INTO dbo.DBErrors(
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		Set @outResultCode=50006;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[readProperty]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[readProperty]
	@inNumeroFinca FLOAT, 
	@outResultCode INT OUTPUT
	--Las propiedades se consultarán con su área

AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON
	BEGIN TRY
		SELECT P.[Area], P.[ValorFiscal], P.[FechaRegistro], P.[NumeroFinca], TZ.Nombre AS 'Tipo Zona', TT.Nombre AS 'Tipo Terreno' FROM dbo.Propiedad P
		INNER JOIN dbo.TipoZona TZ
		ON P.IdTipoZona = TZ.ID
		INNER JOIN dbo.TipoTerreno TT
		ON P.IdTipoTerreno = TT.ID
			WHERE P.NumeroFinca = @inNumeroFinca; --Se selecciona la propiedad correspondiente respecto a su número de finca. 
	END TRY
	BEGIN CATCH --Inserta errores en la tabla de errores en caso de que estos existan. 
		INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
		SET @outResultCode = 50007;
	END CATCH
	
END
GO
/****** Object:  StoredProcedure [dbo].[recibosPagados]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[recibosPagados]
	@inNumeroFinca INT,
	@outResultCode INT OUTPUT

AS
BEGIN
	SET NOCOUNT ON;
	SET @outResultCode = 0;
	BEGIN TRY
		DECLARE @inId INT = (SELECT P.ID FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca);
		SELECT F.[ID], F.[Fecha], F.[FechaVencimiento], F.[TotalOriginal], F.[TotalPagar], TEF.Nombre AS 'Estado', P.Comprobante
				FROM dbo.Factura F
				INNER JOIN dbo.TipoEstadoFactura TEF
				ON F.Estado = TEF.ID
				INNER JOIN dbo.Pagos P 
				ON P.ID = F.IdPago
				WHERE F.IdPropiedad = @inId and F.Estado = 2;
	END TRY
	BEGIN CATCH 
			INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
		SET @outResultCode=50050;
		
	END CATCH 
END
GO
/****** Object:  StoredProcedure [dbo].[recibosPendientes]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[recibosPendientes] 
	@inNumeroFinca INT, 
	@outResultCode INT OUTPUT
AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		DECLARE @inId INT = (SELECT P.ID FROM Municipalidad.dbo.Propiedad P WHERE P.NumeroFinca  = @inNumeroFinca)
		SELECT F.ID, F.[Fecha], F.[FechaVencimiento], F.[TotalOriginal], F.[TotalPagar], TEF.Nombre AS 'Estado'
				FROM Municipalidad.dbo.Factura F
				INNER JOIN dbo.TipoEstadoFactura TEF
				ON F.Estado = TEF.ID
				WHERE F.IdPropiedad = @inId and F.Estado = 1;
	END TRY
	BEGIN CATCH
INSERT INTO Municipalidad.dbo.DBErrors(
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		Set @outResultCode=50005;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[simulacion]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[simulacion]
AS
BEGIN
	SET NOCOUNT ON

	---------------------------Se declara la variable XML---------------------------- 
	DECLARE @count INT
	DECLARE @xmlData XML
		,@index INT = 0
		,@totalOp INT
		,@FechaAux DATE

	----------------------------Se define la variable XML, se utiliza la dirección del archivo---------------------------- 
	SET @xmlData = (
			SELECT *
			FROM OPENROWSET(BULK 'C:\Users\javie\Desktop\XML\Operaciones.xml', SINGLE_BLOB) AS xmlData
			);
	----------------------------Define la cantidad de días de Operación----------------------------
	SET @totalOp = (
			SELECT COUNT(*)
			FROM @xmlData.nodes('Datos/Operacion') T(item)
			)

	----------------------------Declaramos tablas temporales----------------------------
	DECLARE @tempPropiedades TABLE (
		[ID] INT NOT NULL IDENTITY(1, 1)
		,[IdTipoZona] INT
		,[FechaRegistro] DATE
		,[NumeroMedidor] INT
		)
	DECLARE @tempLecturas TABLE (
		[FechaLectura] DATE
		,[NumeroMedidor] INT
		,[TipoMovimiento] VARCHAR(128)
		,[Valor] INT
		)
	DECLARE @tempFacturas TABLE (
		[ID] INT NOT NULL IDENTITY(1, 1)
		,[IdPropiedad] INT
		,IdFactura INT
		)
	DECLARE @tempDetallesCC TABLE (
		Monto INT
		,IdConceptoCobro INT
		,IdFactura INT
		)
	DECLARE @tempDetallesCCAgua TABLE (
		Monto INT
		,IdDetalleCC INT
		)
	DECLARE @tempPagos TABLE (
		[IdPago] INT NOT NULL IDENTITY(1, 1)
		,[NumFinca] INT
		,[Fecha] DATE
		,[TipoPago] INT
		,[Comprobante] INT
		,[IdPropiedad] INT
		)
	DECLARE @auxTablaPropiedad TABLE (
		Area INT
		,ValorFiscal INT
		,FechaRegistro DATE
		,IdTipoTerreno INT
		,IdTipoZona INT
		,NumeroFinca INT
		,NumeroMedidor INT
		)

	DECLARE @auxOrdenCorta AS [dbo].[auxOrdenCorta]

	DECLARE @auxDetalleCC TABLE (
		MONTO MONEY
		,IdConceptoCobro INT
		,IdFactura INT
		)
	----------------------------Declaramos algunas variables----------------------------
	DECLARE @ValorMinimoM3 MONEY

	SET @ValorMinimoM3 = 30

	DECLARE @MontoMinimo MONEY

	SET @MontoMinimo = 300

	DECLARE @auxTotalOriginal MONEY

	SET @auxTotalOriginal = 0

	DECLARE @auxTotalPagar MONEY

	SET @auxTotalPagar = 0

	DECLARE @auxEstadoFactura INT

	SET @auxEstadoFactura = 1

	DECLARE @auxSaldoAcumulado MONEY

	SET @auxSaldoAcumulado = 0

	DECLARE @auxSaldoAcumuladoUltima MONEY

	SET @auxSaldoAcumuladoUltima = 0

	DECLARE @auxMonto MONEY

	SET @auxMonto = 0

	----------------------------Iniciamos la simulación----------------------------
	WHILE (@index < @totalOp)
	BEGIN
		SET @index = @index + 1;
		SET @FechaAux = (
				SELECT item.value('@Fecha', 'DATE') AS Fecha
				FROM @xmlData.nodes('Datos/Operacion[sql:variable("@index")]') T(item)
				)

		----------------------------Inserta personas , propiedades y usuarios----------------------------
		INSERT INTO [dbo].[Persona] (
			Nombre
			,ValorDocId
			,IdTipoDoc
			,email
			,telefono1
			,telefono2
			)
		SELECT item.value('@Nombre', 'VARCHAR(128)') AS 'Nombre'
			,item.value('@ValorDocumentoIdentidad', 'BIGINT') AS 'ValorDocId'
			,C.ID AS 'IdTipoDoc'
			,item.value('@Email', 'VARCHAR(128)') AS 'email'
			,item.value('@Telefono1', 'BIGINT') AS 'telefono1'
			,item.value('@Telefono2', 'BIGINT') AS 'telefono2'
		FROM @xmlData.nodes('Datos/Operacion[sql:variable("@index")]/Personas/Persona') T(item)
		INNER JOIN dbo.TipoDocIdent C ON C.Nombre = T.Item.value('@TipoDocumentoIdentidad', 'VARCHAR(128)')

		INSERT INTO Propiedad (
			Area
			,ValorFiscal
			,FechaRegistro
			,IdTipoTerreno
			,IdTipoZona
			,NumeroFinca
			,NumeroMedidor
			)
		SELECT item.value('@MetrosCuadrados', 'FLOAT') AS 'Area'
			,item.value('@ValorFiscal', 'BIGINT') AS 'ValorFiscal'
			,FechaRegistro = @FechaAux
			,X.ID AS 'IdTipoTerreno'
			,Z.ID AS 'IdTipoZona'
			,item.value('@NumeroFinca', 'INT') AS 'NumeroFinca'
			,item.value('@NumeroMedidor', 'INT') AS 'NumeroMedidor'
		FROM @xmlData.nodes('Datos/Operacion[sql:variable("@index")]/Propiedades/Propiedad') T(item)
		INNER JOIN dbo.TipoZona Z ON Z.Nombre = T.Item.value('@tipoZonaPropiedad', 'VARCHAR(128)')
		INNER JOIN dbo.TipoTerreno X ON X.Nombre = T.Item.value('@tipoUsoPropiedad', 'VARCHAR(128)')

		--LLena una tabla temporal de propiedades--
		INSERT INTO @tempPropiedades (
			FechaRegistro
			,IdTipoZona
			,NumeroMedidor
			)
		SELECT FechaRegistro = @FechaAux
			,Z.ID AS 'IdTipoZona'
			,item.value('@NumeroMedidor', 'INT') AS 'NumeroMedidor'
		FROM @xmlData.nodes('Datos/Operacion[sql:variable("@index")]/Propiedades/Propiedad') T(item)
		INNER JOIN dbo.TipoZona Z ON Z.Nombre = T.Item.value('@tipoZonaPropiedad', 'VARCHAR(128)')
		INNER JOIN dbo.TipoTerreno X ON X.Nombre = T.Item.value('@tipoUsoPropiedad', 'VARCHAR(128)')

		INSERT INTO [dbo].[Usuario] (
			UserName
			,Passwords
			,TipoUsuario
			,IdPersona
			)
		SELECT item.value('@Username', 'VARCHAR(128)') AS 'UserName'
			,item.value('@Password', 'VARCHAR(128)') AS 'Passwords'
			,item.value('@TipoUsuario', 'VARCHAR(128)') AS 'TipoUsuario'
			,P.ID AS 'IdPersona'
		FROM @xmlData.nodes('Datos/Operacion[sql:variable("@index")]/Usuario/Usuario') T(item)
		INNER JOIN dbo.Persona P ON P.ValorDocId = T.Item.value('@ValorDocumentoIdentidad', 'VARCHAR(128)')

		----------------------------Genera Facturas----------------------------
		----------------------------ATOMICO----------------------------
	EXEC [dbo].[SPGenerarFacturas] @FechaAux,0

		--Tabla temporal que se utiliza para iterar sobre las facturas una vez creadas diariamente--
		INSERT INTO @tempFacturas (IdPropiedad)
		SELECT P.ID
		FROM [dbo].[Propiedad] AS P
		WHERE DATEADD(MONTH, + 1, P.FechaRegistro) = @FechaAux
			OR DATEADD(MONTH, + 2, P.FechaRegistro) = @FechaAux
			OR DATEADD(MONTH, + 3, P.FechaRegistro) = @FechaAux
			OR DATEADD(MONTH, + 4, P.FechaRegistro) = @FechaAux
			OR DATEADD(MONTH, + 5, P.FechaRegistro) = @FechaAux
			OR DATEADD(MONTH, + 6, P.FechaRegistro) = @FechaAux
			OR DATEADD(MONTH, + 1, P.FechaRegistro) = @FechaAux

		--------------------------Inserta PxCC y PxCCAgua ----------------------------
		DECLARE @auxIndex INT;

		SELECT @auxIndex = COUNT(*)
		FROM @tempPropiedades;

		--Se itera unicamente sobre las propiedades que se insertaron en el día de operacion(tabla tempPropiedades)--
		WHILE @auxIndex > 0
		BEGIN
			DECLARE @auxIdTipoZona VARCHAR(128)
			DECLARE @auxNumeroMedidor INT
			DECLARE @auxIdPropiedad INT

			SELECT @auxIdPropiedad = (
					SELECT TOP (1) TP.ID
					FROM @tempPropiedades AS TP
					)

			SELECT @auxIdTipoZona = (
					SELECT TOP (1) TZ.Nombre
					FROM @tempPropiedades AS TP
					INNER JOIN TipoZona AS TZ ON TZ.ID = TP.IdTipoZona
					)

			SELECT @auxNumeroMedidor = (
					SELECT TOP (1) TP.NumeroMedidor
					FROM @tempPropiedades AS TP
					)

			--Detalles de Cobro para la zona Residencial y Zona comercial
			IF (
					@auxIdTipoZona = 'Residencial'
					OR @auxIdTipoZona = 'Zona comercial'
					)
				INSERT INTO PropiedadXCC (
					[IdPropiedad]
					,[IdConceptoCobro]
					,[FechaInicio]
					)
				VALUES (
					(
						SELECT TOP (1) TP.ID
						FROM @tempPropiedades AS TP
						)
					,(
						SELECT CC.ID
						FROM ConceptoCobro AS CC
						WHERE CC.Nombre = 'ConsumoAgua'
						)
					,(
						SELECT TOP (1) TP.FechaRegistro
						FROM @tempPropiedades AS TP
						)
					)
					,(
					(
						SELECT TOP (1) TP.ID
						FROM @tempPropiedades AS TP
						)
					,(
						SELECT CC.ID
						FROM ConceptoCobro AS CC
						WHERE CC.Nombre = 'ImpuestoPropiedad'
						)
					,(
						SELECT TOP (1) TP.FechaRegistro
						FROM @tempPropiedades AS TP
						)
					)
					,(
					(
						SELECT TOP (1) TP.ID
						FROM @tempPropiedades AS TP
						)
					,(
						SELECT CC.ID
						FROM ConceptoCobro AS CC
						WHERE CC.Nombre = 'RecoleccionBasura'
						)
					,(
						SELECT TOP (1) TP.FechaRegistro
						FROM @tempPropiedades AS TP
						)
					)
					,(
					(
						SELECT TOP (1) TP.ID
						FROM @tempPropiedades AS TP
						)
					,(
						SELECT CC.ID
						FROM ConceptoCobro AS CC
						WHERE CC.Nombre = 'PatenteComercial'
						)
					,(
						SELECT TOP (1) TP.FechaRegistro
						FROM @tempPropiedades AS TP
						)
					)
					,(
					(
						SELECT TOP (1) TP.ID
						FROM @tempPropiedades AS TP
						)
					,(
						SELECT CC.ID
						FROM ConceptoCobro AS CC
						WHERE CC.Nombre = 'MantenimientoParques'
						)
					,(
						SELECT TOP (1) TP.FechaRegistro
						FROM @tempPropiedades AS TP
						)
					)

			--Detalles de Cobro para la zona Bosque y Zona industrial--
			IF (
					@auxIdTipoZona ! = 'Residencial'
					AND @auxIdTipoZona != 'Zona comercial'
					AND @auxIdTipoZona != 'Agricola'
					)
				INSERT INTO PropiedadXCC (
					[IdPropiedad]
					,[IdConceptoCobro]
					,[FechaInicio]
					)
				VALUES (
					(
						SELECT TOP (1) TP.ID
						FROM @tempPropiedades AS TP
						)
					,(
						SELECT CC.ID
						FROM ConceptoCobro AS CC
						WHERE CC.Nombre = 'ConsumoAgua'
						)
					,(
						SELECT TOP (1) TP.FechaRegistro
						FROM @tempPropiedades AS TP
						)
					)
					,(
					(
						SELECT TOP (1) TP.ID
						FROM @tempPropiedades AS TP
						)
					,(
						SELECT CC.ID
						FROM ConceptoCobro AS CC
						WHERE CC.Nombre = 'ImpuestoPropiedad'
						)
					,(
						SELECT TOP (1) TP.FechaRegistro
						FROM @tempPropiedades AS TP
						)
					)
					,(
					(
						SELECT TOP (1) TP.ID
						FROM @tempPropiedades AS TP
						)
					,(
						SELECT CC.ID
						FROM ConceptoCobro AS CC
						WHERE CC.Nombre = 'RecoleccionBasura'
						)
					,(
						SELECT TOP (1) TP.FechaRegistro
						FROM @tempPropiedades AS TP
						)
					)
					,(
					(
						SELECT TOP (1) TP.ID
						FROM @tempPropiedades AS TP
						)
					,(
						SELECT CC.ID
						FROM ConceptoCobro AS CC
						WHERE CC.Nombre = 'MantenimientoParques'
						)
					,(
						SELECT TOP (1) TP.FechaRegistro
						FROM @tempPropiedades AS TP
						)
					)

			--Detalles de Cobro para la zona Agricola--
			IF (@auxIdTipoZona = 'Agricola')
				INSERT INTO PropiedadXCC (
					[IdPropiedad]
					,[IdConceptoCobro]
					,[FechaInicio]
					)
				VALUES (
					(
						SELECT TOP (1) TP.ID
						FROM @tempPropiedades AS TP
						)
					,(
						SELECT CC.ID
						FROM ConceptoCobro AS CC
						WHERE CC.Nombre = 'ConsumoAgua'
						)
					,(
						SELECT TOP (1) TP.FechaRegistro
						FROM @tempPropiedades AS TP
						)
					)
					,(
					(
						SELECT TOP (1) TP.ID
						FROM @tempPropiedades AS TP
						)
					,(
						SELECT CC.ID
						FROM ConceptoCobro AS CC
						WHERE CC.Nombre = 'ImpuestoPropiedad'
						)
					,(
						SELECT TOP (1) TP.FechaRegistro
						FROM @tempPropiedades AS TP
						)
					)
					,(
					(
						SELECT TOP (1) TP.ID
						FROM @tempPropiedades AS TP
						)
					,(
						SELECT CC.ID
						FROM ConceptoCobro AS CC
						WHERE CC.Nombre = 'RecoleccionBasura'
						)
					,(
						SELECT TOP (1) TP.FechaRegistro
						FROM @tempPropiedades AS TP
						)
					)

			--Se inserta en PropiedadCCAgua las propiedades que tienen consumo de agua--
			INSERT INTO [dbo].[PropiedadCCAgua] (
				[NumeroMedidor]
				,[SaldoAcumulado]
				,[SaldoAcumuladoUltima]
				,[IdPropiedad]
				)
			SELECT Propiedad.NumeroFinca
				,@auxSaldoAcumulado
				,@auxSaldoAcumuladoUltima
				,@auxIdPropiedad
			FROM Propiedad
			WHERE @auxIdPropiedad = Propiedad.ID

			DELETE TOP (1)
			FROM @tempPropiedades

			SELECT @auxIndex = COUNT(*)
			FROM @tempPropiedades;
		END

		----------------------------MOVIMIENTOS POR CONSUMO DE AGUA------------------------------
		----------------------------Se llena tabla temporal con las lecturas del día------------------------------
		INSERT INTO @tempLecturas (
			FechaLectura
			,NumeroMedidor
			,TipoMovimiento
			,Valor
			)
		SELECT FechaLectura = @FechaAux
			,T.item.value('@NumeroMedidor', 'INT') AS NumeroMedidor
			,T.item.value('@TipoMovimiento', 'VARCHAR(128)') AS TipoMovimiento
			,T.item.value('@Valor', 'INT') AS Valor
		FROM @xmlData.nodes('Datos/Operacion[sql:variable("@index")]/Lecturas/LecturaMedidor') T(item)

		----------------------------Se agregan las lecturas a MovimientoConsumo-----------------------------
		INSERT INTO MovimientoConsumo (
			Fecha
			,Monto
			,IdTipoMovimiento
			,NumeroMedidor
			)
		SELECT Fecha = @FechaAux
			,CASE 
				WHEN TL.TipoMovimiento = 'Lectura'
					THEN TL.Valor - PC.SaldoAcumuladoUltima
				WHEN TL.TipoMovimiento = 'Ajuste Credito'
					THEN TL.Valor
				WHEN TL.TipoMovimiento = 'Ajuste Debito'
					THEN TL.Valor * - 1
				END
			,CASE 
				WHEN TL.TipoMovimiento = 'Lectura'
					THEN 1
				WHEN TL.TipoMovimiento = 'Ajuste Credito'
					THEN 2
				WHEN TL.TipoMovimiento = 'Ajuste Debito'
					THEN 3
				END
			,TL.NumeroMedidor
		FROM @tempLecturas AS TL
		INNER JOIN PropiedadCCAgua AS PC ON PC.NumeroMedidor = TL.NumeroMedidor

		----------------------------Comienza la transaccion/Se actualizan los montos de PXCCAgua------------------------------
		----------------------------ATOMICO----------------------------
		EXEC [dbo].[SPMovimientoAgua] 0

		----------------------------Genera DetallesXCC por cada factura que se genero en el día----------------------------
		SELECT @count = COUNT(*)
		FROM @tempFacturas;

		WHILE @count > 0
		BEGIN
			--------------------------DetallesCC----------------------------
			DECLARE @auxIdFactura INT

			SELECT @auxIdFactura = (
					SELECT TOP (1) TF.IdPropiedad
					FROM @tempFacturas AS TF
					)

			INSERT INTO @tempDetallesCC (
				Monto
				,IdConceptoCobro
				,IdFactura
				)
			SELECT @auxMonto
				,PC.IdConceptoCobro
				,F.ID
			FROM @tempFacturas AS F
			INNER JOIN PropiedadXCC AS PC ON PC.IdPropiedad = F.IdPropiedad

			--------------------------DetallesCCAgua----------------------------
			INSERT INTO @tempDetallesCCAgua (
				Monto
				,IdDetalleCC
				)
			SELECT @auxMonto
				,F.ID
			FROM @tempFacturas AS F

			DELETE TOP (1)
			FROM @tempFacturas

			SELECT @count = COUNT(*)
			FROM @tempFacturas;
		END

		--------------------------LLena la tabla DetalleCC y DetalleCCAgua con los datos de las tablas temporales----------------------------
		INSERT INTO DetalleCC (
			Monto
			,[IdConceptoCobro]
			,[IdFactura]
			)
		SELECT DISTINCT @auxMonto
			,TD.IdConceptoCobro
			,TD.IdFactura
		FROM @tempDetallesCC AS TD

		INSERT INTO DetalleCCAgua (
			Monto
			,IdDetalleCC
			,NumeroMedidor
			)
		SELECT DISTINCT TDC.Monto
			,TDC.IdDetalleCC
			,P.NumeroFinca
		FROM @tempDetallesCCAgua AS TDC
		INNER JOIN Factura AS F ON F.ID = TDC.IdDetalleCC
		INNER JOIN Propiedad AS P ON P.ID = F.IdPropiedad

		--------------------------Actualiza el monto de detalleCCAgua----------------------
		UPDATE DetalleCCAgua
		SET Monto = CASE 
				WHEN (PA.SaldoAcumulado - PA.SaldoAcumuladoUltima) * @ValorMinimoM3 > @MontoMinimo
					THEN (PA.SaldoAcumulado - PA.SaldoAcumuladoUltima) * @ValorMinimoM3
				ELSE @MontoMinimo
				END
		FROM PropiedadCCAgua AS PA
		INNER JOIN DetalleCCAgua AS DC ON DC.NumeroMedidor = PA.NumeroMedidor

		--------------------------Actualiza el monto de detalleCC de las facturas generadas diariamente----------------------------
		UPDATE DetalleCC
		SET Monto = CASE 
				WHEN D.IdConceptoCobro = '1'
					THEN (
							SELECT Monto
							FROM DetalleCCAgua
							WHERE IdDetalleCC = IdFactura
							)
				WHEN D.IdConceptoCobro = '2'
					THEN (P.ValorFiscal * 0.01) / 12
				WHEN D.IdConceptoCobro = '3'
					AND P.Area < 400
					THEN 150
				WHEN D.IdConceptoCobro = '3'
					AND P.Area > 400
					THEN CAST(((P.Area - 400) / 200) AS INT) * 75 + 150
				WHEN D.IdConceptoCobro = '4'
					THEN 15000 / 6
				WHEN D.IdConceptoCobro = '7'
					THEN 2000 / 12
				ELSE Monto
				END
		FROM DetalleCC D
		INNER JOIN Factura F ON F.ID = D.IdFactura
		INNER JOIN Propiedad P ON P.ID = F.IdPropiedad
		WHERE F.IdPropiedad = P.ID

		------------------------------Se genera el monto totalOriginal de la factura según los CCs asociados a esta(sin intereses ni rexonexión)------------------------------
		INSERT INTO TotalFactura (
			Monto
			,idFactura
			)
		SELECT SUM(DC.Monto)
			,F.ID
		FROM Factura AS F
		INNER JOIN DetalleCC AS DC ON F.ID = DC.IdFactura
		WHERE DC.IdConceptoCobro != 5
			AND DC.IdConceptoCobro != 6
		GROUP BY F.ID

		------------------------------Actualiza el monto total en la Factura------------------------------
		UPDATE Factura
		SET TotalOriginal = (TotalFactura.Monto)
		FROM TotalFactura
		INNER JOIN Factura ON Factura.ID = TotalFactura.idFactura
		WHERE Factura.ID = TotalFactura.idFactura

		----------------------------Genera Pagos----------------------------
		INSERT INTO [dbo].[Pagos] (
			NumFinca
			,Fecha
			,TipoPago
			,Comprobante
			,IdPropiedad
			)
		SELECT T.item.value('@NumFinca', 'INT') AS NumFinca
			,Fecha = @FechaAux
			,A.ID
			,T.item.value('@NumeroReferenciaComprobantePago', 'INT') AS Comprobante
			,Z.ID
		FROM @xmlData.nodes('Datos/Operacion[sql:variable("@index")]/Pago/Pago') T(item)
		INNER JOIN TipoPago A ON A.Nombre = T.Item.value('@TipoPago', 'VARCHAR(128)')
		INNER JOIN Propiedad Z ON Z.NumeroFinca = T.Item.value('@NumFinca', 'VARCHAR(128)')

		----------------------------Se llena una tabla temporal donde van a estar unicamente los pago del día----------------------------
		INSERT INTO @tempPagos (
			NumFinca
			,Fecha
			,TipoPago
			,Comprobante
			,IdPropiedad
			)
		SELECT T.item.value('@NumFinca', 'INT') AS NumFinca
			,Fecha = @FechaAux
			,A.ID
			,T.item.value('@NumeroReferenciaComprobantePago', 'INT') AS Comprobante
			,Z.ID
		FROM @xmlData.nodes('Datos/Operacion[sql:variable("@index")]/Pago/Pago') T(item)
		INNER JOIN TipoPago A ON A.Nombre = T.Item.value('@TipoPago', 'VARCHAR(128)')
		INNER JOIN Propiedad Z ON Z.NumeroFinca = T.Item.value('@NumFinca', 'VARCHAR(128)')

		----------------------------Se itera por cada pago y se hace el update respectivo a las facturas----------------------------
		----------------------------ATOMICO----------------------------
		SELECT @count = COUNT(*)
		FROM @tempPagos;

		WHILE @count > 0
		BEGIN
			DECLARE @auxNumeroFinca INT
			DECLARE @auxIdPago INT

			SET @auxNumeroFinca = (
					SELECT TOP (1) TP.NumFinca
					FROM @tempPagos AS TP
					)
			SET @auxIdPago = (
					SELECT TOP (1) TP.IdPago
					FROM @tempPagos AS TP
					)

			UPDATE Factura
			SET Estado = (
					SELECT TE.ID
					FROM TipoEstadoFactura AS TE
					WHERE TE.Nombre = 'Pagado normal'
					)
				,IdPago = @auxIdPago
			FROM Factura AS F
			INNER JOIN Propiedad AS P ON P.ID = F.IdPropiedad
			WHERE P.NumeroFinca = @auxNumeroFinca
				AND F.Estado = (
					SELECT TE.ID
					FROM TipoEstadoFactura AS TE
					WHERE TE.Nombre = 'Pendiente de pago'
					)
				AND F.Fecha = (
					SELECT MIN(Fecha)
					FROM Factura AS F
					INNER JOIN Propiedad AS P ON P.ID = F.IdPropiedad
					WHERE P.NumeroFinca = @auxNumeroFinca
						AND F.Estado = (
							SELECT TE.ID
							FROM TipoEstadoFactura AS TE
							WHERE TE.Nombre = 'Pendiente de pago'
							)
					)

			DELETE TOP (1)
			FROM @tempPagos

			SELECT @count = COUNT(*)
			FROM @tempPagos;
		END

		----------------------------INTERES MORATORIOS----------------------------
		----------------------------ATOMICO----------------------------
		EXEC [dbo].[SPInteresesMoratorios] @FechaAux
			,0

		----------------------------ORDENES DE CORTA-----------------------------
		INSERT INTO OrdenCorta (
			IdFactura
			,IdPropiedad
			,IdEstado
			,FechaOperación
			)
		SELECT F.ID
			,F.IdPropiedad
			,(
				SELECT EC.ID
				FROM EstadoOrdenesCorta AS EC
				WHERE Nombre = 'Pendiente de pago'
				)
			,DATEADD(DAY, 10, F.FechaVencimiento)
		FROM Factura AS F
		WHERE DATEADD(DAY, 10, F.FechaVencimiento) = @FechaAux
			AND F.Estado = (
				SELECT TE.ID
				FROM TipoEstadoFactura AS TE
				WHERE TE.Nombre = 'Pendiente de pago'
				)

		INSERT INTO @auxOrdenCorta (
			IdFactura
			,IdPropiedad
			,IdEstado
			,FechaOperación
			)
		SELECT F.ID
			,F.IdPropiedad
			,(
				SELECT EC.ID
				FROM EstadoOrdenesCorta AS EC
				WHERE Nombre = 'Pendiente de pago'
				)
			,DATEADD(DAY, 10, F.FechaVencimiento)
		FROM Factura AS F
		WHERE DATEADD(DAY, 10, F.FechaVencimiento) = @FechaAux
			AND F.Estado = (
				SELECT TE.ID
				FROM TipoEstadoFactura AS TE
				WHERE TE.Nombre = 'Pendiente de pago'
				)

		----------------------------ATOMICO----------------------------
		--Inserta en DetalleCC el Concepto de cobro de reconexion--
		EXEC [dbo].[SPCobroReconexion] @auxOrdenCorta 
			,0

		----------------------------ORDENES DE RECONEXIÓN----------------------------
		----------------------------ATOMICO----------------------------
		EXEC [dbo].[SPOrdenesReconexion] @FechaAux
			,0

		----------------------------Se vacían las tablas temporales para el siguiente día de operaciones------------------------------
		DELETE
		FROM @tempDetallesCC

		DELETE
		FROM @tempLecturas

		DELETE
		FROM @tempDetallesCCAgua

		DELETE
		FROM @auxOrdenCorta

		----------------------------Inserta asociaciones PXP y PXU----------------------------
		INSERT INTO [dbo].[PXU] (
			IdUsuario
			,IdPropiedad
			,FechaInicio
			,FechaFin
			)
		SELECT P.ID AS 'IdUsuario'
			,N.ID AS 'IdPropiedad'
			,FechaInicio = @FechaAux
			,FechaFin = NULL
		FROM @xmlData.nodes('Datos/Operacion[sql:variable("@index")]/PropiedadesyUsuarios/UsuarioPropiedad') T(item)
		INNER JOIN dbo.Persona P ON P.ValorDocId = T.Item.value('@ValorDocumentoIdentidad', 'VARCHAR(128)')
		INNER JOIN dbo.Propiedad N ON N.NumeroFinca = T.Item.value('@NumeroFinca', 'VARCHAR(128)')

		INSERT INTO [dbo].[PXP] (
			IdPersona
			,IdPropiedad
			,FechaInicio
			,FechaFin
			)
		SELECT P.ID AS 'IdPersona'
			,N.ID AS 'IdPropiedad'
			,FechaInicio = @FechaAux
			,FechaFin = NULL
		FROM @xmlData.nodes('Datos/Operacion[sql:variable("@index")]/PersonasyPropiedades/PropiedadPersona') T(item)
		INNER JOIN dbo.Persona P ON P.ValorDocId = T.Item.value('@ValorDocumentoIdentidad', 'VARCHAR(128)')
		INNER JOIN dbo.Propiedad N ON N.NumeroFinca = T.Item.value('@NumeroFinca', 'VARCHAR(128)')

		CONTINUE
	END
END
GO
/****** Object:  StoredProcedure [dbo].[solicitarAP]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[solicitarAP]
	@inNumeroFinca INT,
	@outResultCode INT OUTPUT
AS
	SET @outResultCode = 0;
	SET NOCOUNT ON;

BEGIN
	BEGIN TRY
		DECLARE @inIdPropiedad INT = (SELECT P.ID FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca);
		SELECT F.ID, F.[Fecha], F.[FechaVencimiento], F.[TotalOriginal], F.[TotalPagar], TEF.Nombre AS 'Estado',
			 (SELECT SUM(F.TotalPagar) FROM Propiedad P
				INNER JOIN dbo.Factura F
				ON F.IdPropiedad = P.ID WHERE F.IdPropiedad = @inIdPropiedad and F.Estado = 1) AS 'TotalFinal' 
				FROM dbo.Factura F
				INNER JOIN dbo.TipoEstadoFactura TEF
				ON F.Estado = TEF.ID
				WHERE F.IdPropiedad = @inIdPropiedad and F.Estado = 1
				RETURN;
	END TRY
	BEGIN CATCH
	INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
		SET @outResultCode = 50310;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPCobroReconexion]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPCobroReconexion]
	@auxOrdenCorta [dbo].[auxOrdenCorta] READONLY,
	@outResultCode INT OUTPUT

AS
BEGIN
	SET NOCOUNT ON;
	SET @outResultCode = 0
	BEGIN TRY
		BEGIN TRANSACTION tInsercion
		--Inserta en DetalleCC el Concepto de cobro de reconexion--
		INSERT INTO DetalleCC (
			Monto
			,IdConceptoCobro
			,IdFactura
			)
		SELECT (
				SELECT R.ValorFijo
				FROM ReconexionAgua AS R
				)
			,(
				SELECT CC.ID
				FROM ConceptoCobro AS CC
				WHERE Nombre = 'Reconexion'
				)
			,O.IdFactura
		FROM @auxOrdenCorta AS O

		--Actualiza el monto de la factura añadiendo este nuevo concepto--
		UPDATE Factura
		SET TotalPagar = (
				SELECT SUM(DetalleCC.Monto)
				FROM DetalleCC
				WHERE DetalleCC.IdFactura = Factura.ID
				)

		COMMIT TRANSACTION
	END TRY 
	BEGIN CATCH 
	IF @@TRANCOUNT > 1
			ROLLBACK TRANSACTION tInsercion
		INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			PRINT ERROR_MESSAGE()
			Set @outResultCode=50203;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPGenerarFacturas]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPGenerarFacturas]
	@inFechaAux	DATE,
	@outResultCode INT OUTPUT


AS
BEGIN
	SET NOCOUNT ON;
	SET @outResultCode = 0
	BEGIN TRY
BEGIN TRANSACTION tGenerarFacturas

DECLARE @auxTotalOriginal INT
DECLARE @auxTotalPagar INT
DECLARE @auxEstadoFactura INT

SET @auxTotalOriginal = 0
SET @auxTotalPagar = 0
SET @auxEstadoFactura = 1


INSERT INTO Factura (
			[Fecha]
			,[FechaVencimiento]
			,[TotalOriginal]
			,[TotalPagar]
			,[Estado]
			,[IdPropiedad]
			)
		SELECT CASE 
				--Dependiendo de la fecha de registro de la propiedad se genera la fecha de la futuras facturas--
				WHEN DATEADD(MONTH, + 1, P.FechaRegistro) = @inFechaAux
					THEN DATEADD(MONTH, + 1, P.FechaRegistro)
				WHEN DATEADD(MONTH, + 2, P.FechaRegistro) = @inFechaAux
					THEN DATEADD(MONTH, + 2, P.FechaRegistro)
				WHEN DATEADD(MONTH, + 3, P.FechaRegistro) = @inFechaAux
					THEN DATEADD(MONTH, + 3, P.FechaRegistro)
				WHEN DATEADD(MONTH, + 4, P.FechaRegistro) = @inFechaAux
					THEN DATEADD(MONTH, + 4, P.FechaRegistro)
				WHEN DATEADD(MONTH, + 5, P.FechaRegistro) = @inFechaAux
					THEN DATEADD(MONTH, + 5, P.FechaRegistro)
				WHEN DATEADD(MONTH, + 6, P.FechaRegistro) = @inFechaAux
					THEN DATEADD(MONTH, + 6, P.FechaRegistro)
				WHEN DATEADD(MONTH, + 7, P.FechaRegistro) = @inFechaAux
					THEN DATEADD(MONTH, + 7, P.FechaRegistro)
				WHEN DATEADD(MONTH, + 8, P.FechaRegistro) = @inFechaAux
					THEN DATEADD(MONTH, + 8, P.FechaRegistro)
				WHEN DATEADD(MONTH, + 9, P.FechaRegistro) = @inFechaAux
					THEN DATEADD(MONTH, + 9, P.FechaRegistro)
				END
			--Dependiendo de la fecha de la creación de la factura se genera la fecha de vencimiento(se suma 1 mes de la fecha de creación)--
			,CASE 
				WHEN DATEADD(MONTH, + 1, P.FechaRegistro) = @inFechaAux
					THEN DATEADD(MONTH, + 2, P.FechaRegistro)
				WHEN DATEADD(MONTH, + 2, P.FechaRegistro) = @inFechaAux
					THEN DATEADD(MONTH, + 3, P.FechaRegistro)
				WHEN DATEADD(MONTH, + 3, P.FechaRegistro) = @inFechaAux
					THEN DATEADD(MONTH, + 4, P.FechaRegistro)
				WHEN DATEADD(MONTH, + 4, P.FechaRegistro) = @inFechaAux
					THEN DATEADD(MONTH, + 5, P.FechaRegistro)
				WHEN DATEADD(MONTH, + 5, P.FechaRegistro) = @inFechaAux
					THEN DATEADD(MONTH, + 6, P.FechaRegistro)
				WHEN DATEADD(MONTH, + 6, P.FechaRegistro) = @inFechaAux
					THEN DATEADD(MONTH, + 7, P.FechaRegistro)
				WHEN DATEADD(MONTH, + 7, P.FechaRegistro) = @inFechaAux
					THEN DATEADD(MONTH, + 8, P.FechaRegistro)
				WHEN DATEADD(MONTH, + 8, P.FechaRegistro) = @inFechaAux
					THEN DATEADD(MONTH, + 9, P.FechaRegistro)
				WHEN DATEADD(MONTH, + 9, P.FechaRegistro) = @inFechaAux
					THEN DATEADD(MONTH, + 10, P.FechaRegistro)
				END
			--Valores auxiliares predeterminados, los totales comienzan en 0 y el estado en "Pendiente"--
			,@auxTotalOriginal
			,@auxTotalPagar
			,@auxEstadoFactura
			,P.ID
		FROM [dbo].[Propiedad] AS P
		--Se generan unicamente las facturas de las propiedades en las cuales la fecha en la que se debería generar su factura--
		--es la fecha del día de operación actual--
		WHERE DATEADD(MONTH, + 1, P.FechaRegistro) = @inFechaAux
			OR DATEADD(MONTH, + 2, P.FechaRegistro) = @inFechaAux
			OR DATEADD(MONTH, + 3, P.FechaRegistro) = @inFechaAux
			OR DATEADD(MONTH, + 4, P.FechaRegistro) = @inFechaAux
			OR DATEADD(MONTH, + 5, P.FechaRegistro) = @inFechaAux
			OR DATEADD(MONTH, + 6, P.FechaRegistro) = @inFechaAux
			OR DATEADD(MONTH, + 7, P.FechaRegistro) = @inFechaAux

		COMMIT TRANSACTION
	END TRY 
	BEGIN CATCH 
	IF @@TRANCOUNT > 1
			ROLLBACK TRANSACTION tGenerarFacturas
		INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			PRINT ERROR_MESSAGE()
			Set @outResultCode=50204;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPInteresesMoratorios]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPInteresesMoratorios]
	@inFechaAux DATE,
	@outResultCode INT OUTPUT

AS
BEGIN
	SET NOCOUNT ON;
	SET @outResultCode = 0
	BEGIN TRY
		BEGIN TRANSACTION tInteresesMoratorios
		----------------------------Crea el DetalleCC por cada factura que la fecha de vencimiento coincida con la de operación----------------------------
		INSERT INTO DetalleCC (
			Monto
			,IdConceptoCobro
			,IdFactura
			)
		SELECT (F.TotalPagar * (
				SELECT IM.ValorPorcentual
				FROM InteresesMoratorios AS IM
				)/12)
			,(
				SELECT CC.ID
				FROM ConceptoCobro AS CC
				WHERE Nombre = 'InteresesMoratorios'
				)
			,F.ID
		FROM Factura AS F
		WHERE F.FechaVencimiento = @inFechaAux
			AND F.Estado = (
				SELECT TE.ID
				FROM TipoEstadoFactura AS TE
				WHERE TE.Nombre = 'Pendiente de pago'
				)

		----------------------------Actualiza el total a pagar con el nuevo DetalleCC----------------------------
		UPDATE Factura
		SET TotalPagar = (
				SELECT SUM(DetalleCC.Monto)
				FROM DetalleCC
				WHERE DetalleCC.IdFactura = Factura.ID
				)
		COMMIT TRANSACTION
	END TRY 
	BEGIN CATCH 
	IF @@TRANCOUNT > 1
			ROLLBACK TRANSACTION tInteresesMoratorios
		INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			PRINT ERROR_MESSAGE()
			Set @outResultCode=50202;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPMovimientoAgua]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPMovimientoAgua]
	@outResultCode INT OUTPUT

AS
BEGIN
	SET NOCOUNT ON;
	SET @outResultCode = 0
	BEGIN TRY
		BEGIN TRANSACTION tMovimientoAgua

		UPDATE PropiedadCCAgua
		SET SaldoAcumuladoUltima = MC.Monto
		FROM MovimientoConsumo AS MC
		INNER JOIN PropiedadCCAgua AS PA ON PA.NumeroMedidor = MC.NumeroMedidor

		UPDATE PropiedadCCAgua
		SET SaldoAcumulado = SaldoAcumuladoUltima + Monto
		FROM MovimientoConsumo AS MC
		INNER JOIN PropiedadCCAgua AS PA ON PA.NumeroMedidor = MC.NumeroMedidor

		COMMIT TRANSACTION
	END TRY 
	BEGIN CATCH 
	IF @@TRANCOUNT > 1
			ROLLBACK TRANSACTION tMovimientoAgua
		INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			PRINT ERROR_MESSAGE()
			Set @outResultCode=50204;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPOrdenesReconexion]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPOrdenesReconexion]
	@inFechaAux DATE,
	@outResultCode INT OUTPUT

AS
BEGIN
	SET NOCOUNT ON;
	SET @outResultCode = 0
	BEGIN TRY
		BEGIN TRANSACTION tOrdenesReconexion
		--Actualiza en ordenes de corta las facturas con ordenes de cortas ya pagas--
		UPDATE OrdenCorta
		SET IdEstado = (
				SELECT EC.ID
				FROM EstadoOrdenesCorta AS EC
				WHERE Nombre = 'Pago de reconexión realizado'
				)
		FROM Factura AS F
		INNER JOIN OrdenCorta AS O ON O.IdFactura = F.ID
		WHERE F.Estado = (
				SELECT TE.ID
				FROM TipoEstadoFactura AS TE
				WHERE TE.Nombre = 'Pagado normal'
				)

		--Añade estas ordenes de corta ya pagadas a la tabla reconexion--
		INSERT INTO Reconexión (
			IdFactura
			,IdOrdenCorta
			,FechaOperación
			)
		SELECT O.IdFactura
			,O.ID
			,@inFechaAux
		FROM Factura AS F
		INNER JOIN OrdenCorta AS O ON O.IdFactura = F.ID
		WHERE O.IdEstado = (
				SELECT EC.ID
				FROM EstadoOrdenesCorta AS EC
				WHERE Nombre = 'Pago de reconexión realizado'
				)
			AND NOT EXISTS (
				SELECT R.IdOrdenCorta
				FROM Reconexión AS R
				WHERE R.IdOrdenCorta = O.ID
				)
		COMMIT TRANSACTION
	END TRY 
	BEGIN CATCH 
	IF @@TRANCOUNT > 1
			ROLLBACK TRANSACTION tOrdenesReconexion
		INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			PRINT ERROR_MESSAGE()
			Set @outResultCode=50201;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[tazaInteres]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tazaInteres]
	@inNumeroFinca INT,
	@outResultCode INT OUTPUT

AS
BEGIN
	BEGIN TRY
	SET NOCOUNT ON;
	SET @outResultCode = 0;
	DECLARE @cuota TABLE
	(
		PlazoEnMeses INT,
		TasaInteresAnual INT,
		Cuota MONEY

	)
		DECLARE @inIdPropiedad INT = (SELECT P.ID FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca);
		DECLARE @total MONEY = (SELECT TOP 1(SELECT SUM(F.TotalPagar) FROM Propiedad P
				INNER JOIN dbo.Factura F
				ON F.IdPropiedad = P.ID WHERE F.IdPropiedad = @inIdPropiedad and F.Estado = 1)
				FROM dbo.Factura F
				INNER JOIN dbo.TipoEstadoFactura TEF
				ON F.Estado = TEF.ID
				WHERE F.IdPropiedad = @inIdPropiedad and F.Estado = 1)
		DECLARE @contador INT = 3;
		DECLARE @inTasaInteresAnual NUMERIC(15,10) = 10;
		WHILE @contador <= 6
		BEGIN 

				DECLARE @InterestRate NUMERIC(15,10)

				SET @InterestRate = (@inTasaInteresAnual/100)/12


				DECLARE @cuotaTotal MONEY = (@InterestRate + (@InterestRate / (POWER((1 + @InterestRate), @contador) - 1))) * @total
			INSERT INTO @cuota(
			PlazoEnMeses,
			TasaInteresAnual,
			Cuota
			)

			VALUES(
				@contador,
				@inTasaInteresAnual,
				@cuotaTotal
			)
			SET @contador = @contador + 1;
			SET @inTasaInteresAnual = @inTasaInteresAnual + 1;
		END
		SELECT C.PlazoEnMeses, C.TasaInteresAnual, C.Cuota  FROM @cuota C;
	END TRY
	BEGIN CATCH
	INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
		SET @outResultCode = 50312;
	END CATCH
	SET NOCOUNT OFF;
	
END
GO
/****** Object:  StoredProcedure [dbo].[updatePerson]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updatePerson]
	@inNombre VARCHAR(128),
	@inValorDocId BIGINT,
	@inIdTipoDocId INT,
	@inEmail VARCHAR(128),
	@inTelefono1 BIGINT,
	@inTelefono2 BIGINT,
	@outResultCode INT OUTPUT
	--Los parámetros anteriores permiten actualizar a la persona en cuestión.
AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRANSACTION tupdatePersona
		DECLARE @beforeUpdate VARCHAR(500) = (SELECT U.Nombre, U.IdTipoDoc, U.ValorDocId, U.email, U.telefono1, U.telefono2 FROM dbo.Persona U
											WHERE U.ValorDocId = @inValorDocId FOR JSON AUTO) 
		UPDATE Persona 
		SET Nombre = @inNombre, IdTipoDoc = @inIdTipoDocId, email = @inEmail, telefono1 = @inTelefono1, telefono2 = @inTelefono2
		WHERE ValorDocId = @inValorDocId; --Actualiza la persona en caso de existir.
		DECLARE @idPersona INT = (SELECT P.ID FROM dbo.Persona P WHERE P.ValorDocId = @inValorDocId);
		DECLARE @afterUpdate VARCHAR(500) = (SELECT U.Nombre, U.IdTipoDoc, U.ValorDocId, U.email, U.telefono1, U.telefono2 FROM dbo.Persona U
											WHERE U.ValorDocId = @inValorDocId FOR JSON AUTO)
		INSERT INTO dbo.CambiosEntidades( ----Inserta en los cambios de entidad
			IdEntityType,
			EntityId,
			jsonAntes,
			jsonDespues,
			insertedAt,
			insertedBy,
			insertedIn
		)
		VALUES(
			2,
			@idPersona,
			@beforeUpdate,
			@afterUpdate,
			GETDATE(),
			'Admin',
			'192.168.1.1'
		)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH --Inserta en la tabla de errores en caso de que algún error exista. 
			IF @@TRANCOUNT > 1
			ROLLBACK TRANSACTION tupdatePersona
			INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			Set @outResultCode=50003;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[updateProperty]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateProperty]
	@inNumeroFinca INT,
	@inArea FLOAT,
	@inValorFiscal VARCHAR(128),
	@outResultCode INT OUTPUT
	--Para actualizar una propiedad se necesita su finca y los datos que se actualizarán.
	
AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
		BEGIN TRY
			UPDATE dbo.Propiedad -- Se actualiza la propiedad con respecto al ID, actualizando valores como el área y el valor fiscal
				SET Area = @inArea, ValorFiscal = @inValorFiscal
				WHERE NumeroFinca = @inNumeroFinca; --Siempre y cuando esta propiedad se haya encontrado. 
		END TRY
		BEGIN CATCH --Inserta en la tabla de errores en caso de que algún error exista.
			INSERT INTO dbo.DBErrors(
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		Set @outResultCode=50009;
		END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[VaciarBases]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL

CREATE PROCEDURE [dbo].[VaciarBases] 

AS
BEGIN

DELETE TotalFactura

DBCC CHECKIDENT (
		'TotalFactura'
		,RESEED
		,0
		)
DELETE CambiosEntidades

DBCC CHECKIDENT (
		'CambiosEntidades'
		,RESEED
		,0
		)


DELETE Reconexión

DBCC CHECKIDENT (
		'Reconexión'
		,RESEED
		,0
		)


DELETE OrdenCorta

DBCC CHECKIDENT (
		'OrdenCorta'
		,RESEED
		,0
		)


DELETE
FROM CambiosEntidades

DBCC CHECKIDENT (
		'CambiosEntidades'
		,RESEED
		,0
		)

DELETE
FROM Pagos

DBCC CHECKIDENT (
		'Pagos'
		,RESEED
		,0
		)

DELETE
FROM DetalleCC

DBCC CHECKIDENT (
		'DetalleCC'
		,RESEED
		,0
		)
DELETE DetalleCCAgua
DBCC CHECKIDENT (
		'DetalleCCAgua'
		,RESEED
		,0
		)

DELETE
FROM PXU

DBCC CHECKIDENT (
		'PXU'
		,RESEED
		,0
		)

DELETE
FROM PXP

DBCC CHECKIDENT (
		'PXP'
		,RESEED
		,0
		)

DELETE
FROM Usuario

DBCC CHECKIDENT (
		'Usuario'
		,RESEED
		,0
		)
DELETE
FROM Persona

DBCC CHECKIDENT (
		'Persona'
		,RESEED
		,0
		)

DELETE
FROM PropiedadCCAgua

DBCC CHECKIDENT (
		'PropiedadCCAgua'
		,RESEED
		,0
		)

DELETE
FROM MovimientoConsumo

DBCC CHECKIDENT (
		'MovimientoConsumo'
		,RESEED
		,0
		)

DELETE
FROM PropiedadXCC

DBCC CHECKIDENT (
		'PropiedadXCC'
		,RESEED
		,0
		)

DELETE
FROM Factura

DBCC CHECKIDENT (
		'Factura'
		,RESEED
		,0
		)
DELETE
FROM Propiedad

DBCC CHECKIDENT (
		'Propiedad'
		,RESEED
		,0
		)
END
GO
/****** Object:  StoredProcedure [dbo].[validateLogin]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[validateLogin]
	@inUsername VARCHAR(128),
	@inPassword VARCHAR(128),
	@outResultCode INT OUTPUT
	--Los parámetros anteriores se ingresan en el login y así se valida el usuario.
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
	DECLARE @inValidate INT; --Variable para la validación de los parámetros.
		SET @outResultCode = 0; --Quiere decir que no hubo errores
		IF EXISTS(SELECT U.UserName, U.Passwords FROM dbo.Usuario U WHERE U.UserName = @inUsername and U.Passwords = @inPassword) --Verifica que el usuario exista
			BEGIN
				IF EXISTS(SELECT U.UserName, U.Passwords FROM dbo.Usuario U WHERE U.UserName = @inUsername and U.Passwords = @inPassword and U.TipoUsuario = 'Propietario') --Verifica si es un usuario
					BEGIN
						SET @inValidate = 2; --Si es propietario, se retorna 2
						RETURN @inValidate;
					END
				ELSE
					BEGIN
						SET @inValidate = 1; --Si es administrador, se retorna 1
						RETURN @inValidate;				
					END
			END
		ELSE
			BEGIN
				SET @inValidate = 0; --Si no se encontró el usuario, se retorna cero
				RETURN @inValidate;
			END
	END TRY
	BEGIN CATCH --Toma errores en caso de que ocurran
		BEGIN
			INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			Set @outResultCode=50001; --Establece el código de error 
		END
	END CATCH
	SET NOCOUNT OFF;
END
declare @a INT;
EXEC @a =  [dbo].[validateLogin] finickySmelt5,a0S4fq,0
PRINT @a
GO
/****** Object:  Trigger [dbo].[TrPropiedadInsert]    Script Date: 29/11/2022 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[TrPropiedadInsert]
   ON  [dbo].[Propiedad]
   FOR INSERT
AS 
BEGIN
	SET NOCOUNT ON;

--FOR JSON AUTO


DECLARE @tempInserted TABLE (
	afterInsert VARCHAR(500)
	,inIdPropiedad INT
	)

INSERT INTO @tempInserted (
	inIdPropiedad
	,afterInsert
	)
SELECT I.ID
	,CAST((
			SELECT I.[ID]
				,I.[Area]
				,I.[ValorFiscal]
				,I.[FechaRegistro]
				,I.[IdTipoTerreno]
				,I.[IdTipoZona]
				,I.[NumeroFinca]
			FROM inserted I
			FOR JSON AUTO
			) AS VARCHAR(500))
FROM inserted AS I

	INSERT INTO dbo.CambiosEntidades
	(
	IdEntityType,
	EntityId,
	jsonAntes,
	jsonDespues,
	insertedAt,
	insertedBy,
	insertedIn
	)
	SELECT 1,TI.inIdPropiedad,NULL,TI.afterInsert,GETDATE(),'ADMIN','192.168.1.1' FROM @tempInserted AS TI
END


GO
ALTER TABLE [dbo].[Propiedad] ENABLE TRIGGER [TrPropiedadInsert]
GO
USE [master]
GO
ALTER DATABASE [Municipalidad] SET  READ_WRITE 
GO
