USE [buchwaldshave34_dk_db]
GO
/****** Object:  User [ltpe]    Script Date: 23-01-2024 17:30:38 ******/
--CREATE USER [ltpe] FOR LOGIN [ltpe] WITH DEFAULT_SCHEMA=[dbo]
--GO
--/****** Object:  User [ltpe1]    Script Date: 23-01-2024 17:30:38 ******/
--CREATE USER [ltpe1] FOR LOGIN [ltpe1] WITH DEFAULT_SCHEMA=[dbo]
--GO
/****** Object:  Table [dbo].[Core_8_0_Countries]    Script Date: 23-01-2024 17:30:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_8_0_Countries](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Core_8_0_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_8_0_Languages]    Script Date: 23-01-2024 17:30:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_8_0_Languages](
	[LanguageId] [int] IDENTITY(1,1) NOT NULL,
	[LanguageName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Core_8_0_Languages] PRIMARY KEY CLUSTERED 
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_8_0_Cities]    Script Date: 23-01-2024 17:30:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_8_0_Cities](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
	[CityDescription] [nvarchar](200) NOT NULL,
	[CountryID] [int] NOT NULL,
 CONSTRAINT [PK_Core_8_0_Cities] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_8_0_CityLanguages]    Script Date: 23-01-2024 17:30:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_8_0_CityLanguages](
	[CityId] [int] NOT NULL,
	[LanguageId] [int] NOT NULL,
 CONSTRAINT [PK_Core_8_0_CityLanguages] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC,
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_8_0_PointsOfInterest]    Script Date: 23-01-2024 17:30:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_8_0_PointsOfInterest](
	[PointOfInterestId] [int] IDENTITY(1,1) NOT NULL,
	[PointOfInterestName] [nvarchar](50) NOT NULL,
	[PointOfInterestDescription] [nvarchar](200) NOT NULL,
	[CityId] [int] NOT NULL,
 CONSTRAINT [PK_Core_8_0_PointsOfInterest] PRIMARY KEY CLUSTERED 
(
	[PointOfInterestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Cities_View]    Script Date: 23-01-2024 17:30:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Cities_View]
AS
SELECT dbo.Core_8_0_Cities.CityId, dbo.Core_8_0_Cities.CityName, dbo.Core_8_0_Cities.CityDescription, dbo.Core_8_0_Cities.CountryID, dbo.Core_8_0_Countries.CountryName, dbo.Core_8_0_Languages.LanguageName, 
                  dbo.Core_8_0_PointsOfInterest.PointOfInterestName, dbo.Core_8_0_PointsOfInterest.PointOfInterestDescription, dbo.Core_8_0_PointsOfInterest.PointOfInterestId
FROM     dbo.Core_8_0_Cities INNER JOIN
                  dbo.Core_8_0_CityLanguages ON dbo.Core_8_0_Cities.CityId = dbo.Core_8_0_CityLanguages.CityId INNER JOIN
                  dbo.Core_8_0_Countries ON dbo.Core_8_0_Cities.CountryID = dbo.Core_8_0_Countries.CountryID INNER JOIN
                  dbo.Core_8_0_Languages ON dbo.Core_8_0_CityLanguages.LanguageId = dbo.Core_8_0_Languages.LanguageId INNER JOIN
                  dbo.Core_8_0_PointsOfInterest ON dbo.Core_8_0_Cities.CityId = dbo.Core_8_0_PointsOfInterest.CityId
GO
/****** Object:  View [dbo].[CityView]    Script Date: 23-01-2024 17:30:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CityView]
AS
SELECT CityName, CityDescription, CountryId
FROM Core_8_0_Cities
GO
/****** Object:  View [dbo].[GetCityWithInfo]    Script Date: 23-01-2024 17:30:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetCityWithInfo]
AS
SELECT * FROM dbo.Core_8_0_Cities
GO
/****** Object:  View [dbo].[HentAlleByer]    Script Date: 23-01-2024 17:30:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[HentAlleByer]
AS
SELECT dbo.Core_8_0_Cities.CityId, dbo.Core_8_0_Cities.CityName, dbo.Core_8_0_Cities.CityDescription, dbo.Core_8_0_Cities.CountryID, dbo.Core_8_0_Countries.CountryID AS Expr1, dbo.Core_8_0_Countries.CountryName, 
                  dbo.Core_8_0_Languages.LanguageName, dbo.Core_8_0_PointsOfInterest.PointOfInterestName, dbo.Core_8_0_PointsOfInterest.PointOfInterestDescription, dbo.Core_8_0_CityLanguages.CityId AS Expr2, 
                  dbo.Core_8_0_CityLanguages.LanguageId, dbo.Core_8_0_PointsOfInterest.CityId AS Expr3, dbo.Core_8_0_Languages.LanguageId AS Expr4
FROM     dbo.Core_8_0_Cities INNER JOIN
                  dbo.Core_8_0_Countries ON dbo.Core_8_0_Cities.CountryID = dbo.Core_8_0_Countries.CountryID INNER JOIN
                  dbo.Core_8_0_CityLanguages ON dbo.Core_8_0_Cities.CityId = dbo.Core_8_0_CityLanguages.CityId INNER JOIN
                  dbo.Core_8_0_PointsOfInterest ON dbo.Core_8_0_Cities.CityId = dbo.Core_8_0_PointsOfInterest.CityId INNER JOIN
                  dbo.Core_8_0_Languages ON dbo.Core_8_0_CityLanguages.LanguageId = dbo.Core_8_0_Languages.LanguageId
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 23-01-2024 17:30:39 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240112131821_Init', N'8.0.0')
GO
SET IDENTITY_INSERT [dbo].[Core_8_0_Cities] ON 

INSERT [dbo].[Core_8_0_Cities] ([CityId], [CityName], [CityDescription], [CountryID]) VALUES (2, N'Gudumholm', N'Østhimmerlands Perle', 1)
INSERT [dbo].[Core_8_0_Cities] ([CityId], [CityName], [CityDescription], [CountryID]) VALUES (3, N'Aalborg', N'Dobbelt A', 1)
INSERT [dbo].[Core_8_0_Cities] ([CityId], [CityName], [CityDescription], [CountryID]) VALUES (4, N'Thorshavn', N'Grinde byen', 4)
INSERT [dbo].[Core_8_0_Cities] ([CityId], [CityName], [CityDescription], [CountryID]) VALUES (8, N'Øster Sundby', N'Byen med mange dygtige Datetekniker Elever !!!', 1)
INSERT [dbo].[Core_8_0_Cities] ([CityId], [CityName], [CityDescription], [CountryID]) VALUES (9, N'Nørre Tranders', N'Pizeria', 1)
INSERT [dbo].[Core_8_0_Cities] ([CityId], [CityName], [CityDescription], [CountryID]) VALUES (11, N'København', N'Komgebyen', 1)
INSERT [dbo].[Core_8_0_Cities] ([CityId], [CityName], [CityDescription], [CountryID]) VALUES (12, N'Rejkavik', N'Islands hovedstad', 5)
INSERT [dbo].[Core_8_0_Cities] ([CityId], [CityName], [CityDescription], [CountryID]) VALUES (13, N'London', N'Byen ved Themsen', 2)
INSERT [dbo].[Core_8_0_Cities] ([CityId], [CityName], [CityDescription], [CountryID]) VALUES (14, N'Test', N'Test1', 1)
INSERT [dbo].[Core_8_0_Cities] ([CityId], [CityName], [CityDescription], [CountryID]) VALUES (15, N'Test', N'Test2', 1)
INSERT [dbo].[Core_8_0_Cities] ([CityId], [CityName], [CityDescription], [CountryID]) VALUES (16, N'Test', N'Test3', 1)
INSERT [dbo].[Core_8_0_Cities] ([CityId], [CityName], [CityDescription], [CountryID]) VALUES (17, N'Mult1', N'Mult1_Desc', 1)
INSERT [dbo].[Core_8_0_Cities] ([CityId], [CityName], [CityDescription], [CountryID]) VALUES (18, N'Test', N'Test1', 2)
INSERT [dbo].[Core_8_0_Cities] ([CityId], [CityName], [CityDescription], [CountryID]) VALUES (19, N'Test10', N'Test10_Desc', 2)
INSERT [dbo].[Core_8_0_Cities] ([CityId], [CityName], [CityDescription], [CountryID]) VALUES (20, N'TestLTPE', N'TestLTPE_Desc', 2)
SET IDENTITY_INSERT [dbo].[Core_8_0_Cities] OFF
GO
INSERT [dbo].[Core_8_0_CityLanguages] ([CityId], [LanguageId]) VALUES (2, 1)
INSERT [dbo].[Core_8_0_CityLanguages] ([CityId], [LanguageId]) VALUES (3, 1)
INSERT [dbo].[Core_8_0_CityLanguages] ([CityId], [LanguageId]) VALUES (4, 1)
INSERT [dbo].[Core_8_0_CityLanguages] ([CityId], [LanguageId]) VALUES (12, 1)
INSERT [dbo].[Core_8_0_CityLanguages] ([CityId], [LanguageId]) VALUES (18, 1)
INSERT [dbo].[Core_8_0_CityLanguages] ([CityId], [LanguageId]) VALUES (2, 2)
INSERT [dbo].[Core_8_0_CityLanguages] ([CityId], [LanguageId]) VALUES (3, 2)
INSERT [dbo].[Core_8_0_CityLanguages] ([CityId], [LanguageId]) VALUES (18, 2)
INSERT [dbo].[Core_8_0_CityLanguages] ([CityId], [LanguageId]) VALUES (3, 3)
INSERT [dbo].[Core_8_0_CityLanguages] ([CityId], [LanguageId]) VALUES (4, 4)
GO
SET IDENTITY_INSERT [dbo].[Core_8_0_Countries] ON 

INSERT [dbo].[Core_8_0_Countries] ([CountryID], [CountryName]) VALUES (1, N'Danmark')
INSERT [dbo].[Core_8_0_Countries] ([CountryID], [CountryName]) VALUES (2, N'England')
INSERT [dbo].[Core_8_0_Countries] ([CountryID], [CountryName]) VALUES (3, N'Tyskland')
INSERT [dbo].[Core_8_0_Countries] ([CountryID], [CountryName]) VALUES (4, N'Færøerne')
INSERT [dbo].[Core_8_0_Countries] ([CountryID], [CountryName]) VALUES (5, N'Island')
SET IDENTITY_INSERT [dbo].[Core_8_0_Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_8_0_Languages] ON 

INSERT [dbo].[Core_8_0_Languages] ([LanguageId], [LanguageName]) VALUES (1, N'Dansk')
INSERT [dbo].[Core_8_0_Languages] ([LanguageId], [LanguageName]) VALUES (2, N'Engelsk')
INSERT [dbo].[Core_8_0_Languages] ([LanguageId], [LanguageName]) VALUES (3, N'Tysk')
INSERT [dbo].[Core_8_0_Languages] ([LanguageId], [LanguageName]) VALUES (4, N'Færøsk')
SET IDENTITY_INSERT [dbo].[Core_8_0_Languages] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_8_0_PointsOfInterest] ON 

INSERT [dbo].[Core_8_0_PointsOfInterest] ([PointOfInterestId], [PointOfInterestName], [PointOfInterestDescription], [CityId]) VALUES (1, N'Gudumholm Stadion', N'Jeres lærer har spillet mange fantastiske kampe her', 2)
INSERT [dbo].[Core_8_0_PointsOfInterest] ([PointOfInterestId], [PointOfInterestName], [PointOfInterestDescription], [CityId]) VALUES (2, N'Aalborg Stadion', N'Også her har jeres lærer spillet', 3)
INSERT [dbo].[Core_8_0_PointsOfInterest] ([PointOfInterestId], [PointOfInterestName], [PointOfInterestDescription], [CityId]) VALUES (3, N'Gudumholm Brugs', N'Uddeleren løber sit halvmaraton nummer 55 d. 22/06-2024', 2)
INSERT [dbo].[Core_8_0_PointsOfInterest] ([PointOfInterestId], [PointOfInterestName], [PointOfInterestDescription], [CityId]) VALUES (4, N'Idræsthal', N'Fed idrætshal', 4)
INSERT [dbo].[Core_8_0_PointsOfInterest] ([PointOfInterestId], [PointOfInterestName], [PointOfInterestDescription], [CityId]) VALUES (5, N'Lava', N'Lava', 12)
INSERT [dbo].[Core_8_0_PointsOfInterest] ([PointOfInterestId], [PointOfInterestName], [PointOfInterestDescription], [CityId]) VALUES (6, N'P1', N'P1_Desc', 18)
INSERT [dbo].[Core_8_0_PointsOfInterest] ([PointOfInterestId], [PointOfInterestName], [PointOfInterestDescription], [CityId]) VALUES (7, N'P2', N'P2_Desc', 18)
SET IDENTITY_INSERT [dbo].[Core_8_0_PointsOfInterest] OFF
GO
ALTER TABLE [dbo].[Core_8_0_Cities]  WITH CHECK ADD  CONSTRAINT [FK_Core_8_0_Cities_Core_8_0_Countries_CountryID] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Core_8_0_Countries] ([CountryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Core_8_0_Cities] CHECK CONSTRAINT [FK_Core_8_0_Cities_Core_8_0_Countries_CountryID]
GO
ALTER TABLE [dbo].[Core_8_0_CityLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Core_8_0_CityLanguages_Core_8_0_Cities_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Core_8_0_Cities] ([CityId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Core_8_0_CityLanguages] CHECK CONSTRAINT [FK_Core_8_0_CityLanguages_Core_8_0_Cities_CityId]
GO
ALTER TABLE [dbo].[Core_8_0_CityLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Core_8_0_CityLanguages_Core_8_0_Languages_LanguageId] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Core_8_0_Languages] ([LanguageId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Core_8_0_CityLanguages] CHECK CONSTRAINT [FK_Core_8_0_CityLanguages_Core_8_0_Languages_LanguageId]
GO
ALTER TABLE [dbo].[Core_8_0_PointsOfInterest]  WITH CHECK ADD  CONSTRAINT [FK_Core_8_0_PointsOfInterest_Core_8_0_Cities_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Core_8_0_Cities] ([CityId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Core_8_0_PointsOfInterest] CHECK CONSTRAINT [FK_Core_8_0_PointsOfInterest_Core_8_0_Cities_CityId]
GO
/****** Object:  StoredProcedure [dbo].[CALCULATOR]    Script Date: 23-01-2024 17:30:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CALCULATOR]
	@argument1	smallint,
	@argument2	smallint,
	@addresult	smallint	OUTPUT,
	@subtractresult smallint	OUTPUT,
	@multiplyresult smallint	OUTPUT

AS
	SET @addresult = @argument1 + @argument2
	SET @subtractresult = @argument1 - @argument2
	SET @multiplyresult = @argument1 * @argument2

GO
/****** Object:  StoredProcedure [dbo].[HentAlleByerMedCountryId]    Script Date: 23-01-2024 17:30:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HentAlleByerMedCountryId]
	@CountryID	smallint
	
AS
SELECT dbo.Core_8_0_Cities.CityId, dbo.Core_8_0_Cities.CityName, dbo.Core_8_0_Cities.CityDescription, dbo.Core_8_0_Cities.CountryID, dbo.Core_8_0_Countries.CountryID AS Expr1, dbo.Core_8_0_Countries.CountryName, 
                  dbo.Core_8_0_Languages.LanguageName, dbo.Core_8_0_PointsOfInterest.PointOfInterestName, dbo.Core_8_0_PointsOfInterest.PointOfInterestDescription, dbo.Core_8_0_CityLanguages.CityId AS Expr2, 
                  dbo.Core_8_0_CityLanguages.LanguageId, dbo.Core_8_0_PointsOfInterest.CityId AS Expr3, dbo.Core_8_0_Languages.LanguageId AS Expr4
FROM     dbo.Core_8_0_Cities INNER JOIN
                  dbo.Core_8_0_Countries ON dbo.Core_8_0_Cities.CountryID = dbo.Core_8_0_Countries.CountryID INNER JOIN
                  dbo.Core_8_0_CityLanguages ON dbo.Core_8_0_Cities.CityId = dbo.Core_8_0_CityLanguages.CityId INNER JOIN
                  dbo.Core_8_0_PointsOfInterest ON dbo.Core_8_0_Cities.CityId = dbo.Core_8_0_PointsOfInterest.CityId INNER JOIN
                  dbo.Core_8_0_Languages ON dbo.Core_8_0_CityLanguages.LanguageId = dbo.Core_8_0_Languages.LanguageId

WHERE dbo.Core_8_0_Countries.CountryID = @CountryID
GO
/****** Object:  StoredProcedure [dbo].[MathTutor]    Script Date: 23-01-2024 17:30:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MathTutor]
	@argument1	smallint,
	@argument2	smallint,
	@multiply_result		smallint	OUTPUT,
	@add_result	smallint	OUTPUT
AS
	Set @multiply_result = @argument1 * @argument2
	Set	@add_result = @argument1 + @argument2
	
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[8] 2[23] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Core_8_0_Cities"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Core_8_0_CityLanguages"
            Begin Extent = 
               Top = 7
               Left = 292
               Bottom = 126
               Right = 486
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Core_8_0_Countries"
            Begin Extent = 
               Top = 7
               Left = 534
               Bottom = 126
               Right = 728
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Core_8_0_Languages"
            Begin Extent = 
               Top = 7
               Left = 776
               Bottom = 126
               Right = 976
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Core_8_0_PointsOfInterest"
            Begin Extent = 
               Top = 126
               Left = 292
               Bottom = 289
               Right = 562
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 2436
         Width = 5892
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Cities_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Cities_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Cities_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Core_8_0_Cities"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Core_8_0_Countries"
            Begin Extent = 
               Top = 7
               Left = 292
               Bottom = 126
               Right = 486
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Core_8_0_CityLanguages"
            Begin Extent = 
               Top = 7
               Left = 534
               Bottom = 158
               Right = 728
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Core_8_0_PointsOfInterest"
            Begin Extent = 
               Top = 7
               Left = 776
               Bottom = 170
               Right = 1046
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Core_8_0_Languages"
            Begin Extent = 
               Top = 126
               Left = 292
               Bottom = 310
               Right = 492
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HentAlleByer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HentAlleByer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HentAlleByer'
GO
