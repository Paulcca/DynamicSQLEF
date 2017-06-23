USE [ATestDyanicEF]
GO

/****** Object:  StoredProcedure [dbo].[GetLookUpById]    Script Date: 23/06/2017 19:15:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetLookUpById] 
	-- Add the parameters for the stored procedure here
	@TableName nvarchar(30) ,  	
	@Id int
	

	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Declare @SQL nvarchar(300) = 'Select * from ';

	set @SQL = @SQL + QUOTENAME(@TableName) + ' where [ID] = ' + convert(varchar(10),@Id);

	exec (@SQL)


	
END

GO

