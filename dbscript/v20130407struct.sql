USE [NGnonoFM]
GO
/****** Object:  ForeignKey [FK_Bill_Tag]    Script Date: 04/07/2013 09:47:05 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bill_Tag]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bill]'))
ALTER TABLE [dbo].[Bill] DROP CONSTRAINT [FK_Bill_Tag]
GO
/****** Object:  ForeignKey [FK_Bill_User]    Script Date: 04/07/2013 09:47:05 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bill_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bill]'))
ALTER TABLE [dbo].[Bill] DROP CONSTRAINT [FK_Bill_User]
GO
/****** Object:  ForeignKey [FK_Comment_User]    Script Date: 04/07/2013 09:47:05 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comment_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comment]'))
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [FK_Comment_User]
GO
/****** Object:  ForeignKey [FK_Product_Brand]    Script Date: 04/07/2013 09:47:06 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_Brand]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_Brand]
GO
/****** Object:  ForeignKey [FK_Product_Store]    Script Date: 04/07/2013 09:47:06 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_Store]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_Store]
GO
/****** Object:  ForeignKey [FK_Product_Tag]    Script Date: 04/07/2013 09:47:06 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_Tag]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_Tag]
GO
/****** Object:  ForeignKey [FK_Product_User]    Script Date: 04/07/2013 09:47:06 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_User]
GO
/****** Object:  ForeignKey [FK_Store_Group]    Script Date: 04/07/2013 09:47:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Store_Group]') AND parent_object_id = OBJECT_ID(N'[dbo].[Store]'))
ALTER TABLE [dbo].[Store] DROP CONSTRAINT [FK_Store_Group]
GO
/****** Object:  ForeignKey [FK_User_Store]    Script Date: 04/07/2013 09:47:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Store]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Store]
GO
/****** Object:  ForeignKey [FK_UserAccount_User]    Script Date: 04/07/2013 09:47:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserAccount_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserAccount]'))
ALTER TABLE [dbo].[UserAccount] DROP CONSTRAINT [FK_UserAccount_User]
GO
/****** Object:  ForeignKey [FK_UserRole_Role]    Script Date: 04/07/2013 09:47:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_Role]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole]'))
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [FK_UserRole_Role]
GO
/****** Object:  ForeignKey [FK_UserRole_User]    Script Date: 04/07/2013 09:47:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole]'))
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [FK_UserRole_User]
GO
/****** Object:  StoredProcedure [dbo].[ProductStagePublish]    Script Date: 04/07/2013 09:47:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductStagePublish]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ProductStagePublish]
GO
/****** Object:  StoredProcedure [dbo].[ProductStagePublish2]    Script Date: 04/07/2013 09:47:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductStagePublish2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ProductStagePublish2]
GO
/****** Object:  View [dbo].[VUser]    Script Date: 04/07/2013 09:47:09 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VUser]'))
DROP VIEW [dbo].[VUser]
GO
/****** Object:  View [dbo].[VUserRole]    Script Date: 04/07/2013 09:47:09 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VUserRole]'))
DROP VIEW [dbo].[VUserRole]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 04/07/2013 09:47:05 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bill_Tag]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bill]'))
ALTER TABLE [dbo].[Bill] DROP CONSTRAINT [FK_Bill_Tag]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bill_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bill]'))
ALTER TABLE [dbo].[Bill] DROP CONSTRAINT [FK_Bill_User]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Bill_Mode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Bill] DROP CONSTRAINT [DF_Bill_Mode]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Bill_Type]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Bill] DROP CONSTRAINT [DF_Bill_Type]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Bill_Description]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Bill] DROP CONSTRAINT [DF_Bill_Description]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Bill_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Bill] DROP CONSTRAINT [DF_Bill_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Bill_UpdatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Bill] DROP CONSTRAINT [DF_Bill_UpdatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Bill_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Bill] DROP CONSTRAINT [DF_Bill_Status]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Bill_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Bill] DROP CONSTRAINT [DF_Bill_IsDeleted]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bill]') AND type in (N'U'))
DROP TABLE [dbo].[Bill]
GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 04/07/2013 09:47:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserAccount_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserAccount]'))
ALTER TABLE [dbo].[UserAccount] DROP CONSTRAINT [FK_UserAccount_User]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_UserAccount_AccountType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UserAccount] DROP CONSTRAINT [DF_UserAccount_AccountType]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_UserAccount_AccountId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UserAccount] DROP CONSTRAINT [DF_UserAccount_AccountId]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_UserAccount_Amount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UserAccount] DROP CONSTRAINT [DF_UserAccount_Amount]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_UserAccount_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UserAccount] DROP CONSTRAINT [DF_UserAccount_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_UserAccount_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UserAccount] DROP CONSTRAINT [DF_UserAccount_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_UserAccount_UpdatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UserAccount] DROP CONSTRAINT [DF_UserAccount_UpdatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_UserAccount_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UserAccount] DROP CONSTRAINT [DF_UserAccount_UpdatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_UserAccount_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UserAccount] DROP CONSTRAINT [DF_UserAccount_Status]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAccount]') AND type in (N'U'))
DROP TABLE [dbo].[UserAccount]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 04/07/2013 09:47:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_Role]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole]'))
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [FK_UserRole_Role]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole]'))
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [FK_UserRole_User]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_UserRole_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [DF_UserRole_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_UserRole_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [DF_UserRole_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_UserRole_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [DF_UserRole_Status]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRole]') AND type in (N'U'))
DROP TABLE [dbo].[UserRole]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 04/07/2013 09:47:06 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_Brand]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_Brand]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_Store]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_Store]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_Tag]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_Tag]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_User]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_Name]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_Name]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_Brand_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_Brand_Id]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_Description]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_Description]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_UpdatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_UpdatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_UpdatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_Price]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_Price]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_RecommendedReason]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_RecommendedReason]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_Favorable]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_Favorable]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_RecommendUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_RecommendUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_Status]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_Store_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_Store_Id]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_Tag_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_Tag_Id]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_FavoriteCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_FavoriteCount]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_ShareCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_ShareCount]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_InvolvedCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_InvolvedCount]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_RecommendSourceId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_RecommendSourceId]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_RecommendSourceType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_RecommendSourceType]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_SortOrder]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_SortOrder]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
DROP TABLE [dbo].[Product]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 04/07/2013 09:47:05 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comment_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comment]'))
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [FK_Comment_User]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Comment_Content]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [DF_Comment_Content]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Comment_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [DF_Comment_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Comment_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [DF_Comment_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Comment_UpdatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [DF_Comment_UpdatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Comment_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [DF_Comment_UpdatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Comment_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [DF_Comment_Status]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Comment_CommentUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [DF_Comment_CommentUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Comment_CommentSourceId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [DF_Comment_CommentSourceId]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Comment_CommentSourceType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [DF_Comment_CommentSourceType]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Comment_CommentReplyUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [DF_Comment_CommentReplyUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Comment_CommentId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [DF_Comment_CommentId]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comment]') AND type in (N'U'))
DROP TABLE [dbo].[Comment]
GO
/****** Object:  StoredProcedure [dbo].[ProductStageValidate]    Script Date: 04/07/2013 09:47:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductStageValidate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ProductStageValidate]
GO
/****** Object:  StoredProcedure [dbo].[Promotion_GetListByCoordinate]    Script Date: 04/07/2013 09:47:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Promotion_GetListByCoordinate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Promotion_GetListByCoordinate]
GO
/****** Object:  StoredProcedure [dbo].[Promotion_GetPagedListByCoordinate]    Script Date: 04/07/2013 09:47:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Promotion_GetPagedListByCoordinate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Promotion_GetPagedListByCoordinate]
GO
/****** Object:  StoredProcedure [dbo].[Promotion_GetPagedListByCoordinateAndTs]    Script Date: 04/07/2013 09:47:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Promotion_GetPagedListByCoordinateAndTs]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Promotion_GetPagedListByCoordinateAndTs]
GO
/****** Object:  StoredProcedure [dbo].[TimeSeed_CreateV2]    Script Date: 04/07/2013 09:47:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TimeSeed_CreateV2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[TimeSeed_CreateV2]
GO
/****** Object:  Table [dbo].[User]    Script Date: 04/07/2013 09:47:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Store]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Store]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_Name]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_Name]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_Password]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_Password]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_Nickname]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_Nickname]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UpdatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_UpdatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_UpdatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_LastLoginDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_LastLoginDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_Mobile]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_Mobile]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_EMail]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_EMail]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_Status]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UserLevel]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_UserLevel]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_Store_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_Store_Id]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_Region_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_Region_Id]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_Logo]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_Logo]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_Desc]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_Desc]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_Gender]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[User] DROP CONSTRAINT [DF_User_Gender]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
DROP TABLE [dbo].[User]
GO
/****** Object:  StoredProcedure [dbo].[Seed_Generate]    Script Date: 04/07/2013 09:47:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Seed_Generate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Seed_Generate]
GO
/****** Object:  StoredProcedure [dbo].[Seed_Generate4Key]    Script Date: 04/07/2013 09:47:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Seed_Generate4Key]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Seed_Generate4Key]
GO
/****** Object:  StoredProcedure [dbo].[TimeSeed_Create]    Script Date: 04/07/2013 09:47:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TimeSeed_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[TimeSeed_Create]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 04/07/2013 09:47:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Store_Group]') AND parent_object_id = OBJECT_ID(N'[dbo].[Store]'))
ALTER TABLE [dbo].[Store] DROP CONSTRAINT [FK_Store_Group]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Store_Name]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Store] DROP CONSTRAINT [DF_Store_Name]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Store_Description]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Store] DROP CONSTRAINT [DF_Store_Description]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Store_Location]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Store] DROP CONSTRAINT [DF_Store_Location]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Store_Tel]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Store] DROP CONSTRAINT [DF_Store_Tel]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Store_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Store] DROP CONSTRAINT [DF_Store_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Store_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Store] DROP CONSTRAINT [DF_Store_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Store_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Store] DROP CONSTRAINT [DF_Store_UpdatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Store_UpdatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Store] DROP CONSTRAINT [DF_Store_UpdatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Store_Longitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Store] DROP CONSTRAINT [DF_Store_Longitude]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Store_Latitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Store] DROP CONSTRAINT [DF_Store_Latitude]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Store_Group_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Store] DROP CONSTRAINT [DF_Store_Group_Id]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Store_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Store] DROP CONSTRAINT [DF_Store_Status]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Store_Region_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Store] DROP CONSTRAINT [DF_Store_Region_Id]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Store_StoreLevel]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Store] DROP CONSTRAINT [DF_Store_StoreLevel]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Store]') AND type in (N'U'))
DROP TABLE [dbo].[Store]
GO
/****** Object:  StoredProcedure [dbo].[ProductBulkDelete]    Script Date: 04/07/2013 09:47:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductBulkDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ProductBulkDelete]
GO
/****** Object:  Table [dbo].[ProductStage]    Script Date: 04/07/2013 09:47:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductStage]') AND type in (N'U'))
DROP TABLE [dbo].[ProductStage]
GO
/****** Object:  Table [dbo].[ProductUploadJob]    Script Date: 04/07/2013 09:47:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductUploadJob]') AND type in (N'U'))
DROP TABLE [dbo].[ProductUploadJob]
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 04/07/2013 09:47:07 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Promotion_Name]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Promotion] DROP CONSTRAINT [DF_Promotion_Name]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Promotion_Description]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Promotion] DROP CONSTRAINT [DF_Promotion_Description]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Promotion_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Promotion] DROP CONSTRAINT [DF_Promotion_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Promotion_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Promotion] DROP CONSTRAINT [DF_Promotion_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Promotion_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Promotion] DROP CONSTRAINT [DF_Promotion_UpdatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Promotion_UpdatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Promotion] DROP CONSTRAINT [DF_Promotion_UpdatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Promotion_StartDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Promotion] DROP CONSTRAINT [DF_Promotion_StartDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Promotion_EndDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Promotion] DROP CONSTRAINT [DF_Promotion_EndDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Promotion_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Promotion] DROP CONSTRAINT [DF_Promotion_Status]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Promotion_LikeCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Promotion] DROP CONSTRAINT [DF_Promotion_LikeCount]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Promotion_FavoriteCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Promotion] DROP CONSTRAINT [DF_Promotion_FavoriteCount]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Promotion_ShareCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Promotion] DROP CONSTRAINT [DF_Promotion_ShareCount]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Promotion_InvolvedCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Promotion] DROP CONSTRAINT [DF_Promotion_InvolvedCount]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Promotion_Store_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Promotion] DROP CONSTRAINT [DF_Promotion_Store_Id]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Promotion_RecommendUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Promotion] DROP CONSTRAINT [DF_Promotion_RecommendUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Promotion_RecommendSourceId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Promotion] DROP CONSTRAINT [DF_Promotion_RecommendSourceId]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Promotion_RecommendSourceType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Promotion] DROP CONSTRAINT [DF_Promotion_RecommendSourceType]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Promotion_Tag_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Promotion] DROP CONSTRAINT [DF_Promotion_Tag_Id]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Promotion_IsTop]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Promotion] DROP CONSTRAINT [DF_Promotion_IsTop]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Promotion_DownLimit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Promotion] DROP CONSTRAINT [DF_Promotion_DownLimit]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Promotion]') AND type in (N'U'))
DROP TABLE [dbo].[Promotion]
GO
/****** Object:  Table [dbo].[CouponHistory]    Script Date: 04/07/2013 09:47:05 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CouponHistory_CouponId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CouponHistory] DROP CONSTRAINT [DF_CouponHistory_CouponId]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CouponHistory_User_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CouponHistory] DROP CONSTRAINT [DF_CouponHistory_User_Id]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CouponHistory_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CouponHistory] DROP CONSTRAINT [DF_CouponHistory_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CouponHistory_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CouponHistory] DROP CONSTRAINT [DF_CouponHistory_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CouponHistory_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CouponHistory] DROP CONSTRAINT [DF_CouponHistory_Status]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CouponHistory_FromStore]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CouponHistory] DROP CONSTRAINT [DF_CouponHistory_FromStore]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CouponHistory_FromUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CouponHistory] DROP CONSTRAINT [DF_CouponHistory_FromUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CouponHistory_FromProduct]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CouponHistory] DROP CONSTRAINT [DF_CouponHistory_FromProduct]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CouponHistory_FromPromotion]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CouponHistory] DROP CONSTRAINT [DF_CouponHistory_FromPromotion]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CouponHistory_ValidStartDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CouponHistory] DROP CONSTRAINT [DF_CouponHistory_ValidStartDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CouponHistory_ValidEndDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CouponHistory] DROP CONSTRAINT [DF_CouponHistory_ValidEndDate]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CouponHistory]') AND type in (N'U'))
DROP TABLE [dbo].[CouponHistory]
GO
/****** Object:  Table [dbo].[DeviceLogs]    Script Date: 04/07/2013 09:47:06 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DeviceLogs_User_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DeviceLogs] DROP CONSTRAINT [DF_DeviceLogs_User_Id]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DeviceLogs_DeviceToken]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DeviceLogs] DROP CONSTRAINT [DF_DeviceLogs_DeviceToken]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DeviceLogs_Type]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DeviceLogs] DROP CONSTRAINT [DF_DeviceLogs_Type]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DeviceLogs_Longitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DeviceLogs] DROP CONSTRAINT [DF_DeviceLogs_Longitude]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DeviceLogs_Latitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DeviceLogs] DROP CONSTRAINT [DF_DeviceLogs_Latitude]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DeviceLogs_DeviceUid]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DeviceLogs] DROP CONSTRAINT [DF_DeviceLogs_DeviceUid]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DeviceLogs_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DeviceLogs] DROP CONSTRAINT [DF_DeviceLogs_Status]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DeviceLogs_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DeviceLogs] DROP CONSTRAINT [DF_DeviceLogs_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DeviceLogs_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DeviceLogs] DROP CONSTRAINT [DF_DeviceLogs_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DeviceLogs_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DeviceLogs] DROP CONSTRAINT [DF_DeviceLogs_UpdatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DeviceLogs_UpdatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DeviceLogs] DROP CONSTRAINT [DF_DeviceLogs_UpdatedUser]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeviceLogs]') AND type in (N'U'))
DROP TABLE [dbo].[DeviceLogs]
GO
/****** Object:  Table [dbo].[DeviceToken]    Script Date: 04/07/2013 09:47:06 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DeviceToken_User_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DeviceToken] DROP CONSTRAINT [DF_DeviceToken_User_Id]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DeviceToken_Token]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DeviceToken] DROP CONSTRAINT [DF_DeviceToken_Token]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DeviceToken_Type]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DeviceToken] DROP CONSTRAINT [DF_DeviceToken_Type]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DeviceToken_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DeviceToken] DROP CONSTRAINT [DF_DeviceToken_Status]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DeviceToken_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DeviceToken] DROP CONSTRAINT [DF_DeviceToken_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DeviceToken_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DeviceToken] DROP CONSTRAINT [DF_DeviceToken_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DeviceToken_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DeviceToken] DROP CONSTRAINT [DF_DeviceToken_UpdatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DeviceToken_UpdatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DeviceToken] DROP CONSTRAINT [DF_DeviceToken_UpdatedUser]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeviceToken]') AND type in (N'U'))
DROP TABLE [dbo].[DeviceToken]
GO
/****** Object:  Table [dbo].[Favorite]    Script Date: 04/07/2013 09:47:06 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Favorite_FavoriteSourceId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Favorite] DROP CONSTRAINT [DF_Favorite_FavoriteSourceId]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Favorite_FavoriteSourceType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Favorite] DROP CONSTRAINT [DF_Favorite_FavoriteSourceType]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Favorite_User_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Favorite] DROP CONSTRAINT [DF_Favorite_User_Id]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Favorite_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Favorite] DROP CONSTRAINT [DF_Favorite_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Favorite_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Favorite] DROP CONSTRAINT [DF_Favorite_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Favorite_Description]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Favorite] DROP CONSTRAINT [DF_Favorite_Description]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Favorite_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Favorite] DROP CONSTRAINT [DF_Favorite_Status]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Favorite_Store_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Favorite] DROP CONSTRAINT [DF_Favorite_Store_Id]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Favorite]') AND type in (N'U'))
DROP TABLE [dbo].[Favorite]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 04/07/2013 09:47:06 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Feedback_Content]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Feedback] DROP CONSTRAINT [DF_Feedback_Content]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Feedback_Contact]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Feedback] DROP CONSTRAINT [DF_Feedback_Contact]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Feedback_User_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Feedback] DROP CONSTRAINT [DF_Feedback_User_Id]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Feedback_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Feedback] DROP CONSTRAINT [DF_Feedback_Status]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Feedback_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Feedback] DROP CONSTRAINT [DF_Feedback_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Feedback_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Feedback] DROP CONSTRAINT [DF_Feedback_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Feedback_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Feedback] DROP CONSTRAINT [DF_Feedback_UpdatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Feedback_UpdatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Feedback] DROP CONSTRAINT [DF_Feedback_UpdatedUser]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Feedback]') AND type in (N'U'))
DROP TABLE [dbo].[Feedback]
GO
/****** Object:  UserDefinedFunction [dbo].[FGetDistance]    Script Date: 04/07/2013 09:47:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FGetDistance]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[FGetDistance]
GO
/****** Object:  UserDefinedFunction [dbo].[FInt2String]    Script Date: 04/07/2013 09:47:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FInt2String]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[FInt2String]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ParseDelimString]    Script Date: 04/07/2013 09:47:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_ParseDelimString]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_ParseDelimString]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 04/07/2013 09:47:06 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Group_Name]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Group] DROP CONSTRAINT [DF_Group_Name]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Group_Description]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Group] DROP CONSTRAINT [DF_Group_Description]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Group_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Group] DROP CONSTRAINT [DF_Group_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Group_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Group] DROP CONSTRAINT [DF_Group_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Group_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Group] DROP CONSTRAINT [DF_Group_UpdatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Group_UpdatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Group] DROP CONSTRAINT [DF_Group_UpdatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Group_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Group] DROP CONSTRAINT [DF_Group_Status]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Group]') AND type in (N'U'))
DROP TABLE [dbo].[Group]
GO
/****** Object:  Table [dbo].[Like]    Script Date: 04/07/2013 09:47:06 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Like_LikeUserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Like] DROP CONSTRAINT [DF_Like_LikeUserId]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Like_LikedUserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Like] DROP CONSTRAINT [DF_Like_LikedUserId]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Like_Type]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Like] DROP CONSTRAINT [DF_Like_Type]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Like_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Like] DROP CONSTRAINT [DF_Like_Status]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Like_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Like] DROP CONSTRAINT [DF_Like_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Like_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Like] DROP CONSTRAINT [DF_Like_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Like_UpdatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Like] DROP CONSTRAINT [DF_Like_UpdatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Like_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Like] DROP CONSTRAINT [DF_Like_UpdatedDate]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Like]') AND type in (N'U'))
DROP TABLE [dbo].[Like]
GO
/****** Object:  Table [dbo].[NotificationLog]    Script Date: 04/07/2013 09:47:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NotificationLog]') AND type in (N'U'))
DROP TABLE [dbo].[NotificationLog]
GO
/****** Object:  Table [dbo].[OutsiteUser]    Script Date: 04/07/2013 09:47:06 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_OutsiteUser_LinkedUserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OutsiteUser] DROP CONSTRAINT [DF_OutsiteUser_LinkedUserId]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_OutsiteUser_OutsiteUserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OutsiteUser] DROP CONSTRAINT [DF_OutsiteUser_OutsiteUserId]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_OutsiteUser_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OutsiteUser] DROP CONSTRAINT [DF_OutsiteUser_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_OutsiteUser_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OutsiteUser] DROP CONSTRAINT [DF_OutsiteUser_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_OutsiteUser_LastLoginDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OutsiteUser] DROP CONSTRAINT [DF_OutsiteUser_LastLoginDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_OutsiteUser_Description]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OutsiteUser] DROP CONSTRAINT [DF_OutsiteUser_Description]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_OutsiteUser_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OutsiteUser] DROP CONSTRAINT [DF_OutsiteUser_Status]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_OutsiteUser_OutsiteType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OutsiteUser] DROP CONSTRAINT [DF_OutsiteUser_OutsiteType]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OutsiteUser]') AND type in (N'U'))
DROP TABLE [dbo].[OutsiteUser]
GO
/****** Object:  Table [dbo].[PointHistory]    Script Date: 04/07/2013 09:47:06 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PointHistory_User_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PointHistory] DROP CONSTRAINT [DF_PointHistory_User_Id]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PointHistory_Amount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PointHistory] DROP CONSTRAINT [DF_PointHistory_Amount]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PointHistory_Type]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PointHistory] DROP CONSTRAINT [DF_PointHistory_Type]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PointHistory_Name]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PointHistory] DROP CONSTRAINT [DF_PointHistory_Name]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PointHistory_Description]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PointHistory] DROP CONSTRAINT [DF_PointHistory_Description]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PointHistory_FromStore]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PointHistory] DROP CONSTRAINT [DF_PointHistory_FromStore]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PointHistory_FromStoreDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PointHistory] DROP CONSTRAINT [DF_PointHistory_FromStoreDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PointHistory_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PointHistory] DROP CONSTRAINT [DF_PointHistory_Status]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PointHistory_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PointHistory] DROP CONSTRAINT [DF_PointHistory_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PointHistory_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PointHistory] DROP CONSTRAINT [DF_PointHistory_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PointHistory_UpdatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PointHistory] DROP CONSTRAINT [DF_PointHistory_UpdatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PointHistory_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PointHistory] DROP CONSTRAINT [DF_PointHistory_UpdatedDate]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PointHistory]') AND type in (N'U'))
DROP TABLE [dbo].[PointHistory]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 04/07/2013 09:47:08 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Tag_Name]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Tag] DROP CONSTRAINT [DF_Tag_Name]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Tag_Description]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Tag] DROP CONSTRAINT [DF_Tag_Description]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Tag_SortOrder]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Tag] DROP CONSTRAINT [DF_Tag_SortOrder]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Tag_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Tag] DROP CONSTRAINT [DF_Tag_Status]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Tag_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Tag] DROP CONSTRAINT [DF_Tag_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Tag_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Tag] DROP CONSTRAINT [DF_Tag_UpdatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Tag_UpdatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Tag] DROP CONSTRAINT [DF_Tag_UpdatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Tag_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Tag] DROP CONSTRAINT [DF_Tag_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tag]') AND type in (N'U'))
DROP TABLE [dbo].[Tag]
GO
/****** Object:  Table [dbo].[TimeSeed]    Script Date: 04/07/2013 09:47:08 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TimeSeed_Year]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TimeSeed] DROP CONSTRAINT [DF_TimeSeed_Year]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TimeSeed_Month]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TimeSeed] DROP CONSTRAINT [DF_TimeSeed_Month]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TimeSeed_Day]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TimeSeed] DROP CONSTRAINT [DF_TimeSeed_Day]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TimeSeed_Hour]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TimeSeed] DROP CONSTRAINT [DF_TimeSeed_Hour]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TimeSeed_Seed]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TimeSeed] DROP CONSTRAINT [DF_TimeSeed_Seed]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TimeSeed_KeySeed]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TimeSeed] DROP CONSTRAINT [DF_TimeSeed_KeySeed]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TimeSeed_Date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TimeSeed] DROP CONSTRAINT [DF_TimeSeed_Date]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TimeSeed_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TimeSeed] DROP CONSTRAINT [DF_TimeSeed_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TimeSeed]') AND type in (N'U'))
DROP TABLE [dbo].[TimeSeed]
GO
/****** Object:  Table [dbo].[Promotion2Product]    Script Date: 04/07/2013 09:47:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Promotion2Product]') AND type in (N'U'))
DROP TABLE [dbo].[Promotion2Product]
GO
/****** Object:  Table [dbo].[PromotionBrandRelations]    Script Date: 04/07/2013 09:47:07 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PromotionBrandRelations_Promotion_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PromotionBrandRelations] DROP CONSTRAINT [DF_PromotionBrandRelations_Promotion_Id]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PromotionBrandRelations_Brand_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PromotionBrandRelations] DROP CONSTRAINT [DF_PromotionBrandRelations_Brand_Id]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PromotionBrandRelations_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PromotionBrandRelations] DROP CONSTRAINT [DF_PromotionBrandRelations_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PromotionBrandRelations]') AND type in (N'U'))
DROP TABLE [dbo].[PromotionBrandRelations]
GO
/****** Object:  Table [dbo].[Remind]    Script Date: 04/07/2013 09:47:07 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Remind_Type]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Remind] DROP CONSTRAINT [DF_Remind_Type]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Remind_IsRemind]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Remind] DROP CONSTRAINT [DF_Remind_IsRemind]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Remind_Stauts]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Remind] DROP CONSTRAINT [DF_Remind_Stauts]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Remind_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Remind] DROP CONSTRAINT [DF_Remind_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Remind_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Remind] DROP CONSTRAINT [DF_Remind_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Remind_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Remind] DROP CONSTRAINT [DF_Remind_UpdatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Remind_UpdatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Remind] DROP CONSTRAINT [DF_Remind_UpdatedUser]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Remind]') AND type in (N'U'))
DROP TABLE [dbo].[Remind]
GO
/****** Object:  Table [dbo].[Resources]    Script Date: 04/07/2013 09:47:07 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Resources_ResourceSourceId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Resources] DROP CONSTRAINT [DF_Resources_ResourceSourceId]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Resources_ResouceSourceType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Resources] DROP CONSTRAINT [DF_Resources_ResouceSourceType]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Resources_Resource]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Resources] DROP CONSTRAINT [DF_Resources_Resource]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Resources_Domain]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Resources] DROP CONSTRAINT [DF_Resources_Domain]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Resources_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Resources] DROP CONSTRAINT [DF_Resources_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Resources_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Resources] DROP CONSTRAINT [DF_Resources_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Resources_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Resources] DROP CONSTRAINT [DF_Resources_UpdatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Resources_UpdatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Resources] DROP CONSTRAINT [DF_Resources_UpdatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Resources_IsDefault]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Resources] DROP CONSTRAINT [DF_Resources_IsDefault]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Resources_SortOrder]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Resources] DROP CONSTRAINT [DF_Resources_SortOrder]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Resources_Type]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Resources] DROP CONSTRAINT [DF_Resources_Type]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Resources_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Resources] DROP CONSTRAINT [DF_Resources_Status]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Resources_Size]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Resources] DROP CONSTRAINT [DF_Resources_Size]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Resources_Width]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Resources] DROP CONSTRAINT [DF_Resources_Width]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Resources_Height]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Resources] DROP CONSTRAINT [DF_Resources_Height]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Resources_Length]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Resources] DROP CONSTRAINT [DF_Resources_Length]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Resources_ExtName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Resources] DROP CONSTRAINT [DF_Resources_ExtName]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Resources]') AND type in (N'U'))
DROP TABLE [dbo].[Resources]
GO
/****** Object:  Table [dbo].[ResourceStage]    Script Date: 04/07/2013 09:47:07 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ResourceStage_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ResourceStage] DROP CONSTRAINT [DF_ResourceStage_Status]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ResourceStage]') AND type in (N'U'))
DROP TABLE [dbo].[ResourceStage]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 04/07/2013 09:47:07 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_Name]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Role] DROP CONSTRAINT [DF_Role_Name]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_Description]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Role] DROP CONSTRAINT [DF_Role_Description]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Role] DROP CONSTRAINT [DF_Role_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Role] DROP CONSTRAINT [DF_Role_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Role] DROP CONSTRAINT [DF_Role_Status]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_Val]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Role] DROP CONSTRAINT [DF_Role_Val]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Role]') AND type in (N'U'))
DROP TABLE [dbo].[Role]
GO
/****** Object:  Table [dbo].[Seed]    Script Date: 04/07/2013 09:47:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Seed]') AND type in (N'U'))
DROP TABLE [dbo].[Seed]
GO
/****** Object:  Table [dbo].[VerifyCode]    Script Date: 04/07/2013 09:47:08 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_VerifyCode_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VerifyCode] DROP CONSTRAINT [DF_VerifyCode_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_VerifyCode_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VerifyCode] DROP CONSTRAINT [DF_VerifyCode_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_VerifyCode_Code]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VerifyCode] DROP CONSTRAINT [DF_VerifyCode_Code]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_VerifyCode_Type]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VerifyCode] DROP CONSTRAINT [DF_VerifyCode_Type]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_VerifyCode_TryCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VerifyCode] DROP CONSTRAINT [DF_VerifyCode_TryCount]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_VerifyCode_User_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VerifyCode] DROP CONSTRAINT [DF_VerifyCode_User_Id]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_VerifyCode_VerifyMode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VerifyCode] DROP CONSTRAINT [DF_VerifyCode_VerifyMode]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_VerifyCode_VerifySource]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VerifyCode] DROP CONSTRAINT [DF_VerifyCode_VerifySource]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_VerifyCode_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VerifyCode] DROP CONSTRAINT [DF_VerifyCode_Status]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VerifyCode]') AND type in (N'U'))
DROP TABLE [dbo].[VerifyCode]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 04/07/2013 09:47:05 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Brand_Name]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Brand] DROP CONSTRAINT [DF_Brand_Name]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Brand_EnglishName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Brand] DROP CONSTRAINT [DF_Brand_EnglishName]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Brand_Description]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Brand] DROP CONSTRAINT [DF_Brand_Description]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Brand_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Brand] DROP CONSTRAINT [DF_Brand_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Brand_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Brand] DROP CONSTRAINT [DF_Brand_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Brand_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Brand] DROP CONSTRAINT [DF_Brand_UpdatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Brand_UpdatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Brand] DROP CONSTRAINT [DF_Brand_UpdatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Brand_Logo]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Brand] DROP CONSTRAINT [DF_Brand_Logo]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Brand_WebSite]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Brand] DROP CONSTRAINT [DF_Brand_WebSite]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Brand_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Brand] DROP CONSTRAINT [DF_Brand_Status]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Brand_Group]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Brand] DROP CONSTRAINT [DF_Brand_Group]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Brand]') AND type in (N'U'))
DROP TABLE [dbo].[Brand]
GO
/****** Object:  Table [dbo].[ShareHistory]    Script Date: 04/07/2013 09:47:07 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ShareHistory_SourceId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShareHistory] DROP CONSTRAINT [DF_ShareHistory_SourceId]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ShareHistory_SourceType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShareHistory] DROP CONSTRAINT [DF_ShareHistory_SourceType]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ShareHistory_Name]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShareHistory] DROP CONSTRAINT [DF_ShareHistory_Name]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ShareHistory_Description]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShareHistory] DROP CONSTRAINT [DF_ShareHistory_Description]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ShareHistory_Type]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShareHistory] DROP CONSTRAINT [DF_ShareHistory_Type]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ShareHistory_ShareTo]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShareHistory] DROP CONSTRAINT [DF_ShareHistory_ShareTo]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ShareHistory_Stauts]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShareHistory] DROP CONSTRAINT [DF_ShareHistory_Stauts]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ShareHistory_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShareHistory] DROP CONSTRAINT [DF_ShareHistory_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ShareHistory_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShareHistory] DROP CONSTRAINT [DF_ShareHistory_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ShareHistory_UpdatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShareHistory] DROP CONSTRAINT [DF_ShareHistory_UpdatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ShareHistory_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShareHistory] DROP CONSTRAINT [DF_ShareHistory_UpdatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ShareHistory_User_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShareHistory] DROP CONSTRAINT [DF_ShareHistory_User_Id]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShareHistory]') AND type in (N'U'))
DROP TABLE [dbo].[ShareHistory]
GO
/****** Object:  Table [dbo].[SpecialTopic]    Script Date: 04/07/2013 09:47:07 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SpecialTopic_Name]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SpecialTopic] DROP CONSTRAINT [DF_SpecialTopic_Name]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SpecialTopic_Description]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SpecialTopic] DROP CONSTRAINT [DF_SpecialTopic_Description]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SpecialTopic_Type]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SpecialTopic] DROP CONSTRAINT [DF_SpecialTopic_Type]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SpecialTopic_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SpecialTopic] DROP CONSTRAINT [DF_SpecialTopic_Status]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SpecialTopic_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SpecialTopic] DROP CONSTRAINT [DF_SpecialTopic_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SpecialTopic_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SpecialTopic] DROP CONSTRAINT [DF_SpecialTopic_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SpecialTopic_UpdatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SpecialTopic] DROP CONSTRAINT [DF_SpecialTopic_UpdatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SpecialTopic_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SpecialTopic] DROP CONSTRAINT [DF_SpecialTopic_UpdatedDate]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SpecialTopic]') AND type in (N'U'))
DROP TABLE [dbo].[SpecialTopic]
GO
/****** Object:  Table [dbo].[SpecialTopicProductRelations]    Script Date: 04/07/2013 09:47:07 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SpecialTopicProductRelations_SpecialTopic_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SpecialTopicProductRelations] DROP CONSTRAINT [DF_SpecialTopicProductRelations_SpecialTopic_Id]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SpecialTopicProductRelations_Product_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SpecialTopicProductRelations] DROP CONSTRAINT [DF_SpecialTopicProductRelations_Product_Id]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SpecialTopicProductRelations_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SpecialTopicProductRelations] DROP CONSTRAINT [DF_SpecialTopicProductRelations_Status]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SpecialTopicProductRelations_CreatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SpecialTopicProductRelations] DROP CONSTRAINT [DF_SpecialTopicProductRelations_CreatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SpecialTopicProductRelations_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SpecialTopicProductRelations] DROP CONSTRAINT [DF_SpecialTopicProductRelations_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SpecialTopicProductRelations_UpdatedUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SpecialTopicProductRelations] DROP CONSTRAINT [DF_SpecialTopicProductRelations_UpdatedUser]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SpecialTopicProductRelations_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SpecialTopicProductRelations] DROP CONSTRAINT [DF_SpecialTopicProductRelations_UpdatedDate]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SpecialTopicProductRelations]') AND type in (N'U'))
DROP TABLE [dbo].[SpecialTopicProductRelations]
GO
/****** Object:  Table [dbo].[SpecialTopicProductRelations]    Script Date: 04/07/2013 09:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SpecialTopicProductRelations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SpecialTopicProductRelations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SpecialTopic_Id] [int] NOT NULL CONSTRAINT [DF_SpecialTopicProductRelations_SpecialTopic_Id]  DEFAULT ((0)),
	[Product_Id] [int] NOT NULL CONSTRAINT [DF_SpecialTopicProductRelations_Product_Id]  DEFAULT ((0)),
	[Status] [int] NOT NULL CONSTRAINT [DF_SpecialTopicProductRelations_Status]  DEFAULT ((1)),
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_SpecialTopicProductRelations_CreatedUser]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_SpecialTopicProductRelations_CreatedDate]  DEFAULT (getdate()),
	[UpdatedUser] [int] NOT NULL CONSTRAINT [DF_SpecialTopicProductRelations_UpdatedUser]  DEFAULT ((0)),
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_SpecialTopicProductRelations_UpdatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_SpecialTopicProductRelations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SpecialTopicProductRelations]') AND name = N'IX_SpecialTopicProductRelations_StId_Include_Status')
CREATE NONCLUSTERED INDEX [IX_SpecialTopicProductRelations_StId_Include_Status] ON [dbo].[SpecialTopicProductRelations] 
(
	[SpecialTopic_Id] ASC
)
INCLUDE ( [Status]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpecialTopic]    Script Date: 04/07/2013 09:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SpecialTopic]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SpecialTopic](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](32) NOT NULL CONSTRAINT [DF_SpecialTopic_Name]  DEFAULT (''),
	[Description] [nvarchar](max) NOT NULL CONSTRAINT [DF_SpecialTopic_Description]  DEFAULT (''),
	[Type] [int] NOT NULL CONSTRAINT [DF_SpecialTopic_Type]  DEFAULT ((0)),
	[Status] [int] NOT NULL CONSTRAINT [DF_SpecialTopic_Status]  DEFAULT ((1)),
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_SpecialTopic_CreatedUser]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_SpecialTopic_CreatedDate]  DEFAULT (getdate()),
	[UpdatedUser] [int] NOT NULL CONSTRAINT [DF_SpecialTopic_UpdatedUser]  DEFAULT ((0)),
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_SpecialTopic_UpdatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_SpecialTopic] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ShareHistory]    Script Date: 04/07/2013 09:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShareHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ShareHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SourceId] [int] NOT NULL CONSTRAINT [DF_ShareHistory_SourceId]  DEFAULT ((0)),
	[SourceType] [int] NOT NULL CONSTRAINT [DF_ShareHistory_SourceType]  DEFAULT ((0)),
	[Name] [nvarchar](64) NOT NULL CONSTRAINT [DF_ShareHistory_Name]  DEFAULT (''),
	[Description] [nvarchar](max) NOT NULL CONSTRAINT [DF_ShareHistory_Description]  DEFAULT (''),
	[Type] [int] NOT NULL CONSTRAINT [DF_ShareHistory_Type]  DEFAULT ((0)),
	[ShareTo] [int] NOT NULL CONSTRAINT [DF_ShareHistory_ShareTo]  DEFAULT ((0)),
	[Stauts] [int] NOT NULL CONSTRAINT [DF_ShareHistory_Stauts]  DEFAULT ((1)),
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_ShareHistory_CreatedUser]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_ShareHistory_CreatedDate]  DEFAULT (getdate()),
	[UpdatedUser] [int] NOT NULL CONSTRAINT [DF_ShareHistory_UpdatedUser]  DEFAULT ((0)),
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_ShareHistory_UpdatedDate]  DEFAULT (getdate()),
	[User_Id] [int] NOT NULL CONSTRAINT [DF_ShareHistory_User_Id]  DEFAULT ((0)),
 CONSTRAINT [PK_ShareHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ShareHistory', N'COLUMN',N'Type'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0默认，1分享到站外' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShareHistory', @level2type=N'COLUMN',@level2name=N'Type'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ShareHistory', N'COLUMN',N'ShareTo'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1新浪微博 2腾讯 3微信' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShareHistory', @level2type=N'COLUMN',@level2name=N'ShareTo'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ShareHistory', N'COLUMN',N'Stauts'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 1 -1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShareHistory', @level2type=N'COLUMN',@level2name=N'Stauts'
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 04/07/2013 09:47:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Brand]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1000000,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL CONSTRAINT [DF_Brand_Name]  DEFAULT (''),
	[EnglishName] [varchar](512) NOT NULL CONSTRAINT [DF_Brand_EnglishName]  DEFAULT (''),
	[Description] [nvarchar](max) NOT NULL CONSTRAINT [DF_Brand_Description]  DEFAULT (''),
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_Brand_CreatedUser]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Brand_CreatedDate]  DEFAULT (getdate()),
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_Brand_UpdatedDate]  DEFAULT (getdate()),
	[UpdatedUser] [int] NOT NULL CONSTRAINT [DF_Brand_UpdatedUser]  DEFAULT ((0)),
	[Logo] [varchar](512) NOT NULL CONSTRAINT [DF_Brand_Logo]  DEFAULT (''),
	[WebSite] [varchar](1024) NOT NULL CONSTRAINT [DF_Brand_WebSite]  DEFAULT (''),
	[Status] [int] NOT NULL CONSTRAINT [DF_Brand_Status]  DEFAULT ((1)),
	[Group] [char](1) NOT NULL CONSTRAINT [DF_Brand_Group]  DEFAULT (''),
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Brand', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:默?,1:正常,-1??除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Brand', @level2type=N'COLUMN',@level2name=N'Status'
GO
/****** Object:  Table [dbo].[VerifyCode]    Script Date: 04/07/2013 09:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VerifyCode]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VerifyCode](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_VerifyCode_CreatedUser]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_VerifyCode_CreatedDate]  DEFAULT (getdate()),
	[Code] [varchar](64) NOT NULL CONSTRAINT [DF_VerifyCode_Code]  DEFAULT (''),
	[Type] [int] NOT NULL CONSTRAINT [DF_VerifyCode_Type]  DEFAULT ((0)),
	[TryCount] [int] NOT NULL CONSTRAINT [DF_VerifyCode_TryCount]  DEFAULT ((0)),
	[User_Id] [int] NOT NULL CONSTRAINT [DF_VerifyCode_User_Id]  DEFAULT ((0)),
	[VerifyMode] [int] NOT NULL CONSTRAINT [DF_VerifyCode_VerifyMode]  DEFAULT ((0)),
	[VerifySource] [varchar](128) NOT NULL CONSTRAINT [DF_VerifyCode_VerifySource]  DEFAULT (''),
	[Status] [int] NOT NULL CONSTRAINT [DF_VerifyCode_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_VerifyCode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[VerifyCode]') AND name = N'IX_VerifyCode_UserId_Source_Mode_Code_Type')
CREATE UNIQUE NONCLUSTERED INDEX [IX_VerifyCode_UserId_Source_Mode_Code_Type] ON [dbo].[VerifyCode] 
(
	[User_Id] ASC,
	[VerifySource] ASC,
	[VerifyMode] ASC,
	[Code] ASC,
	[Type] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'VerifyCode', N'COLUMN',N'Code'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'验证码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VerifyCode', @level2type=N'COLUMN',@level2name=N'Code'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'VerifyCode', N'COLUMN',N'Type'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'业务类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VerifyCode', @level2type=N'COLUMN',@level2name=N'Type'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'VerifyCode', N'COLUMN',N'TryCount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'验证次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VerifyCode', @level2type=N'COLUMN',@level2name=N'TryCount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'VerifyCode', N'COLUMN',N'VerifyMode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 手机验证 2 邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VerifyCode', @level2type=N'COLUMN',@level2name=N'VerifyMode'
GO
/****** Object:  Table [dbo].[Seed]    Script Date: 04/07/2013 09:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Seed]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Seed](
	[Name] [varchar](32) NOT NULL,
	[Id] [int] NULL,
	[Value] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Seed]') AND name = N'IX_Seed_Name_Id')
CREATE UNIQUE NONCLUSTERED INDEX [IX_Seed_Name_Id] ON [dbo].[Seed] 
(
	[Name] ASC,
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 04/07/2013 09:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Role]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](32) NOT NULL CONSTRAINT [DF_Role_Name]  DEFAULT (''),
	[Description] [nvarchar](max) NOT NULL CONSTRAINT [DF_Role_Description]  DEFAULT (''),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Role_CreatedDate]  DEFAULT (getdate()),
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_Role_CreatedUser]  DEFAULT ((0)),
	[Status] [int] NOT NULL CONSTRAINT [DF_Role_Status]  DEFAULT ((1)),
	[Val] [int] NOT NULL CONSTRAINT [DF_Role_Val]  DEFAULT ((0)),
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Role]') AND name = N'IX_Role_Name')
CREATE UNIQUE NONCLUSTERED INDEX [IX_Role_Name] ON [dbo].[Role] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResourceStage]    Script Date: 04/07/2013 09:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ResourceStage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ResourceStage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
	[ExtName] [varchar](16) NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[ContentSize] [int] NULL,
	[Size] [varchar](64) NULL,
	[SortOrder] [int] NULL,
	[InUser] [int] NULL,
	[ItemCode] [varchar](64) NULL,
	[InDate] [datetime] NULL,
	[Status] [int] NOT NULL CONSTRAINT [DF_ResourceStage_Status]  DEFAULT ((0)),
	[UploadGroupId] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Resources]    Script Date: 04/07/2013 09:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Resources]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Resources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SourceId] [int] NOT NULL CONSTRAINT [DF_Resources_ResourceSourceId]  DEFAULT ((0)),
	[SourceType] [int] NOT NULL CONSTRAINT [DF_Resources_ResouceSourceType]  DEFAULT ((0)),
	[Name] [varchar](1024) NOT NULL CONSTRAINT [DF_Resources_Resource]  DEFAULT (''),
	[Domain] [varchar](1024) NOT NULL CONSTRAINT [DF_Resources_Domain]  DEFAULT (''),
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_Resources_CreatedUser]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Resources_CreatedDate]  DEFAULT (getdate()),
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_Resources_UpdatedDate]  DEFAULT (getdate()),
	[UpdatedUser] [int] NOT NULL CONSTRAINT [DF_Resources_UpdatedUser]  DEFAULT ((0)),
	[IsDefault] [bit] NOT NULL CONSTRAINT [DF_Resources_IsDefault]  DEFAULT ((0)),
	[SortOrder] [int] NOT NULL CONSTRAINT [DF_Resources_SortOrder]  DEFAULT ((0)),
	[Type] [int] NOT NULL CONSTRAINT [DF_Resources_Type]  DEFAULT ((0)),
	[Status] [int] NOT NULL CONSTRAINT [DF_Resources_Status]  DEFAULT ((0)),
	[Size] [varchar](64) NOT NULL CONSTRAINT [DF_Resources_Size]  DEFAULT (''),
	[Width] [int] NOT NULL CONSTRAINT [DF_Resources_Width]  DEFAULT ((0)),
	[Height] [int] NOT NULL CONSTRAINT [DF_Resources_Height]  DEFAULT ((0)),
	[ContentSize] [int] NOT NULL CONSTRAINT [DF_Resources_Length]  DEFAULT ((0)),
	[ExtName] [varchar](16) NOT NULL CONSTRAINT [DF_Resources_ExtName]  DEFAULT (''),
 CONSTRAINT [PK_Resources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Resources]') AND name = N'IX_Resources_SourceType_SourceId_Include_Status')
CREATE NONCLUSTERED INDEX [IX_Resources_SourceType_SourceId_Include_Status] ON [dbo].[Resources] 
(
	[SourceType] ASC,
	[SourceId] ASC
)
INCLUDE ( [Status]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Resources]') AND name = N'IX_Resources_SourceType_SourceId_Include_Status_SortOrder')
CREATE NONCLUSTERED INDEX [IX_Resources_SourceType_SourceId_Include_Status_SortOrder] ON [dbo].[Resources] 
(
	[SourceType] ASC,
	[SourceId] ASC
)
INCLUDE ( [Status],
[SortOrder]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Resources', N'COLUMN',N'SourceType'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'?源?源?型 0:默? 1.?品 2:促?3.用??像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources', @level2type=N'COLUMN',@level2name=N'SourceType'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Resources', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:默?,1:正常,-1??除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources', @level2type=N'COLUMN',@level2name=N'Status'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Resources', N'COLUMN',N'ContentSize'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大小' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resources', @level2type=N'COLUMN',@level2name=N'ContentSize'
GO
/****** Object:  Table [dbo].[Remind]    Script Date: 04/07/2013 09:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Remind]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Remind](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[RemindUser] [int] NOT NULL,
	[Type] [int] NOT NULL CONSTRAINT [DF_Remind_Type]  DEFAULT ((0)),
	[SourceId] [int] NOT NULL,
	[IsRemind] [bit] NOT NULL CONSTRAINT [DF_Remind_IsRemind]  DEFAULT ((0)),
	[Stauts] [int] NOT NULL CONSTRAINT [DF_Remind_Stauts]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Remind_CreatedDate]  DEFAULT (getdate()),
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_Remind_CreatedUser]  DEFAULT ((0)),
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_Remind_UpdatedDate]  DEFAULT (getdate()),
	[UpdatedUser] [int] NOT NULL CONSTRAINT [DF_Remind_UpdatedUser]  DEFAULT ((0)),
 CONSTRAINT [PK_Remind] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Remind', N'COLUMN',N'Type'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 default 1 评论 2收藏 3分享 4消费' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Remind', @level2type=N'COLUMN',@level2name=N'Type'
GO
/****** Object:  Table [dbo].[PromotionBrandRelations]    Script Date: 04/07/2013 09:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PromotionBrandRelations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PromotionBrandRelations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Promotion_Id] [int] NOT NULL CONSTRAINT [DF_PromotionBrandRelations_Promotion_Id]  DEFAULT ((0)),
	[Brand_Id] [int] NOT NULL CONSTRAINT [DF_PromotionBrandRelations_Brand_Id]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_PromotionBrandRelations_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_PromotionBrandRelations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PromotionBrandRelations]') AND name = N'IX_PromotionBrandRelations_PromotionId')
CREATE NONCLUSTERED INDEX [IX_PromotionBrandRelations_PromotionId] ON [dbo].[PromotionBrandRelations] 
(
	[Promotion_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotion2Product]    Script Date: 04/07/2013 09:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Promotion2Product]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Promotion2Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProdId] [int] NULL,
	[ProId] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Promotion2Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TimeSeed]    Script Date: 04/07/2013 09:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TimeSeed]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TimeSeed](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NOT NULL CONSTRAINT [DF_TimeSeed_Year]  DEFAULT ((0)),
	[Month] [int] NOT NULL CONSTRAINT [DF_TimeSeed_Month]  DEFAULT ((0)),
	[Day] [int] NOT NULL CONSTRAINT [DF_TimeSeed_Day]  DEFAULT ((0)),
	[Hour] [int] NOT NULL CONSTRAINT [DF_TimeSeed_Hour]  DEFAULT ((0)),
	[Seed] [int] NOT NULL CONSTRAINT [DF_TimeSeed_Seed]  DEFAULT ((0)),
	[KeySeed] [varchar](32) NOT NULL CONSTRAINT [DF_TimeSeed_KeySeed]  DEFAULT (''),
	[Date] [datetime] NOT NULL CONSTRAINT [DF_TimeSeed_Date]  DEFAULT (getdate()),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_TimeSeed_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_TimeSeed] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[TimeSeed]') AND name = N'IX_TimeSeed_Year_Month_Day_Seed')
CREATE NONCLUSTERED INDEX [IX_TimeSeed_Year_Month_Day_Seed] ON [dbo].[TimeSeed] 
(
	[Year] ASC,
	[Month] ASC,
	[Day] ASC,
	[Seed] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'TimeSeed', N'COLUMN',N'Seed'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'种子' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TimeSeed', @level2type=N'COLUMN',@level2name=N'Seed'
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 04/07/2013 09:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tag]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tag](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL CONSTRAINT [DF_Tag_Name]  DEFAULT (''),
	[Description] [nvarchar](max) NOT NULL CONSTRAINT [DF_Tag_Description]  DEFAULT (''),
	[SortOrder] [int] NOT NULL CONSTRAINT [DF_Tag_SortOrder]  DEFAULT ((0)),
	[Status] [int] NOT NULL CONSTRAINT [DF_Tag_Status]  DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Tag_CreatedDate]  DEFAULT (getdate()),
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_Tag_UpdatedDate]  DEFAULT (getdate()),
	[UpdatedUser] [int] NOT NULL CONSTRAINT [DF_Tag_UpdatedUser]  DEFAULT ((0)),
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_Tag_CreatedUser]  DEFAULT ((0)),
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Tag', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:默?,1:正常,-1??除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag', @level2type=N'COLUMN',@level2name=N'Status'
GO
/****** Object:  Table [dbo].[PointHistory]    Script Date: 04/07/2013 09:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PointHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PointHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL CONSTRAINT [DF_PointHistory_User_Id]  DEFAULT ((0)),
	[Amount] [decimal](18, 2) NOT NULL CONSTRAINT [DF_PointHistory_Amount]  DEFAULT ((0)),
	[Type] [int] NOT NULL CONSTRAINT [DF_PointHistory_Type]  DEFAULT (''),
	[Name] [nvarchar](32) NOT NULL CONSTRAINT [DF_PointHistory_Name]  DEFAULT (''),
	[Description] [nvarchar](max) NOT NULL CONSTRAINT [DF_PointHistory_Description]  DEFAULT (''),
	[PointSourceId] [int] NOT NULL CONSTRAINT [DF_PointHistory_FromStore]  DEFAULT ((0)),
	[PointSourceType] [int] NOT NULL CONSTRAINT [DF_PointHistory_FromStoreDate]  DEFAULT ((0)),
	[Status] [int] NOT NULL CONSTRAINT [DF_PointHistory_Status]  DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_PointHistory_CreatedDate]  DEFAULT (getdate()),
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_PointHistory_CreatedUser]  DEFAULT ((0)),
	[UpdatedUser] [int] NOT NULL CONSTRAINT [DF_PointHistory_UpdatedUser]  DEFAULT ((0)),
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_PointHistory_UpdatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_PointHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PointHistory', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:默?,1:正常,-1??除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PointHistory', @level2type=N'COLUMN',@level2name=N'Status'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PointHistory', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'?分?史' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PointHistory'
GO
/****** Object:  Table [dbo].[OutsiteUser]    Script Date: 04/07/2013 09:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OutsiteUser]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OutsiteUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AssociateUserId] [int] NOT NULL CONSTRAINT [DF_OutsiteUser_LinkedUserId]  DEFAULT ((0)),
	[OutsiteUserId] [varchar](64) NOT NULL CONSTRAINT [DF_OutsiteUser_OutsiteUserId]  DEFAULT ((0)),
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_OutsiteUser_CreatedUser]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_OutsiteUser_CreatedDate]  DEFAULT (getdate()),
	[LastLoginDate] [datetime] NOT NULL CONSTRAINT [DF_OutsiteUser_LastLoginDate]  DEFAULT (getdate()),
	[Description] [nvarchar](max) NOT NULL CONSTRAINT [DF_OutsiteUser_Description]  DEFAULT (''),
	[Status] [int] NOT NULL CONSTRAINT [DF_OutsiteUser_Status]  DEFAULT ((1)),
	[OutsiteType] [int] NOT NULL CONSTRAINT [DF_OutsiteUser_OutsiteType]  DEFAULT ((0)),
 CONSTRAINT [PK_OutsiteUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'OutsiteUser', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:默?,1:正常,-1??除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutsiteUser', @level2type=N'COLUMN',@level2name=N'Status'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'OutsiteUser', N'COLUMN',N'OutsiteType'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'外站?型：0默?，1新浪微博2??3支付?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutsiteUser', @level2type=N'COLUMN',@level2name=N'OutsiteType'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'OutsiteUser', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'外站用?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutsiteUser'
GO
/****** Object:  Table [dbo].[NotificationLog]    Script Date: 04/07/2013 09:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NotificationLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NotificationLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeviceToken] [varchar](100) NOT NULL,
	[NotifyDate] [datetime] NULL,
	[Message] [varchar](200) NULL,
	[InDate] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_NotificationLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Like]    Script Date: 04/07/2013 09:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Like]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Like](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LikeUserId] [int] NOT NULL CONSTRAINT [DF_Like_LikeUserId]  DEFAULT ((0)),
	[LikedUserId] [int] NOT NULL CONSTRAINT [DF_Like_LikedUserId]  DEFAULT ((0)),
	[Type] [int] NOT NULL CONSTRAINT [DF_Like_Type]  DEFAULT ((0)),
	[Status] [int] NOT NULL CONSTRAINT [DF_Like_Status]  DEFAULT ((1)),
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_Like_CreatedUser]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Like_CreatedDate]  DEFAULT (getdate()),
	[UpdatedUser] [int] NOT NULL CONSTRAINT [DF_Like_UpdatedUser]  DEFAULT ((0)),
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_Like_UpdatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Like] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Like', N'COLUMN',N'LikeUserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'喜欢' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Like', @level2type=N'COLUMN',@level2name=N'LikeUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Like', N'COLUMN',N'LikedUserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'被喜欢' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Like', @level2type=N'COLUMN',@level2name=N'LikedUserId'
GO
/****** Object:  Table [dbo].[Group]    Script Date: 04/07/2013 09:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Group]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Group](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL CONSTRAINT [DF_Group_Name]  DEFAULT (''),
	[Description] [nvarchar](max) NOT NULL CONSTRAINT [DF_Group_Description]  DEFAULT (''),
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_Group_CreatedUser]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Group_CreatedDate]  DEFAULT (getdate()),
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_Group_UpdatedDate]  DEFAULT (getdate()),
	[UpdatedUser] [int] NOT NULL CONSTRAINT [DF_Group_UpdatedUser]  DEFAULT ((0)),
	[Status] [int] NOT NULL CONSTRAINT [DF_Group_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Group', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:默?,1:正常,-1??除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Group', @level2type=N'COLUMN',@level2name=N'Status'
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ParseDelimString]    Script Date: 04/07/2013 09:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_ParseDelimString]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[fn_ParseDelimString] 
(
	-- Add the parameters for the function here
	@Subjects VARCHAR(1000), 
	@SUB_SEP CHAR(1)
)
RETURNS @OutDelim TABLE 
(
	ID INT
)
AS
BEGIN
	;WITH RES(id,fp,tp) AS (
				SELECT id = 1,
						fp = 1,
						tp = CHARINDEX(@SUB_SEP, @Subjects + @SUB_SEP)
				UNION ALL
				SELECT id = RES.id +1,
						fp = RES.tp +LEN(@SUB_SEP),
						tp = CHARINDEX(@SUB_SEP, @Subjects + @SUB_SEP, tp + LEN(@SUB_SEP))
				FROM RES
				WHERE CHARINDEX(@SUB_SEP, @Subjects + @SUB_SEP, tp + LEN(@SUB_SEP)) > 0		
			)
			INSERT INTO @OutDelim
			SELECT CAST(SUBSTRING(@Subjects,RES.fp, RES.tp-RES.fp) AS INT)
			FROM RES
			OPTION (MAXRECURSION 0)
	RETURN
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[FInt2String]    Script Date: 04/07/2013 09:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FInt2String]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
-- =============================================
-- Author: 梁宏朋
-- Create date: 2012/11/26 18:22:57
-- Description: 
-- =============================================


-- =============================================
-- Author: 梁宏朋
-- Create date: 2012/11/26 18:18:24
-- Description: INT转varchar 补位
-- =============================================

CREATE FUNCTION [dbo].[FInt2String]
(
	@val      int -- 欲处理的数字
   ,@length   int -- 需要返回的字符串长度，不足用0补全，超过从右边截取指定长度的字符
   ,@fillStr  varchar(MAX)='''' --补位字符
)
RETURNS varchar(50)
AS
BEGIN
	DECLARE @result varchar(MAX)
	       ,@FS_Length int;
	SELECT @FS_Length = @Length
	      ,@result = ''''
	      ,@fillStr = ISNULL(@fillStr,'''');
	
	IF (@length > 0 OR LEN(@fillStr) > 0)
	BEGIN
	    WHILE @length > 0
	    BEGIN
	        SET @result = @result + @fillStr;
	        SET @length = @length -1;
	    END
	    SET @result = RIGHT(@result + CAST(@val AS varchar(20)) ,@FS_Length)
	END
	ELSE
		BEGIN
			SET @result = STR(@val);
		END

	RETURN @result;
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[FGetDistance]    Script Date: 04/07/2013 09:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FGetDistance]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

-- Author: 梁宏朋
-- Create date: 2012/4/9 19:34:09
-- Description: 两点间距离公式
-- =============================================

CREATE FUNCTION [dbo].[FGetDistance]
(
	@LngBegin  NUMERIC(18,12)
   ,@LatBegin  NUMERIC(18,12)
   ,@LngEnd    NUMERIC(18,12)
   ,@LatEnd    NUMERIC(18,12)
)
RETURNS NUMERIC(18,12)
AS

BEGIN
	DECLARE @Distance NUMERIC(18,12);
	DECLARE @EARTH_RADIUS NUMERIC(18,12);
	SET @EARTH_RADIUS = 6378.137;
	
	DECLARE @RadLatBegin NUMERIC(18,12)
	       ,@RadLatEnd NUMERIC(18,12)
	       ,@RadLatDiff NUMERIC(18,12)
	       ,@RadLngDiff NUMERIC(18,12);
	
	SET @RadLatBegin = @LatBegin * PI() / 180.0;
	SET @RadLatEnd = @LatEnd * PI() / 180.0;
	SET @RadLatDiff = @RadLatBegin - @RadLatEnd;
	SET @RadLngDiff = @LngBegin * PI() / 180.0 - @LngEnd * PI() / 180.0;
	
	SET @Distance = 2 * ASIN(
	        SQRT(
	            POWER(SIN(@RadLatDiff / 2) ,2) + COS(@RadLatBegin) * COS(@RadLatEnd) 
	            * POWER(SIN(@RadLngDiff / 2) ,2)
	        )
	    );
	
	SET @Distance = @Distance * @EARTH_RADIUS;
	--SET @Distance = Round(@Distance * 10000) / 10000
	
	RETURN @Distance;
END


' 
END
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 04/07/2013 09:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Feedback]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Feedback](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NOT NULL CONSTRAINT [DF_Feedback_Content]  DEFAULT (''),
	[Contact] [nvarchar](64) NOT NULL CONSTRAINT [DF_Feedback_Contact]  DEFAULT (''),
	[User_Id] [int] NOT NULL CONSTRAINT [DF_Feedback_User_Id]  DEFAULT ((0)),
	[Status] [int] NOT NULL CONSTRAINT [DF_Feedback_Status]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Feedback_CreatedDate]  DEFAULT (getdate()),
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_Feedback_CreatedUser]  DEFAULT ((0)),
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_Feedback_UpdatedDate]  DEFAULT (getdate()),
	[UpdatedUser] [int] NOT NULL CONSTRAINT [DF_Feedback_UpdatedUser]  DEFAULT ((0)),
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Favorite]    Script Date: 04/07/2013 09:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Favorite]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Favorite](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FavoriteSourceId] [int] NOT NULL CONSTRAINT [DF_Favorite_FavoriteSourceId]  DEFAULT ((0)),
	[FavoriteSourceType] [int] NOT NULL CONSTRAINT [DF_Favorite_FavoriteSourceType]  DEFAULT ((0)),
	[User_Id] [int] NOT NULL CONSTRAINT [DF_Favorite_User_Id]  DEFAULT ((0)),
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_Favorite_CreatedUser]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Favorite_CreatedDate]  DEFAULT (getdate()),
	[Description] [nvarchar](max) NOT NULL CONSTRAINT [DF_Favorite_Description]  DEFAULT (''),
	[Status] [int] NOT NULL CONSTRAINT [DF_Favorite_Status]  DEFAULT ((1)),
	[Store_Id] [int] NOT NULL CONSTRAINT [DF_Favorite_Store_Id]  DEFAULT ((0)),
 CONSTRAINT [PK_Favorite] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Favorite]') AND name = N'IX_Favorite_CreatedDate')
CREATE NONCLUSTERED INDEX [IX_Favorite_CreatedDate] ON [dbo].[Favorite] 
(
	[CreatedDate] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Favorite]') AND name = N'IX_Favorite_UserId_Include_Status')
CREATE NONCLUSTERED INDEX [IX_Favorite_UserId_Include_Status] ON [dbo].[Favorite] 
(
	[User_Id] ASC
)
INCLUDE ( [Status]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Favorite]') AND name = N'IX_Favorite_UserId_Include_Status_CreatedDate')
CREATE NONCLUSTERED INDEX [IX_Favorite_UserId_Include_Status_CreatedDate] ON [dbo].[Favorite] 
(
	[User_Id] ASC
)
INCLUDE ( [Status],
[CreatedDate]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Favorite', N'COLUMN',N'FavoriteSourceType'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:默? 1：?品，2：促?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Favorite', @level2type=N'COLUMN',@level2name=N'FavoriteSourceType'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Favorite', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:默?,1:正常,-1??除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Favorite', @level2type=N'COLUMN',@level2name=N'Status'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Favorite', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收藏' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Favorite'
GO
/****** Object:  Table [dbo].[DeviceToken]    Script Date: 04/07/2013 09:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeviceToken]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DeviceToken](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL CONSTRAINT [DF_DeviceToken_User_Id]  DEFAULT ((0)),
	[Token] [varchar](128) NOT NULL CONSTRAINT [DF_DeviceToken_Token]  DEFAULT (''),
	[Type] [int] NOT NULL CONSTRAINT [DF_DeviceToken_Type]  DEFAULT ((0)),
	[Status] [int] NOT NULL CONSTRAINT [DF_DeviceToken_Status]  DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_DeviceToken_CreatedDate]  DEFAULT (getdate()),
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_DeviceToken_CreatedUser]  DEFAULT ((0)),
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_DeviceToken_UpdatedDate]  DEFAULT (getdate()),
	[UpdatedUser] [int] NOT NULL CONSTRAINT [DF_DeviceToken_UpdatedUser]  DEFAULT ((0)),
 CONSTRAINT [PK_DeviceToken] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DeviceToken]') AND name = N'IX_DeviceToken_Token_UserId')
CREATE UNIQUE NONCLUSTERED INDEX [IX_DeviceToken_Token_UserId] ON [dbo].[DeviceToken] 
(
	[Token] ASC,
	[User_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'DeviceToken', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-1 0 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceToken', @level2type=N'COLUMN',@level2name=N'Status'
GO
/****** Object:  Table [dbo].[DeviceLogs]    Script Date: 04/07/2013 09:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeviceLogs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DeviceLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL CONSTRAINT [DF_DeviceLogs_User_Id]  DEFAULT ((0)),
	[DeviceToken] [varchar](128) NOT NULL CONSTRAINT [DF_DeviceLogs_DeviceToken]  DEFAULT (''),
	[Type] [int] NOT NULL CONSTRAINT [DF_DeviceLogs_Type]  DEFAULT ((0)),
	[Longitude] [numeric](15, 6) NOT NULL CONSTRAINT [DF_DeviceLogs_Longitude]  DEFAULT ((0)),
	[Latitude] [numeric](15, 6) NOT NULL CONSTRAINT [DF_DeviceLogs_Latitude]  DEFAULT ((0)),
	[DeviceUid] [varchar](128) NOT NULL CONSTRAINT [DF_DeviceLogs_DeviceUid]  DEFAULT (''),
	[Status] [int] NOT NULL CONSTRAINT [DF_DeviceLogs_Status]  DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_DeviceLogs_CreatedDate]  DEFAULT (getdate()),
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_DeviceLogs_CreatedUser]  DEFAULT ((0)),
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_DeviceLogs_UpdatedDate]  DEFAULT (getdate()),
	[UpdatedUser] [int] NOT NULL CONSTRAINT [DF_DeviceLogs_UpdatedUser]  DEFAULT ((0)),
 CONSTRAINT [PK_DeviceLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'DeviceLogs', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-1 0 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceLogs', @level2type=N'COLUMN',@level2name=N'Status'
GO
/****** Object:  Table [dbo].[CouponHistory]    Script Date: 04/07/2013 09:47:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CouponHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CouponHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CouponId] [varchar](20) NOT NULL CONSTRAINT [DF_CouponHistory_CouponId]  DEFAULT (''),
	[User_Id] [int] NOT NULL CONSTRAINT [DF_CouponHistory_User_Id]  DEFAULT ((0)),
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_CouponHistory_CreatedUser]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_CouponHistory_CreatedDate]  DEFAULT (getdate()),
	[Status] [int] NOT NULL CONSTRAINT [DF_CouponHistory_Status]  DEFAULT ((1)),
	[FromStore] [int] NOT NULL CONSTRAINT [DF_CouponHistory_FromStore]  DEFAULT ((0)),
	[FromUser] [int] NOT NULL CONSTRAINT [DF_CouponHistory_FromUser]  DEFAULT ((0)),
	[FromProduct] [int] NOT NULL CONSTRAINT [DF_CouponHistory_FromProduct]  DEFAULT ((0)),
	[FromPromotion] [int] NOT NULL CONSTRAINT [DF_CouponHistory_FromPromotion]  DEFAULT ((0)),
	[ValidStartDate] [datetime] NOT NULL CONSTRAINT [DF_CouponHistory_ValidStartDate]  DEFAULT (getdate()),
	[ValidEndDate] [datetime] NOT NULL CONSTRAINT [DF_CouponHistory_ValidEndDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_CouponHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CouponHistory]') AND name = N'IX_CouponHistory_CouponId')
CREATE UNIQUE NONCLUSTERED INDEX [IX_CouponHistory_CouponId] ON [dbo].[CouponHistory] 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CouponHistory]') AND name = N'IX_CouponHistory_ValidEndDate_UserId_Inculde_Stauts_FromPromotionStoreUserProduct')
CREATE NONCLUSTERED INDEX [IX_CouponHistory_ValidEndDate_UserId_Inculde_Stauts_FromPromotionStoreUserProduct] ON [dbo].[CouponHistory] 
(
	[ValidEndDate] DESC,
	[User_Id] ASC
)
INCLUDE ( [Status],
[FromPromotion],
[FromStore],
[FromUser],
[FromProduct]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'CouponHistory', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:默?,1:正常,-1??除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CouponHistory', @level2type=N'COLUMN',@level2name=N'Status'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'CouponHistory', N'COLUMN',N'FromUser'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0默?， ?人或其他用?ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CouponHistory', @level2type=N'COLUMN',@level2name=N'FromUser'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'CouponHistory', N'COLUMN',N'FromProduct'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'?自?品' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CouponHistory', @level2type=N'COLUMN',@level2name=N'FromProduct'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'CouponHistory', N'COLUMN',N'FromPromotion'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'?自促?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CouponHistory', @level2type=N'COLUMN',@level2name=N'FromPromotion'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'CouponHistory', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'优惠卷?史' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CouponHistory'
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 04/07/2013 09:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Promotion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Promotion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL CONSTRAINT [DF_Promotion_Name]  DEFAULT (''),
	[Description] [nvarchar](max) NOT NULL CONSTRAINT [DF_Promotion_Description]  DEFAULT (''),
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_Promotion_CreatedUser]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Promotion_CreatedDate]  DEFAULT (getdate()),
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_Promotion_UpdatedDate]  DEFAULT (getdate()),
	[UpdatedUser] [int] NOT NULL CONSTRAINT [DF_Promotion_UpdatedUser]  DEFAULT ((0)),
	[StartDate] [datetime] NOT NULL CONSTRAINT [DF_Promotion_StartDate]  DEFAULT (getdate()),
	[EndDate] [datetime] NOT NULL CONSTRAINT [DF_Promotion_EndDate]  DEFAULT (getdate()),
	[Status] [int] NOT NULL CONSTRAINT [DF_Promotion_Status]  DEFAULT ((1)),
	[LikeCount] [int] NOT NULL CONSTRAINT [DF_Promotion_LikeCount]  DEFAULT ((0)),
	[FavoriteCount] [int] NOT NULL CONSTRAINT [DF_Promotion_FavoriteCount]  DEFAULT ((0)),
	[ShareCount] [int] NOT NULL CONSTRAINT [DF_Promotion_ShareCount]  DEFAULT ((0)),
	[InvolvedCount] [int] NOT NULL CONSTRAINT [DF_Promotion_InvolvedCount]  DEFAULT ((0)),
	[Store_Id] [int] NOT NULL CONSTRAINT [DF_Promotion_Store_Id]  DEFAULT ((0)),
	[RecommendUser] [int] NOT NULL CONSTRAINT [DF_Promotion_RecommendUser]  DEFAULT ((0)),
	[RecommendSourceId] [int] NOT NULL CONSTRAINT [DF_Promotion_RecommendSourceId]  DEFAULT ((0)),
	[RecommendSourceType] [int] NOT NULL CONSTRAINT [DF_Promotion_RecommendSourceType]  DEFAULT ((0)),
	[Tag_Id] [int] NOT NULL CONSTRAINT [DF_Promotion_Tag_Id]  DEFAULT ((0)),
	[IsTop] [bit] NOT NULL CONSTRAINT [DF_Promotion_IsTop]  DEFAULT ((0)),
	[IsProdBindable] [bit] NULL,
	[PublicationLimit] [int] NULL CONSTRAINT [DF_Promotion_DownLimit]  DEFAULT ((-1)),
 CONSTRAINT [PK_Promotion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Promotion]') AND name = N'IX_Promotion_EndUpdateDate_Include_Status')
CREATE NONCLUSTERED INDEX [IX_Promotion_EndUpdateDate_Include_Status] ON [dbo].[Promotion] 
(
	[EndDate] ASC,
	[UpdatedDate] ASC
)
INCLUDE ( [Status]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Promotion]') AND name = N'IX_Promotion_StoreId_StartEndDate_Include_Status')
CREATE NONCLUSTERED INDEX [IX_Promotion_StoreId_StartEndDate_Include_Status] ON [dbo].[Promotion] 
(
	[Store_Id] ASC,
	[StartDate] ASC,
	[EndDate] ASC
)
INCLUDE ( [Status]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Promotion', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:默?,1:正常,-1??除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Promotion', @level2type=N'COLUMN',@level2name=N'Status'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Promotion', N'COLUMN',N'LikeCount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'喜欢次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Promotion', @level2type=N'COLUMN',@level2name=N'LikeCount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Promotion', N'COLUMN',N'FavoriteCount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收藏次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Promotion', @level2type=N'COLUMN',@level2name=N'FavoriteCount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Promotion', N'COLUMN',N'ShareCount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分享次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Promotion', @level2type=N'COLUMN',@level2name=N'ShareCount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Promotion', N'COLUMN',N'InvolvedCount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参与数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Promotion', @level2type=N'COLUMN',@level2name=N'InvolvedCount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Promotion', N'COLUMN',N'Store_Id'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'店 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Promotion', @level2type=N'COLUMN',@level2name=N'Store_Id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Promotion', N'COLUMN',N'PublicationLimit'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-1 or null no limit else limitd e: 0 limit value 0 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Promotion', @level2type=N'COLUMN',@level2name=N'PublicationLimit'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Promotion', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'促?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Promotion'
GO
/****** Object:  Table [dbo].[ProductUploadJob]    Script Date: 04/07/2013 09:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductUploadJob]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductUploadJob](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InDate] [datetime] NULL,
	[InUser] [int] NULL,
	[FileName] [nvarchar](500) NULL,
	[Status] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ProductStage]    Script Date: 04/07/2013 09:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductStage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductStage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](64) NULL,
	[BrandName] [nvarchar](64) NULL,
	[Description] [nvarchar](1000) NULL,
	[Price] [decimal](18, 2) NULL,
	[DescripOfPromotion] [nvarchar](200) NULL,
	[DescripOfProBeginDate] [datetime] NULL,
	[DescripOfProEndDate] [datetime] NULL,
	[InUserId] [int] NULL,
	[Tag] [nvarchar](64) NULL,
	[Store] [nvarchar](64) NULL,
	[Promotions] [varchar](200) NULL,
	[ItemCode] [varchar](100) NULL,
	[Subjects] [varchar](200) NULL,
	[UploadGroupId] [int] NULL,
	[InDate] [datetime] NULL,
	[Status] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[ProductBulkDelete]    Script Date: 04/07/2013 09:47:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductBulkDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ProductBulkDelete]
(
	@jobid int
)
AS
BEGIN
	SET XACT_ABORT ON
	BEGIN TRY
		DELETE FROM DBO.ResourceStage 
		WHERE UploadGroupId = @jobId
		DELETE FROM DBO.ProductStage
		WHERE UploadGroupId = @jobId
		DELETE FROM DBO.ProductUploadJob
		WHERE ID =@jobId
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
			
			IF (XACT_STATE()) = -1
			BEGIN
				ROLLBACK TRANSACTION;
			END;
			IF (XACT_STATE()) = 1
			BEGIN
				COMMIT TRANSACTION;   
			END;
			
	END CATCH
END
' 
END
GO
/****** Object:  Table [dbo].[Store]    Script Date: 04/07/2013 09:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Store]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Store](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL CONSTRAINT [DF_Store_Name]  DEFAULT (''),
	[Description] [nvarchar](max) NOT NULL CONSTRAINT [DF_Store_Description]  DEFAULT (''),
	[Location] [nvarchar](2048) NOT NULL CONSTRAINT [DF_Store_Location]  DEFAULT (''),
	[Tel] [varchar](64) NOT NULL CONSTRAINT [DF_Store_Tel]  DEFAULT (''),
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_Store_CreatedUser]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Store_CreatedDate]  DEFAULT (getdate()),
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_Store_UpdatedDate]  DEFAULT (getdate()),
	[UpdatedUser] [int] NOT NULL CONSTRAINT [DF_Store_UpdatedUser]  DEFAULT ((0)),
	[Longitude] [numeric](15, 6) NOT NULL CONSTRAINT [DF_Store_Longitude]  DEFAULT ((0)),
	[Latitude] [numeric](15, 6) NOT NULL CONSTRAINT [DF_Store_Latitude]  DEFAULT ((0)),
	[Group_Id] [int] NOT NULL CONSTRAINT [DF_Store_Group_Id]  DEFAULT ((0)),
	[Status] [int] NOT NULL CONSTRAINT [DF_Store_Status]  DEFAULT ((1)),
	[Region_Id] [int] NOT NULL CONSTRAINT [DF_Store_Region_Id]  DEFAULT ((0)),
	[StoreLevel] [int] NOT NULL CONSTRAINT [DF_Store_StoreLevel]  DEFAULT ((0)),
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Store', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:默?,1:正常,-1??除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Store', @level2type=N'COLUMN',@level2name=N'Status'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Store', N'COLUMN',N'Region_Id'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'城市Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Store', @level2type=N'COLUMN',@level2name=N'Region_Id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Store', N'COLUMN',N'StoreLevel'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'店?等?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Store', @level2type=N'COLUMN',@level2name=N'StoreLevel'
GO
/****** Object:  StoredProcedure [dbo].[TimeSeed_Create]    Script Date: 04/07/2013 09:47:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TimeSeed_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		梁宏朋
-- Create date: 2012-11-26
-- Description:	生成种子
-- =============================================
--DECLARE @id int;
--EXEC [dbo].[TimeSeed_Create] NULL
--    ,''''
--    ,999
--    ,1
--    ,@id OUTPUT;
--SELECT @id;
CREATE PROCEDURE [dbo].[TimeSeed_Create]
	@date datetime,
	@keyPre varchar(2000),
	@maxSeed int = 999,
	@seedLength int = 3,
	@id int OUTPUT, -- >1 
	@flag int OUTPUT -- 1 正常 2 超出@maxSeed限制 -1异常
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--	Coupon的code规则如下：
	--                YY+MM+DD+HH+{000}
	--                YY: 当天自然年的后两位
	--                MM:当天自然年的月份两位
	--                Dd：当天自然年的天数两位
	--                Hh：当时小时的两位表示
	--                {000}: 自增长三位数，如不足三位，左补0
	
	--Example:
	--                2012/11/23 领取的一个coupon：
	--                12112313001
	
	
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;--SNAPSHOT --SERIALIZABLE --REPEATABLE READ --READ UNCOMMITTED --READ COMMITTED
	
	IF (@date IS NULL)
	BEGIN
	    SET @date = GETDATE();
	END
	
	DECLARE @year int
	       ,@month int
	       ,@day int
	       ,@hour int
	       ,@lastSeed int
	       ,@keySeed varchar(32)
	       ,@seed int;
	
	SELECT @year = YEAR(@date)
	      ,@month = MONTH(@date)
	      ,@day = DAY(@date)
	      ,@hour = DATENAME(hh ,@date);
	BEGIN TRY
		BEGIN TRAN
		
		SELECT @lastSeed = ISNULL(MAX(Seed) ,0)
		FROM   dbo.TimeSeed AS a
		WHERE  a.[Year] = @year
		       AND a.[Month] = @month
		       AND a.[Day] = @day
		       AND a.[Hour] = @hour;
		
		IF (@lastSeed >= @maxSeed)
		BEGIN
		    SET @flag = 2;
		    SELECT @id;
		    RETURN ;
		END
		
		SET @seed = @lastSeed + 1;
		SET @keySeed = @keyPre + [dbo].[FInt2String](@seed ,@seedLength ,''0'');
		SET @keySeed = LTRIM(RTRIM(@keySeed));
		INSERT INTO [dbo].[TimeSeed]
		  (
		    [Year]
		   ,[Month]
		   ,[Day]
		   ,[Hour]
		   ,[Seed]
		   ,[KeySeed]
		   ,[Date]
		  )
		VALUES
		  (
		    @year
		   ,@month
		   ,@day
		   ,@hour
		   ,@seed
		   ,@keySeed
		   ,@date
		  );
		
		
		SET @flag = 1;
		SET @id = SCOPE_IDENTITY();
		SELECT @id;
		COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN;
		SET @flag = -1;
	END CATCH
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Seed_Generate4Key]    Script Date: 04/07/2013 09:47:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Seed_Generate4Key]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROC [dbo].[Seed_Generate4Key]
    @name VARCHAR(50),
    @maxSeed INT = 9999,
    @k INT,
    @id INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	
	-- 获取下一个Seed 的处理
	DECLARE @Seed INT;

	SET @Seed = -2;
	
	--init
	IF (
	       NOT EXISTS (
	           SELECT *
	           FROM   dbo.[Seed]
	           WHERE  [Name] = @name
	                  AND Id = @k
	       )
	   )
	BEGIN
	    BEGIN TRY
	    	INSERT dbo.[Seed]
	    	VALUES
	    	  (
	    	    @name
	    	   ,@k
	    	   ,0
	    	  )
	    END TRY
	    BEGIN CATCH
	    END CATCH
	END
	   
	MERGE dbo.[Seed] AS ID
	   USING(VALUES(@k ,1)) AS DT(id ,VALUE)
	   ON DT.id = ID.Id
	   AND ID.[Name] = @name
	   WHEN MATCHED
	   AND ID.Value < @maxSeed THEN
	
	UPDATE 
	SET    @Seed = ID.Value + 1
	      ,VALUE = @Seed
	   WHEN NOT MATCHED BY TARGET THEN
	
	INSERT 
	  (
	    NAME
	   ,Id
	   ,VALUE
	  )
	VALUES
	  (
	    @name
	   ,id
	   ,VALUE
	  )
	;
	
	
	SET @id = @Seed
	-- 显示结果
	SELECT @seed
	      ,*
	FROM   dbo.[Seed];
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[Seed_Generate]    Script Date: 04/07/2013 09:47:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Seed_Generate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROC [dbo].[Seed_Generate]
    @name VARCHAR(50),
    @maxSeed INT = 9,
    @id INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	
	-- 获取下一个Seed 的处理
	DECLARE @date DATETIME
	       ,@k INT
	       ,@Seed INT;
	SET @date = GETDATE(); -- 查询的日期
	SET @Seed = -2;
	SET @k = DATEDIFF(DAY ,0 ,@date);
	
	--init
	IF (
	       NOT EXISTS (
	           SELECT *
	           FROM   dbo.[Seed]
	           WHERE  [Name] = @name
	                  AND Id = @k
	       )
	   )
	BEGIN
	    BEGIN TRY
	    	INSERT dbo.[Seed]
	    	VALUES
	    	  (
	    	    @name
	    	   ,@k
	    	   ,0
	    	  )
	    END TRY
	    BEGIN CATCH
	    END CATCH
	END
	   
	MERGE dbo.[Seed] AS ID
	   USING(VALUES(@k ,1)) AS DT(id ,VALUE)
	   ON DT.id = ID.Id
	   AND ID.[Name] = @name
	   WHEN MATCHED
	   AND ID.Value < @maxSeed THEN
	
	UPDATE 
	SET    @Seed = ID.Value + 1
	      ,VALUE = @Seed
	   WHEN NOT MATCHED BY TARGET THEN
	
	INSERT 
	  (
	    NAME
	   ,Id
	   ,VALUE
	  )
	VALUES
	  (
	    @name
	   ,id
	   ,VALUE
	  )
	;
	
	
	SET @id = @Seed
	-- 显示结果
	SELECT @seed
	      ,*
	FROM   dbo.[Seed];
END
' 
END
GO
/****** Object:  Table [dbo].[User]    Script Date: 04/07/2013 09:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](64) NOT NULL CONSTRAINT [DF_User_Name]  DEFAULT (''),
	[Password] [varchar](1024) NOT NULL CONSTRAINT [DF_User_Password]  DEFAULT (''),
	[Nickname] [nvarchar](32) NOT NULL CONSTRAINT [DF_User_Nickname]  DEFAULT (''),
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_User_CreatedUser]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()),
	[UpdatedUser] [int] NOT NULL CONSTRAINT [DF_User_UpdatedUser]  DEFAULT ((0)),
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_User_UpdatedDate]  DEFAULT (getdate()),
	[LastLoginDate] [datetime] NOT NULL CONSTRAINT [DF_User_LastLoginDate]  DEFAULT (getdate()),
	[Mobile] [varchar](32) NOT NULL CONSTRAINT [DF_User_Mobile]  DEFAULT (''),
	[EMail] [varchar](64) NOT NULL CONSTRAINT [DF_User_EMail]  DEFAULT (''),
	[Status] [int] NOT NULL CONSTRAINT [DF_User_Status]  DEFAULT ((1)),
	[UserLevel] [int] NOT NULL CONSTRAINT [DF_User_UserLevel]  DEFAULT ((0)),
	[Store_Id] [int] NOT NULL CONSTRAINT [DF_User_Store_Id]  DEFAULT ((0)),
	[Region_Id] [int] NOT NULL CONSTRAINT [DF_User_Region_Id]  DEFAULT ((0)),
	[Logo] [varchar](1024) NOT NULL CONSTRAINT [DF_User_Logo]  DEFAULT (''),
	[Description] [nvarchar](64) NOT NULL CONSTRAINT [DF_User_Desc]  DEFAULT (''),
	[Gender] [tinyint] NOT NULL CONSTRAINT [DF_User_Gender]  DEFAULT ((0)),
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND name = N'IX_User_Name')
CREATE UNIQUE NONCLUSTERED INDEX [IX_User_Name] ON [dbo].[User] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND name = N'IX_User_Nickname')
CREATE NONCLUSTERED INDEX [IX_User_Nickname] ON [dbo].[User] 
(
	[Nickname] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:默?,1:正常,-1??除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Status'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User', N'COLUMN',N'UserLevel'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用?等?,0:默? 1：?人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'UserLevel'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'User', N'COLUMN',N'Region_Id'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'城市Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Region_Id'
GO
/****** Object:  StoredProcedure [dbo].[TimeSeed_CreateV2]    Script Date: 04/07/2013 09:47:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TimeSeed_CreateV2]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		梁宏朋
-- Create date: 2012-11-26
-- Description:	生成种子 天为最小量
-- =============================================
--DECLARE	@return_value int,
--		@id int,
--		@flag int

--EXEC	@return_value = [dbo].[TimeSeed_CreateV2]
--		@date = NULL,
--		@keyPre = N''008'',
--		@maxSeed = 99999,
--		@seedLength = 5,
--		@id = @id OUTPUT,
--		@flag = @flag OUTPUT

--SELECT	@id as N''@id'',
--		@flag as N''@flag''

--SELECT	''Return Value'' = @return_value
CREATE PROCEDURE [dbo].[TimeSeed_CreateV2]
	@date datetime,
	@keyPre varchar(2000),
	@maxSeed int = 999,
	@seedLength int = 3,
	@id int OUTPUT, -- >1 
	@flag int OUTPUT -- 1 正常 2 超出@maxSeed限制 -1异常
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--	Coupon的code规则如下：
	--                YY+MM+DD+HH+{000}
	--                YY: 当天自然年的后两位
	--                MM:当天自然年的月份两位
	--                Dd：当天自然年的天数两位
	--                Hh：当时小时的两位表示
	--                {000}: 自增长三位数，如不足三位，左补0
	
	--Example:
	--                2012/11/23 领取的一个coupon：
	--                12112313001
	
	
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;--SNAPSHOT --SERIALIZABLE --REPEATABLE READ --READ UNCOMMITTED --READ COMMITTED
	
	IF (@date IS NULL)
	BEGIN
	    SET @date = GETDATE();
	END
	
	DECLARE @year int
	       ,@month int
	       ,@day int
	       ,@lastSeed int
	       ,@keySeed varchar(32)
	       ,@seed int;
	
	SELECT @year = YEAR(@date)
	      ,@month = MONTH(@date)
	      ,@day = DAY(@date);
	      
	BEGIN TRY
		BEGIN TRAN
		
		--declare @id int ;
--exec dbo.Seed_Generate ''yt.hz.coupon'',9,@id output;
--select @id
		EXEC [dbo].[Seed_Generate] ''yt.hz.coupon'',@maxSeed,@lastSeed OUTPUT;
		
		--SELECT @lastSeed = ISNULL(MAX(Seed) ,0)
		--FROM   dbo.TimeSeed AS a
		--WHERE  a.[Year] = @year
		--       AND a.[Month] = @month
		--       AND a.[Day] = @day;
		
		IF (@lastSeed = -2)
		BEGIN
		    SET @flag = 2;
		    SELECT @id;
		    RETURN ;
		END
		
		SET @seed = @lastSeed;
		SET @keySeed = @keyPre + [dbo].[FInt2String](@seed ,@seedLength ,''0'');
		SET @keySeed = LTRIM(RTRIM(@keySeed));
		INSERT INTO [dbo].[TimeSeed]
		  (
		    [Year]
		   ,[Month]
		   ,[Day]
		   ,[Hour]
		   ,[Seed]
		   ,[KeySeed]
		   ,[Date]
		  )
		VALUES
		  (
		    @year
		   ,@month
		   ,@day
		   ,0
		   ,@seed
		   ,@keySeed
		   ,@date
		  );
		
		
		SET @flag = 1;
		SET @id = SCOPE_IDENTITY();
		SELECT @id;
		COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN;
		SET @flag = -1;
	END CATCH
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Promotion_GetPagedListByCoordinateAndTs]    Script Date: 04/07/2013 09:47:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Promotion_GetPagedListByCoordinateAndTs]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author: 梁宏朋
-- Create date: 2012/11/22 10:20:03
-- Description: 
-- =============================================
--DECLARE @TOTAL int
--       ,@Date datetime;
--SET @Date = GETDATE()
--EXEC [dbo].[Promotion_GetPagedListByCoordinateAndTs] 116.403936
--    ,39.912094
--    ,@Date
--    ,@Date
--    ,1
--    ,1
--    ,@TOTAL OUTPUT;
--SELECT @TOTAL;

CREATE PROCEDURE [dbo].[Promotion_GetPagedListByCoordinateAndTs]
(
    @Longitude   NUMERIC(18 ,12) = 0
   ,@Latitude    NUMERIC(18 ,12) = 0
   ,@StartDate        datetime
   ,@TsDate	datetime
   ,@PageSize    int = 1
   ,@PageIndex   int = 1
   ,@TotalCount  int = 0 OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;--SNAPSHOT --SERIALIZABLE --REPEATABLE READ --READ UNCOMMITTED --READ COMMITTED
	IF (@StartDate IS NULL)
	BEGIN
	    SET @StartDate = GETDATE();
	END
	
	DECLARE @t TABLE ([Id] int ,[Distance] NUMERIC(18 ,12));
	
	INSERT INTO @t
	  (
	    [Id]
	   ,[Distance]
	  )
	SELECT [Id]
	      ,dbo.FGetDistance([Longitude] ,[Latitude] ,@Longitude ,@Latitude) AS 
	       Distance
	FROM   [dbo].[Store] AS a
	WHERE  a.[Status] = 1;
	
	SELECT @TotalCount = ISNULL(COUNT(*) ,0)
	FROM   [dbo].[Promotion] AS b
	WHERE  b.[Status] = 1
	       AND (b.EndDate > @StartDate)
	       AND b.UpdatedDate<=@TsDate;
	IF (@TotalCount = 0)
	BEGIN
	    RETURN;
	END
	
	IF (@PageIndex = 1)
	BEGIN
	    SELECT TOP(@PageSize) 
	           b.Distance
	          ,a.*
	    FROM   [dbo].[Promotion] AS a
	           INNER JOIN @t AS b
	                ON  a.Store_Id = b.Id
	    WHERE  a.[Status] = 1
	           AND (a.EndDate > @StartDate)
	           AND a.UpdatedDate<=@TsDate
	    ORDER BY
	           a.IsTop DESC,b.Distance ASC;
	END
	ELSE
	BEGIN
	    ; WITH RowSort AS
	    (
	        SELECT TOP(@PageSize * @PageIndex)
	               ROW_NUMBER() OVER(ORDER BY a.IsTop DESC,b.Distance ASC) AS RowNumber
	              ,a.[Id] PostId
	        FROM   [dbo].[Promotion] AS a
	               INNER JOIN @t AS b
	                    ON  a.Store_Id = b.Id
	        WHERE  a.[Status] = 1
	               AND (a.EndDate > @StartDate)
	               AND a.UpdatedDate<=@TsDate
	    )
	    
	    SELECT b.Distance
	          ,a.*
	    FROM   [dbo].[Promotion] AS a
	           INNER JOIN @t AS b
	                ON  a.Store_Id = b.Id
	           INNER JOIN RowSort r
	                ON  a.Id = r.PostId
	    WHERE  r.RowNumber BETWEEN @PageSize * (@PageIndex - 1) + 1 AND @PageSize 
	           *
	           @PageIndex
	    ORDER BY
	           r.RowNumber;
	END
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Promotion_GetPagedListByCoordinate]    Script Date: 04/07/2013 09:47:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Promotion_GetPagedListByCoordinate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =============================================
-- Author: 梁宏朋
-- Create date: 2012/11/22 10:20:03
-- Description: 
-- =============================================
--DECLARE @TOTAL int
--       ,@Date datetime;
--SET @Date = GETDATE()
--EXEC [dbo].[Promotion_GetPagedListByCoordinate] 116.403936
--    ,39.912094
--    ,@Date
--    ,1
--    ,1
--    ,@TOTAL OUTPUT;
--SELECT @TOTAL;

CREATE PROCEDURE [dbo].[Promotion_GetPagedListByCoordinate]
(
    @Longitude   NUMERIC(18 ,12) = 0
   ,@Latitude    NUMERIC(18 ,12) = 0
   ,@StartDate        datetime
   ,@PageSize    int = 1
   ,@PageIndex   int = 1
   ,@TotalCount  int = 0 OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;--SNAPSHOT --SERIALIZABLE --REPEATABLE READ --READ UNCOMMITTED --READ COMMITTED
	IF (@StartDate IS NULL)
	BEGIN
	    SET @StartDate = GETDATE();
	END
	
	DECLARE @t TABLE ([Id] int ,[Distance] NUMERIC(18 ,12));
	
	INSERT INTO @t
	  (
	    [Id]
	   ,[Distance]
	  )
	SELECT [Id]
	      ,dbo.FGetDistance([Longitude] ,[Latitude] ,@Longitude ,@Latitude) AS 
	       Distance
	FROM   [dbo].[Store] AS a
	WHERE  a.[Status] = 1;
	
	SELECT @TotalCount = ISNULL(COUNT(*) ,0)
	FROM   [dbo].[Promotion] AS b
	WHERE  b.[Status] = 1
	       AND (b.EndDate > @StartDate);
	IF (@TotalCount = 0)
	BEGIN
	    RETURN;
	END
	
	IF (@PageIndex = 1)
	BEGIN
	    SELECT TOP(@PageSize) 
	           b.Distance
	          ,a.*
	    FROM   [dbo].[Promotion] AS a
	           INNER JOIN @t AS b
	                ON  a.Store_Id = b.Id
	    WHERE  a.[Status] = 1
	           AND (a.EndDate > @StartDate)
	    ORDER BY
	           a.IsTop DESC,b.Distance ASC;
	END
	ELSE
	BEGIN
	    ; WITH RowSort AS
	    (
	        SELECT TOP(@PageSize * @PageIndex)
	               ROW_NUMBER() OVER(ORDER BY a.IsTop DESC,b.Distance ASC) AS RowNumber
	              ,a.[Id] PostId
	        FROM   [dbo].[Promotion] AS a
	               INNER JOIN @t AS b
	                    ON  a.Store_Id = b.Id
	        WHERE  a.[Status] = 1
	               AND (a.EndDate > @StartDate)
	    )
	    
	    SELECT b.Distance
	          ,a.*
	    FROM   [dbo].[Promotion] AS a
	           INNER JOIN @t AS b
	                ON  a.Store_Id = b.Id
	           INNER JOIN RowSort r
	                ON  a.Id = r.PostId
	    WHERE  r.RowNumber BETWEEN @PageSize * (@PageIndex - 1) + 1 AND @PageSize 
	           *
	           @PageIndex
	    ORDER BY
	           r.RowNumber;
	END
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Promotion_GetListByCoordinate]    Script Date: 04/07/2013 09:47:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Promotion_GetListByCoordinate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author: 梁宏朋
-- Create date: 2012/11/22 10:20:03
-- Description: 
-- =============================================
--DECLARE @TOTAL int
--       ,@Date datetime;
--SET @Date = GETDATE()
--EXEC [dbo].[Promotion_GetPagedListByCoordinate] 116.403936
--    ,39.912094
--    ,@Date
--    ,1
--    ,1
--    ,@TOTAL OUTPUT;
--SELECT @TOTAL;

CREATE PROCEDURE [dbo].[Promotion_GetListByCoordinate]
(
    @Longitude  NUMERIC(18 ,12) = 0
   ,@Latitude   NUMERIC(18 ,12) = 0
   ,@StartDate  datetime
   ,@TsDate     datetime
   ,@TsType     int = 0
   ,@PageSize   int = 0
)
AS
BEGIN
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;--SNAPSHOT --SERIALIZABLE --REPEATABLE READ --READ UNCOMMITTED --READ COMMITTED
	IF (@StartDate IS NULL)
	BEGIN
	    SET @StartDate = GETDATE();
	END
	
	DECLARE @t TABLE ([Id] int ,[Distance] NUMERIC(18 ,12));
	
	INSERT INTO @t
	  (
	    [Id]
	   ,[Distance]
	  )
	SELECT [Id]
	      ,dbo.FGetDistance([Longitude] ,[Latitude] ,@Longitude ,@Latitude) AS 
	       Distance
	FROM   [dbo].[Store] AS a
	WHERE  a.[Status] = 1;
	
	
	IF (@TsDate IS NULL)
	BEGIN
	    SELECT TOP(@PageSize) 
	           b.Distance
	          ,a.*
	    FROM   [dbo].[Promotion] AS a
	           INNER JOIN @t AS b
	                ON  a.Store_Id = b.Id
	    WHERE  a.[Status] = 1
	           AND (a.StartDate <= @StartDate AND a.EndDate > @StartDate)
	    ORDER BY
	           a.IsTop DESC, b.Distance ASC;
	END
	ELSE
	BEGIN
	    IF (@TsType = 1)
	    BEGIN
	        SELECT TOP(@PageSize) 
	               b.Distance
	              ,a.*
	        FROM   [dbo].[Promotion] AS a
	               INNER JOIN @t AS b
	                    ON  a.Store_Id = b.Id
	        WHERE  a.[Status] = 1
	               AND (a.EndDate > @StartDate)
	               AND a.UpdatedDate >= @TsDate
	        ORDER BY
	               a.IsTop DESC,b.Distance ASC;
	    END
	    ELSE
	    BEGIN
	        SELECT TOP(@PageSize) 
	               b.Distance
	              ,a.*
	        FROM   [dbo].[Promotion] AS a
	               INNER JOIN @t AS b
	                    ON  a.Store_Id = b.Id
	        WHERE  a.[Status] = 1
	               AND (a.EndDate > @StartDate)
	               AND a.UpdatedDate < @TsDate
	        ORDER BY
	               a.IsTop DESC,b.Distance ASC;
	    END
	END
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[ProductStageValidate]    Script Date: 04/07/2013 09:47:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductStageValidate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ProductStageValidate]
(
	@inUser int,
	@jobId int
)
AS
BEGIN
	SET NOCOUNT ON;
	IF (@inUser IS NULL OR
		@inUser = 0)
		RETURN
	DECLARE @validateResult TABLE (ItemCode varchar(64), ValResult varchar(100), ValStatus int)
	DECLARE @ValResultTemp VARCHAR(100)
	DECLARE @Id int,@Name nvarchar(64), @BrandName nvarchar(64),@Descrip nvarchar(1000)
	DECLARE @Price decimal(18,2),@DescripOfProBeginDate datetime, @DescripOfProEndDate datetime
	DECLARE @Tag nvarchar(64), @Store nvarchar(64), @Promotions varchar(200),@Subjects varchar(200), @ItemCode varchar(100)
	DECLARE stage_cursor CURSOR FOR 
	SELECT id 
		,name
		,BrandName
		,Description
		,Price
		,DescripOfProBeginDate
		,DescripOfProEndDate
		,Tag
		,Store
		,Promotions
		,ItemCode
		,Subjects
	FROM DBO.ProductStage WITH(NOLOCK)
	WHERE inUserId = @inUser
	AND UploadGroupId = @jobId
	AND Status in (1,2) --waiting for validate
	ORDER BY ItemCode asc

	OPEN stage_cursor
	FETCH NEXT FROM stage_cursor 
	INTO @Id, @Name, @BrandName, @Descrip, @Price
	,@DescripOfProBeginDate, @DescripOfProEndDate
	,@Tag, @Store,@Promotions, @ItemCode,@Subjects

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @ValResultTemp = ''''
		IF NOT EXISTS(SELECT 1 FROM DBO.Brand WITH(NOLOCK)
		WHERE Name = @BrandName)
			SET @ValResultTemp = ''品牌不存在''
		IF NOT EXISTS (SELECT 1 FROM DBO.Store WITH(NOLOCK)
		WHERE Name = @Store)
			SET @ValResultTemp = @ValResultTemp+''|实体店不存在''
		IF NOT EXISTS (SELECT 1 FROM DBO.Tag WITH(NOLOCK)
		WHERE Name = @Tag)
			SET @ValResultTemp = @ValResultTemp+''|Tag不存在''
		IF @DescripOfProEndDate <= @DescripOfProBeginDate
			SET @ValResultTemp = @ValResultTemp +''|促销结束时间小于开始时间''
			--validate itemcode
		IF EXISTS(SELECT 1 FROM DBO.ProductStage WITH(NOLOCK)
					WHERE ItemCode = @ItemCode
					AND InUserId = @inUser
					AND UploadGroupId = @jobId
					AND Status !=2
					Group By ItemCode
					Having(COUNT(*)>1))
			SET @ValResultTemp = @ValResultTemp+''|商品编码：''+@ItemCode+''已存在''
		--validate image resources
		IF NOT EXISTS(SELECT 1 FROM DBO.ProductStage ps with(nolock)
						INNER JOIN DBO.ResourceStage rs with(nolock)
								on rs.ItemCode = ps.ItemCode
						WHERE ps.id = @Id
						AND ps.UploadGroupId = @jobId
						AND rs.UploadGroupId = @jobId)
			SET @ValResultTemp = @ValResultTemp+''|图片不存在''
		--validate promotions
		if (@Promotions IS NOT NULL AND
			DATALENGTH(@Promotions)>0)
		BEGIN
			
			SELECT @ValResultTemp = CASE WHEN P.Id IS NULL THEN @ValResultTemp+''|促销活动''+CAST(PP.ID AS varchar(100))+''不存在''
										 ELSE @ValResultTemp
									END
			FROM DBO.fn_ParseDelimString(@Promotions,'','') AS PP
			LEFT JOIN DBO.Promotion P WITH(NOLOCK)
				ON P.id = PP.ID 
				AND P.isProdBindable =1
		END
		--validate subjects
		if (@Subjects IS NOT NULL AND
			DATALENGTH(@Subjects)>0)
		BEGIN
			SELECT @ValResultTemp = CASE WHEN P.Id IS NULL THEN @ValResultTemp+''|主题活动''+CAST(PP.ID AS varchar(100))+''不存在''
										 ELSE @ValResultTemp
									END
			FROM DBO.fn_ParseDelimString(@Subjects,'','') AS PP
			LEFT JOIN DBO.SpecialTopic P WITH(NOLOCK)
				ON P.id = PP.ID
		END
		--update validate status
		DECLARE @ValidateStatus INT
		IF LEN(@ValResultTemp)>0
		BEGIN
			SET @ValidateStatus = 2 
			INSERT INTO @validateResult
			SELECT @ItemCode,
				@ValResultTemp,
				@ValidateStatus
		END
		ELSE
			SET @ValidateStatus = 4
		UPDATE ProductStage
		SET Status = @ValidateStatus
		WHERE id = @Id
		
		UPDATE ProductUploadJob
		SET Status = @ValidateStatus
		WHERE id = @jobId
		
		-- Get the next vendor.
		FETCH NEXT FROM stage_cursor 
		INTO @Id,  @Name, @BrandName, @Descrip, @Price
	,@DescripOfProBeginDate, @DescripOfProEndDate
	,@Tag, @Store,@Promotions, @ItemCode,@Subjects
	END 
	CLOSE stage_cursor;
	DEALLOCATE stage_cursor;

	SELECT ItemCode,
		ValidateResult = ValResult,
		ResultStatus = ValStatus
	 FROM @validateResult
END
' 
END
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 04/07/2013 09:47:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](256) NOT NULL CONSTRAINT [DF_Comment_Content]  DEFAULT (''),
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_Comment_CreatedUser]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Comment_CreatedDate]  DEFAULT (getdate()),
	[UpdatedUser] [int] NOT NULL CONSTRAINT [DF_Comment_UpdatedUser]  DEFAULT ((0)),
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_Comment_UpdatedDate]  DEFAULT (getdate()),
	[Status] [int] NOT NULL CONSTRAINT [DF_Comment_Status]  DEFAULT ((1)),
	[User_Id] [int] NOT NULL CONSTRAINT [DF_Comment_CommentUser]  DEFAULT ((0)),
	[SourceId] [int] NOT NULL CONSTRAINT [DF_Comment_CommentSourceId]  DEFAULT ((0)),
	[SourceType] [int] NOT NULL CONSTRAINT [DF_Comment_CommentSourceType]  DEFAULT ((0)),
	[ReplyUser] [int] NOT NULL CONSTRAINT [DF_Comment_CommentReplyUser]  DEFAULT ((0)),
	[ReplyId] [int] NOT NULL CONSTRAINT [DF_Comment_CommentId]  DEFAULT ((0)),
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Comment]') AND name = N'IX_Comment_SourceId_SourceType_Inculde_Stauts')
CREATE NONCLUSTERED INDEX [IX_Comment_SourceId_SourceType_Inculde_Stauts] ON [dbo].[Comment] 
(
	[SourceId] ASC,
	[SourceType] ASC
)
INCLUDE ( [Status]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Comment', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:默?,1:正常,-1??除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comment', @level2type=N'COLUMN',@level2name=N'Status'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Comment', N'COLUMN',N'User_Id'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'??的用?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comment', @level2type=N'COLUMN',@level2name=N'User_Id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Comment', N'COLUMN',N'SourceId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'根据TYPe找到相?ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comment', @level2type=N'COLUMN',@level2name=N'SourceId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Comment', N'COLUMN',N'SourceType'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1表示?于?品的??' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comment', @level2type=N'COLUMN',@level2name=N'SourceType'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Comment', N'COLUMN',N'ReplyUser'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'last comment user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comment', @level2type=N'COLUMN',@level2name=N'ReplyUser'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Comment', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'??' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comment'
GO
/****** Object:  Table [dbo].[Product]    Script Date: 04/07/2013 09:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL CONSTRAINT [DF_Product_Name]  DEFAULT (''),
	[Brand_Id] [int] NOT NULL CONSTRAINT [DF_Product_Brand_Id]  DEFAULT ((0)),
	[Description] [nvarchar](max) NOT NULL CONSTRAINT [DF_Product_Description]  DEFAULT (''),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Product_CreatedDate]  DEFAULT (getdate()),
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_Product_CreatedUser]  DEFAULT ((0)),
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_Product_UpdatedDate]  DEFAULT (getdate()),
	[UpdatedUser] [int] NOT NULL CONSTRAINT [DF_Product_UpdatedUser]  DEFAULT ((0)),
	[Price] [decimal](18, 2) NOT NULL CONSTRAINT [DF_Product_Price]  DEFAULT ((0)),
	[RecommendedReason] [nvarchar](max) NOT NULL CONSTRAINT [DF_Product_RecommendedReason]  DEFAULT (''),
	[Favorable] [nvarchar](max) NOT NULL CONSTRAINT [DF_Product_Favorable]  DEFAULT (''),
	[RecommendUser] [int] NOT NULL CONSTRAINT [DF_Product_RecommendUser]  DEFAULT ((0)),
	[Status] [int] NOT NULL CONSTRAINT [DF_Product_Status]  DEFAULT ((1)),
	[Store_Id] [int] NOT NULL CONSTRAINT [DF_Product_Store_Id]  DEFAULT ((0)),
	[Tag_Id] [int] NOT NULL CONSTRAINT [DF_Product_Tag_Id]  DEFAULT ((0)),
	[FavoriteCount] [int] NOT NULL CONSTRAINT [DF_Product_FavoriteCount]  DEFAULT ((0)),
	[ShareCount] [int] NOT NULL CONSTRAINT [DF_Product_ShareCount]  DEFAULT ((0)),
	[InvolvedCount] [int] NOT NULL CONSTRAINT [DF_Product_InvolvedCount]  DEFAULT ((0)),
	[RecommendSourceId] [int] NOT NULL CONSTRAINT [DF_Product_RecommendSourceId]  DEFAULT ((0)),
	[RecommendSourceType] [int] NOT NULL CONSTRAINT [DF_Product_RecommendSourceType]  DEFAULT ((0)),
	[SortOrder] [int] NOT NULL CONSTRAINT [DF_Product_SortOrder]  DEFAULT ((0)),
 CONSTRAINT [PK_Product_] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND name = N'IX_Product_SortOrder_CreateDate')
CREATE NONCLUSTERED INDEX [IX_Product_SortOrder_CreateDate] ON [dbo].[Product] 
(
	[SortOrder] DESC,
	[CreatedDate] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND name = N'IX_Product_UpdateDate_TagId_Include_Status')
CREATE NONCLUSTERED INDEX [IX_Product_UpdateDate_TagId_Include_Status] ON [dbo].[Product] 
(
	[UpdatedDate] DESC,
	[Tag_Id] ASC
)
INCLUDE ( [Status]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Product', N'COLUMN',N'RecommendedReason'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'推荐理由' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'RecommendedReason'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Product', N'COLUMN',N'Favorable'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'优惠' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'Favorable'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Product', N'COLUMN',N'RecommendUser'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'推荐人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'RecommendUser'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Product', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:默?,1:正常,-1??除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'Status'
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 04/07/2013 09:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRole]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Role_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_UserRole_CreatedDate]  DEFAULT (getdate()),
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_UserRole_CreatedUser]  DEFAULT ((0)),
	[Status] [int] NOT NULL CONSTRAINT [DF_UserRole_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_UserRole_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserRole]') AND name = N'IX_UserRole_RoleId')
CREATE NONCLUSTERED INDEX [IX_UserRole_RoleId] ON [dbo].[UserRole] 
(
	[Role_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserRole]') AND name = N'IX_UserRole_UserId')
CREATE NONCLUSTERED INDEX [IX_UserRole_UserId] ON [dbo].[UserRole] 
(
	[User_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'UserRole', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:默?,1:正常,-1??除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserRole', @level2type=N'COLUMN',@level2name=N'Status'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'UserRole', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用??限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserRole'
GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 04/07/2013 09:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAccount]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserAccount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountType] [int] NOT NULL CONSTRAINT [DF_UserAccount_AccountType]  DEFAULT ((0)),
	[AccountId] [int] NOT NULL CONSTRAINT [DF_UserAccount_AccountId]  DEFAULT ((0)),
	[Amount] [decimal](18, 4) NOT NULL CONSTRAINT [DF_UserAccount_Amount]  DEFAULT ((0)),
	[User_Id] [int] NOT NULL,
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_UserAccount_CreatedUser]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_UserAccount_CreatedDate]  DEFAULT (getdate()),
	[UpdatedUser] [int] NOT NULL CONSTRAINT [DF_UserAccount_UpdatedUser]  DEFAULT ((0)),
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_UserAccount_UpdatedDate]  DEFAULT (getdate()),
	[Status] [int] NOT NULL CONSTRAINT [DF_UserAccount_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_UserAccount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserAccount]') AND name = N'IX_UserAccount_AccountType_UserId')
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserAccount_AccountType_UserId] ON [dbo].[UserAccount] 
(
	[AccountType] ASC,
	[User_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'UserAccount', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:默?,1:正常,-1??除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserAccount', @level2type=N'COLUMN',@level2name=N'Status'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'UserAccount', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用???' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserAccount'
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 04/07/2013 09:47:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bill]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Bill](
	[Id] [int] IDENTITY(10000000,1) NOT NULL,
	[Amount] [decimal](16, 2) NOT NULL,
	[Mode] [int] NOT NULL CONSTRAINT [DF_Bill_Mode]  DEFAULT ((0)),
	[User_Id] [int] NOT NULL,
	[Tag_Id] [int] NOT NULL,
	[Type] [int] NOT NULL CONSTRAINT [DF_Bill_Type]  DEFAULT ((0)),
	[Description] [nvarchar](1024) NOT NULL CONSTRAINT [DF_Bill_Description]  DEFAULT (''),
	[DataDateTime] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[CreatedUser] [int] NOT NULL CONSTRAINT [DF_Bill_CreatedUser]  DEFAULT ((0)),
	[UpdatedUser] [int] NOT NULL CONSTRAINT [DF_Bill_UpdatedUser]  DEFAULT ((0)),
	[Status] [int] NOT NULL CONSTRAINT [DF_Bill_Status]  DEFAULT ((0)),
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_Bill_IsDeleted]  DEFAULT ((0)),
	[ExtendedContentType] [int] NOT NULL,
	[ExtendedContent] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[VUserRole]    Script Date: 04/07/2013 09:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VUserRole]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[VUserRole]
AS
SELECT     a.Role_Id, a.User_Id, b.Name AS Role_Name, b.Description AS Role_Description, b.Val AS Role_Val
FROM         dbo.UserRole AS a INNER JOIN
                      dbo.Role AS b ON a.Role_Id = b.Id
WHERE     (a.Status = 1) AND (b.Status = 1)'
GO
/****** Object:  View [dbo].[VUser]    Script Date: 04/07/2013 09:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VUser]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[VUser]
AS
SELECT     c.Id AS User_Id, c.Name, c.Password, c.Nickname, c.CreatedUser, c.CreatedDate, c.UpdatedUser, c.UpdatedDate, c.LastLoginDate, c.Mobile, c.EMail, c.Status, 
                      c.UserLevel, c.Store_Id, c.Region_Id, c.Logo, c.Description, c.Gender, b.Id AS Role_Id, b.Name AS Role_Name, b.Description AS Role_Description, 
                      b.Val AS Role_Val
FROM         dbo.UserRole AS a INNER JOIN
                      dbo.Role AS b ON a.Role_Id = b.Id INNER JOIN
                      dbo.[User] AS c ON a.User_Id = c.Id
WHERE     (a.Status = 1) AND (c.Status = 1)
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'VUser', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 434
               Bottom = 125
               Right = 594
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 125
               Right = 396
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VUser'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'VUser', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VUser'
GO
/****** Object:  StoredProcedure [dbo].[ProductStagePublish2]    Script Date: 04/07/2013 09:47:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductStagePublish2]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ProductStagePublish2]
(
	@inUser int,
	@jobId int
)
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON
	IF (@inUser IS NULL OR
		@inUser = 0)
		RETURN
	DECLARE @Id int, @Promotions varchar(200),@Subjects varchar(200), @ItemCode varchar(100)
	DECLARE @PId int
	DECLARE @OutTable TABLE(ItemCode varchar(64), Status int,PublishMemo varchar(100))
	DECLARE stage_cursor CURSOR FOR 
	SELECT id 
		,Promotions
		,ItemCode
		,Subjects
	FROM DBO.ProductStage WITH(NOLOCK)
	WHERE inUserId = @inUser
	AND UploadGroupId = @jobId
	AND Status = 4
	ORDER BY ItemCode asc

	OPEN stage_cursor
	FETCH NEXT FROM stage_cursor 
	INTO @Id,@Promotions, @ItemCode,@Subjects

	WHILE @@FETCH_STATUS = 0
	BEGIN
		BEGIN TRY
		BEGIN TRANSACTION
			--CREATE PRODUCT
			INSERT INTO DBO.Product
			(Name,Brand_Id,Description,CreatedDate,CreatedUser,
				UpdatedDate,UpdatedUser,Price,RecommendedReason,
				RecommendUser,Store_Id,Tag_Id,SortOrder,Status)
			SELECT ps.name,
			B.Id,
			ps.Description+ISNULL(ps.DescripOfPromotion,''''),
			GETDATE(),
			ps.InUserId,
			GETDATE(),
			ps.InUserId,
			ps.Price,
			'''',
			0,
			s.Id,
			t.Id,
			1,
			1
			 FROM DBO.ProductStage ps WITH(NOLOCK)
			Inner join DBO.Brand b WITH(NOLOCK)
				ON B.Name = ps.BrandName
			LEFT JOIN DBO.Tag t with(NOLOCK)
				ON t.Name = ps.Tag
			INNER JOIN DBO.Store s with(NOLOCK)
				ON s.Name = PS.Store
			WHERE ps.id = @Id
			SET @PId = SCOPE_IDENTITY();
			--CREATE RESOURCE
			DECLARE @resourceInsert TABLE(Id int)
			UPDATE DBO.ResourceStage
			SET Status= 1
			OUTPUT deleted.id INTO @resourceInsert(Id)
			FROM DBO.ResourceStage rs
			WHERE Status = 0
				AND InUser = @inUser
				AND UploadGroupId = @jobId
				AND rs.ItemCode = @ItemCode
				
			 INSERT INTO Resources
			(SourceId,SourceType,Name,CreatedUser,CreatedDate,
			 UpdatedDate,UpdatedUser,SortOrder,Type,Status,Size
			 ,Width,Height,ContentSize,ExtName)
			 SELECT @PId,
				1,
				rs.Name,
				rs.InUser,
				GETDATE(),
				GETDATE(),
				rs.InUser,
				rs.SortOrder,
				1,
				1,
				rs.Size,
				rs.Width,
				rs.Height,
				rs.ContentSize,
				rs.ExtName
			 FROM dbo.ResourceStage rs WITH(NOLOCK)
			 WHERE EXISTS (SELECT 1 FROM @resourceInsert ri
							WHERE ri.Id = rs.id)
			--CREATE Subject-Prod relation
			IF (@Subjects IS NOT NULL 
			AND LEN(LTRIM(RTRIM(@Subjects)))>0 )
				INSERT INTO DBO.SpecialTopicProductRelations
				(SpecialTopic_Id,Product_Id,Status,CreatedUser,CreatedDate,UpdatedUser,UpdatedDate)
				SELECT PS.ID,
						@PId,
						1,
						@inUser,
						GETDATE(),
						@inUser,
						GETDATE()
				FROM DBO.fn_ParseDelimString(@Subjects,'','') PS
				WHERE PS.ID>0
			--CREATE Promotion-Prod relation
			IF (@Promotions IS NOT NULL 
			AND LEN(LTRIM(RTRIM(@Promotions)))>0 )
				INSERT INTO DBO.Promotion2Product
				(ProdID,ProId,Status)
				SELECT @PId,
						PP.ID,
						1
				FROM DBO.fn_ParseDelimString(@Promotions,'','') PP
				WHERE PP.ID >0
			--UPDATE STAGE STATUS
			UPDATE DBO.ProductStage
			SET Status= 5
			WHERE id = @Id
			UPDATE DBO.ProductUploadJob
			SET Status = 5
			WHERE id = @jobId
			INSERT INTO @OutTable(ItemCode,Status,PublishMemo)
			VALUES
			(
				@ItemCode,
				5,
				''''
			)
		  COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			PRINT ERROR_NUMBER();
			PRINT ERROR_SEVERITY();
			PRINT ERROR_STATE();
			PRINT ERROR_PROCEDURE() 
			PRINT ERROR_LINE() 
			PRINT ERROR_MESSAGE() 
			IF (XACT_STATE()) = -1
			BEGIN
				ROLLBACK TRANSACTION;
			END;
			IF (XACT_STATE()) = 1
			BEGIN
				COMMIT TRANSACTION;   
			END;
			INSERT INTO @OutTable(ItemCode,Status,PublishMemo)
			VALUES
			(
				@ItemCode,
				4,
				''''
			)
		END CATCH
		-- Get the next vendor.
		FETCH NEXT FROM stage_cursor 
		INTO @Id, @Promotions, @ItemCode,@Subjects
	END 

	CLOSE stage_cursor;
	DEALLOCATE stage_cursor;
	SELECT * FROM @OutTable

END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[ProductStagePublish]    Script Date: 04/07/2013 09:47:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductStagePublish]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ProductStagePublish]
(
	@inUser int
)
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	IF (@inUser IS NULL OR
		@inUser = 0)
		RETURN
	BEGIN TRY
    BEGIN TRANSACTION;
		DECLARE @ItemsInserted TABLE(Id int,ItemCode varchar(64))
		DECLARE @ProductInserted TABLE(PId int)
		--UPDATE STATUS TO LIVE
		UPDATE DBO.ProductStage
		SET Status= 5
		OUTPUT deleted.id, deleted.ItemCode INTO @ItemsInserted (Id,ItemCode)
		WHERE InUserId = @inUser
         AND Status = 4
         -- CREATE PRODUCT
        INSERT INTO DBO.Product
        (Name,Brand_Id,Description,CreatedDate,CreatedUser,
         UpdatedDate,UpdatedUser,Price,RecommendedReason,
         RecommendUser,Store_Id,Tag_Id,SortOrder,Status)
         OUTPUT inserted.Id INTO @ProductInserted
         SELECT ps.name,
			B.Id,
			ps.Description+ISNULL(ps.DescripOfPromotion,''''),
			GETDATE(),
			ps.InUserId,
			GETDATE(),
			ps.InUserId,
			ps.Price,
			'''',
			0,
			s.Id,
			t.Id,
			1,
			1
         FROM DBO.ProductStage ps WITH(NOLOCK)
         Inner join DBO.Brand b WITH(NOLOCK)
			ON B.Name = ps.BrandName
		 LEFT JOIN DBO.Tag t with(NOLOCK)
			ON t.Name = ps.Tag
		 INNER JOIN DBO.Store s with(NOLOCK)
			ON s.Name = PS.Store
		 INNER JOIN @ItemsInserted ii
			ON II.Id = ps.id
		 ORDER BY ii.Id
		 --CREATE RESOURCE
		DECLARE @resourceInsert TABLE(Id int)
		UPDATE DBO.ResourceStage
		SET Status= 1
		OUTPUT deleted.id INTO @resourceInsert(Id)
		FROM DBO.ResourceStage rs, @ItemsInserted ii
		WHERE Status = 0
			AND InUser = @inUser
			AND ii.ItemCode = rs.ItemCode
		 
		 ;WITH merged(id,pid,itemcode) AS
		 (
			SELECT ii.id,pi.pid,ii.itemcode
			FROM (SELECT ROW_NUMBER() OVER(ORDER BY id ASC) AS RN,id,itemcode FROM @ItemsInserted) ii
			INNER JOIN (SELECT ROW_NUMBER() OVER(ORDER BY pid ASC) AS RN ,pid FROM @ProductInserted) pi
				ON pi.RN = ii.RN
		 )
		 INSERT INTO Resources
		 (SourceId,SourceType,Name,CreatedUser,CreatedDate,
		 UpdatedDate,UpdatedUser,SortOrder,Type,Status,Size
		 ,Width,Height,ContentSize,ExtName)
         SELECT mg.pid,
				1,
				rs.Name,
				rs.InUser,
				GETDATE(),
				GETDATE(),
				rs.InUser,
				rs.SortOrder,
				1,
				1,
				rs.Size,
				rs.Width,
				rs.Height,
				rs.ContentSize,
				rs.ExtName
		 FROM dbo.ResourceStage rs WITH(NOLOCK), merged mg
		 WHERE mg.ItemCode = rs.ItemCode
			AND EXISTS (SELECT 1 FROM @resourceInsert ri
						WHERE ri.Id = rs.id)
		
		SELECT Status = 1,
			   AffectedRows = COUNT(*)
		FROM @ItemsInserted
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		
		IF (XACT_STATE()) = -1
		BEGIN
			ROLLBACK TRANSACTION;
		END;
		IF (XACT_STATE()) = 1
		BEGIN
			COMMIT TRANSACTION;   
		END;
	END CATCH;
END
' 
END
GO
/****** Object:  ForeignKey [FK_Bill_Tag]    Script Date: 04/07/2013 09:47:05 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bill_Tag]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bill]'))
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Tag] FOREIGN KEY([Tag_Id])
REFERENCES [dbo].[Tag] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bill_Tag]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bill]'))
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Tag]
GO
/****** Object:  ForeignKey [FK_Bill_User]    Script Date: 04/07/2013 09:47:05 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bill_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bill]'))
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_User] FOREIGN KEY([User_Id])
REFERENCES [dbo].[User] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bill_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bill]'))
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_User]
GO
/****** Object:  ForeignKey [FK_Comment_User]    Script Date: 04/07/2013 09:47:05 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comment_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comment]'))
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([User_Id])
REFERENCES [dbo].[User] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comment_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comment]'))
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
/****** Object:  ForeignKey [FK_Product_Brand]    Script Date: 04/07/2013 09:47:06 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_Brand]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([Brand_Id])
REFERENCES [dbo].[Brand] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_Brand]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
/****** Object:  ForeignKey [FK_Product_Store]    Script Date: 04/07/2013 09:47:06 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_Store]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Store] FOREIGN KEY([Store_Id])
REFERENCES [dbo].[Store] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_Store]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Store]
GO
/****** Object:  ForeignKey [FK_Product_Tag]    Script Date: 04/07/2013 09:47:06 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_Tag]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Tag] FOREIGN KEY([Tag_Id])
REFERENCES [dbo].[Tag] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_Tag]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Tag]
GO
/****** Object:  ForeignKey [FK_Product_User]    Script Date: 04/07/2013 09:47:06 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_User] FOREIGN KEY([RecommendUser])
REFERENCES [dbo].[User] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_User]
GO
/****** Object:  ForeignKey [FK_Store_Group]    Script Date: 04/07/2013 09:47:07 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Store_Group]') AND parent_object_id = OBJECT_ID(N'[dbo].[Store]'))
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [FK_Store_Group] FOREIGN KEY([Group_Id])
REFERENCES [dbo].[Group] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Store_Group]') AND parent_object_id = OBJECT_ID(N'[dbo].[Store]'))
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [FK_Store_Group]
GO
/****** Object:  ForeignKey [FK_User_Store]    Script Date: 04/07/2013 09:47:08 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Store]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Store] FOREIGN KEY([Store_Id])
REFERENCES [dbo].[Store] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Store]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Store]
GO
/****** Object:  ForeignKey [FK_UserAccount_User]    Script Date: 04/07/2013 09:47:08 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserAccount_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserAccount]'))
ALTER TABLE [dbo].[UserAccount]  WITH CHECK ADD  CONSTRAINT [FK_UserAccount_User] FOREIGN KEY([User_Id])
REFERENCES [dbo].[User] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserAccount_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserAccount]'))
ALTER TABLE [dbo].[UserAccount] CHECK CONSTRAINT [FK_UserAccount_User]
GO
/****** Object:  ForeignKey [FK_UserRole_Role]    Script Date: 04/07/2013 09:47:08 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_Role]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole]'))
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([Id])
REFERENCES [dbo].[Role] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_Role]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole]'))
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
/****** Object:  ForeignKey [FK_UserRole_User]    Script Date: 04/07/2013 09:47:08 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole]'))
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([User_Id])
REFERENCES [dbo].[User] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole]'))
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
