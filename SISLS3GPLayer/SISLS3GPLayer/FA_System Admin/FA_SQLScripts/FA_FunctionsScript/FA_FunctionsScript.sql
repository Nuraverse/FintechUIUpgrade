USE [FA_Treasury_1.0]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_GETFINMONTHSFY]    Script Date: 04/09/2013 12:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SELECT * FROM FN_GETFINANCEMONTHS(1)   
CREATE Function [dbo].[FN_GETFINMONTHSFY]    
(@Company_ID INT,
@StartYearMonth varchar(50),
@EndYearMonth varchar(50)
)      
    
 RETURNS @FinanceTable TABLE (FinMonth VARCHAR(6))      
AS      
BEGIN      
--DECLARE  @FinanceTable TABLE (FinMonth VARCHAR(6))  
--DECLARE @StartYearMonth VARCHAR(10),@EndYearMonth VARCHAR(10)  
--SET @StartYearMonth='201201';  
--SET @EndYearMonth='201405';  
  
--SELECT @StartYearMonth=Year_StartMonth,@EndYearMonth=Year_EndMonth FROM   
--FA_GlobalParameter_Setup WHERE Company_ID=@Company_ID  
  
DECLARE @StartYear INT,@EndYear INT,@StartMonth INT,@EndMonth INT  
  
SET @StartYear= SUBSTRING(@StartYearMonth, 0 ,5)     
SET @EndYear= SUBSTRING(@EndYearMonth, 0 ,5)     
SET @StartMonth= SUBSTRING(@StartYearMonth, 5 ,2)     
SET @EndMonth= SUBSTRING(@EndYearMonth, 5 ,2)     
  
--SELECT @StartYearMonth,@EndYearMonth, @StartYear AS StartYear,@EndYear AS EndYear,@StartMonth,@EndMonth  
  
DECLARE @intMonthCnt INT,@intEndMonth INT  
  
WHILE(@StartYear<=@EndYear)  
 BEGIN  
 DECLARE @Month VARCHAR(6)  
 WHILE (@StartMonth<=12)  
 BEGIN    
  SET @Month=CAST(@StartYear AS VARCHAR(4)) + CASE LEN(CONVERT(VARCHAR, @StartMonth)) WHEN 1     
                              THEN '0' + CONVERT(VARCHAR, @StartMonth)    
                              ELSE CONVERT(VARCHAR, @StartMonth) END  
  INSERT INTO @FinanceTable VALUES(@Month)            
     
  SET @StartMonth=@StartMonth+1;  
  IF(@Month=@EndYearMonth)  
   Break;  
 END  
IF(@Month=@EndYearMonth)  
   Break;  
SET @StartYear=@StartYear+1;  
SET @StartMonth=01;  
END  
 RETURN       
        
End
GO
/****** Object:  UserDefinedFunction [dbo].[FN_SPLIT]    Script Date: 04/09/2013 12:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------  
-- FN_SPLIT_IDs  
----------------------------------------------------  
  
--select * from FN_SPLIT ('23432-345435','-')  
CREATE FUNCTION [dbo].[FN_SPLIT]  
(@IDs varchar(500),  
@char varchar(5))  
RETURNS @TempTable TABLE(IDField varchar(100))  
  
AS  
BEGIN    
   DECLARE @CommaIndex SMALLINT  
   SET @CommaIndex = CHARINDEX(@char, RTRIM(LTRIM(@IDs)))  
   IF @CommaIndex = 0  
   INSERT INTO @TempTable VALUES(CONVERT(varchar ,RTRIM(LTRIM(@IDs))))  
   ELSE   
   BEGIN  
     WHILE LEN(@IDs) > 1  
     BEGIN  
       SET @CommaIndex = CHARINDEX(@char, RTRIM(LTRIM(@IDs)))  
                     INSERT INTO @TempTable VALUES( CONVERT(varchar ,SUBSTRING(RTRIM(LTRIM(@IDs)),1, @CommaIndex - 1)) )  
       SELECT @IDs = SUBSTRING(RTRIM(LTRIM(@IDs)), @CommaIndex + 1 , LEN(RTRIM(LTRIM(@IDs))))  
                      SET @CommaIndex = CHARINDEX(@char, RTRIM(LTRIM(@IDs)))  
       IF @CommaIndex = 0  
          BEGIN  
        INSERT INTO @TempTable VALUES( CONVERT(varchar ,RTRIM(LTRIM(@IDs))) )  
        BREAK  
       END  
     END  
    END  
      RETURN   
  END
GO
/****** Object:  UserDefinedFunction [dbo].[FA_GetMonthYearFormat]    Script Date: 04/09/2013 12:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		M.Saran
-- Create date: 29-Feb-2012
-- Description:	To get Month Year format for the given date
-- =============================================
CREATE FUNCTION [dbo].[FA_GetMonthYearFormat]
(
 @date datetime  
)
RETURNS varchar(10)
AS
BEGIN
	-- Declare the return variable here
 Declare @Value varchar(6)  
  
 declare @year int  
 declare @month int  
  
 select @year = year(@date) , @month = month(@date)  
  
 if @month between 1 and 9  
 begin  
  set @Value = cast(@year as varchar(4)) + '0' + cast(@month as varchar(1))  
 end  
 else  
 begin  
  set @Value = cast(@year as varchar(4)) + cast(@month as varchar(2))  
 end  
  
 -- Return the result of the function  
 RETURN @Value  

END
GO
/****** Object:  UserDefinedFunction [dbo].[FA_FN_GetYearMonthFormat]    Script Date: 04/09/2013 12:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*________________________________________________________________  
   
   AUTHOR       :  Manikandan. R
   CREATED DATE :  04-Apr-2012  
   DESCRIPTION  :  TO GET THE YEAR AND MONTH VALUE  
  ________________________________________________________________ */
CREATE FUNCTION [dbo].[FA_FN_GetYearMonthFormat]  
(  
 @Date datetime  
)  
RETURNS varchar(100)  
AS  
BEGIN  
 DECLARE @Value VARCHAR(6)  
 DECLARE @Year INT  
 DECLARE @Month INT  
  
 SELECT @Year = YEAR(@Date), @Month = MONTH(@Date)  
  
 IF @Month BETWEEN 1 AND 9  
  BEGIN  
    SET @Value = CAST(@Year AS VARCHAR(4)) + '0' + CAST(@Month AS VARCHAR(1))  
  END  
 
 ELSE  
  BEGIN  
    SET @Value = CAST(@Year AS VARCHAR(4)) + CAST(@Month AS VARCHAR(2))  
  END  
  
 -- Return the result of the function  
 RETURN @Value  
  
END
GO
/****** Object:  UserDefinedFunction [dbo].[FA_FN_GetGPSDecimalFormat]    Script Date: 04/09/2013 12:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================    
-- Author:  Muni Kavitha    
-- Create date: 31- Apr-2012   
-- Description: To get the decimal value as per the GPS    
-- =============================================    
CREATE FUNCTION [dbo].[FA_FN_GetGPSDecimalFormat]    
(    
  @Value varchar(100)  
 ,@Company_ID int=0    
)    
RETURNS varchar(100)    
AS    
BEGIN    
 Declare @noofdigits int    
 --set @noofdigits=10    
SET @noofdigits=(SELECT Currency_Max_Suffex FROM FA_GlobalParameter_Setup WHERE Company_ID=@Company_ID)    
    
    
if(@noofdigits=1)    
 begin    
  if(cast(charindex ('.',@Value) as int) > 0)    
  begin    
  select @Value= LEFT(cast(@Value as decimal(20,1)),cast(charindex ('.',@Value)+1 as int))    
  end    
 end    
else if(@noofdigits=2)    
 begin    
  if(cast(charindex ('.',@Value)as int) > 0)    
  begin    
  select @Value= LEFT(cast(@Value as decimal(20,2)),cast(charindex ('.',@Value)+2 as int))    
  end    
 end    
else if(@noofdigits=3)    
 begin    
  if(cast(charindex ('.',@Value) as int) > 0)    
  begin    
  select @Value= LEFT(cast(@Value as decimal(20,3)),cast(charindex ('.',@Value)+3 as int))    
  end    
 end    
else if(@noofdigits=4)    
 begin    
  if(cast(charindex ('.',@Value) as int) > 0)    
  begin    
  select @Value= LEFT(cast(@Value as decimal(20,4)),cast(charindex ('.',@Value)+4 as int))    
  end    
 end    
else if(@noofdigits=5)    
 begin    
  if(cast(charindex ('.',@Value) as int) > 0)    
  begin    
  select @Value= LEFT(cast(@Value as decimal(20,5)),cast(charindex ('.',@Value)+5 as int))    
  end    
    
 end    
else if(@noofdigits=6)    
 begin    
  if(cast(charindex ('.',@Value) as int) > 0)    
  begin    
  select @Value= LEFT(cast(@Value as decimal(20,6)),cast(charindex ('.',@Value)+6 as int))    
  end    
    
 end    
else if(@noofdigits=7)    
 begin    
  if(cast(charindex ('.',@Value) as int) > 0)    
  begin    
  select @Value= LEFT(cast(@Value as decimal(20,7)),cast(charindex ('.',@Value)+7 as int))    
  end    
    
 end    
else if(@noofdigits=8)    
 begin    
  if(cast(charindex ('.',@Value) as int) > 0)    
  begin    
  select @Value= LEFT(cast(@Value as decimal(20,8)),cast(charindex ('.',@Value)+8 as int))    
  end    
    
 end    
else if(@noofdigits=9)    
 begin    
  if(cast(charindex ('.',@Value) as int) > 0)    
  begin    
  select @Value= LEFT(cast(@Value as decimal(20,9)),cast(charindex ('.',@Value)+9 as int))    
  end    
    
 end    
else if(@noofdigits=10)    
 begin    
  if(cast(charindex ('.',@Value) as int) > 0)    
  begin    
  select @Value= LEFT(cast(@Value as decimal(20,10)),cast(charindex ('.',@Value)+10 as int))    
  end    
    
 end    
    
    
    
    
 -- Return the result of the function    
 RETURN @Value    
    
END
GO
/****** Object:  UserDefinedFunction [dbo].[FA_GetApproverName]    Script Date: 04/09/2013 12:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[FA_GetApproverName]        
(        
 @Entity_Type_ID int,        
 @Entity_ID int        
)              
returns varchar(100)        
        
as        
        
begin                                
        
 declare @Entity_Name varchar(1000)        
         
         
         
 IF(@Entity_Type_ID=1)        
         
 BEGIN        
         
  select @Entity_Name=Designation_Name from FA_SYSAD_USERDESIGNATION        
  where Designation_ID=@Entity_ID        
         
         
 END        
         
 ELSE IF(@Entity_Type_ID=2)        
 BEGIN        
         
  select @Entity_Name=User_Level_Name from FA_SYS_UserLevelMapping       
  where User_Level_ID=@Entity_ID        
        
         
 END        
         
 ELSE IF(@Entity_Type_ID=3)        
         
 BEGIN        
         
         
  select @Entity_Name=User_Name from FA_SYS_UserMaster        
  where User_ID=@Entity_ID        
         
 END        
        
        
 return @Entity_Name        
        
end
GO
/****** Object:  UserDefinedFunction [dbo].[Fn_TrimSpace]    Script Date: 04/09/2013 12:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from Fn_TrimSpace('jeya    gomathi')  
CREATE function [dbo].[Fn_TrimSpace]    
(@Input VARCHAR(100) = NULL  
 , @delimiter VARCHAR(10) = NULL)    
   RETURNS VARCHAR(100)    
AS    
    
BEGIN    
    
    IF(@Input IS NULL)    
      RETURN NULL    
    
    DECLARE @Name VARCHAR(100)    
    SET @Name = ''    
    
     
    SELECT @Name = @Name + idfield + ' ' FROM dbo.fn_split(@Input, ' ')    
    RETURN LTRIM(RTRIM(REPLACE(@Name, ' ', @delimiter)))    
    
END
GO
/****** Object:  UserDefinedFunction [dbo].[FN_GETUSERDATEFORMAT]    Script Date: 04/09/2013 12:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================    
-- Author:  Tamilselvan    
-- Create date: 06/02/2012    
-- Description: Function To return Date format    
-- =============================================    
CREATE FUNCTION [dbo].[FN_GETUSERDATEFORMAT]  
(    
 -- Add the parameters for the function here    
 @DATETIME DATETIME,    
 @COMPANY_ID INT    
)    
RETURNS VARCHAR(100)    
AS    
BEGIN    
 -- Declare the return variable here    
 DECLARE @Result varchar(100)    
    
 -- Add the T-SQL statements to compute the return value here    
 Declare @FORMAT varchar(50)    
    
 Select @format = Lookup_Desc from FA_GlobalParameter_Setup AS GPS   
INNER JOIN FA_LOOKUP_DETAILS AS LD ON LD.Lookup_Code=Date_Format AND LookupType_Code=3  WHERE GPS.Company_ID = @COMPANY_ID    
    
 Select @Result =     
 CASE @format
 WHEN 'DD/MM/yyyy'  then convert(varchar(11),@datetime,103)						--01--DD/MM/yyyy
 When 'DD-MM-yyyy'  then Replace(convert(varchar(11),@datetime,103),'/','-')    --02--DD-MM-yyyy
 When 'MM/dd/yyyy'  then convert(varchar(11),@datetime,101)						--09--MM/dd/yyyy
 When 'MM-dd-yyyy'  then Replace(convert(varchar(11),@datetime,101),'/','-')	--10--MM-dd/yyyy   
 When 'dd/MMM/yyyy' then Replace(convert(varchar(11),@datetime,106),' ','/')	--05--dd/MMM/yyyy
 When 'dd-MMM-yyyy' then Replace(convert(varchar(11),@datetime,106),' ','-')	--06--dd-MMM-yyyy 
 When 'dd/MM/yy'    then convert(varchar(11),@datetime,3)						--03--dd/MM/yy
 When 'dd-MM-yy'    then convert(varchar(11),@datetime,5)						--04--dd-MM-yy
 When 'MM/dd/yy'    then convert(varchar(11),@datetime,1)						--11--MM/dd/yy
 When 'MM-dd-yy'    then Replace(convert(varchar(11),@datetime,1),'/','-')		--12--MM-dd-yy   
 When 'dd/MMM/yy'   then Replace(convert(varchar(11),@datetime,6),' ','/')		--07--dd/MMM/yy 
 When 'dd-MMM-yy'   then Replace(convert(varchar(11),@datetime,6),' ','-')		--08--dd-MMM-yy
 When 'MMM/dd/yyyy' then REPLACE(Replace(convert(varchar(11),@datetime,9),'  ','/0'),' ','/')	--13--MMM/dd/yyyy
 When 'MMM-dd-yyyy' then REPLACE(Replace(convert(varchar(11),@datetime,9),'  ','-0'),' ','-')	--14--MMM-dd-yyyy
 WHEN 'MMM/dd/yy' then REPLACE(Replace(convert(varchar(11),@datetime,7),', ','/'),' ','/')		--15--MMM/dd/yy
 WHEN 'MMM-dd-yy' then REPLACE(Replace(convert(varchar(11),@datetime,7),', ','-'),' ','-')		--15--MMM-dd-yy
 else convert(varchar(11),@datetime,103)    end    
    
 -- Return the result of the function    
 RETURN @Result    
    
END
GO
/****** Object:  UserDefinedFunction [dbo].[FN_GET_CURRENCY_CODE]    Script Date: 04/09/2013 12:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tamilselvan.S
-- Create date: 22/03/2012
-- Description:	To Get the Currency Code based currency ID
-- =============================================
CREATE FUNCTION [dbo].[FN_GET_CURRENCY_CODE]
(@Currency_ID INT
,@Company_ID INT)    
RETURNS VARCHAR(5)
AS
BEGIN
  
  Declare @Currency_Code VARCHAR(5)
    
  Select @Currency_Code=Currency_Code From FA_SYS_CurrencyMaster   
   Where Currency_ID=@Currency_ID -- and Company_ID=@Company_ID  
    
  Return @Currency_Code    

END
GO
/****** Object:  UserDefinedFunction [dbo].[FN_GETFINANCEMONTHS]    Script Date: 04/09/2013 12:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SELECT * FROM FN_GETFINANCEMONTHS(1) 
CREATE Function [dbo].[FN_GETFINANCEMONTHS]  
(@Company_ID INT)    
  
 RETURNS @FinanceTable TABLE (FinMonth VARCHAR(6))    
AS    
BEGIN    
--DECLARE  @FinanceTable TABLE (FinMonth VARCHAR(6))
DECLARE @StartYearMonth VARCHAR(10),@EndYearMonth VARCHAR(10)
--SET @StartYearMonth='201201';
--SET @EndYearMonth='201405';

SELECT @StartYearMonth=Year_StartMonth,@EndYearMonth=Year_EndMonth FROM 
FA_GlobalParameter_Setup WHERE Company_ID=@Company_ID

DECLARE @StartYear INT,@EndYear INT,@StartMonth INT,@EndMonth INT

SET @StartYear= SUBSTRING(@StartYearMonth, 0 ,5)   
SET @EndYear= SUBSTRING(@EndYearMonth, 0 ,5)   
SET @StartMonth= SUBSTRING(@StartYearMonth, 5 ,2)   
SET @EndMonth= SUBSTRING(@EndYearMonth, 5 ,2)   

--SELECT @StartYearMonth,@EndYearMonth, @StartYear AS StartYear,@EndYear AS EndYear,@StartMonth,@EndMonth

DECLARE @intMonthCnt INT,@intEndMonth INT

WHILE(@StartYear<=@EndYear)
 BEGIN
	DECLARE @Month VARCHAR(6)
	WHILE (@StartMonth<=12)
	BEGIN		
		SET @Month=CAST(@StartYear AS VARCHAR(4)) + CASE LEN(CONVERT(VARCHAR, @StartMonth)) WHEN 1   
                              THEN '0' + CONVERT(VARCHAR, @StartMonth)  
                              ELSE CONVERT(VARCHAR, @StartMonth) END
		INSERT INTO @FinanceTable VALUES(@Month)          
			
		SET @StartMonth=@StartMonth+1;
		IF(@Month=@EndYearMonth)
			Break;
	END
IF(@Month=@EndYearMonth)
			Break;
SET @StartYear=@StartYear+1;
SET @StartMonth=01;
END
 RETURN     
      
End
GO
/****** Object:  UserDefinedFunction [dbo].[FN_Get_LocationID]    Script Date: 04/09/2013 12:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[FN_Get_LocationID](@Location_Code Varchar(30),@Company_ID int)    
Returns Int    
As    
 Begin    
    
  Declare @Location_ID Int    
    
  Select @Location_ID=Location_ID From FA_SYS_LOCA_MST    
   Where Location_Code=@Location_Code  and Company_ID=@Company_ID  

  Return @Location_ID    
 
 End
GO
/****** Object:  UserDefinedFunction [dbo].[FN_Get_LocationCode]    Script Date: 04/09/2013 12:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[FN_Get_LocationCode](@Location_ID INT,@Company_ID INT)        
Returns VARCHAR(30)        
As        
 Begin        
        
  Declare @Location_Code VARCHAR(30)        
        
  Select @Location_Code=Location_Code From FA_SYS_LOCA_MST        
   Where Location_ID=@Location_ID  and Company_ID=@Company_ID  --and Is_Operational=1    
        
  Return @Location_Code        
        
 End
GO
/****** Object:  UserDefinedFunction [dbo].[FN_GET_INV_FUND_AMOUNT]    Script Date: 04/09/2013 12:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select dbo.FN_GET_INV_FUND_AMOUNT(1,null,2,1,NULL,NULL,44)                 
                
-- =============================================                  
-- Author:  M.Saran                  
-- Create date: 19-Mar-2012                  
-- Description: To get amount from investment and funder based on id and type                  
-- =============================================                  
CREATE FUNCTION [dbo].[FN_GET_INV_FUND_AMOUNT]                 
(                
 -- Add the parameters for the function here                
 @Company_ID int,              
 @Location_ID int=null,                 
 @Entity_Type int,                  
 @ID int ,        
 @From_Date datetime=null,             
 @To_Date datetime =null ,      
 @CF_Flag_ID int=null ,  
 @CashFlow_ID   int=null   
)                
RETURNS numeric(25,4)                
AS                
BEGIN                
 -- Declare the return variable here                
 DECLARE @Amount numeric(25,4)                
    SET @Amount=0                
                
 if(@Entity_Type=1) --Entity                  
 begin --begin if(@Entity_Type=1) --Entity                  
                   
 select @Amount=sum(Total_Amount) from FA_INVESTMENT_TRAN_HDR as ITH                  
 inner join FA_INVESTMENT_TRAN_DTL as ITD on ITD.Invest_Header_ID=ITH.Invest_Header_ID                 
 where ITH.Company_ID=@Company_ID AND ITH.Transaction_Type=2  AND ITH.Entity_Detail_ID=@ID             
AND   Investment_Type !=1 --Exclude equity shares            
 --AND ITD.Location_ID=isnull(@Location_ID,ITD.Location_ID)            
AND   ITH.Date BETWEEN ISNULL(@From_Date,ITH.Date) AND ISNULL(@To_Date,ITH.Date)        
                    
 end--end if(@Entity_Type=1) --Entity                  
                   
 else if(@Entity_Type=2) --Funder                  
 begin --begin else if(@Entity_Type=2) --Funder          
      
if(@CF_Flag_ID=38)      
begin      
      
 select @Amount=sum(FTD.Repay_Amount) from   FA_FUNDER_TRAN_MST as FTM (NOLOCK)                
 inner join                
 FA_FUNDER_TRAN_DTL1 as FTD (NOLOCK) on FTM.Funder_Tran_ID=FTD.Funder_Tran_ID                
 where FTM.Company_ID=@Company_ID AND FTM.Funder_ID=@ID AND JV_No is  null --and Repay_Date <=getdate()                
 AND  FTD.Repay_Date BETWEEN ISNULL(@From_Date,FTD.Repay_Date) AND ISNULL(@To_Date,FTD.Repay_Date)        
      
end      
else if(@CF_Flag_ID=36)      
begin      
      
 select       
 @Amount=sum(FTD.Due_Amount)       
 from   FA_FUNDER_TRAN_MST as FTM (NOLOCK)                
 inner join                
 FA_FUNDER_INT_DUE as FTD (NOLOCK) on FTM.Funder_Tran_ID=FTD.Funder_Tran_ID                
 where FTM.Company_ID=@Company_ID AND FTM.Funder_ID=@ID AND Payment_Ref_No is  null and Due_Date <= getdate()      
 AND  FTD.Due_Date BETWEEN ISNULL(@From_Date,FTD.Due_Date) AND ISNULL(@To_Date,FTD.Due_Date)        
      
      
end              
                   
  
  
else if(@CF_Flag_ID in (49,50,51,52))      
begin     
   
select       
 @Amount=sum(FTD.CFAmount)    from     
 FA_FUNDER_TRAN_MST as FTM (NOLOCK)                
 inner join                
 FA_FUNDER_TRAN_CF as FTD (NOLOCK) on FTM.Funder_Tran_ID=FTD.Funder_Tran_ID                
 where FTM.Company_ID=@Company_ID AND FTM.Funder_ID=@ID   
 AND CashFlowID=@CashFlow_ID  
 AND JV_No is  null and CFDate <=getdate()                
 AND  FTD.CFDate BETWEEN ISNULL(@From_Date,FTD.CFDate) AND ISNULL(@To_Date,FTD.CFDate)    
      
end    
  
         
                  
 end --end  else if(@Entity_Type=2) --Funder                  
                
              
                
 -- Return the result of the function                
 RETURN @Amount                
                
END
GO
/****** Object:  UserDefinedFunction [dbo].[FN_Get_GLSLDEscription]    Script Date: 04/09/2013 12:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--FA_ACCOUNT_DETAIL
--FA_ACCOUNT_ENTITY_DETAIL
-- =============================================
-- Author:		M.Saran
-- Create date: 31-MAr-2012
-- Description:	to get Description for the given GL,SLCode
-- =============================================
CREATE FUNCTION [dbo].[FN_Get_GLSLDEscription]
(
	@Company_Id int ,
	@Option int , --1-GLCode,2-SLCode
	@GLCode varchar(50),
	@SLCode varchar(50)=null

)
RETURNS varchar(250)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Description varchar(250)
set @Description=''

if(@Option=1)--GLDescription
begin--begin if(@Option=1)--GLDescription

select @Description=GL_Desc from FA_ACCOUNT_MASTER with (nolock) where Company_ID=@Company_Id AND GL_Code=@GLCode

end--end if(@Option=1)--GLDescription
else if(@Option=2)--SLDescription
begin--begin else if(@Option=2)--SLDescription

select
  @Description=(case when AM.Acct_Type_ID <=4 then AED.SL_Desc else AD.SL_Desc end)  
from
 FA_ACCOUNT_MASTER as AM (nolock) 
  left outer join                
  FA_ACCOUNT_ENTITY_DETAIL as AED (NOLOCK) on AED.GL_Code=AM.GL_Code  AND isnull(AED.SL_COde,'')=isnull(@SLCode,isnull(AED.SL_COde,''))                  
  left outer join                
  FA_ACCOUNT_DETAIL as AD (NOLOCK) on AD.GL_Code=AM.GL_Code AND isnull(AD.SL_COde,'')=isnull(@SLCode,isnull(AD.SL_COde,''))            
where AM.Company_ID=@Company_Id AND AM.GL_Code=@GLCode

end--end else if(@Option=2)--SLDescription

	-- Return the result of the function
	RETURN @Description

END
GO
/****** Object:  UserDefinedFunction [dbo].[FN_GET_DEF_CURR_ID]    Script Date: 04/09/2013 12:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec FN_GET_DEF_CURR_ID 1,null

-- =============================================    
-- Author:  M.saran    
-- Create date: 22-Mar-2012    
-- Description: To get default currency Id for the selected Location.    
-- =============================================    
CREATE FUNCTION [dbo].[FN_GET_DEF_CURR_ID]    
(    
@Company_Id int,    
@Location_ID int  
)    
RETURNS int    
AS    
BEGIN    
 -- Declare the return variable here    
 DECLARE @Def_Currency_ID int    
  
if exists(select 'x' from  FA_GlobalParameter_Setup where Company_ID=@Company_Id and Currency_Level_ID=1)  
begin-- begin Location level currency  
  
declare @Parent_ID int    
declare @LcoationCur_ID int    
    
select @Parent_ID=Parent_ID from FA_SYS_LOCA_MST where Company_Id=@Company_Id AND Location_ID=@Location_ID    
select @LcoationCur_ID=Currency_Id from FA_SYS_CompanyLocCurrency where Company_Id=@Company_Id AND Location_ID=@Location_ID    
     
 if(@LcoationCur_ID is null)    
 begin    
  while(@Parent_ID is not null)    
  begin    
    
   select @Parent_ID=Parent_ID from FA_SYS_LOCA_MST     
   where Company_Id=@Company_Id AND Location_ID=@Parent_ID    
    
   select @LcoationCur_ID=Currency_Id from FA_SYS_CompanyLocCurrency     
   where Company_Id=@Company_Id AND Location_ID=@Parent_ID    
   if(@LcoationCur_ID is not null)    
    set @Parent_ID=null    
  end    
 end    
  
end-- end Location level currency  
else  
begin --begin Company Level Currency  
  
  select @LcoationCur_ID=Currency_ID from FA_SYS_CompanyCurrency where Company_ID=@Company_Id AND Default_Currency_ID=1  
   
end--end Company Level Currency  
 -- Return the result of the function    
 RETURN @LcoationCur_ID    
    
END
GO
/****** Object:  UserDefinedFunction [dbo].[FN_GETNEXTFINYEAR]    Script Date: 04/09/2013 12:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[FN_GETNEXTFINYEAR]    
(@Company_ID INT,
  @FinYear  VARCHAR(25)= NULL
 )      
    
 RETURNS VARCHAR(25)
 AS
 BEGIN      
  DECLARE @MonthEnd AS VARCHAR(10)    
  DECLARE @Year AS VARCHAR(10)    
  DECLARE @COUNT AS INT    
  DECLARE @MonthENDDate AS VARCHAR(30)    
  DECLARE @MonthStartDate AS  VARCHAR(30)    
  DECLARE @Month AS VARCHAR(10)    
  DECLARE @FinMonth VARCHAR(10)    
  DECLARE @CURDATE VARCHAR(20)    
  DECLARE @MonthStartDateYear  VARCHAR(30)    
  DECLARE @MonthStartDateMonth  VARCHAR(30)    
  DECLARE @StartMonth  VARCHAR(30)    
  DECLARE @MonthENDDateYear VARCHAR(30)    
  DECLARE @MonthENDDateMonth VARCHAR(30)    
  DECLARE @ENDMonth VARCHAR(30)    
  DECLARE @NEWFINYEAR  VARCHAR(30)     
  DECLARE @FIN_MONTH VARCHAR(30)    
  DECLARE @INCR INT    
  DECLARE @FIN_MONTH_DATE VARCHAR(30)    
  DECLARE @FIN_MONTH_MONTH VARCHAR(30)    
  DECLARE @FIN_MONTH_YR VARCHAR(30)    
 
  SET @MonthEnd = (SELECT TOP 1 Year_EndMonth FROM  FA_GlobalParameter_Setup     
                     WHERE COMPANY_ID = @Company_ID AND Financial_Year = ISNULL(@FinYear,Financial_Year))          
  SET @Month = SUBSTRING(@MonthEnd,5, 2)     
  SET @Year =  SUBSTRING(@MonthEnd,0, 5)     
  SET @CURDATE = @Month + '/' + '01' + '/' +  @Year    
  SET @MonthStartDate = DATEADD(MONTH,1,@CURDATE)    
  SET @MonthStartDateYear = (DATEPART(YEAR, @MonthStartDate) )    
  SET @MonthStartDateMonth = (DATEPART(MONTH, @MonthStartDate))     
  IF (@MonthStartDateMonth < 10)    
   BEGIN      
    SET @StartMonth = (@MonthStartDateYear + '0'+ @MonthStartDateMonth)     
   END    
  ELSE    
   BEGIN    
    SET @StartMonth = (@MonthStartDateYear + '' + @MonthStartDateMonth)     
   END    
    
  SET  @COUNT = (SELECT COUNT (FinMonth) FROM FN_GETFINANCEMONTHS(@Company_ID))    
  SET @MonthENDDate = DATEADD(MONTH, @COUNT,@CURDATE )    
  SET @MonthENDDateYear = (DATEPART(YEAR, @MonthENDDate) )    
  SET @MonthENDDateMonth = (DATEPART(MONTH, @MonthENDDate))     
  IF(@MonthENDDateMonth < 10)    
   BEGIN      
     SET @ENDMonth = (@MonthENDDateYear + '0'+ @MonthENDDateMonth)     
   END    
  ELSE    
   BEGIN     
     SET @ENDMonth = (@MonthENDDateYear + '' + @MonthENDDateMonth)     
   END    
  SET @ENDMonth = (@MonthENDDateYear + '0'+ @MonthENDDateMonth)     

  SET @NEWFINYEAR = SUBSTRING(@StartMonth, 0,5) + '-' + SUBSTRING(@ENDMonth, 0,5)     
 -- SELECT @NEWFINYEAR 
 
 RETURN @NEWFINYEAR     
        
End
GO
/****** Object:  UserDefinedFunction [dbo].[FN_GetLocationSubLevels]    Script Date: 04/09/2013 12:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SELECT * FROM DBO.[FN_GetLocationSubLevels] (NULL)    
 -- =============================================          
-- AUTHOR:  JEYAGOMATHI M      
-- CREATE DATE: 10-MAY-2012    
-- DESCRIPTION: TO BRING THE SUBLEVEL DETAILS OF A LOCATION BASED ON THE LOCATION CODE.          
-- =============================================       
    
CREATE FUNCTION   [dbo].[FN_GetLocationSubLevels]             
(      
 @Location_ID INT =NULL ,  
 @COMPANY_ID INT         
)    
RETURNS @TBL_LevelDetails TABLE(Company_ID INT,Location_ID INT,Parent_ID INT,Location_Code varchar(30), Location_Category_ID INT,Is_Active BIT)            
AS            
BEGIN     
DECLARE @Level INT    
--SET @Location_ID=6;    
IF(@Location_ID IS NULL OR @Location_ID='')    
BEGIN    
Insert   INTO     @TBL_LevelDetails     
 SELECT Company_ID,Location_ID,Parent_ID,Location_Code,Location_Category_ID,      
Is_Active from FA_SYS_LOCA_MST lm -- where Is_Operational=1  
END    
    
ELSE    
BEGIN    
    
SELECT @Level=Hierarchy_Type FROM FA_SYS_LOCA_CAT where Location_Category_ID in (    
select Location_Category_ID from FA_SYS_LOCA_MST WHERE Location_ID=@Location_ID )    
    
--SELECT @Level    
    
IF(@Level=5)    
 BEGIN     
 Insert   INTO     @TBL_LevelDetails     
  SELECT Company_ID,Location_ID,Parent_ID,Location_Code,Location_Category_ID,      
 Is_Active from FA_SYS_LOCA_MST where  Location_ID=@Location_ID --and Is_Operational=1   
 END    
ELSE IF(@Level=4)    
BEGIN    
Insert   INTO     @TBL_LevelDetails     
 SELECT * FROM (    
 SELECT Company_ID,Location_ID,Parent_ID,Location_Code,Location_Category_ID,      
Is_Active from FA_SYS_LOCA_MST where  Location_ID=@Location_ID -- and Is_Operational=1  
 UNION    
 SELECT Company_ID,Location_ID,Parent_ID,Location_Code,Location_Category_ID,      
Is_Active FROM FA_SYS_LOCA_MST where Parent_ID =@Location_ID )TM    
END    
ELSE IF(@Level=3)    
BEGIN    
Insert   INTO     @TBL_LevelDetails     
 SELECT * FROM (    
 SELECT Company_ID,Location_ID,Parent_ID,Location_Code,Location_Category_ID,      
 Is_Active from FA_SYS_LOCA_MST where  Location_ID=@Location_ID     
 UNION    
 SELECT Company_ID,Location_ID,Parent_ID,Location_Code,Location_Category_ID,      
Is_Active FROM FA_SYS_LOCA_MST where Parent_ID =@Location_ID  
UNION    
 SELECT Company_ID,Location_ID,Parent_ID,Location_Code,Location_Category_ID,      
Is_Active FROM FA_SYS_LOCA_MST where Parent_ID in ( SELECT Location_ID FROM FA_SYS_LOCA_MST where Parent_ID =@Location_ID )    
)TM    
END    
ELSE IF(@Level=2)    
BEGIN    
Insert   INTO     @TBL_LevelDetails     
 SELECT * FROM (    
 SELECT Company_ID,Location_ID,Parent_ID,Location_Code,Location_Category_ID,      
Is_Active from FA_SYS_LOCA_MST where  Location_ID=@Location_ID   
UNION    
 SELECT Company_ID,Location_ID,Parent_ID,Location_Code,Location_Category_ID,      
Is_Active FROM FA_SYS_LOCA_MST where Parent_ID =@Location_ID  
UNION    
 SELECT Company_ID,Location_ID,Parent_ID,Location_Code,Location_Category_ID,      
Is_Active FROM FA_SYS_LOCA_MST where Parent_ID in ( SELECT Location_ID FROM FA_SYS_LOCA_MST where Parent_ID =@Location_ID )    
UNION    
 SELECT Company_ID,Location_ID,Parent_ID,Location_Code,Location_Category_ID,      
Is_Active FROM FA_SYS_LOCA_MST where Parent_ID in (SELECT Location_ID FROM FA_SYS_LOCA_MST where Parent_ID in     
(SELECT Location_ID FROM FA_SYS_LOCA_MST where Parent_ID =@Location_ID )))TM    
END    
    
ELSE IF(@Level=1)    
BEGIN    
Insert   INTO     @TBL_LevelDetails     
 SELECT * FROM (    
 SELECT Company_ID,Location_ID,Parent_ID,Location_Code,Location_Category_ID,      
Is_Active from FA_SYS_LOCA_MST where  Location_ID=@Location_ID  --and Is_Operational=1  
UNION    
 SELECT Company_ID,Location_ID,Parent_ID,Location_Code,Location_Category_ID,      
Is_Active FROM FA_SYS_LOCA_MST where Parent_ID =@Location_ID --and Is_Operational=1   
UNION    
 SELECT Company_ID,Location_ID,Parent_ID,Location_Code,Location_Category_ID,      
Is_Active FROM FA_SYS_LOCA_MST where Parent_ID in ( SELECT Location_ID FROM FA_SYS_LOCA_MST where Parent_ID =@Location_ID )    
UNION    
 SELECT Company_ID,Location_ID,Parent_ID,Location_Code,Location_Category_ID,      
Is_Active FROM FA_SYS_LOCA_MST where Parent_ID in (SELECT Location_ID FROM FA_SYS_LOCA_MST where Parent_ID in     
(SELECT Location_ID FROM FA_SYS_LOCA_MST where Parent_ID =@Location_ID ))    
UNION    
 SELECT Company_ID,Location_ID,Parent_ID,Location_Code,Location_Category_ID,      
Is_Active FROM FA_SYS_LOCA_MST where  Parent_ID in (SELECT Location_ID FROM FA_SYS_LOCA_MST where Parent_ID in (SELECT Location_ID FROM FA_SYS_LOCA_MST where Parent_ID in     
(SELECT Location_ID FROM FA_SYS_LOCA_MST where Parent_ID =@Location_ID ))))TM     
    
END    
    
END    
    
RETURN;    
END
GO
/****** Object:  UserDefinedFunction [dbo].[FN_GETLEVELDETAILS]    Script Date: 04/09/2013 12:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================                    
-- AUTHOR:  JEYAGOMATHI M                
-- CREATE DATE: 10-MAY-2012              
-- DESCRIPTION: TO BRING THE LEVEL DETAILS OF A LOCATION BASED ON THE LOCATION CODE.                    
-- =============================================                    
                    
CREATE FUNCTION   [dbo].[FN_GETLEVELDETAILS]                     
(                     
    @COMPANY_ID INT                     
   ,@PROGRAM_ID INT                     
   ,@USER_ID INT                      
   ,@LOCATION_ID1 INT =NULL                    
   ,@LOCATION_ID2 INT =NULL                    
)                    
RETURNS @TBL_LEVELDETAILS TABLE(LOCATION_ID int)                    
AS                    
BEGIN                    
                  
                
DECLARE @LOCATION1 VARCHAR(30)                  
SET @LOCATION1 = DBO.FN_GET_LOCATIONCODE(@LOCATION_ID1,@COMPANY_ID)+'%'                  
DECLARE @LOCATION2 VARCHAR(30)                  
SET @LOCATION2 = DBO.FN_GET_LOCATIONCODE(@LOCATION_ID2,@COMPANY_ID)+'%'                  
               
 DECLARE @VAR VARCHAR(8000)                    
  SET @VAR =''                    
  IF @LOCATION1 IS NOT NULL AND @LOCATION2 IS NOT NULL                    
     BEGIN                    
            INSERT   INTO     @TBL_LEVELDETAILS                    
           SELECT  DISTINCT LM.Location_ID                   
             FROM  FA_SYS_LOCA_MST LM                    
              INNER JOIN FA_SYS_LOCA_CAT LC ON LM.LOCATION_CATEGORY_ID = LC.LOCATION_CATEGORY_ID AND LM.COMPANY_ID = LC.COMPANY_ID                    
              INNER JOIN  FA_SYS_USERLOCROLEMAPPING ULM ON LM.LOCATION_ID = ULM.LOCATION_ID   AND  ULM.IS_ACTIVE=1                   
              --INNER JOIN S3G_SYSAD_USERROLEMAPPING    URM ON ULM.USER_LOCATION_MAPPING_ID = URM.USER_LOCATION_MAPPING_ID AND ULM.USER_ID = URM.USER_ID  AND  URM.IS_ACTIVE=1              
              INNER JOIN FA_SYS_ROLECODEMASTER  RCM ON ULM.ROLE_ID = RCM.ROLE_CODE_ID                     
              --INNER JOIN  S3G_SYSAD_ROLECENTERMASTER RCE ON RCM.ROLE_CENTER_ID = RCE.ROLE_CENTER_ID                    
         WHERE LM.LOCATION_CODE IN (SELECT LOCATION_CODE FROM FN_GETLOCATIONSUBLEVELS(@LOCATION_ID2,@COMPANY_ID) ) AND ulm.USER_ID =@USER_ID AND RCM.PROGRAM_ID= CAST(@PROGRAM_ID AS VARCHAR)                    
         --  and  LM .Is_Operational=1               
        RETURN                    
     END                    
  IF @LOCATION1 IS NOT NULL AND @LOCATION2 IS NULL                    
     BEGIN                    
 INSERT   INTO     @TBL_LEVELDETAILS                    
        SELECT  DISTINCT LM.Location_ID                    
                 FROM  FA_SYS_LOCA_MST LM                    
              INNER JOIN FA_SYS_LOCA_CAT LC ON LM.LOCATION_CATEGORY_ID = LC.LOCATION_CATEGORY_ID AND LM.COMPANY_ID = LC.COMPANY_ID                    
               INNER JOIN  FA_SYS_USERLOCROLEMAPPING ULM ON LM.LOCATION_ID = ULM.LOCATION_ID   AND  ULM.IS_ACTIVE=1                   
              --INNER JOIN S3G_SYSAD_USERROLEMAPPING    URM ON ULM.USER_LOCATION_MAPPING_ID = URM.USER_LOCATION_MAPPING_ID AND ULM.USER_ID = URM.USER_ID  AND  URM.IS_ACTIVE=1              
              INNER JOIN FA_SYS_ROLECODEMASTER  RCM ON ULM.ROLE_ID = RCM.ROLE_CODE_ID                     
             -- INNER JOIN  S3G_SYSAD_ROLECENTERMASTER RCE ON RCM.ROLE_CENTER_ID = RCE.ROLE_CENTER_ID                    
         WHERE LM.LOCATION_CODE IN ( SELECT LOCATION_CODE FROM FN_GETLOCATIONSUBLEVELS(@LOCATION_ID1,@COMPANY_ID) ) AND ulm.USER_ID =@USER_ID AND RCM.PROGRAM_ID= CAST(@PROGRAM_ID AS VARCHAR)                
          -- and  LM .Is_Operational=1               
            
      RETURN                    
     END                    
  IF @LOCATION1 IS NULL AND @LOCATION2 IS NULL                    
     BEGIN                    
 INSERT   INTO     @TBL_LEVELDETAILS                    
        SELECT  DISTINCT LM.Location_ID                    
              FROM  FA_SYS_LOCA_MST LM                    
              INNER JOIN FA_SYS_LOCA_CAT LC ON LM.LOCATION_CATEGORY_ID = LC.LOCATION_CATEGORY_ID AND LM.COMPANY_ID = LC.COMPANY_ID                    
       INNER JOIN  FA_SYS_USERLOCROLEMAPPING ULM ON LM.LOCATION_ID = ULM.LOCATION_ID   AND  ULM.IS_ACTIVE=1                   
   -- INNER JOIN S3G_SYSAD_USERROLEMAPPING    URM ON ULM.USER_LOCATION_MAPPING_ID = URM.USER_LOCATION_MAPPING_ID AND ULM.USER_ID = URM.USER_ID  AND  URM.IS_ACTIVE=1              
              INNER JOIN FA_SYS_ROLECODEMASTER  RCM ON ULM.ROLE_ID= RCM.ROLE_CODE_ID                     
              --INNER JOIN  S3G_SYSAD_ROLECENTERMASTER RCE ON RCM.ROLE_CENTER_ID = RCE.ROLE_CENTER_ID                    
         WHERE ULM.USER_ID =@USER_ID AND RCM.PROGRAM_ID= CAST(@PROGRAM_ID AS VARCHAR)                     
           --and  LM .Is_Operational=1           
            
    RETURN                      
     END                     
    RETURN                        
 END
GO
/****** Object:  UserDefinedFunction [dbo].[FN_DEFAULT_CURRENCY_AMOUNT]    Script Date: 04/09/2013 12:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================      
-- Author:  Tamilselvan.S      
-- Create date: 20/03/2012      
-- Description: To Convert the Transaction amount into Default Currency amount based location      
-- =============================================      
CREATE FUNCTION [dbo].[FN_DEFAULT_CURRENCY_AMOUNT]       
(  
@Company_ID INT      
,@Location_ID INT  =null    
,@Tran_Currency_ID INT    
,@Amount NUMERIC(25,4)      
)      
RETURNS NUMERIC(25,4)      
AS      
BEGIN      
 -- Declare the return variable here      
 DECLARE @ConvertAmount NUMERIC(25,4),@Def_Curr_Value NUMERIC(25,4),@Tran_Curr_Value NUMERIC(25,4)    
declare @Def_Currency_Id int  
  
set @Def_Currency_Id=[dbo].[FN_GET_DEF_CURR_ID](@Company_ID,@Location_ID)  
  
    
SET @ConvertAmount=@Amount;    
SET @Tran_Curr_Value=1;    
     
 -- Add the T-SQL statements to compute the return value here      
IF(EXISTS (SELECT TOP 1 1 FROM FA_SYS_Exchange_Rate_MST WHERE Company_ID=@Company_ID AND Exch_Cur_Code=@Tran_Currency_ID AND Base_Cur_Code=@Def_Currency_Id))      
BEGIN      
SELECT TOP 1 @Def_Curr_Value=BCC_Def_Value,@Tran_Curr_Value=EXC_Def_Value FROM FA_SYS_Exchange_Rate_MST WHERE Company_ID=@Company_ID AND Exch_Cur_Code=@Tran_Currency_ID  AND Base_Cur_Code=@Def_Currency_Id   
ORDER BY Exchange_Rate_ID DESC    
 SET @ConvertAmount=CAST(((@Def_Curr_Value * @Amount)/@Tran_Curr_Value) AS NUMERIC(25,4));    
END      
      
 -- Return the result of the function      
 RETURN @ConvertAmount;      
      
END
GO
/****** Object:  UserDefinedFunction [dbo].[FA_Get_WC_CC_Amt]    Script Date: 04/09/2013 12:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================    
-- Author     : M.Saran    
-- Create date: <Create Date, ,>    
-- Description: <Description, ,>    
-- =============================================    
--22 WCPTL 39    
--select dbo.FA_Get_WC_CC_Amt(1,2,4,23,'tttt',4)     
CREATE FUNCTION [dbo].[FA_Get_WC_CC_Amt]    
(    
@Company_Id int,    
@Option int,--1-Due Amt 2-Received Amt 3-Availabilty    
@Funder_Id int,--4    
@Deal_Id int=null,--23    
@tranche_Ref_No varchar(50)=null,--tttt    
@Nature_Id int--4    
)    
RETURNS decimal    
AS    
BEGIN    
 -- Declare the return variable here    
 Declare @decAmt decimal    
 set @decAmt=0    
     
 Declare @FunGL_Code varchar(50)    
  Declare @FunSL_Code varchar(50)=null  
     
 select @FunGL_Code=GL_Code from FA_FUNDER_ACCTMAP where Company_ID=@Company_Id     
 and Funder_ID=@Funder_Id and Fund_Type=@Nature_Id    
   
 select @FunSL_Code=sl_code from FA_FUNDER_ACCTMAP where Company_ID=@Company_Id     
 and Funder_ID=@Funder_Id and Fund_Type=@Nature_Id   
    
--print '@FunGL_Code'+@FunGL_Code    
     
    
    
if(@Option=1)--Due Amount    
begin--begin(@Option=1)--Due Amount    
    
 select @decAmt=sum(TD.Tran_Currency_Amount) from FA_TRANSACTION_DET as TD    
 inner join FA_TRANSACTION_HEADER as TH on TD.Tran_Header_ID=TH.Tran_Header_ID and Tran_Type='FAPR'    
 where GL_Code= @FunGL_Code and td.SL_Code=ISNULL(@FunSL_Code,td.SL_Code)  
    
end--end(@Option=1)--Due Amount    
else if(@Option=2)--Received Amt    
begin--begin(@Option=2)--Received Amt    
    
 select @decAmt=sum(TD.Tran_Currency_Amount) from FA_TRANSACTION_DET as TD    
 inner join FA_TRANSACTION_HEADER as TH on TD.Tran_Header_ID=TH.Tran_Header_ID and Tran_Type='FARE'    
 where GL_Code= @FunGL_Code  and td.SL_Code=ISNULL(@FunSL_Code,td.SL_Code)   
    
end--end(@Option=2)--Received Amt    
    
    
    
    
    
 RETURN isnull(@decAmt,0)      
    
END
GO
