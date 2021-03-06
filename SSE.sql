USE [master]
GO
/****** Object:  Database [SSE]    Script Date: 4/25/2015 2:13:15 PM ******/

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SSE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SSE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SSE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SSE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SSE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SSE] SET ARITHABORT OFF 
GO
ALTER DATABASE [SSE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SSE] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SSE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SSE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SSE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SSE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SSE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SSE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SSE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SSE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SSE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SSE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SSE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SSE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SSE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SSE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SSE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SSE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SSE] SET RECOVERY FULL 
GO
ALTER DATABASE [SSE] SET  MULTI_USER 
GO
ALTER DATABASE [SSE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SSE] SET DB_CHAINING OFF 
GO
USE [SSE]
GO
/****** Object:  FullTextCatalog [AddressCatalog]    Script Date: 4/25/2015 2:13:15 PM ******/
CREATE FULLTEXT CATALOG [AddressCatalog]WITH ACCENT_SENSITIVITY = ON

GO
/****** Object:  StoredProcedure [dbo].[GetAddress]    Script Date: 4/25/2015 2:13:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SI
-- Create date: 
-- Description:	To return address by service id
-- =============================================
CREATE PROCEDURE [dbo].[GetAddress] 
	-- Add the parameters for the stored procedure here
	@serviceId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT street1, street2	FROM Addresses
	WHERE service_id=@serviceId
	RETURN
END




GO
/****** Object:  StoredProcedure [dbo].[GetContactNumber]    Script Date: 4/25/2015 2:13:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SI
-- Create date: 
-- Description:	To return contact number by service id
-- =============================================
CREATE PROCEDURE [dbo].[GetContactNumber] 
	-- Add the parameters for the stored procedure here
	@serviceId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT contact_no FROM contact_nos
	WHERE service_id=@serviceId
	RETURN
END




GO
/****** Object:  StoredProcedure [dbo].[GetEmail]    Script Date: 4/25/2015 2:13:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SI
-- Create date: 
-- Description:	To return email by service id
-- =============================================
CREATE PROCEDURE [dbo].[GetEmail] 
	-- Add the parameters for the stored procedure here
	@serviceId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT email FROM Services
	WHERE id=@serviceId
	RETURN
END




GO
/****** Object:  StoredProcedure [dbo].[GetOwnerName]    Script Date: 4/25/2015 2:13:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SI
-- Create date: 
-- Description:	To retun owner name by service id
-- =============================================
CREATE PROCEDURE [dbo].[GetOwnerName] 
	-- Add the parameters for the stored procedure here
	@serviceId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT owner_name FROM Services
	WHERE id=@serviceId
	RETURN
END




GO
/****** Object:  StoredProcedure [dbo].[GetServiceName]    Script Date: 4/25/2015 2:13:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SI
-- Create date: 
-- Description:	To return service name by service id.
-- =============================================
CREATE PROCEDURE [dbo].[GetServiceName] 
	-- Add the parameters for the stored procedure here
	@serviceId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT service_name FROM Services 
	WHERE id=@serviceId
	RETURN
	END




GO
/****** Object:  StoredProcedure [dbo].[spAddAddress]    Script Date: 4/25/2015 2:13:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SI
-- Create date: 
-- Description:	Add address details in Addresses table
-- =============================================
CREATE PROCEDURE [dbo].[spAddAddress] 
	-- Add the parameters for the stored procedure here
	@street1 nvarchar(max) = 0, 
	@street2 nvarchar(max) = 0,
	@pin int,
	@latitude float,
	@longitude float,
	@serviceId int,
	@createdAt datetime,
	@lastUpdatedAt datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Addresses (street1,street2,pin,longitude,latitude,service_id,created_at,last_updated_at) 
	values(@street1,@street2,@pin,@longitude,@latitude,@serviceId,@createdAt,@lastUpdatedAt)
	
END




GO
/****** Object:  StoredProcedure [dbo].[spAddComment]    Script Date: 4/25/2015 2:13:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SI
-- Create date: 
-- Description:	Add comments in Comments Tabe
-- =============================================
CREATE PROCEDURE [dbo].[spAddComment] 
	-- Add the parameters for the stored procedure here
	@comment nvarchar(max), 
	@serviceId int,
	@userName nvarchar(max),
	@email nvarchar(max),
	@createdAt datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Comments (comment,service_id,[user_name],email,created_at)
	 values(@comment,@serviceId,@userName,@email,@createdAt)
END




GO
/****** Object:  StoredProcedure [dbo].[spAddContactByServiceId]    Script Date: 4/25/2015 2:13:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SI
-- Create date: 
-- Description:	Add Contacts for a given service
-- =============================================
CREATE PROCEDURE [dbo].[spAddContactByServiceId] 
	-- Add the parameters for the stored procedure here
	@contactNumber nvarchar(max) = 0, 
	@serviceId int = 0,
	@createdAt datetime,
	@lastUpdatedAt datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO contact_nos (contact_no,service_id,created_at,last_updated_at) values(@contactNumber,@serviceId,@createdAt,@lastUpdatedAt)
	
	--SELECT @contactNumber, @serviceId
END





GO
/****** Object:  StoredProcedure [dbo].[spAddImage]    Script Date: 4/25/2015 2:13:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SI
-- Create date: 
-- Description:	Add image in Potos Table
-- =============================================
CREATE PROCEDURE [dbo].[spAddImage] 
	-- Add the parameters for the stored procedure here
	@ImageName nvarchar(max) , 
	@ImagePath nvarchar(max),
	@serviceId int,
	@createdAt datetime,
	@lastUpdatedAt datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Photos (image_name,image_path,service_id,created_at,last_updated_at) 
	values(@ImageName,@ImagePath,@serviceId,@createdAt,@lastUpdatedAt)
END







GO
/****** Object:  StoredProcedure [dbo].[spApproveService]    Script Date: 4/25/2015 2:13:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SI
-- Create date: 
-- Description:	Approves service
-- =============================================
CREATE PROCEDURE [dbo].[spApproveService] 
	-- Add the parameters for the stored procedure here
	@service_id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Services SET is_approved=1 WHERE id = @service_id
END




GO
/****** Object:  StoredProcedure [dbo].[spDenyService]    Script Date: 4/25/2015 2:13:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SI
-- Create date: 
-- Description:	Approves service
-- =============================================
CREATE PROCEDURE [dbo].[spDenyService] 
	-- Add the parameters for the stored procedure here
	@service_id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM Services WHERE id = @service_id
END




GO
/****** Object:  StoredProcedure [dbo].[spGenerateServices]    Script Date: 4/25/2015 2:13:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===============================================
-- Author:		SI
-- Create date: 
-- Description:	Add a new service in services table
-- ================================================
CREATE PROCEDURE [dbo].[spGenerateServices]
	-- Add the parameters for the stored procedure here
	@serviceName nvarchar(MAX) , 
	@ownerName nvarchar(MAX) , 
	@email nvarchar(MAX) , 
	@typeId int, 
	@insertedAt datetime,
	@lastUpdatedAt datetime,
	@isApproved bit 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT into Services ([service_name],owner_name,email,[type_id],created_at,last_updated_at,is_approved) values(@serviceName,@ownerName,@email,@typeId,@insertedAt,@lastUpdatedAt,@isApproved) 
	RETURN @@IDENTITY
	
END






GO
/****** Object:  StoredProcedure [dbo].[spGenerateServicesByAdmin]    Script Date: 4/25/2015 2:13:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SI
-- Create date: 
-- Description:	To get services register by admin
-- =============================================
CREATE PROCEDURE [dbo].[spGenerateServicesByAdmin] 
-- Add the parameters for the stored procedure here
	@serviceName nvarchar(MAX) , 
	@ownerName nvarchar(MAX) , 
	@email nvarchar(MAX) , 
	@typeId int, 
	@insertedAt datetime,
	@lastUpdatedAt datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT into Services ([service_name],owner_name,email,[type_id],created_at,last_updated_at,is_approved) values(@serviceName,@ownerName,@email,@typeId,@insertedAt,@lastUpdatedAt,1) 
    RETURN @@IDENTITY
END


GO
/****** Object:  StoredProcedure [dbo].[spGetAllDetaiilsByServiceId]    Script Date: 4/25/2015 2:13:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SI
-- Create date: 
-- Description:	To get all details by service id.
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllDetaiilsByServiceId] 
	-- Add the parameters for the stored procedure here
	@serviceId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Services.service_name, Services.owner_name, Services.email, Addresses.street1, Addresses.street2,Ratings.rating
	FROM Services
	INNER JOIN Addresses ON Services.id= Addresses.service_id AND Services.id= @serviceId
	INNER JOIN Ratings ON Services.id= Ratings.service_id
	RETURN
END



GO
/****** Object:  StoredProcedure [dbo].[spGetImagesByServiceId]    Script Date: 4/25/2015 2:13:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SI
-- Create date: 
-- Description:	Get images from Service Id
-- =============================================
CREATE PROCEDURE [dbo].[spGetImagesByServiceId] 
	-- Add the parameters for the stored procedure here
	@serviceId int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT image_path FROM Photos WHERE service_id=@serviceId
END



GO
/****** Object:  StoredProcedure [dbo].[spGetRatingsByServiceId]    Script Date: 4/25/2015 2:13:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SI
-- Create date: 
-- Description:	to retun rating on service id.
-- =============================================
CREATE PROCEDURE [dbo].[spGetRatingsByServiceId] 
	-- Add the parameters for the stored procedure here
	@serviceId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT AVG(Ratings.rating) FROM Ratings 
	WHERE Ratings.service_id = @serviceId
	RETURN 
END



GO
/****** Object:  StoredProcedure [dbo].[spGetTypeId]    Script Date: 4/25/2015 2:13:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SI
-- Create date: 
-- Description:	To get typeid by type name
-- =============================================
CREATE PROCEDURE [dbo].[spGetTypeId] 
	-- Add the parameters for the stored procedure here
	@typeName nvarchar(max) 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id FROM Type_of_Services
	WHERE
	name=@typeName
	RETURN
END





GO
/****** Object:  StoredProcedure [dbo].[spGetUnapprovedRequests]    Script Date: 4/25/2015 2:13:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SI
-- Create date: 
-- Description:	Gives the unapproved requests
-- =============================================
CREATE PROCEDURE [dbo].[spGetUnapprovedRequests]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select DISTINCT s.id,s.service_name,ts.name, cn.contact_no,ad.street1, ad.street2 FROM Services s, Type_of_Services ts,contact_nos cn,Addresses ad Where s.is_approved= 0 AND s.type_id = ts.id AND cn.service_id = s.id AND ad.service_id = s.id
 
END




GO
/****** Object:  StoredProcedure [dbo].[spShowDetail]    Script Date: 4/25/2015 2:13:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SI
-- Create date: 
-- Description:	To show details of services
-- =============================================
CREATE PROCEDURE [dbo].[spShowDetail]
	-- Add the parameters for the stored procedure here
	@typeId int ,
	@street nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Services.id, Services.service_name, Services.owner_name, contact_nos.contact_no, Addresses.street2 ,Ratings.rating
	FROM Services
	INNER JOIN Addresses ON Services.id = Addresses.service_id 
	INNER JOIN contact_nos ON Services.id = contact_nos.service_id
	INNER JOIN Ratings ON Services.id = Ratings.service_id
	WHERE
	Services.type_id= @typeId AND Addresses.street2= @street AND Services.is_approved=1
	RETURN
END



GO
/****** Object:  StoredProcedure [dbo].[spSuggestions]    Script Date: 4/25/2015 2:13:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SI
-- Create date: 
-- Description:	Sends address suggestions
-- =============================================
CREATE PROCEDURE [dbo].[spSuggestions] 
	-- Add the parameters for the stored procedure here
	@prefixText nvarchar(100)  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT street1 FROM Addresses 
	WHERE freetext(street1,@prefixText)
END


GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 4/25/2015 2:13:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[street1] [nvarchar](max) NOT NULL,
	[street2] [nvarchar](max) NOT NULL,
	[pin] [int] NOT NULL,
	[longitude] [float] NOT NULL,
	[latitude] [float] NOT NULL,
	[service_id] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[last_updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comments]    Script Date: 4/25/2015 2:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[comment] [nvarchar](max) NOT NULL,
	[service_id] [int] NOT NULL,
	[user_name] [nvarchar](max) NOT NULL,
	[email] [nvarchar](max) NOT NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[contact_nos]    Script Date: 4/25/2015 2:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contact_nos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contact_no] [nvarchar](max) NOT NULL,
	[service_id] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[last_updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_contact_nos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Photos]    Script Date: 4/25/2015 2:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image_name] [nvarchar](max) NULL,
	[image_path] [nvarchar](max) NOT NULL,
	[service_id] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[last_updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_Photos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 4/25/2015 2:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rating] [int] NOT NULL,
	[service_id] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[last_updated_at] [datetime] NULL,
 CONSTRAINT [PK_Ratings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Services]    Script Date: 4/25/2015 2:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[service_name] [nvarchar](max) NULL,
	[owner_name] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[type_id] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[last_updated_at] [datetime] NULL,
	[is_approved] [bit] NOT NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Type_of_Services]    Script Date: 4/25/2015 2:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type_of_Services](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[last_updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_Type_of_Services] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([id], [street1], [street2], [pin], [longitude], [latitude], [service_id], [created_at], [last_updated_at]) VALUES (3, N'Near Landcraft Golflinks', N'NH-24, Hapur Road', 201002, 77.472925, 28.656851, 4, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[Addresses] ([id], [street1], [street2], [pin], [longitude], [latitude], [service_id], [created_at], [last_updated_at]) VALUES (4, N'K. J. 7 ', N'Kavi Nagar', 201002, 77.3162886, 28.4214855, 7, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[Addresses] ([id], [street1], [street2], [pin], [longitude], [latitude], [service_id], [created_at], [last_updated_at]) VALUES (5, N'Plot No. 837, Shalimar Garden', N' Ext-I Sahibabad', 201005, 77.3403390999, 28.6902392, 8, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[Addresses] ([id], [street1], [street2], [pin], [longitude], [latitude], [service_id], [created_at], [last_updated_at]) VALUES (6, N'W-3 Sector-1', N'Vaishali', 201012, 77.333063, 28.635082, 9, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[Addresses] ([id], [street1], [street2], [pin], [longitude], [latitude], [service_id], [created_at], [last_updated_at]) VALUES (7, N'III-M', N'Nehru Nagar', 201001, 77.3262835, 28.6449174, 10, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[Addresses] ([id], [street1], [street2], [pin], [longitude], [latitude], [service_id], [created_at], [last_updated_at]) VALUES (9, N'Ajay Kumar Garg Engineering College', N'NH-24, Hapur Road', 201002, 77.5018, 28.6773, 11, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[Addresses] ([id], [street1], [street2], [pin], [longitude], [latitude], [service_id], [created_at], [last_updated_at]) VALUES (10, N'ADD-B1, Plot No 13, Uma Shopping Arcade', N'Central Market, Vaishali ', 201012, 77.3396212, 28.6478771, 12, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Addresses] OFF
SET IDENTITY_INSERT [dbo].[contact_nos] ON 

INSERT [dbo].[contact_nos] ([id], [contact_no], [service_id], [created_at], [last_updated_at]) VALUES (3, N'0120 398 9896', 4, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[contact_nos] ([id], [contact_no], [service_id], [created_at], [last_updated_at]) VALUES (4, N'0120 270 1694', 7, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[contact_nos] ([id], [contact_no], [service_id], [created_at], [last_updated_at]) VALUES (5, N'0120-2649444', 8, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[contact_nos] ([id], [contact_no], [service_id], [created_at], [last_updated_at]) VALUES (6, N'120 4173000', 9, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[contact_nos] ([id], [contact_no], [service_id], [created_at], [last_updated_at]) VALUES (7, N'0120 418 2000', 10, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[contact_nos] ([id], [contact_no], [service_id], [created_at], [last_updated_at]) VALUES (8, N'0120 2649540', 11, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[contact_nos] ([id], [contact_no], [service_id], [created_at], [last_updated_at]) VALUES (9, N'11-66723154', 12, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[contact_nos] OFF
SET IDENTITY_INSERT [dbo].[Photos] ON 

INSERT [dbo].[Photos] ([id], [image_name], [image_path], [service_id], [created_at], [last_updated_at]) VALUES (3, N'columbia_asia1', N'Images/columbia_asia1.jpg', 4, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[Photos] ([id], [image_name], [image_path], [service_id], [created_at], [last_updated_at]) VALUES (4, N'columbia_asia2', N'Images/columbia_asia2.jpg', 4, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[Photos] ([id], [image_name], [image_path], [service_id], [created_at], [last_updated_at]) VALUES (5, N'pushpanjali1', N'Images/pushpanjali1.jpg', 9, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[Photos] ([id], [image_name], [image_path], [service_id], [created_at], [last_updated_at]) VALUES (6, N'pushpanjali2', N'Images/pushpanjali2.jpg', 9, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[Photos] ([id], [image_name], [image_path], [service_id], [created_at], [last_updated_at]) VALUES (7, N'sarvodaya1', N'Images/sarvodaya1.jfif', 7, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[Photos] ([id], [image_name], [image_path], [service_id], [created_at], [last_updated_at]) VALUES (8, N'sarvodaya2', N'Images/sarvodaya2.jpg', 7, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[Photos] ([id], [image_name], [image_path], [service_id], [created_at], [last_updated_at]) VALUES (9, N'shreya1', N'Images/shreya1.jpg', 8, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[Photos] ([id], [image_name], [image_path], [service_id], [created_at], [last_updated_at]) VALUES (10, N'shreya2', N'Images/shreya2.jpg', 8, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[Photos] ([id], [image_name], [image_path], [service_id], [created_at], [last_updated_at]) VALUES (12, N'yashoda1', N'Images/yashoda1.jpg', 10, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[Photos] ([id], [image_name], [image_path], [service_id], [created_at], [last_updated_at]) VALUES (13, N'yashoda2', N'Images/yashoda2.jpg', 10, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[Photos] ([id], [image_name], [image_path], [service_id], [created_at], [last_updated_at]) VALUES (14, N'BOB1', N'Images/BOB1.jpg', 11, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[Photos] ([id], [image_name], [image_path], [service_id], [created_at], [last_updated_at]) VALUES (15, N'GROCERY1', N'Images/GROCERY1.jpg', 12, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Photos] OFF
SET IDENTITY_INSERT [dbo].[Ratings] ON 

INSERT [dbo].[Ratings] ([id], [rating], [service_id], [created_at], [last_updated_at]) VALUES (4, 4, 4, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[Ratings] ([id], [rating], [service_id], [created_at], [last_updated_at]) VALUES (5, 5, 7, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[Ratings] ([id], [rating], [service_id], [created_at], [last_updated_at]) VALUES (6, 3, 8, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[Ratings] ([id], [rating], [service_id], [created_at], [last_updated_at]) VALUES (7, 4, 9, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[Ratings] ([id], [rating], [service_id], [created_at], [last_updated_at]) VALUES (8, 3, 10, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[Ratings] ([id], [rating], [service_id], [created_at], [last_updated_at]) VALUES (9, 5, 11, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
INSERT [dbo].[Ratings] ([id], [rating], [service_id], [created_at], [last_updated_at]) VALUES (10, 3, 12, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Ratings] OFF
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([id], [service_name], [owner_name], [email], [type_id], [created_at], [last_updated_at], [is_approved]) VALUES (4, N'Columbia Asia', N'Rajendra Kumar', N'india.columbiaasia.com/hospitals/ghaziabad', 1, CAST(0x0000A57E00000000 AS DateTime), CAST(0x0000A57E00000000 AS DateTime), 1)
INSERT [dbo].[Services] ([id], [service_name], [owner_name], [email], [type_id], [created_at], [last_updated_at], [is_approved]) VALUES (7, N'Sarvodaya', N'Girish Gupta', N'sarvodaya.hospitals.com', 1, CAST(0x0000A57E00000000 AS DateTime), CAST(0x0000A57E00000000 AS DateTime), 1)
INSERT [dbo].[Services] ([id], [service_name], [owner_name], [email], [type_id], [created_at], [last_updated_at], [is_approved]) VALUES (8, N'Shreya', N'R.K. Laxmam', N'hospital.shreya.org.in', 1, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime), 1)
INSERT [dbo].[Services] ([id], [service_name], [owner_name], [email], [type_id], [created_at], [last_updated_at], [is_approved]) VALUES (9, N'Pushpanjali Crosslay ', N'Preeti Srivastava', N'pusphospital.com', 1, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime), 1)
INSERT [dbo].[Services] ([id], [service_name], [owner_name], [email], [type_id], [created_at], [last_updated_at], [is_approved]) VALUES (10, N'Yashoda Superspeciality ', N'K.A. Agarwal', N'yashoda.hosp.co.in', 1, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime), 1)
INSERT [dbo].[Services] ([id], [service_name], [owner_name], [email], [type_id], [created_at], [last_updated_at], [is_approved]) VALUES (11, N'BOB1', N'BOB', N'bobindia.co.in', 8, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime), 1)
INSERT [dbo].[Services] ([id], [service_name], [owner_name], [email], [type_id], [created_at], [last_updated_at], [is_approved]) VALUES (12, N'Garg Store', N'Rajeev Garg', N'garg.atore.co.in', 5, CAST(0x0000A48500000000 AS DateTime), CAST(0x0000A48500000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Services] OFF
SET IDENTITY_INSERT [dbo].[Type_of_Services] ON 

INSERT [dbo].[Type_of_Services] ([id], [name], [created_at], [last_updated_at]) VALUES (1, N'Hospital', CAST(0x0000A57E00000000 AS DateTime), CAST(0x0000A57E00000000 AS DateTime))
INSERT [dbo].[Type_of_Services] ([id], [name], [created_at], [last_updated_at]) VALUES (3, N'College', CAST(0x0000A57E00000000 AS DateTime), CAST(0x0000A57E00000000 AS DateTime))
INSERT [dbo].[Type_of_Services] ([id], [name], [created_at], [last_updated_at]) VALUES (5, N'Grocery', CAST(0x0000A57E00000000 AS DateTime), CAST(0x0000A57E00000000 AS DateTime))
INSERT [dbo].[Type_of_Services] ([id], [name], [created_at], [last_updated_at]) VALUES (7, N'School', CAST(0x0000A57E00000000 AS DateTime), CAST(0x0000A57E00000000 AS DateTime))
INSERT [dbo].[Type_of_Services] ([id], [name], [created_at], [last_updated_at]) VALUES (8, N'ATM', CAST(0x0000A57E00000000 AS DateTime), CAST(0x0000A57E00000000 AS DateTime))
INSERT [dbo].[Type_of_Services] ([id], [name], [created_at], [last_updated_at]) VALUES (9, N'Bank', CAST(0x0000A57E00000000 AS DateTime), CAST(0x0000A57E00000000 AS DateTime))
INSERT [dbo].[Type_of_Services] ([id], [name], [created_at], [last_updated_at]) VALUES (10, N'Dentist', CAST(0x0000A57E00000000 AS DateTime), CAST(0x0000A57E00000000 AS DateTime))
INSERT [dbo].[Type_of_Services] ([id], [name], [created_at], [last_updated_at]) VALUES (11, N'Coachings', CAST(0x0000A57E00000000 AS DateTime), CAST(0x0000A57E00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Type_of_Services] OFF
ALTER TABLE [dbo].[Ratings] ADD  CONSTRAINT [DF_Ratings_rating]  DEFAULT ((0)) FOR [rating]
GO
ALTER TABLE [dbo].[Services] ADD  CONSTRAINT [DF_Services_is_approved]  DEFAULT ((0)) FOR [is_approved]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Services] FOREIGN KEY([service_id])
REFERENCES [dbo].[Services] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Services]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Services] FOREIGN KEY([service_id])
REFERENCES [dbo].[Services] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Services]
GO
ALTER TABLE [dbo].[contact_nos]  WITH CHECK ADD  CONSTRAINT [FK_contact_nos_Services] FOREIGN KEY([service_id])
REFERENCES [dbo].[Services] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[contact_nos] CHECK CONSTRAINT [FK_contact_nos_Services]
GO
ALTER TABLE [dbo].[Photos]  WITH CHECK ADD  CONSTRAINT [FK_Photos_Services] FOREIGN KEY([service_id])
REFERENCES [dbo].[Services] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Photos] CHECK CONSTRAINT [FK_Photos_Services]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_Services] FOREIGN KEY([service_id])
REFERENCES [dbo].[Services] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_Services]
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD  CONSTRAINT [FK_Services_Type_of_Services] FOREIGN KEY([type_id])
REFERENCES [dbo].[Type_of_Services] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Services] CHECK CONSTRAINT [FK_Services_Type_of_Services]
GO
USE [master]
GO
ALTER DATABASE [SSE] SET  READ_WRITE 
GO
