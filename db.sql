USE [master]
GO
/****** Object:  Database [precast]    Script Date: 5/23/2016 3:16:57 PM ******/
CREATE DATABASE [precast]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'precast', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\precast.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'precast_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\precast_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [precast] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [precast].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [precast] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [precast] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [precast] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [precast] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [precast] SET ARITHABORT OFF 
GO
ALTER DATABASE [precast] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [precast] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [precast] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [precast] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [precast] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [precast] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [precast] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [precast] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [precast] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [precast] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [precast] SET  DISABLE_BROKER 
GO
ALTER DATABASE [precast] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [precast] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [precast] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [precast] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [precast] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [precast] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [precast] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [precast] SET RECOVERY FULL 
GO
ALTER DATABASE [precast] SET  MULTI_USER 
GO
ALTER DATABASE [precast] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [precast] SET DB_CHAINING OFF 
GO
ALTER DATABASE [precast] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [precast] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'precast', N'ON'
GO
USE [precast]
GO
/****** Object:  StoredProcedure [dbo].[addOperation]    Script Date: 5/23/2016 3:16:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[addOperation]
@date		int, @primary	float, @a12		float, @a19		float,
@a1x2		float, @a2x3	float, @m30		float, @other	float,
@l1			float, @l2		float, @l3		float, @l4		float,
@l5			float,@l6		float, @l7		float, @l8		float,
@l9			float,@l10		float, @l11		float, @l12		float,
@l13		float,
@cs430		float,
@ch440		float,
@stcj411	float,
@swcj411	float,
@sunny		bit,
@cloudy		bit,
@rain		bit,
@note		varchar(120),
@fulldate	varchar(50),
@userid		int
AS
begin
declare @sec float;
set @sec = @a12 + @a19 + @a1x2 + @a2x3 + @m30 + @other;
declare @tr float;
set @tr = @l1 + @l2 + @l3 + @l4 + @l5 + @l6 + @l7 + @l8 + @l9 + @l10 + @l11 + @l12 + @l13;

insert into operation([date],[primary],[secondary],[a12],[a19],[a1x2],[a2x3],[m30],[other],[truck],[l1],[l2],
[l3],[l4],[l5],[l6],[l7],[l8],[l9],[l10],[l11],[l12],[l13],[cs430],[ch440],[stcj411],[swcj411],
[sunny],[cloudy],[rain],[note],[fulldate],[userid]) 
values(@date, @primary,@sec,@a12, @a19, @a1x2,@a2x3,@m30,@other,@tr,@l1,@l2,@l3,@l4,@l5,@l6,@l7,@l8,@l9,@l10,
	@l11,@l12,@l13,@cs430,@ch440,@stcj411,@swcj411,@sunny,@cloudy,@rain,@note,@fulldate,@userid);
select 1;
end
GO
/****** Object:  StoredProcedure [dbo].[editOperation]    Script Date: 5/23/2016 3:16:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[editOperation]
@id			int,
@date		int, @primary	float, @a12		float, @a19		float,
@a1x2		float, @a2x3	float, @m30		float, @other	float,
@l1			float, @l2		float, @l3		float, @l4		float,
@l5			float,@l6		float, @l7		float, @l8		float,
@l9			float,@l10		float, @l11		float, @l12		float,
@l13		float,
@cs430		float,
@ch440		float,
@stcj411	float,
@swcj411	float,
@sunny		bit,
@cloudy		bit,
@rain		bit,
@note		varchar(120),
@fulldate	varchar(50),
@userid		int
AS
begin
declare @sec float;
set @sec = @a12 + @a19 + @a1x2 + @a2x3 + @m30 + @other;
declare @tr float;
set @tr = @l1 + @l2 + @l3 + @l4 + @l5 + @l6 + @l7 + @l8 + @l9 + @l10 + @l11 + @l12 + @l13;

update operation set [date]=@date,[primary]=@primary,[secondary]=@sec,[a12]=@a12,[a19]=@a19,
[a1x2]=@a1x2,[a2x3]=@a2x3,[m30]=@m30,[other]=@other,[truck]=@tr,[l1]=@l1,[l2]=@l2,
[l3]=@l3,[l4]=@l4,[l5]=@l5,[l6]=@l6,[l7]=@l7,[l8]=@l8,[l9]=l9,[l10]=@l10,[l11]=@l11,[l12]=@l12,[l13]=@l13,[cs430]=@cs430,[ch440]=@ch440,[stcj411]=@stcj411,[swcj411]=@swcj411,
[sunny]=@sunny,[cloudy]=@cloudy,[rain]=@rain,[note]=@note,[fulldate]=@fulldate 
where id=@id;
select 1;
end

GO
/****** Object:  StoredProcedure [dbo].[getPage]    Script Date: 5/23/2016 3:16:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[getPage]
@tbl	VARCHAR(50)
AS
BEGIN
	DECLARE @sql VARCHAR(50);
	DECLARE @page INT;
	SET @sql= 'select (count(*)+0.0)/20 as total from ' + @tbl;
	exec(@sql);
END
GO
/****** Object:  StoredProcedure [dbo].[getTotal]    Script Date: 5/23/2016 3:16:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[getTotal]
@month int,
@year	int
as
begin
	select sum([primary]) as 't1', sum([secondary]) as 't2', sum(truck) as 't3'
	from operation
	where month(fulldate) = @month and year(fulldate) = @year;
end

GO
/****** Object:  StoredProcedure [dbo].[getUser]    Script Date: 5/23/2016 3:16:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[getUser]
@username		varchar(90)
AS
begin
	select * from users where username=@username;
end
GO
/****** Object:  StoredProcedure [dbo].[getUserByPage]    Script Date: 5/23/2016 3:16:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[getUserByPage]
	@pageno		INT
AS
BEGIN
	-- items per page, default 18
	DECLARE @pagesize INT;
	SET @pagesize = 20;
	-- select limit by page
	SELECT [users].*, [group].name 
	FROM users
	LEFT JOIN [group]
	ON users.groupid = [group].id
	ORDER BY [users].id ASC
	OFFSET @pagesize * (@pageno-1) ROWS
	FETCH NEXT @pagesize ROWS ONLY;
END
GO
/****** Object:  Table [dbo].[group]    Script Date: 5/23/2016 3:16:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[operation]    Script Date: 5/23/2016 3:16:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[operation](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[date] [int] NULL,
	[primary] [float] NULL,
	[secondary] [float] NULL,
	[a12] [float] NULL,
	[a19] [float] NULL,
	[a1x2] [float] NULL,
	[a2x3] [float] NULL,
	[m30] [float] NULL,
	[other] [float] NULL,
	[truck] [float] NULL,
	[l1] [float] NULL,
	[l2] [float] NULL,
	[l3] [float] NULL,
	[l4] [float] NULL,
	[l5] [float] NULL,
	[l6] [float] NULL,
	[l7] [float] NULL,
	[l8] [float] NULL,
	[l9] [float] NULL,
	[l10] [float] NULL,
	[l11] [float] NULL,
	[l12] [float] NULL,
	[l13] [float] NULL,
	[cs430] [float] NULL,
	[ch440] [float] NULL,
	[stcj411] [float] NULL,
	[swcj411] [float] NULL,
	[sunny] [bit] NULL,
	[cloudy] [bit] NULL,
	[rain] [bit] NULL,
	[note] [varchar](222) NULL,
	[fulldate] [varchar](50) NULL,
	[userid] [int] NULL,
 CONSTRAINT [PK_tbloperation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 5/23/2016 3:16:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](50) NULL,
	[lastname] [varchar](50) NULL,
	[gender] [varchar](5) NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](12) NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[groupid] [int] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[group] ON 

INSERT [dbo].[group] ([id], [name]) VALUES (1, N'Admin')
INSERT [dbo].[group] ([id], [name]) VALUES (2, N'Guest')
SET IDENTITY_INSERT [dbo].[group] OFF
SET IDENTITY_INSERT [dbo].[operation] ON 

INSERT [dbo].[operation] ([id], [date], [primary], [secondary], [a12], [a19], [a1x2], [a2x3], [m30], [other], [truck], [l1], [l2], [l3], [l4], [l5], [l6], [l7], [l8], [l9], [l10], [l11], [l12], [l13], [cs430], [ch440], [stcj411], [swcj411], [sunny], [cloudy], [rain], [note], [fulldate], [userid]) VALUES (2, 2, 2, 10, 2, 2, 2, 2, 2, 0, 17, 1, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, N'example', N'2016-05-02', 1)
SET IDENTITY_INSERT [dbo].[operation] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [firstname], [lastname], [gender], [email], [phone], [username], [password], [groupid]) VALUES (1, N'Vongkol', N'HENG', N'Male', N'hengvongkol@gmail.com', N'0975589097', N'vongkol', N'202CB962AC59075B964B07152D234B70', 1)
INSERT [dbo].[users] ([id], [firstname], [lastname], [gender], [email], [phone], [username], [password], [groupid]) VALUES (2, N'Chanthy', N'VEN', N'Male', N'chanthy.ch@gmail.com', N'0966860923', N'chanthy', N'CAF1A3DFB505FFED0D024130F58C5CFA', 2)
SET IDENTITY_INSERT [dbo].[users] OFF
ALTER TABLE [dbo].[operation] ADD  CONSTRAINT [DF_tbloperation_sunny]  DEFAULT ((0)) FOR [sunny]
GO
ALTER TABLE [dbo].[operation] ADD  CONSTRAINT [DF_tbloperation_cloudy]  DEFAULT ((0)) FOR [cloudy]
GO
ALTER TABLE [dbo].[operation] ADD  CONSTRAINT [DF_tbloperation_rain]  DEFAULT ((0)) FOR [rain]
GO
USE [master]
GO
ALTER DATABASE [precast] SET  READ_WRITE 
GO
