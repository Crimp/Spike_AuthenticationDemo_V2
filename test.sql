USE [master]
GO
/****** Object:  Database [XAF_AuthenticationDemoDB]    Script Date: 05.11.2012 20:56:09 ******/
CREATE DATABASE [XAF_AuthenticationDemoDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'XAF_AuthenticationDemoDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\XAF_AuthenticationDemoDB.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'XAF_AuthenticationDemoDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\XAF_AuthenticationDemoDB_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [XAF_AuthenticationDemoDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET RECOVERY FULL 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET  MULTI_USER 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'XAF_AuthenticationDemoDB', N'ON'
GO
USE [XAF_AuthenticationDemoDB]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 05.11.2012 20:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contact](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Photo] [varbinary](max) NULL,
	[OwnerId] [uniqueidentifier] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SecuritySystemMemberPermissionsObject]    Script Date: 05.11.2012 20:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecuritySystemMemberPermissionsObject](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Members] [nvarchar](max) NULL,
	[AllowRead] [bit] NULL,
	[AllowWrite] [bit] NULL,
	[Owner] [uniqueidentifier] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_SecuritySystemMemberPermissionsObject] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SecuritySystemObjectPermissionsObject]    Script Date: 05.11.2012 20:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecuritySystemObjectPermissionsObject](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Criteria] [nvarchar](max) NULL,
	[AllowRead] [bit] NULL,
	[AllowWrite] [bit] NULL,
	[AllowDelete] [bit] NULL,
	[AllowNavigate] [bit] NULL,
	[Owner] [uniqueidentifier] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_SecuritySystemObjectPermissionsObject] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SecuritySystemRole]    Script Date: 05.11.2012 20:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecuritySystemRole](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[ObjectType] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[IsAdministrative] [bit] NULL,
	[CanEditModel] [bit] NULL,
 CONSTRAINT [PK_SecuritySystemRole] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]    Script Date: 05.11.2012 20:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles](
	[ChildRoles] [uniqueidentifier] NULL,
	[ParentRoles] [uniqueidentifier] NULL,
	[OID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OptimisticLockField] [int] NULL,
 CONSTRAINT [PK_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SecuritySystemTypePermissionsObject]    Script Date: 05.11.2012 20:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecuritySystemTypePermissionsObject](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TargetType] [nvarchar](max) NULL,
	[AllowRead] [bit] NULL,
	[AllowWrite] [bit] NULL,
	[AllowCreate] [bit] NULL,
	[AllowDelete] [bit] NULL,
	[AllowNavigate] [bit] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[ObjectType] [int] NULL,
	[Owner] [uniqueidentifier] NULL,
 CONSTRAINT [PK_SecuritySystemTypePermissionsObject] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SecuritySystemUser]    Script Date: 05.11.2012 20:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecuritySystemUser](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[StoredPassword] [nvarchar](max) NULL,
	[ChangePasswordOnFirstLogon] [bit] NULL,
	[UserName] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[ObjectType] [int] NULL,
 CONSTRAINT [PK_SecuritySystemUser] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles]    Script Date: 05.11.2012 20:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles](
	[Roles] [uniqueidentifier] NULL,
	[Users] [uniqueidentifier] NULL,
	[OID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OptimisticLockField] [int] NULL,
 CONSTRAINT [PK_SecuritySystemUserUsers_SecuritySystemRoleRoles] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[XPObjectType]    Script Date: 05.11.2012 20:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XPObjectType](
	[OID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TypeName] [nvarchar](254) NULL,
	[AssemblyName] [nvarchar](254) NULL,
 CONSTRAINT [PK_XPObjectType] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [iGCRecord_Contact]    Script Date: 05.11.2012 20:56:09 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Contact] ON [dbo].[Contact]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_SecuritySystemMemberPermissionsObject]    Script Date: 05.11.2012 20:56:09 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_SecuritySystemMemberPermissionsObject] ON [dbo].[SecuritySystemMemberPermissionsObject]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iOwner_SecuritySystemMemberPermissionsObject]    Script Date: 05.11.2012 20:56:09 ******/
CREATE NONCLUSTERED INDEX [iOwner_SecuritySystemMemberPermissionsObject] ON [dbo].[SecuritySystemMemberPermissionsObject]
(
	[Owner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_SecuritySystemObjectPermissionsObject]    Script Date: 05.11.2012 20:56:09 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_SecuritySystemObjectPermissionsObject] ON [dbo].[SecuritySystemObjectPermissionsObject]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iOwner_SecuritySystemObjectPermissionsObject]    Script Date: 05.11.2012 20:56:09 ******/
CREATE NONCLUSTERED INDEX [iOwner_SecuritySystemObjectPermissionsObject] ON [dbo].[SecuritySystemObjectPermissionsObject]
(
	[Owner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_SecuritySystemRole]    Script Date: 05.11.2012 20:56:09 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_SecuritySystemRole] ON [dbo].[SecuritySystemRole]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iObjectType_SecuritySystemRole]    Script Date: 05.11.2012 20:56:09 ******/
CREATE NONCLUSTERED INDEX [iObjectType_SecuritySystemRole] ON [dbo].[SecuritySystemRole]
(
	[ObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iChildRoles_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]    Script Date: 05.11.2012 20:56:09 ******/
CREATE NONCLUSTERED INDEX [iChildRoles_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles] ON [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]
(
	[ChildRoles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iChildRolesParentRoles_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]    Script Date: 05.11.2012 20:56:09 ******/
CREATE UNIQUE NONCLUSTERED INDEX [iChildRolesParentRoles_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles] ON [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]
(
	[ChildRoles] ASC,
	[ParentRoles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iParentRoles_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]    Script Date: 05.11.2012 20:56:09 ******/
CREATE NONCLUSTERED INDEX [iParentRoles_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles] ON [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]
(
	[ParentRoles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_SecuritySystemTypePermissionsObject]    Script Date: 05.11.2012 20:56:09 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_SecuritySystemTypePermissionsObject] ON [dbo].[SecuritySystemTypePermissionsObject]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iObjectType_SecuritySystemTypePermissionsObject]    Script Date: 05.11.2012 20:56:09 ******/
CREATE NONCLUSTERED INDEX [iObjectType_SecuritySystemTypePermissionsObject] ON [dbo].[SecuritySystemTypePermissionsObject]
(
	[ObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iOwner_SecuritySystemTypePermissionsObject]    Script Date: 05.11.2012 20:56:09 ******/
CREATE NONCLUSTERED INDEX [iOwner_SecuritySystemTypePermissionsObject] ON [dbo].[SecuritySystemTypePermissionsObject]
(
	[Owner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_SecuritySystemUser]    Script Date: 05.11.2012 20:56:09 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_SecuritySystemUser] ON [dbo].[SecuritySystemUser]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iObjectType_SecuritySystemUser]    Script Date: 05.11.2012 20:56:09 ******/
CREATE NONCLUSTERED INDEX [iObjectType_SecuritySystemUser] ON [dbo].[SecuritySystemUser]
(
	[ObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iRoles_SecuritySystemUserUsers_SecuritySystemRoleRoles]    Script Date: 05.11.2012 20:56:09 ******/
CREATE NONCLUSTERED INDEX [iRoles_SecuritySystemUserUsers_SecuritySystemRoleRoles] ON [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles]
(
	[Roles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iRolesUsers_SecuritySystemUserUsers_SecuritySystemRoleRoles]    Script Date: 05.11.2012 20:56:09 ******/
CREATE UNIQUE NONCLUSTERED INDEX [iRolesUsers_SecuritySystemUserUsers_SecuritySystemRoleRoles] ON [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles]
(
	[Roles] ASC,
	[Users] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iUsers_SecuritySystemUserUsers_SecuritySystemRoleRoles]    Script Date: 05.11.2012 20:56:09 ******/
CREATE NONCLUSTERED INDEX [iUsers_SecuritySystemUserUsers_SecuritySystemRoleRoles] ON [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles]
(
	[Users] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [iTypeName_XPObjectType]    Script Date: 05.11.2012 20:56:09 ******/
CREATE UNIQUE NONCLUSTERED INDEX [iTypeName_XPObjectType] ON [dbo].[XPObjectType]
(
	[TypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SecuritySystemMemberPermissionsObject]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemMemberPermissionsObject_Owner] FOREIGN KEY([Owner])
REFERENCES [dbo].[SecuritySystemTypePermissionsObject] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[SecuritySystemMemberPermissionsObject] CHECK CONSTRAINT [FK_SecuritySystemMemberPermissionsObject_Owner]
GO
ALTER TABLE [dbo].[SecuritySystemObjectPermissionsObject]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemObjectPermissionsObject_Owner] FOREIGN KEY([Owner])
REFERENCES [dbo].[SecuritySystemTypePermissionsObject] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[SecuritySystemObjectPermissionsObject] CHECK CONSTRAINT [FK_SecuritySystemObjectPermissionsObject_Owner]
GO
ALTER TABLE [dbo].[SecuritySystemRole]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemRole_ObjectType] FOREIGN KEY([ObjectType])
REFERENCES [dbo].[XPObjectType] ([OID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[SecuritySystemRole] CHECK CONSTRAINT [FK_SecuritySystemRole_ObjectType]
GO
ALTER TABLE [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles_ChildRoles] FOREIGN KEY([ChildRoles])
REFERENCES [dbo].[SecuritySystemRole] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles] CHECK CONSTRAINT [FK_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles_ChildRoles]
GO
ALTER TABLE [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles_ParentRoles] FOREIGN KEY([ParentRoles])
REFERENCES [dbo].[SecuritySystemRole] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles] CHECK CONSTRAINT [FK_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles_ParentRoles]
GO
ALTER TABLE [dbo].[SecuritySystemTypePermissionsObject]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemTypePermissionsObject_ObjectType] FOREIGN KEY([ObjectType])
REFERENCES [dbo].[XPObjectType] ([OID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[SecuritySystemTypePermissionsObject] CHECK CONSTRAINT [FK_SecuritySystemTypePermissionsObject_ObjectType]
GO
ALTER TABLE [dbo].[SecuritySystemTypePermissionsObject]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemTypePermissionsObject_Owner] FOREIGN KEY([Owner])
REFERENCES [dbo].[SecuritySystemRole] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[SecuritySystemTypePermissionsObject] CHECK CONSTRAINT [FK_SecuritySystemTypePermissionsObject_Owner]
GO
ALTER TABLE [dbo].[SecuritySystemUser]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemUser_ObjectType] FOREIGN KEY([ObjectType])
REFERENCES [dbo].[XPObjectType] ([OID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[SecuritySystemUser] CHECK CONSTRAINT [FK_SecuritySystemUser_ObjectType]
GO
ALTER TABLE [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemUserUsers_SecuritySystemRoleRoles_Roles] FOREIGN KEY([Roles])
REFERENCES [dbo].[SecuritySystemRole] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles] CHECK CONSTRAINT [FK_SecuritySystemUserUsers_SecuritySystemRoleRoles_Roles]
GO
ALTER TABLE [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemUserUsers_SecuritySystemRoleRoles_Users] FOREIGN KEY([Users])
REFERENCES [dbo].[SecuritySystemUser] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles] CHECK CONSTRAINT [FK_SecuritySystemUserUsers_SecuritySystemRoleRoles_Users]
GO
USE [master]
GO
ALTER DATABASE [XAF_AuthenticationDemoDB] SET  READ_WRITE 
GO
