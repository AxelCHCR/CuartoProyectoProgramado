USE [master]
GO
/****** Object:  Database [Municipalidad]    Script Date: 28/11/2022 12:14:06 a. m. ******/
CREATE DATABASE [Municipalidad]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Municipalidad', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Municipalidad.mdf' , SIZE = 3284992KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Municipalidad_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Municipalidad_log.ldf' , SIZE = 16785408KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  UserDefinedTableType [dbo].[auxOrdenCorta]    Script Date: 28/11/2022 12:14:06 a. m. ******/
CREATE TYPE [dbo].[auxOrdenCorta] AS TABLE(
	[IdFactura] [int] NULL,
	[IdPropiedad] [int] NULL,
	[IdEstado] [int] NULL,
	[FechaOperación] [date] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[auxOrdenCortaA]    Script Date: 28/11/2022 12:14:06 a. m. ******/
CREATE TYPE [dbo].[auxOrdenCortaA] AS TABLE(
	[IdFactura] [int] NULL,
	[IdPropiedad] [int] NULL,
	[IdEstado] [int] NULL,
	[FechaOperación] [date] NULL
)
GO
/****** Object:  Table [dbo].[AP]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[ArregloPago]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[CambiosEntidades]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[ConceptoCobro]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[ConsumoAgua]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[DBErrors]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[DetalleCC]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[DetalleCCAgua]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[DetalleCCAP]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[EntityType]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[EstadoOrdenesCorta]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[Factura]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[ImpuestoPropiedad]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[InteresesMoratorios]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[MantenimientoParques]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[MovimientoConsumo]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[MovimientosAP]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[OrdenCorta]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[Pagos]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[PatenteComercial]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[PeriodoMontoCC]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[Persona]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[Propiedad]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[PropiedadCCAgua]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[PropiedadXCC]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[PXP]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[PXU]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[RecoleccionBasura]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[Reconexión]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[ReconexionAgua]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[TasaInteresAP]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[TipoDocIdent]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[TipoEstadoFactura]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[TipoMontoCC]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[TipoMovimiento]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[TipoMovimientoConsumo]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[TipoPago]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[TipoTerreno]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[TipoZona]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[TotalFactura]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 28/11/2022 12:14:06 a. m. ******/
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
SET IDENTITY_INSERT [dbo].[ConceptoCobro] ON 

INSERT [dbo].[ConceptoCobro] ([ID], [IdTipoMontoCC], [IdPeriodoMontoCC], [Nombre]) VALUES (1, 2, 1, N'ConsumoAgua')
INSERT [dbo].[ConceptoCobro] ([ID], [IdTipoMontoCC], [IdPeriodoMontoCC], [Nombre]) VALUES (2, 3, 4, N'ImpuestoPropiedad')
INSERT [dbo].[ConceptoCobro] ([ID], [IdTipoMontoCC], [IdPeriodoMontoCC], [Nombre]) VALUES (3, 2, 1, N'RecoleccionBasura')
INSERT [dbo].[ConceptoCobro] ([ID], [IdTipoMontoCC], [IdPeriodoMontoCC], [Nombre]) VALUES (4, 1, 3, N'PatenteComercial')
INSERT [dbo].[ConceptoCobro] ([ID], [IdTipoMontoCC], [IdPeriodoMontoCC], [Nombre]) VALUES (5, 1, 1, N'Reconexion')
INSERT [dbo].[ConceptoCobro] ([ID], [IdTipoMontoCC], [IdPeriodoMontoCC], [Nombre]) VALUES (6, 3, 1, N'InteresesMoratorios')
INSERT [dbo].[ConceptoCobro] ([ID], [IdTipoMontoCC], [IdPeriodoMontoCC], [Nombre]) VALUES (7, 1, 4, N'MantenimientoParques')
INSERT [dbo].[ConceptoCobro] ([ID], [IdTipoMontoCC], [IdPeriodoMontoCC], [Nombre]) VALUES (8, 1, 1, N'ArregloPago')
SET IDENTITY_INSERT [dbo].[ConceptoCobro] OFF
GO
INSERT [dbo].[ConsumoAgua] ([ID], [ValorMinimo], [ValorMinimoM3], [ValorFijoM3Adicional]) VALUES (1, 300.0000, 30.0000, 100.0000)
GO
SET IDENTITY_INSERT [dbo].[DBErrors] ON 

INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (1, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:53:05.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:53:37.190' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (3, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:53:38.310' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (4, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:56:46.367' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (5, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:57:21.463' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (6, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:57:22.043' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (7, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:57:24.560' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (8, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:57:25.277' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (9, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:58:58.753' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (10, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:43:32.870' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (11, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:43:35.903' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (12, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:43:53.957' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (13, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:43:55.020' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (14, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:43:59.430' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (15, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:21.777' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (16, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:22.627' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (17, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:23.070' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (18, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:23.303' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (19, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:23.530' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (20, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:23.700' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (21, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:23.927' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (22, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:24.123' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (23, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:24.340' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (24, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:49.890' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (25, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:45:06.617' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (26, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:45:49.720' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (27, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:53:37.820' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (28, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:53:38.590' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (29, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:57:01.673' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (30, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T22:01:14.010' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (31, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T22:02:10.787' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (32, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T22:02:42.367' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (33, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T22:02:43.110' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (34, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:06:57.600' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (35, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:13:44.573' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (36, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:20:08.120' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (37, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:21:55.143' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (38, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:22:13.863' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (39, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:07.393' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (40, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.927' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (41, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.933' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (42, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.933' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (43, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.933' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (44, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.933' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (45, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.933' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (46, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (47, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (48, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (49, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (50, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (51, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (52, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (53, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (54, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (55, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (56, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (57, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (58, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (59, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (60, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (61, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (62, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (63, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.943' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (64, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.943' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (65, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.943' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (66, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.947' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (67, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.947' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (68, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.947' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (69, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.947' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (70, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.947' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (71, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.947' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (72, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.480' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (73, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.483' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (74, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.487' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (75, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.487' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (76, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.487' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (77, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.487' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (78, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.487' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (79, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.487' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (80, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.490' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (81, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.490' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (82, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.490' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (83, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.490' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (84, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.490' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (85, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.490' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (86, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.490' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (87, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.493' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (88, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.493' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (89, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.493' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (90, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.493' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (91, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.493' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (92, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.493' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (93, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.497' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (94, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.497' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (95, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.497' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (96, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.497' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (97, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.497' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (98, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.497' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (99, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.500' AS DateTime))
GO
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (100, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.500' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (101, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.500' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (102, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.500' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (103, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.500' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (104, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.670' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (105, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.677' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (106, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.677' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (107, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.677' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (108, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.677' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (109, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.680' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (110, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.680' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (111, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.680' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (112, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.680' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (113, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.680' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (114, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.680' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (115, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.680' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (116, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.683' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (117, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.683' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (118, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.683' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (119, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.683' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (120, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.683' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (121, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.687' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (122, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.687' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (123, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.687' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (124, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.687' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (125, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.687' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (126, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (127, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (128, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (129, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (130, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (131, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (132, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (133, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (134, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (135, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (136, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.203' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (137, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (138, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (139, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (140, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (141, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (142, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (143, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (144, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (145, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (146, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (147, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.213' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (148, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.213' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (149, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.213' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (150, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.213' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (151, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.213' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (152, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.213' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (153, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.217' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (154, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.217' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (155, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.217' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (156, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.217' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (157, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.217' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (158, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.217' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (159, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.217' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (160, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.220' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (161, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.220' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (162, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.220' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (163, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.220' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (164, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.220' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (165, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.220' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (166, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.220' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (167, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.223' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (168, N'LAPTOP-9BCLTGCP\javie', 515, 2, 16, 18, N'dbo.insertUser', N'Cannot insert the value NULL into column ''IdPersona'', table ''Municipalidad.dbo.Usuario''; column does not allow nulls. INSERT fails.', CAST(N'2022-10-16T23:47:29.157' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (169, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-25T21:50:01.320' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (170, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-25T21:50:04.467' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (171, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-25T22:18:43.460' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (172, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.usuariosPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-25T22:19:48.667' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (173, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.usuariosPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-25T22:29:26.593' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (174, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-25T22:29:35.303' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (175, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.usuariosPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-25T22:29:37.173' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (176, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-25T22:31:36.123' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (177, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.usuariosPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-25T22:31:37.527' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (178, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:22.177' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (179, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:38.667' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (180, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:38.793' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (181, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:38.917' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (182, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:39.040' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (183, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:39.163' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (184, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:39.303' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (185, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:39.450' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (186, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:39.583' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (187, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:39.713' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (188, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:39.860' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (189, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:40.000' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (190, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:40.143' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (191, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:40.270' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (192, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:40.393' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (193, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:40.533' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (194, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:40.663' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (195, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:40.793' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (196, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:40.920' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (197, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:41.043' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (198, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:41.163' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (199, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:41.290' AS DateTime))
GO
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (200, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:41.417' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (201, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:41.533' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (202, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:41.673' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (203, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:41.810' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (204, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:41.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (205, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:42.073' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (206, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:42.220' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (207, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:42.367' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (208, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:42.503' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (209, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:42.633' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (210, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propiedadesUsuario', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-11-08T22:20:13.013' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (211, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propiedadesUsuario', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-11-08T22:20:41.560' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (212, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propiedadesUsuario', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-11-08T22:21:30.510' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (213, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propiedadesUsuario', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-11-08T22:21:38.883' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (214, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propiedadesUsuario', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-11-08T22:21:40.823' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (215, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propiedadesUsuario', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-11-08T23:34:17.180' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (216, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propiedadesUsuario', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-11-08T23:34:33.253' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (217, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propiedadesUsuario', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-11-08T23:34:39.317' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (218, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propiedadesUsuario', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-11-08T23:34:47.800' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (219, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propiedadesUsuario', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-11-08T23:34:56.373' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (220, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propiedadesUsuario', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-11-08T23:35:02.747' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (221, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propiedadesUsuario', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-11-08T23:35:09.800' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (222, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propiedadesUsuario', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-11-09T14:09:28.080' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (223, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propiedadesUsuario', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-11-09T20:51:37.867' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (224, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propiedadesUsuario', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-11-09T22:34:45.313' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (225, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propiedadesUsuario', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-11-09T22:34:54.377' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (226, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propiedadesUsuario', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-11-27T02:47:02.390' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (227, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propiedadesUsuario', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-11-27T02:54:13.597' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (228, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propiedadesUsuario', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-11-27T02:54:25.060' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (229, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propiedadesUsuario', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-11-27T02:54:34.883' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (230, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propiedadesUsuario', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-11-27T02:54:45.240' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (232, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:36:53.967' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (235, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:12.097' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (237, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:12.800' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (239, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:13.500' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (241, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:14.200' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (243, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:15.013' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (245, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:15.753' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (247, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:16.477' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (249, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:17.290' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (251, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:18.033' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (253, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:18.783' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (255, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:19.580' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (257, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:20.377' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (259, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:21.183' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (261, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:21.967' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (263, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:22.817' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (265, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:23.633' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (267, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:24.463' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (269, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:25.253' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (271, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:26.123' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (273, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:26.977' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (275, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:27.873' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (277, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:28.680' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (279, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:29.577' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (281, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:30.467' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (283, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:31.390' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (285, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:32.293' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (287, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:33.223' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (289, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:34.183' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (291, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:34.997' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (293, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:35.970' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (295, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:36.910' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (297, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:38.010' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (299, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:39.020' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (301, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:39.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (303, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:40.860' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (305, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:41.827' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (307, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:42.857' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (309, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:43.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (311, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:44.973' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (313, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:45.903' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (315, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:46.953' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (317, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:47.950' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (319, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:49.093' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (321, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:50.187' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (323, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:51.263' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (325, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:52.390' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (327, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:52.993' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (329, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:53.683' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (331, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:54.383' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (333, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:55.080' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (335, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:55.783' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (337, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:56.480' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (339, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:57.160' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (341, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:57.873' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (343, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:58.673' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (345, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:42:59.353' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (347, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:43:00.083' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (349, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:43:00.810' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (351, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:43:01.503' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (353, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:43:02.220' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (355, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:43:02.923' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (357, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:43:03.560' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (359, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:43:04.283' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (361, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:43:04.990' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (363, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:43:05.700' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (365, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:43:06.417' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (367, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:43:07.130' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (369, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:43:07.820' AS DateTime))
GO
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (371, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:43:08.623' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (373, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:43:09.363' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (375, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:43:10.060' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (377, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:43:10.813' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (379, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:43:11.523' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (381, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:43:12.240' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (383, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:43:12.947' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (385, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 14, N'dbo.SPGenerarFacturas', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Factura_TipoEstadoFactura". The conflict occurred in database "Municipalidad", table "dbo.TipoEstadoFactura", column ''ID''.', CAST(N'2022-11-27T22:43:13.650' AS DateTime))
SET IDENTITY_INSERT [dbo].[DBErrors] OFF
GO
SET IDENTITY_INSERT [dbo].[EntityType] ON 

INSERT [dbo].[EntityType] ([ID], [Nombre]) VALUES (1, N'Propiedad')
INSERT [dbo].[EntityType] ([ID], [Nombre]) VALUES (2, N'Propietario')
INSERT [dbo].[EntityType] ([ID], [Nombre]) VALUES (3, N'User')
INSERT [dbo].[EntityType] ([ID], [Nombre]) VALUES (4, N'Propiedad vs Propietario')
INSERT [dbo].[EntityType] ([ID], [Nombre]) VALUES (5, N'Propiedad vs Usuario')
INSERT [dbo].[EntityType] ([ID], [Nombre]) VALUES (6, N'PropietarioUnico')
INSERT [dbo].[EntityType] ([ID], [Nombre]) VALUES (7, N'Concepto de Cobro')
SET IDENTITY_INSERT [dbo].[EntityType] OFF
GO
INSERT [dbo].[EstadoOrdenesCorta] ([ID], [Nombre]) VALUES (1, N'Pendiente de pago')
INSERT [dbo].[EstadoOrdenesCorta] ([ID], [Nombre]) VALUES (2, N'Pago de reconexión realizado')
GO
INSERT [dbo].[ImpuestoPropiedad] ([ID], [ValorPorcentual]) VALUES (2, 0.01)
GO
INSERT [dbo].[InteresesMoratorios] ([ID], [ValorPorcentual], [ValorFijo]) VALUES (1, 0.02, 30000.0000)
GO
INSERT [dbo].[MantenimientoParques] ([ID], [ValorPorcentual], [ValorFijo]) VALUES (7, 0.02, 2000.0000)
GO
SET IDENTITY_INSERT [dbo].[Pagos] ON 

INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1, 3439, CAST(N'2022-04-01' AS Date), 3, 12403, 7)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2, 9070, CAST(N'2022-04-01' AS Date), 3, 12929, 1)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3, 7157, CAST(N'2022-04-01' AS Date), 1, 19217, 2)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (4, 8966, CAST(N'2022-04-01' AS Date), 3, 70182, 11)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (5, 6862, CAST(N'2022-04-01' AS Date), 3, 47999, 12)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (6, 7146, CAST(N'2022-04-01' AS Date), 1, 16089, 3)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (7, 9151, CAST(N'2022-04-01' AS Date), 1, 51789, 4)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (8, 7421, CAST(N'2022-04-01' AS Date), 3, 74691, 9)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (9, 8207, CAST(N'2022-04-01' AS Date), 3, 61413, 10)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (10, 9824, CAST(N'2022-04-01' AS Date), 1, 21838, 13)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (11, 9228, CAST(N'2022-04-01' AS Date), 2, 78727, 5)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (12, 5469, CAST(N'2022-04-01' AS Date), 2, 44004, 8)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (13, 5707, CAST(N'2022-04-01' AS Date), 2, 85819, 6)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (14, 4889, CAST(N'2022-04-02' AS Date), 1, 56914, 20)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (15, 4234, CAST(N'2022-04-02' AS Date), 3, 11507, 25)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (16, 6891, CAST(N'2022-04-02' AS Date), 1, 13070, 26)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (17, 3533, CAST(N'2022-04-02' AS Date), 3, 48109, 19)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (18, 6608, CAST(N'2022-04-02' AS Date), 1, 66384, 27)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (19, 3751, CAST(N'2022-04-02' AS Date), 2, 17769, 17)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (20, 5729, CAST(N'2022-04-02' AS Date), 1, 16963, 14)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (21, 5587, CAST(N'2022-04-02' AS Date), 1, 36461, 15)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (22, 2646, CAST(N'2022-04-02' AS Date), 3, 91477, 21)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (23, 8833, CAST(N'2022-04-02' AS Date), 2, 78834, 18)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (24, 8817, CAST(N'2022-04-02' AS Date), 1, 81788, 16)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (25, 5220, CAST(N'2022-04-02' AS Date), 1, 30158, 22)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (26, 7376, CAST(N'2022-04-02' AS Date), 2, 11356, 23)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (27, 5418, CAST(N'2022-04-02' AS Date), 1, 47452, 24)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (28, 7076, CAST(N'2022-04-03' AS Date), 2, 61994, 37)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (29, 2992, CAST(N'2022-04-03' AS Date), 1, 78149, 38)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (30, 3554, CAST(N'2022-04-03' AS Date), 1, 48023, 28)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (31, 7453, CAST(N'2022-04-03' AS Date), 3, 77238, 31)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (32, 8760, CAST(N'2022-04-03' AS Date), 3, 14247, 30)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (33, 6695, CAST(N'2022-04-03' AS Date), 2, 69370, 34)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (34, 6475, CAST(N'2022-04-03' AS Date), 1, 54389, 36)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (35, 5313, CAST(N'2022-04-03' AS Date), 3, 15346, 29)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (36, 1489, CAST(N'2022-04-03' AS Date), 2, 26262, 35)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (37, 5016, CAST(N'2022-04-03' AS Date), 2, 72072, 32)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (38, 4827, CAST(N'2022-04-03' AS Date), 3, 39582, 33)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (39, 3663, CAST(N'2022-04-03' AS Date), 2, 44975, 39)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (40, 5622, CAST(N'2022-04-04' AS Date), 3, 79886, 40)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (41, 1802, CAST(N'2022-04-04' AS Date), 2, 22771, 50)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (42, 3679, CAST(N'2022-04-04' AS Date), 2, 58256, 51)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (43, 4202, CAST(N'2022-04-04' AS Date), 3, 81569, 41)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (44, 9586, CAST(N'2022-04-04' AS Date), 3, 42490, 49)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (45, 6750, CAST(N'2022-04-04' AS Date), 2, 37832, 44)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (46, 8589, CAST(N'2022-04-04' AS Date), 2, 48875, 45)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (47, 1965, CAST(N'2022-04-04' AS Date), 1, 28441, 46)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (48, 5868, CAST(N'2022-04-04' AS Date), 1, 26515, 47)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (49, 1996, CAST(N'2022-04-04' AS Date), 2, 89188, 42)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (50, 1682, CAST(N'2022-04-04' AS Date), 3, 68337, 48)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (51, 1585, CAST(N'2022-04-04' AS Date), 3, 57675, 43)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (52, 8880, CAST(N'2022-04-05' AS Date), 3, 92529, 60)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (53, 7488, CAST(N'2022-04-05' AS Date), 2, 66409, 61)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (54, 7441, CAST(N'2022-04-05' AS Date), 3, 80201, 62)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (55, 2977, CAST(N'2022-04-05' AS Date), 1, 55997, 63)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (56, 4386, CAST(N'2022-04-05' AS Date), 2, 67205, 64)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (57, 3051, CAST(N'2022-04-05' AS Date), 3, 12615, 67)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (58, 3619, CAST(N'2022-04-05' AS Date), 1, 91426, 56)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (59, 5047, CAST(N'2022-04-05' AS Date), 2, 38372, 65)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (60, 5060, CAST(N'2022-04-05' AS Date), 2, 70062, 58)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (61, 8316, CAST(N'2022-04-05' AS Date), 1, 47661, 52)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (62, 7155, CAST(N'2022-04-05' AS Date), 1, 33233, 53)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (63, 2584, CAST(N'2022-04-05' AS Date), 3, 17737, 54)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (64, 5338, CAST(N'2022-04-05' AS Date), 1, 11636, 55)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (65, 7220, CAST(N'2022-04-05' AS Date), 2, 12337, 59)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (66, 5997, CAST(N'2022-04-05' AS Date), 3, 13841, 57)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (67, 7548, CAST(N'2022-04-05' AS Date), 3, 45195, 66)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (68, 2170, CAST(N'2022-04-06' AS Date), 2, 24175, 68)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (69, 9483, CAST(N'2022-04-06' AS Date), 3, 63578, 77)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (70, 3139, CAST(N'2022-04-06' AS Date), 2, 89314, 78)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (71, 9634, CAST(N'2022-04-06' AS Date), 1, 24079, 74)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (72, 8829, CAST(N'2022-04-06' AS Date), 2, 78633, 75)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (73, 2841, CAST(N'2022-04-06' AS Date), 2, 89056, 76)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (74, 8077, CAST(N'2022-04-06' AS Date), 1, 17242, 72)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (75, 6810, CAST(N'2022-04-06' AS Date), 1, 95902, 71)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (76, 6823, CAST(N'2022-04-06' AS Date), 2, 76499, 69)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (77, 6033, CAST(N'2022-04-06' AS Date), 2, 81547, 70)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (78, 4289, CAST(N'2022-04-06' AS Date), 3, 10168, 73)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (79, 9869, CAST(N'2022-04-07' AS Date), 2, 18182, 79)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (80, 7451, CAST(N'2022-04-07' AS Date), 2, 53329, 80)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (81, 9859, CAST(N'2022-04-07' AS Date), 2, 66492, 85)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (82, 5144, CAST(N'2022-04-07' AS Date), 1, 10674, 86)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (83, 3891, CAST(N'2022-04-07' AS Date), 1, 12983, 84)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (84, 5919, CAST(N'2022-04-07' AS Date), 1, 40412, 90)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (85, 3411, CAST(N'2022-04-07' AS Date), 1, 17452, 91)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (86, 2287, CAST(N'2022-04-07' AS Date), 3, 45240, 83)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (87, 9327, CAST(N'2022-04-07' AS Date), 1, 37018, 81)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (88, 4060, CAST(N'2022-04-07' AS Date), 2, 44156, 89)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (89, 1981, CAST(N'2022-04-07' AS Date), 3, 89370, 87)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (90, 8496, CAST(N'2022-04-07' AS Date), 1, 66582, 93)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (91, 9671, CAST(N'2022-04-07' AS Date), 3, 57762, 88)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (92, 2590, CAST(N'2022-04-07' AS Date), 3, 57228, 92)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (93, 6350, CAST(N'2022-04-07' AS Date), 3, 43708, 82)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (94, 2708, CAST(N'2022-04-08' AS Date), 1, 39554, 94)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (95, 1798, CAST(N'2022-04-08' AS Date), 1, 74496, 101)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (96, 4197, CAST(N'2022-04-08' AS Date), 2, 86397, 103)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (97, 9095, CAST(N'2022-04-08' AS Date), 1, 19630, 100)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (98, 2626, CAST(N'2022-04-08' AS Date), 3, 57579, 104)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (99, 2978, CAST(N'2022-04-08' AS Date), 2, 10965, 99)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (100, 8973, CAST(N'2022-04-08' AS Date), 1, 75662, 102)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (101, 2621, CAST(N'2022-04-08' AS Date), 2, 65076, 95)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (102, 6003, CAST(N'2022-04-08' AS Date), 3, 59683, 96)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (103, 1072, CAST(N'2022-04-08' AS Date), 3, 39484, 97)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (104, 8855, CAST(N'2022-04-08' AS Date), 1, 28777, 98)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (105, 1455, CAST(N'2022-04-09' AS Date), 2, 34154, 109)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (106, 6290, CAST(N'2022-04-09' AS Date), 3, 50476, 110)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (107, 8486, CAST(N'2022-04-09' AS Date), 3, 20267, 111)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (108, 3454, CAST(N'2022-04-09' AS Date), 3, 33830, 112)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (109, 5732, CAST(N'2022-04-09' AS Date), 1, 95317, 117)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (110, 1664, CAST(N'2022-04-09' AS Date), 2, 10607, 118)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (111, 8830, CAST(N'2022-04-09' AS Date), 1, 92421, 108)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (112, 2360, CAST(N'2022-04-09' AS Date), 2, 85610, 105)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (113, 1923, CAST(N'2022-04-09' AS Date), 3, 94652, 116)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (114, 3468, CAST(N'2022-04-09' AS Date), 3, 42245, 113)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (115, 3936, CAST(N'2022-04-09' AS Date), 1, 15930, 106)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (116, 6672, CAST(N'2022-04-09' AS Date), 1, 63556, 114)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (117, 6605, CAST(N'2022-04-09' AS Date), 2, 39647, 115)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (118, 4672, CAST(N'2022-04-09' AS Date), 3, 80707, 107)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (119, 6709, CAST(N'2022-04-10' AS Date), 2, 22467, 125)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (120, 3174, CAST(N'2022-04-10' AS Date), 1, 72709, 126)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (121, 6343, CAST(N'2022-04-10' AS Date), 3, 35852, 119)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (122, 8662, CAST(N'2022-04-10' AS Date), 2, 77416, 130)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (123, 8741, CAST(N'2022-04-10' AS Date), 2, 14033, 124)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (124, 1006, CAST(N'2022-04-10' AS Date), 3, 19086, 131)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (125, 2033, CAST(N'2022-04-10' AS Date), 3, 36992, 120)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (126, 2339, CAST(N'2022-04-10' AS Date), 1, 60500, 121)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (127, 3660, CAST(N'2022-04-10' AS Date), 1, 31140, 127)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (128, 3005, CAST(N'2022-04-10' AS Date), 3, 95524, 128)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (129, 3350, CAST(N'2022-04-10' AS Date), 1, 32929, 129)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (130, 4553, CAST(N'2022-04-10' AS Date), 1, 30084, 122)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (131, 7650, CAST(N'2022-04-10' AS Date), 2, 48769, 123)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (132, 2758, CAST(N'2022-04-11' AS Date), 1, 16595, 141)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (133, 7259, CAST(N'2022-04-11' AS Date), 1, 84007, 132)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (134, 4521, CAST(N'2022-04-11' AS Date), 1, 55839, 133)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (135, 7079, CAST(N'2022-04-11' AS Date), 3, 87235, 138)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (136, 4354, CAST(N'2022-04-11' AS Date), 3, 92774, 139)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (137, 1191, CAST(N'2022-04-11' AS Date), 1, 86105, 140)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (138, 7105, CAST(N'2022-04-11' AS Date), 1, 72064, 136)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (139, 4016, CAST(N'2022-04-11' AS Date), 1, 97638, 142)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (140, 5589, CAST(N'2022-04-11' AS Date), 3, 91273, 137)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (141, 7526, CAST(N'2022-04-11' AS Date), 2, 28326, 134)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (142, 5466, CAST(N'2022-04-11' AS Date), 1, 35190, 143)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (143, 8335, CAST(N'2022-04-11' AS Date), 3, 92173, 135)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (144, 4412, CAST(N'2022-04-12' AS Date), 2, 48464, 148)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (145, 4577, CAST(N'2022-04-12' AS Date), 2, 11836, 156)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (146, 3351, CAST(N'2022-04-12' AS Date), 3, 94599, 155)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (147, 4034, CAST(N'2022-04-12' AS Date), 1, 78130, 144)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (148, 6076, CAST(N'2022-04-12' AS Date), 3, 58880, 149)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (149, 1384, CAST(N'2022-04-12' AS Date), 3, 10296, 150)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (150, 6285, CAST(N'2022-04-12' AS Date), 1, 73246, 147)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (151, 3289, CAST(N'2022-04-12' AS Date), 1, 99588, 145)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (152, 4631, CAST(N'2022-04-12' AS Date), 2, 70318, 151)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (153, 8009, CAST(N'2022-04-12' AS Date), 2, 24671, 152)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (154, 5800, CAST(N'2022-04-12' AS Date), 2, 66309, 153)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (155, 6685, CAST(N'2022-04-12' AS Date), 1, 64122, 154)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (156, 3060, CAST(N'2022-04-12' AS Date), 1, 66458, 146)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (157, 2208, CAST(N'2022-04-13' AS Date), 3, 51148, 161)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (158, 3288, CAST(N'2022-04-13' AS Date), 2, 54059, 160)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (159, 5631, CAST(N'2022-04-13' AS Date), 2, 37394, 157)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (160, 9796, CAST(N'2022-04-13' AS Date), 2, 47168, 158)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (161, 7611, CAST(N'2022-04-13' AS Date), 1, 55780, 159)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (162, 1941, CAST(N'2022-04-14' AS Date), 1, 11599, 172)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (163, 3113, CAST(N'2022-04-14' AS Date), 3, 90187, 165)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (164, 3462, CAST(N'2022-04-14' AS Date), 1, 81749, 171)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (165, 4205, CAST(N'2022-04-14' AS Date), 1, 89016, 162)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (166, 4627, CAST(N'2022-04-14' AS Date), 2, 68986, 166)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (167, 4680, CAST(N'2022-04-14' AS Date), 1, 85466, 167)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (168, 5161, CAST(N'2022-04-14' AS Date), 1, 28209, 169)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (169, 6866, CAST(N'2022-04-14' AS Date), 1, 79716, 164)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (170, 7245, CAST(N'2022-04-14' AS Date), 2, 65516, 170)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (171, 7278, CAST(N'2022-04-14' AS Date), 3, 95993, 168)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (172, 9225, CAST(N'2022-04-14' AS Date), 3, 18350, 163)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (173, 1024, CAST(N'2022-04-15' AS Date), 3, 54548, 173)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (174, 1632, CAST(N'2022-04-15' AS Date), 3, 73903, 177)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (175, 1694, CAST(N'2022-04-15' AS Date), 1, 10390, 181)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (176, 3247, CAST(N'2022-04-15' AS Date), 3, 27413, 175)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (177, 5330, CAST(N'2022-04-15' AS Date), 3, 51041, 180)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (178, 5373, CAST(N'2022-04-15' AS Date), 3, 36004, 174)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (179, 6161, CAST(N'2022-04-15' AS Date), 2, 79071, 178)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (180, 7570, CAST(N'2022-04-15' AS Date), 1, 56649, 176)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (181, 9178, CAST(N'2022-04-15' AS Date), 3, 35585, 179)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (182, 3349, CAST(N'2022-04-16' AS Date), 1, 51611, 191)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (183, 3729, CAST(N'2022-04-16' AS Date), 3, 13011, 192)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (184, 3761, CAST(N'2022-04-16' AS Date), 3, 40868, 185)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (185, 3977, CAST(N'2022-04-16' AS Date), 1, 12955, 184)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (186, 4924, CAST(N'2022-04-16' AS Date), 1, 26950, 187)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (187, 6274, CAST(N'2022-04-16' AS Date), 1, 78609, 188)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (188, 7052, CAST(N'2022-04-16' AS Date), 2, 37457, 193)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (189, 7779, CAST(N'2022-04-16' AS Date), 3, 20982, 186)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (190, 8661, CAST(N'2022-04-16' AS Date), 2, 50459, 183)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (191, 8866, CAST(N'2022-04-16' AS Date), 2, 33758, 182)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (192, 9391, CAST(N'2022-04-16' AS Date), 2, 53313, 189)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (193, 9430, CAST(N'2022-04-16' AS Date), 3, 47048, 190)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (194, 3743, CAST(N'2022-04-17' AS Date), 2, 57021, 196)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (195, 4524, CAST(N'2022-04-17' AS Date), 3, 36776, 202)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (196, 5103, CAST(N'2022-04-17' AS Date), 2, 96064, 199)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (197, 5152, CAST(N'2022-04-17' AS Date), 3, 45664, 201)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (198, 5650, CAST(N'2022-04-17' AS Date), 2, 51412, 194)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (199, 6999, CAST(N'2022-04-17' AS Date), 1, 67573, 200)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (200, 7509, CAST(N'2022-04-17' AS Date), 2, 30441, 198)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (201, 8719, CAST(N'2022-04-17' AS Date), 2, 82561, 197)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (202, 9753, CAST(N'2022-04-17' AS Date), 3, 99128, 195)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (203, 1036, CAST(N'2022-04-18' AS Date), 2, 37002, 210)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (204, 4121, CAST(N'2022-04-18' AS Date), 1, 10471, 206)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (205, 5986, CAST(N'2022-04-18' AS Date), 2, 68854, 205)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (206, 6123, CAST(N'2022-04-18' AS Date), 3, 16335, 211)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (207, 7420, CAST(N'2022-04-18' AS Date), 3, 62277, 203)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (208, 8037, CAST(N'2022-04-18' AS Date), 3, 89754, 209)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (209, 8189, CAST(N'2022-04-18' AS Date), 1, 43148, 207)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (210, 8607, CAST(N'2022-04-18' AS Date), 2, 91331, 204)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (211, 8970, CAST(N'2022-04-18' AS Date), 1, 63520, 208)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (212, 2904, CAST(N'2022-04-19' AS Date), 3, 63545, 215)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (213, 3691, CAST(N'2022-04-19' AS Date), 1, 15621, 221)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (214, 4180, CAST(N'2022-04-19' AS Date), 3, 97351, 220)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (215, 5344, CAST(N'2022-04-19' AS Date), 2, 74003, 214)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (216, 5526, CAST(N'2022-04-19' AS Date), 3, 98801, 217)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (217, 7495, CAST(N'2022-04-19' AS Date), 1, 14626, 219)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (218, 8458, CAST(N'2022-04-19' AS Date), 2, 35289, 213)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (219, 9516, CAST(N'2022-04-19' AS Date), 2, 52783, 218)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (220, 9673, CAST(N'2022-04-19' AS Date), 3, 77705, 216)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (221, 9694, CAST(N'2022-04-19' AS Date), 3, 57662, 212)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (222, 2426, CAST(N'2022-04-20' AS Date), 1, 36226, 225)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (223, 2452, CAST(N'2022-04-20' AS Date), 2, 36164, 222)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (224, 2636, CAST(N'2022-04-20' AS Date), 2, 51652, 224)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (225, 4917, CAST(N'2022-04-20' AS Date), 2, 61089, 226)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (226, 8010, CAST(N'2022-04-20' AS Date), 3, 81998, 228)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (227, 8497, CAST(N'2022-04-20' AS Date), 2, 75252, 229)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (228, 9037, CAST(N'2022-04-20' AS Date), 1, 75177, 227)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (229, 9794, CAST(N'2022-04-20' AS Date), 3, 40084, 223)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (230, 1801, CAST(N'2022-04-21' AS Date), 1, 35194, 231)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (231, 2482, CAST(N'2022-04-21' AS Date), 3, 93388, 238)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (232, 2749, CAST(N'2022-04-21' AS Date), 1, 24921, 237)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (233, 2921, CAST(N'2022-04-21' AS Date), 1, 12107, 243)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (234, 4291, CAST(N'2022-04-21' AS Date), 2, 90246, 236)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (235, 5063, CAST(N'2022-04-21' AS Date), 3, 87324, 239)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (236, 5239, CAST(N'2022-04-21' AS Date), 3, 77482, 230)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (237, 5871, CAST(N'2022-04-21' AS Date), 3, 81615, 240)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (238, 6334, CAST(N'2022-04-21' AS Date), 3, 20789, 234)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (239, 7223, CAST(N'2022-04-21' AS Date), 2, 11492, 232)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (240, 7540, CAST(N'2022-04-21' AS Date), 2, 93570, 242)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (241, 7597, CAST(N'2022-04-21' AS Date), 1, 58945, 244)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (242, 7900, CAST(N'2022-04-21' AS Date), 2, 47795, 241)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (243, 9384, CAST(N'2022-04-21' AS Date), 1, 19400, 233)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (244, 9504, CAST(N'2022-04-21' AS Date), 1, 70273, 235)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (245, 1916, CAST(N'2022-04-22' AS Date), 1, 65199, 256)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (246, 1926, CAST(N'2022-04-22' AS Date), 2, 61625, 249)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (247, 1942, CAST(N'2022-04-22' AS Date), 1, 39880, 251)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (248, 1975, CAST(N'2022-04-22' AS Date), 1, 74596, 248)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (249, 3118, CAST(N'2022-04-22' AS Date), 3, 22952, 250)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (250, 3176, CAST(N'2022-04-22' AS Date), 3, 22424, 245)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (251, 4331, CAST(N'2022-04-22' AS Date), 3, 75059, 252)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (252, 4611, CAST(N'2022-04-22' AS Date), 1, 60731, 255)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (253, 5787, CAST(N'2022-04-22' AS Date), 2, 73629, 253)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (254, 6062, CAST(N'2022-04-22' AS Date), 1, 70549, 257)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (255, 6170, CAST(N'2022-04-22' AS Date), 3, 13353, 246)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (256, 6396, CAST(N'2022-04-22' AS Date), 2, 97166, 247)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (257, 9741, CAST(N'2022-04-22' AS Date), 1, 42575, 254)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (258, 1259, CAST(N'2022-04-23' AS Date), 2, 22997, 261)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (259, 1534, CAST(N'2022-04-23' AS Date), 3, 11102, 263)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (260, 3042, CAST(N'2022-04-23' AS Date), 1, 97593, 264)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (261, 3939, CAST(N'2022-04-23' AS Date), 3, 54036, 258)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (262, 4705, CAST(N'2022-04-23' AS Date), 3, 69845, 265)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (263, 5798, CAST(N'2022-04-23' AS Date), 1, 46330, 259)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (264, 6676, CAST(N'2022-04-23' AS Date), 2, 30169, 262)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (265, 7133, CAST(N'2022-04-23' AS Date), 3, 76105, 260)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (266, 9269, CAST(N'2022-04-23' AS Date), 2, 12691, 266)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (267, 2229, CAST(N'2022-04-24' AS Date), 2, 75325, 272)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (268, 2243, CAST(N'2022-04-24' AS Date), 1, 29776, 278)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (269, 3860, CAST(N'2022-04-24' AS Date), 3, 30980, 273)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (270, 4092, CAST(N'2022-04-24' AS Date), 3, 84794, 277)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (271, 4395, CAST(N'2022-04-24' AS Date), 1, 68123, 268)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (272, 4865, CAST(N'2022-04-24' AS Date), 2, 83848, 279)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (273, 6125, CAST(N'2022-04-24' AS Date), 2, 37022, 267)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (274, 7115, CAST(N'2022-04-24' AS Date), 1, 47313, 275)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (275, 8106, CAST(N'2022-04-24' AS Date), 2, 71847, 271)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (276, 9177, CAST(N'2022-04-24' AS Date), 2, 28399, 276)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (277, 9604, CAST(N'2022-04-24' AS Date), 1, 51281, 274)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (278, 9743, CAST(N'2022-04-24' AS Date), 2, 63020, 269)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (279, 9936, CAST(N'2022-04-24' AS Date), 2, 45024, 270)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (280, 1756, CAST(N'2022-04-25' AS Date), 1, 92535, 287)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (281, 2038, CAST(N'2022-04-25' AS Date), 1, 56094, 288)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (282, 2719, CAST(N'2022-04-25' AS Date), 3, 92616, 290)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (283, 2925, CAST(N'2022-04-25' AS Date), 2, 59384, 289)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (284, 4119, CAST(N'2022-04-25' AS Date), 1, 29330, 280)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (285, 5074, CAST(N'2022-04-25' AS Date), 1, 35717, 284)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (286, 5453, CAST(N'2022-04-25' AS Date), 3, 29493, 292)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (287, 6127, CAST(N'2022-04-25' AS Date), 2, 87544, 286)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (288, 6184, CAST(N'2022-04-25' AS Date), 3, 34701, 285)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (289, 7254, CAST(N'2022-04-25' AS Date), 1, 42655, 282)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (290, 8080, CAST(N'2022-04-25' AS Date), 1, 72656, 283)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (291, 8187, CAST(N'2022-04-25' AS Date), 1, 46190, 291)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (292, 9052, CAST(N'2022-04-25' AS Date), 2, 23893, 293)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (293, 9260, CAST(N'2022-04-25' AS Date), 2, 60624, 281)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (294, 1652, CAST(N'2022-04-26' AS Date), 2, 63442, 295)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (295, 4144, CAST(N'2022-04-26' AS Date), 2, 11205, 294)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (296, 4662, CAST(N'2022-04-26' AS Date), 2, 77220, 298)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (297, 5567, CAST(N'2022-04-26' AS Date), 1, 87886, 299)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (298, 6797, CAST(N'2022-04-26' AS Date), 2, 79780, 297)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (299, 7954, CAST(N'2022-04-26' AS Date), 1, 26190, 296)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (300, 1830, CAST(N'2022-04-27' AS Date), 2, 27741, 302)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (301, 2300, CAST(N'2022-04-27' AS Date), 3, 90771, 305)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (302, 2721, CAST(N'2022-04-27' AS Date), 1, 99856, 301)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (303, 3024, CAST(N'2022-04-27' AS Date), 2, 73657, 306)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (304, 6533, CAST(N'2022-04-27' AS Date), 3, 58098, 311)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (305, 7444, CAST(N'2022-04-27' AS Date), 2, 16208, 309)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (306, 8015, CAST(N'2022-04-27' AS Date), 1, 36864, 308)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (307, 8457, CAST(N'2022-04-27' AS Date), 1, 34190, 303)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (308, 8650, CAST(N'2022-04-27' AS Date), 2, 14509, 310)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (309, 8823, CAST(N'2022-04-27' AS Date), 2, 40140, 304)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (310, 9088, CAST(N'2022-04-27' AS Date), 1, 91616, 300)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (311, 9447, CAST(N'2022-04-27' AS Date), 1, 32694, 307)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (312, 966, CAST(N'2022-04-28' AS Date), 1, 74286, 323)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (313, 1097, CAST(N'2022-04-28' AS Date), 3, 43121, 322)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (314, 1107, CAST(N'2022-04-28' AS Date), 2, 14980, 315)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (315, 1285, CAST(N'2022-04-28' AS Date), 1, 75495, 318)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (316, 1555, CAST(N'2022-04-28' AS Date), 3, 99147, 317)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (317, 1702, CAST(N'2022-04-28' AS Date), 2, 55364, 314)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (318, 1935, CAST(N'2022-04-28' AS Date), 1, 95580, 325)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (319, 2148, CAST(N'2022-04-28' AS Date), 1, 50182, 326)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (320, 2332, CAST(N'2022-04-28' AS Date), 3, 99618, 312)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (321, 2508, CAST(N'2022-04-28' AS Date), 2, 43796, 320)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (322, 3280, CAST(N'2022-04-28' AS Date), 2, 36729, 324)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (323, 4715, CAST(N'2022-04-28' AS Date), 1, 14900, 313)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (324, 6971, CAST(N'2022-04-28' AS Date), 1, 27039, 327)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (325, 7332, CAST(N'2022-04-28' AS Date), 3, 12385, 316)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (326, 8117, CAST(N'2022-04-28' AS Date), 2, 13784, 319)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (327, 8274, CAST(N'2022-04-28' AS Date), 1, 44024, 321)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (328, 1021, CAST(N'2022-04-29' AS Date), 1, 43328, 334)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (329, 1139, CAST(N'2022-04-29' AS Date), 1, 33265, 335)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (330, 1247, CAST(N'2022-04-29' AS Date), 2, 95727, 328)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (331, 1496, CAST(N'2022-04-29' AS Date), 3, 69632, 332)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (332, 2023, CAST(N'2022-04-29' AS Date), 3, 56128, 337)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (333, 3095, CAST(N'2022-04-29' AS Date), 1, 56861, 333)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (334, 6842, CAST(N'2022-04-29' AS Date), 1, 62648, 330)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (335, 8035, CAST(N'2022-04-29' AS Date), 2, 46562, 331)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (336, 8780, CAST(N'2022-04-29' AS Date), 1, 28500, 338)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (337, 9147, CAST(N'2022-04-29' AS Date), 1, 91023, 336)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (338, 9224, CAST(N'2022-04-29' AS Date), 2, 15803, 329)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (339, 3417, CAST(N'2022-04-30' AS Date), 1, 16907, 346)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (340, 3580, CAST(N'2022-04-30' AS Date), 3, 96870, 350)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (341, 4112, CAST(N'2022-04-30' AS Date), 2, 63472, 345)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (342, 4930, CAST(N'2022-04-30' AS Date), 1, 99243, 343)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (343, 5476, CAST(N'2022-04-30' AS Date), 3, 81182, 342)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (344, 5531, CAST(N'2022-04-30' AS Date), 1, 98503, 348)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (345, 8653, CAST(N'2022-04-30' AS Date), 1, 71099, 349)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (346, 8705, CAST(N'2022-04-30' AS Date), 1, 55625, 340)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (347, 8750, CAST(N'2022-04-30' AS Date), 3, 83181, 339)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (348, 9102, CAST(N'2022-04-30' AS Date), 3, 73757, 347)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (349, 9214, CAST(N'2022-04-30' AS Date), 2, 59477, 344)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (350, 9981, CAST(N'2022-04-30' AS Date), 2, 83749, 341)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (351, 1041, CAST(N'2022-05-01' AS Date), 2, 89149, 355)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (352, 2264, CAST(N'2022-05-01' AS Date), 3, 54087, 354)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (353, 3418, CAST(N'2022-05-01' AS Date), 1, 38108, 359)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (354, 4382, CAST(N'2022-05-01' AS Date), 3, 40061, 357)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (355, 5648, CAST(N'2022-05-01' AS Date), 1, 96341, 352)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (356, 6075, CAST(N'2022-05-01' AS Date), 1, 34568, 351)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (357, 6097, CAST(N'2022-05-01' AS Date), 2, 25839, 356)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (358, 6337, CAST(N'2022-05-01' AS Date), 2, 14844, 358)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (359, 8264, CAST(N'2022-05-01' AS Date), 2, 20488, 353)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (360, 1013, CAST(N'2022-05-02' AS Date), 1, 62225, 367)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (361, 1019, CAST(N'2022-05-02' AS Date), 2, 52642, 364)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (362, 1915, CAST(N'2022-05-02' AS Date), 1, 94425, 361)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (363, 2646, CAST(N'2022-05-02' AS Date), 2, 14246, 21)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (364, 3304, CAST(N'2022-05-02' AS Date), 1, 85079, 370)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (365, 3533, CAST(N'2022-05-02' AS Date), 3, 56167, 19)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (366, 3751, CAST(N'2022-05-02' AS Date), 2, 12881, 17)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (367, 3881, CAST(N'2022-05-02' AS Date), 2, 52536, 369)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (368, 4234, CAST(N'2022-05-02' AS Date), 2, 77044, 25)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (369, 4341, CAST(N'2022-05-02' AS Date), 1, 76309, 362)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (370, 4889, CAST(N'2022-05-02' AS Date), 1, 29413, 20)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (371, 5220, CAST(N'2022-05-02' AS Date), 1, 77769, 22)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (372, 5327, CAST(N'2022-05-02' AS Date), 1, 60704, 365)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (373, 5418, CAST(N'2022-05-02' AS Date), 3, 80485, 24)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (374, 5587, CAST(N'2022-05-02' AS Date), 2, 35542, 15)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (375, 5729, CAST(N'2022-05-02' AS Date), 2, 96714, 14)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (376, 5826, CAST(N'2022-05-02' AS Date), 1, 30688, 360)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (377, 6078, CAST(N'2022-05-02' AS Date), 1, 93937, 366)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (378, 6311, CAST(N'2022-05-02' AS Date), 1, 43732, 371)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (379, 6608, CAST(N'2022-05-02' AS Date), 2, 42829, 27)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (380, 6891, CAST(N'2022-05-02' AS Date), 1, 28070, 26)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (381, 7087, CAST(N'2022-05-02' AS Date), 2, 68757, 363)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (382, 7376, CAST(N'2022-05-02' AS Date), 3, 26680, 23)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (383, 7658, CAST(N'2022-05-02' AS Date), 2, 96316, 372)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (384, 8817, CAST(N'2022-05-02' AS Date), 3, 69002, 16)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (385, 8833, CAST(N'2022-05-02' AS Date), 1, 51354, 18)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (386, 9860, CAST(N'2022-05-02' AS Date), 2, 62419, 368)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (387, 1489, CAST(N'2022-05-03' AS Date), 3, 60571, 35)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (388, 1712, CAST(N'2022-05-03' AS Date), 2, 11986, 374)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (389, 2305, CAST(N'2022-05-03' AS Date), 3, 82336, 379)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (390, 2745, CAST(N'2022-05-03' AS Date), 3, 28508, 380)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (391, 2786, CAST(N'2022-05-03' AS Date), 3, 18723, 381)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (392, 2992, CAST(N'2022-05-03' AS Date), 3, 42149, 38)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (393, 3554, CAST(N'2022-05-03' AS Date), 3, 40323, 28)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (394, 3616, CAST(N'2022-05-03' AS Date), 2, 76271, 382)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (395, 3663, CAST(N'2022-05-03' AS Date), 2, 30588, 39)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (396, 3953, CAST(N'2022-05-03' AS Date), 1, 98503, 385)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (397, 4827, CAST(N'2022-05-03' AS Date), 3, 21207, 33)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (398, 4982, CAST(N'2022-05-03' AS Date), 1, 70647, 377)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (399, 5016, CAST(N'2022-05-03' AS Date), 2, 40581, 32)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (400, 5313, CAST(N'2022-05-03' AS Date), 3, 72604, 29)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (401, 6071, CAST(N'2022-05-03' AS Date), 3, 19572, 375)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (402, 6475, CAST(N'2022-05-03' AS Date), 1, 40284, 36)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (403, 6695, CAST(N'2022-05-03' AS Date), 2, 88650, 34)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (404, 7025, CAST(N'2022-05-03' AS Date), 3, 12777, 388)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (405, 7069, CAST(N'2022-05-03' AS Date), 1, 37548, 378)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (406, 7076, CAST(N'2022-05-03' AS Date), 3, 37565, 37)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (407, 7453, CAST(N'2022-05-03' AS Date), 2, 20886, 31)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (408, 8295, CAST(N'2022-05-03' AS Date), 2, 99648, 373)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (409, 8428, CAST(N'2022-05-03' AS Date), 2, 93773, 387)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (410, 8477, CAST(N'2022-05-03' AS Date), 3, 54368, 383)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (411, 8760, CAST(N'2022-05-03' AS Date), 2, 91512, 30)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (412, 9111, CAST(N'2022-05-03' AS Date), 3, 38049, 376)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (413, 9275, CAST(N'2022-05-03' AS Date), 1, 49914, 384)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (414, 9951, CAST(N'2022-05-03' AS Date), 3, 48656, 386)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (415, 1585, CAST(N'2022-05-04' AS Date), 2, 15194, 43)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (416, 1608, CAST(N'2022-05-04' AS Date), 2, 67115, 395)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (417, 1682, CAST(N'2022-05-04' AS Date), 1, 20926, 48)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (418, 1802, CAST(N'2022-05-04' AS Date), 3, 79153, 50)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (419, 1965, CAST(N'2022-05-04' AS Date), 1, 19761, 46)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (420, 1996, CAST(N'2022-05-04' AS Date), 1, 26279, 42)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (421, 3679, CAST(N'2022-05-04' AS Date), 3, 14560, 51)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (422, 4202, CAST(N'2022-05-04' AS Date), 1, 83049, 41)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (423, 4811, CAST(N'2022-05-04' AS Date), 2, 38241, 391)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (424, 5622, CAST(N'2022-05-04' AS Date), 2, 53626, 40)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (425, 5868, CAST(N'2022-05-04' AS Date), 1, 90863, 47)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (426, 5912, CAST(N'2022-05-04' AS Date), 1, 81500, 396)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (427, 6750, CAST(N'2022-05-04' AS Date), 1, 54387, 44)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (428, 7803, CAST(N'2022-05-04' AS Date), 2, 42078, 393)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (429, 7835, CAST(N'2022-05-04' AS Date), 2, 31345, 390)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (430, 8108, CAST(N'2022-05-04' AS Date), 1, 25210, 392)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (431, 8574, CAST(N'2022-05-04' AS Date), 2, 71398, 389)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (432, 8589, CAST(N'2022-05-04' AS Date), 2, 30440, 45)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (433, 9417, CAST(N'2022-05-04' AS Date), 3, 76779, 394)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (434, 9586, CAST(N'2022-05-04' AS Date), 3, 64204, 49)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (435, 494, CAST(N'2022-05-05' AS Date), 3, 45742, 402)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (436, 1818, CAST(N'2022-05-05' AS Date), 2, 55362, 406)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (437, 2175, CAST(N'2022-05-05' AS Date), 3, 36169, 401)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (438, 2361, CAST(N'2022-05-05' AS Date), 2, 31929, 409)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (439, 2584, CAST(N'2022-05-05' AS Date), 2, 61321, 54)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (440, 2977, CAST(N'2022-05-05' AS Date), 2, 42802, 63)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (441, 3051, CAST(N'2022-05-05' AS Date), 1, 74246, 67)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (442, 3577, CAST(N'2022-05-05' AS Date), 2, 61450, 400)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (443, 3619, CAST(N'2022-05-05' AS Date), 2, 18705, 56)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (444, 4386, CAST(N'2022-05-05' AS Date), 1, 61355, 64)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (445, 5047, CAST(N'2022-05-05' AS Date), 3, 16082, 65)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (446, 5060, CAST(N'2022-05-05' AS Date), 3, 53998, 58)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (447, 5338, CAST(N'2022-05-05' AS Date), 3, 43102, 55)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (448, 5395, CAST(N'2022-05-05' AS Date), 1, 32101, 404)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (449, 5997, CAST(N'2022-05-05' AS Date), 1, 69455, 57)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (450, 6394, CAST(N'2022-05-05' AS Date), 1, 79760, 398)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (451, 6521, CAST(N'2022-05-05' AS Date), 3, 35943, 405)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (452, 6766, CAST(N'2022-05-05' AS Date), 2, 79785, 403)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (453, 6840, CAST(N'2022-05-05' AS Date), 3, 30783, 397)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (454, 7155, CAST(N'2022-05-05' AS Date), 3, 27709, 53)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (455, 7220, CAST(N'2022-05-05' AS Date), 1, 94757, 59)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (456, 7441, CAST(N'2022-05-05' AS Date), 1, 62815, 62)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (457, 7488, CAST(N'2022-05-05' AS Date), 3, 41566, 61)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (458, 7548, CAST(N'2022-05-05' AS Date), 3, 56910, 66)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (459, 7655, CAST(N'2022-05-05' AS Date), 1, 45004, 410)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (460, 7720, CAST(N'2022-05-05' AS Date), 2, 54686, 407)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (461, 8102, CAST(N'2022-05-05' AS Date), 2, 80271, 411)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (462, 8316, CAST(N'2022-05-05' AS Date), 3, 83274, 52)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (463, 8880, CAST(N'2022-05-05' AS Date), 1, 86071, 60)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (464, 8926, CAST(N'2022-05-05' AS Date), 2, 78944, 408)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (465, 9894, CAST(N'2022-05-05' AS Date), 1, 16055, 399)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (466, 1086, CAST(N'2022-05-06' AS Date), 3, 92604, 414)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (467, 1454, CAST(N'2022-05-06' AS Date), 1, 54652, 412)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (468, 2170, CAST(N'2022-05-06' AS Date), 1, 15309, 68)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (469, 2197, CAST(N'2022-05-06' AS Date), 1, 56917, 425)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (470, 2320, CAST(N'2022-05-06' AS Date), 2, 83374, 423)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (471, 2595, CAST(N'2022-05-06' AS Date), 2, 43237, 413)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (472, 2841, CAST(N'2022-05-06' AS Date), 2, 94169, 76)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (473, 3139, CAST(N'2022-05-06' AS Date), 2, 65317, 78)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (474, 3557, CAST(N'2022-05-06' AS Date), 3, 55932, 416)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (475, 4064, CAST(N'2022-05-06' AS Date), 2, 14367, 419)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (476, 4238, CAST(N'2022-05-06' AS Date), 3, 17188, 415)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (477, 4289, CAST(N'2022-05-06' AS Date), 2, 14711, 73)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (478, 5723, CAST(N'2022-05-06' AS Date), 1, 94602, 422)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (479, 6033, CAST(N'2022-05-06' AS Date), 1, 61152, 70)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (480, 6724, CAST(N'2022-05-06' AS Date), 2, 11940, 421)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (481, 6810, CAST(N'2022-05-06' AS Date), 3, 26484, 71)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (482, 6817, CAST(N'2022-05-06' AS Date), 1, 98148, 424)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (483, 6823, CAST(N'2022-05-06' AS Date), 1, 20945, 69)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (484, 8077, CAST(N'2022-05-06' AS Date), 3, 29537, 72)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (485, 8706, CAST(N'2022-05-06' AS Date), 1, 53147, 417)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (486, 8829, CAST(N'2022-05-06' AS Date), 3, 74250, 75)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (487, 9218, CAST(N'2022-05-06' AS Date), 2, 59508, 420)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (488, 9396, CAST(N'2022-05-06' AS Date), 1, 15776, 418)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (489, 9483, CAST(N'2022-05-06' AS Date), 2, 40244, 77)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (490, 9634, CAST(N'2022-05-06' AS Date), 3, 99588, 74)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (491, 302, CAST(N'2022-05-07' AS Date), 2, 86478, 429)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (492, 1233, CAST(N'2022-05-07' AS Date), 3, 29955, 432)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (493, 1981, CAST(N'2022-05-07' AS Date), 3, 35200, 87)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (494, 2287, CAST(N'2022-05-07' AS Date), 1, 38014, 83)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (495, 2590, CAST(N'2022-05-07' AS Date), 1, 26110, 92)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (496, 3363, CAST(N'2022-05-07' AS Date), 1, 75989, 430)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (497, 3395, CAST(N'2022-05-07' AS Date), 1, 78451, 428)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (498, 3411, CAST(N'2022-05-07' AS Date), 1, 89102, 91)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (499, 3542, CAST(N'2022-05-07' AS Date), 1, 93744, 431)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (500, 3648, CAST(N'2022-05-07' AS Date), 3, 29831, 434)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (501, 3756, CAST(N'2022-05-07' AS Date), 3, 30353, 433)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (502, 3891, CAST(N'2022-05-07' AS Date), 3, 49866, 84)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (503, 4060, CAST(N'2022-05-07' AS Date), 2, 21667, 89)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (504, 5144, CAST(N'2022-05-07' AS Date), 2, 48502, 86)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (505, 5919, CAST(N'2022-05-07' AS Date), 2, 93945, 90)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (506, 6350, CAST(N'2022-05-07' AS Date), 1, 15570, 82)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (507, 6352, CAST(N'2022-05-07' AS Date), 1, 29734, 426)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (508, 7451, CAST(N'2022-05-07' AS Date), 2, 74490, 80)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (509, 8496, CAST(N'2022-05-07' AS Date), 3, 69726, 93)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (510, 8949, CAST(N'2022-05-07' AS Date), 3, 28262, 427)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (511, 9327, CAST(N'2022-05-07' AS Date), 2, 33572, 81)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (512, 9671, CAST(N'2022-05-07' AS Date), 3, 97149, 88)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (513, 9859, CAST(N'2022-05-07' AS Date), 3, 76054, 85)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (514, 9869, CAST(N'2022-05-07' AS Date), 1, 90947, 79)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (515, 1072, CAST(N'2022-05-08' AS Date), 1, 34851, 97)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (516, 1798, CAST(N'2022-05-08' AS Date), 3, 40706, 101)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (517, 1927, CAST(N'2022-05-08' AS Date), 3, 11447, 442)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (518, 2621, CAST(N'2022-05-08' AS Date), 2, 13911, 95)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (519, 2626, CAST(N'2022-05-08' AS Date), 1, 44596, 104)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (520, 2708, CAST(N'2022-05-08' AS Date), 3, 81064, 94)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (521, 2978, CAST(N'2022-05-08' AS Date), 2, 23477, 99)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (522, 3731, CAST(N'2022-05-08' AS Date), 1, 32462, 436)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (523, 4197, CAST(N'2022-05-08' AS Date), 3, 71818, 103)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (524, 4508, CAST(N'2022-05-08' AS Date), 3, 23524, 441)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (525, 5380, CAST(N'2022-05-08' AS Date), 3, 69956, 437)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (526, 6003, CAST(N'2022-05-08' AS Date), 1, 88183, 96)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (527, 7455, CAST(N'2022-05-08' AS Date), 2, 68491, 444)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (528, 7714, CAST(N'2022-05-08' AS Date), 2, 84236, 440)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (529, 7813, CAST(N'2022-05-08' AS Date), 2, 80457, 438)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (530, 7964, CAST(N'2022-05-08' AS Date), 2, 21875, 443)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (531, 8091, CAST(N'2022-05-08' AS Date), 1, 92540, 446)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (532, 8622, CAST(N'2022-05-08' AS Date), 1, 84629, 445)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (533, 8855, CAST(N'2022-05-08' AS Date), 3, 16661, 98)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (534, 8973, CAST(N'2022-05-08' AS Date), 2, 96642, 102)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (535, 9095, CAST(N'2022-05-08' AS Date), 2, 28535, 100)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (536, 9532, CAST(N'2022-05-08' AS Date), 2, 11865, 435)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (537, 9777, CAST(N'2022-05-08' AS Date), 1, 60187, 439)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (538, 1455, CAST(N'2022-05-09' AS Date), 3, 12810, 109)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (539, 1664, CAST(N'2022-05-09' AS Date), 2, 57052, 118)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (540, 1923, CAST(N'2022-05-09' AS Date), 2, 53359, 116)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (541, 2347, CAST(N'2022-05-09' AS Date), 1, 57837, 453)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (542, 2360, CAST(N'2022-05-09' AS Date), 2, 87714, 105)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (543, 2527, CAST(N'2022-05-09' AS Date), 1, 99904, 448)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (544, 3272, CAST(N'2022-05-09' AS Date), 1, 91471, 459)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (545, 3454, CAST(N'2022-05-09' AS Date), 1, 75260, 112)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (546, 3468, CAST(N'2022-05-09' AS Date), 1, 70895, 113)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (547, 3885, CAST(N'2022-05-09' AS Date), 3, 27343, 458)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (548, 3936, CAST(N'2022-05-09' AS Date), 2, 68609, 106)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (549, 4299, CAST(N'2022-05-09' AS Date), 3, 45586, 460)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (550, 4672, CAST(N'2022-05-09' AS Date), 1, 87221, 107)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (551, 5052, CAST(N'2022-05-09' AS Date), 3, 45699, 452)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (552, 5722, CAST(N'2022-05-09' AS Date), 1, 31618, 454)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (553, 5732, CAST(N'2022-05-09' AS Date), 2, 91737, 117)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (554, 6290, CAST(N'2022-05-09' AS Date), 3, 35497, 110)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (555, 6605, CAST(N'2022-05-09' AS Date), 1, 19536, 115)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (556, 6672, CAST(N'2022-05-09' AS Date), 2, 87483, 114)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (557, 7070, CAST(N'2022-05-09' AS Date), 1, 34623, 447)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (558, 7415, CAST(N'2022-05-09' AS Date), 1, 84777, 457)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (559, 7921, CAST(N'2022-05-09' AS Date), 2, 24631, 456)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (560, 7937, CAST(N'2022-05-09' AS Date), 2, 38386, 449)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (561, 8393, CAST(N'2022-05-09' AS Date), 3, 40408, 451)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (562, 8486, CAST(N'2022-05-09' AS Date), 2, 78879, 111)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (563, 8830, CAST(N'2022-05-09' AS Date), 2, 57118, 108)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (564, 9493, CAST(N'2022-05-09' AS Date), 3, 59013, 450)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (565, 9978, CAST(N'2022-05-09' AS Date), 3, 20935, 455)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (566, 1006, CAST(N'2022-05-10' AS Date), 2, 12723, 131)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (567, 1450, CAST(N'2022-05-10' AS Date), 3, 13185, 462)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (568, 1796, CAST(N'2022-05-10' AS Date), 3, 95927, 468)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (569, 1989, CAST(N'2022-05-10' AS Date), 3, 64566, 461)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (570, 2033, CAST(N'2022-05-10' AS Date), 3, 76001, 120)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (571, 2339, CAST(N'2022-05-10' AS Date), 3, 82386, 121)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (572, 3005, CAST(N'2022-05-10' AS Date), 3, 86146, 128)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (573, 3174, CAST(N'2022-05-10' AS Date), 3, 65187, 126)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (574, 3350, CAST(N'2022-05-10' AS Date), 1, 80794, 129)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (575, 3441, CAST(N'2022-05-10' AS Date), 1, 30827, 465)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (576, 3660, CAST(N'2022-05-10' AS Date), 3, 83597, 127)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (577, 4553, CAST(N'2022-05-10' AS Date), 1, 95949, 122)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (578, 4782, CAST(N'2022-05-10' AS Date), 3, 93967, 466)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (579, 4922, CAST(N'2022-05-10' AS Date), 1, 78174, 463)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (580, 6343, CAST(N'2022-05-10' AS Date), 2, 62425, 119)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (581, 6709, CAST(N'2022-05-10' AS Date), 3, 63555, 125)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (582, 7560, CAST(N'2022-05-10' AS Date), 2, 77003, 467)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (583, 7590, CAST(N'2022-05-10' AS Date), 3, 84318, 464)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (584, 7650, CAST(N'2022-05-10' AS Date), 3, 25351, 123)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (585, 8662, CAST(N'2022-05-10' AS Date), 2, 27997, 130)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (586, 8741, CAST(N'2022-05-10' AS Date), 2, 94618, 124)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (587, 9972, CAST(N'2022-05-10' AS Date), 1, 42874, 469)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (588, 973, CAST(N'2022-05-11' AS Date), 2, 11484, 472)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (589, 1191, CAST(N'2022-05-11' AS Date), 2, 25905, 140)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (590, 1449, CAST(N'2022-05-11' AS Date), 3, 63884, 475)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (591, 1491, CAST(N'2022-05-11' AS Date), 3, 83258, 470)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (592, 2031, CAST(N'2022-05-11' AS Date), 1, 43404, 476)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (593, 2758, CAST(N'2022-05-11' AS Date), 3, 40602, 141)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (594, 3039, CAST(N'2022-05-11' AS Date), 1, 27283, 473)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (595, 4016, CAST(N'2022-05-11' AS Date), 1, 91517, 142)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (596, 4354, CAST(N'2022-05-11' AS Date), 2, 12486, 139)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (597, 4521, CAST(N'2022-05-11' AS Date), 2, 51324, 133)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (598, 5235, CAST(N'2022-05-11' AS Date), 1, 17172, 474)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (599, 5466, CAST(N'2022-05-11' AS Date), 1, 44542, 143)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (600, 5589, CAST(N'2022-05-11' AS Date), 3, 22611, 137)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (601, 7079, CAST(N'2022-05-11' AS Date), 2, 66788, 138)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (602, 7105, CAST(N'2022-05-11' AS Date), 3, 53795, 136)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (603, 7259, CAST(N'2022-05-11' AS Date), 3, 42280, 132)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (604, 7526, CAST(N'2022-05-11' AS Date), 2, 56572, 134)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (605, 7633, CAST(N'2022-05-11' AS Date), 3, 32082, 471)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (606, 8335, CAST(N'2022-05-11' AS Date), 3, 94477, 135)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (607, 753, CAST(N'2022-05-12' AS Date), 1, 35779, 484)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (608, 1023, CAST(N'2022-05-12' AS Date), 2, 78798, 480)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (609, 1347, CAST(N'2022-05-12' AS Date), 3, 40289, 483)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (610, 1384, CAST(N'2022-05-12' AS Date), 2, 39354, 150)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (611, 3060, CAST(N'2022-05-12' AS Date), 3, 56704, 146)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (612, 3221, CAST(N'2022-05-12' AS Date), 1, 37192, 485)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (613, 3289, CAST(N'2022-05-12' AS Date), 1, 62144, 145)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (614, 3351, CAST(N'2022-05-12' AS Date), 2, 62796, 155)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (615, 3727, CAST(N'2022-05-12' AS Date), 3, 28781, 481)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (616, 4034, CAST(N'2022-05-12' AS Date), 2, 87233, 144)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (617, 4209, CAST(N'2022-05-12' AS Date), 3, 92402, 488)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (618, 4412, CAST(N'2022-05-12' AS Date), 2, 40751, 148)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (619, 4577, CAST(N'2022-05-12' AS Date), 1, 51478, 156)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (620, 4631, CAST(N'2022-05-12' AS Date), 3, 21220, 151)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (621, 4800, CAST(N'2022-05-12' AS Date), 3, 72915, 482)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (622, 5026, CAST(N'2022-05-12' AS Date), 1, 45043, 479)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (623, 5540, CAST(N'2022-05-12' AS Date), 1, 67391, 477)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (624, 5800, CAST(N'2022-05-12' AS Date), 2, 58436, 153)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (625, 6076, CAST(N'2022-05-12' AS Date), 1, 52807, 149)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (626, 6285, CAST(N'2022-05-12' AS Date), 1, 84627, 147)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (627, 6685, CAST(N'2022-05-12' AS Date), 3, 48156, 154)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (628, 7330, CAST(N'2022-05-12' AS Date), 3, 38989, 486)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (629, 7926, CAST(N'2022-05-12' AS Date), 2, 18094, 478)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (630, 8009, CAST(N'2022-05-12' AS Date), 3, 50393, 152)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (631, 9879, CAST(N'2022-05-12' AS Date), 1, 90602, 487)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (632, 9897, CAST(N'2022-05-12' AS Date), 3, 59299, 489)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (633, 275, CAST(N'2022-05-13' AS Date), 3, 74203, 492)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (634, 1110, CAST(N'2022-05-13' AS Date), 3, 18289, 499)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (635, 2208, CAST(N'2022-05-13' AS Date), 1, 71904, 161)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (636, 3273, CAST(N'2022-05-13' AS Date), 1, 23735, 496)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (637, 3288, CAST(N'2022-05-13' AS Date), 1, 72338, 160)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (638, 5497, CAST(N'2022-05-13' AS Date), 1, 76452, 500)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (639, 5631, CAST(N'2022-05-13' AS Date), 2, 43006, 157)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (640, 5760, CAST(N'2022-05-13' AS Date), 2, 15848, 494)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (641, 5816, CAST(N'2022-05-13' AS Date), 2, 16562, 493)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (642, 6056, CAST(N'2022-05-13' AS Date), 2, 81724, 491)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (643, 7568, CAST(N'2022-05-13' AS Date), 2, 94536, 498)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (644, 7591, CAST(N'2022-05-13' AS Date), 1, 59753, 497)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (645, 7611, CAST(N'2022-05-13' AS Date), 1, 26844, 159)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (646, 7746, CAST(N'2022-05-13' AS Date), 3, 91472, 495)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (647, 8111, CAST(N'2022-05-13' AS Date), 1, 60183, 490)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (648, 9796, CAST(N'2022-05-13' AS Date), 1, 17195, 158)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (649, 1941, CAST(N'2022-05-14' AS Date), 2, 33413, 172)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (650, 3113, CAST(N'2022-05-14' AS Date), 1, 97711, 165)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (651, 3462, CAST(N'2022-05-14' AS Date), 3, 95607, 171)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (652, 3817, CAST(N'2022-05-14' AS Date), 2, 66013, 508)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (653, 4012, CAST(N'2022-05-14' AS Date), 3, 12239, 505)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (654, 4205, CAST(N'2022-05-14' AS Date), 3, 43011, 162)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (655, 4457, CAST(N'2022-05-14' AS Date), 1, 18793, 509)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (656, 4627, CAST(N'2022-05-14' AS Date), 2, 10035, 166)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (657, 4680, CAST(N'2022-05-14' AS Date), 3, 73523, 167)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (658, 5161, CAST(N'2022-05-14' AS Date), 2, 97669, 169)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (659, 5843, CAST(N'2022-05-14' AS Date), 2, 41433, 503)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (660, 5881, CAST(N'2022-05-14' AS Date), 3, 88855, 506)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (661, 6866, CAST(N'2022-05-14' AS Date), 1, 66151, 164)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (662, 7119, CAST(N'2022-05-14' AS Date), 3, 84239, 501)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (663, 7245, CAST(N'2022-05-14' AS Date), 1, 40320, 170)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (664, 7278, CAST(N'2022-05-14' AS Date), 2, 32534, 168)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (665, 8125, CAST(N'2022-05-14' AS Date), 2, 98004, 504)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (666, 8954, CAST(N'2022-05-14' AS Date), 2, 14894, 502)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (667, 9225, CAST(N'2022-05-14' AS Date), 1, 79224, 163)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (668, 9932, CAST(N'2022-05-14' AS Date), 1, 96563, 507)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (669, 1024, CAST(N'2022-05-15' AS Date), 3, 29747, 173)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (670, 1627, CAST(N'2022-05-15' AS Date), 1, 78588, 515)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (671, 1632, CAST(N'2022-05-15' AS Date), 2, 40917, 177)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (672, 1693, CAST(N'2022-05-15' AS Date), 1, 21759, 517)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (673, 1694, CAST(N'2022-05-15' AS Date), 3, 42512, 181)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (674, 2099, CAST(N'2022-05-15' AS Date), 2, 52412, 516)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (675, 2154, CAST(N'2022-05-15' AS Date), 1, 44227, 522)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (676, 2831, CAST(N'2022-05-15' AS Date), 2, 15304, 523)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (677, 3247, CAST(N'2022-05-15' AS Date), 2, 98342, 175)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (678, 3430, CAST(N'2022-05-15' AS Date), 2, 63261, 513)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (679, 5283, CAST(N'2022-05-15' AS Date), 1, 16598, 518)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (680, 5330, CAST(N'2022-05-15' AS Date), 1, 76151, 180)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (681, 5373, CAST(N'2022-05-15' AS Date), 3, 85223, 174)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (682, 6032, CAST(N'2022-05-15' AS Date), 2, 83384, 510)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (683, 6096, CAST(N'2022-05-15' AS Date), 2, 32197, 524)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (684, 6161, CAST(N'2022-05-15' AS Date), 3, 19679, 178)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (685, 6643, CAST(N'2022-05-15' AS Date), 3, 14402, 520)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (686, 7106, CAST(N'2022-05-15' AS Date), 2, 49444, 519)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (687, 7201, CAST(N'2022-05-15' AS Date), 1, 61048, 511)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (688, 7242, CAST(N'2022-05-15' AS Date), 2, 66012, 521)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (689, 7570, CAST(N'2022-05-15' AS Date), 3, 57950, 176)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (690, 9132, CAST(N'2022-05-15' AS Date), 2, 64232, 514)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (691, 9178, CAST(N'2022-05-15' AS Date), 1, 95318, 179)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (692, 9288, CAST(N'2022-05-15' AS Date), 3, 81994, 512)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (693, 1644, CAST(N'2022-05-16' AS Date), 2, 54638, 528)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (694, 3349, CAST(N'2022-05-16' AS Date), 1, 46215, 191)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (695, 3729, CAST(N'2022-05-16' AS Date), 2, 10247, 192)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (696, 3761, CAST(N'2022-05-16' AS Date), 2, 81951, 185)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (697, 3977, CAST(N'2022-05-16' AS Date), 1, 44250, 184)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (698, 4149, CAST(N'2022-05-16' AS Date), 2, 89004, 530)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (699, 4924, CAST(N'2022-05-16' AS Date), 1, 68045, 187)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (700, 5950, CAST(N'2022-05-16' AS Date), 2, 17424, 526)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (701, 6274, CAST(N'2022-05-16' AS Date), 3, 39152, 188)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (702, 6498, CAST(N'2022-05-16' AS Date), 3, 53755, 529)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (703, 7052, CAST(N'2022-05-16' AS Date), 2, 47757, 193)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (704, 7429, CAST(N'2022-05-16' AS Date), 2, 30447, 531)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (705, 7779, CAST(N'2022-05-16' AS Date), 3, 96731, 186)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (706, 8661, CAST(N'2022-05-16' AS Date), 1, 32290, 183)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (707, 8866, CAST(N'2022-05-16' AS Date), 3, 60088, 182)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (708, 9391, CAST(N'2022-05-16' AS Date), 3, 21390, 189)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (709, 9430, CAST(N'2022-05-16' AS Date), 1, 56518, 190)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (710, 9644, CAST(N'2022-05-16' AS Date), 1, 51539, 525)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (711, 9815, CAST(N'2022-05-16' AS Date), 1, 21564, 527)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (712, 1525, CAST(N'2022-05-17' AS Date), 2, 88853, 540)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (713, 1833, CAST(N'2022-05-17' AS Date), 1, 47132, 534)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (714, 1960, CAST(N'2022-05-17' AS Date), 2, 42480, 535)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (715, 3743, CAST(N'2022-05-17' AS Date), 2, 28256, 196)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (716, 4524, CAST(N'2022-05-17' AS Date), 2, 70652, 202)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (717, 4947, CAST(N'2022-05-17' AS Date), 1, 14096, 541)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (718, 5103, CAST(N'2022-05-17' AS Date), 3, 41153, 199)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (719, 5152, CAST(N'2022-05-17' AS Date), 1, 14247, 201)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (720, 5490, CAST(N'2022-05-17' AS Date), 1, 44812, 532)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (721, 5650, CAST(N'2022-05-17' AS Date), 1, 72210, 194)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (722, 6930, CAST(N'2022-05-17' AS Date), 1, 16607, 536)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (723, 6999, CAST(N'2022-05-17' AS Date), 3, 33292, 200)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (724, 7104, CAST(N'2022-05-17' AS Date), 2, 64775, 533)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (725, 7509, CAST(N'2022-05-17' AS Date), 1, 56251, 198)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (726, 7628, CAST(N'2022-05-17' AS Date), 3, 75557, 543)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (727, 7709, CAST(N'2022-05-17' AS Date), 2, 41914, 539)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (728, 7975, CAST(N'2022-05-17' AS Date), 3, 88480, 544)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (729, 8063, CAST(N'2022-05-17' AS Date), 2, 39480, 538)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (730, 8603, CAST(N'2022-05-17' AS Date), 1, 13215, 542)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (731, 8719, CAST(N'2022-05-17' AS Date), 1, 77180, 197)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (732, 9632, CAST(N'2022-05-17' AS Date), 3, 93007, 537)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (733, 9753, CAST(N'2022-05-17' AS Date), 3, 75504, 195)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (734, 1036, CAST(N'2022-05-18' AS Date), 3, 79753, 210)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (735, 1374, CAST(N'2022-05-18' AS Date), 2, 46678, 549)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (736, 2438, CAST(N'2022-05-18' AS Date), 2, 10238, 548)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (737, 4121, CAST(N'2022-05-18' AS Date), 3, 55418, 206)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (738, 5175, CAST(N'2022-05-18' AS Date), 1, 99444, 546)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (739, 5426, CAST(N'2022-05-18' AS Date), 1, 26918, 551)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (740, 5696, CAST(N'2022-05-18' AS Date), 3, 20821, 547)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (741, 5986, CAST(N'2022-05-18' AS Date), 1, 52843, 205)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (742, 6123, CAST(N'2022-05-18' AS Date), 1, 69065, 211)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (743, 6220, CAST(N'2022-05-18' AS Date), 2, 59399, 552)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (744, 6654, CAST(N'2022-05-18' AS Date), 3, 59095, 553)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (745, 7420, CAST(N'2022-05-18' AS Date), 3, 53475, 203)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (746, 8037, CAST(N'2022-05-18' AS Date), 1, 31836, 209)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (747, 8189, CAST(N'2022-05-18' AS Date), 2, 45814, 207)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (748, 8299, CAST(N'2022-05-18' AS Date), 2, 53635, 545)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (749, 8607, CAST(N'2022-05-18' AS Date), 3, 66506, 204)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (750, 8970, CAST(N'2022-05-18' AS Date), 3, 21587, 208)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (751, 9469, CAST(N'2022-05-18' AS Date), 1, 58419, 550)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (752, 605, CAST(N'2022-05-19' AS Date), 1, 67453, 558)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (753, 1215, CAST(N'2022-05-19' AS Date), 1, 67080, 556)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (754, 1849, CAST(N'2022-05-19' AS Date), 3, 81964, 560)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (755, 1852, CAST(N'2022-05-19' AS Date), 3, 71649, 568)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (756, 2236, CAST(N'2022-05-19' AS Date), 1, 26799, 559)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (757, 2904, CAST(N'2022-05-19' AS Date), 2, 65308, 215)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (758, 2932, CAST(N'2022-05-19' AS Date), 3, 33345, 563)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (759, 3258, CAST(N'2022-05-19' AS Date), 1, 71084, 561)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (760, 3691, CAST(N'2022-05-19' AS Date), 3, 83676, 221)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (761, 4180, CAST(N'2022-05-19' AS Date), 1, 70804, 220)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (762, 4993, CAST(N'2022-05-19' AS Date), 3, 75681, 555)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (763, 5344, CAST(N'2022-05-19' AS Date), 2, 42633, 214)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (764, 5526, CAST(N'2022-05-19' AS Date), 3, 36547, 217)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (765, 5844, CAST(N'2022-05-19' AS Date), 3, 45376, 566)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (766, 6468, CAST(N'2022-05-19' AS Date), 3, 91103, 567)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (767, 6896, CAST(N'2022-05-19' AS Date), 3, 15864, 564)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (768, 7480, CAST(N'2022-05-19' AS Date), 1, 71223, 565)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (769, 7495, CAST(N'2022-05-19' AS Date), 3, 26277, 219)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (770, 8069, CAST(N'2022-05-19' AS Date), 1, 65824, 569)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (771, 8212, CAST(N'2022-05-19' AS Date), 1, 40083, 562)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (772, 8444, CAST(N'2022-05-19' AS Date), 2, 56571, 557)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (773, 8458, CAST(N'2022-05-19' AS Date), 1, 18805, 213)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (774, 8464, CAST(N'2022-05-19' AS Date), 2, 22406, 554)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (775, 9516, CAST(N'2022-05-19' AS Date), 1, 21772, 218)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (776, 9673, CAST(N'2022-05-19' AS Date), 1, 98765, 216)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (777, 9694, CAST(N'2022-05-19' AS Date), 2, 72074, 212)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (778, 341, CAST(N'2022-05-20' AS Date), 3, 36783, 579)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (779, 1232, CAST(N'2022-05-20' AS Date), 2, 61622, 573)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (780, 2426, CAST(N'2022-05-20' AS Date), 3, 27812, 225)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (781, 2452, CAST(N'2022-05-20' AS Date), 3, 60475, 222)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (782, 2636, CAST(N'2022-05-20' AS Date), 3, 33770, 224)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (783, 4166, CAST(N'2022-05-20' AS Date), 3, 85636, 576)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (784, 4618, CAST(N'2022-05-20' AS Date), 2, 41354, 571)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (785, 4658, CAST(N'2022-05-20' AS Date), 3, 89995, 572)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (786, 4917, CAST(N'2022-05-20' AS Date), 3, 60997, 226)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (787, 5563, CAST(N'2022-05-20' AS Date), 2, 70166, 575)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (788, 6245, CAST(N'2022-05-20' AS Date), 3, 79478, 570)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (789, 7349, CAST(N'2022-05-20' AS Date), 2, 55458, 580)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (790, 8010, CAST(N'2022-05-20' AS Date), 1, 75432, 228)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (791, 8497, CAST(N'2022-05-20' AS Date), 2, 53464, 229)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (792, 8694, CAST(N'2022-05-20' AS Date), 2, 42340, 578)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (793, 8870, CAST(N'2022-05-20' AS Date), 3, 32096, 577)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (794, 9037, CAST(N'2022-05-20' AS Date), 3, 83390, 227)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (795, 9794, CAST(N'2022-05-20' AS Date), 2, 50983, 223)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (796, 9969, CAST(N'2022-05-20' AS Date), 3, 61065, 574)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (797, 1773, CAST(N'2022-05-21' AS Date), 1, 59619, 587)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (798, 1801, CAST(N'2022-05-21' AS Date), 1, 24410, 231)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (799, 1948, CAST(N'2022-05-21' AS Date), 1, 82345, 585)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (800, 2241, CAST(N'2022-05-21' AS Date), 1, 43117, 583)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (801, 2482, CAST(N'2022-05-21' AS Date), 2, 37187, 238)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (802, 2749, CAST(N'2022-05-21' AS Date), 1, 42635, 237)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (803, 2921, CAST(N'2022-05-21' AS Date), 2, 90754, 243)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (804, 3902, CAST(N'2022-05-21' AS Date), 3, 89941, 590)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (805, 4291, CAST(N'2022-05-21' AS Date), 1, 60730, 236)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (806, 4500, CAST(N'2022-05-21' AS Date), 2, 10132, 584)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (807, 4756, CAST(N'2022-05-21' AS Date), 3, 91418, 589)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (808, 5063, CAST(N'2022-05-21' AS Date), 3, 25046, 239)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (809, 5239, CAST(N'2022-05-21' AS Date), 2, 68986, 230)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (810, 5871, CAST(N'2022-05-21' AS Date), 1, 25882, 240)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (811, 6334, CAST(N'2022-05-21' AS Date), 3, 16795, 234)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (812, 7223, CAST(N'2022-05-21' AS Date), 1, 67872, 232)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (813, 7540, CAST(N'2022-05-21' AS Date), 3, 29642, 242)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (814, 7597, CAST(N'2022-05-21' AS Date), 2, 96506, 244)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (815, 7694, CAST(N'2022-05-21' AS Date), 3, 93645, 582)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (816, 7900, CAST(N'2022-05-21' AS Date), 2, 32617, 241)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (817, 7965, CAST(N'2022-05-21' AS Date), 2, 65005, 586)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (818, 8883, CAST(N'2022-05-21' AS Date), 3, 69856, 588)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (819, 9163, CAST(N'2022-05-21' AS Date), 2, 76479, 581)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (820, 9384, CAST(N'2022-05-21' AS Date), 2, 51822, 233)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (821, 9504, CAST(N'2022-05-21' AS Date), 1, 10313, 235)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (822, 1049, CAST(N'2022-05-22' AS Date), 2, 10859, 594)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (823, 1916, CAST(N'2022-05-22' AS Date), 3, 17987, 256)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (824, 1926, CAST(N'2022-05-22' AS Date), 3, 60113, 249)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (825, 1942, CAST(N'2022-05-22' AS Date), 3, 72577, 251)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (826, 1975, CAST(N'2022-05-22' AS Date), 1, 10268, 248)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (827, 2862, CAST(N'2022-05-22' AS Date), 3, 50630, 597)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (828, 3118, CAST(N'2022-05-22' AS Date), 3, 76479, 250)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (829, 3176, CAST(N'2022-05-22' AS Date), 2, 58048, 245)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (830, 3362, CAST(N'2022-05-22' AS Date), 2, 33699, 599)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (831, 4331, CAST(N'2022-05-22' AS Date), 1, 61473, 252)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (832, 4611, CAST(N'2022-05-22' AS Date), 1, 85944, 255)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (833, 5035, CAST(N'2022-05-22' AS Date), 2, 84379, 598)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (834, 5738, CAST(N'2022-05-22' AS Date), 1, 57173, 593)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (835, 5787, CAST(N'2022-05-22' AS Date), 3, 38332, 253)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (836, 6062, CAST(N'2022-05-22' AS Date), 1, 88978, 257)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (837, 6170, CAST(N'2022-05-22' AS Date), 1, 72101, 246)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (838, 6396, CAST(N'2022-05-22' AS Date), 2, 82583, 247)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (839, 6669, CAST(N'2022-05-22' AS Date), 3, 95680, 592)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (840, 7168, CAST(N'2022-05-22' AS Date), 3, 71696, 596)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (841, 9196, CAST(N'2022-05-22' AS Date), 1, 70128, 600)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (842, 9587, CAST(N'2022-05-22' AS Date), 1, 21665, 591)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (843, 9741, CAST(N'2022-05-22' AS Date), 3, 81220, 254)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (844, 9984, CAST(N'2022-05-22' AS Date), 3, 99467, 595)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (845, 475, CAST(N'2022-05-23' AS Date), 2, 82400, 605)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (846, 1259, CAST(N'2022-05-23' AS Date), 1, 77408, 261)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (847, 1534, CAST(N'2022-05-23' AS Date), 1, 63650, 263)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (848, 3042, CAST(N'2022-05-23' AS Date), 1, 65470, 264)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (849, 3277, CAST(N'2022-05-23' AS Date), 3, 11102, 615)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (850, 3459, CAST(N'2022-05-23' AS Date), 1, 80104, 608)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (851, 3612, CAST(N'2022-05-23' AS Date), 1, 58990, 606)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (852, 3725, CAST(N'2022-05-23' AS Date), 2, 43162, 611)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (853, 3939, CAST(N'2022-05-23' AS Date), 1, 41252, 258)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (854, 4705, CAST(N'2022-05-23' AS Date), 3, 87744, 265)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (855, 4876, CAST(N'2022-05-23' AS Date), 3, 30769, 607)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (856, 5279, CAST(N'2022-05-23' AS Date), 3, 18222, 610)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (857, 5513, CAST(N'2022-05-23' AS Date), 1, 82540, 614)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (858, 5611, CAST(N'2022-05-23' AS Date), 2, 72017, 604)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (859, 5798, CAST(N'2022-05-23' AS Date), 1, 38769, 259)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (860, 5953, CAST(N'2022-05-23' AS Date), 3, 14746, 609)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (861, 6417, CAST(N'2022-05-23' AS Date), 3, 81626, 602)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (862, 6513, CAST(N'2022-05-23' AS Date), 3, 95302, 612)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (863, 6676, CAST(N'2022-05-23' AS Date), 2, 77111, 262)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (864, 7133, CAST(N'2022-05-23' AS Date), 3, 11612, 260)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (865, 8122, CAST(N'2022-05-23' AS Date), 2, 87971, 601)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (866, 9072, CAST(N'2022-05-23' AS Date), 2, 86610, 613)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (867, 9269, CAST(N'2022-05-23' AS Date), 3, 20553, 266)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (868, 9952, CAST(N'2022-05-23' AS Date), 1, 17942, 603)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (869, 286, CAST(N'2022-05-24' AS Date), 1, 12805, 617)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (870, 1305, CAST(N'2022-05-24' AS Date), 3, 89351, 619)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (871, 1385, CAST(N'2022-05-24' AS Date), 1, 41320, 620)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (872, 1839, CAST(N'2022-05-24' AS Date), 1, 62739, 625)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (873, 2100, CAST(N'2022-05-24' AS Date), 3, 94421, 631)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (874, 2199, CAST(N'2022-05-24' AS Date), 1, 35830, 629)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (875, 2229, CAST(N'2022-05-24' AS Date), 3, 47830, 272)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (876, 2243, CAST(N'2022-05-24' AS Date), 2, 71012, 278)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (877, 3000, CAST(N'2022-05-24' AS Date), 3, 58186, 626)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (878, 3510, CAST(N'2022-05-24' AS Date), 3, 79148, 628)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (879, 3738, CAST(N'2022-05-24' AS Date), 3, 37615, 624)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (880, 3860, CAST(N'2022-05-24' AS Date), 3, 70400, 273)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (881, 4092, CAST(N'2022-05-24' AS Date), 3, 43213, 277)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (882, 4395, CAST(N'2022-05-24' AS Date), 1, 72657, 268)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (883, 4865, CAST(N'2022-05-24' AS Date), 1, 32571, 279)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (884, 5110, CAST(N'2022-05-24' AS Date), 2, 27076, 623)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (885, 5346, CAST(N'2022-05-24' AS Date), 1, 56332, 616)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (886, 5661, CAST(N'2022-05-24' AS Date), 2, 79144, 627)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (887, 6125, CAST(N'2022-05-24' AS Date), 2, 13237, 267)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (888, 6313, CAST(N'2022-05-24' AS Date), 2, 94642, 621)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (889, 6428, CAST(N'2022-05-24' AS Date), 3, 92154, 622)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (890, 7115, CAST(N'2022-05-24' AS Date), 3, 78322, 275)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (891, 7572, CAST(N'2022-05-24' AS Date), 1, 62119, 618)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (892, 8106, CAST(N'2022-05-24' AS Date), 1, 21233, 271)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (893, 9116, CAST(N'2022-05-24' AS Date), 1, 61614, 630)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (894, 9177, CAST(N'2022-05-24' AS Date), 3, 86405, 276)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (895, 9604, CAST(N'2022-05-24' AS Date), 2, 62567, 274)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (896, 9743, CAST(N'2022-05-24' AS Date), 1, 38647, 269)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (897, 9936, CAST(N'2022-05-24' AS Date), 2, 27064, 270)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (898, 1050, CAST(N'2022-05-25' AS Date), 2, 80937, 639)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (899, 1756, CAST(N'2022-05-25' AS Date), 2, 20804, 287)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (900, 2038, CAST(N'2022-05-25' AS Date), 1, 82616, 288)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (901, 2153, CAST(N'2022-05-25' AS Date), 2, 86485, 637)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (902, 2544, CAST(N'2022-05-25' AS Date), 3, 69437, 642)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (903, 2576, CAST(N'2022-05-25' AS Date), 3, 54928, 638)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (904, 2719, CAST(N'2022-05-25' AS Date), 2, 96943, 290)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (905, 2925, CAST(N'2022-05-25' AS Date), 3, 36853, 289)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (906, 3264, CAST(N'2022-05-25' AS Date), 1, 25504, 633)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (907, 3326, CAST(N'2022-05-25' AS Date), 3, 56164, 636)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (908, 3685, CAST(N'2022-05-25' AS Date), 2, 45778, 640)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (909, 4119, CAST(N'2022-05-25' AS Date), 1, 75174, 280)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (910, 4860, CAST(N'2022-05-25' AS Date), 1, 88494, 641)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (911, 5033, CAST(N'2022-05-25' AS Date), 2, 52035, 634)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (912, 5074, CAST(N'2022-05-25' AS Date), 1, 69535, 284)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (913, 5453, CAST(N'2022-05-25' AS Date), 1, 83183, 292)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (914, 6127, CAST(N'2022-05-25' AS Date), 1, 82491, 286)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (915, 6184, CAST(N'2022-05-25' AS Date), 3, 42688, 285)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (916, 6705, CAST(N'2022-05-25' AS Date), 2, 34965, 644)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (917, 7254, CAST(N'2022-05-25' AS Date), 3, 83633, 282)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (918, 7946, CAST(N'2022-05-25' AS Date), 3, 15722, 643)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (919, 8080, CAST(N'2022-05-25' AS Date), 2, 89684, 283)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (920, 8187, CAST(N'2022-05-25' AS Date), 1, 20165, 291)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (921, 9052, CAST(N'2022-05-25' AS Date), 2, 58712, 293)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (922, 9057, CAST(N'2022-05-25' AS Date), 3, 63711, 635)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (923, 9260, CAST(N'2022-05-25' AS Date), 3, 95906, 281)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (924, 9388, CAST(N'2022-05-25' AS Date), 1, 67131, 632)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (925, 425, CAST(N'2022-05-26' AS Date), 1, 63753, 646)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (926, 902, CAST(N'2022-05-26' AS Date), 3, 78401, 649)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (927, 1652, CAST(N'2022-05-26' AS Date), 1, 80185, 295)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (928, 2343, CAST(N'2022-05-26' AS Date), 3, 83633, 654)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (929, 3228, CAST(N'2022-05-26' AS Date), 3, 18201, 650)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (930, 4144, CAST(N'2022-05-26' AS Date), 2, 68221, 294)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (931, 4662, CAST(N'2022-05-26' AS Date), 1, 77106, 298)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (932, 5567, CAST(N'2022-05-26' AS Date), 3, 55582, 299)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (933, 5776, CAST(N'2022-05-26' AS Date), 1, 28028, 651)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (934, 5857, CAST(N'2022-05-26' AS Date), 3, 80699, 656)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (935, 6529, CAST(N'2022-05-26' AS Date), 3, 28227, 648)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (936, 6797, CAST(N'2022-05-26' AS Date), 3, 20032, 297)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (937, 7124, CAST(N'2022-05-26' AS Date), 2, 84840, 652)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (938, 7194, CAST(N'2022-05-26' AS Date), 1, 28130, 653)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (939, 7387, CAST(N'2022-05-26' AS Date), 1, 40103, 655)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (940, 7484, CAST(N'2022-05-26' AS Date), 2, 67880, 647)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (941, 7954, CAST(N'2022-05-26' AS Date), 2, 43370, 296)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (942, 9203, CAST(N'2022-05-26' AS Date), 1, 15964, 657)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (943, 9766, CAST(N'2022-05-26' AS Date), 2, 46285, 645)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (944, 1149, CAST(N'2022-05-27' AS Date), 3, 47000, 661)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (945, 1726, CAST(N'2022-05-27' AS Date), 3, 19389, 663)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (946, 1830, CAST(N'2022-05-27' AS Date), 1, 35573, 302)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (947, 2300, CAST(N'2022-05-27' AS Date), 3, 72615, 305)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (948, 2721, CAST(N'2022-05-27' AS Date), 1, 38152, 301)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (949, 3024, CAST(N'2022-05-27' AS Date), 1, 72459, 306)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (950, 3260, CAST(N'2022-05-27' AS Date), 3, 14747, 658)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (951, 4239, CAST(N'2022-05-27' AS Date), 3, 98139, 662)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (952, 4765, CAST(N'2022-05-27' AS Date), 3, 31440, 666)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (953, 4921, CAST(N'2022-05-27' AS Date), 3, 31616, 664)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (954, 5142, CAST(N'2022-05-27' AS Date), 3, 99527, 660)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (955, 6533, CAST(N'2022-05-27' AS Date), 2, 67793, 311)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (956, 7180, CAST(N'2022-05-27' AS Date), 3, 20733, 665)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (957, 7444, CAST(N'2022-05-27' AS Date), 3, 70318, 309)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (958, 8015, CAST(N'2022-05-27' AS Date), 2, 58369, 308)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (959, 8457, CAST(N'2022-05-27' AS Date), 1, 40729, 303)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (960, 8650, CAST(N'2022-05-27' AS Date), 2, 87244, 310)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (961, 8823, CAST(N'2022-05-27' AS Date), 3, 24787, 304)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (962, 9088, CAST(N'2022-05-27' AS Date), 1, 69061, 300)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (963, 9317, CAST(N'2022-05-27' AS Date), 3, 19903, 659)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (964, 9447, CAST(N'2022-05-27' AS Date), 1, 59922, 307)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (965, 966, CAST(N'2022-05-28' AS Date), 2, 27975, 323)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (966, 1097, CAST(N'2022-05-28' AS Date), 2, 82019, 322)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (967, 1107, CAST(N'2022-05-28' AS Date), 2, 68936, 315)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (968, 1285, CAST(N'2022-05-28' AS Date), 2, 61627, 318)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (969, 1547, CAST(N'2022-05-28' AS Date), 2, 46818, 670)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (970, 1555, CAST(N'2022-05-28' AS Date), 2, 94375, 317)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (971, 1702, CAST(N'2022-05-28' AS Date), 3, 83446, 314)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (972, 1706, CAST(N'2022-05-28' AS Date), 3, 18841, 671)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (973, 1935, CAST(N'2022-05-28' AS Date), 3, 66497, 325)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (974, 1964, CAST(N'2022-05-28' AS Date), 1, 31462, 669)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (975, 2148, CAST(N'2022-05-28' AS Date), 2, 62253, 326)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (976, 2332, CAST(N'2022-05-28' AS Date), 3, 46082, 312)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (977, 2508, CAST(N'2022-05-28' AS Date), 2, 64407, 320)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (978, 3280, CAST(N'2022-05-28' AS Date), 1, 56565, 324)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (979, 4510, CAST(N'2022-05-28' AS Date), 3, 17781, 673)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (980, 4715, CAST(N'2022-05-28' AS Date), 2, 77227, 313)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (981, 5309, CAST(N'2022-05-28' AS Date), 2, 63823, 676)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (982, 5332, CAST(N'2022-05-28' AS Date), 1, 97559, 677)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (983, 5802, CAST(N'2022-05-28' AS Date), 3, 66939, 667)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (984, 6971, CAST(N'2022-05-28' AS Date), 1, 84469, 327)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (985, 7113, CAST(N'2022-05-28' AS Date), 1, 45375, 675)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (986, 7332, CAST(N'2022-05-28' AS Date), 3, 64619, 316)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (987, 7989, CAST(N'2022-05-28' AS Date), 2, 92311, 674)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (988, 8097, CAST(N'2022-05-28' AS Date), 3, 44343, 672)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (989, 8117, CAST(N'2022-05-28' AS Date), 2, 55364, 319)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (990, 8274, CAST(N'2022-05-28' AS Date), 3, 79993, 321)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (991, 9509, CAST(N'2022-05-28' AS Date), 2, 14296, 668)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (992, 761, CAST(N'2022-05-29' AS Date), 3, 22468, 679)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (993, 922, CAST(N'2022-05-29' AS Date), 3, 41018, 687)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (994, 1021, CAST(N'2022-05-29' AS Date), 1, 18090, 334)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (995, 1139, CAST(N'2022-05-29' AS Date), 2, 15783, 335)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (996, 1210, CAST(N'2022-05-29' AS Date), 2, 98976, 686)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (997, 1247, CAST(N'2022-05-29' AS Date), 2, 47373, 328)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (998, 1496, CAST(N'2022-05-29' AS Date), 3, 33947, 332)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (999, 1725, CAST(N'2022-05-29' AS Date), 3, 43848, 680)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1000, 2023, CAST(N'2022-05-29' AS Date), 1, 96749, 337)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1001, 3095, CAST(N'2022-05-29' AS Date), 3, 77780, 333)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1002, 3778, CAST(N'2022-05-29' AS Date), 2, 98673, 685)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1003, 3984, CAST(N'2022-05-29' AS Date), 1, 89917, 688)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1004, 3985, CAST(N'2022-05-29' AS Date), 3, 49982, 691)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1005, 5015, CAST(N'2022-05-29' AS Date), 2, 21116, 684)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1006, 6767, CAST(N'2022-05-29' AS Date), 1, 66069, 682)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1007, 6826, CAST(N'2022-05-29' AS Date), 2, 30523, 689)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1008, 6842, CAST(N'2022-05-29' AS Date), 1, 33610, 330)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1009, 7061, CAST(N'2022-05-29' AS Date), 1, 19288, 678)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1010, 7517, CAST(N'2022-05-29' AS Date), 1, 45932, 683)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1011, 8035, CAST(N'2022-05-29' AS Date), 2, 86488, 331)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1012, 8549, CAST(N'2022-05-29' AS Date), 1, 18623, 681)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1013, 8780, CAST(N'2022-05-29' AS Date), 3, 55187, 338)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1014, 8805, CAST(N'2022-05-29' AS Date), 2, 27626, 690)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1015, 9147, CAST(N'2022-05-29' AS Date), 3, 64992, 336)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1016, 9224, CAST(N'2022-05-29' AS Date), 3, 89551, 329)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1017, 1360, CAST(N'2022-05-30' AS Date), 2, 23968, 701)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1018, 1614, CAST(N'2022-05-30' AS Date), 2, 99444, 705)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1019, 1653, CAST(N'2022-05-30' AS Date), 1, 69356, 703)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1020, 1858, CAST(N'2022-05-30' AS Date), 3, 55900, 696)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1021, 2018, CAST(N'2022-05-30' AS Date), 3, 43161, 698)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1022, 2679, CAST(N'2022-05-30' AS Date), 3, 83573, 706)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1023, 3417, CAST(N'2022-05-30' AS Date), 2, 84776, 346)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1024, 3580, CAST(N'2022-05-30' AS Date), 2, 35153, 350)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1025, 4004, CAST(N'2022-05-30' AS Date), 1, 45536, 700)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1026, 4112, CAST(N'2022-05-30' AS Date), 2, 95031, 345)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1027, 4930, CAST(N'2022-05-30' AS Date), 2, 71172, 343)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1028, 5476, CAST(N'2022-05-30' AS Date), 1, 92383, 342)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1029, 5531, CAST(N'2022-05-30' AS Date), 2, 89258, 348)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1030, 6215, CAST(N'2022-05-30' AS Date), 1, 74608, 695)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1031, 6722, CAST(N'2022-05-30' AS Date), 3, 61085, 702)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1032, 7398, CAST(N'2022-05-30' AS Date), 2, 35741, 694)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1033, 7600, CAST(N'2022-05-30' AS Date), 3, 76136, 697)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1034, 8251, CAST(N'2022-05-30' AS Date), 1, 68527, 692)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1035, 8293, CAST(N'2022-05-30' AS Date), 3, 93573, 693)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1036, 8556, CAST(N'2022-05-30' AS Date), 2, 17080, 704)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1037, 8653, CAST(N'2022-05-30' AS Date), 3, 40004, 349)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1038, 8705, CAST(N'2022-05-30' AS Date), 1, 30136, 340)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1039, 8750, CAST(N'2022-05-30' AS Date), 3, 93233, 339)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1040, 8998, CAST(N'2022-05-30' AS Date), 2, 34915, 699)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1041, 9102, CAST(N'2022-05-30' AS Date), 1, 58715, 347)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1042, 9214, CAST(N'2022-05-30' AS Date), 3, 17625, 344)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1043, 9981, CAST(N'2022-05-30' AS Date), 1, 14825, 341)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1044, 1041, CAST(N'2022-05-31' AS Date), 3, 27561, 355)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1045, 1168, CAST(N'2022-05-31' AS Date), 3, 26333, 712)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1046, 1519, CAST(N'2022-05-31' AS Date), 2, 54255, 710)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1047, 2264, CAST(N'2022-05-31' AS Date), 2, 36050, 354)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1048, 3370, CAST(N'2022-05-31' AS Date), 3, 28274, 715)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1049, 3418, CAST(N'2022-05-31' AS Date), 1, 63899, 359)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1050, 4382, CAST(N'2022-05-31' AS Date), 1, 91811, 357)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1051, 5201, CAST(N'2022-05-31' AS Date), 3, 54581, 711)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1052, 5252, CAST(N'2022-05-31' AS Date), 2, 14072, 709)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1053, 5369, CAST(N'2022-05-31' AS Date), 2, 18810, 713)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1054, 5648, CAST(N'2022-05-31' AS Date), 2, 65431, 352)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1055, 6075, CAST(N'2022-05-31' AS Date), 3, 36925, 351)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1056, 6097, CAST(N'2022-05-31' AS Date), 1, 10434, 356)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1057, 6337, CAST(N'2022-05-31' AS Date), 1, 55005, 358)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1058, 6911, CAST(N'2022-05-31' AS Date), 3, 70748, 716)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1059, 6949, CAST(N'2022-05-31' AS Date), 2, 56757, 708)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1060, 7876, CAST(N'2022-05-31' AS Date), 3, 29365, 717)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1061, 8025, CAST(N'2022-05-31' AS Date), 1, 21453, 719)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1062, 8082, CAST(N'2022-05-31' AS Date), 1, 64125, 714)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1063, 8264, CAST(N'2022-05-31' AS Date), 3, 98915, 353)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1064, 9297, CAST(N'2022-05-31' AS Date), 3, 44073, 707)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1065, 9669, CAST(N'2022-05-31' AS Date), 1, 50716, 718)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1066, 1013, CAST(N'2022-06-01' AS Date), 1, 82481, 367)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1067, 1019, CAST(N'2022-06-01' AS Date), 1, 56476, 364)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1068, 1165, CAST(N'2022-06-01' AS Date), 3, 21991, 722)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1069, 1390, CAST(N'2022-06-01' AS Date), 3, 48823, 725)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1070, 1915, CAST(N'2022-06-01' AS Date), 1, 28821, 361)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1071, 2646, CAST(N'2022-06-01' AS Date), 1, 29459, 21)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1072, 3049, CAST(N'2022-06-01' AS Date), 2, 89405, 728)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1073, 3304, CAST(N'2022-06-01' AS Date), 1, 80426, 370)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1074, 3533, CAST(N'2022-06-01' AS Date), 2, 33406, 19)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1075, 3617, CAST(N'2022-06-01' AS Date), 3, 96797, 729)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1076, 3739, CAST(N'2022-06-01' AS Date), 2, 47127, 730)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1077, 3751, CAST(N'2022-06-01' AS Date), 3, 29854, 17)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1078, 3881, CAST(N'2022-06-01' AS Date), 1, 23873, 369)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1079, 3889, CAST(N'2022-06-01' AS Date), 3, 83946, 720)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1080, 4133, CAST(N'2022-06-01' AS Date), 2, 34395, 731)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1081, 4234, CAST(N'2022-06-01' AS Date), 3, 88049, 25)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1082, 4341, CAST(N'2022-06-01' AS Date), 1, 34731, 362)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1083, 4490, CAST(N'2022-06-01' AS Date), 2, 44600, 723)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1084, 4889, CAST(N'2022-06-01' AS Date), 3, 42743, 20)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1085, 5220, CAST(N'2022-06-01' AS Date), 1, 95426, 22)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1086, 5327, CAST(N'2022-06-01' AS Date), 2, 88753, 365)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1087, 5418, CAST(N'2022-06-01' AS Date), 1, 64213, 24)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1088, 5587, CAST(N'2022-06-01' AS Date), 2, 27093, 15)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1089, 5729, CAST(N'2022-06-01' AS Date), 1, 72592, 14)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1090, 5792, CAST(N'2022-06-01' AS Date), 1, 53170, 724)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1091, 5826, CAST(N'2022-06-01' AS Date), 3, 58948, 360)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1092, 6078, CAST(N'2022-06-01' AS Date), 2, 19767, 366)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1093, 6311, CAST(N'2022-06-01' AS Date), 2, 59995, 371)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1094, 6608, CAST(N'2022-06-01' AS Date), 1, 84283, 27)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1095, 6665, CAST(N'2022-06-01' AS Date), 2, 61587, 721)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1096, 6891, CAST(N'2022-06-01' AS Date), 2, 18998, 26)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1097, 7087, CAST(N'2022-06-01' AS Date), 2, 13709, 363)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1098, 7376, CAST(N'2022-06-01' AS Date), 2, 88646, 23)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1099, 7642, CAST(N'2022-06-01' AS Date), 3, 92431, 726)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1100, 7658, CAST(N'2022-06-01' AS Date), 2, 99944, 372)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1101, 8232, CAST(N'2022-06-01' AS Date), 1, 91926, 727)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1102, 8817, CAST(N'2022-06-01' AS Date), 1, 91218, 16)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1103, 8833, CAST(N'2022-06-01' AS Date), 2, 21742, 18)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1104, 9860, CAST(N'2022-06-01' AS Date), 2, 35084, 368)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1105, 1489, CAST(N'2022-06-02' AS Date), 2, 89461, 35)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1106, 1712, CAST(N'2022-06-02' AS Date), 1, 48086, 374)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1107, 2305, CAST(N'2022-06-02' AS Date), 3, 35671, 379)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1108, 2745, CAST(N'2022-06-02' AS Date), 1, 50506, 380)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1109, 2786, CAST(N'2022-06-02' AS Date), 2, 55382, 381)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1110, 2992, CAST(N'2022-06-02' AS Date), 2, 95373, 38)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1111, 3554, CAST(N'2022-06-02' AS Date), 1, 89502, 28)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1112, 3616, CAST(N'2022-06-02' AS Date), 3, 11986, 382)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1113, 3663, CAST(N'2022-06-02' AS Date), 3, 10394, 39)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1114, 3953, CAST(N'2022-06-02' AS Date), 3, 81496, 385)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1115, 4827, CAST(N'2022-06-02' AS Date), 1, 46571, 33)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1116, 4982, CAST(N'2022-06-02' AS Date), 3, 36974, 377)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1117, 5016, CAST(N'2022-06-02' AS Date), 1, 99602, 32)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1118, 5313, CAST(N'2022-06-02' AS Date), 2, 96987, 29)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1119, 5333, CAST(N'2022-06-02' AS Date), 2, 38670, 733)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1120, 6071, CAST(N'2022-06-02' AS Date), 3, 45217, 375)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1121, 6475, CAST(N'2022-06-02' AS Date), 1, 62077, 36)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1122, 6695, CAST(N'2022-06-02' AS Date), 3, 29539, 34)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1123, 6850, CAST(N'2022-06-02' AS Date), 3, 26646, 732)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1124, 7025, CAST(N'2022-06-02' AS Date), 2, 97082, 388)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1125, 7069, CAST(N'2022-06-02' AS Date), 1, 49538, 378)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1126, 7076, CAST(N'2022-06-02' AS Date), 2, 75384, 37)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1127, 7453, CAST(N'2022-06-02' AS Date), 3, 72400, 31)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1128, 8295, CAST(N'2022-06-02' AS Date), 1, 56439, 373)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1129, 8428, CAST(N'2022-06-02' AS Date), 3, 50226, 387)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1130, 8477, CAST(N'2022-06-02' AS Date), 2, 26546, 383)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1131, 8760, CAST(N'2022-06-02' AS Date), 1, 20743, 30)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1132, 9111, CAST(N'2022-06-02' AS Date), 3, 25538, 376)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1133, 9275, CAST(N'2022-06-02' AS Date), 1, 82705, 384)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1134, 9951, CAST(N'2022-06-02' AS Date), 3, 29538, 386)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1135, 1038, CAST(N'2022-06-03' AS Date), 1, 56912, 736)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1136, 1585, CAST(N'2022-06-03' AS Date), 1, 33299, 43)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1137, 1608, CAST(N'2022-06-03' AS Date), 3, 41225, 395)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1138, 1682, CAST(N'2022-06-03' AS Date), 2, 18314, 48)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1139, 1802, CAST(N'2022-06-03' AS Date), 3, 70857, 50)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1140, 1965, CAST(N'2022-06-03' AS Date), 1, 25105, 46)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1141, 1996, CAST(N'2022-06-03' AS Date), 2, 77268, 42)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1142, 3636, CAST(N'2022-06-03' AS Date), 2, 37575, 734)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1143, 3679, CAST(N'2022-06-03' AS Date), 1, 35821, 51)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1144, 4202, CAST(N'2022-06-03' AS Date), 1, 42417, 41)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1145, 4811, CAST(N'2022-06-03' AS Date), 3, 75966, 391)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1146, 5118, CAST(N'2022-06-03' AS Date), 2, 19092, 737)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1147, 5622, CAST(N'2022-06-03' AS Date), 2, 42850, 40)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1148, 5868, CAST(N'2022-06-03' AS Date), 3, 22466, 47)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1149, 5912, CAST(N'2022-06-03' AS Date), 1, 51966, 396)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1150, 6530, CAST(N'2022-06-03' AS Date), 1, 61508, 735)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1151, 6750, CAST(N'2022-06-03' AS Date), 1, 36381, 44)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1152, 6877, CAST(N'2022-06-03' AS Date), 1, 19606, 738)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1153, 7419, CAST(N'2022-06-03' AS Date), 3, 31685, 739)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1154, 7803, CAST(N'2022-06-03' AS Date), 1, 37704, 393)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1155, 7835, CAST(N'2022-06-03' AS Date), 2, 83108, 390)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1156, 8108, CAST(N'2022-06-03' AS Date), 1, 11533, 392)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1157, 8574, CAST(N'2022-06-03' AS Date), 1, 17682, 389)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1158, 8589, CAST(N'2022-06-03' AS Date), 2, 95198, 45)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1159, 9417, CAST(N'2022-06-03' AS Date), 1, 35610, 394)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1160, 9586, CAST(N'2022-06-03' AS Date), 1, 53772, 49)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1161, 494, CAST(N'2022-06-04' AS Date), 2, 91447, 402)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1162, 863, CAST(N'2022-06-04' AS Date), 1, 13831, 743)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1163, 1818, CAST(N'2022-06-04' AS Date), 1, 52989, 406)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1164, 2175, CAST(N'2022-06-04' AS Date), 3, 38437, 401)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1165, 2361, CAST(N'2022-06-04' AS Date), 1, 13987, 409)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1166, 2584, CAST(N'2022-06-04' AS Date), 3, 38670, 54)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1167, 2977, CAST(N'2022-06-04' AS Date), 1, 39839, 63)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1168, 3051, CAST(N'2022-06-04' AS Date), 2, 21352, 67)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1169, 3577, CAST(N'2022-06-04' AS Date), 3, 74389, 400)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1170, 3619, CAST(N'2022-06-04' AS Date), 2, 89844, 56)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1171, 4386, CAST(N'2022-06-04' AS Date), 2, 61324, 64)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1172, 4538, CAST(N'2022-06-04' AS Date), 2, 11762, 741)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1173, 5047, CAST(N'2022-06-04' AS Date), 1, 53395, 65)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1174, 5060, CAST(N'2022-06-04' AS Date), 2, 48350, 58)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1175, 5338, CAST(N'2022-06-04' AS Date), 1, 66319, 55)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1176, 5395, CAST(N'2022-06-04' AS Date), 3, 73303, 404)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1177, 5583, CAST(N'2022-06-04' AS Date), 1, 70309, 742)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1178, 5997, CAST(N'2022-06-04' AS Date), 3, 15868, 57)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1179, 6394, CAST(N'2022-06-04' AS Date), 2, 58546, 398)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1180, 6521, CAST(N'2022-06-04' AS Date), 3, 45289, 405)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1181, 6766, CAST(N'2022-06-04' AS Date), 3, 68915, 403)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1182, 6840, CAST(N'2022-06-04' AS Date), 3, 68915, 397)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1183, 7155, CAST(N'2022-06-04' AS Date), 2, 37332, 53)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1184, 7220, CAST(N'2022-06-04' AS Date), 2, 60157, 59)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1185, 7441, CAST(N'2022-06-04' AS Date), 1, 17095, 62)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1186, 7488, CAST(N'2022-06-04' AS Date), 1, 96671, 61)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1187, 7548, CAST(N'2022-06-04' AS Date), 1, 12922, 66)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1188, 7655, CAST(N'2022-06-04' AS Date), 2, 30095, 410)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1189, 7720, CAST(N'2022-06-04' AS Date), 1, 84723, 407)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1190, 7777, CAST(N'2022-06-04' AS Date), 2, 89360, 744)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1191, 8032, CAST(N'2022-06-04' AS Date), 3, 99241, 740)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1192, 8102, CAST(N'2022-06-04' AS Date), 1, 59278, 411)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1193, 8316, CAST(N'2022-06-04' AS Date), 2, 50889, 52)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1194, 8880, CAST(N'2022-06-04' AS Date), 3, 88288, 60)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1195, 8926, CAST(N'2022-06-04' AS Date), 1, 43137, 408)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1196, 9894, CAST(N'2022-06-04' AS Date), 3, 89807, 399)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1197, 553, CAST(N'2022-06-05' AS Date), 1, 54228, 746)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1198, 1086, CAST(N'2022-06-05' AS Date), 2, 90918, 414)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1199, 1454, CAST(N'2022-06-05' AS Date), 2, 99277, 412)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1200, 2170, CAST(N'2022-06-05' AS Date), 1, 48397, 68)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1201, 2197, CAST(N'2022-06-05' AS Date), 1, 19808, 425)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1202, 2320, CAST(N'2022-06-05' AS Date), 3, 47565, 423)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1203, 2595, CAST(N'2022-06-05' AS Date), 2, 96573, 413)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1204, 2841, CAST(N'2022-06-05' AS Date), 2, 61661, 76)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1205, 3139, CAST(N'2022-06-05' AS Date), 1, 78883, 78)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1206, 3557, CAST(N'2022-06-05' AS Date), 3, 60392, 416)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1207, 4064, CAST(N'2022-06-05' AS Date), 2, 50231, 419)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1208, 4238, CAST(N'2022-06-05' AS Date), 2, 31219, 415)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1209, 4289, CAST(N'2022-06-05' AS Date), 3, 60082, 73)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1210, 4357, CAST(N'2022-06-05' AS Date), 2, 88367, 747)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1211, 5723, CAST(N'2022-06-05' AS Date), 1, 59367, 422)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1212, 5850, CAST(N'2022-06-05' AS Date), 1, 26645, 748)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1213, 6033, CAST(N'2022-06-05' AS Date), 3, 73632, 70)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1214, 6724, CAST(N'2022-06-05' AS Date), 3, 51967, 421)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1215, 6810, CAST(N'2022-06-05' AS Date), 1, 44871, 71)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1216, 6817, CAST(N'2022-06-05' AS Date), 1, 88398, 424)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1217, 6823, CAST(N'2022-06-05' AS Date), 3, 73364, 69)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1218, 6879, CAST(N'2022-06-05' AS Date), 3, 93061, 745)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1219, 8077, CAST(N'2022-06-05' AS Date), 1, 25725, 72)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1220, 8706, CAST(N'2022-06-05' AS Date), 3, 69205, 417)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1221, 8829, CAST(N'2022-06-05' AS Date), 1, 43986, 75)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1222, 9218, CAST(N'2022-06-05' AS Date), 2, 29437, 420)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1223, 9396, CAST(N'2022-06-05' AS Date), 3, 34413, 418)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1224, 9483, CAST(N'2022-06-05' AS Date), 2, 93489, 77)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1225, 9634, CAST(N'2022-06-05' AS Date), 1, 92776, 74)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1226, 302, CAST(N'2022-06-06' AS Date), 1, 44357, 429)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1227, 1233, CAST(N'2022-06-06' AS Date), 2, 93260, 432)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1228, 1981, CAST(N'2022-06-06' AS Date), 2, 95051, 87)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1229, 2287, CAST(N'2022-06-06' AS Date), 2, 21023, 83)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1230, 2590, CAST(N'2022-06-06' AS Date), 3, 38642, 92)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1231, 3363, CAST(N'2022-06-06' AS Date), 3, 35849, 430)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1232, 3395, CAST(N'2022-06-06' AS Date), 2, 32073, 428)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1233, 3411, CAST(N'2022-06-06' AS Date), 1, 94757, 91)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1234, 3542, CAST(N'2022-06-06' AS Date), 1, 28299, 431)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1235, 3648, CAST(N'2022-06-06' AS Date), 3, 23000, 434)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1236, 3756, CAST(N'2022-06-06' AS Date), 1, 45239, 433)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1237, 3891, CAST(N'2022-06-06' AS Date), 2, 75895, 84)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1238, 4060, CAST(N'2022-06-06' AS Date), 3, 30151, 89)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1239, 5144, CAST(N'2022-06-06' AS Date), 1, 99291, 86)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1240, 5919, CAST(N'2022-06-06' AS Date), 2, 59533, 90)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1241, 6350, CAST(N'2022-06-06' AS Date), 1, 90756, 82)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1242, 6352, CAST(N'2022-06-06' AS Date), 3, 44342, 426)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1243, 7451, CAST(N'2022-06-06' AS Date), 2, 65009, 80)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1244, 8496, CAST(N'2022-06-06' AS Date), 1, 27005, 93)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1245, 8949, CAST(N'2022-06-06' AS Date), 2, 61302, 427)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1246, 9327, CAST(N'2022-06-06' AS Date), 3, 67479, 81)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1247, 9671, CAST(N'2022-06-06' AS Date), 2, 29284, 88)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1248, 9859, CAST(N'2022-06-06' AS Date), 1, 23022, 85)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1249, 9869, CAST(N'2022-06-06' AS Date), 3, 90967, 79)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1250, 1072, CAST(N'2022-06-07' AS Date), 1, 73421, 97)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1251, 1269, CAST(N'2022-06-07' AS Date), 1, 98851, 749)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1252, 1798, CAST(N'2022-06-07' AS Date), 2, 91032, 101)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1253, 1927, CAST(N'2022-06-07' AS Date), 1, 96361, 442)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1254, 2621, CAST(N'2022-06-07' AS Date), 1, 49339, 95)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1255, 2626, CAST(N'2022-06-07' AS Date), 3, 22185, 104)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1256, 2708, CAST(N'2022-06-07' AS Date), 1, 40030, 94)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1257, 2978, CAST(N'2022-06-07' AS Date), 1, 85829, 99)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1258, 3731, CAST(N'2022-06-07' AS Date), 1, 89798, 436)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1259, 3917, CAST(N'2022-06-07' AS Date), 2, 72365, 754)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1260, 4154, CAST(N'2022-06-07' AS Date), 3, 99018, 750)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1261, 4197, CAST(N'2022-06-07' AS Date), 2, 16054, 103)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1262, 4508, CAST(N'2022-06-07' AS Date), 1, 40593, 441)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1263, 5380, CAST(N'2022-06-07' AS Date), 1, 17777, 437)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1264, 5638, CAST(N'2022-06-07' AS Date), 3, 92840, 755)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1265, 6003, CAST(N'2022-06-07' AS Date), 3, 41093, 96)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1266, 6013, CAST(N'2022-06-07' AS Date), 3, 74232, 752)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1267, 6953, CAST(N'2022-06-07' AS Date), 3, 89493, 753)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1268, 7405, CAST(N'2022-06-07' AS Date), 2, 31185, 751)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1269, 7455, CAST(N'2022-06-07' AS Date), 3, 30236, 444)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1270, 7714, CAST(N'2022-06-07' AS Date), 2, 82535, 440)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1271, 7813, CAST(N'2022-06-07' AS Date), 1, 47877, 438)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1272, 7964, CAST(N'2022-06-07' AS Date), 3, 98074, 443)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1273, 8091, CAST(N'2022-06-07' AS Date), 2, 14660, 446)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1274, 8622, CAST(N'2022-06-07' AS Date), 2, 73771, 445)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1275, 8855, CAST(N'2022-06-07' AS Date), 3, 68334, 98)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1276, 8973, CAST(N'2022-06-07' AS Date), 2, 27872, 102)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1277, 9095, CAST(N'2022-06-07' AS Date), 2, 69394, 100)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1278, 9532, CAST(N'2022-06-07' AS Date), 2, 71528, 435)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1279, 9777, CAST(N'2022-06-07' AS Date), 3, 86417, 439)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1280, 1455, CAST(N'2022-06-08' AS Date), 3, 28974, 109)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1281, 1571, CAST(N'2022-06-08' AS Date), 2, 51533, 763)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1282, 1664, CAST(N'2022-06-08' AS Date), 2, 27665, 118)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1283, 1923, CAST(N'2022-06-08' AS Date), 1, 40598, 116)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1284, 2337, CAST(N'2022-06-08' AS Date), 1, 91493, 756)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1285, 2347, CAST(N'2022-06-08' AS Date), 2, 68602, 453)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1286, 2360, CAST(N'2022-06-08' AS Date), 1, 35254, 105)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1287, 2527, CAST(N'2022-06-08' AS Date), 2, 36963, 448)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1288, 3272, CAST(N'2022-06-08' AS Date), 3, 15542, 459)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1289, 3424, CAST(N'2022-06-08' AS Date), 3, 20780, 761)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1290, 3454, CAST(N'2022-06-08' AS Date), 1, 63591, 112)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1291, 3468, CAST(N'2022-06-08' AS Date), 2, 52258, 113)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1292, 3602, CAST(N'2022-06-08' AS Date), 3, 29301, 762)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1293, 3885, CAST(N'2022-06-08' AS Date), 1, 21787, 458)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1294, 3936, CAST(N'2022-06-08' AS Date), 2, 85838, 106)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1295, 4115, CAST(N'2022-06-08' AS Date), 1, 13169, 759)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1296, 4299, CAST(N'2022-06-08' AS Date), 3, 41537, 460)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1297, 4672, CAST(N'2022-06-08' AS Date), 1, 21524, 107)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1298, 4957, CAST(N'2022-06-08' AS Date), 2, 51924, 760)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1299, 5052, CAST(N'2022-06-08' AS Date), 3, 55747, 452)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1300, 5722, CAST(N'2022-06-08' AS Date), 3, 30556, 454)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1301, 5732, CAST(N'2022-06-08' AS Date), 2, 65322, 117)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1302, 6290, CAST(N'2022-06-08' AS Date), 1, 15127, 110)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1303, 6605, CAST(N'2022-06-08' AS Date), 3, 70936, 115)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1304, 6672, CAST(N'2022-06-08' AS Date), 1, 40609, 114)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1305, 7070, CAST(N'2022-06-08' AS Date), 3, 46434, 447)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1306, 7415, CAST(N'2022-06-08' AS Date), 2, 47106, 457)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1307, 7921, CAST(N'2022-06-08' AS Date), 1, 37533, 456)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1308, 7937, CAST(N'2022-06-08' AS Date), 1, 64803, 449)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1309, 8193, CAST(N'2022-06-08' AS Date), 2, 12807, 758)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1310, 8345, CAST(N'2022-06-08' AS Date), 1, 81834, 757)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1311, 8393, CAST(N'2022-06-08' AS Date), 3, 85249, 451)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1312, 8486, CAST(N'2022-06-08' AS Date), 1, 62868, 111)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1313, 8830, CAST(N'2022-06-08' AS Date), 1, 47585, 108)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1314, 9493, CAST(N'2022-06-08' AS Date), 2, 59275, 450)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1315, 9978, CAST(N'2022-06-08' AS Date), 2, 15975, 455)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1316, 1006, CAST(N'2022-06-09' AS Date), 2, 15978, 131)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1317, 1396, CAST(N'2022-06-09' AS Date), 3, 41170, 768)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1318, 1450, CAST(N'2022-06-09' AS Date), 3, 79715, 462)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1319, 1796, CAST(N'2022-06-09' AS Date), 1, 76708, 468)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1320, 1989, CAST(N'2022-06-09' AS Date), 1, 55196, 461)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1321, 2033, CAST(N'2022-06-09' AS Date), 3, 84476, 120)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1322, 2120, CAST(N'2022-06-09' AS Date), 2, 37614, 767)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1323, 2339, CAST(N'2022-06-09' AS Date), 1, 31122, 121)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1324, 3005, CAST(N'2022-06-09' AS Date), 2, 75543, 128)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1325, 3174, CAST(N'2022-06-09' AS Date), 2, 26299, 126)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1326, 3337, CAST(N'2022-06-09' AS Date), 2, 83235, 766)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1327, 3350, CAST(N'2022-06-09' AS Date), 2, 99106, 129)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1328, 3441, CAST(N'2022-06-09' AS Date), 3, 76316, 465)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1329, 3660, CAST(N'2022-06-09' AS Date), 3, 27364, 127)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1330, 3840, CAST(N'2022-06-09' AS Date), 3, 13728, 764)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1331, 4553, CAST(N'2022-06-09' AS Date), 1, 90927, 122)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1332, 4782, CAST(N'2022-06-09' AS Date), 2, 66730, 466)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1333, 4922, CAST(N'2022-06-09' AS Date), 2, 19629, 463)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1334, 6343, CAST(N'2022-06-09' AS Date), 2, 27435, 119)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1335, 6709, CAST(N'2022-06-09' AS Date), 1, 67357, 125)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1336, 6931, CAST(N'2022-06-09' AS Date), 2, 21101, 770)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1337, 7020, CAST(N'2022-06-09' AS Date), 3, 53317, 765)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1338, 7560, CAST(N'2022-06-09' AS Date), 1, 97788, 467)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1339, 7590, CAST(N'2022-06-09' AS Date), 3, 95651, 464)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1340, 7650, CAST(N'2022-06-09' AS Date), 2, 95431, 123)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1341, 8662, CAST(N'2022-06-09' AS Date), 3, 71902, 130)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1342, 8741, CAST(N'2022-06-09' AS Date), 2, 62687, 124)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1343, 9620, CAST(N'2022-06-09' AS Date), 3, 88409, 769)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1344, 9972, CAST(N'2022-06-09' AS Date), 3, 81912, 469)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1345, 973, CAST(N'2022-06-10' AS Date), 1, 59532, 472)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1346, 1191, CAST(N'2022-06-10' AS Date), 1, 36331, 140)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1347, 1449, CAST(N'2022-06-10' AS Date), 2, 50695, 475)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1348, 1491, CAST(N'2022-06-10' AS Date), 2, 63083, 470)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1349, 2031, CAST(N'2022-06-10' AS Date), 3, 53255, 476)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1350, 2758, CAST(N'2022-06-10' AS Date), 3, 73275, 141)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1351, 3039, CAST(N'2022-06-10' AS Date), 3, 32963, 473)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1352, 3123, CAST(N'2022-06-10' AS Date), 3, 55588, 772)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1353, 4016, CAST(N'2022-06-10' AS Date), 2, 50592, 142)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1354, 4354, CAST(N'2022-06-10' AS Date), 1, 81696, 139)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1355, 4521, CAST(N'2022-06-10' AS Date), 1, 93887, 133)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1356, 5235, CAST(N'2022-06-10' AS Date), 3, 28616, 474)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1357, 5466, CAST(N'2022-06-10' AS Date), 2, 21050, 143)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1358, 5589, CAST(N'2022-06-10' AS Date), 1, 18441, 137)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1359, 7079, CAST(N'2022-06-10' AS Date), 3, 15095, 138)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1360, 7105, CAST(N'2022-06-10' AS Date), 2, 14154, 136)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1361, 7259, CAST(N'2022-06-10' AS Date), 2, 34101, 132)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1362, 7287, CAST(N'2022-06-10' AS Date), 1, 70630, 771)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1363, 7294, CAST(N'2022-06-10' AS Date), 2, 54061, 773)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1364, 7526, CAST(N'2022-06-10' AS Date), 3, 32884, 134)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1365, 7633, CAST(N'2022-06-10' AS Date), 1, 81950, 471)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1366, 8335, CAST(N'2022-06-10' AS Date), 2, 57163, 135)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1367, 753, CAST(N'2022-06-11' AS Date), 1, 22257, 484)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1368, 1023, CAST(N'2022-06-11' AS Date), 3, 95225, 480)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1369, 1310, CAST(N'2022-06-11' AS Date), 2, 39273, 774)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1370, 1347, CAST(N'2022-06-11' AS Date), 1, 51458, 483)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1371, 1384, CAST(N'2022-06-11' AS Date), 1, 76316, 150)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1372, 3060, CAST(N'2022-06-11' AS Date), 3, 46995, 146)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1373, 3221, CAST(N'2022-06-11' AS Date), 2, 56798, 485)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1374, 3289, CAST(N'2022-06-11' AS Date), 3, 15924, 145)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1375, 3351, CAST(N'2022-06-11' AS Date), 2, 97037, 155)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1376, 3727, CAST(N'2022-06-11' AS Date), 1, 69575, 481)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1377, 4034, CAST(N'2022-06-11' AS Date), 2, 78638, 144)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1378, 4209, CAST(N'2022-06-11' AS Date), 2, 48724, 488)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1379, 4412, CAST(N'2022-06-11' AS Date), 3, 80825, 148)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1380, 4577, CAST(N'2022-06-11' AS Date), 3, 16520, 156)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1381, 4631, CAST(N'2022-06-11' AS Date), 3, 69941, 151)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1382, 4800, CAST(N'2022-06-11' AS Date), 1, 18834, 482)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1383, 4907, CAST(N'2022-06-11' AS Date), 1, 86988, 775)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1384, 5026, CAST(N'2022-06-11' AS Date), 2, 52749, 479)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1385, 5540, CAST(N'2022-06-11' AS Date), 1, 71780, 477)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1386, 5800, CAST(N'2022-06-11' AS Date), 1, 36720, 153)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1387, 6076, CAST(N'2022-06-11' AS Date), 2, 96796, 149)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1388, 6285, CAST(N'2022-06-11' AS Date), 3, 69148, 147)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1389, 6685, CAST(N'2022-06-11' AS Date), 2, 14501, 154)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1390, 7330, CAST(N'2022-06-11' AS Date), 3, 25376, 486)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1391, 7913, CAST(N'2022-06-11' AS Date), 1, 14250, 776)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1392, 7926, CAST(N'2022-06-11' AS Date), 3, 20304, 478)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1393, 8009, CAST(N'2022-06-11' AS Date), 2, 76472, 152)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1394, 9879, CAST(N'2022-06-11' AS Date), 3, 65354, 487)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1395, 9897, CAST(N'2022-06-11' AS Date), 3, 66720, 489)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1396, 275, CAST(N'2022-06-12' AS Date), 3, 23941, 492)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1397, 1110, CAST(N'2022-06-12' AS Date), 1, 77191, 499)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1398, 2208, CAST(N'2022-06-12' AS Date), 3, 97503, 161)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1399, 3273, CAST(N'2022-06-12' AS Date), 3, 92261, 496)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1400, 3288, CAST(N'2022-06-12' AS Date), 3, 72264, 160)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1401, 5497, CAST(N'2022-06-12' AS Date), 2, 52229, 500)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1402, 5631, CAST(N'2022-06-12' AS Date), 2, 44550, 157)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1403, 5760, CAST(N'2022-06-12' AS Date), 2, 79071, 494)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1404, 5816, CAST(N'2022-06-12' AS Date), 1, 57101, 493)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1405, 6056, CAST(N'2022-06-12' AS Date), 3, 31006, 491)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1406, 7568, CAST(N'2022-06-12' AS Date), 1, 99692, 498)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1407, 7591, CAST(N'2022-06-12' AS Date), 3, 36735, 497)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1408, 7611, CAST(N'2022-06-12' AS Date), 2, 92203, 159)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1409, 7746, CAST(N'2022-06-12' AS Date), 3, 20575, 495)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1410, 8111, CAST(N'2022-06-12' AS Date), 3, 52454, 490)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1411, 9796, CAST(N'2022-06-12' AS Date), 2, 83773, 158)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1412, 1224, CAST(N'2022-06-13' AS Date), 3, 80088, 777)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1413, 1541, CAST(N'2022-06-13' AS Date), 2, 92462, 780)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1414, 1568, CAST(N'2022-06-13' AS Date), 1, 53121, 781)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1415, 1941, CAST(N'2022-06-13' AS Date), 1, 64929, 172)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1416, 3113, CAST(N'2022-06-13' AS Date), 1, 31124, 165)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1417, 3462, CAST(N'2022-06-13' AS Date), 1, 66437, 171)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1418, 3817, CAST(N'2022-06-13' AS Date), 1, 18975, 508)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1419, 4012, CAST(N'2022-06-13' AS Date), 3, 94089, 505)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1420, 4205, CAST(N'2022-06-13' AS Date), 1, 49216, 162)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1421, 4457, CAST(N'2022-06-13' AS Date), 2, 26821, 509)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1422, 4627, CAST(N'2022-06-13' AS Date), 2, 52752, 166)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1423, 4680, CAST(N'2022-06-13' AS Date), 1, 31907, 167)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1424, 5161, CAST(N'2022-06-13' AS Date), 1, 72371, 169)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1425, 5639, CAST(N'2022-06-13' AS Date), 2, 86193, 778)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1426, 5843, CAST(N'2022-06-13' AS Date), 2, 51567, 503)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1427, 5881, CAST(N'2022-06-13' AS Date), 2, 59407, 506)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1428, 6866, CAST(N'2022-06-13' AS Date), 3, 42015, 164)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1429, 7119, CAST(N'2022-06-13' AS Date), 1, 99854, 501)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1430, 7245, CAST(N'2022-06-13' AS Date), 3, 34758, 170)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1431, 7278, CAST(N'2022-06-13' AS Date), 1, 22224, 168)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1432, 7993, CAST(N'2022-06-13' AS Date), 2, 84737, 779)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1433, 8125, CAST(N'2022-06-13' AS Date), 2, 42984, 504)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1434, 8954, CAST(N'2022-06-13' AS Date), 2, 47784, 502)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1435, 9225, CAST(N'2022-06-13' AS Date), 1, 74367, 163)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1436, 9932, CAST(N'2022-06-13' AS Date), 3, 49242, 507)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1437, 1024, CAST(N'2022-06-14' AS Date), 3, 94733, 173)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1438, 1627, CAST(N'2022-06-14' AS Date), 3, 52114, 515)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1439, 1632, CAST(N'2022-06-14' AS Date), 1, 30996, 177)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1440, 1693, CAST(N'2022-06-14' AS Date), 1, 11871, 517)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1441, 1694, CAST(N'2022-06-14' AS Date), 2, 83041, 181)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1442, 2099, CAST(N'2022-06-14' AS Date), 1, 80284, 516)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1443, 2154, CAST(N'2022-06-14' AS Date), 2, 54074, 522)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1444, 2831, CAST(N'2022-06-14' AS Date), 2, 50794, 523)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1445, 3247, CAST(N'2022-06-14' AS Date), 1, 63682, 175)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1446, 3430, CAST(N'2022-06-14' AS Date), 1, 45535, 513)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1447, 5283, CAST(N'2022-06-14' AS Date), 2, 26046, 518)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1448, 5330, CAST(N'2022-06-14' AS Date), 2, 44418, 180)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1449, 5373, CAST(N'2022-06-14' AS Date), 2, 60952, 174)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1450, 6032, CAST(N'2022-06-14' AS Date), 1, 69707, 510)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1451, 6096, CAST(N'2022-06-14' AS Date), 2, 72043, 524)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1452, 6161, CAST(N'2022-06-14' AS Date), 3, 13427, 178)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1453, 6643, CAST(N'2022-06-14' AS Date), 2, 33675, 520)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1454, 7106, CAST(N'2022-06-14' AS Date), 1, 44479, 519)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1455, 7201, CAST(N'2022-06-14' AS Date), 2, 73433, 511)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1456, 7242, CAST(N'2022-06-14' AS Date), 1, 17868, 521)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1457, 7570, CAST(N'2022-06-14' AS Date), 3, 55187, 176)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1458, 9132, CAST(N'2022-06-14' AS Date), 1, 12724, 514)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1459, 9178, CAST(N'2022-06-14' AS Date), 2, 18331, 179)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1460, 9288, CAST(N'2022-06-14' AS Date), 1, 99031, 512)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1461, 1644, CAST(N'2022-06-15' AS Date), 2, 50082, 528)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1462, 2667, CAST(N'2022-06-15' AS Date), 1, 81909, 787)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1463, 3349, CAST(N'2022-06-15' AS Date), 2, 36089, 191)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1464, 3729, CAST(N'2022-06-15' AS Date), 3, 49136, 192)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1465, 3752, CAST(N'2022-06-15' AS Date), 2, 19939, 783)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1466, 3761, CAST(N'2022-06-15' AS Date), 3, 90231, 185)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1467, 3977, CAST(N'2022-06-15' AS Date), 1, 22657, 184)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1468, 4149, CAST(N'2022-06-15' AS Date), 2, 77770, 530)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1469, 4918, CAST(N'2022-06-15' AS Date), 2, 71097, 785)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1470, 4924, CAST(N'2022-06-15' AS Date), 2, 42961, 187)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1471, 5950, CAST(N'2022-06-15' AS Date), 1, 27908, 526)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1472, 6274, CAST(N'2022-06-15' AS Date), 2, 22707, 188)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1473, 6498, CAST(N'2022-06-15' AS Date), 3, 99324, 529)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1474, 7052, CAST(N'2022-06-15' AS Date), 3, 84626, 193)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1475, 7100, CAST(N'2022-06-15' AS Date), 3, 79342, 789)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1476, 7182, CAST(N'2022-06-15' AS Date), 2, 63366, 786)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1477, 7429, CAST(N'2022-06-15' AS Date), 2, 90689, 531)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1478, 7779, CAST(N'2022-06-15' AS Date), 2, 65575, 186)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1479, 8277, CAST(N'2022-06-15' AS Date), 3, 19281, 784)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1480, 8315, CAST(N'2022-06-15' AS Date), 3, 82853, 782)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1481, 8661, CAST(N'2022-06-15' AS Date), 1, 46896, 183)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1482, 8866, CAST(N'2022-06-15' AS Date), 3, 13601, 182)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1483, 9021, CAST(N'2022-06-15' AS Date), 3, 14172, 788)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1484, 9391, CAST(N'2022-06-15' AS Date), 1, 36924, 189)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1485, 9430, CAST(N'2022-06-15' AS Date), 2, 98050, 190)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1486, 9644, CAST(N'2022-06-15' AS Date), 2, 73990, 525)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1487, 9815, CAST(N'2022-06-15' AS Date), 3, 48344, 527)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1488, 1525, CAST(N'2022-06-16' AS Date), 2, 11865, 540)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1489, 1833, CAST(N'2022-06-16' AS Date), 2, 32795, 534)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1490, 1960, CAST(N'2022-06-16' AS Date), 3, 82731, 535)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1491, 3743, CAST(N'2022-06-16' AS Date), 3, 48773, 196)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1492, 4274, CAST(N'2022-06-16' AS Date), 1, 33575, 791)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1493, 4524, CAST(N'2022-06-16' AS Date), 2, 17908, 202)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1494, 4630, CAST(N'2022-06-16' AS Date), 2, 87459, 790)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1495, 4947, CAST(N'2022-06-16' AS Date), 1, 58409, 541)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1496, 5103, CAST(N'2022-06-16' AS Date), 3, 44601, 199)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1497, 5152, CAST(N'2022-06-16' AS Date), 2, 51767, 201)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1498, 5490, CAST(N'2022-06-16' AS Date), 1, 52802, 532)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1499, 5650, CAST(N'2022-06-16' AS Date), 3, 43898, 194)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1500, 6930, CAST(N'2022-06-16' AS Date), 2, 85332, 536)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1501, 6999, CAST(N'2022-06-16' AS Date), 3, 61876, 200)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1502, 7104, CAST(N'2022-06-16' AS Date), 1, 81262, 533)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1503, 7509, CAST(N'2022-06-16' AS Date), 3, 56671, 198)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1504, 7628, CAST(N'2022-06-16' AS Date), 3, 10075, 543)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1505, 7709, CAST(N'2022-06-16' AS Date), 2, 89497, 539)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1506, 7975, CAST(N'2022-06-16' AS Date), 1, 36206, 544)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1507, 8063, CAST(N'2022-06-16' AS Date), 3, 59771, 538)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1508, 8603, CAST(N'2022-06-16' AS Date), 1, 53914, 542)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1509, 8719, CAST(N'2022-06-16' AS Date), 2, 99666, 197)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1510, 9632, CAST(N'2022-06-16' AS Date), 3, 25169, 537)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1511, 9753, CAST(N'2022-06-16' AS Date), 2, 53574, 195)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1512, 1036, CAST(N'2022-06-17' AS Date), 1, 63635, 210)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1513, 1205, CAST(N'2022-06-17' AS Date), 2, 10136, 793)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1514, 1374, CAST(N'2022-06-17' AS Date), 2, 17985, 549)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1515, 1765, CAST(N'2022-06-17' AS Date), 3, 68741, 796)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1516, 2438, CAST(N'2022-06-17' AS Date), 1, 21059, 548)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1517, 3020, CAST(N'2022-06-17' AS Date), 2, 46078, 797)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1518, 4121, CAST(N'2022-06-17' AS Date), 1, 23664, 206)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1519, 5175, CAST(N'2022-06-17' AS Date), 3, 71888, 546)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1520, 5426, CAST(N'2022-06-17' AS Date), 2, 39470, 551)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1521, 5696, CAST(N'2022-06-17' AS Date), 1, 79153, 547)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1522, 5986, CAST(N'2022-06-17' AS Date), 2, 42567, 205)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1523, 6123, CAST(N'2022-06-17' AS Date), 3, 43864, 211)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1524, 6220, CAST(N'2022-06-17' AS Date), 2, 43687, 552)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1525, 6654, CAST(N'2022-06-17' AS Date), 2, 14871, 553)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1526, 7420, CAST(N'2022-06-17' AS Date), 3, 74465, 203)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1527, 7718, CAST(N'2022-06-17' AS Date), 3, 41897, 798)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1528, 8037, CAST(N'2022-06-17' AS Date), 1, 25853, 209)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1529, 8189, CAST(N'2022-06-17' AS Date), 2, 99165, 207)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1530, 8299, CAST(N'2022-06-17' AS Date), 1, 57768, 545)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1531, 8607, CAST(N'2022-06-17' AS Date), 2, 28968, 204)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1532, 8970, CAST(N'2022-06-17' AS Date), 1, 22928, 208)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1533, 9371, CAST(N'2022-06-17' AS Date), 3, 13679, 792)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1534, 9469, CAST(N'2022-06-17' AS Date), 2, 31930, 550)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1535, 9789, CAST(N'2022-06-17' AS Date), 2, 24980, 795)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1536, 9827, CAST(N'2022-06-17' AS Date), 2, 11718, 794)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1537, 605, CAST(N'2022-06-18' AS Date), 3, 74549, 558)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1538, 1215, CAST(N'2022-06-18' AS Date), 1, 29924, 556)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1539, 1849, CAST(N'2022-06-18' AS Date), 1, 82672, 560)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1540, 1852, CAST(N'2022-06-18' AS Date), 1, 80535, 568)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1541, 2236, CAST(N'2022-06-18' AS Date), 1, 34217, 559)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1542, 2904, CAST(N'2022-06-18' AS Date), 2, 94410, 215)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1543, 2932, CAST(N'2022-06-18' AS Date), 3, 52281, 563)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1544, 3258, CAST(N'2022-06-18' AS Date), 2, 86894, 561)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1545, 3526, CAST(N'2022-06-18' AS Date), 2, 79537, 800)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1546, 3691, CAST(N'2022-06-18' AS Date), 3, 50828, 221)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1547, 3896, CAST(N'2022-06-18' AS Date), 2, 84194, 802)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1548, 4180, CAST(N'2022-06-18' AS Date), 3, 21285, 220)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1549, 4993, CAST(N'2022-06-18' AS Date), 3, 78068, 555)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1550, 5344, CAST(N'2022-06-18' AS Date), 3, 86012, 214)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1551, 5526, CAST(N'2022-06-18' AS Date), 2, 96490, 217)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1552, 5588, CAST(N'2022-06-18' AS Date), 1, 60264, 799)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1553, 5844, CAST(N'2022-06-18' AS Date), 2, 70265, 566)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1554, 5861, CAST(N'2022-06-18' AS Date), 1, 75964, 801)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1555, 6468, CAST(N'2022-06-18' AS Date), 2, 51304, 567)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1556, 6896, CAST(N'2022-06-18' AS Date), 2, 96974, 564)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1557, 7480, CAST(N'2022-06-18' AS Date), 3, 90817, 565)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1558, 7495, CAST(N'2022-06-18' AS Date), 2, 18428, 219)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1559, 8069, CAST(N'2022-06-18' AS Date), 3, 59868, 569)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1560, 8212, CAST(N'2022-06-18' AS Date), 2, 74698, 562)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1561, 8444, CAST(N'2022-06-18' AS Date), 3, 13678, 557)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1562, 8458, CAST(N'2022-06-18' AS Date), 2, 10801, 213)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1563, 8464, CAST(N'2022-06-18' AS Date), 1, 74042, 554)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1564, 9516, CAST(N'2022-06-18' AS Date), 1, 68800, 218)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1565, 9673, CAST(N'2022-06-18' AS Date), 2, 75699, 216)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1566, 9694, CAST(N'2022-06-18' AS Date), 2, 66121, 212)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1567, 341, CAST(N'2022-06-19' AS Date), 2, 63733, 579)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1568, 1232, CAST(N'2022-06-19' AS Date), 2, 33983, 573)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1569, 2315, CAST(N'2022-06-19' AS Date), 1, 76239, 804)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1570, 2426, CAST(N'2022-06-19' AS Date), 1, 68616, 225)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1571, 2452, CAST(N'2022-06-19' AS Date), 3, 95719, 222)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1572, 2636, CAST(N'2022-06-19' AS Date), 3, 72666, 224)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1573, 4166, CAST(N'2022-06-19' AS Date), 3, 98757, 576)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1574, 4618, CAST(N'2022-06-19' AS Date), 2, 76424, 571)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1575, 4658, CAST(N'2022-06-19' AS Date), 1, 54697, 572)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1576, 4917, CAST(N'2022-06-19' AS Date), 3, 17485, 226)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1577, 5563, CAST(N'2022-06-19' AS Date), 1, 38711, 575)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1578, 5711, CAST(N'2022-06-19' AS Date), 1, 89089, 805)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1579, 5714, CAST(N'2022-06-19' AS Date), 2, 58631, 807)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1580, 6245, CAST(N'2022-06-19' AS Date), 3, 15032, 570)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1581, 6978, CAST(N'2022-06-19' AS Date), 3, 77116, 803)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1582, 7319, CAST(N'2022-06-19' AS Date), 2, 21108, 806)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1583, 7349, CAST(N'2022-06-19' AS Date), 2, 32569, 580)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1584, 8010, CAST(N'2022-06-19' AS Date), 2, 62599, 228)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1585, 8497, CAST(N'2022-06-19' AS Date), 1, 35557, 229)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1586, 8694, CAST(N'2022-06-19' AS Date), 3, 43725, 578)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1587, 8870, CAST(N'2022-06-19' AS Date), 3, 22057, 577)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1588, 9037, CAST(N'2022-06-19' AS Date), 3, 93100, 227)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1589, 9794, CAST(N'2022-06-19' AS Date), 1, 25919, 223)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1590, 9969, CAST(N'2022-06-19' AS Date), 1, 24514, 574)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1591, 1773, CAST(N'2022-06-20' AS Date), 1, 35863, 587)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1592, 1801, CAST(N'2022-06-20' AS Date), 1, 59285, 231)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1593, 1948, CAST(N'2022-06-20' AS Date), 3, 28667, 585)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1594, 2241, CAST(N'2022-06-20' AS Date), 1, 92290, 583)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1595, 2482, CAST(N'2022-06-20' AS Date), 3, 82182, 238)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1596, 2749, CAST(N'2022-06-20' AS Date), 3, 13881, 237)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1597, 2921, CAST(N'2022-06-20' AS Date), 1, 87128, 243)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1598, 3902, CAST(N'2022-06-20' AS Date), 1, 54742, 590)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1599, 4291, CAST(N'2022-06-20' AS Date), 1, 64751, 236)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1600, 4500, CAST(N'2022-06-20' AS Date), 1, 91408, 584)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1601, 4756, CAST(N'2022-06-20' AS Date), 1, 15754, 589)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1602, 5063, CAST(N'2022-06-20' AS Date), 2, 11870, 239)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1603, 5239, CAST(N'2022-06-20' AS Date), 3, 39896, 230)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1604, 5871, CAST(N'2022-06-20' AS Date), 1, 29684, 240)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1605, 6334, CAST(N'2022-06-20' AS Date), 2, 98968, 234)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1606, 7223, CAST(N'2022-06-20' AS Date), 1, 97936, 232)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1607, 7540, CAST(N'2022-06-20' AS Date), 3, 95548, 242)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1608, 7597, CAST(N'2022-06-20' AS Date), 2, 65619, 244)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1609, 7694, CAST(N'2022-06-20' AS Date), 1, 96211, 582)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1610, 7900, CAST(N'2022-06-20' AS Date), 3, 12918, 241)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1611, 7965, CAST(N'2022-06-20' AS Date), 2, 52466, 586)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1612, 8883, CAST(N'2022-06-20' AS Date), 1, 91425, 588)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1613, 9163, CAST(N'2022-06-20' AS Date), 2, 43355, 581)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1614, 9384, CAST(N'2022-06-20' AS Date), 2, 67118, 233)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1615, 9504, CAST(N'2022-06-20' AS Date), 3, 3, 235)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1616, 1049, CAST(N'2022-06-21' AS Date), 3, 57517, 594)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1617, 1163, CAST(N'2022-06-21' AS Date), 3, 93451, 815)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1618, 1240, CAST(N'2022-06-21' AS Date), 2, 79539, 811)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1619, 1916, CAST(N'2022-06-21' AS Date), 1, 43534, 256)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1620, 1926, CAST(N'2022-06-21' AS Date), 3, 13520, 249)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1621, 1942, CAST(N'2022-06-21' AS Date), 1, 13347, 251)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1622, 1975, CAST(N'2022-06-21' AS Date), 1, 14891, 248)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1623, 2862, CAST(N'2022-06-21' AS Date), 1, 76956, 597)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1624, 3118, CAST(N'2022-06-21' AS Date), 3, 36278, 250)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1625, 3176, CAST(N'2022-06-21' AS Date), 1, 10386, 245)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1626, 3282, CAST(N'2022-06-21' AS Date), 2, 71317, 810)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1627, 3362, CAST(N'2022-06-21' AS Date), 1, 86224, 599)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1628, 4331, CAST(N'2022-06-21' AS Date), 1, 54329, 252)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1629, 4611, CAST(N'2022-06-21' AS Date), 3, 72420, 255)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1630, 4806, CAST(N'2022-06-21' AS Date), 1, 63564, 808)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1631, 5035, CAST(N'2022-06-21' AS Date), 3, 84776, 598)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1632, 5230, CAST(N'2022-06-21' AS Date), 3, 21557, 814)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1633, 5343, CAST(N'2022-06-21' AS Date), 2, 23670, 813)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1634, 5738, CAST(N'2022-06-21' AS Date), 3, 49350, 593)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1635, 5787, CAST(N'2022-06-21' AS Date), 2, 85471, 253)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1636, 5981, CAST(N'2022-06-21' AS Date), 3, 20947, 812)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1637, 6062, CAST(N'2022-06-21' AS Date), 2, 13923, 257)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1638, 6170, CAST(N'2022-06-21' AS Date), 2, 76851, 246)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1639, 6396, CAST(N'2022-06-21' AS Date), 1, 15851, 247)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1640, 6669, CAST(N'2022-06-21' AS Date), 3, 92776, 592)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1641, 7168, CAST(N'2022-06-21' AS Date), 3, 23728, 596)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1642, 8002, CAST(N'2022-06-21' AS Date), 2, 95178, 809)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1643, 9196, CAST(N'2022-06-21' AS Date), 3, 79420, 600)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1644, 9587, CAST(N'2022-06-21' AS Date), 3, 94163, 591)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1645, 9741, CAST(N'2022-06-21' AS Date), 3, 50884, 254)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1646, 9984, CAST(N'2022-06-21' AS Date), 2, 45043, 595)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1647, 475, CAST(N'2022-06-22' AS Date), 3, 39733, 605)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1648, 1259, CAST(N'2022-06-22' AS Date), 3, 77310, 261)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1649, 1533, CAST(N'2022-06-22' AS Date), 1, 10426, 817)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1650, 1534, CAST(N'2022-06-22' AS Date), 2, 95812, 263)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1651, 2489, CAST(N'2022-06-22' AS Date), 2, 79587, 818)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1652, 3042, CAST(N'2022-06-22' AS Date), 1, 21171, 264)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1653, 3277, CAST(N'2022-06-22' AS Date), 1, 42288, 615)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1654, 3459, CAST(N'2022-06-22' AS Date), 2, 56130, 608)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1655, 3612, CAST(N'2022-06-22' AS Date), 2, 70760, 606)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1656, 3725, CAST(N'2022-06-22' AS Date), 1, 39366, 611)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1657, 3939, CAST(N'2022-06-22' AS Date), 2, 51997, 258)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1658, 4705, CAST(N'2022-06-22' AS Date), 1, 21373, 265)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1659, 4876, CAST(N'2022-06-22' AS Date), 2, 27419, 607)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1660, 5279, CAST(N'2022-06-22' AS Date), 3, 78823, 610)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1661, 5513, CAST(N'2022-06-22' AS Date), 3, 67435, 614)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1662, 5611, CAST(N'2022-06-22' AS Date), 1, 40963, 604)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1663, 5798, CAST(N'2022-06-22' AS Date), 2, 53437, 259)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1664, 5953, CAST(N'2022-06-22' AS Date), 3, 43182, 609)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1665, 6317, CAST(N'2022-06-22' AS Date), 2, 64219, 816)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1666, 6417, CAST(N'2022-06-22' AS Date), 3, 44377, 602)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1667, 6434, CAST(N'2022-06-22' AS Date), 2, 56817, 819)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1668, 6513, CAST(N'2022-06-22' AS Date), 1, 52533, 612)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1669, 6676, CAST(N'2022-06-22' AS Date), 3, 33650, 262)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1670, 7058, CAST(N'2022-06-22' AS Date), 2, 48418, 820)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1671, 7133, CAST(N'2022-06-22' AS Date), 2, 81501, 260)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1672, 8122, CAST(N'2022-06-22' AS Date), 1, 44449, 601)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1673, 9072, CAST(N'2022-06-22' AS Date), 1, 62229, 613)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1674, 9269, CAST(N'2022-06-22' AS Date), 2, 35874, 266)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1675, 9952, CAST(N'2022-06-22' AS Date), 2, 92206, 603)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1676, 286, CAST(N'2022-06-23' AS Date), 2, 20316, 617)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1677, 1305, CAST(N'2022-06-23' AS Date), 3, 75911, 619)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1678, 1385, CAST(N'2022-06-23' AS Date), 2, 85717, 620)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1679, 1839, CAST(N'2022-06-23' AS Date), 3, 55634, 625)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1680, 2100, CAST(N'2022-06-23' AS Date), 2, 56154, 631)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1681, 2199, CAST(N'2022-06-23' AS Date), 3, 52796, 629)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1682, 2229, CAST(N'2022-06-23' AS Date), 1, 53804, 272)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1683, 2243, CAST(N'2022-06-23' AS Date), 2, 95366, 278)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1684, 3000, CAST(N'2022-06-23' AS Date), 2, 11951, 626)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1685, 3510, CAST(N'2022-06-23' AS Date), 2, 56586, 628)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1686, 3738, CAST(N'2022-06-23' AS Date), 3, 61956, 624)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1687, 3860, CAST(N'2022-06-23' AS Date), 3, 39970, 273)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1688, 4092, CAST(N'2022-06-23' AS Date), 2, 11943, 277)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1689, 4395, CAST(N'2022-06-23' AS Date), 3, 98532, 268)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1690, 4463, CAST(N'2022-06-23' AS Date), 3, 56154, 821)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1691, 4728, CAST(N'2022-06-23' AS Date), 1, 88216, 822)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1692, 4865, CAST(N'2022-06-23' AS Date), 3, 98758, 279)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1693, 5110, CAST(N'2022-06-23' AS Date), 1, 58148, 623)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1694, 5346, CAST(N'2022-06-23' AS Date), 2, 71995, 616)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1695, 5447, CAST(N'2022-06-23' AS Date), 3, 78673, 825)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1696, 5661, CAST(N'2022-06-23' AS Date), 1, 10664, 627)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1697, 6125, CAST(N'2022-06-23' AS Date), 1, 92029, 267)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1698, 6313, CAST(N'2022-06-23' AS Date), 2, 50457, 621)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1699, 6428, CAST(N'2022-06-23' AS Date), 1, 52463, 622)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1700, 6873, CAST(N'2022-06-23' AS Date), 3, 41910, 823)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1701, 7115, CAST(N'2022-06-23' AS Date), 1, 52555, 275)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1702, 7412, CAST(N'2022-06-23' AS Date), 2, 72334, 826)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1703, 7572, CAST(N'2022-06-23' AS Date), 2, 97210, 618)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1704, 8106, CAST(N'2022-06-23' AS Date), 3, 32936, 271)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1705, 8188, CAST(N'2022-06-23' AS Date), 3, 17028, 827)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1706, 9116, CAST(N'2022-06-23' AS Date), 3, 30920, 630)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1707, 9177, CAST(N'2022-06-23' AS Date), 3, 57460, 276)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1708, 9244, CAST(N'2022-06-23' AS Date), 1, 23128, 824)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1709, 9604, CAST(N'2022-06-23' AS Date), 2, 50615, 274)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1710, 9743, CAST(N'2022-06-23' AS Date), 3, 87012, 269)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1711, 9936, CAST(N'2022-06-23' AS Date), 3, 42631, 270)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1712, 782, CAST(N'2022-06-24' AS Date), 1, 48723, 830)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1713, 1050, CAST(N'2022-06-24' AS Date), 2, 17156, 639)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1714, 1756, CAST(N'2022-06-24' AS Date), 3, 70293, 287)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1715, 2038, CAST(N'2022-06-24' AS Date), 2, 16057, 288)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1716, 2153, CAST(N'2022-06-24' AS Date), 3, 57795, 637)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1717, 2217, CAST(N'2022-06-24' AS Date), 1, 68731, 832)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1718, 2544, CAST(N'2022-06-24' AS Date), 2, 65122, 642)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1719, 2576, CAST(N'2022-06-24' AS Date), 3, 38703, 638)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1720, 2719, CAST(N'2022-06-24' AS Date), 3, 19828, 290)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1721, 2925, CAST(N'2022-06-24' AS Date), 1, 50161, 289)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1722, 2947, CAST(N'2022-06-24' AS Date), 2, 79030, 834)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1723, 3138, CAST(N'2022-06-24' AS Date), 3, 23392, 831)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1724, 3264, CAST(N'2022-06-24' AS Date), 3, 32049, 633)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1725, 3326, CAST(N'2022-06-24' AS Date), 2, 51550, 636)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1726, 3685, CAST(N'2022-06-24' AS Date), 1, 94403, 640)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1727, 4119, CAST(N'2022-06-24' AS Date), 2, 41555, 280)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1728, 4601, CAST(N'2022-06-24' AS Date), 2, 94533, 828)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1729, 4860, CAST(N'2022-06-24' AS Date), 2, 98087, 641)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1730, 5033, CAST(N'2022-06-24' AS Date), 1, 42340, 634)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1731, 5074, CAST(N'2022-06-24' AS Date), 1, 55733, 284)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1732, 5453, CAST(N'2022-06-24' AS Date), 1, 52093, 292)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1733, 6127, CAST(N'2022-06-24' AS Date), 3, 47305, 286)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1734, 6184, CAST(N'2022-06-24' AS Date), 2, 59651, 285)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1735, 6275, CAST(N'2022-06-24' AS Date), 2, 76908, 829)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1736, 6705, CAST(N'2022-06-24' AS Date), 1, 90672, 644)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1737, 7254, CAST(N'2022-06-24' AS Date), 1, 44576, 282)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1738, 7345, CAST(N'2022-06-24' AS Date), 1, 22989, 833)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1739, 7946, CAST(N'2022-06-24' AS Date), 3, 12182, 643)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1740, 8080, CAST(N'2022-06-24' AS Date), 2, 22610, 283)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1741, 8187, CAST(N'2022-06-24' AS Date), 2, 66786, 291)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1742, 9052, CAST(N'2022-06-24' AS Date), 2, 70164, 293)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1743, 9057, CAST(N'2022-06-24' AS Date), 3, 39768, 635)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1744, 9260, CAST(N'2022-06-24' AS Date), 2, 73082, 281)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1745, 9388, CAST(N'2022-06-24' AS Date), 2, 78424, 632)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1746, 425, CAST(N'2022-06-25' AS Date), 3, 72733, 646)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1747, 902, CAST(N'2022-06-25' AS Date), 2, 11236, 649)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1748, 928, CAST(N'2022-06-25' AS Date), 2, 53223, 835)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1749, 1652, CAST(N'2022-06-25' AS Date), 3, 42154, 295)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1750, 2343, CAST(N'2022-06-25' AS Date), 2, 41004, 654)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1751, 3228, CAST(N'2022-06-25' AS Date), 3, 33687, 650)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1752, 4075, CAST(N'2022-06-25' AS Date), 2, 33081, 838)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1753, 4144, CAST(N'2022-06-25' AS Date), 2, 55034, 294)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1754, 4662, CAST(N'2022-06-25' AS Date), 2, 90251, 298)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1755, 5567, CAST(N'2022-06-25' AS Date), 2, 60009, 299)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1756, 5776, CAST(N'2022-06-25' AS Date), 3, 20924, 651)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1757, 5857, CAST(N'2022-06-25' AS Date), 1, 31080, 656)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1758, 6529, CAST(N'2022-06-25' AS Date), 2, 36970, 648)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1759, 6797, CAST(N'2022-06-25' AS Date), 2, 32578, 297)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1760, 6908, CAST(N'2022-06-25' AS Date), 1, 89945, 836)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1761, 7124, CAST(N'2022-06-25' AS Date), 2, 76201, 652)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1762, 7194, CAST(N'2022-06-25' AS Date), 2, 91174, 653)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1763, 7387, CAST(N'2022-06-25' AS Date), 2, 32620, 655)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1764, 7484, CAST(N'2022-06-25' AS Date), 3, 44873, 647)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1765, 7941, CAST(N'2022-06-25' AS Date), 2, 57115, 837)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1766, 7954, CAST(N'2022-06-25' AS Date), 3, 11459, 296)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1767, 9203, CAST(N'2022-06-25' AS Date), 1, 69450, 657)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1768, 9766, CAST(N'2022-06-25' AS Date), 3, 74613, 645)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1769, 498, CAST(N'2022-06-26' AS Date), 1, 87579, 843)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1770, 1082, CAST(N'2022-06-26' AS Date), 3, 54955, 840)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1771, 1149, CAST(N'2022-06-26' AS Date), 3, 40772, 661)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1772, 1379, CAST(N'2022-06-26' AS Date), 3, 31290, 839)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1773, 1726, CAST(N'2022-06-26' AS Date), 1, 49171, 663)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1774, 1830, CAST(N'2022-06-26' AS Date), 2, 97678, 302)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1775, 2300, CAST(N'2022-06-26' AS Date), 1, 10358, 305)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1776, 2721, CAST(N'2022-06-26' AS Date), 2, 91228, 301)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1777, 3024, CAST(N'2022-06-26' AS Date), 2, 36700, 306)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1778, 3260, CAST(N'2022-06-26' AS Date), 2, 74916, 658)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1779, 4239, CAST(N'2022-06-26' AS Date), 3, 45021, 662)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1780, 4765, CAST(N'2022-06-26' AS Date), 3, 14498, 666)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1781, 4890, CAST(N'2022-06-26' AS Date), 3, 20090, 844)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1782, 4921, CAST(N'2022-06-26' AS Date), 3, 67704, 664)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1783, 5142, CAST(N'2022-06-26' AS Date), 1, 28034, 660)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1784, 6533, CAST(N'2022-06-26' AS Date), 1, 81313, 311)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1785, 7141, CAST(N'2022-06-26' AS Date), 1, 50508, 845)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1786, 7180, CAST(N'2022-06-26' AS Date), 2, 37969, 665)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1787, 7444, CAST(N'2022-06-26' AS Date), 3, 57970, 309)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1788, 7675, CAST(N'2022-06-26' AS Date), 2, 30073, 841)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1789, 7928, CAST(N'2022-06-26' AS Date), 2, 70949, 842)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1790, 8015, CAST(N'2022-06-26' AS Date), 2, 40183, 308)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1791, 8457, CAST(N'2022-06-26' AS Date), 1, 98942, 303)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1792, 8650, CAST(N'2022-06-26' AS Date), 1, 56458, 310)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1793, 8823, CAST(N'2022-06-26' AS Date), 1, 23397, 304)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1794, 9088, CAST(N'2022-06-26' AS Date), 1, 80468, 300)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1795, 9317, CAST(N'2022-06-26' AS Date), 3, 50802, 659)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1796, 9447, CAST(N'2022-06-26' AS Date), 3, 87264, 307)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1797, 966, CAST(N'2022-06-27' AS Date), 2, 18417, 323)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1798, 1097, CAST(N'2022-06-27' AS Date), 1, 66268, 322)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1799, 1107, CAST(N'2022-06-27' AS Date), 3, 46186, 315)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1800, 1285, CAST(N'2022-06-27' AS Date), 3, 23123, 318)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1801, 1547, CAST(N'2022-06-27' AS Date), 1, 11805, 670)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1802, 1555, CAST(N'2022-06-27' AS Date), 3, 39018, 317)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1803, 1702, CAST(N'2022-06-27' AS Date), 2, 47688, 314)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1804, 1706, CAST(N'2022-06-27' AS Date), 1, 42969, 671)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1805, 1935, CAST(N'2022-06-27' AS Date), 1, 42957, 325)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1806, 1964, CAST(N'2022-06-27' AS Date), 1, 79174, 669)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1807, 2148, CAST(N'2022-06-27' AS Date), 1, 59972, 326)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1808, 2332, CAST(N'2022-06-27' AS Date), 1, 83641, 312)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1809, 2508, CAST(N'2022-06-27' AS Date), 3, 74512, 320)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1810, 3280, CAST(N'2022-06-27' AS Date), 2, 52990, 324)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1811, 4510, CAST(N'2022-06-27' AS Date), 2, 91629, 673)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1812, 4715, CAST(N'2022-06-27' AS Date), 2, 16137, 313)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1813, 5309, CAST(N'2022-06-27' AS Date), 1, 64037, 676)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1814, 5332, CAST(N'2022-06-27' AS Date), 3, 88801, 677)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1815, 5802, CAST(N'2022-06-27' AS Date), 2, 16096, 667)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1816, 6971, CAST(N'2022-06-27' AS Date), 3, 88532, 327)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1817, 7113, CAST(N'2022-06-27' AS Date), 1, 28993, 675)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1818, 7332, CAST(N'2022-06-27' AS Date), 3, 62853, 316)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1819, 7989, CAST(N'2022-06-27' AS Date), 2, 22315, 674)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1820, 8097, CAST(N'2022-06-27' AS Date), 1, 41134, 672)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1821, 8117, CAST(N'2022-06-27' AS Date), 3, 58728, 319)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1822, 8274, CAST(N'2022-06-27' AS Date), 3, 75726, 321)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1823, 9509, CAST(N'2022-06-27' AS Date), 3, 85160, 668)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1824, 761, CAST(N'2022-06-28' AS Date), 3, 37852, 679)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1825, 922, CAST(N'2022-06-28' AS Date), 2, 35404, 687)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1826, 1021, CAST(N'2022-06-28' AS Date), 2, 35009, 334)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1827, 1139, CAST(N'2022-06-28' AS Date), 1, 82205, 335)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1828, 1210, CAST(N'2022-06-28' AS Date), 3, 29006, 686)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1829, 1247, CAST(N'2022-06-28' AS Date), 1, 96073, 328)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1830, 1496, CAST(N'2022-06-28' AS Date), 1, 10993, 332)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1831, 1725, CAST(N'2022-06-28' AS Date), 1, 33062, 680)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1832, 1745, CAST(N'2022-06-28' AS Date), 2, 10891, 847)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1833, 2023, CAST(N'2022-06-28' AS Date), 3, 36529, 337)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1834, 3095, CAST(N'2022-06-28' AS Date), 2, 48851, 333)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1835, 3778, CAST(N'2022-06-28' AS Date), 1, 28861, 685)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1836, 3984, CAST(N'2022-06-28' AS Date), 2, 76111, 688)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1837, 3985, CAST(N'2022-06-28' AS Date), 1, 69007, 691)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1838, 5015, CAST(N'2022-06-28' AS Date), 3, 92755, 684)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1839, 5182, CAST(N'2022-06-28' AS Date), 3, 66576, 848)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1840, 6328, CAST(N'2022-06-28' AS Date), 1, 43130, 846)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1841, 6767, CAST(N'2022-06-28' AS Date), 2, 20383, 682)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1842, 6826, CAST(N'2022-06-28' AS Date), 2, 43374, 689)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1843, 6842, CAST(N'2022-06-28' AS Date), 1, 37588, 330)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1844, 7061, CAST(N'2022-06-28' AS Date), 2, 45982, 678)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1845, 7517, CAST(N'2022-06-28' AS Date), 3, 87982, 683)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1846, 8035, CAST(N'2022-06-28' AS Date), 1, 86733, 331)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1847, 8549, CAST(N'2022-06-28' AS Date), 2, 31736, 681)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1848, 8780, CAST(N'2022-06-28' AS Date), 2, 95250, 338)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1849, 8805, CAST(N'2022-06-28' AS Date), 1, 99434, 690)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1850, 9147, CAST(N'2022-06-28' AS Date), 1, 72978, 336)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1851, 9224, CAST(N'2022-06-28' AS Date), 1, 38466, 329)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1852, 1360, CAST(N'2022-06-29' AS Date), 3, 71112, 701)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1853, 1611, CAST(N'2022-06-29' AS Date), 3, 95695, 850)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1854, 1614, CAST(N'2022-06-29' AS Date), 1, 85881, 705)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1855, 1653, CAST(N'2022-06-29' AS Date), 1, 65538, 703)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1856, 1858, CAST(N'2022-06-29' AS Date), 3, 90010, 696)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1857, 2018, CAST(N'2022-06-29' AS Date), 2, 40658, 698)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1858, 2679, CAST(N'2022-06-29' AS Date), 2, 40683, 706)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1859, 3417, CAST(N'2022-06-29' AS Date), 2, 24590, 346)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1860, 3580, CAST(N'2022-06-29' AS Date), 2, 26449, 350)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1861, 4004, CAST(N'2022-06-29' AS Date), 1, 31545, 700)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1862, 4112, CAST(N'2022-06-29' AS Date), 2, 31881, 345)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1863, 4930, CAST(N'2022-06-29' AS Date), 3, 23884, 343)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1864, 5476, CAST(N'2022-06-29' AS Date), 3, 96779, 342)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1865, 5531, CAST(N'2022-06-29' AS Date), 3, 62127, 348)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1866, 6215, CAST(N'2022-06-29' AS Date), 2, 22861, 695)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1867, 6722, CAST(N'2022-06-29' AS Date), 3, 37787, 702)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1868, 7365, CAST(N'2022-06-29' AS Date), 3, 85032, 851)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1869, 7398, CAST(N'2022-06-29' AS Date), 2, 84298, 694)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1870, 7600, CAST(N'2022-06-29' AS Date), 3, 41622, 697)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1871, 8251, CAST(N'2022-06-29' AS Date), 2, 33574, 692)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1872, 8293, CAST(N'2022-06-29' AS Date), 1, 32848, 693)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1873, 8390, CAST(N'2022-06-29' AS Date), 3, 73562, 849)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1874, 8556, CAST(N'2022-06-29' AS Date), 1, 65577, 704)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1875, 8653, CAST(N'2022-06-29' AS Date), 2, 82956, 349)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1876, 8705, CAST(N'2022-06-29' AS Date), 1, 38083, 340)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1877, 8750, CAST(N'2022-06-29' AS Date), 1, 75369, 339)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1878, 8998, CAST(N'2022-06-29' AS Date), 2, 95209, 699)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1879, 9102, CAST(N'2022-06-29' AS Date), 1, 94423, 347)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1880, 9214, CAST(N'2022-06-29' AS Date), 1, 23254, 344)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1881, 9981, CAST(N'2022-06-29' AS Date), 2, 71329, 341)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1882, 1041, CAST(N'2022-06-30' AS Date), 3, 14295, 355)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1883, 1168, CAST(N'2022-06-30' AS Date), 1, 94013, 712)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1884, 1519, CAST(N'2022-06-30' AS Date), 1, 23976, 710)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1885, 1566, CAST(N'2022-06-30' AS Date), 1, 60241, 855)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1886, 2264, CAST(N'2022-06-30' AS Date), 1, 79164, 354)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1887, 2948, CAST(N'2022-06-30' AS Date), 2, 38842, 852)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1888, 3062, CAST(N'2022-06-30' AS Date), 1, 88690, 854)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1889, 3370, CAST(N'2022-06-30' AS Date), 3, 71364, 715)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1890, 3418, CAST(N'2022-06-30' AS Date), 3, 79017, 359)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1891, 4382, CAST(N'2022-06-30' AS Date), 3, 94257, 357)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1892, 5201, CAST(N'2022-06-30' AS Date), 2, 57102, 711)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1893, 5252, CAST(N'2022-06-30' AS Date), 3, 97970, 709)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1894, 5369, CAST(N'2022-06-30' AS Date), 3, 96881, 713)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1895, 5648, CAST(N'2022-06-30' AS Date), 1, 24762, 352)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1896, 6075, CAST(N'2022-06-30' AS Date), 2, 83609, 351)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1897, 6097, CAST(N'2022-06-30' AS Date), 3, 39993, 356)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1898, 6337, CAST(N'2022-06-30' AS Date), 3, 53609, 358)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1899, 6911, CAST(N'2022-06-30' AS Date), 1, 40493, 716)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1900, 6949, CAST(N'2022-06-30' AS Date), 3, 51518, 708)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1901, 7876, CAST(N'2022-06-30' AS Date), 3, 76432, 717)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1902, 8025, CAST(N'2022-06-30' AS Date), 2, 57348, 719)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1903, 8082, CAST(N'2022-06-30' AS Date), 3, 74513, 714)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1904, 8264, CAST(N'2022-06-30' AS Date), 3, 15411, 353)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1905, 8848, CAST(N'2022-06-30' AS Date), 2, 22841, 853)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1906, 9297, CAST(N'2022-06-30' AS Date), 2, 34510, 707)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1907, 9669, CAST(N'2022-06-30' AS Date), 1, 48040, 718)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1908, 1038, CAST(N'2022-07-03' AS Date), 1, 73397, 736)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1909, 1176, CAST(N'2022-07-03' AS Date), 3, 66731, 868)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1910, 1276, CAST(N'2022-07-03' AS Date), 2, 20178, 869)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1911, 1489, CAST(N'2022-07-03' AS Date), 1, 86086, 35)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1912, 1712, CAST(N'2022-07-03' AS Date), 1, 33312, 374)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1913, 1732, CAST(N'2022-07-03' AS Date), 1, 43984, 867)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1914, 2305, CAST(N'2022-07-03' AS Date), 2, 80532, 379)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1915, 2745, CAST(N'2022-07-03' AS Date), 2, 91733, 380)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1916, 2786, CAST(N'2022-07-03' AS Date), 1, 25585, 381)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1917, 2992, CAST(N'2022-07-03' AS Date), 3, 66091, 38)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1918, 3554, CAST(N'2022-07-03' AS Date), 1, 75403, 28)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1919, 3616, CAST(N'2022-07-03' AS Date), 3, 59266, 382)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1920, 3636, CAST(N'2022-07-03' AS Date), 3, 99390, 734)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1921, 3663, CAST(N'2022-07-03' AS Date), 2, 52014, 39)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1922, 3785, CAST(N'2022-07-03' AS Date), 2, 41885, 865)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1923, 3953, CAST(N'2022-07-03' AS Date), 1, 59844, 385)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1924, 4827, CAST(N'2022-07-03' AS Date), 2, 44436, 33)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1925, 4982, CAST(N'2022-07-03' AS Date), 3, 47818, 377)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1926, 5016, CAST(N'2022-07-03' AS Date), 1, 15305, 32)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1927, 5118, CAST(N'2022-07-03' AS Date), 2, 17924, 737)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1928, 5313, CAST(N'2022-07-03' AS Date), 2, 54819, 29)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1929, 6071, CAST(N'2022-07-03' AS Date), 1, 18887, 375)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1930, 6475, CAST(N'2022-07-03' AS Date), 2, 67899, 36)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1931, 6530, CAST(N'2022-07-03' AS Date), 2, 39409, 735)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1932, 6695, CAST(N'2022-07-03' AS Date), 1, 89595, 34)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1933, 6877, CAST(N'2022-07-03' AS Date), 2, 60917, 738)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1934, 7025, CAST(N'2022-07-03' AS Date), 3, 92730, 388)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1935, 7069, CAST(N'2022-07-03' AS Date), 2, 15711, 378)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1936, 7076, CAST(N'2022-07-03' AS Date), 3, 30758, 37)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1937, 7419, CAST(N'2022-07-03' AS Date), 3, 72359, 739)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1938, 7453, CAST(N'2022-07-03' AS Date), 3, 56738, 31)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1939, 8295, CAST(N'2022-07-03' AS Date), 2, 31065, 373)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1940, 8428, CAST(N'2022-07-03' AS Date), 3, 39966, 387)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1941, 8477, CAST(N'2022-07-03' AS Date), 3, 15156, 383)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1942, 8760, CAST(N'2022-07-03' AS Date), 3, 97299, 30)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1943, 9111, CAST(N'2022-07-03' AS Date), 3, 47767, 376)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1944, 9275, CAST(N'2022-07-03' AS Date), 3, 41466, 384)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1945, 9762, CAST(N'2022-07-03' AS Date), 2, 44008, 866)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1946, 9951, CAST(N'2022-07-03' AS Date), 1, 72371, 386)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1947, 863, CAST(N'2022-07-04' AS Date), 2, 31775, 743)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1948, 1585, CAST(N'2022-07-04' AS Date), 3, 46168, 43)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1949, 1608, CAST(N'2022-07-04' AS Date), 3, 15049, 395)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1950, 1682, CAST(N'2022-07-04' AS Date), 3, 95455, 48)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1951, 1802, CAST(N'2022-07-04' AS Date), 3, 64057, 50)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1952, 1965, CAST(N'2022-07-04' AS Date), 2, 34889, 46)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1953, 1996, CAST(N'2022-07-04' AS Date), 2, 60627, 42)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1954, 3679, CAST(N'2022-07-04' AS Date), 3, 84482, 51)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1955, 4202, CAST(N'2022-07-04' AS Date), 2, 12845, 41)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1956, 4538, CAST(N'2022-07-04' AS Date), 2, 55699, 741)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1957, 4755, CAST(N'2022-07-04' AS Date), 3, 20390, 870)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1958, 4799, CAST(N'2022-07-04' AS Date), 1, 21296, 871)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1959, 4811, CAST(N'2022-07-04' AS Date), 3, 52193, 391)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1960, 4933, CAST(N'2022-07-04' AS Date), 1, 78728, 873)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1961, 5517, CAST(N'2022-07-04' AS Date), 2, 13468, 872)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1962, 5583, CAST(N'2022-07-04' AS Date), 1, 50494, 742)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1963, 5622, CAST(N'2022-07-04' AS Date), 2, 56653, 40)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1964, 5868, CAST(N'2022-07-04' AS Date), 2, 37570, 47)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1965, 5912, CAST(N'2022-07-04' AS Date), 2, 96097, 396)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1966, 6120, CAST(N'2022-07-04' AS Date), 2, 23234, 875)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1967, 6370, CAST(N'2022-07-04' AS Date), 3, 90547, 876)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1968, 6750, CAST(N'2022-07-04' AS Date), 1, 99325, 44)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1969, 7392, CAST(N'2022-07-04' AS Date), 3, 32096, 874)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1970, 7777, CAST(N'2022-07-04' AS Date), 1, 67548, 744)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1971, 7803, CAST(N'2022-07-04' AS Date), 3, 23912, 393)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1972, 7835, CAST(N'2022-07-04' AS Date), 3, 13609, 390)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1973, 8032, CAST(N'2022-07-04' AS Date), 1, 35382, 740)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1974, 8108, CAST(N'2022-07-04' AS Date), 1, 32167, 392)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1975, 8574, CAST(N'2022-07-04' AS Date), 2, 24448, 389)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1976, 8589, CAST(N'2022-07-04' AS Date), 3, 70154, 45)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1977, 9417, CAST(N'2022-07-04' AS Date), 2, 35702, 394)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1978, 9586, CAST(N'2022-07-04' AS Date), 3, 13964, 49)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1979, 494, CAST(N'2022-07-05' AS Date), 2, 30042, 402)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1980, 553, CAST(N'2022-07-05' AS Date), 1, 97692, 746)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1981, 1818, CAST(N'2022-07-05' AS Date), 2, 87398, 406)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1982, 2175, CAST(N'2022-07-05' AS Date), 1, 68227, 401)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1983, 2361, CAST(N'2022-07-05' AS Date), 1, 85316, 409)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1984, 2584, CAST(N'2022-07-05' AS Date), 2, 35809, 54)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1985, 2977, CAST(N'2022-07-05' AS Date), 3, 47905, 63)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1986, 3051, CAST(N'2022-07-05' AS Date), 2, 13721, 67)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1987, 3577, CAST(N'2022-07-05' AS Date), 2, 24660, 400)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1988, 3619, CAST(N'2022-07-05' AS Date), 3, 29202, 56)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1989, 4357, CAST(N'2022-07-05' AS Date), 1, 75881, 747)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1990, 4386, CAST(N'2022-07-05' AS Date), 3, 74703, 64)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1991, 5047, CAST(N'2022-07-05' AS Date), 3, 54094, 65)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1992, 5060, CAST(N'2022-07-05' AS Date), 2, 97032, 58)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1993, 5176, CAST(N'2022-07-05' AS Date), 3, 82078, 879)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1994, 5338, CAST(N'2022-07-05' AS Date), 3, 2, 55)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1995, 5395, CAST(N'2022-07-05' AS Date), 1, 93344, 404)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1996, 5850, CAST(N'2022-07-05' AS Date), 3, 62541, 748)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1997, 5997, CAST(N'2022-07-05' AS Date), 2, 11331, 57)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1998, 6394, CAST(N'2022-07-05' AS Date), 3, 75899, 398)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (1999, 6521, CAST(N'2022-07-05' AS Date), 3, 10727, 405)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2000, 6766, CAST(N'2022-07-05' AS Date), 3, 38231, 403)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2001, 6840, CAST(N'2022-07-05' AS Date), 1, 65044, 397)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2002, 6879, CAST(N'2022-07-05' AS Date), 2, 74204, 745)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2003, 7155, CAST(N'2022-07-05' AS Date), 3, 99591, 53)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2004, 7220, CAST(N'2022-07-05' AS Date), 1, 10005, 59)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2005, 7441, CAST(N'2022-07-05' AS Date), 2, 21839, 62)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2006, 7488, CAST(N'2022-07-05' AS Date), 2, 38093, 61)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2007, 7548, CAST(N'2022-07-05' AS Date), 3, 53260, 66)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2008, 7655, CAST(N'2022-07-05' AS Date), 2, 14911, 410)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2009, 7720, CAST(N'2022-07-05' AS Date), 3, 30518, 407)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2010, 7871, CAST(N'2022-07-05' AS Date), 3, 41612, 878)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2011, 8102, CAST(N'2022-07-05' AS Date), 3, 45777, 411)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2012, 8316, CAST(N'2022-07-05' AS Date), 2, 74360, 52)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2013, 8880, CAST(N'2022-07-05' AS Date), 3, 32266, 60)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2014, 8926, CAST(N'2022-07-05' AS Date), 1, 68076, 408)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2015, 9894, CAST(N'2022-07-05' AS Date), 1, 86439, 399)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2016, 9964, CAST(N'2022-07-05' AS Date), 1, 89185, 877)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2017, 1086, CAST(N'2022-07-06' AS Date), 1, 87517, 414)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2018, 1454, CAST(N'2022-07-06' AS Date), 1, 77011, 412)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2019, 1513, CAST(N'2022-07-06' AS Date), 2, 52814, 880)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2020, 1514, CAST(N'2022-07-06' AS Date), 2, 30125, 884)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2021, 2170, CAST(N'2022-07-06' AS Date), 1, 53976, 68)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2022, 2197, CAST(N'2022-07-06' AS Date), 2, 36776, 425)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2023, 2288, CAST(N'2022-07-06' AS Date), 1, 88136, 883)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2024, 2320, CAST(N'2022-07-06' AS Date), 3, 33329, 423)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2025, 2595, CAST(N'2022-07-06' AS Date), 2, 47752, 413)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2026, 2841, CAST(N'2022-07-06' AS Date), 1, 24487, 76)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2027, 3139, CAST(N'2022-07-06' AS Date), 1, 17079, 78)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2028, 3557, CAST(N'2022-07-06' AS Date), 2, 29648, 416)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2029, 4064, CAST(N'2022-07-06' AS Date), 1, 88107, 419)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2030, 4238, CAST(N'2022-07-06' AS Date), 1, 74622, 415)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2031, 4289, CAST(N'2022-07-06' AS Date), 2, 72815, 73)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2032, 5723, CAST(N'2022-07-06' AS Date), 1, 57503, 422)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2033, 6033, CAST(N'2022-07-06' AS Date), 3, 47437, 70)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2034, 6255, CAST(N'2022-07-06' AS Date), 3, 66742, 882)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2035, 6724, CAST(N'2022-07-06' AS Date), 3, 89895, 421)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2036, 6810, CAST(N'2022-07-06' AS Date), 3, 38782, 71)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2037, 6817, CAST(N'2022-07-06' AS Date), 1, 78866, 424)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2038, 6823, CAST(N'2022-07-06' AS Date), 3, 90279, 69)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2039, 8077, CAST(N'2022-07-06' AS Date), 2, 58648, 72)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2040, 8706, CAST(N'2022-07-06' AS Date), 2, 95307, 417)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2041, 8829, CAST(N'2022-07-06' AS Date), 1, 72200, 75)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2042, 9218, CAST(N'2022-07-06' AS Date), 2, 50037, 420)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2043, 9396, CAST(N'2022-07-06' AS Date), 1, 51847, 418)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2044, 9483, CAST(N'2022-07-06' AS Date), 1, 89636, 77)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2045, 9598, CAST(N'2022-07-06' AS Date), 3, 83159, 881)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2046, 9634, CAST(N'2022-07-06' AS Date), 3, 80703, 74)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2047, 302, CAST(N'2022-07-07' AS Date), 1, 98259, 429)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2048, 1233, CAST(N'2022-07-07' AS Date), 1, 22955, 432)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2049, 1269, CAST(N'2022-07-07' AS Date), 2, 11195, 749)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2050, 1981, CAST(N'2022-07-07' AS Date), 2, 11567, 87)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2051, 2287, CAST(N'2022-07-07' AS Date), 2, 63777, 83)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2052, 2590, CAST(N'2022-07-07' AS Date), 1, 83658, 92)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2053, 3363, CAST(N'2022-07-07' AS Date), 1, 93567, 430)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2054, 3395, CAST(N'2022-07-07' AS Date), 3, 33615, 428)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2055, 3411, CAST(N'2022-07-07' AS Date), 3, 97827, 91)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2056, 3542, CAST(N'2022-07-07' AS Date), 1, 43173, 431)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2057, 3648, CAST(N'2022-07-07' AS Date), 2, 85105, 434)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2058, 3756, CAST(N'2022-07-07' AS Date), 2, 20690, 433)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2059, 3891, CAST(N'2022-07-07' AS Date), 2, 74254, 84)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2060, 3917, CAST(N'2022-07-07' AS Date), 1, 43818, 754)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2061, 4060, CAST(N'2022-07-07' AS Date), 2, 33194, 89)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2062, 4154, CAST(N'2022-07-07' AS Date), 1, 15630, 750)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2063, 5144, CAST(N'2022-07-07' AS Date), 2, 39847, 86)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2064, 5638, CAST(N'2022-07-07' AS Date), 2, 62213, 755)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2065, 5919, CAST(N'2022-07-07' AS Date), 1, 75799, 90)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2066, 6013, CAST(N'2022-07-07' AS Date), 2, 38413, 752)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2067, 6350, CAST(N'2022-07-07' AS Date), 2, 98412, 82)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2068, 6352, CAST(N'2022-07-07' AS Date), 2, 80027, 426)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2069, 6953, CAST(N'2022-07-07' AS Date), 2, 63501, 753)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2070, 7405, CAST(N'2022-07-07' AS Date), 3, 59920, 751)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2071, 7451, CAST(N'2022-07-07' AS Date), 3, 27587, 80)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2072, 8496, CAST(N'2022-07-07' AS Date), 2, 13003, 93)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2073, 8949, CAST(N'2022-07-07' AS Date), 3, 95524, 427)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2074, 9327, CAST(N'2022-07-07' AS Date), 3, 66053, 81)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2075, 9671, CAST(N'2022-07-07' AS Date), 3, 16678, 88)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2076, 9859, CAST(N'2022-07-07' AS Date), 3, 11706, 85)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2077, 9869, CAST(N'2022-07-07' AS Date), 2, 18680, 79)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2078, 1072, CAST(N'2022-07-08' AS Date), 3, 35926, 97)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2079, 1571, CAST(N'2022-07-08' AS Date), 3, 70433, 763)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2080, 1798, CAST(N'2022-07-08' AS Date), 1, 70019, 101)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2081, 1927, CAST(N'2022-07-08' AS Date), 1, 67799, 442)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2082, 2337, CAST(N'2022-07-08' AS Date), 2, 16950, 756)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2083, 2344, CAST(N'2022-07-08' AS Date), 2, 94170, 887)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2084, 2621, CAST(N'2022-07-08' AS Date), 3, 48723, 95)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2085, 2626, CAST(N'2022-07-08' AS Date), 3, 78667, 104)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2086, 2708, CAST(N'2022-07-08' AS Date), 2, 66296, 94)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2087, 2978, CAST(N'2022-07-08' AS Date), 3, 27902, 99)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2088, 3424, CAST(N'2022-07-08' AS Date), 2, 81553, 761)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2089, 3602, CAST(N'2022-07-08' AS Date), 3, 22561, 762)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2090, 3731, CAST(N'2022-07-08' AS Date), 3, 42669, 436)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2091, 4115, CAST(N'2022-07-08' AS Date), 2, 17623, 759)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2092, 4197, CAST(N'2022-07-08' AS Date), 3, 33437, 103)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2093, 4508, CAST(N'2022-07-08' AS Date), 3, 61318, 441)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2094, 4927, CAST(N'2022-07-08' AS Date), 3, 52743, 885)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2095, 4957, CAST(N'2022-07-08' AS Date), 1, 88567, 760)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2096, 5380, CAST(N'2022-07-08' AS Date), 2, 78950, 437)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2097, 6003, CAST(N'2022-07-08' AS Date), 1, 31334, 96)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2098, 6024, CAST(N'2022-07-08' AS Date), 3, 59591, 886)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2099, 7455, CAST(N'2022-07-08' AS Date), 3, 86595, 444)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2100, 7714, CAST(N'2022-07-08' AS Date), 1, 43854, 440)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2101, 7813, CAST(N'2022-07-08' AS Date), 3, 95619, 438)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2102, 7964, CAST(N'2022-07-08' AS Date), 2, 33406, 443)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2103, 8091, CAST(N'2022-07-08' AS Date), 1, 96307, 446)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2104, 8193, CAST(N'2022-07-08' AS Date), 3, 87004, 758)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2105, 8345, CAST(N'2022-07-08' AS Date), 2, 17432, 757)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2106, 8622, CAST(N'2022-07-08' AS Date), 3, 78962, 445)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2107, 8855, CAST(N'2022-07-08' AS Date), 2, 72383, 98)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2108, 8973, CAST(N'2022-07-08' AS Date), 1, 42983, 102)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2109, 9095, CAST(N'2022-07-08' AS Date), 2, 37054, 100)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2110, 9532, CAST(N'2022-07-08' AS Date), 1, 44932, 435)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2111, 9777, CAST(N'2022-07-08' AS Date), 2, 37112, 439)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2112, 669, CAST(N'2022-07-09' AS Date), 1, 37535, 890)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2113, 1396, CAST(N'2022-07-09' AS Date), 1, 95274, 768)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2114, 1455, CAST(N'2022-07-09' AS Date), 2, 70320, 109)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2115, 1664, CAST(N'2022-07-09' AS Date), 1, 64163, 118)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2116, 1923, CAST(N'2022-07-09' AS Date), 1, 91745, 116)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2117, 2120, CAST(N'2022-07-09' AS Date), 2, 72886, 767)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2118, 2234, CAST(N'2022-07-09' AS Date), 1, 41718, 891)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2119, 2347, CAST(N'2022-07-09' AS Date), 3, 92420, 453)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2120, 2360, CAST(N'2022-07-09' AS Date), 2, 93763, 105)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2121, 2527, CAST(N'2022-07-09' AS Date), 2, 28943, 448)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2122, 3242, CAST(N'2022-07-09' AS Date), 3, 67285, 893)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2123, 3272, CAST(N'2022-07-09' AS Date), 1, 92752, 459)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2124, 3337, CAST(N'2022-07-09' AS Date), 1, 55480, 766)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2125, 3454, CAST(N'2022-07-09' AS Date), 1, 61620, 112)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2126, 3468, CAST(N'2022-07-09' AS Date), 3, 85519, 113)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2127, 3840, CAST(N'2022-07-09' AS Date), 3, 37259, 764)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2128, 3885, CAST(N'2022-07-09' AS Date), 2, 26655, 458)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2129, 3936, CAST(N'2022-07-09' AS Date), 1, 38650, 106)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2130, 4299, CAST(N'2022-07-09' AS Date), 1, 33914, 460)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2131, 4672, CAST(N'2022-07-09' AS Date), 1, 88862, 107)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2132, 5052, CAST(N'2022-07-09' AS Date), 3, 48108, 452)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2133, 5722, CAST(N'2022-07-09' AS Date), 2, 36806, 454)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2134, 5732, CAST(N'2022-07-09' AS Date), 2, 97008, 117)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2135, 6290, CAST(N'2022-07-09' AS Date), 2, 62704, 110)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2136, 6605, CAST(N'2022-07-09' AS Date), 3, 28779, 115)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2137, 6672, CAST(N'2022-07-09' AS Date), 3, 15037, 114)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2138, 6931, CAST(N'2022-07-09' AS Date), 3, 35093, 770)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2139, 7020, CAST(N'2022-07-09' AS Date), 2, 36269, 765)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2140, 7070, CAST(N'2022-07-09' AS Date), 3, 33314, 447)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2141, 7219, CAST(N'2022-07-09' AS Date), 2, 44157, 888)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2142, 7415, CAST(N'2022-07-09' AS Date), 2, 52117, 457)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2143, 7757, CAST(N'2022-07-09' AS Date), 1, 15965, 889)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2144, 7921, CAST(N'2022-07-09' AS Date), 2, 80380, 456)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2145, 7937, CAST(N'2022-07-09' AS Date), 2, 60768, 449)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2146, 7955, CAST(N'2022-07-09' AS Date), 2, 58266, 892)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2147, 8393, CAST(N'2022-07-09' AS Date), 1, 79539, 451)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2148, 8486, CAST(N'2022-07-09' AS Date), 3, 16691, 111)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2149, 8830, CAST(N'2022-07-09' AS Date), 1, 78639, 108)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2150, 9493, CAST(N'2022-07-09' AS Date), 3, 82508, 450)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2151, 9620, CAST(N'2022-07-09' AS Date), 1, 98687, 769)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2152, 9885, CAST(N'2022-07-09' AS Date), 1, 68321, 894)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2153, 9978, CAST(N'2022-07-09' AS Date), 2, 18939, 455)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2154, 1006, CAST(N'2022-07-10' AS Date), 3, 30295, 131)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2155, 1450, CAST(N'2022-07-10' AS Date), 1, 82573, 462)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2156, 1796, CAST(N'2022-07-10' AS Date), 1, 72204, 468)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2157, 1989, CAST(N'2022-07-10' AS Date), 1, 62220, 461)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2158, 2033, CAST(N'2022-07-10' AS Date), 2, 34413, 120)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2159, 2339, CAST(N'2022-07-10' AS Date), 3, 66169, 121)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2160, 3005, CAST(N'2022-07-10' AS Date), 1, 60140, 128)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2161, 3123, CAST(N'2022-07-10' AS Date), 3, 71837, 772)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2162, 3174, CAST(N'2022-07-10' AS Date), 3, 30847, 126)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2163, 3350, CAST(N'2022-07-10' AS Date), 2, 90137, 129)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2164, 3441, CAST(N'2022-07-10' AS Date), 2, 94619, 465)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2165, 3660, CAST(N'2022-07-10' AS Date), 2, 15803, 127)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2166, 4553, CAST(N'2022-07-10' AS Date), 3, 13849, 122)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2167, 4782, CAST(N'2022-07-10' AS Date), 2, 37289, 466)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2168, 4922, CAST(N'2022-07-10' AS Date), 2, 76256, 463)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2169, 6343, CAST(N'2022-07-10' AS Date), 1, 31950, 119)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2170, 6709, CAST(N'2022-07-10' AS Date), 3, 49157, 125)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2171, 7287, CAST(N'2022-07-10' AS Date), 2, 68567, 771)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2172, 7294, CAST(N'2022-07-10' AS Date), 2, 33880, 773)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2173, 7560, CAST(N'2022-07-10' AS Date), 1, 61051, 467)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2174, 7590, CAST(N'2022-07-10' AS Date), 1, 45860, 464)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2175, 7650, CAST(N'2022-07-10' AS Date), 3, 49764, 123)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2176, 8662, CAST(N'2022-07-10' AS Date), 3, 54320, 130)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2177, 8741, CAST(N'2022-07-10' AS Date), 1, 83336, 124)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2178, 9972, CAST(N'2022-07-10' AS Date), 1, 32986, 469)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2179, 973, CAST(N'2022-07-11' AS Date), 2, 63460, 472)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2180, 1191, CAST(N'2022-07-11' AS Date), 2, 69048, 140)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2181, 1310, CAST(N'2022-07-11' AS Date), 3, 16150, 774)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2182, 1449, CAST(N'2022-07-11' AS Date), 2, 94205, 475)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2183, 1491, CAST(N'2022-07-11' AS Date), 2, 56984, 470)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2184, 2031, CAST(N'2022-07-11' AS Date), 1, 12418, 476)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2185, 2758, CAST(N'2022-07-11' AS Date), 1, 80306, 141)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2186, 3039, CAST(N'2022-07-11' AS Date), 1, 51521, 473)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2187, 4016, CAST(N'2022-07-11' AS Date), 1, 76652, 142)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2188, 4038, CAST(N'2022-07-11' AS Date), 1, 23571, 895)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2189, 4354, CAST(N'2022-07-11' AS Date), 2, 85911, 139)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2190, 4521, CAST(N'2022-07-11' AS Date), 3, 25812, 133)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2191, 4907, CAST(N'2022-07-11' AS Date), 3, 48657, 775)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2192, 5235, CAST(N'2022-07-11' AS Date), 1, 67295, 474)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2193, 5466, CAST(N'2022-07-11' AS Date), 3, 17941, 143)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2194, 5589, CAST(N'2022-07-11' AS Date), 2, 28867, 137)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2195, 7079, CAST(N'2022-07-11' AS Date), 3, 81308, 138)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2196, 7105, CAST(N'2022-07-11' AS Date), 1, 18406, 136)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2197, 7259, CAST(N'2022-07-11' AS Date), 2, 19206, 132)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2198, 7526, CAST(N'2022-07-11' AS Date), 1, 70790, 134)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2199, 7633, CAST(N'2022-07-11' AS Date), 3, 99769, 471)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2200, 7913, CAST(N'2022-07-11' AS Date), 3, 28553, 776)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2201, 8314, CAST(N'2022-07-11' AS Date), 3, 17842, 896)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2202, 8335, CAST(N'2022-07-11' AS Date), 1, 45706, 135)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2203, 753, CAST(N'2022-07-12' AS Date), 2, 14779, 484)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2204, 1023, CAST(N'2022-07-12' AS Date), 2, 90498, 480)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2205, 1347, CAST(N'2022-07-12' AS Date), 1, 76975, 483)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2206, 1384, CAST(N'2022-07-12' AS Date), 1, 80451, 150)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2207, 1563, CAST(N'2022-07-12' AS Date), 2, 24779, 897)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2208, 3060, CAST(N'2022-07-12' AS Date), 2, 18178, 146)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2209, 3221, CAST(N'2022-07-12' AS Date), 3, 44794, 485)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2210, 3289, CAST(N'2022-07-12' AS Date), 2, 28287, 145)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2211, 3351, CAST(N'2022-07-12' AS Date), 3, 31699, 155)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2212, 3727, CAST(N'2022-07-12' AS Date), 2, 65559, 481)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2213, 4034, CAST(N'2022-07-12' AS Date), 3, 54695, 144)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2214, 4209, CAST(N'2022-07-12' AS Date), 1, 40114, 488)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2215, 4412, CAST(N'2022-07-12' AS Date), 1, 45392, 148)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2216, 4473, CAST(N'2022-07-12' AS Date), 3, 63745, 898)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2217, 4577, CAST(N'2022-07-12' AS Date), 3, 25823, 156)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2218, 4631, CAST(N'2022-07-12' AS Date), 2, 58595, 151)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2219, 4800, CAST(N'2022-07-12' AS Date), 1, 76143, 482)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2220, 5026, CAST(N'2022-07-12' AS Date), 1, 77409, 479)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2221, 5106, CAST(N'2022-07-12' AS Date), 2, 32830, 899)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2222, 5540, CAST(N'2022-07-12' AS Date), 2, 38899, 477)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2223, 5800, CAST(N'2022-07-12' AS Date), 1, 91703, 153)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2224, 6076, CAST(N'2022-07-12' AS Date), 3, 80219, 149)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2225, 6285, CAST(N'2022-07-12' AS Date), 3, 16725, 147)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2226, 6685, CAST(N'2022-07-12' AS Date), 3, 37139, 154)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2227, 7330, CAST(N'2022-07-12' AS Date), 3, 23550, 486)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2228, 7926, CAST(N'2022-07-12' AS Date), 1, 52230, 478)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2229, 8009, CAST(N'2022-07-12' AS Date), 1, 34887, 152)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2230, 9879, CAST(N'2022-07-12' AS Date), 3, 30438, 487)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2231, 9897, CAST(N'2022-07-12' AS Date), 3, 19001, 489)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2232, 275, CAST(N'2022-07-13' AS Date), 1, 41299, 492)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2233, 723, CAST(N'2022-07-13' AS Date), 1, 34303, 902)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2234, 1110, CAST(N'2022-07-13' AS Date), 3, 38882, 499)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2235, 1224, CAST(N'2022-07-13' AS Date), 2, 30215, 777)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2236, 1541, CAST(N'2022-07-13' AS Date), 1, 47762, 780)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2237, 1568, CAST(N'2022-07-13' AS Date), 3, 31367, 781)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2238, 1970, CAST(N'2022-07-13' AS Date), 1, 36435, 903)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2239, 2208, CAST(N'2022-07-13' AS Date), 2, 71843, 161)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2240, 3273, CAST(N'2022-07-13' AS Date), 3, 53770, 496)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2241, 3288, CAST(N'2022-07-13' AS Date), 3, 17390, 160)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2242, 5497, CAST(N'2022-07-13' AS Date), 1, 52649, 500)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2243, 5631, CAST(N'2022-07-13' AS Date), 2, 63245, 157)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2244, 5639, CAST(N'2022-07-13' AS Date), 2, 67183, 778)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2245, 5760, CAST(N'2022-07-13' AS Date), 2, 38240, 494)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2246, 5816, CAST(N'2022-07-13' AS Date), 1, 15308, 493)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2247, 6056, CAST(N'2022-07-13' AS Date), 2, 59762, 491)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2248, 6198, CAST(N'2022-07-13' AS Date), 1, 87486, 901)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2249, 7568, CAST(N'2022-07-13' AS Date), 3, 57621, 498)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2250, 7591, CAST(N'2022-07-13' AS Date), 2, 41402, 497)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2251, 7611, CAST(N'2022-07-13' AS Date), 2, 97646, 159)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2252, 7746, CAST(N'2022-07-13' AS Date), 1, 79578, 495)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2253, 7993, CAST(N'2022-07-13' AS Date), 3, 61781, 779)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2254, 8111, CAST(N'2022-07-13' AS Date), 1, 87166, 490)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2255, 9165, CAST(N'2022-07-13' AS Date), 2, 26132, 900)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2256, 9796, CAST(N'2022-07-13' AS Date), 2, 79041, 158)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2257, 1887, CAST(N'2022-07-14' AS Date), 1, 78124, 908)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2258, 1941, CAST(N'2022-07-14' AS Date), 1, 70158, 172)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2259, 2182, CAST(N'2022-07-14' AS Date), 1, 74909, 906)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2260, 2419, CAST(N'2022-07-14' AS Date), 1, 16466, 904)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2261, 3113, CAST(N'2022-07-14' AS Date), 3, 89250, 165)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2262, 3462, CAST(N'2022-07-14' AS Date), 2, 79622, 171)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2263, 3817, CAST(N'2022-07-14' AS Date), 3, 82388, 508)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2264, 4012, CAST(N'2022-07-14' AS Date), 1, 81321, 505)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2265, 4205, CAST(N'2022-07-14' AS Date), 2, 14653, 162)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2266, 4457, CAST(N'2022-07-14' AS Date), 1, 15981, 509)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2267, 4533, CAST(N'2022-07-14' AS Date), 2, 54461, 905)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2268, 4627, CAST(N'2022-07-14' AS Date), 3, 92387, 166)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2269, 4680, CAST(N'2022-07-14' AS Date), 2, 69752, 167)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2270, 5161, CAST(N'2022-07-14' AS Date), 1, 90192, 169)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2271, 5843, CAST(N'2022-07-14' AS Date), 1, 56834, 503)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2272, 5881, CAST(N'2022-07-14' AS Date), 3, 85317, 506)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2273, 6866, CAST(N'2022-07-14' AS Date), 1, 61171, 164)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2274, 7119, CAST(N'2022-07-14' AS Date), 3, 97729, 501)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2275, 7245, CAST(N'2022-07-14' AS Date), 2, 12927, 170)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2276, 7278, CAST(N'2022-07-14' AS Date), 3, 91534, 168)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2277, 7431, CAST(N'2022-07-14' AS Date), 2, 49247, 907)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2278, 8125, CAST(N'2022-07-14' AS Date), 2, 51261, 504)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2279, 8954, CAST(N'2022-07-14' AS Date), 2, 95400, 502)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2280, 9225, CAST(N'2022-07-14' AS Date), 2, 56189, 163)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2281, 9932, CAST(N'2022-07-14' AS Date), 1, 50246, 507)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2282, 1024, CAST(N'2022-07-15' AS Date), 1, 33050, 173)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2283, 1627, CAST(N'2022-07-15' AS Date), 2, 34746, 515)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2284, 1632, CAST(N'2022-07-15' AS Date), 3, 72508, 177)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2285, 1693, CAST(N'2022-07-15' AS Date), 2, 86505, 517)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2286, 1694, CAST(N'2022-07-15' AS Date), 3, 38537, 181)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2287, 1767, CAST(N'2022-07-15' AS Date), 1, 19083, 912)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2288, 2099, CAST(N'2022-07-15' AS Date), 1, 10358, 516)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2289, 2154, CAST(N'2022-07-15' AS Date), 1, 82441, 522)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2290, 2667, CAST(N'2022-07-15' AS Date), 1, 23846, 787)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2291, 2767, CAST(N'2022-07-15' AS Date), 2, 15575, 914)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2292, 2831, CAST(N'2022-07-15' AS Date), 2, 28438, 523)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2293, 3247, CAST(N'2022-07-15' AS Date), 2, 56031, 175)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2294, 3430, CAST(N'2022-07-15' AS Date), 1, 44569, 513)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2295, 3752, CAST(N'2022-07-15' AS Date), 3, 66881, 783)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2296, 4918, CAST(N'2022-07-15' AS Date), 2, 24105, 785)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2297, 4971, CAST(N'2022-07-15' AS Date), 1, 80871, 915)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2298, 5283, CAST(N'2022-07-15' AS Date), 2, 42815, 518)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2299, 5330, CAST(N'2022-07-15' AS Date), 3, 45198, 180)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2300, 5373, CAST(N'2022-07-15' AS Date), 2, 51042, 174)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2301, 5704, CAST(N'2022-07-15' AS Date), 3, 89859, 910)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2302, 6032, CAST(N'2022-07-15' AS Date), 3, 28796, 510)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2303, 6096, CAST(N'2022-07-15' AS Date), 2, 63964, 524)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2304, 6161, CAST(N'2022-07-15' AS Date), 1, 69318, 178)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2305, 6367, CAST(N'2022-07-15' AS Date), 1, 70593, 911)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2306, 6643, CAST(N'2022-07-15' AS Date), 3, 87837, 520)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2307, 7100, CAST(N'2022-07-15' AS Date), 3, 85311, 789)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2308, 7106, CAST(N'2022-07-15' AS Date), 3, 15156, 519)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2309, 7182, CAST(N'2022-07-15' AS Date), 1, 22691, 786)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2310, 7201, CAST(N'2022-07-15' AS Date), 3, 34399, 511)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2311, 7242, CAST(N'2022-07-15' AS Date), 1, 24886, 521)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2312, 7261, CAST(N'2022-07-15' AS Date), 2, 97912, 909)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2313, 7552, CAST(N'2022-07-15' AS Date), 3, 35550, 916)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2314, 7570, CAST(N'2022-07-15' AS Date), 1, 86687, 176)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2315, 8277, CAST(N'2022-07-15' AS Date), 1, 58721, 784)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2316, 8315, CAST(N'2022-07-15' AS Date), 2, 63329, 782)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2317, 8414, CAST(N'2022-07-15' AS Date), 2, 77188, 913)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2318, 9021, CAST(N'2022-07-15' AS Date), 2, 16029, 788)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2319, 9132, CAST(N'2022-07-15' AS Date), 2, 88382, 514)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2320, 9178, CAST(N'2022-07-15' AS Date), 2, 66751, 179)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2321, 9288, CAST(N'2022-07-15' AS Date), 2, 63636, 512)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2322, 541, CAST(N'2022-07-16' AS Date), 2, 20775, 918)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2323, 1295, CAST(N'2022-07-16' AS Date), 1, 41118, 920)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2324, 1644, CAST(N'2022-07-16' AS Date), 3, 69734, 528)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2325, 3349, CAST(N'2022-07-16' AS Date), 3, 61461, 191)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2326, 3729, CAST(N'2022-07-16' AS Date), 2, 20297, 192)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2327, 3761, CAST(N'2022-07-16' AS Date), 2, 71446, 185)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2328, 3977, CAST(N'2022-07-16' AS Date), 2, 70050, 184)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2329, 4149, CAST(N'2022-07-16' AS Date), 3, 74074, 530)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2330, 4274, CAST(N'2022-07-16' AS Date), 3, 61935, 791)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2331, 4630, CAST(N'2022-07-16' AS Date), 2, 87287, 790)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2332, 4924, CAST(N'2022-07-16' AS Date), 3, 20939, 187)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2333, 5950, CAST(N'2022-07-16' AS Date), 1, 47619, 526)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2334, 6274, CAST(N'2022-07-16' AS Date), 1, 72161, 188)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2335, 6498, CAST(N'2022-07-16' AS Date), 2, 38055, 529)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2336, 7052, CAST(N'2022-07-16' AS Date), 3, 16254, 193)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2337, 7204, CAST(N'2022-07-16' AS Date), 1, 82527, 917)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2338, 7429, CAST(N'2022-07-16' AS Date), 3, 71322, 531)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2339, 7779, CAST(N'2022-07-16' AS Date), 2, 35441, 186)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2340, 8661, CAST(N'2022-07-16' AS Date), 1, 26150, 183)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2341, 8866, CAST(N'2022-07-16' AS Date), 1, 81434, 182)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2342, 9391, CAST(N'2022-07-16' AS Date), 2, 74974, 189)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2343, 9430, CAST(N'2022-07-16' AS Date), 2, 26482, 190)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2344, 9644, CAST(N'2022-07-16' AS Date), 3, 89993, 525)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2345, 9811, CAST(N'2022-07-16' AS Date), 1, 61896, 919)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2346, 9815, CAST(N'2022-07-16' AS Date), 1, 95322, 527)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2347, 1205, CAST(N'2022-07-17' AS Date), 2, 87080, 793)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2348, 1525, CAST(N'2022-07-17' AS Date), 1, 53013, 540)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2349, 1765, CAST(N'2022-07-17' AS Date), 1, 54080, 796)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2350, 1833, CAST(N'2022-07-17' AS Date), 2, 40855, 534)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2351, 1960, CAST(N'2022-07-17' AS Date), 2, 20140, 535)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2352, 2638, CAST(N'2022-07-17' AS Date), 2, 91282, 922)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2353, 2971, CAST(N'2022-07-17' AS Date), 3, 50646, 923)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2354, 3020, CAST(N'2022-07-17' AS Date), 3, 78449, 797)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2355, 3099, CAST(N'2022-07-17' AS Date), 2, 23366, 921)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2356, 3743, CAST(N'2022-07-17' AS Date), 2, 55864, 196)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2357, 4524, CAST(N'2022-07-17' AS Date), 1, 88774, 202)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2358, 4947, CAST(N'2022-07-17' AS Date), 2, 28808, 541)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2359, 5103, CAST(N'2022-07-17' AS Date), 3, 51855, 199)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2360, 5152, CAST(N'2022-07-17' AS Date), 3, 65440, 201)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2361, 5490, CAST(N'2022-07-17' AS Date), 1, 45626, 532)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2362, 5650, CAST(N'2022-07-17' AS Date), 3, 15866, 194)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2363, 6930, CAST(N'2022-07-17' AS Date), 2, 33589, 536)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2364, 6999, CAST(N'2022-07-17' AS Date), 1, 54724, 200)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2365, 7104, CAST(N'2022-07-17' AS Date), 3, 46893, 533)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2366, 7509, CAST(N'2022-07-17' AS Date), 3, 50827, 198)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2367, 7628, CAST(N'2022-07-17' AS Date), 1, 55851, 543)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2368, 7709, CAST(N'2022-07-17' AS Date), 1, 96953, 539)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2369, 7718, CAST(N'2022-07-17' AS Date), 3, 63734, 798)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2370, 7975, CAST(N'2022-07-17' AS Date), 1, 18141, 544)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2371, 8063, CAST(N'2022-07-17' AS Date), 2, 31077, 538)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2372, 8603, CAST(N'2022-07-17' AS Date), 3, 14044, 542)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2373, 8719, CAST(N'2022-07-17' AS Date), 3, 51767, 197)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2374, 9371, CAST(N'2022-07-17' AS Date), 1, 25711, 792)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2375, 9632, CAST(N'2022-07-17' AS Date), 3, 26620, 537)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2376, 9753, CAST(N'2022-07-17' AS Date), 3, 26649, 195)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2377, 9789, CAST(N'2022-07-17' AS Date), 1, 72086, 795)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2378, 9827, CAST(N'2022-07-17' AS Date), 1, 78377, 794)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2379, 1036, CAST(N'2022-07-18' AS Date), 1, 44302, 210)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2380, 1374, CAST(N'2022-07-18' AS Date), 3, 23727, 549)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2381, 2438, CAST(N'2022-07-18' AS Date), 1, 39963, 548)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2382, 2764, CAST(N'2022-07-18' AS Date), 1, 18461, 926)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2383, 3296, CAST(N'2022-07-18' AS Date), 2, 98689, 925)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2384, 3361, CAST(N'2022-07-18' AS Date), 3, 42616, 924)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2385, 3526, CAST(N'2022-07-18' AS Date), 1, 33775, 800)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2386, 3896, CAST(N'2022-07-18' AS Date), 3, 61957, 802)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2387, 4121, CAST(N'2022-07-18' AS Date), 2, 26105, 206)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2388, 5175, CAST(N'2022-07-18' AS Date), 2, 51294, 546)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2389, 5426, CAST(N'2022-07-18' AS Date), 1, 60428, 551)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2390, 5588, CAST(N'2022-07-18' AS Date), 2, 37681, 799)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2391, 5696, CAST(N'2022-07-18' AS Date), 3, 42457, 547)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2392, 5861, CAST(N'2022-07-18' AS Date), 3, 46110, 801)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2393, 5986, CAST(N'2022-07-18' AS Date), 3, 68742, 205)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2394, 6123, CAST(N'2022-07-18' AS Date), 2, 52357, 211)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2395, 6220, CAST(N'2022-07-18' AS Date), 1, 16926, 552)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2396, 6326, CAST(N'2022-07-18' AS Date), 1, 41916, 927)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2397, 6654, CAST(N'2022-07-18' AS Date), 3, 93506, 553)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2398, 7420, CAST(N'2022-07-18' AS Date), 1, 77321, 203)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2399, 8037, CAST(N'2022-07-18' AS Date), 3, 66855, 209)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2400, 8189, CAST(N'2022-07-18' AS Date), 1, 81594, 207)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2401, 8299, CAST(N'2022-07-18' AS Date), 2, 40579, 545)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2402, 8607, CAST(N'2022-07-18' AS Date), 3, 12503, 204)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2403, 8970, CAST(N'2022-07-18' AS Date), 1, 42794, 208)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2404, 9469, CAST(N'2022-07-18' AS Date), 2, 85812, 550)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2405, 605, CAST(N'2022-07-19' AS Date), 2, 34669, 558)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2406, 1215, CAST(N'2022-07-19' AS Date), 3, 23005, 556)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2407, 1849, CAST(N'2022-07-19' AS Date), 3, 29732, 560)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2408, 1852, CAST(N'2022-07-19' AS Date), 2, 47968, 568)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2409, 2236, CAST(N'2022-07-19' AS Date), 1, 27126, 559)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2410, 2315, CAST(N'2022-07-19' AS Date), 1, 48929, 804)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2411, 2904, CAST(N'2022-07-19' AS Date), 2, 55029, 215)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2412, 2932, CAST(N'2022-07-19' AS Date), 3, 31485, 563)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2413, 3258, CAST(N'2022-07-19' AS Date), 3, 99096, 561)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2414, 3452, CAST(N'2022-07-19' AS Date), 2, 48391, 928)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2415, 3691, CAST(N'2022-07-19' AS Date), 3, 54530, 221)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2416, 4180, CAST(N'2022-07-19' AS Date), 2, 45906, 220)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2417, 4993, CAST(N'2022-07-19' AS Date), 1, 45693, 555)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2418, 5344, CAST(N'2022-07-19' AS Date), 2, 55076, 214)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2419, 5526, CAST(N'2022-07-19' AS Date), 1, 83597, 217)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2420, 5711, CAST(N'2022-07-19' AS Date), 2, 78389, 805)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2421, 5714, CAST(N'2022-07-19' AS Date), 1, 10167, 807)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2422, 5844, CAST(N'2022-07-19' AS Date), 1, 10041, 566)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2423, 6468, CAST(N'2022-07-19' AS Date), 1, 71030, 567)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2424, 6896, CAST(N'2022-07-19' AS Date), 3, 28082, 564)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2425, 6978, CAST(N'2022-07-19' AS Date), 2, 68936, 803)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2426, 7319, CAST(N'2022-07-19' AS Date), 3, 96312, 806)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2427, 7480, CAST(N'2022-07-19' AS Date), 1, 80175, 565)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2428, 7495, CAST(N'2022-07-19' AS Date), 1, 37988, 219)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2429, 8069, CAST(N'2022-07-19' AS Date), 1, 36079, 569)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2430, 8212, CAST(N'2022-07-19' AS Date), 1, 49006, 562)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2431, 8444, CAST(N'2022-07-19' AS Date), 1, 27761, 557)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2432, 8458, CAST(N'2022-07-19' AS Date), 1, 68530, 213)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2433, 8464, CAST(N'2022-07-19' AS Date), 2, 93642, 554)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2434, 9179, CAST(N'2022-07-19' AS Date), 1, 71740, 929)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2435, 9516, CAST(N'2022-07-19' AS Date), 2, 95813, 218)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2436, 9673, CAST(N'2022-07-19' AS Date), 1, 58955, 216)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2437, 9694, CAST(N'2022-07-19' AS Date), 3, 24617, 212)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2438, 341, CAST(N'2022-07-20' AS Date), 3, 97570, 579)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2439, 1031, CAST(N'2022-07-20' AS Date), 2, 39304, 930)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2440, 1111, CAST(N'2022-07-20' AS Date), 2, 65408, 931)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2441, 1232, CAST(N'2022-07-20' AS Date), 1, 99318, 573)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2442, 2426, CAST(N'2022-07-20' AS Date), 3, 65088, 225)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2443, 2452, CAST(N'2022-07-20' AS Date), 3, 56268, 222)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2444, 2636, CAST(N'2022-07-20' AS Date), 2, 37523, 224)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2445, 4166, CAST(N'2022-07-20' AS Date), 3, 64423, 576)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2446, 4618, CAST(N'2022-07-20' AS Date), 2, 40528, 571)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2447, 4658, CAST(N'2022-07-20' AS Date), 1, 31482, 572)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2448, 4917, CAST(N'2022-07-20' AS Date), 2, 67933, 226)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2449, 4974, CAST(N'2022-07-20' AS Date), 2, 40099, 932)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2450, 5563, CAST(N'2022-07-20' AS Date), 1, 38816, 575)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2451, 6245, CAST(N'2022-07-20' AS Date), 2, 47621, 570)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2452, 7349, CAST(N'2022-07-20' AS Date), 3, 44141, 580)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2453, 8010, CAST(N'2022-07-20' AS Date), 2, 29882, 228)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2454, 8497, CAST(N'2022-07-20' AS Date), 2, 78873, 229)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2455, 8694, CAST(N'2022-07-20' AS Date), 2, 63316, 578)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2456, 8870, CAST(N'2022-07-20' AS Date), 3, 69173, 577)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2457, 9037, CAST(N'2022-07-20' AS Date), 2, 30552, 227)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2458, 9794, CAST(N'2022-07-20' AS Date), 3, 90026, 223)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2459, 9969, CAST(N'2022-07-20' AS Date), 2, 96581, 574)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2460, 1163, CAST(N'2022-07-21' AS Date), 2, 44558, 815)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2461, 1240, CAST(N'2022-07-21' AS Date), 3, 95645, 811)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2462, 1663, CAST(N'2022-07-21' AS Date), 3, 74731, 934)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2463, 1773, CAST(N'2022-07-21' AS Date), 2, 44633, 587)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2464, 1801, CAST(N'2022-07-21' AS Date), 3, 38722, 231)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2465, 1948, CAST(N'2022-07-21' AS Date), 1, 99175, 585)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2466, 2241, CAST(N'2022-07-21' AS Date), 3, 25414, 583)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2467, 2482, CAST(N'2022-07-21' AS Date), 2, 87833, 238)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2468, 2749, CAST(N'2022-07-21' AS Date), 3, 38998, 237)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2469, 2921, CAST(N'2022-07-21' AS Date), 2, 20052, 243)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2470, 3282, CAST(N'2022-07-21' AS Date), 3, 60212, 810)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2471, 3902, CAST(N'2022-07-21' AS Date), 3, 26845, 590)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2472, 4291, CAST(N'2022-07-21' AS Date), 1, 21496, 236)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2473, 4500, CAST(N'2022-07-21' AS Date), 3, 64131, 584)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2474, 4756, CAST(N'2022-07-21' AS Date), 2, 59610, 589)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2475, 4806, CAST(N'2022-07-21' AS Date), 2, 17594, 808)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2476, 5063, CAST(N'2022-07-21' AS Date), 1, 78479, 239)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2477, 5230, CAST(N'2022-07-21' AS Date), 1, 97812, 814)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2478, 5239, CAST(N'2022-07-21' AS Date), 3, 95906, 230)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2479, 5343, CAST(N'2022-07-21' AS Date), 1, 79154, 813)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2480, 5871, CAST(N'2022-07-21' AS Date), 2, 13724, 240)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2481, 5981, CAST(N'2022-07-21' AS Date), 2, 49060, 812)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2482, 6334, CAST(N'2022-07-21' AS Date), 1, 14132, 234)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2483, 6602, CAST(N'2022-07-21' AS Date), 1, 38581, 933)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2484, 7223, CAST(N'2022-07-21' AS Date), 3, 96649, 232)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2485, 7540, CAST(N'2022-07-21' AS Date), 2, 60955, 242)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2486, 7597, CAST(N'2022-07-21' AS Date), 1, 42120, 244)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2487, 7694, CAST(N'2022-07-21' AS Date), 2, 33288, 582)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2488, 7900, CAST(N'2022-07-21' AS Date), 2, 26113, 241)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2489, 7965, CAST(N'2022-07-21' AS Date), 3, 91895, 586)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2490, 8002, CAST(N'2022-07-21' AS Date), 3, 53687, 809)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2491, 8883, CAST(N'2022-07-21' AS Date), 1, 15543, 588)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2492, 9163, CAST(N'2022-07-21' AS Date), 3, 88760, 581)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2493, 9384, CAST(N'2022-07-21' AS Date), 1, 14106, 233)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2494, 9504, CAST(N'2022-07-21' AS Date), 3, 97276, 235)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2495, 1049, CAST(N'2022-07-22' AS Date), 3, 46840, 594)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2496, 1533, CAST(N'2022-07-22' AS Date), 3, 25503, 817)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2497, 1916, CAST(N'2022-07-22' AS Date), 1, 28107, 256)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2498, 1926, CAST(N'2022-07-22' AS Date), 1, 29444, 249)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2499, 1942, CAST(N'2022-07-22' AS Date), 1, 68561, 251)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2500, 1975, CAST(N'2022-07-22' AS Date), 3, 93599, 248)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2501, 2489, CAST(N'2022-07-22' AS Date), 1, 18094, 818)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2502, 2862, CAST(N'2022-07-22' AS Date), 3, 18585, 597)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2503, 3118, CAST(N'2022-07-22' AS Date), 1, 42319, 250)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2504, 3176, CAST(N'2022-07-22' AS Date), 3, 50199, 245)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2505, 3362, CAST(N'2022-07-22' AS Date), 2, 83619, 599)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2506, 4331, CAST(N'2022-07-22' AS Date), 3, 97387, 252)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2507, 4611, CAST(N'2022-07-22' AS Date), 3, 72381, 255)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2508, 5035, CAST(N'2022-07-22' AS Date), 3, 21646, 598)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2509, 5738, CAST(N'2022-07-22' AS Date), 3, 21690, 593)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2510, 5787, CAST(N'2022-07-22' AS Date), 2, 88894, 253)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2511, 6062, CAST(N'2022-07-22' AS Date), 2, 27243, 257)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2512, 6170, CAST(N'2022-07-22' AS Date), 1, 32725, 246)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2513, 6317, CAST(N'2022-07-22' AS Date), 3, 26238, 816)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2514, 6396, CAST(N'2022-07-22' AS Date), 3, 77440, 247)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2515, 6434, CAST(N'2022-07-22' AS Date), 2, 78930, 819)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2516, 6669, CAST(N'2022-07-22' AS Date), 1, 58809, 592)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2517, 7058, CAST(N'2022-07-22' AS Date), 3, 93895, 820)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2518, 7168, CAST(N'2022-07-22' AS Date), 2, 14824, 596)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2519, 7914, CAST(N'2022-07-22' AS Date), 3, 20458, 935)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2520, 9196, CAST(N'2022-07-22' AS Date), 2, 99446, 600)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2521, 9587, CAST(N'2022-07-22' AS Date), 2, 24490, 591)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2522, 9741, CAST(N'2022-07-22' AS Date), 3, 92433, 254)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2523, 9984, CAST(N'2022-07-22' AS Date), 3, 80498, 595)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2524, 475, CAST(N'2022-07-23' AS Date), 3, 13016, 605)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2525, 956, CAST(N'2022-07-23' AS Date), 1, 74976, 936)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2526, 1259, CAST(N'2022-07-23' AS Date), 2, 34359, 261)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2527, 1534, CAST(N'2022-07-23' AS Date), 2, 71574, 263)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2528, 1629, CAST(N'2022-07-23' AS Date), 1, 86411, 938)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2529, 2076, CAST(N'2022-07-23' AS Date), 3, 61843, 939)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2530, 3042, CAST(N'2022-07-23' AS Date), 3, 14626, 264)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2531, 3277, CAST(N'2022-07-23' AS Date), 3, 95831, 615)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2532, 3459, CAST(N'2022-07-23' AS Date), 1, 55122, 608)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2533, 3612, CAST(N'2022-07-23' AS Date), 1, 30122, 606)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2534, 3725, CAST(N'2022-07-23' AS Date), 3, 49142, 611)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2535, 3939, CAST(N'2022-07-23' AS Date), 2, 85415, 258)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2536, 4463, CAST(N'2022-07-23' AS Date), 2, 79465, 821)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2537, 4705, CAST(N'2022-07-23' AS Date), 3, 48167, 265)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2538, 4728, CAST(N'2022-07-23' AS Date), 1, 21632, 822)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2539, 4876, CAST(N'2022-07-23' AS Date), 3, 94249, 607)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2540, 5279, CAST(N'2022-07-23' AS Date), 2, 51447, 610)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2541, 5447, CAST(N'2022-07-23' AS Date), 3, 14037, 825)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2542, 5513, CAST(N'2022-07-23' AS Date), 1, 72470, 614)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2543, 5611, CAST(N'2022-07-23' AS Date), 3, 52232, 604)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2544, 5798, CAST(N'2022-07-23' AS Date), 2, 71440, 259)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2545, 5953, CAST(N'2022-07-23' AS Date), 2, 95432, 609)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2546, 6417, CAST(N'2022-07-23' AS Date), 3, 62317, 602)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2547, 6513, CAST(N'2022-07-23' AS Date), 2, 42117, 612)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2548, 6676, CAST(N'2022-07-23' AS Date), 3, 62559, 262)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2549, 6873, CAST(N'2022-07-23' AS Date), 3, 19729, 823)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2550, 7133, CAST(N'2022-07-23' AS Date), 2, 62788, 260)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2551, 7412, CAST(N'2022-07-23' AS Date), 2, 43064, 826)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2552, 8122, CAST(N'2022-07-23' AS Date), 1, 48314, 601)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2553, 8188, CAST(N'2022-07-23' AS Date), 1, 22189, 827)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2554, 8415, CAST(N'2022-07-23' AS Date), 2, 30465, 937)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2555, 9072, CAST(N'2022-07-23' AS Date), 3, 28317, 613)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2556, 9244, CAST(N'2022-07-23' AS Date), 2, 21684, 824)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2557, 9269, CAST(N'2022-07-23' AS Date), 3, 16156, 266)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2558, 9952, CAST(N'2022-07-23' AS Date), 2, 13689, 603)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2559, 286, CAST(N'2022-07-24' AS Date), 1, 23634, 617)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2560, 782, CAST(N'2022-07-24' AS Date), 1, 46850, 830)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2561, 1305, CAST(N'2022-07-24' AS Date), 1, 60097, 619)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2562, 1385, CAST(N'2022-07-24' AS Date), 1, 53529, 620)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2563, 1839, CAST(N'2022-07-24' AS Date), 1, 66063, 625)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2564, 2100, CAST(N'2022-07-24' AS Date), 2, 69452, 631)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2565, 2199, CAST(N'2022-07-24' AS Date), 1, 48203, 629)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2566, 2217, CAST(N'2022-07-24' AS Date), 2, 33975, 832)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2567, 2229, CAST(N'2022-07-24' AS Date), 1, 82943, 272)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2568, 2243, CAST(N'2022-07-24' AS Date), 3, 41863, 278)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2569, 2947, CAST(N'2022-07-24' AS Date), 1, 78637, 834)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2570, 3000, CAST(N'2022-07-24' AS Date), 2, 95960, 626)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2571, 3138, CAST(N'2022-07-24' AS Date), 3, 99364, 831)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2572, 3510, CAST(N'2022-07-24' AS Date), 2, 86035, 628)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2573, 3738, CAST(N'2022-07-24' AS Date), 3, 87762, 624)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2574, 3860, CAST(N'2022-07-24' AS Date), 2, 74578, 273)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2575, 4092, CAST(N'2022-07-24' AS Date), 3, 69447, 277)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2576, 4395, CAST(N'2022-07-24' AS Date), 2, 70572, 268)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2577, 4601, CAST(N'2022-07-24' AS Date), 1, 78972, 828)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2578, 4865, CAST(N'2022-07-24' AS Date), 3, 77403, 279)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2579, 5110, CAST(N'2022-07-24' AS Date), 1, 56358, 623)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2580, 5346, CAST(N'2022-07-24' AS Date), 1, 99174, 616)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2581, 5661, CAST(N'2022-07-24' AS Date), 1, 88593, 627)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2582, 6125, CAST(N'2022-07-24' AS Date), 3, 90688, 267)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2583, 6275, CAST(N'2022-07-24' AS Date), 2, 56357, 829)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2584, 6313, CAST(N'2022-07-24' AS Date), 2, 47041, 621)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2585, 6428, CAST(N'2022-07-24' AS Date), 3, 99978, 622)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2586, 7115, CAST(N'2022-07-24' AS Date), 3, 83545, 275)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2587, 7345, CAST(N'2022-07-24' AS Date), 3, 61064, 833)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2588, 7572, CAST(N'2022-07-24' AS Date), 1, 29526, 618)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2589, 8106, CAST(N'2022-07-24' AS Date), 2, 95612, 271)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2590, 9116, CAST(N'2022-07-24' AS Date), 1, 44010, 630)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2591, 9177, CAST(N'2022-07-24' AS Date), 3, 33461, 276)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2592, 9604, CAST(N'2022-07-24' AS Date), 3, 62915, 274)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2593, 9743, CAST(N'2022-07-24' AS Date), 1, 88438, 269)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2594, 9936, CAST(N'2022-07-24' AS Date), 2, 78586, 270)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2595, 928, CAST(N'2022-07-25' AS Date), 2, 45346, 835)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2596, 1050, CAST(N'2022-07-25' AS Date), 2, 26733, 639)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2597, 1756, CAST(N'2022-07-25' AS Date), 2, 86692, 287)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2598, 2038, CAST(N'2022-07-25' AS Date), 1, 89527, 288)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2599, 2153, CAST(N'2022-07-25' AS Date), 3, 96153, 637)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2600, 2544, CAST(N'2022-07-25' AS Date), 2, 76194, 642)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2601, 2576, CAST(N'2022-07-25' AS Date), 1, 15369, 638)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2602, 2719, CAST(N'2022-07-25' AS Date), 1, 42808, 290)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2603, 2925, CAST(N'2022-07-25' AS Date), 3, 96727, 289)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2604, 3098, CAST(N'2022-07-25' AS Date), 2, 87376, 941)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2605, 3264, CAST(N'2022-07-25' AS Date), 2, 33363, 633)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2606, 3284, CAST(N'2022-07-25' AS Date), 2, 24969, 942)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2607, 3326, CAST(N'2022-07-25' AS Date), 3, 57719, 636)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2608, 3685, CAST(N'2022-07-25' AS Date), 2, 95186, 640)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2609, 4075, CAST(N'2022-07-25' AS Date), 2, 81014, 838)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2610, 4119, CAST(N'2022-07-25' AS Date), 3, 99623, 280)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2611, 4860, CAST(N'2022-07-25' AS Date), 2, 61510, 641)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2612, 5033, CAST(N'2022-07-25' AS Date), 2, 97107, 634)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2613, 5074, CAST(N'2022-07-25' AS Date), 1, 14278, 284)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2614, 5453, CAST(N'2022-07-25' AS Date), 3, 78554, 292)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2615, 6127, CAST(N'2022-07-25' AS Date), 2, 47296, 286)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2616, 6184, CAST(N'2022-07-25' AS Date), 2, 97717, 285)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2617, 6705, CAST(N'2022-07-25' AS Date), 2, 30565, 644)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2618, 6908, CAST(N'2022-07-25' AS Date), 2, 63799, 836)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2619, 7254, CAST(N'2022-07-25' AS Date), 3, 41196, 282)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2620, 7941, CAST(N'2022-07-25' AS Date), 3, 87271, 837)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2621, 7946, CAST(N'2022-07-25' AS Date), 1, 19140, 643)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2622, 8080, CAST(N'2022-07-25' AS Date), 2, 64155, 283)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2623, 8187, CAST(N'2022-07-25' AS Date), 1, 34834, 291)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2624, 9052, CAST(N'2022-07-25' AS Date), 3, 58400, 293)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2625, 9057, CAST(N'2022-07-25' AS Date), 2, 21098, 635)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2626, 9260, CAST(N'2022-07-25' AS Date), 2, 20229, 281)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2627, 9388, CAST(N'2022-07-25' AS Date), 1, 43883, 632)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2628, 9746, CAST(N'2022-07-25' AS Date), 1, 88410, 940)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2629, 425, CAST(N'2022-07-26' AS Date), 2, 45865, 646)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2630, 498, CAST(N'2022-07-26' AS Date), 3, 69769, 843)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2631, 902, CAST(N'2022-07-26' AS Date), 3, 5, 649)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2632, 1082, CAST(N'2022-07-26' AS Date), 2, 35181, 840)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2633, 1379, CAST(N'2022-07-26' AS Date), 2, 83616, 839)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2634, 1652, CAST(N'2022-07-26' AS Date), 1, 72372, 295)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2635, 1899, CAST(N'2022-07-26' AS Date), 1, 70145, 946)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2636, 2343, CAST(N'2022-07-26' AS Date), 1, 55298, 654)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2637, 2496, CAST(N'2022-07-26' AS Date), 2, 56406, 945)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2638, 3228, CAST(N'2022-07-26' AS Date), 2, 37020, 650)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2639, 4144, CAST(N'2022-07-26' AS Date), 2, 36465, 294)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2640, 4662, CAST(N'2022-07-26' AS Date), 1, 86766, 298)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2641, 4890, CAST(N'2022-07-26' AS Date), 3, 48021, 844)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2642, 5310, CAST(N'2022-07-26' AS Date), 1, 67183, 943)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2643, 5567, CAST(N'2022-07-26' AS Date), 3, 34811, 299)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2644, 5776, CAST(N'2022-07-26' AS Date), 2, 69298, 651)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2645, 5857, CAST(N'2022-07-26' AS Date), 1, 41209, 656)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2646, 6529, CAST(N'2022-07-26' AS Date), 1, 28942, 648)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2647, 6797, CAST(N'2022-07-26' AS Date), 3, 95201, 297)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2648, 7124, CAST(N'2022-07-26' AS Date), 2, 66508, 652)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2649, 7141, CAST(N'2022-07-26' AS Date), 3, 34142, 845)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2650, 7194, CAST(N'2022-07-26' AS Date), 2, 57203, 653)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2651, 7336, CAST(N'2022-07-26' AS Date), 3, 49577, 947)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2652, 7387, CAST(N'2022-07-26' AS Date), 3, 11490, 655)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2653, 7484, CAST(N'2022-07-26' AS Date), 1, 92711, 647)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2654, 7675, CAST(N'2022-07-26' AS Date), 3, 27063, 841)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2655, 7928, CAST(N'2022-07-26' AS Date), 2, 29846, 842)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2656, 7954, CAST(N'2022-07-26' AS Date), 2, 51517, 296)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2657, 8028, CAST(N'2022-07-26' AS Date), 3, 52095, 944)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2658, 9203, CAST(N'2022-07-26' AS Date), 3, 18957, 657)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2659, 9766, CAST(N'2022-07-26' AS Date), 1, 22663, 645)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2660, 1138, CAST(N'2022-07-27' AS Date), 2, 25027, 948)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2661, 1149, CAST(N'2022-07-27' AS Date), 1, 24119, 661)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2662, 1726, CAST(N'2022-07-27' AS Date), 1, 42731, 663)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2663, 1830, CAST(N'2022-07-27' AS Date), 3, 56376, 302)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2664, 1885, CAST(N'2022-07-27' AS Date), 2, 64608, 951)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2665, 2300, CAST(N'2022-07-27' AS Date), 2, 24549, 305)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2666, 2721, CAST(N'2022-07-27' AS Date), 3, 10244, 301)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2667, 3024, CAST(N'2022-07-27' AS Date), 1, 58923, 306)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2668, 3260, CAST(N'2022-07-27' AS Date), 2, 17312, 658)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2669, 4239, CAST(N'2022-07-27' AS Date), 3, 71510, 662)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2670, 4765, CAST(N'2022-07-27' AS Date), 2, 30793, 666)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2671, 4921, CAST(N'2022-07-27' AS Date), 3, 44759, 664)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2672, 5142, CAST(N'2022-07-27' AS Date), 2, 30030, 660)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2673, 6080, CAST(N'2022-07-27' AS Date), 3, 32770, 949)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2674, 6533, CAST(N'2022-07-27' AS Date), 2, 74512, 311)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2675, 7180, CAST(N'2022-07-27' AS Date), 1, 55493, 665)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2676, 7444, CAST(N'2022-07-27' AS Date), 2, 10617, 309)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2677, 8008, CAST(N'2022-07-27' AS Date), 1, 88744, 950)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2678, 8015, CAST(N'2022-07-27' AS Date), 2, 17269, 308)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2679, 8457, CAST(N'2022-07-27' AS Date), 1, 57780, 303)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2680, 8650, CAST(N'2022-07-27' AS Date), 2, 42899, 310)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2681, 8823, CAST(N'2022-07-27' AS Date), 3, 61426, 304)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2682, 9088, CAST(N'2022-07-27' AS Date), 1, 48494, 300)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2683, 9317, CAST(N'2022-07-27' AS Date), 1, 30781, 659)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2684, 9447, CAST(N'2022-07-27' AS Date), 1, 61264, 307)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2685, 966, CAST(N'2022-07-28' AS Date), 3, 86596, 323)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2686, 1097, CAST(N'2022-07-28' AS Date), 1, 65516, 322)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2687, 1107, CAST(N'2022-07-28' AS Date), 1, 19586, 315)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2688, 1285, CAST(N'2022-07-28' AS Date), 1, 78171, 318)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2689, 1547, CAST(N'2022-07-28' AS Date), 1, 17365, 670)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2690, 1555, CAST(N'2022-07-28' AS Date), 3, 89958, 317)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2691, 1702, CAST(N'2022-07-28' AS Date), 1, 40667, 314)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2692, 1706, CAST(N'2022-07-28' AS Date), 3, 46738, 671)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2693, 1745, CAST(N'2022-07-28' AS Date), 3, 79760, 847)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2694, 1935, CAST(N'2022-07-28' AS Date), 2, 95954, 325)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2695, 1964, CAST(N'2022-07-28' AS Date), 1, 67178, 669)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2696, 2148, CAST(N'2022-07-28' AS Date), 2, 79280, 326)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2697, 2332, CAST(N'2022-07-28' AS Date), 1, 21753, 312)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2698, 2508, CAST(N'2022-07-28' AS Date), 1, 92606, 320)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2699, 3280, CAST(N'2022-07-28' AS Date), 3, 66065, 324)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2700, 4510, CAST(N'2022-07-28' AS Date), 1, 95312, 673)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2701, 4715, CAST(N'2022-07-28' AS Date), 1, 54489, 313)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2702, 5182, CAST(N'2022-07-28' AS Date), 3, 61684, 848)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2703, 5256, CAST(N'2022-07-28' AS Date), 1, 46658, 954)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2704, 5309, CAST(N'2022-07-28' AS Date), 2, 62185, 676)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2705, 5332, CAST(N'2022-07-28' AS Date), 2, 32345, 677)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2706, 5802, CAST(N'2022-07-28' AS Date), 2, 65669, 667)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2707, 6328, CAST(N'2022-07-28' AS Date), 3, 13897, 846)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2708, 6881, CAST(N'2022-07-28' AS Date), 1, 92698, 952)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2709, 6971, CAST(N'2022-07-28' AS Date), 3, 66027, 327)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2710, 7113, CAST(N'2022-07-28' AS Date), 3, 96929, 675)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2711, 7332, CAST(N'2022-07-28' AS Date), 2, 11259, 316)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2712, 7838, CAST(N'2022-07-28' AS Date), 3, 57576, 953)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2713, 7989, CAST(N'2022-07-28' AS Date), 2, 86932, 674)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2714, 8097, CAST(N'2022-07-28' AS Date), 3, 54731, 672)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2715, 8117, CAST(N'2022-07-28' AS Date), 2, 41116, 319)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2716, 8274, CAST(N'2022-07-28' AS Date), 2, 63143, 321)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2717, 9509, CAST(N'2022-07-28' AS Date), 3, 17607, 668)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2718, 761, CAST(N'2022-07-29' AS Date), 2, 25614, 679)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2719, 922, CAST(N'2022-07-29' AS Date), 2, 55370, 687)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2720, 1210, CAST(N'2022-07-29' AS Date), 2, 40383, 686)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2721, 1441, CAST(N'2022-07-29' AS Date), 3, 85382, 957)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2722, 1496, CAST(N'2022-07-29' AS Date), 1, 98713, 332)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2723, 1611, CAST(N'2022-07-29' AS Date), 3, 40512, 850)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2724, 1725, CAST(N'2022-07-29' AS Date), 2, 90864, 680)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2725, 2878, CAST(N'2022-07-29' AS Date), 1, 83048, 956)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2726, 3778, CAST(N'2022-07-29' AS Date), 2, 95445, 685)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2727, 3984, CAST(N'2022-07-29' AS Date), 1, 73018, 688)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2728, 3985, CAST(N'2022-07-29' AS Date), 3, 27316, 691)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2729, 5015, CAST(N'2022-07-29' AS Date), 2, 53446, 684)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2730, 6108, CAST(N'2022-07-29' AS Date), 2, 84254, 955)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2731, 6767, CAST(N'2022-07-29' AS Date), 2, 98008, 682)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2732, 6826, CAST(N'2022-07-29' AS Date), 3, 44768, 689)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2733, 7061, CAST(N'2022-07-29' AS Date), 2, 53044, 678)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2734, 7365, CAST(N'2022-07-29' AS Date), 1, 55283, 851)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2735, 7517, CAST(N'2022-07-29' AS Date), 3, 92603, 683)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2736, 8390, CAST(N'2022-07-29' AS Date), 3, 63495, 849)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2737, 8549, CAST(N'2022-07-29' AS Date), 3, 79933, 681)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2738, 8805, CAST(N'2022-07-29' AS Date), 1, 60328, 690)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2739, 924, CAST(N'2022-07-30' AS Date), 1, 54175, 964)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2740, 984, CAST(N'2022-07-30' AS Date), 2, 92670, 963)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2741, 1356, CAST(N'2022-07-30' AS Date), 2, 93866, 959)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2742, 1360, CAST(N'2022-07-30' AS Date), 2, 14504, 701)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2743, 1566, CAST(N'2022-07-30' AS Date), 3, 96487, 855)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2744, 1614, CAST(N'2022-07-30' AS Date), 2, 93282, 705)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2745, 1653, CAST(N'2022-07-30' AS Date), 3, 12540, 703)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2746, 1858, CAST(N'2022-07-30' AS Date), 2, 27113, 696)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2747, 2018, CAST(N'2022-07-30' AS Date), 1, 15217, 698)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2748, 2679, CAST(N'2022-07-30' AS Date), 1, 94476, 706)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2749, 2948, CAST(N'2022-07-30' AS Date), 2, 93717, 852)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2750, 3062, CAST(N'2022-07-30' AS Date), 3, 90767, 854)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2751, 3417, CAST(N'2022-07-30' AS Date), 3, 74916, 346)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2752, 3580, CAST(N'2022-07-30' AS Date), 2, 77321, 350)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2753, 4004, CAST(N'2022-07-30' AS Date), 3, 43419, 700)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2754, 4112, CAST(N'2022-07-30' AS Date), 2, 94544, 345)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2755, 4930, CAST(N'2022-07-30' AS Date), 2, 46700, 343)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2756, 5010, CAST(N'2022-07-30' AS Date), 2, 45886, 961)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2757, 5476, CAST(N'2022-07-30' AS Date), 3, 46163, 342)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2758, 5531, CAST(N'2022-07-30' AS Date), 2, 66074, 348)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2759, 6005, CAST(N'2022-07-30' AS Date), 3, 47050, 960)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2760, 6215, CAST(N'2022-07-30' AS Date), 1, 71830, 695)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2761, 6722, CAST(N'2022-07-30' AS Date), 2, 34537, 702)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2762, 7398, CAST(N'2022-07-30' AS Date), 3, 49358, 694)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2763, 7600, CAST(N'2022-07-30' AS Date), 1, 18711, 697)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2764, 8251, CAST(N'2022-07-30' AS Date), 2, 99255, 692)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2765, 8293, CAST(N'2022-07-30' AS Date), 1, 70478, 693)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2766, 8556, CAST(N'2022-07-30' AS Date), 1, 25630, 704)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2767, 8558, CAST(N'2022-07-30' AS Date), 1, 89395, 962)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2768, 8653, CAST(N'2022-07-30' AS Date), 3, 99055, 349)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2769, 8705, CAST(N'2022-07-30' AS Date), 3, 18122, 340)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2770, 8750, CAST(N'2022-07-30' AS Date), 3, 41356, 339)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2771, 8848, CAST(N'2022-07-30' AS Date), 3, 26831, 853)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2772, 8998, CAST(N'2022-07-30' AS Date), 1, 10317, 699)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2773, 9102, CAST(N'2022-07-30' AS Date), 2, 11288, 347)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2774, 9214, CAST(N'2022-07-30' AS Date), 1, 95202, 344)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2775, 9901, CAST(N'2022-07-30' AS Date), 2, 83593, 958)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2776, 9981, CAST(N'2022-07-30' AS Date), 1, 41712, 341)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2777, 1041, CAST(N'2022-07-31' AS Date), 1, 63753, 355)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2778, 1168, CAST(N'2022-07-31' AS Date), 1, 46586, 712)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2779, 1392, CAST(N'2022-07-31' AS Date), 2, 80472, 857)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2780, 1519, CAST(N'2022-07-31' AS Date), 3, 90273, 710)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2781, 1681, CAST(N'2022-07-31' AS Date), 3, 14833, 856)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2782, 1781, CAST(N'2022-07-31' AS Date), 1, 78523, 859)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2783, 2264, CAST(N'2022-07-31' AS Date), 2, 54507, 354)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2784, 2939, CAST(N'2022-07-31' AS Date), 1, 45546, 966)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2785, 3370, CAST(N'2022-07-31' AS Date), 1, 42360, 715)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2786, 3418, CAST(N'2022-07-31' AS Date), 2, 14506, 359)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2787, 4382, CAST(N'2022-07-31' AS Date), 3, 44511, 357)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2788, 4725, CAST(N'2022-07-31' AS Date), 2, 74228, 858)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2789, 5201, CAST(N'2022-07-31' AS Date), 3, 92515, 711)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2790, 5252, CAST(N'2022-07-31' AS Date), 1, 43531, 709)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2791, 5369, CAST(N'2022-07-31' AS Date), 2, 77089, 713)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2792, 5648, CAST(N'2022-07-31' AS Date), 2, 74720, 352)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2793, 6075, CAST(N'2022-07-31' AS Date), 3, 10685, 351)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2794, 6097, CAST(N'2022-07-31' AS Date), 2, 34259, 356)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2795, 6337, CAST(N'2022-07-31' AS Date), 1, 36958, 358)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2796, 6911, CAST(N'2022-07-31' AS Date), 2, 23128, 716)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2797, 6949, CAST(N'2022-07-31' AS Date), 3, 47914, 708)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2798, 7876, CAST(N'2022-07-31' AS Date), 2, 92645, 717)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2799, 8025, CAST(N'2022-07-31' AS Date), 1, 73526, 719)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2800, 8082, CAST(N'2022-07-31' AS Date), 2, 29995, 714)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2801, 8264, CAST(N'2022-07-31' AS Date), 1, 85356, 353)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2802, 9036, CAST(N'2022-07-31' AS Date), 1, 39258, 860)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2803, 9144, CAST(N'2022-07-31' AS Date), 2, 52136, 965)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2804, 9297, CAST(N'2022-07-31' AS Date), 3, 87277, 707)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2805, 9669, CAST(N'2022-07-31' AS Date), 2, 46310, 718)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2806, 1013, CAST(N'2022-08-02' AS Date), 2, 52958, 367)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2807, 1019, CAST(N'2022-08-02' AS Date), 2, 99801, 364)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2808, 1915, CAST(N'2022-08-02' AS Date), 1, 81245, 361)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2809, 2105, CAST(N'2022-08-02' AS Date), 2, 82778, 864)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2810, 2646, CAST(N'2022-08-02' AS Date), 3, 46820, 21)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2811, 3304, CAST(N'2022-08-02' AS Date), 1, 70831, 370)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2812, 3533, CAST(N'2022-08-02' AS Date), 3, 61535, 19)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2813, 3751, CAST(N'2022-08-02' AS Date), 1, 84529, 17)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2814, 3881, CAST(N'2022-08-02' AS Date), 3, 29609, 369)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2815, 4234, CAST(N'2022-08-02' AS Date), 1, 10752, 25)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2816, 4341, CAST(N'2022-08-02' AS Date), 1, 38183, 362)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2817, 4889, CAST(N'2022-08-02' AS Date), 3, 29270, 20)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2818, 5220, CAST(N'2022-08-02' AS Date), 1, 39523, 22)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2819, 5327, CAST(N'2022-08-02' AS Date), 2, 59867, 365)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2820, 5333, CAST(N'2022-08-02' AS Date), 2, 17447, 733)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2821, 5418, CAST(N'2022-08-02' AS Date), 1, 75972, 24)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2822, 5587, CAST(N'2022-08-02' AS Date), 2, 79543, 15)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2823, 5729, CAST(N'2022-08-02' AS Date), 2, 21152, 14)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2824, 5826, CAST(N'2022-08-02' AS Date), 3, 20475, 360)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2825, 6078, CAST(N'2022-08-02' AS Date), 2, 47587, 366)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2826, 6311, CAST(N'2022-08-02' AS Date), 2, 31757, 371)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2827, 6608, CAST(N'2022-08-02' AS Date), 1, 93575, 27)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2828, 6850, CAST(N'2022-08-02' AS Date), 2, 83149, 732)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2829, 6891, CAST(N'2022-08-02' AS Date), 2, 51835, 26)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2830, 7087, CAST(N'2022-08-02' AS Date), 1, 78903, 363)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2831, 7376, CAST(N'2022-08-02' AS Date), 1, 85051, 23)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2832, 7658, CAST(N'2022-08-02' AS Date), 2, 36248, 372)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2833, 8508, CAST(N'2022-08-02' AS Date), 1, 70153, 862)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2834, 8512, CAST(N'2022-08-02' AS Date), 2, 22338, 863)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2835, 8817, CAST(N'2022-08-02' AS Date), 1, 77124, 16)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2836, 8833, CAST(N'2022-08-02' AS Date), 1, 87065, 18)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2837, 9760, CAST(N'2022-08-02' AS Date), 2, 33520, 861)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2838, 9860, CAST(N'2022-08-02' AS Date), 1, 83413, 368)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2839, 1038, CAST(N'2022-08-03' AS Date), 2, 29713, 736)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2840, 1176, CAST(N'2022-08-03' AS Date), 1, 26348, 868)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2841, 1276, CAST(N'2022-08-03' AS Date), 3, 70899, 869)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2842, 1489, CAST(N'2022-08-03' AS Date), 3, 79180, 35)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2843, 1712, CAST(N'2022-08-03' AS Date), 3, 64484, 374)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2844, 1732, CAST(N'2022-08-03' AS Date), 3, 12966, 867)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2845, 2305, CAST(N'2022-08-03' AS Date), 1, 81098, 379)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2846, 2745, CAST(N'2022-08-03' AS Date), 1, 83111, 380)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2847, 2786, CAST(N'2022-08-03' AS Date), 1, 20536, 381)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2848, 2992, CAST(N'2022-08-03' AS Date), 2, 62057, 38)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2849, 3554, CAST(N'2022-08-03' AS Date), 3, 23691, 28)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2850, 3616, CAST(N'2022-08-03' AS Date), 2, 43523, 382)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2851, 3636, CAST(N'2022-08-03' AS Date), 2, 60151, 734)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2852, 3663, CAST(N'2022-08-03' AS Date), 3, 60326, 39)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2853, 3785, CAST(N'2022-08-03' AS Date), 2, 73586, 865)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2854, 3953, CAST(N'2022-08-03' AS Date), 2, 52012, 385)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2855, 4827, CAST(N'2022-08-03' AS Date), 1, 22427, 33)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2856, 4982, CAST(N'2022-08-03' AS Date), 1, 60440, 377)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2857, 5016, CAST(N'2022-08-03' AS Date), 3, 57526, 32)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2858, 5118, CAST(N'2022-08-03' AS Date), 1, 80166, 737)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2859, 5313, CAST(N'2022-08-03' AS Date), 2, 64980, 29)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2860, 6071, CAST(N'2022-08-03' AS Date), 2, 15443, 375)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2861, 6475, CAST(N'2022-08-03' AS Date), 2, 61461, 36)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2862, 6530, CAST(N'2022-08-03' AS Date), 2, 88771, 735)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2863, 6695, CAST(N'2022-08-03' AS Date), 3, 97992, 34)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2864, 6877, CAST(N'2022-08-03' AS Date), 2, 68320, 738)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2865, 7025, CAST(N'2022-08-03' AS Date), 3, 65223, 388)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2866, 7069, CAST(N'2022-08-03' AS Date), 2, 20258, 378)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2867, 7076, CAST(N'2022-08-03' AS Date), 2, 34834, 37)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2868, 7419, CAST(N'2022-08-03' AS Date), 3, 99103, 739)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2869, 7453, CAST(N'2022-08-03' AS Date), 3, 78692, 31)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2870, 8295, CAST(N'2022-08-03' AS Date), 3, 29261, 373)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2871, 8428, CAST(N'2022-08-03' AS Date), 3, 16227, 387)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2872, 8477, CAST(N'2022-08-03' AS Date), 2, 52985, 383)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2873, 8760, CAST(N'2022-08-03' AS Date), 1, 62324, 30)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2874, 9111, CAST(N'2022-08-03' AS Date), 1, 24148, 376)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2875, 9275, CAST(N'2022-08-03' AS Date), 3, 33933, 384)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2876, 9762, CAST(N'2022-08-03' AS Date), 2, 88752, 866)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2877, 9951, CAST(N'2022-08-03' AS Date), 1, 60006, 386)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2878, 863, CAST(N'2022-08-04' AS Date), 3, 57777, 743)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2879, 1585, CAST(N'2022-08-04' AS Date), 1, 16062, 43)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2880, 1608, CAST(N'2022-08-04' AS Date), 2, 91850, 395)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2881, 1682, CAST(N'2022-08-04' AS Date), 2, 68877, 48)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2882, 1802, CAST(N'2022-08-04' AS Date), 1, 41957, 50)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2883, 1965, CAST(N'2022-08-04' AS Date), 1, 73183, 46)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2884, 1996, CAST(N'2022-08-04' AS Date), 3, 33426, 42)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2885, 3679, CAST(N'2022-08-04' AS Date), 3, 75387, 51)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2886, 4202, CAST(N'2022-08-04' AS Date), 1, 69005, 41)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2887, 4538, CAST(N'2022-08-04' AS Date), 3, 60135, 741)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2888, 4755, CAST(N'2022-08-04' AS Date), 2, 55849, 870)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2889, 4799, CAST(N'2022-08-04' AS Date), 1, 27445, 871)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2890, 4811, CAST(N'2022-08-04' AS Date), 2, 35008, 391)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2891, 4933, CAST(N'2022-08-04' AS Date), 1, 49320, 873)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2892, 5517, CAST(N'2022-08-04' AS Date), 3, 19819, 872)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2893, 5583, CAST(N'2022-08-04' AS Date), 1, 28518, 742)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2894, 5622, CAST(N'2022-08-04' AS Date), 3, 38596, 40)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2895, 5868, CAST(N'2022-08-04' AS Date), 2, 25091, 47)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2896, 5912, CAST(N'2022-08-04' AS Date), 1, 57313, 396)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2897, 6120, CAST(N'2022-08-04' AS Date), 3, 15337, 875)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2898, 6370, CAST(N'2022-08-04' AS Date), 2, 39992, 876)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2899, 6750, CAST(N'2022-08-04' AS Date), 1, 25272, 44)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2900, 7392, CAST(N'2022-08-04' AS Date), 2, 82583, 874)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2901, 7777, CAST(N'2022-08-04' AS Date), 2, 49231, 744)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2902, 7803, CAST(N'2022-08-04' AS Date), 2, 83864, 393)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2903, 7835, CAST(N'2022-08-04' AS Date), 3, 29707, 390)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2904, 8032, CAST(N'2022-08-04' AS Date), 3, 63971, 740)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2905, 8108, CAST(N'2022-08-04' AS Date), 3, 45986, 392)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2906, 8574, CAST(N'2022-08-04' AS Date), 1, 81709, 389)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2907, 8589, CAST(N'2022-08-04' AS Date), 2, 43242, 45)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2908, 9417, CAST(N'2022-08-04' AS Date), 2, 39037, 394)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2909, 9586, CAST(N'2022-08-04' AS Date), 1, 86470, 49)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2910, 494, CAST(N'2022-08-05' AS Date), 1, 68423, 402)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2911, 553, CAST(N'2022-08-05' AS Date), 1, 81776, 746)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2912, 1818, CAST(N'2022-08-05' AS Date), 2, 72738, 406)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2913, 2175, CAST(N'2022-08-05' AS Date), 3, 71365, 401)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2914, 2361, CAST(N'2022-08-05' AS Date), 1, 75837, 409)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2915, 2584, CAST(N'2022-08-05' AS Date), 3, 12254, 54)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2916, 2977, CAST(N'2022-08-05' AS Date), 3, 30159, 63)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2917, 3051, CAST(N'2022-08-05' AS Date), 1, 22103, 67)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2918, 3577, CAST(N'2022-08-05' AS Date), 1, 11724, 400)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2919, 3619, CAST(N'2022-08-05' AS Date), 1, 34771, 56)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2920, 4357, CAST(N'2022-08-05' AS Date), 1, 24944, 747)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2921, 4386, CAST(N'2022-08-05' AS Date), 1, 98638, 64)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2922, 5047, CAST(N'2022-08-05' AS Date), 3, 63149, 65)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2923, 5060, CAST(N'2022-08-05' AS Date), 3, 96623, 58)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2924, 5176, CAST(N'2022-08-05' AS Date), 1, 52480, 879)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2925, 5338, CAST(N'2022-08-05' AS Date), 2, 36493, 55)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2926, 5395, CAST(N'2022-08-05' AS Date), 1, 53423, 404)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2927, 5850, CAST(N'2022-08-05' AS Date), 2, 12888, 748)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2928, 5997, CAST(N'2022-08-05' AS Date), 1, 25395, 57)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2929, 6394, CAST(N'2022-08-05' AS Date), 2, 17608, 398)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2930, 6521, CAST(N'2022-08-05' AS Date), 1, 72582, 405)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2931, 6766, CAST(N'2022-08-05' AS Date), 2, 32315, 403)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2932, 6840, CAST(N'2022-08-05' AS Date), 2, 30383, 397)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2933, 6879, CAST(N'2022-08-05' AS Date), 1, 62411, 745)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2934, 7155, CAST(N'2022-08-05' AS Date), 2, 31201, 53)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2935, 7220, CAST(N'2022-08-05' AS Date), 1, 97309, 59)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2936, 7441, CAST(N'2022-08-05' AS Date), 3, 44823, 62)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2937, 7488, CAST(N'2022-08-05' AS Date), 1, 66669, 61)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2938, 7548, CAST(N'2022-08-05' AS Date), 3, 52300, 66)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2939, 7655, CAST(N'2022-08-05' AS Date), 1, 83977, 410)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2940, 7720, CAST(N'2022-08-05' AS Date), 1, 89156, 407)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2941, 7871, CAST(N'2022-08-05' AS Date), 2, 90789, 878)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2942, 8102, CAST(N'2022-08-05' AS Date), 2, 87933, 411)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2943, 8316, CAST(N'2022-08-05' AS Date), 2, 62686, 52)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2944, 8880, CAST(N'2022-08-05' AS Date), 2, 40532, 60)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2945, 8926, CAST(N'2022-08-05' AS Date), 1, 76421, 408)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2946, 9894, CAST(N'2022-08-05' AS Date), 3, 40809, 399)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2947, 9964, CAST(N'2022-08-05' AS Date), 2, 32129, 877)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2948, 1086, CAST(N'2022-08-06' AS Date), 1, 14045, 414)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2949, 1454, CAST(N'2022-08-06' AS Date), 3, 64596, 412)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2950, 1513, CAST(N'2022-08-06' AS Date), 2, 63963, 880)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2951, 1514, CAST(N'2022-08-06' AS Date), 1, 52630, 884)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2952, 2170, CAST(N'2022-08-06' AS Date), 2, 12646, 68)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2953, 2197, CAST(N'2022-08-06' AS Date), 3, 98548, 425)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2954, 2288, CAST(N'2022-08-06' AS Date), 2, 35199, 883)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2955, 2320, CAST(N'2022-08-06' AS Date), 2, 70059, 423)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2956, 2595, CAST(N'2022-08-06' AS Date), 3, 43266, 413)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2957, 2841, CAST(N'2022-08-06' AS Date), 1, 54716, 76)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2958, 3139, CAST(N'2022-08-06' AS Date), 2, 56200, 78)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2959, 3557, CAST(N'2022-08-06' AS Date), 2, 60317, 416)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2960, 4064, CAST(N'2022-08-06' AS Date), 2, 29116, 419)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2961, 4238, CAST(N'2022-08-06' AS Date), 3, 95546, 415)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2962, 4289, CAST(N'2022-08-06' AS Date), 2, 90331, 73)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2963, 5723, CAST(N'2022-08-06' AS Date), 1, 46659, 422)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2964, 6033, CAST(N'2022-08-06' AS Date), 2, 83634, 70)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2965, 6255, CAST(N'2022-08-06' AS Date), 1, 55588, 882)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2966, 6724, CAST(N'2022-08-06' AS Date), 2, 70309, 421)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2967, 6810, CAST(N'2022-08-06' AS Date), 2, 75543, 71)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2968, 6817, CAST(N'2022-08-06' AS Date), 3, 42854, 424)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2969, 6823, CAST(N'2022-08-06' AS Date), 1, 48109, 69)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2970, 8077, CAST(N'2022-08-06' AS Date), 1, 68544, 72)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2971, 8706, CAST(N'2022-08-06' AS Date), 3, 61118, 417)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2972, 8829, CAST(N'2022-08-06' AS Date), 1, 73796, 75)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2973, 9218, CAST(N'2022-08-06' AS Date), 3, 88496, 420)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2974, 9396, CAST(N'2022-08-06' AS Date), 2, 87232, 418)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2975, 9483, CAST(N'2022-08-06' AS Date), 2, 18985, 77)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2976, 9598, CAST(N'2022-08-06' AS Date), 2, 31460, 881)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2977, 9634, CAST(N'2022-08-06' AS Date), 1, 77064, 74)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2978, 302, CAST(N'2022-08-07' AS Date), 2, 31805, 429)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2979, 1233, CAST(N'2022-08-07' AS Date), 2, 52423, 432)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2980, 1269, CAST(N'2022-08-07' AS Date), 1, 78071, 749)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2981, 1981, CAST(N'2022-08-07' AS Date), 2, 26237, 87)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2982, 2287, CAST(N'2022-08-07' AS Date), 2, 19264, 83)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2983, 2590, CAST(N'2022-08-07' AS Date), 2, 37949, 92)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2984, 3363, CAST(N'2022-08-07' AS Date), 1, 68213, 430)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2985, 3395, CAST(N'2022-08-07' AS Date), 1, 19824, 428)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2986, 3411, CAST(N'2022-08-07' AS Date), 1, 10512, 91)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2987, 3542, CAST(N'2022-08-07' AS Date), 2, 45934, 431)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2988, 3648, CAST(N'2022-08-07' AS Date), 2, 60793, 434)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2989, 3756, CAST(N'2022-08-07' AS Date), 1, 24375, 433)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2990, 3891, CAST(N'2022-08-07' AS Date), 3, 13546, 84)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2991, 3917, CAST(N'2022-08-07' AS Date), 3, 83978, 754)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2992, 4060, CAST(N'2022-08-07' AS Date), 3, 18986, 89)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2993, 4154, CAST(N'2022-08-07' AS Date), 3, 75356, 750)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2994, 5144, CAST(N'2022-08-07' AS Date), 3, 71762, 86)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2995, 5638, CAST(N'2022-08-07' AS Date), 3, 34997, 755)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2996, 5919, CAST(N'2022-08-07' AS Date), 2, 87428, 90)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2997, 6013, CAST(N'2022-08-07' AS Date), 1, 77448, 752)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2998, 6350, CAST(N'2022-08-07' AS Date), 1, 45147, 82)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (2999, 6352, CAST(N'2022-08-07' AS Date), 3, 89354, 426)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3000, 6953, CAST(N'2022-08-07' AS Date), 2, 55203, 753)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3001, 7405, CAST(N'2022-08-07' AS Date), 1, 86551, 751)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3002, 7451, CAST(N'2022-08-07' AS Date), 3, 94856, 80)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3003, 8496, CAST(N'2022-08-07' AS Date), 3, 10115, 93)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3004, 8949, CAST(N'2022-08-07' AS Date), 3, 67666, 427)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3005, 9327, CAST(N'2022-08-07' AS Date), 1, 86434, 81)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3006, 9671, CAST(N'2022-08-07' AS Date), 2, 27287, 88)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3007, 9859, CAST(N'2022-08-07' AS Date), 3, 15339, 85)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3008, 9869, CAST(N'2022-08-07' AS Date), 2, 34437, 79)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3009, 1072, CAST(N'2022-08-08' AS Date), 3, 76032, 97)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3010, 1571, CAST(N'2022-08-08' AS Date), 1, 70465, 763)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3011, 1798, CAST(N'2022-08-08' AS Date), 3, 73687, 101)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3012, 1927, CAST(N'2022-08-08' AS Date), 1, 44332, 442)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3013, 2337, CAST(N'2022-08-08' AS Date), 2, 48507, 756)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3014, 2344, CAST(N'2022-08-08' AS Date), 1, 15188, 887)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3015, 2621, CAST(N'2022-08-08' AS Date), 2, 56852, 95)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3016, 2626, CAST(N'2022-08-08' AS Date), 2, 29339, 104)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3017, 2708, CAST(N'2022-08-08' AS Date), 2, 54101, 94)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3018, 2978, CAST(N'2022-08-08' AS Date), 2, 15137, 99)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3019, 3424, CAST(N'2022-08-08' AS Date), 2, 90367, 761)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3020, 3602, CAST(N'2022-08-08' AS Date), 2, 28910, 762)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3021, 3731, CAST(N'2022-08-08' AS Date), 1, 41127, 436)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3022, 4115, CAST(N'2022-08-08' AS Date), 1, 19117, 759)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3023, 4197, CAST(N'2022-08-08' AS Date), 2, 58743, 103)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3024, 4508, CAST(N'2022-08-08' AS Date), 3, 88637, 441)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3025, 4927, CAST(N'2022-08-08' AS Date), 2, 67503, 885)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3026, 4957, CAST(N'2022-08-08' AS Date), 3, 36487, 760)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3027, 5380, CAST(N'2022-08-08' AS Date), 1, 32767, 437)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3028, 6003, CAST(N'2022-08-08' AS Date), 3, 61842, 96)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3029, 6024, CAST(N'2022-08-08' AS Date), 2, 42516, 886)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3030, 7455, CAST(N'2022-08-08' AS Date), 3, 36174, 444)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3031, 7714, CAST(N'2022-08-08' AS Date), 2, 92402, 440)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3032, 7813, CAST(N'2022-08-08' AS Date), 2, 10410, 438)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3033, 7964, CAST(N'2022-08-08' AS Date), 2, 29827, 443)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3034, 8091, CAST(N'2022-08-08' AS Date), 3, 35584, 446)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3035, 8193, CAST(N'2022-08-08' AS Date), 2, 68921, 758)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3036, 8345, CAST(N'2022-08-08' AS Date), 1, 84816, 757)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3037, 8622, CAST(N'2022-08-08' AS Date), 1, 62372, 445)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3038, 8855, CAST(N'2022-08-08' AS Date), 3, 56607, 98)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3039, 8973, CAST(N'2022-08-08' AS Date), 1, 40393, 102)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3040, 9095, CAST(N'2022-08-08' AS Date), 2, 14233, 100)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3041, 9532, CAST(N'2022-08-08' AS Date), 3, 75865, 435)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3042, 9777, CAST(N'2022-08-08' AS Date), 2, 85889, 439)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3043, 669, CAST(N'2022-08-09' AS Date), 1, 32437, 890)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3044, 1396, CAST(N'2022-08-09' AS Date), 3, 41978, 768)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3045, 1455, CAST(N'2022-08-09' AS Date), 1, 68003, 109)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3046, 1664, CAST(N'2022-08-09' AS Date), 3, 59697, 118)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3047, 1923, CAST(N'2022-08-09' AS Date), 2, 23127, 116)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3048, 2120, CAST(N'2022-08-09' AS Date), 3, 68203, 767)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3049, 2234, CAST(N'2022-08-09' AS Date), 1, 68275, 891)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3050, 2347, CAST(N'2022-08-09' AS Date), 1, 40456, 453)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3051, 2360, CAST(N'2022-08-09' AS Date), 2, 84834, 105)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3052, 2527, CAST(N'2022-08-09' AS Date), 3, 92055, 448)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3053, 3242, CAST(N'2022-08-09' AS Date), 2, 42377, 893)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3054, 3272, CAST(N'2022-08-09' AS Date), 1, 47146, 459)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3055, 3337, CAST(N'2022-08-09' AS Date), 2, 67279, 766)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3056, 3454, CAST(N'2022-08-09' AS Date), 3, 24981, 112)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3057, 3468, CAST(N'2022-08-09' AS Date), 1, 27310, 113)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3058, 3840, CAST(N'2022-08-09' AS Date), 2, 42143, 764)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3059, 3885, CAST(N'2022-08-09' AS Date), 3, 27729, 458)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3060, 3936, CAST(N'2022-08-09' AS Date), 3, 51490, 106)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3061, 4299, CAST(N'2022-08-09' AS Date), 1, 71051, 460)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3062, 4672, CAST(N'2022-08-09' AS Date), 2, 52603, 107)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3063, 5052, CAST(N'2022-08-09' AS Date), 1, 93198, 452)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3064, 5722, CAST(N'2022-08-09' AS Date), 1, 92319, 454)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3065, 5732, CAST(N'2022-08-09' AS Date), 3, 55067, 117)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3066, 6290, CAST(N'2022-08-09' AS Date), 1, 44795, 110)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3067, 6605, CAST(N'2022-08-09' AS Date), 3, 41806, 115)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3068, 6672, CAST(N'2022-08-09' AS Date), 1, 33151, 114)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3069, 6931, CAST(N'2022-08-09' AS Date), 2, 13536, 770)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3070, 7020, CAST(N'2022-08-09' AS Date), 3, 48222, 765)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3071, 7070, CAST(N'2022-08-09' AS Date), 1, 56645, 447)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3072, 7219, CAST(N'2022-08-09' AS Date), 3, 85865, 888)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3073, 7415, CAST(N'2022-08-09' AS Date), 2, 87279, 457)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3074, 7757, CAST(N'2022-08-09' AS Date), 2, 76417, 889)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3075, 7921, CAST(N'2022-08-09' AS Date), 3, 37631, 456)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3076, 7937, CAST(N'2022-08-09' AS Date), 3, 58076, 449)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3077, 7955, CAST(N'2022-08-09' AS Date), 3, 31239, 892)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3078, 8393, CAST(N'2022-08-09' AS Date), 2, 74091, 451)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3079, 8486, CAST(N'2022-08-09' AS Date), 3, 17866, 111)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3080, 8830, CAST(N'2022-08-09' AS Date), 1, 11519, 108)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3081, 9493, CAST(N'2022-08-09' AS Date), 2, 53829, 450)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3082, 9620, CAST(N'2022-08-09' AS Date), 2, 57000, 769)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3083, 9885, CAST(N'2022-08-09' AS Date), 3, 89704, 894)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3084, 9978, CAST(N'2022-08-09' AS Date), 2, 11742, 455)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3085, 1006, CAST(N'2022-08-10' AS Date), 1, 51688, 131)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3086, 1450, CAST(N'2022-08-10' AS Date), 3, 15495, 462)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3087, 1796, CAST(N'2022-08-10' AS Date), 2, 58058, 468)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3088, 1989, CAST(N'2022-08-10' AS Date), 2, 26100, 461)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3089, 2033, CAST(N'2022-08-10' AS Date), 1, 89999, 120)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3090, 2339, CAST(N'2022-08-10' AS Date), 2, 89392, 121)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3091, 3005, CAST(N'2022-08-10' AS Date), 3, 61998, 128)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3092, 3123, CAST(N'2022-08-10' AS Date), 1, 23318, 772)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3093, 3174, CAST(N'2022-08-10' AS Date), 2, 79451, 126)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3094, 3350, CAST(N'2022-08-10' AS Date), 1, 59398, 129)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3095, 3441, CAST(N'2022-08-10' AS Date), 1, 70447, 465)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3096, 3660, CAST(N'2022-08-10' AS Date), 1, 19049, 127)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3097, 4553, CAST(N'2022-08-10' AS Date), 1, 75098, 122)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3098, 4782, CAST(N'2022-08-10' AS Date), 2, 88680, 466)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3099, 4922, CAST(N'2022-08-10' AS Date), 1, 88391, 463)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3100, 6343, CAST(N'2022-08-10' AS Date), 2, 92201, 119)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3101, 6709, CAST(N'2022-08-10' AS Date), 1, 91270, 125)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3102, 7287, CAST(N'2022-08-10' AS Date), 3, 15361, 771)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3103, 7294, CAST(N'2022-08-10' AS Date), 2, 17035, 773)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3104, 7560, CAST(N'2022-08-10' AS Date), 2, 88915, 467)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3105, 7590, CAST(N'2022-08-10' AS Date), 3, 31191, 464)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3106, 7650, CAST(N'2022-08-10' AS Date), 1, 91344, 123)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3107, 8662, CAST(N'2022-08-10' AS Date), 1, 32670, 130)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3108, 8741, CAST(N'2022-08-10' AS Date), 1, 17431, 124)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3109, 9972, CAST(N'2022-08-10' AS Date), 3, 75886, 469)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3110, 973, CAST(N'2022-08-11' AS Date), 1, 22706, 472)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3111, 1191, CAST(N'2022-08-11' AS Date), 1, 46577, 140)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3112, 1310, CAST(N'2022-08-11' AS Date), 3, 39306, 774)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3113, 1449, CAST(N'2022-08-11' AS Date), 2, 87569, 475)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3114, 1491, CAST(N'2022-08-11' AS Date), 1, 76283, 470)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3115, 2031, CAST(N'2022-08-11' AS Date), 2, 35889, 476)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3116, 2758, CAST(N'2022-08-11' AS Date), 1, 12719, 141)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3117, 3039, CAST(N'2022-08-11' AS Date), 3, 25894, 473)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3118, 4016, CAST(N'2022-08-11' AS Date), 2, 80717, 142)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3119, 4038, CAST(N'2022-08-11' AS Date), 1, 14863, 895)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3120, 4354, CAST(N'2022-08-11' AS Date), 1, 10326, 139)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3121, 4521, CAST(N'2022-08-11' AS Date), 3, 51779, 133)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3122, 4907, CAST(N'2022-08-11' AS Date), 1, 82049, 775)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3123, 5235, CAST(N'2022-08-11' AS Date), 2, 84934, 474)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3124, 5466, CAST(N'2022-08-11' AS Date), 3, 95630, 143)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3125, 5589, CAST(N'2022-08-11' AS Date), 2, 78428, 137)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3126, 7079, CAST(N'2022-08-11' AS Date), 1, 55814, 138)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3127, 7105, CAST(N'2022-08-11' AS Date), 3, 31903, 136)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3128, 7259, CAST(N'2022-08-11' AS Date), 3, 89754, 132)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3129, 7526, CAST(N'2022-08-11' AS Date), 1, 68547, 134)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3130, 7633, CAST(N'2022-08-11' AS Date), 2, 42614, 471)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3131, 7913, CAST(N'2022-08-11' AS Date), 3, 78563, 776)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3132, 8314, CAST(N'2022-08-11' AS Date), 2, 59738, 896)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3133, 8335, CAST(N'2022-08-11' AS Date), 2, 50639, 135)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3134, 753, CAST(N'2022-08-12' AS Date), 3, 49083, 484)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3135, 1023, CAST(N'2022-08-12' AS Date), 2, 19071, 480)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3136, 1347, CAST(N'2022-08-12' AS Date), 1, 16061, 483)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3137, 1384, CAST(N'2022-08-12' AS Date), 3, 74251, 150)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3138, 1563, CAST(N'2022-08-12' AS Date), 3, 43339, 897)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3139, 3060, CAST(N'2022-08-12' AS Date), 2, 54643, 146)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3140, 3221, CAST(N'2022-08-12' AS Date), 1, 20063, 485)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3141, 3289, CAST(N'2022-08-12' AS Date), 2, 48681, 145)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3142, 3351, CAST(N'2022-08-12' AS Date), 3, 36464, 155)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3143, 3727, CAST(N'2022-08-12' AS Date), 3, 42438, 481)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3144, 4034, CAST(N'2022-08-12' AS Date), 1, 70933, 144)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3145, 4209, CAST(N'2022-08-12' AS Date), 2, 34404, 488)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3146, 4412, CAST(N'2022-08-12' AS Date), 2, 89909, 148)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3147, 4473, CAST(N'2022-08-12' AS Date), 1, 61479, 898)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3148, 4577, CAST(N'2022-08-12' AS Date), 1, 35238, 156)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3149, 4631, CAST(N'2022-08-12' AS Date), 3, 99617, 151)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3150, 4800, CAST(N'2022-08-12' AS Date), 3, 83772, 482)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3151, 5026, CAST(N'2022-08-12' AS Date), 2, 26817, 479)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3152, 5106, CAST(N'2022-08-12' AS Date), 3, 28605, 899)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3153, 5540, CAST(N'2022-08-12' AS Date), 2, 47633, 477)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3154, 5800, CAST(N'2022-08-12' AS Date), 2, 19728, 153)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3155, 6076, CAST(N'2022-08-12' AS Date), 1, 71765, 149)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3156, 6285, CAST(N'2022-08-12' AS Date), 2, 60388, 147)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3157, 6685, CAST(N'2022-08-12' AS Date), 2, 73140, 154)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3158, 7330, CAST(N'2022-08-12' AS Date), 2, 25165, 486)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3159, 7926, CAST(N'2022-08-12' AS Date), 1, 84762, 478)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3160, 8009, CAST(N'2022-08-12' AS Date), 2, 98053, 152)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3161, 9879, CAST(N'2022-08-12' AS Date), 2, 82797, 487)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3162, 9897, CAST(N'2022-08-12' AS Date), 2, 12209, 489)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3163, 275, CAST(N'2022-08-13' AS Date), 2, 44033, 492)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3164, 723, CAST(N'2022-08-13' AS Date), 2, 47068, 902)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3165, 1110, CAST(N'2022-08-13' AS Date), 2, 23147, 499)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3166, 1224, CAST(N'2022-08-13' AS Date), 2, 86797, 777)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3167, 1541, CAST(N'2022-08-13' AS Date), 2, 35970, 780)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3168, 1568, CAST(N'2022-08-13' AS Date), 3, 78620, 781)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3169, 1970, CAST(N'2022-08-13' AS Date), 1, 62020, 903)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3170, 2208, CAST(N'2022-08-13' AS Date), 1, 72139, 161)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3171, 3273, CAST(N'2022-08-13' AS Date), 3, 74737, 496)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3172, 3288, CAST(N'2022-08-13' AS Date), 1, 54900, 160)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3173, 5497, CAST(N'2022-08-13' AS Date), 2, 70503, 500)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3174, 5631, CAST(N'2022-08-13' AS Date), 3, 73804, 157)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3175, 5639, CAST(N'2022-08-13' AS Date), 1, 71187, 778)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3176, 5760, CAST(N'2022-08-13' AS Date), 2, 98279, 494)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3177, 5816, CAST(N'2022-08-13' AS Date), 1, 86030, 493)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3178, 6056, CAST(N'2022-08-13' AS Date), 2, 29105, 491)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3179, 6198, CAST(N'2022-08-13' AS Date), 2, 24447, 901)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3180, 7568, CAST(N'2022-08-13' AS Date), 3, 65143, 498)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3181, 7591, CAST(N'2022-08-13' AS Date), 2, 78763, 497)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3182, 7611, CAST(N'2022-08-13' AS Date), 3, 13217, 159)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3183, 7746, CAST(N'2022-08-13' AS Date), 3, 74630, 495)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3184, 7993, CAST(N'2022-08-13' AS Date), 1, 40671, 779)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3185, 8111, CAST(N'2022-08-13' AS Date), 1, 80409, 490)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3186, 9165, CAST(N'2022-08-13' AS Date), 1, 85883, 900)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3187, 9796, CAST(N'2022-08-13' AS Date), 1, 90236, 158)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3188, 1887, CAST(N'2022-08-14' AS Date), 3, 53219, 908)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3189, 1941, CAST(N'2022-08-14' AS Date), 3, 79743, 172)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3190, 2182, CAST(N'2022-08-14' AS Date), 2, 34199, 906)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3191, 2419, CAST(N'2022-08-14' AS Date), 3, 26059, 904)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3192, 3113, CAST(N'2022-08-14' AS Date), 2, 53869, 165)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3193, 3462, CAST(N'2022-08-14' AS Date), 3, 44297, 171)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3194, 3817, CAST(N'2022-08-14' AS Date), 2, 81870, 508)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3195, 4012, CAST(N'2022-08-14' AS Date), 2, 21143, 505)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3196, 4205, CAST(N'2022-08-14' AS Date), 3, 40808, 162)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3197, 4457, CAST(N'2022-08-14' AS Date), 2, 99086, 509)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3198, 4533, CAST(N'2022-08-14' AS Date), 3, 56761, 905)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3199, 4627, CAST(N'2022-08-14' AS Date), 2, 23329, 166)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3200, 4680, CAST(N'2022-08-14' AS Date), 1, 22717, 167)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3201, 5161, CAST(N'2022-08-14' AS Date), 2, 80155, 169)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3202, 5843, CAST(N'2022-08-14' AS Date), 2, 72145, 503)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3203, 5881, CAST(N'2022-08-14' AS Date), 3, 11946, 506)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3204, 6866, CAST(N'2022-08-14' AS Date), 2, 33326, 164)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3205, 7119, CAST(N'2022-08-14' AS Date), 3, 47562, 501)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3206, 7245, CAST(N'2022-08-14' AS Date), 3, 78989, 170)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3207, 7278, CAST(N'2022-08-14' AS Date), 3, 73523, 168)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3208, 7431, CAST(N'2022-08-14' AS Date), 1, 77023, 907)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3209, 8125, CAST(N'2022-08-14' AS Date), 1, 70618, 504)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3210, 8954, CAST(N'2022-08-14' AS Date), 3, 74922, 502)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3211, 9225, CAST(N'2022-08-14' AS Date), 3, 72707, 163)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3212, 9932, CAST(N'2022-08-14' AS Date), 1, 58713, 507)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3213, 1024, CAST(N'2022-08-15' AS Date), 2, 19696, 173)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3214, 1627, CAST(N'2022-08-15' AS Date), 2, 64912, 515)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3215, 1632, CAST(N'2022-08-15' AS Date), 2, 53632, 177)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3216, 1693, CAST(N'2022-08-15' AS Date), 2, 45791, 517)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3217, 1694, CAST(N'2022-08-15' AS Date), 3, 79241, 181)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3218, 1767, CAST(N'2022-08-15' AS Date), 1, 92452, 912)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3219, 2099, CAST(N'2022-08-15' AS Date), 3, 56109, 516)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3220, 2154, CAST(N'2022-08-15' AS Date), 2, 91692, 522)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3221, 2667, CAST(N'2022-08-15' AS Date), 2, 39377, 787)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3222, 2767, CAST(N'2022-08-15' AS Date), 3, 73637, 914)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3223, 2831, CAST(N'2022-08-15' AS Date), 1, 79290, 523)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3224, 3247, CAST(N'2022-08-15' AS Date), 1, 69066, 175)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3225, 3430, CAST(N'2022-08-15' AS Date), 2, 21217, 513)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3226, 3752, CAST(N'2022-08-15' AS Date), 1, 72382, 783)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3227, 4918, CAST(N'2022-08-15' AS Date), 2, 83420, 785)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3228, 4971, CAST(N'2022-08-15' AS Date), 2, 45112, 915)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3229, 5283, CAST(N'2022-08-15' AS Date), 3, 54629, 518)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3230, 5330, CAST(N'2022-08-15' AS Date), 2, 55850, 180)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3231, 5373, CAST(N'2022-08-15' AS Date), 2, 47418, 174)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3232, 5704, CAST(N'2022-08-15' AS Date), 3, 73294, 910)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3233, 6032, CAST(N'2022-08-15' AS Date), 3, 47231, 510)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3234, 6096, CAST(N'2022-08-15' AS Date), 2, 23254, 524)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3235, 6161, CAST(N'2022-08-15' AS Date), 3, 94287, 178)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3236, 6367, CAST(N'2022-08-15' AS Date), 3, 96164, 911)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3237, 6643, CAST(N'2022-08-15' AS Date), 3, 74267, 520)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3238, 7100, CAST(N'2022-08-15' AS Date), 1, 66706, 789)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3239, 7106, CAST(N'2022-08-15' AS Date), 1, 13917, 519)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3240, 7182, CAST(N'2022-08-15' AS Date), 3, 10930, 786)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3241, 7201, CAST(N'2022-08-15' AS Date), 2, 26594, 511)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3242, 7242, CAST(N'2022-08-15' AS Date), 1, 75211, 521)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3243, 7261, CAST(N'2022-08-15' AS Date), 3, 68052, 909)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3244, 7552, CAST(N'2022-08-15' AS Date), 3, 98841, 916)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3245, 7570, CAST(N'2022-08-15' AS Date), 3, 19658, 176)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3246, 8277, CAST(N'2022-08-15' AS Date), 3, 39300, 784)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3247, 8315, CAST(N'2022-08-15' AS Date), 2, 98251, 782)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3248, 8414, CAST(N'2022-08-15' AS Date), 1, 38939, 913)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3249, 9021, CAST(N'2022-08-15' AS Date), 1, 83659, 788)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3250, 9132, CAST(N'2022-08-15' AS Date), 3, 26162, 514)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3251, 9178, CAST(N'2022-08-15' AS Date), 3, 64227, 179)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3252, 9288, CAST(N'2022-08-15' AS Date), 3, 79617, 512)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3253, 541, CAST(N'2022-08-16' AS Date), 3, 63634, 918)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3254, 1295, CAST(N'2022-08-16' AS Date), 3, 68635, 920)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3255, 1644, CAST(N'2022-08-16' AS Date), 3, 89684, 528)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3256, 3349, CAST(N'2022-08-16' AS Date), 2, 39218, 191)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3257, 3729, CAST(N'2022-08-16' AS Date), 3, 83573, 192)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3258, 3761, CAST(N'2022-08-16' AS Date), 2, 38788, 185)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3259, 3977, CAST(N'2022-08-16' AS Date), 1, 93399, 184)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3260, 4149, CAST(N'2022-08-16' AS Date), 1, 23384, 530)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3261, 4274, CAST(N'2022-08-16' AS Date), 1, 44020, 791)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3262, 4630, CAST(N'2022-08-16' AS Date), 1, 17428, 790)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3263, 4924, CAST(N'2022-08-16' AS Date), 2, 69920, 187)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3264, 5950, CAST(N'2022-08-16' AS Date), 3, 60134, 526)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3265, 6274, CAST(N'2022-08-16' AS Date), 3, 18782, 188)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3266, 6498, CAST(N'2022-08-16' AS Date), 3, 88076, 529)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3267, 7052, CAST(N'2022-08-16' AS Date), 2, 84062, 193)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3268, 7204, CAST(N'2022-08-16' AS Date), 1, 58442, 917)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3269, 7429, CAST(N'2022-08-16' AS Date), 1, 94643, 531)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3270, 7779, CAST(N'2022-08-16' AS Date), 1, 16733, 186)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3271, 8661, CAST(N'2022-08-16' AS Date), 3, 82507, 183)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3272, 8866, CAST(N'2022-08-16' AS Date), 2, 83748, 182)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3273, 9391, CAST(N'2022-08-16' AS Date), 3, 16969, 189)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3274, 9430, CAST(N'2022-08-16' AS Date), 2, 23535, 190)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3275, 9644, CAST(N'2022-08-16' AS Date), 1, 69998, 525)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3276, 9811, CAST(N'2022-08-16' AS Date), 1, 17947, 919)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3277, 9815, CAST(N'2022-08-16' AS Date), 1, 16049, 527)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3278, 1205, CAST(N'2022-08-17' AS Date), 1, 56512, 793)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3279, 1525, CAST(N'2022-08-17' AS Date), 2, 29625, 540)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3280, 1765, CAST(N'2022-08-17' AS Date), 2, 29794, 796)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3281, 1833, CAST(N'2022-08-17' AS Date), 1, 68020, 534)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3282, 1960, CAST(N'2022-08-17' AS Date), 2, 71209, 535)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3283, 2638, CAST(N'2022-08-17' AS Date), 2, 42850, 922)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3284, 2971, CAST(N'2022-08-17' AS Date), 3, 70015, 923)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3285, 3020, CAST(N'2022-08-17' AS Date), 3, 33720, 797)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3286, 3099, CAST(N'2022-08-17' AS Date), 3, 75504, 921)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3287, 3743, CAST(N'2022-08-17' AS Date), 3, 30549, 196)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3288, 4524, CAST(N'2022-08-17' AS Date), 1, 87819, 202)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3289, 4947, CAST(N'2022-08-17' AS Date), 3, 74635, 541)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3290, 5103, CAST(N'2022-08-17' AS Date), 3, 40586, 199)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3291, 5152, CAST(N'2022-08-17' AS Date), 2, 76470, 201)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3292, 5490, CAST(N'2022-08-17' AS Date), 2, 93542, 532)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3293, 5650, CAST(N'2022-08-17' AS Date), 2, 82565, 194)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3294, 6930, CAST(N'2022-08-17' AS Date), 3, 58932, 536)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3295, 6999, CAST(N'2022-08-17' AS Date), 2, 66299, 200)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3296, 7104, CAST(N'2022-08-17' AS Date), 3, 64959, 533)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3297, 7509, CAST(N'2022-08-17' AS Date), 3, 29510, 198)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3298, 7628, CAST(N'2022-08-17' AS Date), 3, 75130, 543)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3299, 7709, CAST(N'2022-08-17' AS Date), 2, 29610, 539)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3300, 7718, CAST(N'2022-08-17' AS Date), 2, 12906, 798)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3301, 7975, CAST(N'2022-08-17' AS Date), 3, 99341, 544)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3302, 8063, CAST(N'2022-08-17' AS Date), 2, 63215, 538)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3303, 8603, CAST(N'2022-08-17' AS Date), 2, 17883, 542)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3304, 8719, CAST(N'2022-08-17' AS Date), 1, 45730, 197)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3305, 9371, CAST(N'2022-08-17' AS Date), 2, 51637, 792)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3306, 9632, CAST(N'2022-08-17' AS Date), 2, 95972, 537)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3307, 9753, CAST(N'2022-08-17' AS Date), 1, 11319, 195)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3308, 9789, CAST(N'2022-08-17' AS Date), 3, 14487, 795)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3309, 9827, CAST(N'2022-08-17' AS Date), 3, 25511, 794)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3310, 1036, CAST(N'2022-08-18' AS Date), 3, 44445, 210)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3311, 1374, CAST(N'2022-08-18' AS Date), 2, 37319, 549)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3312, 2438, CAST(N'2022-08-18' AS Date), 1, 43825, 548)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3313, 2764, CAST(N'2022-08-18' AS Date), 3, 21828, 926)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3314, 3296, CAST(N'2022-08-18' AS Date), 1, 48711, 925)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3315, 3361, CAST(N'2022-08-18' AS Date), 3, 30128, 924)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3316, 3526, CAST(N'2022-08-18' AS Date), 2, 77269, 800)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3317, 3896, CAST(N'2022-08-18' AS Date), 1, 18241, 802)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3318, 4121, CAST(N'2022-08-18' AS Date), 1, 40555, 206)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3319, 5175, CAST(N'2022-08-18' AS Date), 1, 10213, 546)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3320, 5426, CAST(N'2022-08-18' AS Date), 2, 13187, 551)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3321, 5588, CAST(N'2022-08-18' AS Date), 3, 23945, 799)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3322, 5696, CAST(N'2022-08-18' AS Date), 1, 17595, 547)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3323, 5861, CAST(N'2022-08-18' AS Date), 3, 17392, 801)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3324, 5986, CAST(N'2022-08-18' AS Date), 1, 87642, 205)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3325, 6123, CAST(N'2022-08-18' AS Date), 3, 32219, 211)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3326, 6220, CAST(N'2022-08-18' AS Date), 1, 74642, 552)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3327, 6326, CAST(N'2022-08-18' AS Date), 2, 90564, 927)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3328, 6654, CAST(N'2022-08-18' AS Date), 1, 91376, 553)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3329, 7420, CAST(N'2022-08-18' AS Date), 1, 63168, 203)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3330, 8037, CAST(N'2022-08-18' AS Date), 2, 25835, 209)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3331, 8189, CAST(N'2022-08-18' AS Date), 3, 98172, 207)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3332, 8299, CAST(N'2022-08-18' AS Date), 3, 21642, 545)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3333, 8607, CAST(N'2022-08-18' AS Date), 3, 87141, 204)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3334, 8970, CAST(N'2022-08-18' AS Date), 2, 12922, 208)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3335, 9469, CAST(N'2022-08-18' AS Date), 1, 93341, 550)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3336, 605, CAST(N'2022-08-19' AS Date), 1, 44625, 558)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3337, 1215, CAST(N'2022-08-19' AS Date), 1, 42409, 556)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3338, 1849, CAST(N'2022-08-19' AS Date), 3, 26987, 560)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3339, 1852, CAST(N'2022-08-19' AS Date), 3, 70221, 568)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3340, 2236, CAST(N'2022-08-19' AS Date), 1, 85571, 559)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3341, 2315, CAST(N'2022-08-19' AS Date), 3, 79213, 804)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3342, 2904, CAST(N'2022-08-19' AS Date), 2, 56794, 215)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3343, 2932, CAST(N'2022-08-19' AS Date), 1, 83872, 563)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3344, 3258, CAST(N'2022-08-19' AS Date), 3, 35441, 561)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3345, 3452, CAST(N'2022-08-19' AS Date), 3, 10564, 928)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3346, 3691, CAST(N'2022-08-19' AS Date), 1, 96510, 221)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3347, 4180, CAST(N'2022-08-19' AS Date), 1, 21107, 220)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3348, 4993, CAST(N'2022-08-19' AS Date), 2, 36858, 555)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3349, 5344, CAST(N'2022-08-19' AS Date), 3, 13999, 214)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3350, 5526, CAST(N'2022-08-19' AS Date), 2, 93583, 217)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3351, 5711, CAST(N'2022-08-19' AS Date), 1, 29452, 805)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3352, 5714, CAST(N'2022-08-19' AS Date), 3, 20683, 807)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3353, 5844, CAST(N'2022-08-19' AS Date), 3, 96629, 566)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3354, 6468, CAST(N'2022-08-19' AS Date), 1, 75138, 567)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3355, 6896, CAST(N'2022-08-19' AS Date), 1, 92017, 564)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3356, 6978, CAST(N'2022-08-19' AS Date), 1, 10022, 803)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3357, 7319, CAST(N'2022-08-19' AS Date), 2, 31671, 806)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3358, 7480, CAST(N'2022-08-19' AS Date), 2, 89878, 565)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3359, 7495, CAST(N'2022-08-19' AS Date), 2, 73064, 219)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3360, 8069, CAST(N'2022-08-19' AS Date), 1, 47472, 569)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3361, 8212, CAST(N'2022-08-19' AS Date), 3, 36582, 562)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3362, 8444, CAST(N'2022-08-19' AS Date), 3, 89231, 557)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3363, 8458, CAST(N'2022-08-19' AS Date), 3, 30694, 213)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3364, 8464, CAST(N'2022-08-19' AS Date), 2, 23815, 554)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3365, 9179, CAST(N'2022-08-19' AS Date), 2, 91140, 929)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3366, 9516, CAST(N'2022-08-19' AS Date), 1, 89028, 218)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3367, 9673, CAST(N'2022-08-19' AS Date), 3, 77594, 216)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3368, 9694, CAST(N'2022-08-19' AS Date), 2, 24970, 212)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3369, 341, CAST(N'2022-08-20' AS Date), 2, 52525, 579)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3370, 1031, CAST(N'2022-08-20' AS Date), 3, 28005, 930)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3371, 1111, CAST(N'2022-08-20' AS Date), 3, 99090, 931)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3372, 1232, CAST(N'2022-08-20' AS Date), 1, 57946, 573)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3373, 2426, CAST(N'2022-08-20' AS Date), 1, 30108, 225)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3374, 2452, CAST(N'2022-08-20' AS Date), 2, 27783, 222)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3375, 2636, CAST(N'2022-08-20' AS Date), 2, 19620, 224)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3376, 4166, CAST(N'2022-08-20' AS Date), 2, 29785, 576)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3377, 4618, CAST(N'2022-08-20' AS Date), 2, 10945, 571)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3378, 4658, CAST(N'2022-08-20' AS Date), 2, 23097, 572)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3379, 4917, CAST(N'2022-08-20' AS Date), 2, 61943, 226)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3380, 4974, CAST(N'2022-08-20' AS Date), 1, 46651, 932)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3381, 5563, CAST(N'2022-08-20' AS Date), 3, 42068, 575)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3382, 6245, CAST(N'2022-08-20' AS Date), 2, 10984, 570)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3383, 7349, CAST(N'2022-08-20' AS Date), 3, 52125, 580)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3384, 8010, CAST(N'2022-08-20' AS Date), 2, 46935, 228)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3385, 8497, CAST(N'2022-08-20' AS Date), 1, 34905, 229)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3386, 8694, CAST(N'2022-08-20' AS Date), 1, 98435, 578)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3387, 8870, CAST(N'2022-08-20' AS Date), 1, 10583, 577)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3388, 9037, CAST(N'2022-08-20' AS Date), 2, 59681, 227)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3389, 9794, CAST(N'2022-08-20' AS Date), 3, 71406, 223)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3390, 9969, CAST(N'2022-08-20' AS Date), 2, 38669, 574)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3391, 1163, CAST(N'2022-08-21' AS Date), 1, 42542, 815)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3392, 1240, CAST(N'2022-08-21' AS Date), 2, 66445, 811)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3393, 1663, CAST(N'2022-08-21' AS Date), 2, 60443, 934)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3394, 1773, CAST(N'2022-08-21' AS Date), 3, 60943, 587)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3395, 1801, CAST(N'2022-08-21' AS Date), 2, 39933, 231)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3396, 1948, CAST(N'2022-08-21' AS Date), 2, 85521, 585)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3397, 2241, CAST(N'2022-08-21' AS Date), 2, 38517, 583)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3398, 2482, CAST(N'2022-08-21' AS Date), 2, 27570, 238)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3399, 2749, CAST(N'2022-08-21' AS Date), 1, 94433, 237)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3400, 2921, CAST(N'2022-08-21' AS Date), 2, 66910, 243)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3401, 3282, CAST(N'2022-08-21' AS Date), 1, 10585, 810)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3402, 3902, CAST(N'2022-08-21' AS Date), 1, 39751, 590)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3403, 4291, CAST(N'2022-08-21' AS Date), 1, 32679, 236)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3404, 4500, CAST(N'2022-08-21' AS Date), 2, 52861, 584)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3405, 4756, CAST(N'2022-08-21' AS Date), 1, 95626, 589)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3406, 4806, CAST(N'2022-08-21' AS Date), 1, 11553, 808)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3407, 5063, CAST(N'2022-08-21' AS Date), 2, 68908, 239)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3408, 5230, CAST(N'2022-08-21' AS Date), 3, 89666, 814)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3409, 5239, CAST(N'2022-08-21' AS Date), 3, 29956, 230)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3410, 5343, CAST(N'2022-08-21' AS Date), 2, 62368, 813)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3411, 5871, CAST(N'2022-08-21' AS Date), 2, 64481, 240)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3412, 5981, CAST(N'2022-08-21' AS Date), 1, 35833, 812)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3413, 6334, CAST(N'2022-08-21' AS Date), 1, 33021, 234)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3414, 6602, CAST(N'2022-08-21' AS Date), 1, 99945, 933)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3415, 7223, CAST(N'2022-08-21' AS Date), 1, 40433, 232)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3416, 7540, CAST(N'2022-08-21' AS Date), 3, 77842, 242)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3417, 7597, CAST(N'2022-08-21' AS Date), 3, 51791, 244)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3418, 7694, CAST(N'2022-08-21' AS Date), 2, 61304, 582)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3419, 7900, CAST(N'2022-08-21' AS Date), 2, 44976, 241)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3420, 7965, CAST(N'2022-08-21' AS Date), 2, 76696, 586)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3421, 8002, CAST(N'2022-08-21' AS Date), 3, 56391, 809)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3422, 8883, CAST(N'2022-08-21' AS Date), 2, 95979, 588)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3423, 9163, CAST(N'2022-08-21' AS Date), 3, 18447, 581)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3424, 9384, CAST(N'2022-08-21' AS Date), 3, 66213, 233)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3425, 9504, CAST(N'2022-08-21' AS Date), 1, 20270, 235)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3426, 1049, CAST(N'2022-08-22' AS Date), 2, 79526, 594)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3427, 1533, CAST(N'2022-08-22' AS Date), 1, 81084, 817)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3428, 1916, CAST(N'2022-08-22' AS Date), 3, 64601, 256)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3429, 1926, CAST(N'2022-08-22' AS Date), 3, 83333, 249)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3430, 1942, CAST(N'2022-08-22' AS Date), 3, 23147, 251)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3431, 1975, CAST(N'2022-08-22' AS Date), 3, 64467, 248)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3432, 2489, CAST(N'2022-08-22' AS Date), 2, 36664, 818)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3433, 2862, CAST(N'2022-08-22' AS Date), 2, 83173, 597)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3434, 3118, CAST(N'2022-08-22' AS Date), 2, 50533, 250)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3435, 3176, CAST(N'2022-08-22' AS Date), 1, 19821, 245)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3436, 3362, CAST(N'2022-08-22' AS Date), 2, 93287, 599)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3437, 4331, CAST(N'2022-08-22' AS Date), 3, 76056, 252)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3438, 4611, CAST(N'2022-08-22' AS Date), 1, 50081, 255)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3439, 5035, CAST(N'2022-08-22' AS Date), 3, 94888, 598)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3440, 5738, CAST(N'2022-08-22' AS Date), 3, 57884, 593)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3441, 5787, CAST(N'2022-08-22' AS Date), 1, 90277, 253)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3442, 6062, CAST(N'2022-08-22' AS Date), 2, 44802, 257)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3443, 6170, CAST(N'2022-08-22' AS Date), 3, 39390, 246)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3444, 6317, CAST(N'2022-08-22' AS Date), 2, 51621, 816)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3445, 6396, CAST(N'2022-08-22' AS Date), 3, 73998, 247)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3446, 6434, CAST(N'2022-08-22' AS Date), 3, 78734, 819)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3447, 6669, CAST(N'2022-08-22' AS Date), 1, 15012, 592)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3448, 7058, CAST(N'2022-08-22' AS Date), 1, 65587, 820)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3449, 7168, CAST(N'2022-08-22' AS Date), 3, 79122, 596)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3450, 7914, CAST(N'2022-08-22' AS Date), 1, 12642, 935)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3451, 9196, CAST(N'2022-08-22' AS Date), 3, 59147, 600)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3452, 9587, CAST(N'2022-08-22' AS Date), 1, 21038, 591)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3453, 9741, CAST(N'2022-08-22' AS Date), 3, 83749, 254)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3454, 9984, CAST(N'2022-08-22' AS Date), 2, 76130, 595)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3455, 475, CAST(N'2022-08-23' AS Date), 3, 24628, 605)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3456, 956, CAST(N'2022-08-23' AS Date), 1, 58378, 936)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3457, 1259, CAST(N'2022-08-23' AS Date), 2, 74983, 261)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3458, 1534, CAST(N'2022-08-23' AS Date), 3, 23981, 263)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3459, 1629, CAST(N'2022-08-23' AS Date), 2, 25077, 938)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3460, 2076, CAST(N'2022-08-23' AS Date), 1, 76427, 939)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3461, 3042, CAST(N'2022-08-23' AS Date), 1, 91797, 264)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3462, 3277, CAST(N'2022-08-23' AS Date), 3, 10153, 615)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3463, 3459, CAST(N'2022-08-23' AS Date), 2, 85257, 608)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3464, 3612, CAST(N'2022-08-23' AS Date), 3, 94874, 606)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3465, 3725, CAST(N'2022-08-23' AS Date), 3, 26315, 611)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3466, 3939, CAST(N'2022-08-23' AS Date), 3, 40034, 258)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3467, 4463, CAST(N'2022-08-23' AS Date), 3, 58542, 821)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3468, 4705, CAST(N'2022-08-23' AS Date), 3, 19732, 265)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3469, 4728, CAST(N'2022-08-23' AS Date), 2, 76947, 822)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3470, 4876, CAST(N'2022-08-23' AS Date), 2, 65405, 607)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3471, 5279, CAST(N'2022-08-23' AS Date), 1, 94585, 610)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3472, 5447, CAST(N'2022-08-23' AS Date), 2, 23973, 825)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3473, 5513, CAST(N'2022-08-23' AS Date), 2, 96958, 614)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3474, 5611, CAST(N'2022-08-23' AS Date), 1, 16720, 604)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3475, 5798, CAST(N'2022-08-23' AS Date), 3, 82821, 259)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3476, 5953, CAST(N'2022-08-23' AS Date), 1, 19208, 609)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3477, 6417, CAST(N'2022-08-23' AS Date), 2, 95467, 602)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3478, 6513, CAST(N'2022-08-23' AS Date), 2, 57751, 612)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3479, 6676, CAST(N'2022-08-23' AS Date), 2, 53879, 262)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3480, 6873, CAST(N'2022-08-23' AS Date), 2, 28005, 823)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3481, 7133, CAST(N'2022-08-23' AS Date), 2, 44954, 260)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3482, 7412, CAST(N'2022-08-23' AS Date), 1, 75432, 826)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3483, 8122, CAST(N'2022-08-23' AS Date), 3, 54779, 601)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3484, 8188, CAST(N'2022-08-23' AS Date), 2, 44700, 827)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3485, 8415, CAST(N'2022-08-23' AS Date), 1, 58082, 937)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3486, 9072, CAST(N'2022-08-23' AS Date), 3, 25521, 613)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3487, 9244, CAST(N'2022-08-23' AS Date), 2, 43455, 824)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3488, 9269, CAST(N'2022-08-23' AS Date), 2, 28894, 266)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3489, 9952, CAST(N'2022-08-23' AS Date), 1, 52949, 603)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3490, 286, CAST(N'2022-08-24' AS Date), 3, 98260, 617)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3491, 782, CAST(N'2022-08-24' AS Date), 2, 72769, 830)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3492, 1305, CAST(N'2022-08-24' AS Date), 1, 88102, 619)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3493, 1385, CAST(N'2022-08-24' AS Date), 1, 53248, 620)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3494, 1839, CAST(N'2022-08-24' AS Date), 1, 29395, 625)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3495, 2100, CAST(N'2022-08-24' AS Date), 2, 98010, 631)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3496, 2199, CAST(N'2022-08-24' AS Date), 1, 32343, 629)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3497, 2217, CAST(N'2022-08-24' AS Date), 2, 43294, 832)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3498, 2229, CAST(N'2022-08-24' AS Date), 3, 57734, 272)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3499, 2243, CAST(N'2022-08-24' AS Date), 1, 82993, 278)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3500, 2947, CAST(N'2022-08-24' AS Date), 2, 25781, 834)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3501, 3000, CAST(N'2022-08-24' AS Date), 3, 28299, 626)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3502, 3138, CAST(N'2022-08-24' AS Date), 3, 54135, 831)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3503, 3510, CAST(N'2022-08-24' AS Date), 1, 39259, 628)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3504, 3738, CAST(N'2022-08-24' AS Date), 2, 25071, 624)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3505, 3860, CAST(N'2022-08-24' AS Date), 2, 36289, 273)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3506, 4092, CAST(N'2022-08-24' AS Date), 1, 30110, 277)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3507, 4395, CAST(N'2022-08-24' AS Date), 3, 88457, 268)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3508, 4601, CAST(N'2022-08-24' AS Date), 1, 40656, 828)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3509, 4865, CAST(N'2022-08-24' AS Date), 3, 55308, 279)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3510, 5110, CAST(N'2022-08-24' AS Date), 1, 44545, 623)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3511, 5346, CAST(N'2022-08-24' AS Date), 2, 47239, 616)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3512, 5661, CAST(N'2022-08-24' AS Date), 1, 13237, 627)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3513, 6125, CAST(N'2022-08-24' AS Date), 1, 62685, 267)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3514, 6275, CAST(N'2022-08-24' AS Date), 3, 12923, 829)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3515, 6313, CAST(N'2022-08-24' AS Date), 2, 19517, 621)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3516, 6428, CAST(N'2022-08-24' AS Date), 1, 38821, 622)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3517, 7115, CAST(N'2022-08-24' AS Date), 3, 98945, 275)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3518, 7345, CAST(N'2022-08-24' AS Date), 1, 87891, 833)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3519, 7572, CAST(N'2022-08-24' AS Date), 1, 75825, 618)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3520, 8106, CAST(N'2022-08-24' AS Date), 2, 60547, 271)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3521, 9116, CAST(N'2022-08-24' AS Date), 1, 62666, 630)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3522, 9177, CAST(N'2022-08-24' AS Date), 1, 84322, 276)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3523, 9604, CAST(N'2022-08-24' AS Date), 2, 76407, 274)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3524, 9743, CAST(N'2022-08-24' AS Date), 1, 37963, 269)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3525, 9936, CAST(N'2022-08-24' AS Date), 1, 90197, 270)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3526, 928, CAST(N'2022-08-25' AS Date), 2, 75896, 835)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3527, 1050, CAST(N'2022-08-25' AS Date), 1, 49856, 639)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3528, 1756, CAST(N'2022-08-25' AS Date), 1, 23318, 287)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3529, 2038, CAST(N'2022-08-25' AS Date), 3, 32989, 288)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3530, 2153, CAST(N'2022-08-25' AS Date), 1, 36790, 637)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3531, 2544, CAST(N'2022-08-25' AS Date), 2, 74246, 642)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3532, 2576, CAST(N'2022-08-25' AS Date), 3, 17845, 638)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3533, 2719, CAST(N'2022-08-25' AS Date), 2, 14413, 290)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3534, 2925, CAST(N'2022-08-25' AS Date), 1, 26608, 289)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3535, 3098, CAST(N'2022-08-25' AS Date), 1, 72559, 941)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3536, 3264, CAST(N'2022-08-25' AS Date), 1, 58547, 633)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3537, 3284, CAST(N'2022-08-25' AS Date), 2, 48411, 942)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3538, 3326, CAST(N'2022-08-25' AS Date), 2, 37324, 636)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3539, 3685, CAST(N'2022-08-25' AS Date), 2, 86055, 640)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3540, 4075, CAST(N'2022-08-25' AS Date), 2, 44414, 838)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3541, 4119, CAST(N'2022-08-25' AS Date), 2, 22811, 280)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3542, 4860, CAST(N'2022-08-25' AS Date), 3, 80857, 641)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3543, 5033, CAST(N'2022-08-25' AS Date), 1, 30867, 634)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3544, 5074, CAST(N'2022-08-25' AS Date), 1, 52765, 284)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3545, 5453, CAST(N'2022-08-25' AS Date), 3, 35548, 292)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3546, 6127, CAST(N'2022-08-25' AS Date), 2, 80565, 286)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3547, 6184, CAST(N'2022-08-25' AS Date), 1, 48885, 285)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3548, 6705, CAST(N'2022-08-25' AS Date), 2, 69680, 644)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3549, 6908, CAST(N'2022-08-25' AS Date), 2, 40984, 836)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3550, 7254, CAST(N'2022-08-25' AS Date), 2, 50211, 282)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3551, 7941, CAST(N'2022-08-25' AS Date), 1, 43783, 837)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3552, 7946, CAST(N'2022-08-25' AS Date), 3, 97936, 643)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3553, 8080, CAST(N'2022-08-25' AS Date), 1, 68699, 283)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3554, 8187, CAST(N'2022-08-25' AS Date), 1, 24749, 291)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3555, 9052, CAST(N'2022-08-25' AS Date), 1, 71960, 293)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3556, 9057, CAST(N'2022-08-25' AS Date), 1, 12019, 635)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3557, 9260, CAST(N'2022-08-25' AS Date), 3, 40308, 281)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3558, 9388, CAST(N'2022-08-25' AS Date), 1, 29130, 632)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3559, 9746, CAST(N'2022-08-25' AS Date), 3, 13436, 940)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3560, 425, CAST(N'2022-08-26' AS Date), 1, 68765, 646)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3561, 498, CAST(N'2022-08-26' AS Date), 2, 77110, 843)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3562, 902, CAST(N'2022-08-26' AS Date), 1, 35693, 649)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3563, 1082, CAST(N'2022-08-26' AS Date), 3, 76424, 840)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3564, 1379, CAST(N'2022-08-26' AS Date), 3, 23137, 839)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3565, 1652, CAST(N'2022-08-26' AS Date), 1, 56799, 295)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3566, 1899, CAST(N'2022-08-26' AS Date), 3, 41991, 946)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3567, 2343, CAST(N'2022-08-26' AS Date), 2, 88655, 654)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3568, 2496, CAST(N'2022-08-26' AS Date), 1, 83331, 945)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3569, 3228, CAST(N'2022-08-26' AS Date), 2, 31484, 650)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3570, 4144, CAST(N'2022-08-26' AS Date), 1, 74465, 294)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3571, 4662, CAST(N'2022-08-26' AS Date), 1, 91751, 298)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3572, 4890, CAST(N'2022-08-26' AS Date), 2, 29666, 844)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3573, 5310, CAST(N'2022-08-26' AS Date), 3, 12187, 943)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3574, 5567, CAST(N'2022-08-26' AS Date), 3, 31791, 299)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3575, 5776, CAST(N'2022-08-26' AS Date), 1, 48729, 651)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3576, 5857, CAST(N'2022-08-26' AS Date), 2, 31946, 656)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3577, 6529, CAST(N'2022-08-26' AS Date), 3, 22336, 648)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3578, 6797, CAST(N'2022-08-26' AS Date), 1, 70110, 297)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3579, 7124, CAST(N'2022-08-26' AS Date), 2, 49576, 652)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3580, 7141, CAST(N'2022-08-26' AS Date), 1, 66084, 845)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3581, 7194, CAST(N'2022-08-26' AS Date), 2, 24622, 653)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3582, 7336, CAST(N'2022-08-26' AS Date), 2, 71249, 947)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3583, 7387, CAST(N'2022-08-26' AS Date), 2, 18988, 655)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3584, 7484, CAST(N'2022-08-26' AS Date), 1, 10884, 647)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3585, 7675, CAST(N'2022-08-26' AS Date), 3, 17223, 841)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3586, 7928, CAST(N'2022-08-26' AS Date), 3, 78285, 842)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3587, 7954, CAST(N'2022-08-26' AS Date), 3, 51187, 296)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3588, 8028, CAST(N'2022-08-26' AS Date), 2, 46234, 944)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3589, 9203, CAST(N'2022-08-26' AS Date), 3, 61650, 657)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3590, 9766, CAST(N'2022-08-26' AS Date), 1, 71890, 645)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3591, 1138, CAST(N'2022-08-27' AS Date), 3, 30666, 948)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3592, 1149, CAST(N'2022-08-27' AS Date), 1, 57342, 661)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3593, 1726, CAST(N'2022-08-27' AS Date), 3, 56571, 663)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3594, 1830, CAST(N'2022-08-27' AS Date), 1, 85359, 302)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3595, 1885, CAST(N'2022-08-27' AS Date), 3, 71307, 951)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3596, 2300, CAST(N'2022-08-27' AS Date), 1, 26471, 305)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3597, 2721, CAST(N'2022-08-27' AS Date), 1, 14709, 301)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3598, 3024, CAST(N'2022-08-27' AS Date), 2, 91787, 306)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3599, 3260, CAST(N'2022-08-27' AS Date), 1, 98608, 658)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3600, 4239, CAST(N'2022-08-27' AS Date), 1, 99428, 662)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3601, 4765, CAST(N'2022-08-27' AS Date), 2, 41536, 666)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3602, 4921, CAST(N'2022-08-27' AS Date), 3, 79709, 664)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3603, 5142, CAST(N'2022-08-27' AS Date), 3, 34056, 660)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3604, 6080, CAST(N'2022-08-27' AS Date), 3, 72054, 949)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3605, 6533, CAST(N'2022-08-27' AS Date), 1, 32791, 311)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3606, 7180, CAST(N'2022-08-27' AS Date), 3, 19782, 665)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3607, 7444, CAST(N'2022-08-27' AS Date), 1, 55064, 309)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3608, 8008, CAST(N'2022-08-27' AS Date), 3, 40117, 950)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3609, 8015, CAST(N'2022-08-27' AS Date), 1, 85486, 308)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3610, 8457, CAST(N'2022-08-27' AS Date), 1, 71027, 303)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3611, 8650, CAST(N'2022-08-27' AS Date), 3, 13236, 310)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3612, 8823, CAST(N'2022-08-27' AS Date), 3, 19610, 304)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3613, 9088, CAST(N'2022-08-27' AS Date), 3, 95299, 300)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3614, 9317, CAST(N'2022-08-27' AS Date), 1, 45902, 659)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3615, 9447, CAST(N'2022-08-27' AS Date), 2, 46309, 307)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3616, 966, CAST(N'2022-08-28' AS Date), 1, 59332, 323)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3617, 1097, CAST(N'2022-08-28' AS Date), 3, 93327, 322)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3618, 1107, CAST(N'2022-08-28' AS Date), 2, 89862, 315)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3619, 1285, CAST(N'2022-08-28' AS Date), 2, 74806, 318)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3620, 1547, CAST(N'2022-08-28' AS Date), 3, 21895, 670)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3621, 1555, CAST(N'2022-08-28' AS Date), 1, 74298, 317)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3622, 1702, CAST(N'2022-08-28' AS Date), 2, 80182, 314)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3623, 1706, CAST(N'2022-08-28' AS Date), 2, 72788, 671)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3624, 1745, CAST(N'2022-08-28' AS Date), 1, 35711, 847)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3625, 1935, CAST(N'2022-08-28' AS Date), 1, 52310, 325)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3626, 1964, CAST(N'2022-08-28' AS Date), 2, 24557, 669)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3627, 2148, CAST(N'2022-08-28' AS Date), 1, 96834, 326)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3628, 2332, CAST(N'2022-08-28' AS Date), 2, 28807, 312)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3629, 2508, CAST(N'2022-08-28' AS Date), 1, 99440, 320)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3630, 3280, CAST(N'2022-08-28' AS Date), 3, 97797, 324)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3631, 4510, CAST(N'2022-08-28' AS Date), 3, 26343, 673)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3632, 4715, CAST(N'2022-08-28' AS Date), 3, 99835, 313)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3633, 5182, CAST(N'2022-08-28' AS Date), 1, 38739, 848)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3634, 5256, CAST(N'2022-08-28' AS Date), 2, 78964, 954)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3635, 5309, CAST(N'2022-08-28' AS Date), 1, 76087, 676)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3636, 5332, CAST(N'2022-08-28' AS Date), 2, 50347, 677)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3637, 5802, CAST(N'2022-08-28' AS Date), 3, 55866, 667)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3638, 6328, CAST(N'2022-08-28' AS Date), 1, 97854, 846)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3639, 6881, CAST(N'2022-08-28' AS Date), 2, 29106, 952)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3640, 6971, CAST(N'2022-08-28' AS Date), 3, 30884, 327)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3641, 7113, CAST(N'2022-08-28' AS Date), 3, 95852, 675)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3642, 7332, CAST(N'2022-08-28' AS Date), 2, 47290, 316)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3643, 7838, CAST(N'2022-08-28' AS Date), 2, 77971, 953)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3644, 7989, CAST(N'2022-08-28' AS Date), 1, 61854, 674)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3645, 8097, CAST(N'2022-08-28' AS Date), 1, 96791, 672)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3646, 8117, CAST(N'2022-08-28' AS Date), 3, 36457, 319)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3647, 8274, CAST(N'2022-08-28' AS Date), 3, 86409, 321)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3648, 9509, CAST(N'2022-08-28' AS Date), 1, 95630, 668)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3649, 761, CAST(N'2022-08-29' AS Date), 2, 81263, 679)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3650, 922, CAST(N'2022-08-29' AS Date), 2, 10174, 687)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3651, 1210, CAST(N'2022-08-29' AS Date), 3, 77794, 686)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3652, 1441, CAST(N'2022-08-29' AS Date), 1, 84670, 957)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3653, 1496, CAST(N'2022-08-29' AS Date), 3, 15231, 332)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3654, 1611, CAST(N'2022-08-29' AS Date), 2, 60013, 850)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3655, 1725, CAST(N'2022-08-29' AS Date), 2, 86431, 680)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3656, 2878, CAST(N'2022-08-29' AS Date), 2, 36437, 956)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3657, 3778, CAST(N'2022-08-29' AS Date), 2, 53834, 685)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3658, 3984, CAST(N'2022-08-29' AS Date), 3, 22803, 688)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3659, 3985, CAST(N'2022-08-29' AS Date), 1, 13483, 691)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3660, 5015, CAST(N'2022-08-29' AS Date), 2, 37571, 684)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3661, 6108, CAST(N'2022-08-29' AS Date), 3, 90819, 955)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3662, 6767, CAST(N'2022-08-29' AS Date), 2, 74942, 682)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3663, 6826, CAST(N'2022-08-29' AS Date), 3, 89996, 689)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3664, 7061, CAST(N'2022-08-29' AS Date), 1, 29968, 678)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3665, 7365, CAST(N'2022-08-29' AS Date), 3, 75146, 851)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3666, 7517, CAST(N'2022-08-29' AS Date), 2, 84888, 683)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3667, 8390, CAST(N'2022-08-29' AS Date), 2, 51577, 849)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3668, 8549, CAST(N'2022-08-29' AS Date), 1, 86702, 681)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3669, 8805, CAST(N'2022-08-29' AS Date), 1, 83823, 690)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3670, 924, CAST(N'2022-08-30' AS Date), 1, 87457, 964)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3671, 984, CAST(N'2022-08-30' AS Date), 1, 11261, 963)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3672, 1356, CAST(N'2022-08-30' AS Date), 2, 59518, 959)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3673, 1360, CAST(N'2022-08-30' AS Date), 2, 62019, 701)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3674, 1566, CAST(N'2022-08-30' AS Date), 3, 38539, 855)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3675, 1614, CAST(N'2022-08-30' AS Date), 2, 98070, 705)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3676, 1653, CAST(N'2022-08-30' AS Date), 1, 20037, 703)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3677, 1858, CAST(N'2022-08-30' AS Date), 2, 81048, 696)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3678, 2018, CAST(N'2022-08-30' AS Date), 1, 83682, 698)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3679, 2679, CAST(N'2022-08-30' AS Date), 1, 21297, 706)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3680, 2948, CAST(N'2022-08-30' AS Date), 1, 73308, 852)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3681, 3062, CAST(N'2022-08-30' AS Date), 3, 24345, 854)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3682, 3417, CAST(N'2022-08-30' AS Date), 1, 99484, 346)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3683, 3580, CAST(N'2022-08-30' AS Date), 3, 70066, 350)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3684, 4004, CAST(N'2022-08-30' AS Date), 3, 14943, 700)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3685, 4112, CAST(N'2022-08-30' AS Date), 3, 41104, 345)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3686, 4930, CAST(N'2022-08-30' AS Date), 3, 13245, 343)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3687, 5010, CAST(N'2022-08-30' AS Date), 1, 62838, 961)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3688, 5476, CAST(N'2022-08-30' AS Date), 2, 49709, 342)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3689, 5531, CAST(N'2022-08-30' AS Date), 2, 13575, 348)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3690, 6005, CAST(N'2022-08-30' AS Date), 1, 49812, 960)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3691, 6215, CAST(N'2022-08-30' AS Date), 2, 53155, 695)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3692, 6722, CAST(N'2022-08-30' AS Date), 1, 97124, 702)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3693, 7398, CAST(N'2022-08-30' AS Date), 3, 65456, 694)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3694, 7600, CAST(N'2022-08-30' AS Date), 1, 92942, 697)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3695, 8251, CAST(N'2022-08-30' AS Date), 3, 61642, 692)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3696, 8293, CAST(N'2022-08-30' AS Date), 1, 33291, 693)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3697, 8556, CAST(N'2022-08-30' AS Date), 2, 22834, 704)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3698, 8558, CAST(N'2022-08-30' AS Date), 2, 79240, 962)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3699, 8653, CAST(N'2022-08-30' AS Date), 2, 93468, 349)
GO
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3700, 8705, CAST(N'2022-08-30' AS Date), 1, 58857, 340)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3701, 8750, CAST(N'2022-08-30' AS Date), 3, 30589, 339)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3702, 8848, CAST(N'2022-08-30' AS Date), 1, 11545, 853)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3703, 8998, CAST(N'2022-08-30' AS Date), 3, 69837, 699)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3704, 9102, CAST(N'2022-08-30' AS Date), 1, 18497, 347)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3705, 9214, CAST(N'2022-08-30' AS Date), 3, 46000, 344)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3706, 9901, CAST(N'2022-08-30' AS Date), 1, 66884, 958)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3707, 9981, CAST(N'2022-08-30' AS Date), 1, 58204, 341)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3708, 1041, CAST(N'2022-08-31' AS Date), 1, 10534, 355)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3709, 1168, CAST(N'2022-08-31' AS Date), 3, 54138, 712)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3710, 1392, CAST(N'2022-08-31' AS Date), 2, 70258, 857)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3711, 1519, CAST(N'2022-08-31' AS Date), 1, 58265, 710)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3712, 1681, CAST(N'2022-08-31' AS Date), 3, 10471, 856)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3713, 1781, CAST(N'2022-08-31' AS Date), 2, 38440, 859)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3714, 2264, CAST(N'2022-08-31' AS Date), 3, 18424, 354)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3715, 2939, CAST(N'2022-08-31' AS Date), 1, 78157, 966)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3716, 3370, CAST(N'2022-08-31' AS Date), 3, 99198, 715)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3717, 3418, CAST(N'2022-08-31' AS Date), 3, 60343, 359)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3718, 4382, CAST(N'2022-08-31' AS Date), 1, 28875, 357)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3719, 4725, CAST(N'2022-08-31' AS Date), 3, 89048, 858)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3720, 5201, CAST(N'2022-08-31' AS Date), 3, 40808, 711)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3721, 5252, CAST(N'2022-08-31' AS Date), 2, 71446, 709)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3722, 5369, CAST(N'2022-08-31' AS Date), 3, 32489, 713)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3723, 5648, CAST(N'2022-08-31' AS Date), 3, 24809, 352)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3724, 6075, CAST(N'2022-08-31' AS Date), 1, 73022, 351)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3725, 6097, CAST(N'2022-08-31' AS Date), 1, 92904, 356)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3726, 6337, CAST(N'2022-08-31' AS Date), 1, 60127, 358)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3727, 6911, CAST(N'2022-08-31' AS Date), 2, 14364, 716)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3728, 6949, CAST(N'2022-08-31' AS Date), 1, 21495, 708)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3729, 7876, CAST(N'2022-08-31' AS Date), 3, 16166, 717)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3730, 8025, CAST(N'2022-08-31' AS Date), 1, 75327, 719)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3731, 8082, CAST(N'2022-08-31' AS Date), 1, 36627, 714)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3732, 8264, CAST(N'2022-08-31' AS Date), 3, 37174, 353)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3733, 9036, CAST(N'2022-08-31' AS Date), 1, 53109, 860)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3734, 9144, CAST(N'2022-08-31' AS Date), 1, 67089, 965)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3735, 9297, CAST(N'2022-08-31' AS Date), 3, 17468, 707)
INSERT [dbo].[Pagos] ([ID], [NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad]) VALUES (3736, 9669, CAST(N'2022-08-31' AS Date), 1, 36586, 718)
SET IDENTITY_INSERT [dbo].[Pagos] OFF
GO
INSERT [dbo].[PatenteComercial] ([ID], [ValorFijo]) VALUES (4, 150000.0000)
GO
SET IDENTITY_INSERT [dbo].[PeriodoMontoCC] ON 

INSERT [dbo].[PeriodoMontoCC] ([ID], [Nombre], [QMeses]) VALUES (1, N'Mensual', 1)
INSERT [dbo].[PeriodoMontoCC] ([ID], [Nombre], [QMeses]) VALUES (2, N'Trimestral', 3)
INSERT [dbo].[PeriodoMontoCC] ([ID], [Nombre], [QMeses]) VALUES (3, N'Semestral', 6)
INSERT [dbo].[PeriodoMontoCC] ([ID], [Nombre], [QMeses]) VALUES (4, N'Anual', 12)
INSERT [dbo].[PeriodoMontoCC] ([ID], [Nombre], [QMeses]) VALUES (5, N'Cobro único', 1)
SET IDENTITY_INSERT [dbo].[PeriodoMontoCC] OFF
GO
INSERT [dbo].[RecoleccionBasura] ([ID], [ValorMinimo], [ValorFijo], [ValorM2Minimo], [ValorTractosM2]) VALUES (3, 150.0000, 300.0000, 400.0000, 200.0000)
GO
INSERT [dbo].[ReconexionAgua] ([ID], [ValorFijo]) VALUES (5, 30000.0000)
GO
INSERT [dbo].[TasaInteresAP] ([ID], [PlazoMeses], [TasaInteres]) VALUES (1, 3, 0.1)
INSERT [dbo].[TasaInteresAP] ([ID], [PlazoMeses], [TasaInteres]) VALUES (2, 4, 0.11)
INSERT [dbo].[TasaInteresAP] ([ID], [PlazoMeses], [TasaInteres]) VALUES (3, 5, 0.12)
INSERT [dbo].[TasaInteresAP] ([ID], [PlazoMeses], [TasaInteres]) VALUES (4, 6, 0.13)
GO
SET IDENTITY_INSERT [dbo].[TipoDocIdent] ON 

INSERT [dbo].[TipoDocIdent] ([ID], [Nombre], [Mascara]) VALUES (1, N'Cedula CR', N'X-XXXX-XXXX')
INSERT [dbo].[TipoDocIdent] ([ID], [Nombre], [Mascara]) VALUES (2, N'Persona Jurídica CR', N'X-XXX-XXXXXX')
INSERT [dbo].[TipoDocIdent] ([ID], [Nombre], [Mascara]) VALUES (3, N' Pasaporte CR', N'X-XXXX-XXXX')
SET IDENTITY_INSERT [dbo].[TipoDocIdent] OFF
GO
INSERT [dbo].[TipoEstadoFactura] ([ID], [Nombre]) VALUES (1, N'Pendiente de pago')
INSERT [dbo].[TipoEstadoFactura] ([ID], [Nombre]) VALUES (2, N'Pagado normal')
INSERT [dbo].[TipoEstadoFactura] ([ID], [Nombre]) VALUES (3, N'Pagado mediante arreglo de pago')
INSERT [dbo].[TipoEstadoFactura] ([ID], [Nombre]) VALUES (4, N'Anulado')
GO
SET IDENTITY_INSERT [dbo].[TipoMontoCC] ON 

INSERT [dbo].[TipoMontoCC] ([ID], [Nombre]) VALUES (1, N'Monto Fijo')
INSERT [dbo].[TipoMontoCC] ([ID], [Nombre]) VALUES (2, N'Monto Variable')
INSERT [dbo].[TipoMontoCC] ([ID], [Nombre]) VALUES (3, N'MontoXPorcentaje')
SET IDENTITY_INSERT [dbo].[TipoMontoCC] OFF
GO
INSERT [dbo].[TipoMovimiento] ([ID], [Nombre]) VALUES (1, N'Credito')
INSERT [dbo].[TipoMovimiento] ([ID], [Nombre]) VALUES (2, N'Debito')
GO
SET IDENTITY_INSERT [dbo].[TipoMovimientoConsumo] ON 

INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (1, N'Lectura')
INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (2, N'Ajuste Credito')
INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (3, N'Ajuste Debito')
SET IDENTITY_INSERT [dbo].[TipoMovimientoConsumo] OFF
GO
INSERT [dbo].[TipoPago] ([ID], [Nombre]) VALUES (1, N'Efectivo')
INSERT [dbo].[TipoPago] ([ID], [Nombre]) VALUES (2, N'Tarjeta de débito o crédito')
INSERT [dbo].[TipoPago] ([ID], [Nombre]) VALUES (3, N'Transferencia bancaria')
INSERT [dbo].[TipoPago] ([ID], [Nombre]) VALUES (4, N'Arreglo de Pago')
GO
SET IDENTITY_INSERT [dbo].[TipoTerreno] ON 

INSERT [dbo].[TipoTerreno] ([ID], [Nombre]) VALUES (1, N'Habitacion')
INSERT [dbo].[TipoTerreno] ([ID], [Nombre]) VALUES (2, N'Comercial')
INSERT [dbo].[TipoTerreno] ([ID], [Nombre]) VALUES (3, N'Industrial')
INSERT [dbo].[TipoTerreno] ([ID], [Nombre]) VALUES (4, N'Lote baldio')
INSERT [dbo].[TipoTerreno] ([ID], [Nombre]) VALUES (5, N'Agricola')
SET IDENTITY_INSERT [dbo].[TipoTerreno] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoZona] ON 

INSERT [dbo].[TipoZona] ([ID], [Nombre]) VALUES (1, N'Residencial')
INSERT [dbo].[TipoZona] ([ID], [Nombre]) VALUES (2, N'Agricola')
INSERT [dbo].[TipoZona] ([ID], [Nombre]) VALUES (3, N'Bosque')
INSERT [dbo].[TipoZona] ([ID], [Nombre]) VALUES (4, N'Zona industrial')
INSERT [dbo].[TipoZona] ([ID], [Nombre]) VALUES (5, N'Zona comercial')
SET IDENTITY_INSERT [dbo].[TipoZona] OFF
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
/****** Object:  StoredProcedure [dbo].[asociarPXP]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[asociarPXU]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[consultarFacturasparaAP]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[deletePerson]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[deleteProperty]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[deleteUser]    Script Date: 28/11/2022 12:14:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteUser]
	@inUsername VARCHAR(128),
	@inPassword VARCHAR(128),
	@inTipoUsuario VARCHAR(128),
	@outResultCode INT OUTPUT
	--Los parámetros anteriores permiten buscar al usuario para eliminarlo.
AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
	BEGIN TRY
		IF EXISTS(SELECT U.UserName, U.Password, U.TipoUsuario, U.IdPersona FROM Municipalidad.dbo.Usuario U WHERE
					U.UserName = @inUsername and U.Password = @inPassword and U.TipoUsuario = @inTipoUsuario)
			BEGIN --Se verifica que el usuario exista y seguidamente lo elimina utilizando los parámetros del SP.
				DELETE FROM dbo.Usuario WHERE Username = @inUsername and Password = @inPassword and TipoUsuario = @inTipoUsuario;
			END
	END TRY
	BEGIN CATCH --Toma errores en el SP
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
			Set @outResultCode=50014; --Establece el código de error 

	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[desasociarPXP]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[desasociarPXU]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[detalleXF]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[insertPerson]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[insertProperty]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[insertUser]    Script Date: 28/11/2022 12:14:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertUser]
	@inDocID BIGINT,
	@inUsername VARCHAR(128),
	@inPassword VARCHAR(128),
	@inTipoUsuario VARCHAR(128),
	@outResultCode INT OUTPUT
	--Los parámetros anteriores permiten la creación de un usuario.

AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
	BEGIN TRY
		--Si el usuario no existe, se procede a crearlo e insertarlo en la tabla Usuario. 
		IF NOT EXISTS(SELECT U.UserName, U.Password, U.TipoUsuario FROM Municipalidad.dbo.Usuario U WHERE
					U.UserName = @inUsername and U.Password = @inPassword and U.TipoUsuario = @inTipoUsuario) --Si no existe, se inserta el nuevo usuario.
				BEGIN TRANSACTION tInsertUser
				-- La siguiente variable se utiliza para la agregación, buscando el ID mediante el documento de Identidad.
					DECLARE @inIdPersona INT = (SELECT P.ID FROM dbo.Persona P WHERE P.ValorDocId = @inDocID); 
					INSERT INTO Municipalidad.dbo.Usuario
					(
						UserName,
						Password,
						TipoUsuario,
						IdPersona
					)
					VALUES
					(
						@inUsername,
						@inPassword,
						@inTipoUsuario,
						@inIdPersona
					)
					DECLARE @afterUpdate VARCHAR(500) = (SELECT U.UserName, U.Password, U.TipoUsuario FROM Municipalidad.dbo.Usuario U WHERE
					U.UserName = @inUsername and U.Password = @inPassword FOR JSON AUTO);
					DECLARE @inId INT = (SELECT U.ID FROM dbo.Usuario U WHERE U.UserName = @inUsername and U.Password = @inPassword)
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
						@inId,
						null,
						@afterUpdate,
						GETDATE(),
						'Admin',
						'192.168.0.1'
						)
				COMMIT TRANSACTION
	END TRY
	BEGIN CATCH --Inserta el error en la tabla DBErrors, en caso de que exista alguno. 
	IF @@TRANCOUNT > 1
		ROLLBACK TRANSACTION tInsertUser
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

		SET @outResultCode = 50012;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertXML]    Script Date: 28/11/2022 12:14:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertXML]
AS 
BEGIN
delete from [dbo].[Usuario]
delete from [dbo].[Persona]
delete from [dbo].[TipoDocIdent] --Remueve los datos de la tabla
delete from [dbo].[TipoTerreno]
delete from [dbo].[TipoZona]
delete from [dbo].[ConceptoCobro]
DBCC CHECKIDENT ('ConceptoCobro', RESEED,0)
DBCC CHECKIDENT ('TipoDocIdent', RESEED, 0) -- Se reinicia el id de la tabla(para que comience en 0)
DBCC CHECKIDENT ('TipoTerreno', RESEED, 0)
DBCC CHECKIDENT ('TipoZona', RESEED, 0) 
DECLARE @xmlData XML -- Se declara la variable XML

 SET @xmlData = ( -- Se define la variable XML, se utiliza la dirección del archivo
		SELECT *
		FROM OPENROWSET(BULK 'C:\Users\javie\Desktop\XML\Catalogo.xml', SINGLE_BLOB) 
		AS xmlData
		);
INSERT INTO [dbo].[ConceptoCobro]
SELECT  
	T.Item.value('@Nombre', 'VARCHAR(128)') AS Nombre,
	T.Item.value('@TipoMontoCC', 'VARCHAR(128)') AS TipoMontoCC ,
	T.Item.value('@PeriodoMontoCC', 'VARCHAR(128)') AS PeriodoMonto, 
	T.Item.value('@ValorMinimo', 'VARCHAR(128)') AS ValorMinimo ,
	T.Item.value('@ValorMinimoM3', 'VARCHAR(128)') AS ValorMinimoM3, 
	T.Item.value('@Valorm3', 'VARCHAR(128)') AS Valorm3 ,
	T.Item.value('@ValorPorcentual', 'VARCHAR(128)') AS ValorPorcentual ,
	T.Item.value('@ValorFijo', 'VARCHAR(128)') AS ValorFijo ,
	T.Item.value('@ValorM2Minimo', 'VARCHAR(128)') AS ValorM2Minimo,
	T.Item.value('@ValorTractosM2', 'VARCHAR(128)') AS ValorTractosM2,
	T.Item.value('@ValorFijoM3Adicional', 'VARCHAR(128)') AS ValorFijoM3Adicional

FROM @xmlData.nodes('Catalogo/CCs/CC') 
AS T(Item)

INSERT INTO [dbo].[TipoDocIdent] -- Se insertan los datos en la tabla X
SELECT  
	T.Item.value('@Nombre', 'VARCHAR(128)') AS Nombre, -- Se asigna el valor del atributo de la instanciaXML al atributo de la tabla 
	T.Item.value('@Mascara', 'VARCHAR(128)') AS Mascara
FROM @xmlData.nodes('Catalogo/TipoDocumentoIdentidades/TipoDocumentoIdentidad') -- Se selecciona la raiz/subraiz del arbol XML de interes
AS T(Item)

INSERT INTO [dbo].[TipoTerreno] -- Se insertan los datos en la tabla X
SELECT  
	T.Item.value('@Nombre', 'VARCHAR(128)') AS Nombre 
FROM @xmlData.nodes('Catalogo/TipoZonaPropiedades/TipoZonaPropiedad') -- Se selecciona la raiz/subraiz del arbol XML de interes
AS T(Item)

INSERT INTO [dbo].[TipoZona] 
SELECT  
	T.Item.value('@Nombre', 'VARCHAR(128)') AS Nombre 
FROM @xmlData.nodes('Catalogo/TipoZonaPropiedades/TipoZonaPropiedad') 
AS T(Item)

INSERT INTO [dbo].[TipoMovimientoConsumo]
SELECT  
	T.Item.value('@Nombre', 'VARCHAR(128)') AS Nombre 
FROM @xmlData.nodes('Catalogo/TipoZonaPropiedades/TipoZonaPropiedad') 
AS T(Item)

END
exec [dbo].[InsertXML]
GO
/****** Object:  StoredProcedure [dbo].[InsertXMLIterative]    Script Date: 28/11/2022 12:14:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertXMLIterative]

	@outResultCode INT

AS
BEGIN
	SET	@outResultCode = 0;
	SET NOCOUNT ON;

BEGIN TRY

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

DELETE
FROM Factura

DBCC CHECKIDENT (
		'Factura'
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
FROM Propiedad

DBCC CHECKIDENT (
		'Propiedad'
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

DECLARE @count INT
DECLARE @xmlData XML
	,-- Se declara la variable XM
	@index INT = 0
	,@totalOp INT
	,@FechaAux DATE

SET @xmlData = (
		-- Se define la variable XML, se utiliza la dirección del archivo
		SELECT *
		FROM OPENROWSET(BULK 'C:\Users\javie\Desktop\XML\Operaciones.xml', SINGLE_BLOB) AS xmlData
		);
SET @totalOp = (
		SELECT COUNT(*)
		FROM @xmlData.nodes('Datos/Operacion') T(item)
		) --Define la cantidad de días de Operación

DECLARE @tempPersonas TABLE ( --Declaramos las tablas temporale necesarias
	
	[Nombre] VARCHAR(128)
	,[ValorDocId] BIGINT
	,[IdTipoDoc] INT
	,[email] VARCHAR(128)
	,[telefono1] BIGINT
	,[telefono2] BIGINT
	)
DECLARE @tempPropiedades TABLE (
	[Area] FLOAT
	,[ValorFiscal] VARCHAR(128)
	,[FechaRegistro] DATE
	,[IdTipoTerreno] INT
	,[IdTipoZona] INT
	,[NumeroFinca] INT
	)
DECLARE @auxTempPropiedades TABLE (
	[ID] INT
	,[Area] FLOAT
	,[ValorFiscal] VARCHAR(128)
	,[FechaRegistro] DATE
	,[IdTipoTerreno] INT
	,[IdTipoZona] INT
	,[NumeroFinca] INT
	)
DECLARE @tempUsuario TABLE (
	[UserName] VARCHAR(128)
	,[Passwords] VARCHAR(128)
	,[TipoUsuario] VARCHAR(128)
	,[IdPersona] INT
	)
DECLARE @tempPXP TABLE (
	[IdPersona] INT
	,[IdPropiedad] INT
	,[FechaInicio] DATE
	,[FechaFin] DATE
	)
DECLARE @tempPXU TABLE (
	[IdUsuario] INT
	,[IdPropiedad] INT
	,[FechaInicio] DATE
	,[FechaFin] DATE
	)
DECLARE @tempPropiedadCCAgua TABLE (
	[NumeroMedidor] VARCHAR(128)
	,[SaldoAcumulado] MONEY
	)
DECLARE @tempMovimientoConsumo TABLE (
	[Fecha] DATE
	,[Monto] MONEY
	,[IdTipoMovimiento] INT
	,[IdPropiedadCCAgua] INT
	)
DECLARE @tempPagos TABLE (
	NumFinca INT
	,Fecha DATE
	,TipoPago VARCHAR(128)
	,Comprobante INT
	)

WHILE (@index < @totalOp) --Iniciamos el ciclo, aquí se llenan las tablas PropiedadXCC,Pagos,Personas,Propiedades
BEGIN
	SET @index = @index + 1;
	SET @FechaAux = (
			SELECT item.value('@Fecha', 'DATE') AS Fecha
			FROM @xmlData.nodes('Datos/Operacion[sql:variable("@index")]') T(item)
			)

	INSERT INTO @tempPropiedadCCAgua (
		NumeroMedidor
		,SaldoAcumulado
		)
	SELECT item.value('@NumeroMedidor', 'VARCHAR(128)') AS NumeroMedidor
		,SaldoAcumulado = 0
	FROM @xmlData.nodes('Datos/Operacion[sql:variable("@index")]/Propiedades/Propiedad') T(item)

	INSERT INTO @tempPagos (
		NumFinca
		,Fecha
		,TipoPago
		,Comprobante
		)
	SELECT T.item.value('@NumFinca', 'INT') AS NumFinca
		,Fecha = @FechaAux
		,T.item.value('@TipoPago', 'VARCHAR(128)') AS TipoPago
		,T.item.value('@NumeroReferenciaComprobantePago', 'INT') AS Comprobante
	FROM @xmlData.nodes('Datos/Operacion[sql:variable("@index")]/Pago/Pago') T(item)

	INSERT INTO @tempPersonas (
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


	INSERT INTO @tempPropiedades (
		Area
		,ValorFiscal
		,FechaRegistro
		,IdTipoTerreno
		,IdTipoZona
		,NumeroFinca
		)
	SELECT item.value('@MetrosCuadrados', 'FLOAT') AS 'Area'
		,item.value('@ValorFiscal', 'BIGINT') AS 'ValorFiscal'
		,FechaRegistro = @FechaAux
		,X.ID AS 'IdTipoTerreno'
		,Z.ID AS 'IdTipoZona'
		,item.value('@NumeroFinca', 'INT') AS 'NumeroFinca'
	FROM @xmlData.nodes('Datos/Operacion[sql:variable("@index")]/Propiedades/Propiedad') T(item)
	INNER JOIN dbo.TipoZona Z ON Z.Nombre = T.Item.value('@tipoZonaPropiedad', 'VARCHAR(128)')
	INNER JOIN dbo.TipoTerreno X ON X.Nombre = T.Item.value('@tipoUsoPropiedad', 'VARCHAR(128)')

	INSERT INTO Pagos([NumFinca], [Fecha], [TipoPago], [Comprobante], [IdPropiedad])
	SELECT 
	item.value('@NumFinca', 'INT') AS NumFinca,
	@FechaAux AS Fecha,
	item.value('@TipoPago', 'VARCHAR(128)') AS TipoPago,
	item.value('@NumeroReferenciaComprobantePago', 'INT') AS Comprobante,
	Propiedad.ID  AS IdPropiedad
	FROM @xmlData.nodes('Datos/Operacion[sql:variable("@index")]/Pago/Pago') T(item)
	INNER JOIN Propiedad
	ON Propiedad.NumeroFinca =T.Item.value('@NumFinca', 'VARCHAR(128)')
	
	CONTINUE
END

INSERT INTO dbo.Persona (
	[Nombre]
	,[ValorDocId]
	,[IdTipoDoc]
	,[email]
	,[telefono1]
	,[telefono2]
	)
SELECT [Nombre]
	,[ValorDocId]
	,[IdTipoDoc]
	,[email]
	,[telefono1]
	,[telefono2]
FROM @tempPersonas

INSERT INTO dbo.Propiedad
SELECT [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]
FROM @tempPropiedades

INSERT INTO PropiedadCCAgua
SELECT [NumeroMedidor], [SaldoAcumulado]
FROM @tempPropiedadCCAgua

INSERT INTO @auxTempPropiedades
SELECT [ID],[Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]
FROM Propiedad

DECLARE @auxIdPropiedad INT

SET @index = 0

SELECT @count = COUNT(*)
FROM @auxTempPropiedades

WHILE @count > 0 ---LLena las tabla temporal de Propiedades
BEGIN
	SET @auxIdPropiedad = (
			SELECT TOP (1) A.ID
			FROM @auxTempPropiedades AS A
			)

	PRINT @auxIdPropiedad

	DELETE TOP (1)
	FROM @auxTempPropiedades

	SELECT @count = COUNT(*)
	FROM @auxTempPropiedades;
END

SET @index = 0

WHILE (@index < @totalOp) ---Llena la tablaMovimientoConsumo, Usuario
BEGIN
	SET @index = @index + 1;
	SET @FechaAux = (
			SELECT item.value('@Fecha', 'DATE') AS Fecha
			FROM @xmlData.nodes('Datos/Operacion[sql:variable("@index")]') T(item)
			)

	INSERT INTO @tempMovimientoConsumo (
		Fecha
		,Monto
		,IdTipoMovimiento
		,IdPropiedadCCAgua
		)
	SELECT Fecha = @FechaAux
		,item.value('@Valor', 'MONEY') AS Monto
		,M.ID AS 'IdTipoMovimiento'
		,P.ID AS 'IdPropiedadCCAgua'
	FROM @xmlData.nodes('Datos/Operacion[sql:variable("@index")]/Lecturas/LecturaMedidor') T(item)
	INNER JOIN dbo.TipoMovimientoConsumo M ON M.Nombre = T.item.value('@TipoMovimiento', 'VARCHAR(128)')
	INNER JOIN dbo.PropiedadCCAgua P ON P.NumeroMedidor = T.item.value('@NumeroMedidor', 'VARCHAR(128)')

	INSERT INTO @tempUsuario (
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

	CONTINUE
END

INSERT INTO dbo.Usuario([UserName], [Password], [TipoUsuario], [IdPersona])
SELECT [UserName], [Passwords], [TipoUsuario], [IdPersona]
FROM @tempUsuario

INSERT INTO dbo.MovimientoConsumo([Fecha], [Monto], [IdTipoMovimiento], [IdPropiedadCCAgua])
SELECT [Fecha], [Monto], [IdTipoMovimiento], [IdPropiedadCCAgua]
FROM @tempMovimientoConsumo

SET @index = 0

WHILE (@index < @totalOp) ---LLena la tabla PXU,PXP
BEGIN
	SET @index = @index + 1;
	SET @FechaAux = (
			SELECT item.value('@Fecha', 'DATE') AS Fecha
			FROM @xmlData.nodes('Datos/Operacion[sql:variable("@index")]') T(item)
			)

	INSERT INTO @tempPXU (
		IdUsuario
		,IdPropiedad
		,FechaInicio
		,FechaFin
		) --Insertamos los datos en las tablas temporales
	SELECT P.ID AS 'IdUsuario'
		,N.ID AS 'IdPropiedad'
		,FechaInicio = @FechaAux
		,FechaFin = NULL
	FROM @xmlData.nodes('Datos/Operacion[sql:variable("@index")]/PropiedadesyUsuarios/UsuarioPropiedad') T(item)
	INNER JOIN dbo.Persona P ON P.ValorDocId = T.Item.value('@ValorDocumentoIdentidad', 'VARCHAR(128)')
	INNER JOIN dbo.Propiedad N ON N.NumeroFinca = T.Item.value('@NumeroFinca', 'VARCHAR(128)')

	INSERT INTO @tempPXP (
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

INSERT INTO dbo.PXP([IdPersona], [IdPropiedad], [FechaInicio], [FechaFin])
SELECT [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]
FROM @tempPXP

INSERT INTO dbo.PXU([IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin])
SELECT [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]
FROM @tempPXU

DECLARE @auxTipoMovimiento INT --Comienza el manejo de consumo por gastos de agua, se declaran variables
DECLARE @auxFecha DATE
DECLARE @auxMonto MONEY
DECLARE @auxPropiedadCCAgua INT

SELECT @count = COUNT(*)
FROM @tempMovimientoConsumo

WHILE @count > 0
BEGIN
	SET @auxTipoMovimiento = ( ---Se definen las variables
			SELECT TOP (1) A.IdTipoMovimiento
			FROM @tempMovimientoConsumo AS A
			)
	SET @auxFecha = (
			SELECT TOP (1) A.Fecha
			FROM @tempMovimientoConsumo AS A
			)
	SET @auxMonto = (
			SELECT TOP (1) A.Monto
			FROM @tempMovimientoConsumo AS A
			)
	SET @auxPropiedadCCAgua = (
			SELECT TOP (1) A.IdPropiedadCCAgua
			FROM @tempMovimientoConsumo AS A
			)

	IF @auxTipoMovimiento = 1 ---Validación cuando es tipo lectura
		UPDATE [dbo].[PropiedadCCAgua]
		SET SaldoAcumulado = SaldoAcumulado + (@auxMonto - SaldoAcumulado)
		WHERE PropiedadCCAgua.ID = @auxPropiedadCCAgua

	IF @auxTipoMovimiento = 2---Validación cuando es credito
		UPDATE [dbo].[PropiedadCCAgua]
		SET SaldoAcumulado = SaldoAcumulado + @auxMonto
		WHERE PropiedadCCAgua.ID = @auxPropiedadCCAgua

	IF @auxTipoMovimiento = 3
		UPDATE [dbo].[PropiedadCCAgua]---Validación cuando es debito
		SET SaldoAcumulado = SaldoAcumulado - @auxMonto
		WHERE PropiedadCCAgua.ID = @auxPropiedadCCAgua

	DELETE TOP (1)
	FROM @tempMovimientoConsumo

	SELECT @count = COUNT(*)
	FROM @tempMovimientoConsumo;
END

INSERT INTO PropiedadXCC ( ---Se insertan los conceptos de cobro de cada propiedad según su tipo de Zona
	IdPropiedad
	,FechaInicio
	,IdConceptoCobro
	)
SELECT A.ID
	,A.FechaRegistro
	,1
FROM Propiedad AS A
WHERE A.IdTipoZona != 2
	AND A.IdTipoZona != 1
	AND A.IdTipoZona != 5

INSERT INTO PropiedadXCC (
	IdPropiedad
	,FechaInicio
	,IdConceptoCobro
	)
SELECT A.ID
	,A.FechaRegistro
	,2
FROM Propiedad AS A
WHERE A.IdTipoZona != 2
	AND A.IdTipoZona != 1
	AND A.IdTipoZona != 5

INSERT INTO PropiedadXCC (
	IdPropiedad
	,FechaInicio
	,IdConceptoCobro
	)
SELECT A.ID
	,A.FechaRegistro
	,3
FROM Propiedad AS A
WHERE A.IdTipoZona != 2
	AND A.IdTipoZona != 1
	AND A.IdTipoZona != 5

INSERT INTO PropiedadXCC (
	IdPropiedad
	,FechaInicio
	,IdConceptoCobro
	)
SELECT A.ID
	,A.FechaRegistro
	,4
FROM Propiedad AS A
WHERE A.IdTipoZona != 2
	AND A.IdTipoZona != 1
	AND A.IdTipoZona != 5

INSERT INTO PropiedadXCC (
	IdPropiedad
	,FechaInicio
	,IdConceptoCobro
	)
SELECT A.ID
	,A.FechaRegistro
	,1
FROM Propiedad AS A
WHERE A.IdTipoZona = 2

INSERT INTO PropiedadXCC (
	IdPropiedad
	,FechaInicio
	,IdConceptoCobro
	)
SELECT A.ID
	,A.FechaRegistro
	,2
FROM Propiedad AS A
WHERE A.IdTipoZona = 2

INSERT INTO PropiedadXCC (
	IdPropiedad
	,FechaInicio
	,IdConceptoCobro
	)
SELECT A.ID
	,A.FechaRegistro
	,3
FROM Propiedad AS A
WHERE A.IdTipoZona = 2

INSERT INTO PropiedadXCC (
	IdPropiedad
	,FechaInicio
	,IdConceptoCobro
	)
SELECT A.ID
	,A.FechaRegistro
	,1
FROM Propiedad AS A
WHERE A.IdTipoZona = 1
	OR A.IdTipoZona = 5

INSERT INTO PropiedadXCC (
	IdPropiedad
	,FechaInicio
	,IdConceptoCobro
	)
SELECT A.ID
	,A.FechaRegistro
	,2
FROM Propiedad AS A
WHERE A.IdTipoZona = 1
	OR A.IdTipoZona = 5

INSERT INTO PropiedadXCC (
	IdPropiedad
	,FechaInicio
	,IdConceptoCobro
	)
SELECT A.ID
	,A.FechaRegistro
	,3
FROM Propiedad AS A
WHERE A.IdTipoZona = 1
	OR A.IdTipoZona = 5

INSERT INTO PropiedadXCC (
	IdPropiedad
	,FechaInicio
	,IdConceptoCobro
	)
SELECT A.ID
	,A.FechaRegistro
	,4
FROM Propiedad AS A
WHERE A.IdTipoZona = 1
	OR A.IdTipoZona = 5

INSERT INTO PropiedadXCC (
	IdPropiedad
	,FechaInicio
	,IdConceptoCobro
	)
SELECT A.ID
	,A.FechaRegistro
	,5
FROM Propiedad AS A
WHERE A.IdTipoZona = 1
	OR A.IdTipoZona = 5

INSERT INTO Factura ( ---Se empiezan a generar las facturas y validar que estas estén en las fechas adecuadas
	Fecha
	,FechaVencimiento
	,TotalOriginal
	,TotalPagar
	,Estado
	,IdPropiedad
	)
SELECT P.FechaRegistro
	,DATEADD(DAY, 8, p.FechaRegistro)
	,0
	,0
	,1
	,P.ID
FROM Propiedad AS P
WHERE P.Area < CAST('2022-04-01' AS DATETIME)

INSERT INTO Factura (
	Fecha
	,FechaVencimiento
	,TotalOriginal
	,TotalPagar
	,Estado
	,IdPropiedad
	)
SELECT DATEADD(MONTH, 1, P.FechaRegistro)
	,DATEADD(DAY, 8, DATEADD(MONTH, 1, P.FechaRegistro))
	,0
	,0
	,1
	,P.ID
FROM Propiedad AS P
WHERE P.Area < CAST('2022-04-01' AS DATETIME)

INSERT INTO Factura (
	Fecha
	,FechaVencimiento
	,TotalOriginal
	,TotalPagar
	,Estado
	,IdPropiedad
	)
SELECT DATEADD(MONTH, 2, P.FechaRegistro)
	,DATEADD(DAY, 8, DATEADD(MONTH, 2, P.FechaRegistro))
	,0
	,0
	,1
	,P.ID
FROM Propiedad AS P
WHERE P.Area < CAST('2022-04-01' AS DATETIME)

INSERT INTO Factura (
	Fecha
	,FechaVencimiento
	,TotalOriginal
	,TotalPagar
	,Estado
	,IdPropiedad
	)
SELECT DATEADD(MONTH, 3, P.FechaRegistro)
	,DATEADD(DAY, 8, DATEADD(MONTH, 3, P.FechaRegistro))
	,0
	,0
	,1
	,P.ID
FROM Propiedad AS P
WHERE P.Area < CAST('2022-04-01' AS DATETIME)

INSERT INTO Factura (
	Fecha
	,FechaVencimiento
	,TotalOriginal
	,TotalPagar
	,Estado
	,IdPropiedad
	)
SELECT P.FechaRegistro
	,DATEADD(DAY, 8, P.FechaRegistro)
	,0
	,0
	,1
	,P.ID
FROM Propiedad AS P
WHERE P.Area >= CAST('2022-04-01' AS DATETIME)
	AND P.Area < CAST('2022-05-01' AS DATETIME)

INSERT INTO Factura (
	Fecha
	,FechaVencimiento
	,TotalOriginal
	,TotalPagar
	,Estado
	,IdPropiedad
	)
SELECT DATEADD(MONTH, 1, P.FechaRegistro)
	,DATEADD(DAY, 8, DATEADD(MONTH, 1, P.FechaRegistro))
	,0
	,0
	,1
	,P.ID
FROM Propiedad AS P
WHERE P.Area >= CAST('2022-04-01' AS DATETIME)
	AND P.Area < CAST('2022-05-01' AS DATETIME)

INSERT INTO Factura (
	Fecha
	,FechaVencimiento
	,TotalOriginal
	,TotalPagar
	,Estado
	,IdPropiedad
	)
SELECT DATEADD(MONTH, 2, P.FechaRegistro)
	,DATEADD(DAY, 8, DATEADD(MONTH, 2, P.FechaRegistro))
	,0
	,0
	,1
	,P.ID
FROM Propiedad AS P
WHERE P.Area >= CAST('2022-04-01' AS DATETIME)
	AND P.Area < CAST('2022-05-01' AS DATETIME)

INSERT INTO Factura (
	Fecha
	,FechaVencimiento
	,TotalOriginal
	,TotalPagar
	,Estado
	,IdPropiedad
	)
SELECT P.FechaRegistro
	,DATEADD(DAY, 8, P.FechaRegistro)
	,0
	,0
	,1
	,P.ID
FROM Propiedad AS P
WHERE P.Area >= CAST('2022-05-01' AS DATETIME)
	AND P.Area < CAST('2022-05-01' AS DATETIME)

INSERT INTO Factura (
	Fecha
	,FechaVencimiento
	,TotalOriginal
	,TotalPagar
	,Estado
	,IdPropiedad
	)
SELECT DATEADD(MONTH, 1, P.FechaRegistro)
	,DATEADD(DAY, 8, DATEADD(MONTH, 1, P.FechaRegistro))
	,0
	,0
	,1
	,P.ID
FROM Propiedad AS P
WHERE P.Area >= CAST('2022-05-01' AS DATETIME)
	AND P.Area < CAST('2022-05-01' AS DATETIME)

INSERT INTO Factura (
	Fecha
	,FechaVencimiento
	,TotalOriginal
	,TotalPagar
	,Estado
	,IdPropiedad
	)
SELECT P.FechaRegistro
	,DATEADD(DAY, 8, P.FechaRegistro)
	,0
	,0
	,1
	,P.ID
FROM Propiedad AS P
WHERE P.Area >= CAST('2022-06-01' AS DATETIME)

INSERT INTO DetalleCC (
	[Monto]
	,[IdConceptoCobro]
	,[IdFactura]
	)
SELECT 0
	,P.IdConceptoCobro
	,F.ID
FROM Factura AS F
INNER JOIN PropiedadXCC AS P ON P.idPropiedad = f.IdPropiedad

UPDATE DetalleCC ---Actualiza el monto de cada detalle de cobro según el tipo de zona
SET Monto = CASE 
		WHEN D.IdConceptoCobro = '1'
			THEN 1000
		WHEN D.IdConceptoCobro = '2'
			THEN 15000 / 6
		WHEN D.IdConceptoCobro = '3'
			THEN (P.ValorFiscal * 0.01) / 12
		WHEN D.IdConceptoCobro = '4'
			AND P.Area < 400
			THEN 150
		WHEN D.IdConceptoCobro = '4'
			AND P.Area > 400
			THEN CAST(((P.Area - 400) / 200) AS INT) * 75 + 150
		WHEN D.IdConceptoCobro = '5'
			THEN 2000
		END
FROM DetalleCC D
INNER JOIN Factura F ON F.ID = D.IdFactura
INNER JOIN Propiedad P ON P.ID = F.IdPropiedad

INSERT INTO [dbo].[TotalFactura] ---Inserta la suma del total de los Detalles de Cobro para ingresarlos en las facturas
SELECT SUM(DetalleCC.Monto)
FROM DetalleCC
INNER JOIN Factura ON Factura.ID = DetalleCC.IdFactura
GROUP BY Factura.ID

UPDATE Factura ---Actualiza el monto total en la Factura
SET TotalOriginal = (
		SELECT Monto
		FROM TotalFactura
		WHERE TotalFactura.ID = Factura.ID
		)

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
			SET @outResultCode=50025; --Establece el código de error 
END CATCH
	SET NOCOUNT OFF;
END

EXEC [dbo].[InsertXMLIterative] 0
GO
/****** Object:  StoredProcedure [dbo].[pagarRecibo]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[propiedadesPropietario]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[propiedadesUsuario]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[propietarioPropiedad]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[rangoCambiosEntidades]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[readPerson]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[readProperty]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[readUser]    Script Date: 28/11/2022 12:14:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[readUser]
	@inUsername VARCHAR(128),
	@outResultCode INT OUTPUT
	--Para consultar un usuario, se utiliza su username.
AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT U.UserName, U.Password, U.TipoUsuario FROM dbo.Usuario U WHERE U.UserName = @inUsername;
		--Se seleccionó el usuario usando su username, se muestra su información.
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
		SET @outResultCode = 50021;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[recibosPagados]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
		SET @outResultCode=50059;
		
	END CATCH 
END
GO
/****** Object:  StoredProcedure [dbo].[recibosPendientes]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[simulacion]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[SPCobroReconexion]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[SPGenerarFacturas]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[SPInteresesMoratorios]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[SPMovimientoAgua]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[SPOrdenesReconexion]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[updatePerson]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[updateProperty]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[updateUser]    Script Date: 28/11/2022 12:14:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateUser]
	@inUsername VARCHAR(128),
	@inPassword VARCHAR(128),
	@inNewUsername VARCHAR(128),
	@inNewPassword VARCHAR(128),
	@inNewTipoUsuario VARCHAR(128),
	@outResultCode INT OUTPUT
	--Los parámetros anteriores son propios de los usuarios y permiten localizarlos y modificarlos. 
AS
BEGIN
	SET NOCOUNT ON; 
	SET @outResultCode = 0;
	BEGIN TRY
		IF EXISTS(SELECT U.UserName, U.Password, U.TipoUsuario FROM dbo.Usuario U WHERE
					UserName = @inUsername and Password = @inPassword)
				BEGIN
					BEGIN TRANSACTION tUpdateUser
					DECLARE @beforeUpdate VARCHAR(500) = (SELECT U.UserName, U.Password, U.TipoUsuario FROM dbo.Usuario U
															WHERE U.UserName = @inUsername and U.Password = @inPassword FOR JSON AUTO);
					DECLARE @idUser INT = (SELECT U.ID FROM dbo.Usuario U WHERE U.UserName = @inUsername and U.Password = @inPassword);
					UPDATE dbo.Usuario
					SET UserName = @inNewUsername, Password = @inNewPassword, TipoUsuario = @inNewTipoUsuario
					WHERE UserName = @inUsername and Password = @inPassword
					DECLARE @afterUpdate VARCHAR(500) = (SELECT U.UserName, U.Password, U.TipoUsuario FROM dbo.Usuario U
															WHERE U.UserName = @inNewUsername and U.Password = @inNewPassword FOR JSON AUTO);
					INSERT INTO CambiosEntidades( --Inserta en los cambios de entidad
						IdEntityType,
						EntityId,
						jsonAntes,
						jsonDespues,
						insertedAt,
						insertedBy,
						insertedIn
					)
					VALUES(
						3,
						@idUser,
						@beforeUpdate,
						@afterUpdate,
						GETDATE(),
						'Admin',
						'192.198.0.1'
					)
					COMMIT TRANSACTION
				END
		--Las instrucciones anteriores encuentran al usuario en caso de que exista y actualizan sus datos.
	END TRY
	BEGIN CATCH --Se insertan errores en la tabla de errores en caso de que estos existan.
		IF @@TRANCOUNT > 1
			ROLLBACK TRANSACTION tUpdateUser
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
			SET @outResultCode=50015;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[usuariosPropiedad]    Script Date: 28/11/2022 12:14:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuariosPropiedad]
	@inNumeroFinca INT, 
	@outResultCode INT OUTPUT
	--Para consultar los usuarios de una propiedad, se utiliza el número de finca para encontrar la propiedad.

AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
	BEGIN TRY 
		DECLARE @inIdPropiedad INT = (SELECT P.ID FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca);
		SELECT dbo.Usuario.UserName, dbo.Usuario.Password FROM dbo.Usuario  
		INNER JOIN dbo.PXU ON dbo.Usuario.ID = dbo.PXU.IdUsuario WHERE dbo.PXU.IdPropiedad = @inIdPropiedad;
		/*Lo hecho en las líneas anteriores encuentra el ID de la propiedad usando su número de finca, para luego
		unir la tabla de usuario con la de la relación con tal de mostrar los datos correspondientes, todo esto siempre y cuando
		exista el ID de la finca y se asocie con alguna relación.
		*/

	END TRY
	BEGIN CATCH --Se insertan errores en la tabla de errores en caso de que exista alguno. 
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
			SET @outResultCode = 50024;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[VaciarBases]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[validateLogin]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
/****** Object:  Trigger [dbo].[TrPropiedadInsert]    Script Date: 28/11/2022 12:14:07 a. m. ******/
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
