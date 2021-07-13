USE [master]
GO
/****** Object:  Database [Jiro]    Script Date: 7/13/2021 2:50:02 PM ******/
CREATE DATABASE [Jiro]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Jiro', FILENAME = N'C:\Users\IIDimov18\Jiro.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Jiro_log', FILENAME = N'C:\Users\IIDimov18\Jiro_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Jiro] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Jiro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Jiro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Jiro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Jiro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Jiro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Jiro] SET ARITHABORT OFF 
GO
ALTER DATABASE [Jiro] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Jiro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Jiro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Jiro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Jiro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Jiro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Jiro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Jiro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Jiro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Jiro] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Jiro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Jiro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Jiro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Jiro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Jiro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Jiro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Jiro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Jiro] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Jiro] SET  MULTI_USER 
GO
ALTER DATABASE [Jiro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Jiro] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Jiro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Jiro] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Jiro] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Jiro] SET QUERY_STORE = OFF
GO
USE [Jiro]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Jiro]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 7/13/2021 2:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](69) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[IdOfCreator] [int] NOT NULL,
	[LastChangedAt] [datetime] NOT NULL,
	[IdOfLastChanger] [int] NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectsTeams]    Script Date: 7/13/2021 2:50:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectsTeams](
	[ProjectId] [int] NOT NULL,
	[TeamId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 7/13/2021 2:50:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[AssigneeId] [int] NOT NULL,
	[Title] [nvarchar](69) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Status] [varchar](12) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[IdOfCreator] [int] NOT NULL,
	[LastChangedAt] [datetime] NOT NULL,
	[IdOfLastChanger] [int] NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 7/13/2021 2:50:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](69) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[IdOfCreator] [int] NOT NULL,
	[LastChangedAt] [datetime] NOT NULL,
	[IdOfLastChanger] [int] NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamsUsers]    Script Date: 7/13/2021 2:50:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamsUsers](
	[UserId] [int] NOT NULL,
	[TeamId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/13/2021 2:50:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](42) NOT NULL,
	[FirstName] [nvarchar](42) NOT NULL,
	[LastName] [nvarchar](42) NOT NULL,
	[Password] [varchar](128) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[IdOfCreator] [int] NULL,
	[LastChangedAt] [datetime] NOT NULL,
	[IdOfLastChanger] [int] NULL,
	[Salt] [varchar](69) NOT NULL,
	[Token] [varchar](69) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkLogs]    Script Date: 7/13/2021 2:50:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TaskId] [int] NOT NULL,
	[AssigneeId] [int] NOT NULL,
	[Time] [time](0) NULL,
	[Date] [date] NULL,
	[Description] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_WorkLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Password], [IsAdmin], [CreatedAt], [IdOfCreator], [LastChangedAt], [IdOfLastChanger], [Salt], [Token]) VALUES (1, N'TheHolyAdmin', N'BosaNa', N'Kokosa', N'eff1d08060cbda98e6109116bf7e38c4e5d00b19715e9d6a8efdcdabdde6bbd1', 1, CAST(N'2021-07-13T13:47:46.030' AS DateTime), NULL, CAST(N'2021-07-13T13:47:46.030' AS DateTime), NULL, N'solll', N'nqkavToken')
GO
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Password], [IsAdmin], [CreatedAt], [IdOfCreator], [LastChangedAt], [IdOfLastChanger], [Salt], [Token]) VALUES (12, N'testKondio', N'Kodio', N'tenten', N'$2b$10$bmpmNZSkhvvhlmOh/bjRB.YB6fqH.9HxNjs/j04Ud3hrSLCbxoxP6', 0, CAST(N'2021-07-13T13:55:34.343' AS DateTime), 1, CAST(N'2021-07-13T13:55:34.343' AS DateTime), NULL, N'$2b$10$bmpmNZSkhvvhlmOh/bjRB.', N'AA597FA5FBAA06B0C128904E7A5EA6')
GO
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Password], [IsAdmin], [CreatedAt], [IdOfCreator], [LastChangedAt], [IdOfLastChanger], [Salt], [Token]) VALUES (13, N'testKondio1', N'hhgfhfg', N'gtrfgdf', N'$2b$10$NpLQ.kXVEN87ttghfPyT4e.Rulc2nuEJ/uB12BilhiskAem0LJZt.', 1, CAST(N'2021-07-13T14:08:35.717' AS DateTime), 1, CAST(N'2021-07-13T14:08:35.717' AS DateTime), NULL, N'$2b$10$NpLQ.kXVEN87ttghfPyT4e', N'49155CF2F173E07769533A34D8101A')
GO
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Password], [IsAdmin], [CreatedAt], [IdOfCreator], [LastChangedAt], [IdOfLastChanger], [Salt], [Token]) VALUES (14, N'testKondio13', N'hhgfhfg', N'gtrfgdf', N'$2b$10$Q7rGs8epUzZSoQGb8pcU0uxBo3TnqacsVsQawW3NVDCZfMlppaBxG', 1, CAST(N'2021-07-13T14:10:13.860' AS DateTime), 1, CAST(N'2021-07-13T14:10:13.860' AS DateTime), NULL, N'$2b$10$Q7rGs8epUzZSoQGb8pcU0u', N'B4C20B2D5532FAEB6B02A982C83080')
GO
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Password], [IsAdmin], [CreatedAt], [IdOfCreator], [LastChangedAt], [IdOfLastChanger], [Salt], [Token]) VALUES (15, N'testKondio131', N'hhgfhfg', N'gtrfgdf', N'$2b$10$ropUr4EEyv4NAYbHcHkgduMeSB7zGdMQIO.bqMxaP8OYnYo8y3aaG', 1, CAST(N'2021-07-13T14:10:34.693' AS DateTime), 1, CAST(N'2021-07-13T14:10:34.693' AS DateTime), NULL, N'$2b$10$ropUr4EEyv4NAYbHcHkgdu', N'04EB1ADB4D176BBDDC2D86D52F781C')
GO
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Password], [IsAdmin], [CreatedAt], [IdOfCreator], [LastChangedAt], [IdOfLastChanger], [Salt], [Token]) VALUES (16, N'testKondio1314', N'hhgfhfg', N'gtrfgdf', N'$2b$10$B1UEb1S0BMfAcyZT5ilOWeMB8Dkxdu1olghSRPAtfcVw/42bKEmWO', 1, CAST(N'2021-07-13T14:11:16.540' AS DateTime), 1, CAST(N'2021-07-13T14:11:16.540' AS DateTime), NULL, N'$2b$10$B1UEb1S0BMfAcyZT5ilOWe', N'C371E3A74CBB106DBA817FD3BF5108')
GO
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Password], [IsAdmin], [CreatedAt], [IdOfCreator], [LastChangedAt], [IdOfLastChanger], [Salt], [Token]) VALUES (17, N'testKondio13145', N'hhgfhfg', N'gtrfgdf', N'$2b$10$7sYNHVDL2jjx6ba9jiTYG.AI9eFpFfoskKb4t8WVUKGR6RItSWUJe', 1, CAST(N'2021-07-13T14:11:29.510' AS DateTime), 1, CAST(N'2021-07-13T14:11:29.510' AS DateTime), NULL, N'$2b$10$7sYNHVDL2jjx6ba9jiTYG.', N'711FA2B8897E30FAA342B081931378')
GO
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Password], [IsAdmin], [CreatedAt], [IdOfCreator], [LastChangedAt], [IdOfLastChanger], [Salt], [Token]) VALUES (18, N'testKondio131455', N'hhgfhfg', N'gtrfgdf', N'$2b$10$Kqq.SlQeCI5qGUcikIHMeeJhQSXWlEiId11nc8RJn8Y5ao3bYAnaG', 1, CAST(N'2021-07-13T14:11:52.507' AS DateTime), 1, CAST(N'2021-07-13T14:11:52.507' AS DateTime), NULL, N'$2b$10$Kqq.SlQeCI5qGUcikIHMee', N'24F39E4D5B49EF7FD93C786E9620E0')
GO
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Password], [IsAdmin], [CreatedAt], [IdOfCreator], [LastChangedAt], [IdOfLastChanger], [Salt], [Token]) VALUES (19, N'testKondio134', N'hhgfhfg', N'gtrfgdf', N'$2b$10$fJeN.JSPMvtZpPFKpQkeR.0BJmkl.Ldd14WdP8OFnjSGoad0TQG3G', 1, CAST(N'2021-07-13T14:12:07.253' AS DateTime), 1, CAST(N'2021-07-13T14:12:07.253' AS DateTime), NULL, N'$2b$10$fJeN.JSPMvtZpPFKpQkeR.', N'D392D0301E5BDBD60D4EF5BD0C891E')
GO
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Password], [IsAdmin], [CreatedAt], [IdOfCreator], [LastChangedAt], [IdOfLastChanger], [Salt], [Token]) VALUES (20, N'testKondio1341', N'hhgfhfg', N'gtrfgdf', N'$2b$10$pyusdBKhJxp9v4l7U5VfEu/LCDRmKBukLyqDu21rQ0/tGBK.Ra.5C', 1, CAST(N'2021-07-13T14:12:15.060' AS DateTime), 1, CAST(N'2021-07-13T14:12:15.060' AS DateTime), NULL, N'$2b$10$pyusdBKhJxp9v4l7U5VfEu', N'3DF98728D2C0935C09259F3537E77A')
GO
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Password], [IsAdmin], [CreatedAt], [IdOfCreator], [LastChangedAt], [IdOfLastChanger], [Salt], [Token]) VALUES (21, N'testKondio13416', N'hhgfhfg', N'gtrfgdf', N'$2b$10$YY7A7TjEytaFvUdsKJxesei2OUig7.4PeMNaBL6tGmGIgJiztQs6u', 1, CAST(N'2021-07-13T14:12:25.910' AS DateTime), 1, CAST(N'2021-07-13T14:12:25.910' AS DateTime), NULL, N'$2b$10$YY7A7TjEytaFvUdsKJxese', N'CA8F3DDBD21CC3B6AD494C10053327')
GO
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Password], [IsAdmin], [CreatedAt], [IdOfCreator], [LastChangedAt], [IdOfLastChanger], [Salt], [Token]) VALUES (22, N'testKondio134161', N'hhgfhfg', N'gtrfgdf', N'$2b$10$DkCAxfAW8QqNk7xjOCkZT.7I7R4JzzJXAEwsePqElPPQF71UKemdW', 1, CAST(N'2021-07-13T14:12:50.607' AS DateTime), 1, CAST(N'2021-07-13T14:12:50.607' AS DateTime), NULL, N'$2b$10$DkCAxfAW8QqNk7xjOCkZT.', N'6A1C73A5EE5711FC72E957A7384DB7')
GO
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Password], [IsAdmin], [CreatedAt], [IdOfCreator], [LastChangedAt], [IdOfLastChanger], [Salt], [Token]) VALUES (23, N'testKondio1341617', N'hhgfhfg', N'gtrfgdf', N'$2b$10$WFf1lIZf3fVAdV0K0JePFeC7b9GOuJ3y7HTkXE4FRu/.AhxnvK7yW', 1, CAST(N'2021-07-13T14:13:19.567' AS DateTime), 1, CAST(N'2021-07-13T14:13:19.567' AS DateTime), NULL, N'$2b$10$WFf1lIZf3fVAdV0K0JePFe', N'2EB79EFEDE440AC9E98AA9840CB57A')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users]    Script Date: 7/13/2021 2:50:03 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [IX_Users] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_LastChangedAt]  DEFAULT (getdate()) FOR [LastChangedAt]
GO
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Teams] ADD  CONSTRAINT [DF_Teams_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Teams] ADD  CONSTRAINT [DF_Teams_LastChangedAt]  DEFAULT (getdate()) FOR [LastChangedAt]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_LastChangedAt]  DEFAULT (getdate()) FOR [LastChangedAt]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Project_Users] FOREIGN KEY([IdOfCreator])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Project_Users]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Project_Users1] FOREIGN KEY([IdOfLastChanger])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Project_Users1]
GO
ALTER TABLE [dbo].[ProjectsTeams]  WITH CHECK ADD  CONSTRAINT [FK_ProjectsTeams_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[ProjectsTeams] CHECK CONSTRAINT [FK_ProjectsTeams_Projects]
GO
ALTER TABLE [dbo].[ProjectsTeams]  WITH CHECK ADD  CONSTRAINT [FK_ProjectsTeams_Teams] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[ProjectsTeams] CHECK CONSTRAINT [FK_ProjectsTeams_Teams]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Projects]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Users] FOREIGN KEY([IdOfLastChanger])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Users]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Users1] FOREIGN KEY([IdOfCreator])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Users1]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Users2] FOREIGN KEY([AssigneeId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Users2]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_WorkLogs] FOREIGN KEY([AssigneeId])
REFERENCES [dbo].[WorkLogs] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_WorkLogs]
GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams_Users] FOREIGN KEY([IdOfCreator])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams_Users]
GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams_Users1] FOREIGN KEY([IdOfLastChanger])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams_Users1]
GO
ALTER TABLE [dbo].[TeamsUsers]  WITH CHECK ADD  CONSTRAINT [FK_TeamsUsers_Teams] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[TeamsUsers] CHECK CONSTRAINT [FK_TeamsUsers_Teams]
GO
ALTER TABLE [dbo].[TeamsUsers]  WITH CHECK ADD  CONSTRAINT [FK_TeamsUsers_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[TeamsUsers] CHECK CONSTRAINT [FK_TeamsUsers_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users] FOREIGN KEY([IdOfCreator])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users1] FOREIGN KEY([IdOfLastChanger])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Users1]
GO
ALTER TABLE [dbo].[WorkLogs]  WITH CHECK ADD  CONSTRAINT [FK_WorkLogs_Tasks] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Tasks] ([Id])
GO
ALTER TABLE [dbo].[WorkLogs] CHECK CONSTRAINT [FK_WorkLogs_Tasks]
GO
/****** Object:  StoredProcedure [dbo].[RegisterUser]    Script Date: 7/13/2021 2:50:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegisterUser]
@Username nvarchar(42),
@FirstName nvarchar(42),
@LastName nvarchar(42),
@Password varchar(128),
@Salt varchar(69),
@IsAdmin bit,
@CreatorToken varchar(69)

AS
-- Checks if username is taken
IF EXISTS(SELECT Username FROM Users WHERE Username = @Username)
BEGIN
	SELECT 1 AS ReturnCode
END
ELSE

BEGIN
	DECLARE @IdOfCreator int
	SET @IdOfCreator = (SELECT Id FROM Users WHERE Token = @CreatorToken)

	DECLARE @Token varchar(69)
	SET @Token = CONVERT(varchar,HASHBYTES('SHA2_256', CONVERT(varchar, GETDATE()-12)+ 'Foncho'+ @Username + CONVERT(varchar, RAND()*(25-10)+10)),2)

	INSERT INTO Users (FirstName,LastName,Username,[Password],IsAdmin,Token,IdOfCreator, Salt)
	VALUES (@FirstName,@LastName,@Username,@Password,@IsAdmin,@Token, @IdOfCreator, @Salt)

	SELECT 0 AS Success
END
GO
USE [master]
GO
ALTER DATABASE [Jiro] SET  READ_WRITE 
GO
