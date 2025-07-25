SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FA_VW_S3G_ACCOUNT_DETAILS]'))
EXEC dbo.sp_executesql @statement = N'                
-- =============================================                                                            
-- Author        : muni Kavitha                                                            
-- Create Date   : 17-FEB-2012                                                         
-- Description   : TO GET ACCOUNT DETAILS FROM S3G                                                     
-- Modified BY   :                                                     
-- Modified Date :                                                        
-- =============================================                     
CREATE VIEW [dbo].[FA_VW_S3G_ACCOUNT_DETAILS]      
AS            
      
SELECT * FROM(      
SELECT                               
  Row_number() over(order by hdr.PANum) AS ''Slno''      
, hdr.Company_ID as    Company_ID       
, LOB.LOB_ID AS LOB_ID          
--, (LOB.LOB_Code + '' - '' + LOB.LOB_Name)  as  ''LOBName''             
, (LOB.LOB_Name)  as  ''LOBName''             
, CUST.Customer_ID           
, CUST.Customer_Name                        
, hdr.PANum AS ''PANum''          
, APP.MLA_Applicable                             
, CASE          
     APP.MLA_Applicable                               
      WHEN 1          
            THEN CASE          
                 WHEN Dtl.SANum <> hdr.PANum+''DUMMY'' THEN Dtl.SANum                              
                 END          
      WHEN 0          
            THEN CASE          
                 WHEN Dtl.SANum = hdr.PANum+''DUMMY'' THEN ''''                               
                 END          
  END AS SANum1                              
, Dtl.SANum as ''SANum'' --CASE Dtl.SANum WHEN hdr.PANum+''DUMMY'' THEN '''' ELSE Dtl.SANum END  AS ''SANum''                                
, Loan_Amount AS ''Finance_Amount''                                
--, Lookup_Description ''Status''           
, Dtl.Created_Date AS ''Account_Date''                              
, MAX(RpyDtls.InstallmentDate) as ''Maturity_Date''          
--, LOB.Is_Active  as Allocation_Status        
,(ISNULL(D3.INSTALLMENT_DUE,0)-ISNULL(D3.INSTALLMENT_CREDIT,0)) + SUM(AMSTR.InstallmentAmount) AS Gross_Exposure      
,(ISNULL(D3.INSTALLMENT_DUE,0)-ISNULL(D3.INSTALLMENT_CREDIT,0)) + SUM(AMSTR.PrincipalAmount) AS Net_Exposure      
,(ISNULL(D3.INSTALLMENT_DUE,0)-ISNULL(D3.INSTALLMENT_CREDIT,0)) as Dues      
,5 as NoofDues      
            
FROM [S3G_USR_Ver_1.1]..S3G_LOANAD_AccountCreation hdr(NOLOCK)                 
     INNER JOIN [S3G_USR_Ver_1.1]..S3G_LOANAD_AccountPASADetails  Dtl(NOLOCK) ON hdr.PANum=Dtl.PANum                                  
     INNER JOIN [S3G_USR_Ver_1.1]..S3G_LoanAd_AccountRepayStructure  RpyDtls ON hdr.PANum=RpyDtls.PANum AND Dtl.SANum=RpyDtls.SANum                                
     INNER JOIN [S3G_USR_Ver_1.1]..S3G_LOANAD_LookupTypeMaster StaHdr (nolock) ON dtl.SA_Statustype_Code = LookupType_Code                                  
     INNER JOIN [S3G_USR_Ver_1.1]..S3G_LOANAD_LookupTypeDetails StsDtl (nolock)ON StaHdr.LookupType_Code = StsDtl.LookupType_Code                                  
                                       AND Dtl.SA_Status_Code = Lookup_Code                                  
     INNER JOIN [S3G_USR_Ver_1.1]..S3G_ORG_ApplicationProcess APP (NOLOCK) ON APP.Application_Process_ID = hdr.Application_Process_ID                                   
                                       AND APP.Company_ID = hdr.Company_ID                                
     INNER JOIN [S3G_USR_Ver_1.1]..S3G_SYSAD_LOBMaster AS LOB on LOB.LOB_ID= hdr.LOB_ID             
     INNER JOIN [S3G_USR_Ver_1.1]..S3G_ORG_CustomerMaster CUST ON CUST.Customer_ID=hdr.Customer_ID      
     INNER JOIN [S3G_USR_Ver_1.1]..S3G_CLN_DEMANDDATASET3(NOLOCK) D3 on    Dtl.PANum=D3.PANum AND Dtl.SANum=D3.SANum      
     INNER JOIN [S3G_USR_Ver_1.1]..S3G_LoanAd_AccAmortStructure AMSTR on  AMSTR.PANum=D3.PANum AND AMSTR.SANum=D3.SANum          
--     INNER  JOIN [S3G_USR_Ver_1.1]..S3G_SYSAD_LocationMaster AS LM ON LM.Location_Code = isnull(CLC.Location_Code,LM.Location_Code) and LM.Location_Code = hdr.Location_Code                             
     WHERE --hdr.Company_ID=@Company_ID AND      
 RpyDtls.InstallmentDate > = getdate() --Hardcode will be changed                                  
               AND StaHdr.LookupType_Code =''25'' AND StsDtl.Lookup_Code not in(''43'',''0'',''45'',''47'',''55'',''44'',''7'',''6'')-- IN(''3'',''11'',''4'',''42'',''13'',''46'')                                  
--               AND CONVERT(DATETIME,CONVERT(VARCHAR(50),Dtl.Created_Date,101))         
--                      BETWEEN  CONVERT(DATETIME,CONVERT(VARCHAR(50),ISNULL(@FromDate,Dtl.Created_Date),101))                         
--                                   AND         
--                               CONVERT(DATETIME,CONVERT(VARCHAR(50),ISNULL(@ToDate,Dtl.Created_Date),101))           
     GROUP BY hdr.PANum,Loan_Amount,Dtl.SANum,Dtl.Created_Date, CUST.Customer_ID,hdr.Company_ID  --, LOB.Is_Active          
              , CUST.Customer_Name ,APP.MLA_Applicable,LOB.LOB_Code,LOB.LOB_Name, LOB.LOB_ID  ,D3.INSTALLMENT_DUE,D3.INSTALLMENT_CREDIT                           
        --,SA_Statustype_Code,SA_Status_Code,PA_Statustype_Code,PA_Status_Code          
) AS Temp                              
 WHERE SANum1 IS NOT NULL ' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FA_VW_SYS_DimensionMaster]'))
EXEC dbo.sp_executesql @statement = N'            
-- =============================================                                                        
-- Author        : Tamilselvan S                                                       
-- Create Date   : 23-Jan-2012                                                    
-- Description   : To get All the Dimension Details                                             
-- Modified BY   : 04/04/2012                                     
-- Modified Date :                                          
-- =============================================          
CREATE VIEW [dbo].[FA_VW_SYS_DimensionMaster]      
AS       
SELECT DISTINCT Dim_ID,DM.Company_ID,Activity,DM.Dim_Type AS DimType_Code,Dimension_Value AS DimType_Value,Dim_Code,Dim_Desc  
,DM.Dim_Pattern,LD.Lookup_Desc AS DimPattern_Value,DM.Dim1_Ref_ID,DM.Is_Active  
FROM FA_SYS_DimensionMaster AS DM  
INNER JOIN FA_DIMENSION_LOOKUP AS DL ON DL.Dimension_Type=DM.Dim_Type  
INNER JOIN FA_LOOKUP_DETAILS AS LD ON LD.Lookup_Code=DM.Dim_Pattern  
WHERE LD.Lookuptype_Code=2   ' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FA_VW_GetUserMenuItems]'))
EXEC dbo.sp_executesql @statement = N'/* =============================================                    
 Author:  Tamilselvan S                    
 Create date: 24-01-2012                    
 Description: To get user menu items                   
=============================================  */                  
CREATE VIEW [dbo].[FA_VW_GetUserMenuItems]        
AS                  
SELECT  DISTINCT   RCoM.Role_Code_ID, RCoM.Company_ID,0 AS Role_Center_ID, '''' AS Role_Center_Code,'''' AS Role_Center_Name        
   , MM.Module_ID, MM.Module_Code,MM.Module_Name, PM.Program_ID, PM.Program_Name,                   
                      PM.Page_Url, ULRM.User_ID, PM.Sequence,PM.Detail_Url            
       ,RCoM.Is_Active AS RoleCode_Active                  
FROM FA_SYS_RoleCodeMaster AS RCoM WITH (NOLOCK)              
INNER JOIN FA_SYS_ProgramMaster AS PM WITH (NOLOCK) ON RCoM.Program_ID = PM.Program_ID        
INNER JOIN FA_SYS_ModuleMaster AS MM WITH (NOLOCK) ON PM.Module_Code = MM.Module_Code       
INNER JOIN FA_SYS_UserLocRoleMapping AS ULRM WITH(NOLOCK) ON RCoM.Role_Code_ID = ULRM.Role_ID-- AND ULRM.Is_Active=1 ' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FA_VW_UserLoca_RoleMap]'))
EXEC dbo.sp_executesql @statement = N'    
-- =============================================                                                                
-- Author        : Muni Kavitha            
-- Create Date   : 4-FEB-2012                                                              
-- Description   : To Get user Location and Role Mapping details                                                           
-- Modified BY   :                                                         
-- Modified Date :                                                            
-- =============================================                                                      
    
CREATE View [dbo].[FA_VW_UserLoca_RoleMap]                
 As                
  Select -- distinct     
       ULRM.User_ID    
     , RCMST.Program_ID    
     , LMST.Location_ID      
     , LMST.Location_Code    
     , LCAT.LocationCat_Description    
     , RCMST.Company_id 
	,   ULRM.Is_Active AS ULRMIs_Active  
	,Is_Operational 
,LMST.Is_Active Location_Is_Active   
  From dbo.FA_SYS_UserLocRoleMapping ULRM    
  INNER JOIN dbo.FA_SYS_LOCA_MST LMST ON LMST.Location_ID=ULRM.Location_ID    
  INNER JOIN dbo.FA_SYS_LOCA_CAT LCAT ON LCAT.Location_Category_ID=LMST.Location_Category_ID    
  INNER JOIN dbo.FA_SYS_RoleCodeMaster RCMST ON RCMST.Role_Code_ID=ULRM.Role_ID                 
  Where  RCMST.Is_Active=1  ' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_VW_LOCA_CAT]'))
EXEC dbo.sp_executesql @statement = N'          
-- =============================================                                                      
-- Author        : muni Kavitha                                                      
-- Create Date   : 25-Jan-2012                                                   
-- Description   : To get All the location code with mapping                                               
-- Modified BY   :                                               
-- Modified Date :                                                  
-- =============================================               
CREATE VIEW [dbo].[FA_SYS_VW_LOCA_CAT]          
AS      
SELECT * FROM (        
SELECT Company_ID,Location_Code,LocationCat_Description,1 as Hierarchy_Type,Location_Category_ID,    
Is_Active FROM FA_SYS_LOCA_CAT where Hierarchy_Type=1 --AND Location_Category_Id>20        
UNION         
SELECT L1.Company_ID,(L2.Location_Code+''|''+L1.Location_Code) AS Location_Code,(L2.LocationCat_Description+''|''+L1.LocationCat_Description)AS LocationCat_Description        
,2 as Hierarchy_Type,L1.Location_Category_ID,L1.Is_Active FROM FA_SYS_LOCA_CAT L1        
INNER JOIN FA_SYS_LOCA_CAT AS L2 ON L2.Location_Category_ID=L1.Parent_Id         
where L1.Hierarchy_Type=2 --AND L1.Location_Category_Id>20         
        
UNION         
        
SELECT L1.Company_ID,(L3.Location_Code+''|''+L2.Location_Code+''|''+L1.Location_Code) AS Location_Code,(L3.LocationCat_Description+''|''+L2.LocationCat_Description+''|''+L1.LocationCat_Description)AS LocationCat_Description         
,3 as Hierarchy_Type,L1.Location_Category_ID,L1.Is_Active FROM FA_SYS_LOCA_CAT L1        
INNER JOIN FA_SYS_LOCA_CAT AS L2 ON L2.Location_Category_ID=L1.Parent_Id         
INNER JOIN FA_SYS_LOCA_CAT AS L3 ON L3.Location_Category_ID=L2.Parent_Id         
 where L1.Hierarchy_Type=3 --AND L1.Location_Category_Id>20         
        
UNION        
        
SELECT L1.Company_ID,(L4.Location_Code+''|''+L3.Location_Code+''|''+L2.Location_Code+''|''+L1.Location_Code) AS Location_Code        
,(L4.LocationCat_Description+''|''+L3.LocationCat_Description+''|''+L2.LocationCat_Description+''|''+L1.LocationCat_Description)AS LocationCat_Description        
,4 AS Hierarchy_Type,L1.Location_Category_ID ,L1.Is_Active        
 FROM FA_SYS_LOCA_CAT L1        
INNER JOIN FA_SYS_LOCA_CAT AS L2 ON L2.Location_Category_ID=L1.Parent_Id         
INNER JOIN FA_SYS_LOCA_CAT AS L3 ON L3.Location_Category_ID=L2.Parent_Id         
INNER JOIN FA_SYS_LOCA_CAT AS L4 ON L4.Location_Category_ID=L3.Parent_Id         
 where L1.Hierarchy_Type=4-- AND L1.Location_Category_Id>20         
        
UNION        
        
SELECT L1.Company_ID,(L5.Location_Code+''|''+L4.Location_Code+''|''+L3.Location_Code+''|''+L2.Location_Code+''|''+L1.Location_Code) AS Location_Code        
,(L5.LocationCat_Description+''|''+L4.LocationCat_Description+''|''+L3.LocationCat_Description+''|''+L2.LocationCat_Description+''|''+L1.LocationCat_Description)AS LocationCat_Description         
,5 AS Hierarchy_Type,L1.Location_Category_ID ,L1.Is_Active       
 FROM FA_SYS_LOCA_CAT L1        
INNER JOIN FA_SYS_LOCA_CAT AS L2 ON L2.Location_Category_ID=L1.Parent_Id         
INNER JOIN FA_SYS_LOCA_CAT AS L3 ON L3.Location_Category_ID=L2.Parent_Id         
INNER JOIN FA_SYS_LOCA_CAT AS L4 ON L4.Location_Category_ID=L3.Parent_Id         
INNER JOIN FA_SYS_LOCA_CAT AS L5 ON L5.Location_Category_ID=L4.Parent_Id         
 where L1.Hierarchy_Type=5 --AND L1.Location_Category_Id>20         
        
        
        
)TM ' 
