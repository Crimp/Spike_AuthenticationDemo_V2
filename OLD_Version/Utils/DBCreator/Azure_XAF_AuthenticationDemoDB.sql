USE [Azure_XAF_AuthenticationDemoDB]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 10/18/2012 4:28:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Oid]  [uniqueidentifier]  default newid(),
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
/****** Object:  Table [dbo].[SecuritySystemMemberPermissionsObject]    Script Date: 10/18/2012 4:28:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecuritySystemMemberPermissionsObject](
	[Oid]  [uniqueidentifier]  default newid(),
	[Members] [nvarchar](max) NULL,
	[AllowRead] [bit] NULL,
	[AllowWrite] [bit] NULL,
	[Owner] [uniqueidentifier] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_SecuritySystemMemberPermissionsObject] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
)  

GO
/****** Object:  Table [dbo].[SecuritySystemObjectPermissionsObject]    Script Date: 10/18/2012 4:28:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecuritySystemObjectPermissionsObject](
	[Oid]  [uniqueidentifier]  default newid(),
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
)  

GO
/****** Object:  Table [dbo].[SecuritySystemRole]    Script Date: 10/18/2012 4:28:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecuritySystemRole](
	[Oid]  [uniqueidentifier]  default newid(),
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[ObjectType] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[IsAdministrative] [bit] NULL,
	[CanEditModel] [bit] NULL,
 CONSTRAINT [PK_SecuritySystemRole] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
/****** Object:  Table [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]    Script Date: 10/18/2012 4:28:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles](
	[ChildRoles] [uniqueidentifier] NULL,
	[ParentRoles] [uniqueidentifier] NULL,
	[Oid]  [uniqueidentifier]  default newid(),
	[OptimisticLockField] [int] NULL,
 CONSTRAINT [PK_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
/****** Object:  Table [dbo].[SecuritySystemTypePermissionsObject]    Script Date: 10/18/2012 4:28:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecuritySystemTypePermissionsObject](
	[Oid]  [uniqueidentifier]  default newid(),
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
)  

GO
/****** Object:  Table [dbo].[SecuritySystemUser]    Script Date: 10/18/2012 4:28:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecuritySystemUser](
	[Oid]  [uniqueidentifier]  default newid(),
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
)  

GO
/****** Object:  Table [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles]    Script Date: 10/18/2012 4:28:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles](
	[Roles] [uniqueidentifier] NULL,
	[Users] [uniqueidentifier] NULL,
	[Oid]  [uniqueidentifier]  default newid(),
	[OptimisticLockField] [int] NULL,
 CONSTRAINT [PK_SecuritySystemUserUsers_SecuritySystemRoleRoles] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
/****** Object:  Table [dbo].[XPObjectType]    Script Date: 10/18/2012 4:28:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XPObjectType](
	[OID] [int] IDENTITY(1,1)  NOT NULL,
	[TypeName] [nvarchar](254) NULL,
	[AssemblyName] [nvarchar](254) NULL,
 CONSTRAINT [PK_XPObjectType] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
/****** Object:  Index [iGCRecord_Contact]    Script Date: 10/18/2012 4:28:07 AM ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Contact] ON [dbo].[Contact]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
/****** Object:  Index [iGCRecord_SecuritySystemMemberPermissionsObject]    Script Date: 10/18/2012 4:28:07 AM ******/
CREATE NONCLUSTERED INDEX [iGCRecord_SecuritySystemMemberPermissionsObject] ON [dbo].[SecuritySystemMemberPermissionsObject]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
/****** Object:  Index [iOwner_SecuritySystemMemberPermissionsObject]    Script Date: 10/18/2012 4:28:07 AM ******/
CREATE NONCLUSTERED INDEX [iOwner_SecuritySystemMemberPermissionsObject] ON [dbo].[SecuritySystemMemberPermissionsObject]
(
	[Owner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
/****** Object:  Index [iGCRecord_SecuritySystemObjectPermissionsObject]    Script Date: 10/18/2012 4:28:07 AM ******/
CREATE NONCLUSTERED INDEX [iGCRecord_SecuritySystemObjectPermissionsObject] ON [dbo].[SecuritySystemObjectPermissionsObject]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
/****** Object:  Index [iOwner_SecuritySystemObjectPermissionsObject]    Script Date: 10/18/2012 4:28:07 AM ******/
CREATE NONCLUSTERED INDEX [iOwner_SecuritySystemObjectPermissionsObject] ON [dbo].[SecuritySystemObjectPermissionsObject]
(
	[Owner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
/****** Object:  Index [iGCRecord_SecuritySystemRole]    Script Date: 10/18/2012 4:28:07 AM ******/
CREATE NONCLUSTERED INDEX [iGCRecord_SecuritySystemRole] ON [dbo].[SecuritySystemRole]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
/****** Object:  Index [iObjectType_SecuritySystemRole]    Script Date: 10/18/2012 4:28:07 AM ******/
CREATE NONCLUSTERED INDEX [iObjectType_SecuritySystemRole] ON [dbo].[SecuritySystemRole]
(
	[ObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
/****** Object:  Index [iChildRoles_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]    Script Date: 10/18/2012 4:28:07 AM ******/
CREATE NONCLUSTERED INDEX [iChildRoles_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles] ON [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]
(
	[ChildRoles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
/****** Object:  Index [iChildRolesParentRoles_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]    Script Date: 10/18/2012 4:28:07 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [iChildRolesParentRoles_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles] ON [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]
(
	[ChildRoles] ASC,
	[ParentRoles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
/****** Object:  Index [iParentRoles_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]    Script Date: 10/18/2012 4:28:07 AM ******/
CREATE NONCLUSTERED INDEX [iParentRoles_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles] ON [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]
(
	[ParentRoles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
/****** Object:  Index [iGCRecord_SecuritySystemTypePermissionsObject]    Script Date: 10/18/2012 4:28:07 AM ******/
CREATE NONCLUSTERED INDEX [iGCRecord_SecuritySystemTypePermissionsObject] ON [dbo].[SecuritySystemTypePermissionsObject]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
/****** Object:  Index [iObjectType_SecuritySystemTypePermissionsObject]    Script Date: 10/18/2012 4:28:07 AM ******/
CREATE NONCLUSTERED INDEX [iObjectType_SecuritySystemTypePermissionsObject] ON [dbo].[SecuritySystemTypePermissionsObject]
(
	[ObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
/****** Object:  Index [iOwner_SecuritySystemTypePermissionsObject]    Script Date: 10/18/2012 4:28:07 AM ******/
CREATE NONCLUSTERED INDEX [iOwner_SecuritySystemTypePermissionsObject] ON [dbo].[SecuritySystemTypePermissionsObject]
(
	[Owner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
/****** Object:  Index [iGCRecord_SecuritySystemUser]    Script Date: 10/18/2012 4:28:07 AM ******/
CREATE NONCLUSTERED INDEX [iGCRecord_SecuritySystemUser] ON [dbo].[SecuritySystemUser]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
/****** Object:  Index [iObjectType_SecuritySystemUser]    Script Date: 10/18/2012 4:28:07 AM ******/
CREATE NONCLUSTERED INDEX [iObjectType_SecuritySystemUser] ON [dbo].[SecuritySystemUser]
(
	[ObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
/****** Object:  Index [iRoles_SecuritySystemUserUsers_SecuritySystemRoleRoles]    Script Date: 10/18/2012 4:28:07 AM ******/
CREATE NONCLUSTERED INDEX [iRoles_SecuritySystemUserUsers_SecuritySystemRoleRoles] ON [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles]
(
	[Roles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
/****** Object:  Index [iRolesUsers_SecuritySystemUserUsers_SecuritySystemRoleRoles]    Script Date: 10/18/2012 4:28:07 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [iRolesUsers_SecuritySystemUserUsers_SecuritySystemRoleRoles] ON [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles]
(
	[Roles] ASC,
	[Users] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
/****** Object:  Index [iUsers_SecuritySystemUserUsers_SecuritySystemRoleRoles]    Script Date: 10/18/2012 4:28:07 AM ******/
CREATE NONCLUSTERED INDEX [iUsers_SecuritySystemUserUsers_SecuritySystemRoleRoles] ON [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles]
(
	[Users] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [iTypeName_XPObjectType]    Script Date: 10/18/2012 4:28:07 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [iTypeName_XPObjectType] ON [dbo].[XPObjectType]
(
	[TypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
ALTER TABLE [dbo].[SecuritySystemMemberPermissionsObject]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemMemberPermissionsObject_Owner] FOREIGN KEY([Owner])
REFERENCES [dbo].[SecuritySystemTypePermissionsObject] ([Oid])
 
GO
ALTER TABLE [dbo].[SecuritySystemMemberPermissionsObject] CHECK CONSTRAINT [FK_SecuritySystemMemberPermissionsObject_Owner]
GO
ALTER TABLE [dbo].[SecuritySystemObjectPermissionsObject]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemObjectPermissionsObject_Owner] FOREIGN KEY([Owner])
REFERENCES [dbo].[SecuritySystemTypePermissionsObject] ([Oid])
 
GO
ALTER TABLE [dbo].[SecuritySystemObjectPermissionsObject] CHECK CONSTRAINT [FK_SecuritySystemObjectPermissionsObject_Owner]
GO
ALTER TABLE [dbo].[SecuritySystemRole]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemRole_ObjectType] FOREIGN KEY([ObjectType])
REFERENCES [dbo].[XPObjectType] ([OID])
 
GO
ALTER TABLE [dbo].[SecuritySystemRole] CHECK CONSTRAINT [FK_SecuritySystemRole_ObjectType]
GO
ALTER TABLE [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles_ChildRoles] FOREIGN KEY([ChildRoles])
REFERENCES [dbo].[SecuritySystemRole] ([Oid])
 
GO
ALTER TABLE [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles] CHECK CONSTRAINT [FK_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles_ChildRoles]
GO
ALTER TABLE [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles_ParentRoles] FOREIGN KEY([ParentRoles])
REFERENCES [dbo].[SecuritySystemRole] ([Oid])
 
GO
ALTER TABLE [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles] CHECK CONSTRAINT [FK_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles_ParentRoles]
GO
ALTER TABLE [dbo].[SecuritySystemTypePermissionsObject]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemTypePermissionsObject_ObjectType] FOREIGN KEY([ObjectType])
REFERENCES [dbo].[XPObjectType] ([OID])
 
GO
ALTER TABLE [dbo].[SecuritySystemTypePermissionsObject] CHECK CONSTRAINT [FK_SecuritySystemTypePermissionsObject_ObjectType]
GO
ALTER TABLE [dbo].[SecuritySystemTypePermissionsObject]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemTypePermissionsObject_Owner] FOREIGN KEY([Owner])
REFERENCES [dbo].[SecuritySystemRole] ([Oid])
 
GO
ALTER TABLE [dbo].[SecuritySystemTypePermissionsObject] CHECK CONSTRAINT [FK_SecuritySystemTypePermissionsObject_Owner]
GO
ALTER TABLE [dbo].[SecuritySystemUser]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemUser_ObjectType] FOREIGN KEY([ObjectType])
REFERENCES [dbo].[XPObjectType] ([OID])
 
GO
ALTER TABLE [dbo].[SecuritySystemUser] CHECK CONSTRAINT [FK_SecuritySystemUser_ObjectType]
GO
ALTER TABLE [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemUserUsers_SecuritySystemRoleRoles_Roles] FOREIGN KEY([Roles])
REFERENCES [dbo].[SecuritySystemRole] ([Oid])
 
GO
ALTER TABLE [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles] CHECK CONSTRAINT [FK_SecuritySystemUserUsers_SecuritySystemRoleRoles_Roles]
GO
ALTER TABLE [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemUserUsers_SecuritySystemRoleRoles_Users] FOREIGN KEY([Users])
REFERENCES [dbo].[SecuritySystemUser] ([Oid])
 
GO
ALTER TABLE [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles] CHECK CONSTRAINT [FK_SecuritySystemUserUsers_SecuritySystemRoleRoles_Users]
GO