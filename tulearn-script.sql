USE TuLearn
GO
/****** Object:  Database [TuLearn]    Script Date: 9/4/2020 10:03:29 PM ******/
CREATE DATABASE [TuLearn]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TuLearn', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TuLearn.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TuLearn_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TuLearn_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TuLearn] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TuLearn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TuLearn] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TuLearn] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TuLearn] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TuLearn] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TuLearn] SET ARITHABORT OFF 
GO
ALTER DATABASE [TuLearn] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TuLearn] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TuLearn] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TuLearn] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TuLearn] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TuLearn] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TuLearn] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TuLearn] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TuLearn] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TuLearn] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TuLearn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TuLearn] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TuLearn] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TuLearn] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TuLearn] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TuLearn] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TuLearn] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TuLearn] SET RECOVERY FULL 
GO
ALTER DATABASE [TuLearn] SET  MULTI_USER 
GO
ALTER DATABASE [TuLearn] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TuLearn] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TuLearn] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TuLearn] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TuLearn] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TuLearn', N'ON'
GO
USE [TuLearn]
GO
/****** Object:  Table [dbo].[CertificateTB]    Script Date: 9/4/2020 10:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CertificateTB](
	[tutorID] [int] NOT NULL,
	[certificateURL] [nvarchar](100) NULL,
	[certificateName] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CommuneOrWard]    Script Date: 9/4/2020 10:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommuneOrWard](
	[communeID] [int] IDENTITY(1,1) NOT NULL,
	[districtID] [int] NOT NULL,
	[communeName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[communeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[District]    Script Date: 9/4/2020 10:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[districtID] [int] IDENTITY(1,1) NOT NULL,
	[provinceID] [int] NOT NULL,
	[districtName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[districtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 9/4/2020 10:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[tutorID] [int] NOT NULL,
	[postID] [int] NOT NULL,
	[dateTimeFB] [date] NULL,
	[gradeFB] [float] NOT NULL,
	[contentFB] [nvarchar](200) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gender]    Script Date: 9/4/2020 10:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gender](
	[genderID] [int] IDENTITY(1,1) NOT NULL,
	[genderType] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[genderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Post]    Script Date: 9/4/2020 10:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[postID] [int] IDENTITY(1,1) NOT NULL,
	[learnerID] [int] NOT NULL,
	[subjectID] [int] NULL,
	[communeID] [int] NULL,
	[genderID] [int] NULL,
	[qualificationID] [int] NULL,
	[statusID] [int] NOT NULL,
	[typePost] [bit] NOT NULL,
	[lessonLearn] [int] NULL,
	[timeLearn] [float] NULL,
	[fee] [nvarchar](20) NULL,
	[startDay] [date] NULL,
	[postDes] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[postID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProvinceOrCity]    Script Date: 9/4/2020 10:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProvinceOrCity](
	[provinceID] [int] IDENTITY(1,1) NOT NULL,
	[provinceName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[provinceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Qualification]    Script Date: 9/4/2020 10:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Qualification](
	[qualificationID] [int] IDENTITY(1,1) NOT NULL,
	[qualificationName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[qualificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Report]    Script Date: 9/4/2020 10:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[tutorID] [int] NOT NULL,
	[postID] [int] NOT NULL,
	[dateTimeRP] [date] NULL,
	[contentRP] [nvarchar](200) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Request]    Script Date: 9/4/2020 10:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[tutorID] [int] NOT NULL,
	[postID] [int] NOT NULL,
	[typeRequest] [bit] NOT NULL,
	[statusID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleTB]    Script Date: 9/4/2020 10:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleTB](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ScheduleLearner]    Script Date: 9/4/2020 10:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleLearner](
	[postID] [int] NOT NULL,
	[dayWeek] [int] NOT NULL,
	[startTime] [time](7) NOT NULL,
	[endTime] [time](7) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ScheduleTutor]    Script Date: 9/4/2020 10:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleTutor](
	[tutorID] [int] NOT NULL,
	[dayWeek] [int] NULL,
	[startTime] [time](7) NULL,
	[endTime] [time](7) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StatusTB]    Script Date: 9/4/2020 10:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusTB](
	[statusID] [int] IDENTITY(1,1) NOT NULL,
	[statusName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubjectTB]    Script Date: 9/4/2020 10:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectTB](
	[subjectID] [int] IDENTITY(1,1) NOT NULL,
	[subjectName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[subjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubjectTutor]    Script Date: 9/4/2020 10:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectTutor](
	[tutorID] [int] IDENTITY(1,1) NOT NULL,
	[subjectID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserTB]    Script Date: 9/4/2020 10:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserTB](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[roleID] [int] NOT NULL,
	[statusID] [int] NOT NULL,
	[genderID] [int] NULL,
	[qualificationID] [int] NULL,
	[communeID] [int] NULL,
	[email] [varchar](50) NOT NULL,
	[userPass] [varchar](50) NOT NULL,
	[streetName] [nvarchar](100) NULL,
	[userName] [nvarchar](50) NULL,
	[avatar] [nvarchar](100) NULL,
	[phone] [varchar](10) NULL,
	[salary] [nvarchar](20) NULL,
	[workAt] [nvarchar](50) NULL,
	[identityCard] [varchar](10) NULL,
	[studentCard] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CertificateTB] ([tutorID], [certificateURL], [certificateName]) VALUES (2, NULL, N'Bằng Sư phạm Đại Học Quy Nhơn')
INSERT [dbo].[CertificateTB] ([tutorID], [certificateURL], [certificateName]) VALUES (2, NULL, N'Bằng cao học Sư phạm Đại Học Quy Nhơn')
SET IDENTITY_INSERT [dbo].[CommuneOrWard] ON 

INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (1, 1, N'Phường Lê Hồng Phong')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (2, 1, N'Phường Trần Phú')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (3, 1, N'Phường Quảng Phú')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (4, 1, N'Phường Nghĩa Chánh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (5, 1, N'Phường Trần Hưng Đạo')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (6, 1, N'Phường Nguyễn Nghiêm')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (7, 1, N'Phường Nghĩa Lộ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (8, 1, N'Phường Chánh Lộ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (9, 1, N'Phường Trương Quang Trọng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (10, 1, N'Xã Nghĩa Dũng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (11, 1, N'Xã Nghĩa Dõng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (12, 1, N'Xã Tịnh Hòa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (13, 1, N'Xã Tịnh Kỳ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (14, 1, N'Xã Tịnh Thiện')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (15, 1, N'Xã Tịnh Ấn Đông')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (16, 1, N'Xã Tịnh Khê')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (17, 1, N'Xã Tịnh Long')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (18, 1, N'Xã Tịnh Ấn Tây')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (19, 1, N'Xã Tịnh An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (20, 1, N'Xã Nghĩa Phú')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (21, 1, N'Xã Nghĩa Hà')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (22, 1, N'Xã Nghĩa An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (23, 1, N'Xã Tịnh Châu')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (24, 2, N'Thị Trấn Châu Ổ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (25, 2, N'Xã Bình Thuận')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (26, 2, N'Xã Bình Thạnh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (27, 2, N'Xã Bình Đông')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (28, 2, N'Xã Bình Chánh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (29, 2, N'Xã Bình Nguyên')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (30, 2, N'Xã Bình Khương')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (31, 2, N'Xã Bình Trị')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (32, 2, N'Xã Bình An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (33, 2, N'Xã Bình Hải')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (34, 2, N'Xã Bình Dương')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (35, 2, N'Xã Bình Phước')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (36, 2, N'Xã Bình Hòa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (37, 2, N'Xã Bình Trung')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (38, 2, N'Xã Bình Minh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (39, 2, N'Xã Bình Long')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (40, 2, N'Xã Bình Thanh ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (41, 2, N'Xã Bình Chương')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (42, 2, N'Xã Bình Hiệp')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (43, 2, N'Xã Bình Mỹ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (44, 2, N'Xã Bình Tân Phú')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (45, 2, N'Xã Bình Châu')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (46, 3, N'Thị trấn Trà Xuân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (47, 3, N'Xã Trà Giang')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (48, 3, N'Xã Trà Thủy')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (49, 3, N'Xã Trà Hiệp')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (50, 3, N'Xã Trà Bình')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (51, 3, N'Xã Trà Phú')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (52, 3, N'Xã Trà Lâm')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (53, 3, N'Xã Trà Tân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (54, 3, N'Xã Trà Sơn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (55, 3, N'Xã Trà Bùi')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (56, 3, N'Xã Trà Thanh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (57, 3, N'Xã Sơn Trà')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (58, 3, N'Xã Trà Phong')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (59, 3, N'Xã Trà Xinh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (60, 3, N'Xã Hương Trà')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (61, 3, N'Xã Trà Tây')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (62, 4, N'Xã Tịnh Thọ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (63, 4, N'Xã Tịnh Trà')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (64, 4, N'Xã Tịnh Phong')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (65, 4, N'Xã Tịnh Hiệp')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (66, 4, N'Xã Tịnh Bình')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (67, 4, N'Xã Tịnh Đông')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (68, 4, N'Xã Tịnh Sơn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (69, 4, N'Xã Tịnh Hà')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (70, 4, N'Xã Tịnh Giang')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (71, 4, N'Xã Tịnh Minh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (72, 4, N'Xã Tịnh Bắc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (73, 5, N'Thị trấn La Hà')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (74, 5, N'Thị trấn Sông Vệ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (75, 5, N'Xã Nghĩa Lâm')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (76, 5, N'Xã Nghĩa Thắng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (77, 5, N'Xã Nghĩa Thuận')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (78, 5, N'Xã Nghĩa Kỳ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (79, 5, N'Xã Nghĩa Sơn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (80, 5, N'Xã Nghĩa Điền')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (81, 5, N'Xã Nghĩa Thương')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (82, 5, N'Xã Nghĩa Trung')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (83, 5, N'Xã Nghĩa Hiệp')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (84, 5, N'Xã Nghĩa Phương')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (85, 5, N'Xã Nghĩa Mỹ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (86, 5, N'Xã Nghĩa Hòa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (87, 6, N'Thị trấn Di Lăng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (88, 6, N'Xã Sơn Hạ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (89, 6, N'Xã Sơn Thành')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (90, 6, N'Xã Sơn Nham')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (91, 6, N'Xã Sơn Bao')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (92, 6, N'Xã Sơn Linh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (93, 6, N'Xã Sơn Giang')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (94, 6, N'Xã Sơn Trung')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (95, 6, N'Xã Sơn Thượng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (96, 6, N'Xã Sơn Cao')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (97, 6, N'Xã Sơn Hải')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (98, 6, N'Xã Sơn Thủy')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (99, 6, N'Xã Sơn Kỳ')
GO
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (100, 6, N'Xã Sơn Ba')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (101, 7, N'Xã Sơn Bua')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (102, 7, N'Xã Sơn Mùa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (103, 7, N'Xã Sơn Liên')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (104, 7, N'Xã Sơn Tân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (105, 7, N'Xã Sơn Màu')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (106, 7, N'Xã Sơn Dung')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (107, 7, N'Xã Sơn Long')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (108, 7, N'Xã Sơn Tinh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (109, 7, N'Xã Sơn Lập')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (110, 8, N'Xã Sơn Lập')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (111, 8, N'Xã Long Sơn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (112, 8, N'Xã Long Mai')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (113, 8, N'Xã Thanh An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (114, 8, N'Xã Long Môn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (115, 8, N'Xã Long Hiệp')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (116, 9, N'Thị trấn Chợ Chùa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (117, 9, N'Xã Hành Thuận')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (118, 9, N'Xã Hành Dũng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (119, 9, N'Xã Hành Trung')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (120, 9, N'Xã Hành Nhân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (121, 9, N'Xã Hành Đức')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (122, 9, N'Xã Hành Minh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (123, 9, N'Xã Hành Phước')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (124, 9, N'Xã Hành Thiện')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (125, 9, N'Xã Hành Thịnh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (126, 9, N'Xã Hành Tín Tây')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (127, 9, N'Xã Hành Tín  Đông')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (128, 10, N'Thị trấn Mộ Đức')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (129, 10, N'Xã Đức Lợi')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (130, 10, N'Xã Đức Thắng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (131, 10, N'Xã Đức Nhuận')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (132, 10, N'Xã Đức Chánh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (133, 10, N'Xã Đức Hiệp')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (134, 10, N'Xã Đức Minh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (135, 10, N'Xã Đức Thạnh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (136, 10, N'Xã Đức Hòa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (137, 10, N'Xã Đức Tân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (138, 10, N'Xã Đức Phú')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (139, 10, N'Xã Đức Phong')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (140, 10, N'Xã Đức Lân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (141, 11, N'Phường Nguyễn Nghiêm')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (142, 11, N'Xã Phổ An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (143, 11, N'Xã Phổ Phong')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (144, 11, N'Xã Phổ Thuận')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (145, 11, N'Phường Phổ Văn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (146, 11, N'Phường Phổ Quang')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (147, 11, N'Xã Phổ Nhơn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (148, 11, N'Phường Phổ Ninh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (149, 11, N'Phường Phổ Minh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (150, 11, N'Phường Phổ Vinh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (151, 11, N'Phường Phổ Hòa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (152, 11, N'Xã Phổ Cường')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (153, 11, N'Xã Phổ Khánh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (154, 11, N'Phường Phổ Thạnh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (155, 11, N'Xã Phổ Châu')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (156, 12, N'Thị trấn Ba Tơ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (157, 12, N'Xã Ba Điền')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (158, 12, N'Xã Ba Vinh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (159, 12, N'Xã Ba Thành')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (160, 12, N'Xã Ba Động')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (161, 12, N'Xã Ba Dinh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (162, 12, N'Xã Ba Liên')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (163, 12, N'Xã Ba Giang')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (164, 12, N'Xã Ba Ngạc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (165, 12, N'Xã Ba Khâm')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (166, 12, N'Xã Ba Cung')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (167, 12, N'Xã Ba Tiêu')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (168, 12, N'Xã Ba Trang')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (169, 12, N'Xã Ba Tô')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (170, 12, N'Xã Ba Bích')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (171, 12, N'Xã Ba Vì')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (172, 12, N'Xã Ba Lế')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (173, 12, N'Xã Ba Nam')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (174, 12, N'Xã Ba Xa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (175, 13, N'')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (176, 14, N'Phường Tân Thạnh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (177, 14, N'Phường Phước Hòa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (178, 14, N'Phường An Mỹ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (179, 14, N'Phường Hòa Hương')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (180, 14, N'Phường An Xuân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (181, 14, N'Phường An Sơn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (182, 14, N'Phường Trường Xuân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (183, 14, N'Phường An Phú')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (184, 14, N'Xã Tam Thanh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (185, 14, N'Xã Tam Thăng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (186, 14, N'Xã Tam Phú')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (187, 14, N'Phường Hoà Thuận')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (188, 14, N'Xã Tam Ngọc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (189, 15, N'Phường Minh An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (190, 15, N'Phường Tân An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (191, 15, N'Phường Cẩm Phô')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (192, 15, N'Phường Thanh Hà')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (193, 15, N'Phường Sơn Phong')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (194, 15, N'Phường Cẩm Châu')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (195, 15, N'Phường Cửa Đại')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (196, 15, N'Phường Cẩm An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (197, 15, N'Xã Cẩm Hà')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (198, 15, N'Xã Cẩm Kim')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (199, 15, N'Phường Cẩm Nam')
GO
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (200, 15, N'Xã Cẩm Thanh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (201, 15, N'Xã Tân Hiệp')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (202, 16, N'Xã Ch''ơm')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (203, 16, N'Xã Ga Ri')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (204, 16, N'Xã A Xan')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (205, 16, N'Xã Tr''Hy')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (206, 16, N'Xã Lăng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (207, 16, N'Xã A Nông')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (208, 16, N'Xã A Tiêng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (209, 16, N'Xã Bha Lê')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (210, 16, N'Xã A Vương')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (211, 16, N'Xã Dang')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (212, 17, N'Thị trấn P Rao')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (213, 17, N'Xã Tà Lu')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (214, 17, N'Xã Sông Kôn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (215, 17, N'Xã Jơ Ngây')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (216, 17, N'Xã A Ting')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (217, 17, N'Xã  Tư')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (218, 17, N'Xã Ba')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (219, 17, N'Xã A Rooi')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (220, 17, N'Xã Za Hung')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (221, 17, N'Xã Mà Cooi')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (222, 17, N'Xã Ka Dăng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (223, 18, N'Thị Trấn Ái Nghĩa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (224, 18, N'Xã Đại Sơn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (225, 18, N'Xã Đại Lãnh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (226, 18, N'Xã Đại Hưng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (227, 18, N'Xã Đại Hồng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (228, 18, N'Xã Đại Đồng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (229, 18, N'Xã Đại Quang')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (230, 18, N'Xã Đại Nghĩa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (231, 18, N'Xã Đại Hiệp')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (232, 18, N'Xã Đại Thạnh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (233, 18, N'Xã Đại Chánh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (234, 18, N'Xã Đại Tân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (235, 18, N'Xã Đại Phong')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (236, 18, N'Xã Đại Minh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (237, 18, N'Xã Đại Thắng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (238, 18, N'Xã Đại Cường')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (239, 18, N'Xã Đại An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (240, 18, N'Xã Đại Hòa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (241, 19, N'Phường Vĩnh Điện')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (242, 19, N'Xã Điện Tiến')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (243, 19, N'Xã Điện Hòa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (244, 19, N'Xã Điện Thắng Bắc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (245, 19, N'Xã Điện Thắng Trung')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (246, 19, N'Xã Điện Thắng Nam')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (247, 19, N'Phường Điện Ngọc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (248, 19, N'Xã Điện Hồng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (249, 19, N'Xã Điện Thọ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (250, 19, N'Xã Điện Phước')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (251, 19, N'Phường Điện An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (252, 19, N'Phường Điện Nam Bắc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (253, 19, N'Phường Điện Nam Trung')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (254, 19, N'Phường Điện Nam Đông')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (255, 19, N'Phường Điện Dương')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (256, 19, N'Xã Điện Quang')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (257, 19, N'Xã Điện Trung')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (258, 19, N'Xã Điện Phong')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (259, 19, N'Xã Điện Minh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (260, 19, N'Xã Điện Phương')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (261, 20, N'Thị trấn Nam Phước')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (262, 20, N'Xã Duy Thu')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (263, 20, N'Xã Duy Phú')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (264, 20, N'Xã Duy Tân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (265, 20, N'Xã Duy Hòa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (266, 20, N'Xã Duy Châu')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (267, 20, N'Xã Duy Trinh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (268, 20, N'Xã Duy Sơn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (269, 20, N'Xã Duy Trung')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (270, 20, N'Xã Duy Phước')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (271, 20, N'Xã Duy Thành')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (272, 20, N'Xã Duy Vinh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (273, 20, N'Xã Duy Nghĩa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (274, 20, N'Xã Duy Hải')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (275, 21, N'Thị trấn Đông Phú')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (276, 21, N'Xã Quế Xuân 1')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (277, 21, N'Xã Quế Xuân 2')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (278, 21, N'Xã Quế Phú')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (279, 21, N'Thị trấn Hương An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (280, 21, N'Xã Quế Hiệp')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (281, 21, N'Xã Quế Thuận')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (282, 21, N'Xã Quế Mỹ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (283, 21, N'Xã Quế Long')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (284, 21, N'Xã Quế Châu')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (285, 21, N'Xã Quế Phong')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (286, 21, N'Xã Quế An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (287, 21, N'Xã Quế Minh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (288, 22, N'Thị trấn Thạnh Mỹ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (289, 22, N'Xã Laêê')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (290, 22, N'Xã Chơ Chun')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (291, 22, N'Xã Zuôich')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (292, 22, N'Xã Tà Pơơ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (293, 22, N'Xã La Dêê')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (294, 22, N'Xã Đắc Tôi')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (295, 22, N'Xã Chà Vàl')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (296, 22, N'Xã Tà Bhinh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (297, 22, N'Xã Cà Dy')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (298, 22, N'Xã Đắc Pre')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (299, 22, N'Xã Đắc Pring')
GO
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (300, 23, N'Thị trấn Khâm Đức')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (301, 23, N'Xã Phước Xuân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (302, 23, N'Xã Phước Hiệp')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (303, 23, N'Xã Phước Hoà')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (304, 23, N'Xã Phước Đức')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (305, 23, N'Xã Phước Năng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (306, 23, N'Xã Phước Mỹ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (307, 23, N'Xã Phước Chánh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (308, 23, N'Xã Phước Công')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (309, 23, N'Xã Phước Kim')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (310, 23, N'Xã Phước Lộc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (311, 23, N'Xã Phước Thành')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (312, 24, N'Xã Hiệp Hòa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (313, 24, N'Xã Hiệp Thuận')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (314, 24, N'Xã Quế Thọ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (315, 24, N'Xã Bình Lâm')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (316, 24, N'Xã Sông Trà')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (317, 24, N'Xã Phước Trà')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (318, 24, N'Xã Phước Gia')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (319, 24, N'Thị trấn Tân Bình')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (320, 24, N'Xã Quế Lưu')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (321, 24, N'Xã Thăng Phước')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (322, 24, N'Xã Bình Sơn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (323, 25, N'Thị trấn Hà Lam')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (324, 25, N'Xã Bình Dương')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (325, 25, N'Xã Bình Giang')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (326, 25, N'Xã Bình Nguyên')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (327, 25, N'Xã Bình Phục')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (328, 25, N'Xã Bình Triều')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (329, 25, N'Xã Bình Đào')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (330, 25, N'Xã Bình Minh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (331, 25, N'Xã Bình Lãnh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (332, 25, N'Xã Bình Trị')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (333, 25, N'Xã Bình Định Bắc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (334, 25, N'Xã Bình Định Nam')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (335, 25, N'Xã Bình Quý')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (336, 25, N'Xã Bình Phú')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (337, 25, N'Xã Bình Chánh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (338, 25, N'Xã Bình Tú')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (339, 25, N'Xã Bình Sa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (340, 25, N'Xã Bình Hải')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (341, 25, N'Xã Bình Quế')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (342, 25, N'Xã Bình An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (343, 25, N'Xã Bình Trung')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (344, 25, N'Xã Bình Nam')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (345, 26, N'Thị trấn Tiên Kỳ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (346, 26, N'Xã Tiên Sơn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (347, 26, N'Xã Tiên Hà')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (348, 26, N'Xã Tiên Cẩm')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (349, 26, N'Xã Tiên Châu')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (350, 26, N'Xã Tiên Lãnh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (351, 26, N'Xã Tiên Ngọc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (352, 26, N'Xã Tiên Hiệp')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (353, 26, N'Xã Tiên Cảnh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (354, 26, N'Xã Tiên Mỹ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (355, 26, N'Xã Tiên Phong')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (356, 26, N'Xã Tiên Thọ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (357, 26, N'Xã Tiên An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (358, 26, N'Xã Tiên Lộc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (359, 26, N'Xã Tiên Lập')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (360, 27, N'Thị trấn Trà My')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (361, 27, N'Xã Trà Sơn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (362, 27, N'Xã Trà Kót')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (363, 27, N'Xã Trà Nú')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (364, 27, N'Xã Trà Đông')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (365, 27, N'Xã Trà Dương')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (366, 27, N'Xã Trà Giang')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (367, 27, N'Xã Trà Bui')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (368, 27, N'Xã Trà Đốc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (369, 27, N'Xã Trà Tân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (370, 27, N'Xã Trà Giác')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (371, 27, N'Xã Trà Giáp')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (372, 27, N'Xã Trà Ka')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (373, 28, N'Xã Trà Leng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (374, 28, N'Xã Trà Dơn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (375, 28, N'Xã Trà Tập')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (376, 28, N'Xã Trà Mai')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (377, 28, N'Xã Trà Cang')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (378, 28, N'Xã Trà Linh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (379, 28, N'Xã Trà Nam')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (380, 28, N'Xã Trà Don')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (381, 28, N'Xã Trà Vân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (382, 28, N'Xã Trà Vinh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (383, 29, N'Thị trấn Núi Thành')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (384, 29, N'Xã Tam Xuân I')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (385, 29, N'Xã Tam Xuân II')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (386, 29, N'Xã Tam Tiến')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (387, 29, N'Xã Tam Sơn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (388, 29, N'Xã Tam Thạnh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (389, 29, N'Xã Tam Anh Bắc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (390, 29, N'Xã Tam Anh Nam')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (391, 29, N'Xã Tam Hòa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (392, 29, N'Xã Tam Hiệp')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (393, 29, N'Xã Tam Hải')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (394, 29, N'Xã Tam Giang')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (395, 29, N'Xã Tam Quang')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (396, 29, N'Xã Tam Nghĩa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (397, 29, N'Xã Tam Mỹ Tây')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (398, 29, N'Xã Tam Mỹ Đông')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (399, 29, N'Xã Tam Trà')
GO
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (400, 30, N'Thị trấn Phú Thịnh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (401, 30, N'Xã Tam Thành')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (402, 30, N'Xã Tam An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (403, 30, N'Xã Tam Đàn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (404, 30, N'Xã Tam Lộc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (405, 30, N'Xã Tam Phước')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (406, 30, N'Xã Tam Vinh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (407, 30, N'Xã Tam Thái')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (408, 30, N'Xã Tam Đại')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (409, 30, N'Xã Tam Dân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (410, 30, N'Xã Tam Lãnh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (411, 31, N'Xã Quế Trung')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (412, 31, N'Xã Ninh Phước')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (413, 31, N'Xã Phước Ninh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (414, 31, N'Xã Quế Lộc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (415, 31, N'Xã Sơn Viên')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (416, 31, N'Xã Quế Lâm')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (417, 32, N'Hòa Hiệp Bắc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (418, 32, N'Hòa Hiệp nam')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (419, 32, N'Hòa Khánh Bắc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (420, 32, N'Hòa Khánh Nam')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (421, 32, N'Hòa Minh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (422, 33, N'Tam Thuận')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (423, 33, N'Thanh Khê Tây')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (424, 33, N'Thanh Khê Đông')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (425, 33, N'Xuân Hà')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (426, 33, N'Tân Chính')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (427, 33, N'Chính Gián')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (428, 33, N'Vĩnh Trung')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (429, 33, N'Thạc Gián')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (430, 33, N'An Khê')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (431, 33, N'Hòa Khê')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (432, 34, N'Thanh Bình')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (433, 34, N'Thuận Phước')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (434, 34, N'Thạch Thang')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (435, 34, N'Hải Châu I')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (436, 34, N'Hải Châu II')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (437, 34, N'Phước Ninh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (438, 34, N'Hòa Thuận Tây')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (439, 34, N'Hòa Thuận Đông')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (440, 34, N'Nam Dương')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (441, 34, N'Bình Hiên')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (442, 34, N'Bình Thuận')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (443, 34, N'Hòa Cường Bắc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (444, 33, N'Hòa Cường Nam')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (445, 35, N'Thọ Quang')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (446, 35, N'Nại Hiên Đông')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (447, 35, N'Mân Thái')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (448, 35, N'An Hải Bắc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (449, 35, N'Phước Mỹ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (450, 35, N'An Hải Tây')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (451, 35, N'An Hải Đông')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (452, 36, N'Mỹ An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (453, 36, N'Khuê Mỹ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (454, 36, N'Hòa Quý')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (455, 36, N'Hòa Hải')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (456, 37, N'Khuê Trung')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (457, 37, N'Hòa Phát')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (458, 37, N'Hòa An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (459, 37, N'Hòa Thọ Tây')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (460, 37, N'Hòa Thọ Đông')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (461, 37, N'Hòa Xuân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (462, 38, N'Hòa Bắc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (463, 38, N'Hòa Liên')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (464, 38, N'Hòa Liên')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (465, 38, N'Hòa Ninh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (466, 38, N'Hòa Sơn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (467, 38, N'Hòa Nhơm')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (468, 38, N'Hòa Phú')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (469, 38, N'Hòa Phong')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (470, 38, N'Hòa Châu')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (471, 38, N'Hòa Tiến')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (472, 38, N'Hòa Phước')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (473, 38, N'Hòa Khương')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (474, 39, N' ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (475, 40, N'Tân Định')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (476, 40, N'Đa Kao')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (477, 40, N'Bến Nghé')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (478, 40, N'Bến Thành')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (479, 40, N'Nguyễn Thái Bình')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (480, 40, N'Phạm Ngũ Lão')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (481, 40, N'Cầu Ông Lãnh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (482, 40, N'Cô Giang')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (483, 40, N'Nguyễn Cư Trinh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (484, 40, N'Cầu Kho')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (485, 41, N'Thạnh Xuân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (486, 41, N'Thạnh Lộc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (487, 41, N'Hiệp Thành')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (488, 41, N'Thới An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (489, 41, N'Tân Chánh Hiệp')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (490, 41, N'An Phú Đông')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (491, 41, N'Tân Thới Hiệp')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (492, 41, N'Trung Mỹ Tây')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (493, 41, N'Tân Hưng Thuận')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (494, 41, N'Đông Hưng Thuận')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (495, 41, N'Tân Thới Nhất')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (496, 42, N'Linh Xuân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (497, 42, N'Bình Chiểu')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (498, 42, N'Linh Trung')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (499, 42, N'Tam Bình')
GO
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (500, 42, N'Tam Phú')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (501, 42, N'Hiệp Bình Phước')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (502, 42, N'Hiệp Bình Chánh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (503, 42, N'Linh Chiểu')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (504, 42, N'Linh Tây')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (505, 42, N'Linh Đông')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (506, 42, N'Bình Thọ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (507, 42, N'Trường Thọ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (508, 43, N'Long Bình')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (509, 43, N'Long Thạnh Mỹ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (510, 43, N'Tân Phú')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (511, 43, N'Hiệp Phú')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (512, 43, N'Tăng Nhơn Phú A')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (513, 43, N'Tăng Nhơn Phú B')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (514, 43, N'Phước Long B')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (515, 43, N'Phước Long A')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (516, 43, N'Trường Thạnh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (517, 43, N'Long Phước')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (518, 43, N'Long Trường')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (519, 43, N'Phước Bình')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (520, 43, N'Phú Hữu')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (521, 44, N'Phường 15')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (522, 44, N'Phường 13')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (523, 44, N'Phường 17')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (524, 44, N'Phường 6')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (525, 44, N'Phường 16')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (526, 44, N'Phường 12')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (527, 44, N'Phường 14')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (528, 44, N'Phường 10')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (529, 44, N'Phường 05')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (530, 44, N'Phường 07')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (531, 44, N'Phường 04')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (532, 44, N'Phường 01')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (533, 44, N'Phường 9')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (534, 44, N'Phường 8')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (535, 44, N'Phường 11')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (536, 44, N'Phường 03')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (537, 45, N'Phường 13')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (538, 45, N'Phường 11')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (539, 45, N'Phường 27')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (540, 45, N'Phường 26')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (541, 45, N'Phường 12')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (542, 45, N'Phường 25')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (543, 45, N'Phường 05')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (544, 45, N'Phường 07')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (545, 45, N'Phường 24')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (546, 45, N'Phường 06')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (547, 45, N'Phường 14')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (548, 45, N'Phường 15')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (549, 45, N'Phường 02')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (550, 45, N'Phường 01')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (551, 45, N'Phường 03')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (552, 45, N'Phường 17')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (553, 45, N'Phường 21')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (554, 45, N'Phường 22')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (555, 45, N'Phường 19')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (556, 45, N'Phường 28')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (557, 46, N'Phường 02')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (558, 46, N'Phường 04')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (559, 46, N'Phường 12')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (560, 46, N'Phường 13')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (561, 46, N'Phường 01')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (562, 46, N'Phường 03')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (563, 46, N'Phường 11')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (564, 46, N'Phường 07')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (565, 46, N'Phường 05')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (566, 46, N'Phường 10')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (567, 46, N'Phường 06')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (568, 46, N'Phường 08')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (569, 46, N'Phường 09')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (570, 46, N'Phường 14')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (571, 46, N'Phường 15')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (572, 47, N'Tân Sơn Nhi')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (573, 47, N'Tây Thạnh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (574, 47, N'Sơn Kỳ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (575, 47, N'Tân Quý')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (576, 47, N'Tân Thành')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (577, 47, N'Phú Thọ Hòa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (578, 47, N'Phú Thạnh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (579, 47, N'Phú Trung')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (580, 47, N'Hòa Thạnh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (581, 47, N'Hiệp Tân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (582, 47, N'Tân Thới Hòa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (583, 48, N'Phường 04')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (584, 48, N'Phường 05')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (585, 48, N'Phường 09')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (586, 48, N'Phường 07')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (587, 48, N'Phường 03')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (588, 48, N'Phường 01')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (589, 48, N'Phường 02')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (590, 48, N'Phường 08')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (591, 48, N'Phường 15')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (592, 48, N'Phường 10')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (593, 48, N'Phường 11')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (594, 48, N'Phường 17')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (595, 48, N'Phường 14')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (596, 48, N'Phường 12')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (597, 48, N'Phường 13')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (598, 49, N'Thảo Điền')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (599, 49, N'An Phú')
GO
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (600, 49, N'Bình An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (601, 49, N'Bình Trưng Đông')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (602, 49, N'Bình Trưng Tây')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (603, 49, N'Bình Khánh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (604, 49, N'An Khánh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (605, 49, N'Cát Lái')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (606, 49, N'Thạnh Mỹ Lợi')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (607, 49, N'An Lợi Đông')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (608, 49, N'Thủ Thiêm')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (609, 50, N'Phường 08')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (610, 50, N'Phường 07')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (611, 50, N'Phường 14')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (612, 50, N'Phường 12')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (613, 50, N'Phường 11')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (614, 50, N'Phường 13')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (615, 50, N'Phường 06')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (616, 50, N'Phường 09')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (617, 50, N'Phường 10')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (618, 50, N'Phường 04')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (619, 50, N'Phường 05')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (620, 50, N'Phường 03')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (621, 50, N'Phường 02')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (622, 50, N'Phường 01')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (623, 51, N'Phường 15')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (624, 51, N'Phường 13')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (625, 51, N'Phường 14')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (626, 51, N'Phường 12')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (627, 51, N'Phường 11')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (628, 51, N'Phường 10')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (629, 51, N'Phường 09')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (630, 51, N'Phường 01')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (631, 51, N'Phường 08')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (632, 51, N'Phường 02')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (633, 51, N'Phường 04')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (634, 51, N'Phường 07')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (635, 51, N'Phường 05')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (636, 51, N'Phường 06')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (637, 51, N'Phường 03')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (638, 52, N'Phường 15')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (639, 52, N'Phường 05')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (640, 52, N'Phường 14')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (641, 52, N'Phường 11')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (642, 52, N'Phường 03')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (643, 52, N'Phường 10')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (644, 52, N'Phường 13')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (645, 52, N'Phường 08')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (646, 52, N'Phường 09')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (647, 52, N'Phường 12')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (648, 52, N'Phường 07')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (649, 52, N'Phường 06')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (650, 52, N'Phường 04')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (651, 52, N'Phường 01')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (652, 52, N'Phường 02')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (653, 52, N'Phường 16')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (654, 53, N'Phường 12')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (655, 53, N'Phường 13')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (656, 53, N'Phường 09')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (657, 53, N'Phường 06')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (658, 53, N'Phường 08')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (659, 53, N'Phường 10')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (660, 53, N'Phường 05')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (661, 53, N'Phường 18')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (662, 53, N'Phường 14')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (663, 53, N'Phường 04')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (664, 53, N'Phường 03')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (665, 53, N'Phường 16')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (666, 53, N'Phường 02')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (667, 53, N'Phường 15')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (668, 53, N'Phường 01')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (669, 54, N'Phường 04')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (670, 54, N'Phường 09')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (671, 54, N'Phường 03')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (672, 54, N'Phường 12')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (673, 54, N'Phường 02')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (674, 54, N'Phường 08')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (675, 54, N'Phường 15')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (676, 54, N'Phường 07')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (677, 54, N'Phường 01')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (678, 54, N'Phường 11')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (679, 54, N'Phường 14')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (680, 54, N'Phường 05')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (681, 54, N'Phường 06')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (682, 54, N'Phường 10')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (683, 54, N'Phường 13')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (684, 55, N'Phường 14')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (685, 55, N'Phường 13')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (686, 55, N'Phường 09')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (687, 55, N'Phường 06')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (688, 55, N'Phường 12')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (689, 55, N'Phường 05')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (690, 55, N'Phường 11')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (691, 55, N'Phường 02')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (692, 55, N'Phường 01')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (693, 55, N'Phường 04')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (694, 55, N'Phường 08')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (695, 55, N'Phường 03')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (696, 55, N'Phường 07')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (697, 55, N'Phường 10')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (698, 56, N'Phường 08')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (699, 56, N'Phường 02')
GO
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (700, 56, N'Phường 01')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (701, 56, N'Phường 03')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (702, 56, N'Phường 11')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (703, 56, N'Phường 09')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (704, 56, N'Phường 10')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (705, 56, N'Phường 04')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (706, 56, N'Phường 13')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (707, 56, N'Phường 12')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (708, 56, N'Phường 05')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (709, 56, N'Phường 14')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (710, 56, N'Phường 06')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (711, 56, N'Phường 15')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (712, 56, N'Phường 16')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (713, 56, N'Phường 07')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (714, 57, N'Bình Hưng Hòa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (715, 57, N'Bình Hưng Hòa A')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (716, 57, N'Bình Hưng Hòa B')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (717, 57, N'Bình Trị Đông')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (718, 57, N'Bình Trị Đông A')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (719, 57, N'Bình Trị Đông B')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (720, 57, N'Tân Tạo')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (721, 57, N'Tân Tạo A')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (722, 57, N'An Lạc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (723, 57, N'An Lạc A')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (724, 58, N'Tân Thuận Đông')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (725, 58, N'Tân Thuận Tây')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (726, 58, N'Tân Kiểng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (727, 58, N'Tân Hưng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (728, 58, N'Bình Thuận')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (729, 58, N'Tân Quy')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (730, 58, N'Phú Thuận')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (731, 58, N'Tân Phú')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (732, 58, N'Tân Phong')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (733, 58, N'Phú Mỹ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (734, 59, N'Củ Chi')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (735, 59, N'Phú Mỹ Hưng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (736, 59, N'An Phú')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (737, 59, N'Trung Lập Thượng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (738, 59, N'An Nhơn Tây')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (739, 59, N'Nhuậ Đức')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (740, 59, N'Phạm Văn Cội')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (741, 59, N'Phú Hòa Đông')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (742, 59, N'Trung Lập Hạ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (743, 59, N'Trung An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (744, 59, N'Phước Thạnh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (745, 59, N'Phước Hiệp')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (746, 59, N'Tân An Hội')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (747, 59, N'Phước Vĩnh An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (748, 59, N'Thái Mỹ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (749, 59, N'Tân Thạnh Tây')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (750, 59, N'Hòa Phú')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (751, 59, N'Tân Thạnh Đông')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (752, 59, N'Bình Mỹ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (753, 59, N'Tân Phú Trung')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (754, 59, N'Tân Thông Hội')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (755, 60, N'Hóc Môn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (756, 60, N'Tân Hiệp')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (757, 60, N'Nhị Bình')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (758, 60, N'Đông Thạnh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (759, 60, N'Tân Thới Nhi')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (760, 60, N'Thới Tam Thôn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (761, 60, N'Xuân Thới Sơn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (762, 60, N'Tân Xuân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (763, 60, N'Xuân Thới Đông')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (764, 60, N'Trung Chánh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (765, 60, N'Xuân Thới Thượng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (766, 60, N'Bà Điểm')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (767, 61, N'Tân Túc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (768, 61, N'Phạm Văn Hai')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (769, 61, N'Vĩnh Lộc A')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (770, 61, N'Vĩnh Lộc B')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (771, 61, N'Bình Lợi')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (772, 61, N'Lê Minh Xuân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (773, 61, N'Tân Nhựt')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (774, 61, N'Tân Kiên')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (775, 61, N'Bình Hưng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (776, 61, N'Phong Phú')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (777, 61, N'An Phú Tây')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (778, 61, N'Hưng Long')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (779, 61, N'Đa Phước')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (780, 61, N'Tân Quý Tây')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (781, 61, N'Bình Chánh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (782, 61, N'Quy Đức')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (783, 62, N'Nhà Bè')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (784, 62, N'Phước Kiển')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (785, 62, N'Phước Lộc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (786, 62, N'Nhơn Đức')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (787, 62, N'Phú Xuân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (788, 62, N'Long Thới')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (789, 62, N'Hiệp Phước')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (790, 63, N'Cần Thạnh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (791, 63, N'Bình Khánh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (792, 63, N'Tam Thôn Hiệp')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (793, 63, N'An Thới Đông')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (794, 63, N'An Thạnh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (795, 63, N'Long Hòa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (796, 63, N'Lý Nhơn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (797, 64, N'Phường Phú Thuận')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (798, 64, N'Phường Phú Bình')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (799, 64, N'Phường Tây Lộc')
GO
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (800, 64, N'Phường Thuận Lộc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (801, 64, N'Phường Phú Hiệp')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (802, 64, N'Phường Phú Hậu')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (803, 64, N'Phường Thuận Hòa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (804, 64, N'Phường Thuận Thành')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (805, 64, N'Phường Phú Hòa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (806, 64, N'Phường Phú Cát')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (807, 64, N'Phường Vĩ Dạ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (808, 64, N'Phường Phường Đúc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (809, 64, N'Phường Vĩnh Ninh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (810, 64, N'Phường Phú Hội')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (811, 64, N'Phường Phú Nhuận')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (812, 64, N'Phường Xuân Phú')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (813, 64, N'Phường Trường An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (814, 64, N'Phường Phước Vĩnh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (815, 64, N'Phường An Cựu')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (816, 64, N'Phường An Hòa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (817, 64, N'Phường Hương Sơ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (818, 64, N'Phường Thuỷ Biều')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (819, 64, N'Phường Hương Long')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (820, 64, N'Phường Thuỷ Xuân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (821, 64, N'Phường An Đông')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (822, 64, N'Phường An Tây')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (823, 65, N'Thị trấn Phong Điền')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (824, 65, N'Xã Điền Hương')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (825, 65, N'Xã Điền Môn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (826, 65, N'Xã Điền Lộc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (827, 65, N'Xã Phong Bình')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (828, 65, N'Xã Điền Hòa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (829, 65, N'Xã Phong Chương')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (830, 65, N'Xã Phong Hải')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (831, 65, N'Xã Điền Hải')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (832, 65, N'Xã Phong Hòa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (833, 65, N'Xã Phong Thu')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (834, 65, N'Xã Phong Hiền')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (835, 65, N'Xã Phong Mỹ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (836, 65, N'Xã Phong An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (837, 65, N'Xã Phong Xuân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (838, 65, N'Xã Phong Sơn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (839, 66, N'Thị trấn Sịa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (840, 66, N'Xã Quảng Thái')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (841, 66, N'Xã Quảng Ngạn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (842, 66, N'Xã Quảng Lợi')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (843, 66, N'Xã Quảng Công')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (844, 66, N'Xã Quảng Phước')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (845, 66, N'Xã Quảng Vinh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (846, 66, N'Xã Quảng An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (847, 66, N'Xã Quảng Thành')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (848, 66, N'Xã Quảng Thọ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (849, 66, N'Xã Quảng Phú')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (850, 67, N'Thị trấn Thuận An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (851, 67, N'Xã Phú Thuận')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (852, 67, N'Xã Phú Dương')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (853, 67, N'Xã Phú Mậu')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (854, 67, N'Xã Phú An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (855, 67, N'Xã Phú Hải')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (856, 67, N'Xã Phú Xuân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (857, 67, N'Xã Phú Diên')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (858, 67, N'Xã Phú Thanh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (859, 67, N'Xã Phú Mỹ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (860, 67, N'Xã Phú Thượng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (861, 67, N'Xã Phú Hồ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (862, 67, N'Xã Vinh Xuân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (863, 67, N'Xã Phú Lương')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (864, 67, N'Thị trấn Phú Đa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (865, 67, N'Xã Vinh Thanh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (866, 67, N'Xã Vinh An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (867, 67, N'Xã Phú Gia')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (868, 67, N'Xã Vinh Hà')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (869, 68, N'Phường Phú Bài')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (870, 68, N'Xã Thủy Vân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (871, 68, N'Xã Thủy Thanh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (872, 68, N'Phường Thủy Dương')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (873, 68, N'Phường Thủy Phương')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (874, 68, N'Phường Thủy Châu')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (875, 68, N'Phường Thủy Lương')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (876, 68, N'Xã Thủy Bằng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (877, 68, N'Xã Thủy Tân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (878, 68, N'Xã Thủy Phù')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (879, 68, N'Xã Phú Sơn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (880, 68, N'Xã Dương Hòa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (881, 69, N'Phường Tứ Hạ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (882, 69, N'Xã Hải Dương')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (883, 69, N'Xã Hương Phong')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (884, 69, N'Xã Hương Toàn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (885, 69, N'Phường Hương Vân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (886, 69, N'Phường Hương Văn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (887, 69, N'Xã Hương Vinh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (888, 69, N'Phường Hương Xuân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (889, 69, N'Phường Hương Chữ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (890, 69, N'Phường Hương An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (891, 69, N'Xã Hương Bình')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (892, 69, N'Phường Hương Hồ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (893, 69, N'Xã Hương Thọ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (894, 69, N'Xã Bình Tiến')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (895, 69, N'Xã Bình Thành')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (896, 70, N'Thị trấn A Lưới')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (897, 70, N'Xã Hồng Vân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (898, 70, N'Xã Hồng Hạ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (899, 70, N'Xã Hồng Kim')
GO
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (900, 70, N'Xã Trung Sơn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (901, 70, N'Xã Hồng Bắc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (902, 70, N'Xã A Ngo')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (903, 70, N'Xã Sơn Thủy')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (904, 70, N'Xã Phú Vinh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (905, 70, N'Xã Hương Phong')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (906, 70, N'Xã Quảng Nhâm')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (907, 70, N'Xã Hồng Thượng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (908, 70, N'Xã Hồng Thái')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (909, 70, N'Xã A Roằng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (910, 70, N'Xã Đông Sơn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (911, 70, N'Xã Lâm Đớt')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (912, 70, N'Xã Hồng Thủy')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (913, 71, N'Xã Hương Lộc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (914, 71, N'Thị trấn Lăng Cô')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (915, 71, N'Xã Vinh Mỹ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (916, 71, N'Xã Vinh Hưng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (917, 71, N'Xã Giang Hải')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (918, 71, N'Xã Vinh Hiền')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (919, 71, N'Xã Lộc Bổn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (920, 71, N'Xã Lộc Sơn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (921, 71, N'Xã Lộc Bình')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (922, 71, N'Xã Lộc Vĩnh')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (923, 71, N'Xã Lộc An')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (924, 71, N'Xã Lộc Điền')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (925, 71, N'Xã Lộc Thủy')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (926, 71, N'Xã Lộc Trì')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (927, 71, N'Xã Lộc Tiến')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (928, 71, N'Xã Lộc Hòa')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (929, 71, N'Xã Xuân Lộc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (930, 72, N'Thị trấn Khe Tre')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (931, 72, N'Xã Hương Phú')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (932, 72, N'Xã Hương Sơn')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (933, 72, N'Xã Hương Lộc')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (934, 72, N'Xã Thượng Quảng')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (935, 72, N'Xã Hương Xuân')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (936, 72, N'Xã Hương Hữu')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (937, 72, N'Xã Thượng Lộ')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (938, 72, N'Xã Thượng Long')
INSERT [dbo].[CommuneOrWard] ([communeID], [districtID], [communeName]) VALUES (939, 72, N'Xã Thượng Nhật')
SET IDENTITY_INSERT [dbo].[CommuneOrWard] OFF
SET IDENTITY_INSERT [dbo].[District] ON 

INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (1, 1, N'Thành phố Quảng Ngãi')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (2, 1, N'Huyện Bình Sơn')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (3, 1, N'Huyện Trà Bồng')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (4, 1, N'Huyện Sơn Tịnh')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (5, 1, N'Huyện Tư Nghĩa')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (6, 1, N'Huyện Sơn Hà')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (7, 1, N'Huyện Sơn Tây')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (8, 1, N'Huyện Minh Long')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (9, 1, N'Huyện Nghĩa Hành')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (10, 1, N'Huyện Mộ Đức')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (11, 1, N'Huyện Đức Phổ')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (12, 1, N'Huyện Ba Tơ')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (13, 1, N'Huyện Lý Sơn')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (14, 2, N'Thành phố Tam Kỳ')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (15, 2, N'Thành phố Hội An')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (16, 2, N'Huyện Tây Giang')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (17, 2, N'Huyện Đông Giang')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (18, 2, N'Huyện Đại Lộc')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (19, 2, N'Thị xã Điện Bàn')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (20, 2, N'Huyện Duy Xuyên')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (21, 2, N'Huyện Quế Sơn')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (22, 2, N'Huyện Nam Giang')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (23, 2, N'Huyện Phước Sơn')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (24, 2, N'Huyện Hiệp Đức')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (25, 2, N'Huyện Thăng Bình')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (26, 2, N'Huyện Tiên Phước')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (27, 2, N'Huyện Bắc Trà My')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (28, 2, N'Huyện Nam Trà My')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (29, 2, N'Huyện Núi Thành')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (30, 2, N'Huyện Phú Ninh')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (31, 2, N'Huyện Nông Sơn')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (32, 3, N'Liên Chiểu')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (33, 3, N'Thanh Khê')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (34, 3, N'Hải Châu')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (35, 3, N'Sơn Trà')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (36, 3, N'Ngũ Hành Sơn')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (37, 3, N'Cẩm Lệ')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (38, 3, N'Hòa Vang')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (39, 3, N'Hòang Sa')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (40, 4, N'Quận 1')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (41, 4, N'Quận 12')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (42, 4, N'Thủ Đức')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (43, 4, N'Quận 9')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (44, 4, N'Quận Gò Vấp')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (45, 4, N'Bình Thạnh')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (46, 4, N'Tân Bình')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (47, 4, N'Tân Phú')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (48, 4, N'Phú Nhuận')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (49, 4, N'Quận 2')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (50, 4, N'Quận 3')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (51, 4, N'Quận 10')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (52, 4, N'Quận 11')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (53, 4, N'Quận 4')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (54, 4, N'Quận 5')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (55, 4, N'Quận 6')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (56, 4, N'Quận 8')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (57, 4, N'Bình Tân')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (58, 4, N'Quận 7')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (59, 4, N'Củ Chi')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (60, 4, N'Hóc Môn')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (61, 4, N'Bình Chánh')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (62, 4, N'Nhà Bè')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (63, 4, N'Cần Giờ')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (64, 5, N'Thành phố Huế')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (65, 5, N'Huyện Phong Điền')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (66, 5, N'Huyện Quảng Điền')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (67, 5, N'Huyện Phú Vang')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (68, 5, N'Thị xã Hương Thủy')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (69, 5, N'Thị xã Hương Trà')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (70, 5, N'Huyện A Lưới')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (71, 5, N'Huyện Phú Lộc')
INSERT [dbo].[District] ([districtID], [provinceID], [districtName]) VALUES (72, 5, N'Huyện Nam Đông')
SET IDENTITY_INSERT [dbo].[District] OFF
INSERT [dbo].[Feedback] ([tutorID], [postID], [dateTimeFB], [gradeFB], [contentFB]) VALUES (1, 1, CAST(N'2020-08-20' AS Date), 4.5, N'Chất lượng dạy học tốt')
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([genderID], [genderType]) VALUES (1, N'M')
INSERT [dbo].[Gender] ([genderID], [genderType]) VALUES (2, N'F')
INSERT [dbo].[Gender] ([genderID], [genderType]) VALUES (3, N'O')
SET IDENTITY_INSERT [dbo].[Gender] OFF
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([postID], [learnerID], [subjectID], [communeID], [genderID], [qualificationID], [statusID], [typePost], [lessonLearn], [timeLearn], [fee], [startDay], [postDes]) VALUES (1, 1, 1, 6, 1, 2, 8, 0, 3, 2, N'100000', CAST(N'2020-08-18' AS Date), N'Muốn được dạy kĩ phần hình học')
INSERT [dbo].[Post] ([postID], [learnerID], [subjectID], [communeID], [genderID], [qualificationID], [statusID], [typePost], [lessonLearn], [timeLearn], [fee], [startDay], [postDes]) VALUES (2, 1, 1, 6, 1, 1, 4, 1, 3, 2, N'200000', CAST(N'2020-08-18' AS Date), NULL)
INSERT [dbo].[Post] ([postID], [learnerID], [subjectID], [communeID], [genderID], [qualificationID], [statusID], [typePost], [lessonLearn], [timeLearn], [fee], [startDay], [postDes]) VALUES (3, 1, 1, 6, 1, 1, 8, 1, 3, 2, N'200000', CAST(N'2020-08-18' AS Date), NULL)
INSERT [dbo].[Post] ([postID], [learnerID], [subjectID], [communeID], [genderID], [qualificationID], [statusID], [typePost], [lessonLearn], [timeLearn], [fee], [startDay], [postDes]) VALUES (4, 1, 1, 6, 1, 1, 8, 1, 2, 1, N'200000', CAST(N'2020-08-18' AS Date), NULL)
INSERT [dbo].[Post] ([postID], [learnerID], [subjectID], [communeID], [genderID], [qualificationID], [statusID], [typePost], [lessonLearn], [timeLearn], [fee], [startDay], [postDes]) VALUES (5, 1, 1, 6, 1, 1, 8, 1, 4, 2, N'200000', CAST(N'2020-08-18' AS Date), NULL)
INSERT [dbo].[Post] ([postID], [learnerID], [subjectID], [communeID], [genderID], [qualificationID], [statusID], [typePost], [lessonLearn], [timeLearn], [fee], [startDay], [postDes]) VALUES (1004, 1, 2, 6, 1, 2, 8, 0, 3, 2, N'100000', CAST(N'2020-08-18' AS Date), N'Muốn được dạy kĩ phần hình học')
SET IDENTITY_INSERT [dbo].[Post] OFF
SET IDENTITY_INSERT [dbo].[ProvinceOrCity] ON 

INSERT [dbo].[ProvinceOrCity] ([provinceID], [provinceName]) VALUES (1, N'Quảng Ngãi')
INSERT [dbo].[ProvinceOrCity] ([provinceID], [provinceName]) VALUES (2, N'Tỉnh Quảng Nam')
INSERT [dbo].[ProvinceOrCity] ([provinceID], [provinceName]) VALUES (3, N'Đà Nẵng')
INSERT [dbo].[ProvinceOrCity] ([provinceID], [provinceName]) VALUES (4, N'Hồ Chí Minh')
INSERT [dbo].[ProvinceOrCity] ([provinceID], [provinceName]) VALUES (5, N'Tỉnh Thừa Thiên Huế')
SET IDENTITY_INSERT [dbo].[ProvinceOrCity] OFF
SET IDENTITY_INSERT [dbo].[Qualification] ON 

INSERT [dbo].[Qualification] ([qualificationID], [qualificationName]) VALUES (1, N'Giáo Viên')
INSERT [dbo].[Qualification] ([qualificationID], [qualificationName]) VALUES (2, N'Sinh Viên')
INSERT [dbo].[Qualification] ([qualificationID], [qualificationName]) VALUES (3, N'Học Sinh')
SET IDENTITY_INSERT [dbo].[Qualification] OFF
INSERT [dbo].[Report] ([tutorID], [postID], [dateTimeRP], [contentRP]) VALUES (1, 2, CAST(N'2020-08-20' AS Date), N'Bài đăng sai địa chỉ')
INSERT [dbo].[Request] ([tutorID], [postID], [typeRequest], [statusID]) VALUES (2, 1, 0, 4)
INSERT [dbo].[Request] ([tutorID], [postID], [typeRequest], [statusID]) VALUES (2, 4, 0, 4)
INSERT [dbo].[Request] ([tutorID], [postID], [typeRequest], [statusID]) VALUES (2, 3, 0, 7)
INSERT [dbo].[Request] ([tutorID], [postID], [typeRequest], [statusID]) VALUES (2, 5, 0, 11)
INSERT [dbo].[Request] ([tutorID], [postID], [typeRequest], [statusID]) VALUES (3, 4, 0, 7)
INSERT [dbo].[Request] ([tutorID], [postID], [typeRequest], [statusID]) VALUES (3, 5, 0, 7)
INSERT [dbo].[Request] ([tutorID], [postID], [typeRequest], [statusID]) VALUES (3, 1, 1, 4)
INSERT [dbo].[Request] ([tutorID], [postID], [typeRequest], [statusID]) VALUES (3, 1004, 0, 10)
INSERT [dbo].[Request] ([tutorID], [postID], [typeRequest], [statusID]) VALUES (2, 5, 1, 11)
INSERT [dbo].[Request] ([tutorID], [postID], [typeRequest], [statusID]) VALUES (3, 1004, 0, 11)
INSERT [dbo].[Request] ([tutorID], [postID], [typeRequest], [statusID]) VALUES (2, 5, 1, 11)
INSERT [dbo].[Request] ([tutorID], [postID], [typeRequest], [statusID]) VALUES (2, 1, 1, 4)
INSERT [dbo].[Request] ([tutorID], [postID], [typeRequest], [statusID]) VALUES (2, 1, 0, 4)
SET IDENTITY_INSERT [dbo].[RoleTB] ON 

INSERT [dbo].[RoleTB] ([roleID], [roleName]) VALUES (1, N'admin')
INSERT [dbo].[RoleTB] ([roleID], [roleName]) VALUES (2, N'teacher')
INSERT [dbo].[RoleTB] ([roleID], [roleName]) VALUES (3, N'student')
SET IDENTITY_INSERT [dbo].[RoleTB] OFF
SET IDENTITY_INSERT [dbo].[StatusTB] ON 

INSERT [dbo].[StatusTB] ([statusID], [statusName]) VALUES (1, N'user-verified')
INSERT [dbo].[StatusTB] ([statusID], [statusName]) VALUES (2, N'user-non-verified')
INSERT [dbo].[StatusTB] ([statusID], [statusName]) VALUES (3, N'user-blocked')
INSERT [dbo].[StatusTB] ([statusID], [statusName]) VALUES (4, N'request-waiting')
INSERT [dbo].[StatusTB] ([statusID], [statusName]) VALUES (5, N'request-accepted')
INSERT [dbo].[StatusTB] ([statusID], [statusName]) VALUES (6, N'request-reject')
INSERT [dbo].[StatusTB] ([statusID], [statusName]) VALUES (7, N'request-blocked')
INSERT [dbo].[StatusTB] ([statusID], [statusName]) VALUES (8, N'post-active')
INSERT [dbo].[StatusTB] ([statusID], [statusName]) VALUES (9, N'post-blocked')
INSERT [dbo].[StatusTB] ([statusID], [statusName]) VALUES (10, N'class-wating')
INSERT [dbo].[StatusTB] ([statusID], [statusName]) VALUES (11, N'class-accepted')
INSERT [dbo].[StatusTB] ([statusID], [statusName]) VALUES (12, N'class-reject')
INSERT [dbo].[StatusTB] ([statusID], [statusName]) VALUES (13, N'class-debt')
INSERT [dbo].[StatusTB] ([statusID], [statusName]) VALUES (14, N'class-payed')
INSERT [dbo].[StatusTB] ([statusID], [statusName]) VALUES (15, N'class-blocked')
SET IDENTITY_INSERT [dbo].[StatusTB] OFF
SET IDENTITY_INSERT [dbo].[SubjectTB] ON 

INSERT [dbo].[SubjectTB] ([subjectID], [subjectName]) VALUES (1, N'Toán lớp 12')
INSERT [dbo].[SubjectTB] ([subjectID], [subjectName]) VALUES (2, N'Văn lớp 12')
INSERT [dbo].[SubjectTB] ([subjectID], [subjectName]) VALUES (3, N'Anh lớp 12')
INSERT [dbo].[SubjectTB] ([subjectID], [subjectName]) VALUES (4, N'Sinh lớp 12')
INSERT [dbo].[SubjectTB] ([subjectID], [subjectName]) VALUES (5, N'Hóa lớp 12')
SET IDENTITY_INSERT [dbo].[SubjectTB] OFF
SET IDENTITY_INSERT [dbo].[SubjectTutor] ON 

INSERT [dbo].[SubjectTutor] ([tutorID], [subjectID]) VALUES (2, 1)
INSERT [dbo].[SubjectTutor] ([tutorID], [subjectID]) VALUES (3, 2)
SET IDENTITY_INSERT [dbo].[SubjectTutor] OFF
SET IDENTITY_INSERT [dbo].[UserTB] ON 

INSERT [dbo].[UserTB] ([userID], [roleID], [statusID], [genderID], [qualificationID], [communeID], [email], [userPass], [streetName], [userName], [avatar], [phone], [salary], [workAt], [identityCard], [studentCard]) VALUES (1, 3, 1, 2, 1, 6, N'hongntx@gmail.com', N'012345', N'294 Nguyễn Nghiêm', N'Xuan Hong', NULL, N'0338943886', NULL, NULL, NULL, NULL)
INSERT [dbo].[UserTB] ([userID], [roleID], [statusID], [genderID], [qualificationID], [communeID], [email], [userPass], [streetName], [userName], [avatar], [phone], [salary], [workAt], [identityCard], [studentCard]) VALUES (2, 2, 1, 1, 2, 17, N'anhkhoi@gmail.com', N'012345', N'121 Hùng Vương', N'Anh khôi', NULL, N'0338940923', N'100000', N'Trường sư phạm TP HCM', N'212584495', NULL)
INSERT [dbo].[UserTB] ([userID], [roleID], [statusID], [genderID], [qualificationID], [communeID], [email], [userPass], [streetName], [userName], [avatar], [phone], [salary], [workAt], [identityCard], [studentCard]) VALUES (3, 2, 1, 1, 2, 17, N'anhkhoi@gmail.com', N'012345', N'121 Hùng Vương', N'Anh Khoa', NULL, N'0338940923', N'100000', N'Trường sư phạm TP HCM', N'212584495', NULL)
SET IDENTITY_INSERT [dbo].[UserTB] OFF
ALTER TABLE [dbo].[CertificateTB]  WITH CHECK ADD FOREIGN KEY([tutorID])
REFERENCES [dbo].[UserTB] ([userID])
GO
ALTER TABLE [dbo].[CommuneOrWard]  WITH CHECK ADD FOREIGN KEY([districtID])
REFERENCES [dbo].[District] ([districtID])
GO
ALTER TABLE [dbo].[District]  WITH CHECK ADD FOREIGN KEY([provinceID])
REFERENCES [dbo].[ProvinceOrCity] ([provinceID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([tutorID])
REFERENCES [dbo].[UserTB] ([userID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([postID])
REFERENCES [dbo].[Post] ([postID])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([communeID])
REFERENCES [dbo].[CommuneOrWard] ([communeID])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([genderID])
REFERENCES [dbo].[Gender] ([genderID])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([learnerID])
REFERENCES [dbo].[UserTB] ([userID])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([qualificationID])
REFERENCES [dbo].[Qualification] ([qualificationID])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([statusID])
REFERENCES [dbo].[StatusTB] ([statusID])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([subjectID])
REFERENCES [dbo].[SubjectTB] ([subjectID])
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD FOREIGN KEY([tutorID])
REFERENCES [dbo].[UserTB] ([userID])
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD FOREIGN KEY([postID])
REFERENCES [dbo].[Post] ([postID])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([postID])
REFERENCES [dbo].[Post] ([postID])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([tutorID])
REFERENCES [dbo].[UserTB] ([userID])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([statusID])
REFERENCES [dbo].[StatusTB] ([statusID])
GO
ALTER TABLE [dbo].[ScheduleLearner]  WITH CHECK ADD FOREIGN KEY([postID])
REFERENCES [dbo].[Post] ([postID])
GO
ALTER TABLE [dbo].[ScheduleTutor]  WITH CHECK ADD FOREIGN KEY([tutorID])
REFERENCES [dbo].[UserTB] ([userID])
GO
ALTER TABLE [dbo].[SubjectTutor]  WITH CHECK ADD FOREIGN KEY([tutorID])
REFERENCES [dbo].[UserTB] ([userID])
GO
ALTER TABLE [dbo].[SubjectTutor]  WITH CHECK ADD FOREIGN KEY([subjectID])
REFERENCES [dbo].[SubjectTB] ([subjectID])
GO
ALTER TABLE [dbo].[UserTB]  WITH CHECK ADD FOREIGN KEY([communeID])
REFERENCES [dbo].[CommuneOrWard] ([communeID])
GO
ALTER TABLE [dbo].[UserTB]  WITH CHECK ADD FOREIGN KEY([genderID])
REFERENCES [dbo].[Gender] ([genderID])
GO
ALTER TABLE [dbo].[UserTB]  WITH CHECK ADD FOREIGN KEY([qualificationID])
REFERENCES [dbo].[Qualification] ([qualificationID])
GO
ALTER TABLE [dbo].[UserTB]  WITH CHECK ADD FOREIGN KEY([statusID])
REFERENCES [dbo].[StatusTB] ([statusID])
GO
ALTER TABLE [dbo].[UserTB]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[RoleTB] ([roleID])
GO
USE [master]
GO
ALTER DATABASE [TuLearn] SET  READ_WRITE 
GO
