
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
alter PROCEDURE CreateLookupTbl 
	-- Add the parameters for the stored procedure here
	@TableName varchar(30) = 'name1',
	@Totalcols int = 0,
	@col1 char(25) = '',
	@col2 char(25) = '',
	@col3 char(25) = ''
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Declare @i int = 0;
	Declare @TblrowDef varchar(30) = '[nvarchar](100) NULL';
	Declare @CreateTableStr varchar(500) = 'CREATE TABLE [dbo].';
	 

	if (@Totalcols > 0) begin set  @CreateTableStr = @CreateTableStr + @TableName + '('  end
	if (@col1  <> '') begin set  @CreateTableStr = @CreateTableStr + @col1 + @TblrowDef  end
	if (@col2  <> '') begin set  @CreateTableStr =  @CreateTableStr + ',' + @col2 + @TblrowDef  end
	if (@col3  <> '') begin set  @CreateTableStr = @CreateTableStr + ',' + @col3 + @TblrowDef  end
	
	set @CreateTableStr = @CreateTableStr + ')';
	
	

	EXEC (@CreateTableStr);


    -- Insert statements for procedure here
	--//SELECT <@Param1, sysname, @p1>, <@Param2, sysname, @p2>
END
GO
