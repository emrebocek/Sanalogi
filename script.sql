USE [Sanalogi]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 19.11.2019 19:46:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[alinanUruns]    Script Date: 19.11.2019 19:46:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alinanUruns](
	[alinanUrunId] [int] IDENTITY(1,1) NOT NULL,
	[urunAdi] [nvarchar](max) NOT NULL,
	[adet] [int] NOT NULL,
	[birimFiyat] [decimal](18, 2) NOT NULL,
	[toplam] [decimal](18, 2) NOT NULL,
	[musteriId] [int] NULL,
	[faturaId] [int] NULL,
 CONSTRAINT [PK_alinanUruns] PRIMARY KEY CLUSTERED 
(
	[alinanUrunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[faturas]    Script Date: 19.11.2019 19:46:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[faturas](
	[faturaId] [int] IDENTITY(1,1) NOT NULL,
	[faturaTarihi] [datetime2](7) NOT NULL,
	[genelToplam] [decimal](18, 2) NOT NULL,
	[faturaNo] [nvarchar](max) NULL,
 CONSTRAINT [PK_faturas] PRIMARY KEY CLUSTERED 
(
	[faturaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[musteris]    Script Date: 19.11.2019 19:46:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[musteris](
	[musteriId] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nvarchar](max) NULL,
	[soyad] [nvarchar](max) NULL,
	[adres] [nvarchar](max) NULL,
	[eposta] [nvarchar](max) NULL,
	[telefon] [bigint] NOT NULL,
 CONSTRAINT [PK_musteris] PRIMARY KEY CLUSTERED 
(
	[musteriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191119003438_InitialMigration', N'2.1.8-servicing-32085')
SET IDENTITY_INSERT [dbo].[alinanUruns] ON 

INSERT [dbo].[alinanUruns] ([alinanUrunId], [urunAdi], [adet], [birimFiyat], [toplam], [musteriId], [faturaId]) VALUES (10, N'A', 4, CAST(2.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), 11, 9)
INSERT [dbo].[alinanUruns] ([alinanUrunId], [urunAdi], [adet], [birimFiyat], [toplam], [musteriId], [faturaId]) VALUES (11, N'B', 3, CAST(2.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), 11, 9)
INSERT [dbo].[alinanUruns] ([alinanUrunId], [urunAdi], [adet], [birimFiyat], [toplam], [musteriId], [faturaId]) VALUES (12, N'C', 4, CAST(5.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 11, 9)
SET IDENTITY_INSERT [dbo].[alinanUruns] OFF
SET IDENTITY_INSERT [dbo].[faturas] ON 

INSERT [dbo].[faturas] ([faturaId], [faturaTarihi], [genelToplam], [faturaNo]) VALUES (9, CAST(N'2019-11-12T00:00:00.0000000' AS DateTime2), CAST(34.00 AS Decimal(18, 2)), N'sdad')
SET IDENTITY_INSERT [dbo].[faturas] OFF
SET IDENTITY_INSERT [dbo].[musteris] ON 

INSERT [dbo].[musteris] ([musteriId], [ad], [soyad], [adres], [eposta], [telefon]) VALUES (11, N'Emre', N'Böcek', N'Karadeniz', N'emrebocek2@gmail.com', 2131231)
SET IDENTITY_INSERT [dbo].[musteris] OFF
ALTER TABLE [dbo].[alinanUruns]  WITH CHECK ADD  CONSTRAINT [FK_alinanUruns_faturas_faturaId] FOREIGN KEY([faturaId])
REFERENCES [dbo].[faturas] ([faturaId])
GO
ALTER TABLE [dbo].[alinanUruns] CHECK CONSTRAINT [FK_alinanUruns_faturas_faturaId]
GO
ALTER TABLE [dbo].[alinanUruns]  WITH CHECK ADD  CONSTRAINT [FK_alinanUruns_musteris_musteriId] FOREIGN KEY([musteriId])
REFERENCES [dbo].[musteris] ([musteriId])
GO
ALTER TABLE [dbo].[alinanUruns] CHECK CONSTRAINT [FK_alinanUruns_musteris_musteriId]
GO
