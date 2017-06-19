USE [ATestDyanicEF]
GO
/****** Object:  StoredProcedure [dbo].[CreateLookupTblv2]    Script Date: 19/06/2017 16:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[CreateLookupTblv2] 
	-- Add the parameters for the stored procedure here
	@TableName varchar(30) ,
	@Totalcols int = 1,
	@col1 varchar(300) = ''
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Declare @i int = 1;
	Declare @TblrowDef varchar(30) = '[nvarchar](100) NULL';
	Declare @CreateTableStr varchar(500) = 'CREATE TABLE [dbo].';
	Declare @commaPosition int = 1;
	Declare @subStringStart int = 1;
	Declare @subStringLen int = 1 ;

	set @commaPosition = (select CHARINDEX(',',@col1,@commaPosition));
	set @subStringLen = @commaPosition -1;
	

	while (@i <=  @Totalcols)
	Begin
	
	
	-- set sql to initial create table plus name
	if(@i = 1) 	begin set  @CreateTableStr = @CreateTableStr + @TableName + '('  end
	
	
	set  @CreateTableStr = @CreateTableStr + (select substring(@col1,@subStringStart,@subStringLen)) + @TblrowDef + ','; 
	
	set @subStringStart = @commaPosition + 1 ;

	if (@i < @Totalcols - 1) 
	 begin
		set @commaPosition = (select CHARINDEX(',',@col1,(@commaPosition + 1)));
		set @subStringLen = @commaPosition - @subStringStart;
	 end
	else
	 begin
	 set @subStringLen = Len(@col1) - @commaPosition;
	 end

	 set @i = @i + 1 ;

	End
	
	set @CreateTableStr = SUBSTRING(@CreateTableStr, 1, (LEN(@CreateTableStr) - 1));
	set @CreateTableStr =  @CreateTableStr + ')';
	
	

	EXEC (@CreateTableStr);


END
