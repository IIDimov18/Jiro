USE [master]
GO
/****** Object:  Database [Jiro]    Script Date: 7/8/2021 2:07:32 PM ******/
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
/****** Object:  Table [dbo].[Projects]    Script Date: 7/8/2021 2:07:32 PM ******/
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
/****** Object:  Table [dbo].[ProjectsTeams]    Script Date: 7/8/2021 2:07:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectsTeams](
	[ProjectId] [int] NOT NULL,
	[TeamId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 7/8/2021 2:07:32 PM ******/
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
/****** Object:  Table [dbo].[Teams]    Script Date: 7/8/2021 2:07:32 PM ******/
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
/****** Object:  Table [dbo].[TeamsUsers]    Script Date: 7/8/2021 2:07:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamsUsers](
	[UserId] [int] NOT NULL,
	[TeamId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/8/2021 2:07:32 PM ******/
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
	[IdOfCreator] [int] NOT NULL,
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
/****** Object:  Table [dbo].[WorkLogs]    Script Date: 7/8/2021 2:07:32 PM ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users]    Script Date: 7/8/2021 2:07:32 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RegisterUser]    Script Date: 7/8/2021 2:07:32 PM ******/
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

	INSERT INTO Users (FirstName,LastName,Username,[Password],IsAdmin,Token,IdOfCreator)
	VALUES (@FirstName,@LastName,@Username,@Password,@IsAdmin,@Token, @IdOfCreator)

	SELECT 0 AS Success
END
GO
USE [master]
GO
ALTER DATABASE [Jiro] SET  READ_WRITE 
GO
