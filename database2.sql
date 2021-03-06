USE [master]
GO
/****** Object:  Database [QuizApp]    Script Date: 30/4/2022 12:27:02 AM ******/
CREATE DATABASE [QuizApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuizApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuizApp.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuizApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuizApp_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuizApp] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuizApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuizApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuizApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuizApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuizApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuizApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuizApp] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuizApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuizApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuizApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuizApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuizApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuizApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuizApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuizApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuizApp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuizApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuizApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuizApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuizApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuizApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuizApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuizApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuizApp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuizApp] SET  MULTI_USER 
GO
ALTER DATABASE [QuizApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuizApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuizApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuizApp] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuizApp] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QuizApp]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 30/4/2022 12:27:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[age] [int] NOT NULL,
	[role] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Question]    Script Date: 30/4/2022 12:27:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Question](
	[questionID] [int] IDENTITY(1,1) NOT NULL,
	[question] [nvarchar](500) NULL,
	[answerA] [nvarchar](500) NULL,
	[answerB] [nvarchar](500) NULL,
	[answerC] [nvarchar](500) NULL,
	[answerD] [nvarchar](500) NULL,
	[correctAnswer] [nvarchar](50) NOT NULL,
	[image] [varchar](500) NULL,
	[audio] [varchar](500) NULL,
	[quizID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[questionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 30/4/2022 12:27:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Quiz](
	[quizID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[catelogy] [nvarchar](50) NOT NULL,
	[image] [varchar](500) NOT NULL,
	[numberQuestion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[quizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TitleQuiz]    Script Date: 30/4/2022 12:27:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TitleQuiz](
	[catelogy] [nvarchar](50) NULL,
	[title] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Quiz]    Script Date: 30/4/2022 12:27:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User_Quiz](
	[username] [varchar](50) NOT NULL,
	[quizID] [int] NOT NULL,
	[score] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[quizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([username], [password], [name], [age], [role]) VALUES (N'bon', N'123', N'Bôn', 6, 1)
INSERT [dbo].[Account] ([username], [password], [name], [age], [role]) VALUES (N'nghia', N'123', N'admin', 22, 0)
INSERT [dbo].[Account] ([username], [password], [name], [age], [role]) VALUES (N'nghia1', N'123', N'Nghĩa', 5, 1)
INSERT [dbo].[Account] ([username], [password], [name], [age], [role]) VALUES (N'nghia2', N'123', N'Nghĩa', 22, 1)
INSERT [dbo].[Account] ([username], [password], [name], [age], [role]) VALUES (N'nghia3', N'123', N'Nghĩa', 8, 1)
INSERT [dbo].[Account] ([username], [password], [name], [age], [role]) VALUES (N'nghia4', N'123', N'Nghia', 8, 1)
INSERT [dbo].[Account] ([username], [password], [name], [age], [role]) VALUES (N'nghia5', N'123', N'Nghĩa', 21, 1)
INSERT [dbo].[Account] ([username], [password], [name], [age], [role]) VALUES (N'nghia6', N'123', N'Tuấn', 12, 1)
INSERT [dbo].[Account] ([username], [password], [name], [age], [role]) VALUES (N'nghia7', N'123', N'tuan', 14, 1)
INSERT [dbo].[Account] ([username], [password], [name], [age], [role]) VALUES (N'nghia8', N'123', N'Nguyên', 6, 1)
INSERT [dbo].[Account] ([username], [password], [name], [age], [role]) VALUES (N'nghia9', N'123', N'Nhân', 2, 1)
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (1, N'1+1=', N'1', N'2', N'3', N'4', N'B', NULL, NULL, 1)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (5, NULL, N'/images/2/hong.jpg', N'/images/2/vang.jpg', N'/images/2/cam.jpg', N'/images/2/do.jpg', N'A', NULL, N'audios/2/mauhong.mp3', 2)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (6, NULL, N'/images/2/do.jpg', N'/images/2/vang.jpg', N'/images/2/xanhbien.jpg', N'/images/2/tim.jpg', N'B', NULL, N'audios/2/mauvang.mp3', 2)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (7, NULL, N'/images/2/xanhbien.jpg', N'/images/2/xanhlacay.jpg', N'/images/2/den.jpg', N'/images/2/cam.jpg', N'D', NULL, N'audios/2/maucam.mp3', 2)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (8, NULL, N'/images/2/do.jpg', N'/images/2/xanhlacay.jpg', N'/images/2/xanhbien.jpg', N'/images/2/tim.jpg', N'A', NULL, N'audios/2/maudo.mp3', 2)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (9, NULL, N'/images/2/xanhlacay.jpg', N'/images/2/tim.jpg', N'/images/2/vang.jpg', N'/images/2/hong.jpg', N'A', NULL, N'audios/2/mauxanhlacay.mp3', 2)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (11, NULL, N'/images/2/tim.jpg', N'/images/2/xanhbien.jpg', N'/images/2/vang.jpg', N'/images/2/den.jpg', N'B', NULL, N'audios/2/mauxanhbien.mp3', 2)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (14, NULL, N'/images/2/do.jpg', N'/images/2/vang.jpg', N'/images/2/cam.jpg', N'/images/2/tim.jpg', N'D', NULL, N'audios/2/mautim.mp3', 2)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (15, NULL, N'/images/2/den.jpg', N'/images/2/cam.jpg', N'/images/2/vang.jpg', N'/images/2/hong.jpg', N'A', NULL, N'audios/2/mauden.mp3', 2)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (17, N'Pig', NULL, NULL, NULL, NULL, N'pig', N'/images/3/1651252730963heo.jpg', NULL, 3)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (18, N'Cat', NULL, NULL, NULL, NULL, N'cat', N'/images/3/cat.jpg', NULL, 3)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (19, N'Fish', NULL, NULL, NULL, NULL, N'fish', N'/images/3/fish.jpg', NULL, 3)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (21, N'Monkey', NULL, NULL, NULL, NULL, N'monkey', N'/images/3/monkey.jpg', NULL, 3)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (22, N'Panda', NULL, NULL, NULL, NULL, N'panda', N'/images/3/panda.jpg', NULL, 3)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (23, NULL, N'/images/8/cho.jpg', N'/images/8/gautruc.jpg', N'/images/8/kien.jpg', N'/images/8/meo.jpg', N'A', NULL, N'audios/8/cho.mp3', 8)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (24, NULL, N'/images/8/kien.jpg', N'/images/8/chim.jpg', N'/images/8/gautruc.jpg', N'/images/8/ca.jpg', N'C', NULL, N'audios/8/gautruc.mp3', 8)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (25, NULL, N'/images/8/cho.jpg', N'/images/8/kien.jpg', N'/images/8/ga.jpg', N'/images/8/vit.jpg', N'B', NULL, N'audios/8/kien.mp3', 8)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (28, NULL, N'/images/8/meo.jpg', N'/images/8/ca.jpg', N'/images/8/cho.jpg', N'/images/8/chim.jpg', N'A', NULL, N'audios/8/meo.mp3', 8)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (29, NULL, N'/images/8/ca.jpg', N'/images/8/meo.jpg', N'/images/8/chim.jpg', N'/images/8/voi.jpg', N'C', NULL, N'audios/8/chim.mp3', 8)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (31, NULL, N'/images/8/chim.jpg', N'/images/8/vit.jpg', N'/images/8/cho.jpg', N'/images/8/ca.jpg', N'D', NULL, N'audios/8/ca.mp3', 8)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (32, NULL, N'/images/8/heo.jpg', N'/images/8/gautruc.jpg', N'/images/8/cho.jpg', N'/images/8/voi.jpg', N'A', NULL, N'audios/8/heo.mp3', 8)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (33, NULL, N'/images/8/voi.jpg', N'/images/8/chim.jpg', N'/images/8/ca.jpg', N'/images/8/vit.jpg', N'A', NULL, N'audios/8/voi.mp3', 8)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (34, NULL, N'/images/8/vit.jpg', N'/images/8/ga.jpg', N'/images/8/meo.jpg', N'/images/8/cho.jpg', N'B', NULL, N'audios/8/ga.mp3', 8)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (35, NULL, N'/images/8/chim.jpg', N'/images/8/ga.jpg', N'/images/8/meo.jpg', N'/images/8/vit.jpg', N'D', NULL, N'audios/8/vit.mp3', 8)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (36, NULL, N'/assets//images/chucai/a.jpg', N'/assets//images/chucai/a1.jpg', N'/assets//images/chucai/a2.jpg', N'/assets//images/chucai/b.jpg', N'A', NULL, N'audios/9/a.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (39, NULL, N'/assets//images/chucai/e.jpg', N'/assets//images/chucai/b.jpg', N'/assets//images/chucai/d1.jpg', N'/assets//images/chucai/g.jpg', N'B', NULL, N'audios/9/b.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (40, NULL, N'/assets//images/chucai/g.jpg', N'/assets//images/chucai/h.jpg', N'/assets//images/chucai/d.jpg', N'/assets//images/chucai/l.jpg', N'C', NULL, N'audios/9/d.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (42, NULL, N'/assets//images/chucai/o1.jpg', N'/assets//images/chucai/o2.jpg', N'/assets//images/chucai/p.jpg', N'/assets//images/chucai/a1.jpg', N'D', NULL, N'audios/9/a1.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (43, NULL, N'/assets//images/chucai/d1.jpg', N'/assets//images/chucai/g.jpg', N'/assets//images/chucai/r.jpg', N'/assets//images/chucai/a2.jpg', N'D', NULL, N'audios/9/a2.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (44, NULL, N'/assets//images/chucai/p.jpg', N'/assets//images/chucai/r.jpg', N'/assets//images/chucai/c.jpg', N'/assets//images/chucai/o1.jpg', N'C', NULL, N'audios/9/c.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (45, NULL, N'/assets//images/chucai/d1.jpg', N'/assets//images/chucai/p.jpg', N'/assets//images/chucai/q.jpg', N'/assets//images/chucai/r.jpg', N'A', NULL, N'audios/9/d1.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (46, NULL, N'/assets//images/chucai/e.jpg', N'/assets//images/chucai/i.jpg', N'/assets//images/chucai/h.jpg', N'/assets//images/chucai/m.jpg', N'A', NULL, N'audios/9/e.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (47, NULL, N'/assets//images/chucai/h.jpg', N'/assets//images/chucai/i.jpg', N'/assets//images/chucai/g.jpg', N'/assets//images/chucai/p.jpg', N'C', NULL, N'audios/9/g.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (48, NULL, N'/assets//images/chucai/u.jpg', N'/assets//images/chucai/s.jpg', N'/assets//images/chucai/r.jpg', N'/assets//images/chucai/i.jpg', N'D', NULL, N'audios/9/i.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (49, NULL, N'/assets//images/chucai/b.jpg', N'/assets//images/chucai/l.jpg', N'/assets//images/chucai/e.jpg', N'/assets//images/chucai/v.jpg', N'B', NULL, N'audios/9/l.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (50, NULL, N'/assets//images/chucai/n.jpg', N'/assets//images/chucai/q.jpg', N'/assets//images/chucai/r.jpg', N'/assets//images/chucai/s.jpg', N'A', NULL, N'audios/9/n.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (51, NULL, N'/assets//images/chucai/o2.jpg', N'/assets//images/chucai/o1.jpg', N'/assets//images/chucai/h.jpg', N'/assets//images/chucai/i.jpg', N'B', NULL, N'audios/9/o1.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (52, NULL, N'/assets//images/chucai/c.jpg', N'/assets//images/chucai/b.jpg', N'/assets//images/chucai/a2.jpg', N'/assets//images/chucai/p.jpg', N'D', NULL, N'audios/9/p.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (53, NULL, N'/assets//images/chucai/u.jpg', N'/assets//images/chucai/t.jpg', N'/assets//images/chucai/r.jpg', N'/assets//images/chucai/s.jpg', N'C', NULL, N'audios/9/r.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (54, NULL, N'/assets//images/chucai/k.jpg', N'/assets//images/chucai/o2.jpg', N'/assets//images/chucai/t.jpg', N'/assets//images/chucai/m.jpg', N'C', NULL, N'audios/9/t.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (55, NULL, N'/assets//images/chucai/e1.jpg', N'/assets//images/chucai/h.jpg', N'/assets//images/chucai/k.jpg', N'/assets//images/chucai/u1.jpg', N'D', NULL, N'audios/9/u1.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (56, NULL, N'/assets//images/chucai/x.jpg', N'/assets//images/chucai/k.jpg', N'/assets//images/chucai/g.jpg', N'/assets//images/chucai/d1.jpg', N'A', NULL, N'audios/9/x.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (57, NULL, N'/assets//images/chucai/e1.jpg', N'/assets//images/chucai/l.jpg', N'/assets//images/chucai/m.jpg', N'/assets//images/chucai/n.jpg', N'A', NULL, N'audios/9/e1.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (58, NULL, N'/assets//images/chucai/h.jpg', N'/assets//images/chucai/o1.jpg', N'/assets//images/chucai/o2.jpg', N'/assets//images/chucai/p.jpg', N'A', NULL, N'audios/9/h.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (59, NULL, N'/assets//images/chucai/o.jpg', N'/assets//images/chucai/k.jpg', N'/assets//images/chucai/p.jpg', N'/assets//images/chucai/r.jpg', N'B', NULL, N'audios/9/k.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (60, NULL, N'/assets//images/chucai/o2.jpg', N'/assets//images/chucai/m.jpg', N'/assets//images/chucai/q.jpg', N'/assets//images/chucai/n.jpg', N'B', NULL, N'audios/9/m.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (61, NULL, N'/assets//images/chucai/o.jpg', N'/assets//images/chucai/e1.jpg', N'/assets//images/chucai/i.jpg', N'/assets//images/chucai/a1.jpg', N'A', NULL, N'audios/9/o.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (62, NULL, N'/assets//images/chucai/u1.jpg', N'/assets//images/chucai/v.jpg', N'/assets//images/chucai/o2.jpg', N'/assets//images/chucai/x.jpg', N'C', NULL, N'audios/9/o2.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (63, NULL, N'/assets//images/chucai/b.jpg', N'/assets//images/chucai/c.jpg', N'/assets//images/chucai/q.jpg', N'/assets//images/chucai/e1.jpg', N'C', NULL, N'audios/9/q.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (64, NULL, N'/assets//images/chucai/e1.jpg', N'/assets//images/chucai/s.jpg', N'/assets//images/chucai/h.jpg', N'/assets//images/chucai/a1.jpg', N'B', NULL, N'audios/9/s.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (65, NULL, N'/assets//images/chucai/y.jpg', N'/assets//images/chucai/v.jpg', N'/assets//images/chucai/u1.jpg', N'/assets//images/chucai/u.jpg', N'D', NULL, N'audios/9/u.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (66, NULL, N'/assets//images/chucai/e1.jpg', N'/assets//images/chucai/h.jpg', N'/assets//images/chucai/l.jpg', N'/assets//images/chucai/v.jpg', N'D', NULL, N'audios/9/v.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (67, NULL, N'/assets//images/chucai/y.jpg', N'/assets//images/chucai/q.jpg', N'/assets//images/chucai/t.jpg', N'/assets//images/chucai/v.jpg', N'A', NULL, N'audios/9/y.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (68, NULL, N'/assets//images/chuso/0.jpg', N'/assets//images/chuso/3.jpg', N'/assets//images/chuso/5.jpg', N'/assets//images/chuso/8.jpg', N'A', NULL, N'audios/10/0.mp3', 10)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (69, NULL, N'/assets//images/chuso/7.jpg', N'/assets//images/chuso/4.jpg', N'/assets//images/chuso/1.jpg', N'/assets//images/chuso/3.jpg', N'C', NULL, N'audios/10/1.mp3', 10)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (70, NULL, N'/assets//images/chuso/6.jpg', N'/assets//images/chuso/4.jpg', N'/assets//images/chuso/3.jpg', N'/assets//images/chuso/2.jpg', N'D', NULL, N'audios/10/2.mp3', 10)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (71, NULL, N'/assets//images/chuso/6.jpg', N'/assets//images/chuso/3.jpg', N'/assets//images/chuso/8.jpg', N'/assets//images/chuso/9.jpg', N'B', NULL, N'audios/10/3.mp3', 10)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (72, NULL, N'/assets//images/chuso/4.jpg', N'/assets//images/chuso/1.jpg', N'/assets//images/chuso/6.jpg', N'/assets//images/chuso/7.jpg', N'A', NULL, N'audios/10/4.mp3', 10)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (73, NULL, N'/assets//images/chuso/7.jpg', N'/assets//images/chuso/5.jpg', N'/assets//images/chuso/9.jpg', N'/assets//images/chuso/1.jpg', N'B', NULL, N'audios/10/5.mp3', 10)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (74, NULL, N'/assets//images/chuso/0.jpg', N'/assets//images/chuso/4.jpg', N'/assets//images/chuso/8.jpg', N'/assets//images/chuso/6.jpg', N'D', NULL, N'audios/10/6.mp3', 10)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (75, NULL, N'/assets//images/chuso/9.jpg', N'/assets//images/chuso/2.jpg', N'/assets//images/chuso/7.jpg', N'/assets//images/chuso/8.jpg', N'C', NULL, N'audios/10/7.mp3', 10)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (76, NULL, N'/assets//images/chuso/2.jpg', N'/assets//images/chuso/4.jpg', N'/assets//images/chuso/8.jpg', N'/assets//images/chuso/0.jpg', N'C', NULL, N'audios/10/8.mp3', 10)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (77, NULL, N'/assets//images/chuso/8.jpg', N'/assets//images/chuso/6.jpg', N'/assets//images/chuso/9.jpg', N'/assets//images/chuso/0.jpg', N'C', NULL, N'audios/10/9.mp3', 10)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (79, NULL, N'/images/11/xedap.jpg', N'/images/11/xemay.jpg', N'/images/11/xeoto.jpg', N'/images/11/tauthuy.jpg', N'B', NULL, N'audios/11/xemay.mp3', 11)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (80, NULL, N'/images/11/tauthuy.jpg', N'/images/11/xedap.jpg', N'/images/11/xemay.jpg', N'/images/11/tauhoa.jpg', N'B', NULL, N'audios/11/xedap.mp3', 11)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (81, NULL, N'/images/11/tauthuy.jpg', N'/images/11/tauhoa.jpg', N'/images/11/xeoto.jpg', N'/images/11/xedap.jpg', N'C', NULL, N'audios/11/xeoto.mp3', 11)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (82, NULL, N'/images/11/tauhoa.jpg', N'/images/11/xedap.jpg', N'/images/11/maybay.jpg', N'/images/11/tauthuy.jpg', N'A', NULL, N'audios/11/tauhoa.mp3', 11)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (83, NULL, N'/images/11/xedap.jpg', N'/images/11/xeoto.jpg', N'/images/11/tauhoa.jpg', N'/images/11/tauthuy.jpg', N'D', NULL, N'audios/11/tauthuy.mp3', 11)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (84, NULL, N'/images/11/maybay.jpg', N'/images/11/xedap.jpg', N'/images/11/xemay.jpg', N'/images/11/tauhoa.jpg', N'A', NULL, N'audios/11/maybay.mp3', 11)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (85, NULL, N'/images/12/chomchom.jpg', N'/images/12/xoai.jpg', N'/images/12/mit.jpg', N'/images/12/dua.jpg', N'B', NULL, N'audios/12/xoai.mp3', 12)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (86, NULL, N'/images/12/nhan.jpg', N'/images/12/mit.jpg', N'/images/12/cam.jpg', N'/images/12/chomchom.jpg', N'B', NULL, N'audios/12/mit.mp3', 12)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (87, NULL, N'/images/12/cam.jpg', N'/images/12/chomchom.jpg', N'/images/12/nhan.jpg', N'/images/12/dua.jpg', N'A', NULL, N'audios/12/cam.mp3', 12)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (88, NULL, N'/images/12/xoai.jpg', N'/images/12/dua.jpg', N'/images/12/nhan.jpg', N'/images/12/chomchom.jpg', N'D', NULL, N'audios/12/chomchom.mp3', 12)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (89, NULL, N'/images/12/chomchom.jpg', N'/images/12/mit.jpg', N'/images/12/nhan.jpg', N'/images/12/xoai.jpg', N'C', NULL, N'audios/12/nhan.mp3', 12)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (90, NULL, N'/images/12/nhan.jpg', N'/images/12/xoai.jpg', N'/images/12/chomchom.jpg', N'/images/12/dua.jpg', N'D', NULL, N'audios/12/dua.mp3', 12)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (91, NULL, N'/images/13/congan.jpg', N'/images/13/thaygiao.jpg', N'/images/13/bacnongdan.jpg', N'/images/13/bacsi.jpg', N'D', NULL, N'audios/13/bacsi.mp3', 13)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (92, NULL, N'/images/13/colaocong.jpg', N'/images/13/bacnongdan.jpg', N'/images/13/congan.jpg', N'/images/13/thaygiao.jpg', N'C', NULL, N'audios/13/congan.mp3', 13)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (93, NULL, N'/images/13/bacnongdan.jpg', N'/images/13/congan.jpg', N'/images/13/bacsi.jpg', N'/images/13/thaygiao.jpg', N'D', NULL, N'audios/13/thaygiao.mp3', 13)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (94, NULL, N'/images/13/congan.jpg', N'/images/13/bacnongdan.jpg', N'/images/13/thaygiao.jpg', N'/images/13/colaocong.jpg', N'D', NULL, N'audios/13/colaocong.mp3', 13)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (95, NULL, N'/images/13/bacnongdan.jpg', N'/images/13/thaygiao.jpg', N'/images/13/colaocong.jpg', N'/images/13/congan.jpg', N'A', NULL, N'audios/13/bacnongdan.mp3', 13)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (96, NULL, N'/assets//images/demdovat/2.jpg', N'/assets//images/demdovat/1.jpg', N'/assets//images/demdovat/3.jpg', N'/assets//images/demdovat/4.jpg', N'B', NULL, N'audios/14/1.mp3', 14)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (97, NULL, N'/assets//images/demdovat/2.jpg', N'/assets//images/demdovat/7.jpg', N'/assets//images/demdovat/4.jpg', N'/assets//images/demdovat/8.jpg', N'A', NULL, N'audios/14/2.mp3', 14)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (98, NULL, N'/assets//images/demdovat/4.jpg', N'/assets//images/demdovat/2.jpg', N'/assets//images/demdovat/3.jpg', N'/assets//images/demdovat/1.jpg', N'C', NULL, N'audios/14/3.mp3', 14)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (99, NULL, N'/assets//images/demdovat/5.jpg', N'/assets//images/demdovat/2.jpg', N'/assets//images/demdovat/3.jpg', N'/assets//images/demdovat/4.jpg', N'D', NULL, N'audios/14/4.mp3', 14)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (101, NULL, N'/assets//images/demdovat/7.jpg', N'/assets//images/demdovat/6.jpg', N'/assets//images/demdovat/4.jpg', N'/assets//images/demdovat/5.jpg', N'D', NULL, N'audios/14/5.mp3', 14)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (102, NULL, N'/assets//images/demdovat/5.jpg', N'/assets//images/demdovat/6.jpg', N'/assets//images/demdovat/7.jpg', N'/assets//images/demdovat/8.jpg', N'B', NULL, N'audios/14/6.mp3', 14)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (103, NULL, N'/assets//images/demdovat/7.jpg', N'/assets//images/demdovat/6.jpg', N'/assets//images/demdovat/8.jpg', N'/assets//images/demdovat/9.jpg', N'A', NULL, N'audios/14/7.mp3', 14)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (104, NULL, N'/assets//images/demdovat/10.jpg', N'/assets//images/demdovat/9.jpg', N'/assets//images/demdovat/8.jpg', N'/assets//images/demdovat/7.jpg', N'C', NULL, N'audios/14/8.mp3', 14)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (105, NULL, N'/assets//images/demdovat/8.jpg', N'/assets//images/demdovat/9.jpg', N'/assets//images/demdovat/10.jpg', N'/assets//images/demdovat/7.jpg', N'B', NULL, N'audios/14/9.mp3', 14)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (106, NULL, N'/assets//images/demdovat/7.jpg', N'/assets//images/demdovat/9.jpg', N'/assets//images/demdovat/8.jpg', N'/assets//images/demdovat/10.jpg', N'D', NULL, N'audios/14/10.mp3', 14)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (107, NULL, N'/images/16/mattrang.jpg', N'/images/16/sao.jpg', N'/images/16/may.jpg', N'/images/16/cauvong.jpg', N'C', NULL, N'audios/16/may.mp3', 16)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (108, NULL, N'/images/16/sao.jpg', N'/images/16/cauvong.jpg', N'/images/16/may.jpg', N'/images/16/mua.jpg', N'D', NULL, N'audios/16/mua.mp3', 16)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (109, NULL, N'/images/16/mattrang.jpg', N'/images/16/mattroi.jpg', N'/images/16/sao.jpg', N'/images/16/cauvong.jpg', N'A', NULL, N'audios/16/mattrang.mp3', 16)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (110, NULL, N'/images/16/mua.jpg', N'/images/16/mattrang.jpg', N'/images/16/cauvong.jpg', N'/images/16/mattroi.jpg', N'D', NULL, N'audios/16/mattroi.mp3', 16)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (111, NULL, N'/images/16/mattroi.jpg', N'/images/16/sao.jpg', N'/images/16/mattrang.jpg', N'/images/16/mua.jpg', N'B', NULL, N'audios/16/sao.mp3', 16)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (112, NULL, N'/images/16/mattroi.jpg', N'/images/16/cauvong.jpg', N'/images/16/mua.jpg', N'/images/16/may.jpg', N'B', NULL, N'audios/16/cauvong.mp3', 16)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (113, NULL, N'/images/16/mattroi.jpg', N'/images/16/cauvong.jpg', N'/images/16/mua.jpg', N'/images/16/may.jpg', N'C', NULL, N'audios/17/hinhtron.mp3', 17)
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[Quiz] ON 

INSERT [dbo].[Quiz] ([quizID], [name], [catelogy], [image], [numberQuestion]) VALUES (1, N'Toán 1 sơ cấp', N'toan1', N'images/quiz/16510455392186.jpg', 1)
INSERT [dbo].[Quiz] ([quizID], [name], [catelogy], [image], [numberQuestion]) VALUES (2, N'Màu sắc', N'quizbaby', N'images/quiz/mausac.jpg', 8)
INSERT [dbo].[Quiz] ([quizID], [name], [catelogy], [image], [numberQuestion]) VALUES (3, N'Động vật (English)', N'quizenglish', N'images/quiz/dongvatEnglish.jpg', 5)
INSERT [dbo].[Quiz] ([quizID], [name], [catelogy], [image], [numberQuestion]) VALUES (8, N'Động vật', N'quizbaby', N'images/quiz/dongvat.jpg', 10)
INSERT [dbo].[Quiz] ([quizID], [name], [catelogy], [image], [numberQuestion]) VALUES (9, N'Chữ cái', N'quizbaby', N'images/quiz/chucai.jpg', 29)
INSERT [dbo].[Quiz] ([quizID], [name], [catelogy], [image], [numberQuestion]) VALUES (10, N'Chữ số', N'quizbaby', N'images/quiz/chuso.jpg', 10)
INSERT [dbo].[Quiz] ([quizID], [name], [catelogy], [image], [numberQuestion]) VALUES (11, N'Phương tiện', N'quizbaby', N'images/quiz/phuongtien.jpg', 6)
INSERT [dbo].[Quiz] ([quizID], [name], [catelogy], [image], [numberQuestion]) VALUES (12, N'Trái cây', N'quizbaby', N'images/quiz/traicay.jpg', 6)
INSERT [dbo].[Quiz] ([quizID], [name], [catelogy], [image], [numberQuestion]) VALUES (13, N'Nghề nghiệp', N'quizbaby', N'images/quiz/nghenghiep.jpg', 5)
INSERT [dbo].[Quiz] ([quizID], [name], [catelogy], [image], [numberQuestion]) VALUES (14, N'Đếm đồ vật', N'quizbaby', N'images/quiz/demdovat.jpg', 10)
INSERT [dbo].[Quiz] ([quizID], [name], [catelogy], [image], [numberQuestion]) VALUES (16, N'Thời tiết', N'quizbaby', N'images/quiz/thoitiet.jpg', 6)
INSERT [dbo].[Quiz] ([quizID], [name], [catelogy], [image], [numberQuestion]) VALUES (17, N'Hình học', N'quizbaby', N'images/quiz/hinhhoc.jpg', 1)
INSERT [dbo].[Quiz] ([quizID], [name], [catelogy], [image], [numberQuestion]) VALUES (27, N'Toán 1 sơ cấp 3', N'toan3', N'images/quiz/16511187643087.jpg', 0)
SET IDENTITY_INSERT [dbo].[Quiz] OFF
INSERT [dbo].[TitleQuiz] ([catelogy], [title]) VALUES (N'toan1', N'Quiz Toán 1')
INSERT [dbo].[TitleQuiz] ([catelogy], [title]) VALUES (N'toan2', N'Quiz Toán 2')
INSERT [dbo].[TitleQuiz] ([catelogy], [title]) VALUES (N'toan3', N'Quiz Toán 3')
INSERT [dbo].[TitleQuiz] ([catelogy], [title]) VALUES (N'toan4', N'Quiz Toán 4')
INSERT [dbo].[TitleQuiz] ([catelogy], [title]) VALUES (N'toan5', N'Quiz Toán 5')
INSERT [dbo].[TitleQuiz] ([catelogy], [title]) VALUES (N'toannc', N'Quiz Toán nâng cao')
INSERT [dbo].[TitleQuiz] ([catelogy], [title]) VALUES (N'quizbaby', N'Quiz cho bé')
INSERT [dbo].[TitleQuiz] ([catelogy], [title]) VALUES (N'quizenglish', N'Quiz Tiếng Anh')
INSERT [dbo].[User_Quiz] ([username], [quizID], [score]) VALUES (N'nghia1', 1, 100)
INSERT [dbo].[User_Quiz] ([username], [quizID], [score]) VALUES (N'nghia1', 2, 88)
INSERT [dbo].[User_Quiz] ([username], [quizID], [score]) VALUES (N'nghia1', 8, 30)
INSERT [dbo].[User_Quiz] ([username], [quizID], [score]) VALUES (N'nghia1', 9, 52)
INSERT [dbo].[User_Quiz] ([username], [quizID], [score]) VALUES (N'nghia1', 10, 100)
INSERT [dbo].[User_Quiz] ([username], [quizID], [score]) VALUES (N'nghia1', 12, 33)
INSERT [dbo].[User_Quiz] ([username], [quizID], [score]) VALUES (N'nghia1', 13, 100)
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_Quiztion] FOREIGN KEY([quizID])
REFERENCES [dbo].[Quiz] ([quizID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Quiz_Quiztion]
GO
ALTER TABLE [dbo].[User_Quiz]  WITH CHECK ADD  CONSTRAINT [FK_QuizUser] FOREIGN KEY([quizID])
REFERENCES [dbo].[Quiz] ([quizID])
GO
ALTER TABLE [dbo].[User_Quiz] CHECK CONSTRAINT [FK_QuizUser]
GO
ALTER TABLE [dbo].[User_Quiz]  WITH CHECK ADD  CONSTRAINT [FK_UserQuiz] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[User_Quiz] CHECK CONSTRAINT [FK_UserQuiz]
GO
USE [master]
GO
ALTER DATABASE [QuizApp] SET  READ_WRITE 
GO
