USE [master]
GO
/****** Object:  Database [QuizApp]    Script Date: 18/4/2022 12:47:22 PM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 18/4/2022 12:47:22 PM ******/
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
/****** Object:  Table [dbo].[Question]    Script Date: 18/4/2022 12:47:22 PM ******/
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
/****** Object:  Table [dbo].[Quiz]    Script Date: 18/4/2022 12:47:22 PM ******/
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
/****** Object:  Table [dbo].[TitleQuiz]    Script Date: 18/4/2022 12:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TitleQuiz](
	[catelogy] [nvarchar](50) NULL,
	[title] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Quiz]    Script Date: 18/4/2022 12:47:22 PM ******/
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
INSERT [dbo].[Account] ([username], [password], [name], [age], [role]) VALUES (N'nghia', N'123', N'admin', 22, 0)
INSERT [dbo].[Account] ([username], [password], [name], [age], [role]) VALUES (N'nghia1', N'123', N'Nghĩa', 7, 1)
INSERT [dbo].[Account] ([username], [password], [name], [age], [role]) VALUES (N'nghia2', N'123', N'Nghĩa', 22, 1)
INSERT [dbo].[Account] ([username], [password], [name], [age], [role]) VALUES (N'nghia3', N'123', N'Nghĩa', 8, 1)
INSERT [dbo].[Account] ([username], [password], [name], [age], [role]) VALUES (N'nghia4', N'123', N'Nghia', 8, 1)
INSERT [dbo].[Account] ([username], [password], [name], [age], [role]) VALUES (N'nghia5', N'123', N'Nghĩa', 21, 1)
INSERT [dbo].[Account] ([username], [password], [name], [age], [role]) VALUES (N'nghia6', N'123', N'Tuấn', 12, 1)
INSERT [dbo].[Account] ([username], [password], [name], [age], [role]) VALUES (N'nghia7', N'123', N'tuan', 14, 1)
INSERT [dbo].[Account] ([username], [password], [name], [age], [role]) VALUES (N'nghia8', N'123', N'Nguyên', 6, 1)
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (1, N'1+1=', N'1', N'2', N'3', N'4', N'B', NULL, NULL, 1)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (3, N'1+4=', N'1', N'2', N'5', N'4', N'C', NULL, NULL, 1)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (5, NULL, N'https://media1.nguoiduatin.vn/thumb_x600x600/media/duong-thi-thu-nga/2018/04/09/mau-hong.jpg', N'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAACoCAMAAABt9SM9AAAAA1BMVEX/9QBwKRzPAAAAR0lEQVR4nO3BAQEAAACCIP+vbkhAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAO8GxYgAAb0jQ/cAAAAASUVORK5CYII=', N'https://media1.nguoiduatin.vn/thumb_x600x600/media/duong-thi-thu-nga/2018/04/09/mau-cam.jpg', N'https://giaydantuonganhtuan.vn/upload_images/images/do-600x600.jpg', N'A', NULL, N'color/mauhong.mp3', 2)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (6, NULL, N'https://media1.nguoiduatin.vn/thumb_x600x600/media/duong-thi-thu-nga/2018/04/09/mau-cam.jpg', N'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAACoCAMAAABt9SM9AAAAA1BMVEX/9QBwKRzPAAAAR0lEQVR4nO3BAQEAAACCIP+vbkhAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAO8GxYgAAb0jQ/cAAAAASUVORK5CYII=', N'https://media1.nguoiduatin.vn/thumb_x992x595/media/duong-thi-thu-nga/2018/04/09/mau-xanh-la.jpg', N'https://giaydantuonganhtuan.vn/upload_images/images/do-600x600.jpg', N'B', NULL, N'color/mauvang.mp3', 2)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (7, NULL, N'https://giaydantuonganhtuan.vn/upload_images/images/do-600x600.jpg', N'https://media1.nguoiduatin.vn/thumb_x992x595/media/duong-thi-thu-nga/2018/04/09/mau-xanh-la.jpg', N'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAACoCAMAAABt9SM9AAAAA1BMVEX/9QBwKRzPAAAAR0lEQVR4nO3BAQEAAACCIP+vbkhAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAO8GxYgAAb0jQ/cAAAAASUVORK5CYII=', N'https://media1.nguoiduatin.vn/thumb_x600x600/media/duong-thi-thu-nga/2018/04/09/mau-cam.jpg', N'D', NULL, N'color/maucam.mp3', 2)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (8, NULL, N'https://giaydantuonganhtuan.vn/upload_images/images/do-600x600.jpg', N'https://media1.nguoiduatin.vn/thumb_x600x600/media/duong-thi-thu-nga/2018/04/09/mau-cam.jpg', N'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAACoCAMAAABt9SM9AAAAA1BMVEX/9QBwKRzPAAAAR0lEQVR4nO3BAQEAAACCIP+vbkhAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAO8GxYgAAb0jQ/cAAAAASUVORK5CYII=', N'https://printgo.vn/uploads/media/792227/xcac-loai-mau-xanh-2_1624333127.jpg.pagespeed.ic.1wztESzF2g.webp', N'A', NULL, N'color/maudo.mp3', 2)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (9, NULL, N'https://media1.nguoiduatin.vn/thumb_x992x595/media/duong-thi-thu-nga/2018/04/09/mau-xanh-la.jpg', N'https://printgo.vn/uploads/media/792227/xcac-loai-mau-xanh-2_1624333127.jpg.pagespeed.ic.1wztESzF2g.webp', N'https://cdn.vnlife.org/img/2020/5/10/6151332c370534e2f47a1f72f7ac425f.jpg', N'https://salt.tikicdn.com/cache/280x280/ts/product/1d/f4/86/33445b67f590980f70ff8b639f216a49.PNG', N'A', NULL, N'color/mauxanhlacay.mp3', 2)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (11, NULL, N'https://media1.nguoiduatin.vn/thumb_x992x595/media/duong-thi-thu-nga/2018/04/09/mau-xanh-la.jpg', N'https://printgo.vn/uploads/media/792227/xcac-loai-mau-xanh-2_1624333127.jpg.pagespeed.ic.1wztESzF2g.webp', N'https://media1.nguoiduatin.vn/thumb_x600x600/media/duong-thi-thu-nga/2018/04/09/mau-cam.jpg', N'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAACoCAMAAABt9SM9AAAAA1BMVEX/9QBwKRzPAAAAR0lEQVR4nO3BAQEAAACCIP+vbkhAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAO8GxYgAAb0jQ/cAAAAASUVORK5CYII=', N'B', NULL, N'color/mauxanhbien.mp3', 2)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (14, NULL, N'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAACoCAMAAABt9SM9AAAAA1BMVEX/9QBwKRzPAAAAR0lEQVR4nO3BAQEAAACCIP+vbkhAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAO8GxYgAAb0jQ/cAAAAASUVORK5CYII=', N'https://media1.nguoiduatin.vn/thumb_x600x600/media/duong-thi-thu-nga/2018/04/09/mau-cam.jpg', N'https://giaydantuonganhtuan.vn/upload_images/images/do-600x600.jpg', N'https://cdn.vnlife.org/img/2020/5/10/6151332c370534e2f47a1f72f7ac425f.jpg', N'D', NULL, N'color/mautim.mp3', 2)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (15, NULL, N'https://salt.tikicdn.com/cache/280x280/ts/product/1d/f4/86/33445b67f590980f70ff8b639f216a49.PNG', N'https://printgo.vn/uploads/media/792227/xcac-loai-mau-xanh-2_1624333127.jpg.pagespeed.ic.1wztESzF2g.webp', N'https://cdn.vnlife.org/img/2020/5/10/6151332c370534e2f47a1f72f7ac425f.jpg', N'https://giaydantuonganhtuan.vn/upload_images/images/do-600x600.jpg', N'A', NULL, N'color/mauden.mp3', 2)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (17, N'Dog', NULL, NULL, NULL, NULL, N'dog', NULL, NULL, 3)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (18, N'Cat', NULL, NULL, NULL, NULL, N'cat', NULL, NULL, 3)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (19, N'Fish', NULL, NULL, NULL, NULL, N'fish', NULL, NULL, 3)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (21, N'Monkey', NULL, NULL, NULL, NULL, N'monkey', NULL, NULL, 3)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (22, N'Panda', NULL, NULL, NULL, NULL, N'panda', NULL, NULL, 3)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (23, NULL, N'http://vnnews24h.net/img_data/images/day-cho-con-lam-quen-khi-ve-nha-moi.jpg', N'https://vnn-imgs-f.vgcloud.vn/2021/07/12/09/5a8c73f8277a46b29cd14c5f1cdac0b9.jpg', N'https://mamnonhoami.edu.vn/wp-content/uploads/2021/06/con-kien-cang-co-kien-cham-chi.jpg', N'https://daohieu.com/wp-content/uploads/2020/05/meo-con.jpg', N'A', NULL, N'dongvat/cho.mp3', 8)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (24, NULL, N'https://daohieu.com/wp-content/uploads/2020/05/meo-con.jpg', N'https://nld.mediacdn.vn/dxlNyscccccccccccc0LrfrNo7RxIh/Image/2013/11/vocau_9e1f4.jpg', N'https://vnn-imgs-f.vgcloud.vn/2021/07/12/09/5a8c73f8277a46b29cd14c5f1cdac0b9.jpg', N'https://anh.eva.vn/upload/3-2020/images/2020-09-04/1599181947-363e1c12dc1c3f3bad7c87402d53782d.jpg', N'C', NULL, N'dongvat/gautruc.mp3', 8)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (25, NULL, N'https://static.tuoitre.vn/tto/i/s626/2017/04/29/voi-con-2-1493449937.jpg', N'https://mamnonhoami.edu.vn/wp-content/uploads/2021/06/con-kien-cang-co-kien-cham-chi.jpg', N'https://nhandan.vn/imgold/media/k2/items/src/4206/1e1e0a484336d0eb6ac20b8f4de6d347.jpg', N'https://klt.vn/wp-content/uploads/2020/12/huong-dan-phuong-phap-chua-benh-viem-gan-o-vit-con-em-vit-dang-yeu.jpg', N'B', NULL, N'dongvat/kien.mp3', 8)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (28, NULL, N'https://daohieu.com/wp-content/uploads/2020/05/meo-con.jpg', N'https://anh.eva.vn/upload/3-2020/images/2020-09-04/1599181947-363e1c12dc1c3f3bad7c87402d53782d.jpg', N'http://vnnews24h.net/img_data/images/day-cho-con-lam-quen-khi-ve-nha-moi.jpg', N'https://vnn-imgs-f.vgcloud.vn/2021/07/12/09/5a8c73f8277a46b29cd14c5f1cdac0b9.jpg', N'A', NULL, N'dongvat/meo.mp3', 8)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (29, NULL, N'http://vnnews24h.net/img_data/images/day-cho-con-lam-quen-khi-ve-nha-moi.jpg', N'https://daohieu.com/wp-content/uploads/2020/05/meo-con.jpg', N'https://nld.mediacdn.vn/dxlNyscccccccccccc0LrfrNo7RxIh/Image/2013/11/vocau_9e1f4.jpg', N'https://anh.eva.vn/upload/3-2020/images/2020-09-04/1599181947-363e1c12dc1c3f3bad7c87402d53782d.jpg', N'C', NULL, N'dongvat/chim.mp3', 8)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (31, NULL, N'https://nhandan.vn/imgold/media/k2/items/src/4206/1e1e0a484336d0eb6ac20b8f4de6d347.jpg', N'https://klt.vn/wp-content/uploads/2020/12/huong-dan-phuong-phap-chua-benh-viem-gan-o-vit-con-em-vit-dang-yeu.jpg', N'https://nld.mediacdn.vn/dxlNyscccccccccccc0LrfrNo7RxIh/Image/2013/11/vocau_9e1f4.jpg', N'https://anh.eva.vn/upload/3-2020/images/2020-09-04/1599181947-363e1c12dc1c3f3bad7c87402d53782d.jpg', N'D', NULL, N'dongvat/ca.mp3', 8)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (32, NULL, N'https://thuoctrangtrai.com/mediacenter/media/images/2451/news/ava/s1000_1000/heo-con-moi-sinh-bi-tieu-chay-1-1572222031.jpg', N'https://vnn-imgs-f.vgcloud.vn/2021/07/12/09/5a8c73f8277a46b29cd14c5f1cdac0b9.jpg', N'http://vnnews24h.net/img_data/images/day-cho-con-lam-quen-khi-ve-nha-moi.jpg', N'https://static.tuoitre.vn/tto/i/s626/2017/04/29/voi-con-2-1493449937.jpg', N'A', NULL, N'dongvat/heo.mp3', 8)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (33, NULL, N'https://static.tuoitre.vn/tto/i/s626/2017/04/29/voi-con-2-1493449937.jpg', N'https://nld.mediacdn.vn/dxlNyscccccccccccc0LrfrNo7RxIh/Image/2013/11/vocau_9e1f4.jpg', N'https://anh.eva.vn/upload/3-2020/images/2020-09-04/1599181947-363e1c12dc1c3f3bad7c87402d53782d.jpg', N'https://klt.vn/wp-content/uploads/2020/12/huong-dan-phuong-phap-chua-benh-viem-gan-o-vit-con-em-vit-dang-yeu.jpg', N'A', NULL, N'dongvat/voi.mp3', 8)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (34, NULL, N'https://nld.mediacdn.vn/dxlNyscccccccccccc0LrfrNo7RxIh/Image/2013/11/vocau_9e1f4.jpg', N'https://nhandan.vn/imgold/media/k2/items/src/4206/1e1e0a484336d0eb6ac20b8f4de6d347.jpg', N'https://daohieu.com/wp-content/uploads/2020/05/meo-con.jpg', N'http://vnnews24h.net/img_data/images/day-cho-con-lam-quen-khi-ve-nha-moi.jpg', N'B', NULL, N'dongvat/ga.mp3', 8)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (35, NULL, N'https://anh.eva.vn/upload/3-2020/images/2020-09-04/1599181947-363e1c12dc1c3f3bad7c87402d53782d.jpg', N'https://nhandan.vn/imgold/media/k2/items/src/4206/1e1e0a484336d0eb6ac20b8f4de6d347.jpg', N'https://daohieu.com/wp-content/uploads/2020/05/meo-con.jpg', N'https://klt.vn/wp-content/uploads/2020/12/huong-dan-phuong-phap-chua-benh-viem-gan-o-vit-con-em-vit-dang-yeu.jpg', N'D', NULL, N'dongvat/vit.mp3', 8)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (36, NULL, N'/assets/images/chucai/a.jpg', N'/assets/images/chucai/a1.jpg', N'/assets/images/chucai/a2.jpg', N'/assets/images/chucai/b.jpg', N'A', NULL, N'chucai/a.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (39, NULL, N'/assets/images/chucai/e.jpg', N'/assets/images/chucai/b.jpg', N'/assets/images/chucai/d1.jpg', N'/assets/images/chucai/g.jpg', N'B', NULL, N'chucai/b.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (40, NULL, N'/assets/images/chucai/g.jpg', N'/assets/images/chucai/h.jpg', N'/assets/images/chucai/d.jpg', N'/assets/images/chucai/l.jpg', N'C', NULL, N'chucai/d.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (42, NULL, N'/assets/images/chucai/o1.jpg', N'/assets/images/chucai/o2.jpg', N'/assets/images/chucai/p.jpg', N'/assets/images/chucai/a1.jpg', N'D', NULL, N'chucai/a1.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (43, NULL, N'/assets/images/chucai/d1.jpg', N'/assets/images/chucai/g.jpg', N'/assets/images/chucai/r.jpg', N'/assets/images/chucai/a2.jpg', N'D', NULL, N'chucai/a2.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (44, NULL, N'/assets/images/chucai/p.jpg', N'/assets/images/chucai/r.jpg', N'/assets/images/chucai/c.jpg', N'/assets/images/chucai/o1.jpg', N'C', NULL, N'chucai/c.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (45, NULL, N'/assets/images/chucai/d1.jpg', N'/assets/images/chucai/p.jpg', N'/assets/images/chucai/q.jpg', N'/assets/images/chucai/r.jpg', N'A', NULL, N'chucai/d1.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (46, NULL, N'/assets/images/chucai/e.jpg', N'/assets/images/chucai/i.jpg', N'/assets/images/chucai/h.jpg', N'/assets/images/chucai/m.jpg', N'A', NULL, N'chucai/e.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (47, NULL, N'/assets/images/chucai/h.jpg', N'/assets/images/chucai/i.jpg', N'/assets/images/chucai/g.jpg', N'/assets/images/chucai/p.jpg', N'C', NULL, N'chucai/g.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (48, NULL, N'/assets/images/chucai/u.jpg', N'/assets/images/chucai/s.jpg', N'/assets/images/chucai/r.jpg', N'/assets/images/chucai/i.jpg', N'D', NULL, N'chucai/i.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (49, NULL, N'/assets/images/chucai/b.jpg', N'/assets/images/chucai/l.jpg', N'/assets/images/chucai/e.jpg', N'/assets/images/chucai/v.jpg', N'B', NULL, N'chucai/l.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (50, NULL, N'/assets/images/chucai/n.jpg', N'/assets/images/chucai/q.jpg', N'/assets/images/chucai/r.jpg', N'/assets/images/chucai/s.jpg', N'A', NULL, N'chucai/n.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (51, NULL, N'/assets/images/chucai/o2.jpg', N'/assets/images/chucai/o1.jpg', N'/assets/images/chucai/h.jpg', N'/assets/images/chucai/i.jpg', N'B', NULL, N'chucai/o1.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (52, NULL, N'/assets/images/chucai/c.jpg', N'/assets/images/chucai/b.jpg', N'/assets/images/chucai/a2.jpg', N'/assets/images/chucai/p.jpg', N'D', NULL, N'chucai/p.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (53, NULL, N'/assets/images/chucai/u.jpg', N'/assets/images/chucai/t.jpg', N'/assets/images/chucai/r.jpg', N'/assets/images/chucai/s.jpg', N'C', NULL, N'chucai/r.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (54, NULL, N'/assets/images/chucai/k.jpg', N'/assets/images/chucai/o2.jpg', N'/assets/images/chucai/t.jpg', N'/assets/images/chucai/m.jpg', N'C', NULL, N'chucai/t.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (55, NULL, N'/assets/images/chucai/e1.jpg', N'/assets/images/chucai/h.jpg', N'/assets/images/chucai/k.jpg', N'/assets/images/chucai/u1.jpg', N'D', NULL, N'chucai/u1.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (56, NULL, N'/assets/images/chucai/x.jpg', N'/assets/images/chucai/k.jpg', N'/assets/images/chucai/g.jpg', N'/assets/images/chucai/d1.jpg', N'A', NULL, N'chucai/x.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (57, NULL, N'/assets/images/chucai/e1.jpg', N'/assets/images/chucai/l.jpg', N'/assets/images/chucai/m.jpg', N'/assets/images/chucai/n.jpg', N'A', NULL, N'chucai/e1.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (58, NULL, N'/assets/images/chucai/h.jpg', N'/assets/images/chucai/o1.jpg', N'/assets/images/chucai/o2.jpg', N'/assets/images/chucai/p.jpg', N'A', NULL, N'chucai/h.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (59, NULL, N'/assets/images/chucai/o.jpg', N'/assets/images/chucai/k.jpg', N'/assets/images/chucai/p.jpg', N'/assets/images/chucai/r.jpg', N'B', NULL, N'chucai/k.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (60, NULL, N'/assets/images/chucai/o2.jpg', N'/assets/images/chucai/m.jpg', N'/assets/images/chucai/q.jpg', N'/assets/images/chucai/n.jpg', N'B', NULL, N'chucai/m.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (61, NULL, N'/assets/images/chucai/o.jpg', N'/assets/images/chucai/e1.jpg', N'/assets/images/chucai/i.jpg', N'/assets/images/chucai/a1.jpg', N'A', NULL, N'chucai/o.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (62, NULL, N'/assets/images/chucai/u1.jpg', N'/assets/images/chucai/v.jpg', N'/assets/images/chucai/o2.jpg', N'/assets/images/chucai/x.jpg', N'C', NULL, N'chucai/o2.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (63, NULL, N'/assets/images/chucai/b.jpg', N'/assets/images/chucai/c.jpg', N'/assets/images/chucai/q.jpg', N'/assets/images/chucai/e1.jpg', N'C', NULL, N'chucai/q.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (64, NULL, N'/assets/images/chucai/e1.jpg', N'/assets/images/chucai/s.jpg', N'/assets/images/chucai/h.jpg', N'/assets/images/chucai/a1.jpg', N'B', NULL, N'chucai/s.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (65, NULL, N'/assets/images/chucai/y.jpg', N'/assets/images/chucai/v.jpg', N'/assets/images/chucai/u1.jpg', N'/assets/images/chucai/u.jpg', N'D', NULL, N'chucai/u.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (66, NULL, N'/assets/images/chucai/e1.jpg', N'/assets/images/chucai/h.jpg', N'/assets/images/chucai/l.jpg', N'/assets/images/chucai/v.jpg', N'D', NULL, N'chucai/v.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (67, NULL, N'/assets/images/chucai/y.jpg', N'/assets/images/chucai/q.jpg', N'/assets/images/chucai/t.jpg', N'/assets/images/chucai/v.jpg', N'A', NULL, N'chucai/y.mp3', 9)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (68, NULL, N'/assets/images/chuso/0.jpg', N'/assets/images/chuso/3.jpg', N'/assets/images/chuso/5.jpg', N'/assets/images/chuso/8.jpg', N'A', NULL, N'chuso/0.mp3', 10)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (69, NULL, N'/assets/images/chuso/7.jpg', N'/assets/images/chuso/4.jpg', N'/assets/images/chuso/1.jpg', N'/assets/images/chuso/3.jpg', N'C', NULL, N'chuso/1.mp3', 10)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (70, NULL, N'/assets/images/chuso/6.jpg', N'/assets/images/chuso/4.jpg', N'/assets/images/chuso/3.jpg', N'/assets/images/chuso/2.jpg', N'D', NULL, N'chuso/2.mp3', 10)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (71, NULL, N'/assets/images/chuso/6.jpg', N'/assets/images/chuso/3.jpg', N'/assets/images/chuso/8.jpg', N'/assets/images/chuso/9.jpg', N'B', NULL, N'chuso/3.mp3', 10)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (72, NULL, N'/assets/images/chuso/4.jpg', N'/assets/images/chuso/1.jpg', N'/assets/images/chuso/6.jpg', N'/assets/images/chuso/7.jpg', N'A', NULL, N'chuso/4.mp3', 10)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (73, NULL, N'/assets/images/chuso/7.jpg', N'/assets/images/chuso/5.jpg', N'/assets/images/chuso/9.jpg', N'/assets/images/chuso/1.jpg', N'B', NULL, N'chuso/5.mp3', 10)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (74, NULL, N'/assets/images/chuso/0.jpg', N'/assets/images/chuso/4.jpg', N'/assets/images/chuso/8.jpg', N'/assets/images/chuso/6.jpg', N'D', NULL, N'chuso/6.mp3', 10)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (75, NULL, N'/assets/images/chuso/9.jpg', N'/assets/images/chuso/2.jpg', N'/assets/images/chuso/7.jpg', N'/assets/images/chuso/8.jpg', N'C', NULL, N'chuso/7.mp3', 10)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (76, NULL, N'/assets/images/chuso/2.jpg', N'/assets/images/chuso/4.jpg', N'/assets/images/chuso/8.jpg', N'/assets/images/chuso/0.jpg', N'C', NULL, N'chuso/8.mp3', 10)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (77, NULL, N'/assets/images/chuso/8.jpg', N'/assets/images/chuso/6.jpg', N'/assets/images/chuso/9.jpg', N'/assets/images/chuso/0.jpg', N'C', NULL, N'chuso/9.mp3', 10)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (79, NULL, N'http://socnhi3.vcmedia.vn/users/636736/xedap12.png', N'https://i.pinimg.com/originals/f6/5d/3f/f65d3f678f041ffac20096826e948d11.jpg', N'https://png.pngtree.com/png-clipart/20190617/original/pngtree-hand-drawn-car-cartoon-car-beautiful-car-red-car-black-wheel-png-image_3832136.jpg', N'https://xn--v-nwm.vn/wp-content/uploads/2020/04/1587616863_372_Lam-the-nao-de-ve-mot-con-tau-Huong.png', N'B', NULL, N'phuongtien/xemay.mp3', 11)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (80, NULL, N'https://xn--v-nwm.vn/wp-content/uploads/2020/04/1587616863_372_Lam-the-nao-de-ve-mot-con-tau-Huong.png', N'http://socnhi3.vcmedia.vn/users/636736/xedap12.png', N'https://i.pinimg.com/originals/f6/5d/3f/f65d3f678f041ffac20096826e948d11.jpg', N'http://socnhi.vcmedia.vn/users/916377/tau-hoa-8.png', N'B', NULL, N'phuongtien/xedap.mp3', 11)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (81, NULL, N'https://xn--v-nwm.vn/wp-content/uploads/2020/04/1587616863_372_Lam-the-nao-de-ve-mot-con-tau-Huong.png', N'http://socnhi.vcmedia.vn/users/916377/tau-hoa-8.png', N'https://png.pngtree.com/png-clipart/20190617/original/pngtree-hand-drawn-car-cartoon-car-beautiful-car-red-car-black-wheel-png-image_3832136.jpg', N'http://socnhi3.vcmedia.vn/users/636736/xedap12.png', N'C', NULL, N'phuongtien/xeoto.mp3', 11)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (82, NULL, N'http://socnhi.vcmedia.vn/users/916377/tau-hoa-8.png', N'http://socnhi3.vcmedia.vn/users/636736/xedap12.png', N'https://png.pngtree.com/element_our/20190530/ourlarge/pngtree-children-s-day-cartoon-plane-image_1245119.jpg', N'https://xn--v-nwm.vn/wp-content/uploads/2020/04/1587616863_372_Lam-the-nao-de-ve-mot-con-tau-Huong.png', N'A', NULL, N'phuongtien/tauhoa.mp3', 11)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (83, NULL, N'http://socnhi3.vcmedia.vn/users/636736/xedap12.png', N'https://png.pngtree.com/png-clipart/20190617/original/pngtree-hand-drawn-car-cartoon-car-beautiful-car-red-car-black-wheel-png-image_3832136.jpg', N'http://socnhi.vcmedia.vn/users/916377/tau-hoa-8.png', N'https://xn--v-nwm.vn/wp-content/uploads/2020/04/1587616863_372_Lam-the-nao-de-ve-mot-con-tau-Huong.png', N'D', NULL, N'phuongtien/tauthuy.mp3', 11)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (84, NULL, N'https://png.pngtree.com/element_our/20190530/ourlarge/pngtree-children-s-day-cartoon-plane-image_1245119.jpg', N'http://socnhi3.vcmedia.vn/users/636736/xedap12.png', N'https://i.pinimg.com/originals/f6/5d/3f/f65d3f678f041ffac20096826e948d11.jpg', N'http://socnhi.vcmedia.vn/users/916377/tau-hoa-8.png', N'A', NULL, N'phuongtien/maybay.mp3', 11)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (85, NULL, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/361/770/products/98353473-676877796433716-1981155627803607040-n.jpg?v=1589959879393', N'https://hongngochospital.vn/wp-content/uploads/2020/02/xoai-xanh.jpg', N'https://vinmec-prod.s3.amazonaws.com/images/20210714_030410_210578_di-ung-mit.max-1800x1800.jpg', N'https://bizweb.dktcdn.net/thumb/1024x1024/100/324/966/products/dua-xiem-xanh-lun-island-min.png?v=1625027412830', N'B', NULL, N'traicay/xoai.mp3', 12)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (86, NULL, N'https://bloganchoi.com/wp-content/uploads/2018/06/qua-nhan-01.jpg', N'https://vinmec-prod.s3.amazonaws.com/images/20210714_030410_210578_di-ung-mit.max-1800x1800.jpg', N'https://dacsancamvinh.net/wp-content/uploads/2015/06/cong-dung-qua-cam.jpg', N'https://bizweb.dktcdn.net/thumb/1024x1024/100/361/770/products/98353473-676877796433716-1981155627803607040-n.jpg?v=1589959879393', N'B', NULL, N'traicay/mit.mp3', 12)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (87, NULL, N'https://dacsancamvinh.net/wp-content/uploads/2015/06/cong-dung-qua-cam.jpg', N'https://bizweb.dktcdn.net/thumb/1024x1024/100/361/770/products/98353473-676877796433716-1981155627803607040-n.jpg?v=1589959879393', N'https://bloganchoi.com/wp-content/uploads/2018/06/qua-nhan-01.jpg', N'https://bizweb.dktcdn.net/thumb/1024x1024/100/324/966/products/dua-xiem-xanh-lun-island-min.png?v=1625027412830', N'A', NULL, N'traicay/cam.mp3', 12)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (88, NULL, N'https://hongngochospital.vn/wp-content/uploads/2020/02/xoai-xanh.jpg', N'https://bizweb.dktcdn.net/thumb/1024x1024/100/324/966/products/dua-xiem-xanh-lun-island-min.png?v=1625027412830', N'https://bloganchoi.com/wp-content/uploads/2018/06/qua-nhan-01.jpg', N'https://bizweb.dktcdn.net/thumb/1024x1024/100/361/770/products/98353473-676877796433716-1981155627803607040-n.jpg?v=1589959879393', N'D', NULL, N'traicay/chomchom.mp3', 12)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (89, NULL, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/361/770/products/98353473-676877796433716-1981155627803607040-n.jpg?v=1589959879393', N'https://vinmec-prod.s3.amazonaws.com/images/20210714_030410_210578_di-ung-mit.max-1800x1800.jpg', N'https://bloganchoi.com/wp-content/uploads/2018/06/qua-nhan-01.jpg', N'https://hongngochospital.vn/wp-content/uploads/2020/02/xoai-xanh.jpg', N'C', NULL, N'traicay/nhan.mp3', 12)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (90, NULL, N'https://bloganchoi.com/wp-content/uploads/2018/06/qua-nhan-01.jpg', N'https://hongngochospital.vn/wp-content/uploads/2020/02/xoai-xanh.jpg', N'https://bizweb.dktcdn.net/thumb/1024x1024/100/361/770/products/98353473-676877796433716-1981155627803607040-n.jpg?v=1589959879393', N'https://bizweb.dktcdn.net/thumb/1024x1024/100/324/966/products/dua-xiem-xanh-lun-island-min.png?v=1625027412830', N'D', NULL, N'traicay/dua.mp3', 12)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (91, NULL, N'https://icdn.dantri.com.vn/l7FOwOOAx7wHCOfxvVgs/Image/2013/09/2-88641.jpg', N'https://sport5.mediacdn.vn/thumb_w/600/2018/11/20/hinh-2-15427192322571860432524-crop-1542720273191184941436.jpg', N'https://png.pngtree.com/png-clipart/20190706/original/pngtree-rice-peasant-character-png-element-png-image_4375467.jpg', N'https://t.vietgiaitri.com/2018/10/1/chi-co-bac-si-moi-giup-duoc-e93.jpg', N'D', NULL, N'nghenghiep/bacsi.mp3', 13)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (92, NULL, N'https://i.vdoc.vn/data/image/2021/04/23/ta-co-lao-cong-mau-1.jpg', N'https://png.pngtree.com/png-clipart/20190706/original/pngtree-rice-peasant-character-png-element-png-image_4375467.jpg', N'https://icdn.dantri.com.vn/l7FOwOOAx7wHCOfxvVgs/Image/2013/09/2-88641.jpg', N'https://sport5.mediacdn.vn/thumb_w/600/2018/11/20/hinh-2-15427192322571860432524-crop-1542720273191184941436.jpg', N'C', NULL, N'nghenghiep/congan.mp3', 13)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (93, NULL, N'https://png.pngtree.com/png-clipart/20190706/original/pngtree-rice-peasant-character-png-element-png-image_4375467.jpg', N'https://icdn.dantri.com.vn/l7FOwOOAx7wHCOfxvVgs/Image/2013/09/2-88641.jpg', N'https://t.vietgiaitri.com/2018/10/1/chi-co-bac-si-moi-giup-duoc-e93.jpg', N'https://sport5.mediacdn.vn/thumb_w/600/2018/11/20/hinh-2-15427192322571860432524-crop-1542720273191184941436.jpg', N'D', NULL, N'nghenghiep/thaygiao.mp3', 13)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (94, NULL, N'https://icdn.dantri.com.vn/l7FOwOOAx7wHCOfxvVgs/Image/2013/09/2-88641.jpg', N'https://png.pngtree.com/png-clipart/20190706/original/pngtree-rice-peasant-character-png-element-png-image_4375467.jpg', N'https://sport5.mediacdn.vn/thumb_w/600/2018/11/20/hinh-2-15427192322571860432524-crop-1542720273191184941436.jpg', N'https://i.vdoc.vn/data/image/2021/04/23/ta-co-lao-cong-mau-1.jpg', N'D', NULL, N'nghenghiep/colaocong.mp3', 13)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (95, NULL, N'https://png.pngtree.com/png-clipart/20190706/original/pngtree-rice-peasant-character-png-element-png-image_4375467.jpg', N'https://sport5.mediacdn.vn/thumb_w/600/2018/11/20/hinh-2-15427192322571860432524-crop-1542720273191184941436.jpg', N'https://i.vdoc.vn/data/image/2021/04/23/ta-co-lao-cong-mau-1.jpg', N'https://icdn.dantri.com.vn/l7FOwOOAx7wHCOfxvVgs/Image/2013/09/2-88641.jpg', N'A', NULL, N'nghenghiep/bacnongdan.mp3', 13)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (96, NULL, N'/assets/images/demdovat/2.jpg', N'/assets/images/demdovat/1.jpg', N'/assets/images/demdovat/3.jpg', N'/assets/images/demdovat/4.jpg', N'B', NULL, N'demdovat/1.mp3', 14)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (97, NULL, N'/assets/images/demdovat/2.jpg', N'/assets/images/demdovat/7.jpg', N'NULL/assets/images/demdovat/4.jpg', N'/assets/images/demdovat/8.jpg', N'A', NULL, N'demdovat/2.mp3', 14)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (98, NULL, N'/assets/images/demdovat/4.jpg', N'/assets/images/demdovat/2.jpg', N'/assets/images/demdovat/3.jpg', N'/assets/images/demdovat/1.jpg', N'C', NULL, N'demdovat/3.mp3', 14)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (99, NULL, N'/assets/images/demdovat/5.jpg', N'/assets/images/demdovat/2.jpg', N'/assets/images/demdovat/3.jpg', N'/assets/images/demdovat/4.jpg', N'D', NULL, N'demdovat/4.mp3', 14)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (101, NULL, N'/assets/images/demdovat/7.jpg', N'/assets/images/demdovat/6.jpg', N'/assets/images/demdovat/4.jpg', N'/assets/images/demdovat/5.jpg', N'D', NULL, N'demdovat/5.mp3', 14)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (102, NULL, N'/assets/images/demdovat/5.jpg', N'/assets/images/demdovat/6.jpg', N'/assets/images/demdovat/7.jpg', N'/assets/images/demdovat/8.jpg', N'B', NULL, N'demdovat/6.mp3', 14)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (103, NULL, N'/assets/images/demdovat/7.jpg', N'/assets/images/demdovat/6.jpg', N'/assets/images/demdovat/8.jpg', N'/assets/images/demdovat/9.jpg', N'A', NULL, N'demdovat/7.mp3', 14)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (104, NULL, N'/assets/images/demdovat/10.jpg', N'/assets/images/demdovat/9.jpg', N'/assets/images/demdovat/8.jpg', N'/assets/images/demdovat/7.jpg', N'C', NULL, N'demdovat/8.mp3', 14)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (105, NULL, N'/assets/images/demdovat/8.jpg', N'/assets/images/demdovat/9.jpg', N'/assets/images/demdovat/10.jpg', N'/assets/images/demdovat/7.jpg', N'B', NULL, N'demdovat/9.mp3', 14)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (106, NULL, N'/assets/images/demdovat/7.jpg', N'/assets/images/demdovat/9.jpg', N'/assets/images/demdovat/8.jpg', N'/assets/images/demdovat/10.jpg', N'D', NULL, N'demdovat/10.mp3', 14)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (107, NULL, N'https://24hthongtin.com/img_data/images/tim-hieu-ve-mat-trang-nguoi-ban-dong-hanh-cua-trai-dat.jpg', N'https://hauvuong.mobi/ngoi-sao-la-gi/imager_3844.jpg', N'https://kenh14cdn.com/thumb_w/660/2018/8/2/3828757811363316665194108445855606203482112n-15332036550891407670224.jpg', N'https://s.meta.com.vn/img/thumb.ashx/Data/image/2021/08/23/cau-vong-1.jpg', N'C', NULL, N'thoitiet/may.mp3', 16)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (108, NULL, N'https://hauvuong.mobi/ngoi-sao-la-gi/imager_3844.jpg', N'https://s.meta.com.vn/img/thumb.ashx/Data/image/2021/08/23/cau-vong-1.jpg', N'https://kenh14cdn.com/thumb_w/660/2018/8/2/3828757811363316665194108445855606203482112n-15332036550891407670224.jpg', N'https://image.thanhnien.vn/w660/Uploaded/2022/bozngu/2021_09_07/mua_giong_2_boka.jpg', N'D', NULL, N'thoitiet/mua.mp3', 16)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (109, NULL, N'https://24hthongtin.com/img_data/images/tim-hieu-ve-mat-trang-nguoi-ban-dong-hanh-cua-trai-dat.jpg', N'https://e7.pngegg.com/pngimages/3/446/png-clipart-cartoon-chibi-sun-leaf-text.png', N'https://hauvuong.mobi/ngoi-sao-la-gi/imager_3844.jpg', N'https://s.meta.com.vn/img/thumb.ashx/Data/image/2021/08/23/cau-vong-1.jpg', N'A', NULL, N'thoitiet/mattrang.mp3', 16)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (110, NULL, N'https://image.thanhnien.vn/w660/Uploaded/2022/bozngu/2021_09_07/mua_giong_2_boka.jpg', N'https://24hthongtin.com/img_data/images/tim-hieu-ve-mat-trang-nguoi-ban-dong-hanh-cua-trai-dat.jpg', N'https://s.meta.com.vn/img/thumb.ashx/Data/image/2021/08/23/cau-vong-1.jpg', N'https://e7.pngegg.com/pngimages/3/446/png-clipart-cartoon-chibi-sun-leaf-text.png', N'D', NULL, N'thoitiet/mattroi.mp3', 16)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (111, NULL, N'https://e7.pngegg.com/pngimages/3/446/png-clipart-cartoon-chibi-sun-leaf-text.png', N'https://hauvuong.mobi/ngoi-sao-la-gi/imager_3844.jpg', N'https://24hthongtin.com/img_data/images/tim-hieu-ve-mat-trang-nguoi-ban-dong-hanh-cua-trai-dat.jpg', N'https://image.thanhnien.vn/w660/Uploaded/2022/bozngu/2021_09_07/mua_giong_2_boka.jpg', N'B', NULL, N'thoitiet/sao.mp3', 16)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (112, NULL, N'https://e7.pngegg.com/pngimages/3/446/png-clipart-cartoon-chibi-sun-leaf-text.png', N'https://s.meta.com.vn/img/thumb.ashx/Data/image/2021/08/23/cau-vong-1.jpg', N'https://image.thanhnien.vn/w660/Uploaded/2022/bozngu/2021_09_07/mua_giong_2_boka.jpg', N'https://kenh14cdn.com/thumb_w/660/2018/8/2/3828757811363316665194108445855606203482112n-15332036550891407670224.jpg', N'B', NULL, N'thoitiet/cauvong.mp3', 16)
INSERT [dbo].[Question] ([questionID], [question], [answerA], [answerB], [answerC], [answerD], [correctAnswer], [image], [audio], [quizID]) VALUES (113, NULL, NULL, NULL, NULL, NULL, N'C', NULL, N'hinhhoc/hinhtron.mp3', 17)
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Quiz] ON 

INSERT [dbo].[Quiz] ([quizID], [name], [catelogy], [image], [numberQuestion]) VALUES (1, N'Toán 1 sơ cấp', N'toan1', N'https://teky.edu.vn/blog/wp-content/uploads/2020/12/tai-sao-phai-hoc-toan.jpg', 2)
INSERT [dbo].[Quiz] ([quizID], [name], [catelogy], [image], [numberQuestion]) VALUES (2, N'Màu sắc', N'quizbaby', N'https://vn.maminews.com/img/articles/2018/10/mau-sac-Primary-Colors.jpg', 8)
INSERT [dbo].[Quiz] ([quizID], [name], [catelogy], [image], [numberQuestion]) VALUES (3, N'Động vật (English)', N'quizenglish', N'https://cdn.zenquiz.net/external/2017/01/08/12/1b310270-d59c-11e6-971a-050901070303-compressed.jpg', 5)
INSERT [dbo].[Quiz] ([quizID], [name], [catelogy], [image], [numberQuestion]) VALUES (8, N'Động vật', N'quizbaby', N'http://vnnews24h.net/img_data/images/day-cho-con-lam-quen-khi-ve-nha-moi.jpg', 10)
INSERT [dbo].[Quiz] ([quizID], [name], [catelogy], [image], [numberQuestion]) VALUES (9, N'Chữ cái', N'quizbaby', N'https://ejoy-english.com/blog/wp-content/uploads/2018/05/alphabet1.jpg', 29)
INSERT [dbo].[Quiz] ([quizID], [name], [catelogy], [image], [numberQuestion]) VALUES (10, N'Chữ số', N'quizbaby', N'https://api.hanyny.com/uploads/thumbnail/1516800839779-giao-an-mam-non-de-tai-dem-den-7-nhan-biet-chu-so-7.png', 10)
INSERT [dbo].[Quiz] ([quizID], [name], [catelogy], [image], [numberQuestion]) VALUES (11, N'Phương tiện', N'quizbaby', N'https://png.pngtree.com/element_our/20190530/ourlarge/pngtree-children-s-day-cartoon-plane-image_1245119.jpg', 6)
INSERT [dbo].[Quiz] ([quizID], [name], [catelogy], [image], [numberQuestion]) VALUES (12, N'Trái cây', N'quizbaby', N'https://hoaquafuji.com/storage/app/media/mot-qua-cam-bao-nhieu-calo-0-5.jpg', 6)
INSERT [dbo].[Quiz] ([quizID], [name], [catelogy], [image], [numberQuestion]) VALUES (13, N'Nghề nghiệp', N'quizbaby', N'https://icdn.dantri.com.vn/l7FOwOOAx7wHCOfxvVgs/Image/2013/09/2-88641.jpg', 5)
INSERT [dbo].[Quiz] ([quizID], [name], [catelogy], [image], [numberQuestion]) VALUES (14, N'Đếm đồ vật', N'quizbaby', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSujEWf-U6MQXZ81GE_rLlRUhRpMCeNyhLJQA&usqp=CAU', 10)
INSERT [dbo].[Quiz] ([quizID], [name], [catelogy], [image], [numberQuestion]) VALUES (16, N'Thời tiết', N'quizbaby', N'https://phunugioi.com/wp-content/uploads/2020/10/tranh-to-mau-ong-mat-troi-va-dam-may-dep-ngo-nghinh-nhat.jpg', 6)
INSERT [dbo].[Quiz] ([quizID], [name], [catelogy], [image], [numberQuestion]) VALUES (17, N'Hình học', N'quizbaby', N'https://giasuducminh.com/data/media/1590/files/ve-hinh-hoc-khong-gian-nhu-nao.jpg', 1)
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
