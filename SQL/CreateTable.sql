USE [ATestDyanicEF]
GO
/****** Object:  StoredProcedure [dbo].[CreateLookupTbl]    Script Date: 20/06/2017 16:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[CreateLookupTbl] 
	-- Add the parameters for the stored procedure here
	@TableName varchar(30) ,  --TODO create unique holding table 
	@Totalcols int = 1,       --  *** column names must be in the same order as in the csv file for bulk import
	@col1 varchar(300) = '',
	@DropDBFirst bit  = 1 ,
	@BulkInsertFilePath varchar(200)= ''

	
	
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
	Declare @DropSQL varchar(100);
	Declare @BulkInsertSQL varchar(2000) ;
	Declare @AddIdentityColSQL varchar(200);

	if (@DropDBFirst = 1) 
		Begin 
			--TODO check if exixts - 
			set @DropSQL = 'DROP TABLE ' + @TableName ;
			exec(@DropSQL)
		end


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
					-- do this step only on all iterations except last step
					set @commaPosition = (select CHARINDEX(',',@col1,(@commaPosition + 1)));
					set @subStringLen = @commaPosition - @subStringStart;
				end
			else
				-- do this step only on the last iteration
				begin
					set @subStringLen = Len(@col1) - @commaPosition;
				end

			set @i = @i + 1 ;

		End
	
	set @CreateTableStr = SUBSTRING(@CreateTableStr, 1, (LEN(@CreateTableStr) - 1));
	set @CreateTableStr =  @CreateTableStr + ')';
	
	--Create Table
	--TODO  try catch ??
	EXEC (@CreateTableStr);


	--Check if file open elsewhere ??
	set @BulkInsertSQL =  'BULK INSERT ' + @TableName + ' From ' + QUOTENAME(@BulkInsertFilePath)
		+ ' WITH
				(	-- KEEPIDENTITY,
					FIRSTROW = 2,
					FIELDTERMINATOR = '','',  --CSV field delimiter
					ROWTERMINATOR = ''\n'',   --Use to shift the control to next row
					TABLOCK
				)'

	Exec(@BulkInsertSQL);

	--Add Identity to new table
	set @AddIdentityColSQL = 'alter table ' + QUOTENAME(@TableName) + ' ADD [ID] INT IDENTITY(1,1) NOT NULL';
	Exec (@AddIdentityColSQL);
	


END
