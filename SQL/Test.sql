USE [ATestDyanicEF]
GO
/****** Object:  StoredProcedure [dbo].[CreateLookupTbl]    Script Date: 21/06/2017 18:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[Test] 
	-- Add the parameters for the stored procedure here
	@TableName varchar(30) ,  --TODO create unique holding table 
	
	@col1 varchar(300) = '',
	@col1Value varchar(30) = ''
	

	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Declare @SQL varchar(300) = 'Select (*) from ';

	set @SQL = @SQL + QUOTENAME(@TableName) + ' where ' + QUOTENAME(@col1) + ' = ' + @col1Value ;

	exec (@SQL)


	
END
