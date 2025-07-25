SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_CashflowMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_CashflowMaster](
	[CashFlow_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NOT NULL,
	[CFSl_No] [varchar](50) NOT NULL,
	[CF_Description] [varchar](50) NOT NULL,
	[Flow_Type] [varchar](15) NOT NULL,
	[CF_Flag_ID] [int] NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Created_By] [int] NULL,
	[Created_Date] [datetime] NULL,
	[Activity] [int] NOT NULL,
	[Modified_By] [int] NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_FA_CashflowMaster] PRIMARY KEY CLUSTERED 
(
	[CashFlow_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_Auth_RCDet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_Auth_RCDet](
	[Authorization_Rule_Card_Detail_ID] [int] IDENTITY(1,1) NOT NULL,
	[Authorization_Rule_Card_ID] [int] NOT NULL,
	[From_Amount] [numeric](18, 0) NOT NULL,
	[To_Amount] [numeric](18, 0) NOT NULL,
	[Total_Approvals] [numeric](5, 0) NOT NULL,
	[Level4_Approvals] [numeric](5, 0) NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Created_By] [int] NOT NULL,
	[Trans_Date] [datetime] NOT NULL CONSTRAINT [DF_FA_SYS_Auth_RCDet_Created_On]  DEFAULT (getdate()),
	[Modified_By] [int] NULL,
 CONSTRAINT [PK_FA_SYS_Auth_RCDet] PRIMARY KEY CLUSTERED 
(
	[Authorization_Rule_Card_Detail_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_FUNDER_MST]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_FUNDER_MST](
	[Company_ID] [int] NOT NULL,
	[Funder_ID] [int] IDENTITY(1,1) NOT NULL,
	[Funder_Code] [varchar](60) NOT NULL,
	[GL_Code] [varchar](60) NOT NULL,
	[SL_Code] [varchar](60) NULL,
	[Location_ID] [int] NULL,
	[Location_Code] [varchar](12) NULL,
	[Funder_Name] [varchar](100) NOT NULL,
	[Comm_Address1] [varchar](64) NULL,
	[Comm_Address2] [varchar](64) NULL,
	[Comm_City] [varchar](30) NULL,
	[Comm_State] [varchar](60) NULL,
	[Comm_Country] [varchar](60) NULL,
	[Comm_Pincode] [varchar](10) NULL,
	[Comm_Mobile] [varchar](12) NULL,
	[Comm_Telephone] [varchar](12) NULL,
	[Comm_EMail] [varchar](60) NULL,
	[Comm_Website] [varchar](60) NULL,
	[Perm_Address1] [varchar](64) NULL,
	[Perm_Address2] [varchar](64) NULL,
	[Perm_City] [varchar](30) NULL,
	[Perm_State] [varchar](60) NULL,
	[Perm_Country] [varchar](60) NULL,
	[Perm_Pincode] [varchar](10) NULL,
	[Perm_Mobile] [varchar](12) NULL,
	[Perm_Telephone] [varchar](12) NULL,
	[Perm_EMail] [varchar](60) NULL,
	[Perm_Website] [varchar](60) NULL,
	[TAX_Number] [varchar](22) NULL,
	[VAT_Number] [varchar](22) NULL,
	[Remarks] [varchar](200) NULL,
	[Created_By] [int] NOT NULL,
	[Created_On] [datetime] NULL,
	[Modified_By] [int] NULL,
	[Modified_On] [datetime] NULL,
	[Is_Active] [bit] NULL,
	[Last_Int_Calc_Date] [datetime] NULL,
 CONSTRAINT [PK_FA_FUNDER_MST] PRIMARY KEY CLUSTERED 
(
	[Funder_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_PP_JV_AUTH]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_PP_JV_AUTH](
	[PP_JV_Auth_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PP_JV_ID] [bigint] NULL,
	[Company_ID] [int] NULL,
	[Location_ID] [int] NULL,
	[Location_Code] [varchar](50) NULL,
	[Auth_Sequence_No] [int] NULL,
	[Auth_User_ID] [int] NULL,
	[Auth_Status] [varchar](50) NULL,
	[Remarks] [varchar](250) NULL,
	[Auth_Date] [datetime] NULL,
 CONSTRAINT [PK_FA_PP_JV_AUTH] PRIMARY KEY CLUSTERED 
(
	[PP_JV_Auth_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'FA_PP_JV_AUTH', N'COLUMN',N'Auth_Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Y -- Yes
N -- No
R -- Rejected
C -- Cancelled ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FA_PP_JV_AUTH', @level2type=N'COLUMN',@level2name=N'Auth_Status'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_CashflowFlag]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_CashflowFlag](
	[Flag_ID] [int] NOT NULL,
	[Flag_Code] [int] NULL,
	[Flag_Desc] [varchar](100) NOT NULL,
	[Receipt_Flag] [bit] NULL,
	[Account_Identifier] [varchar](100) NULL,
	[AddLess_flag] [bit] NULL,
 CONSTRAINT [PK_FA_CashflowFlag] PRIMARY KEY CLUSTERED 
(
	[Flag_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_FUNDER_LOADING_MST]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_FUNDER_LOADING_MST](
	[Company_ID] [int] NOT NULL,
	[Funder_Loading_ID] [int] IDENTITY(1,1) NOT NULL,
	[Funder_Loading_No] [varchar](60) NOT NULL,
	[Funder_ID] [int] NOT NULL,
	[Location_ID] [int] NULL,
	[Location_Code] [varchar](12) NULL,
	[Allocation_Date] [datetime] NULL,
	[Created_By] [int] NOT NULL,
	[Created_On] [datetime] NOT NULL,
	[Modified_By] [int] NULL,
	[Modified_On] [datetime] NULL,
 CONSTRAINT [PK_FA_FUNDER_LOADING_MST] PRIMARY KEY CLUSTERED 
(
	[Funder_Loading_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_FUNDER_TRAN_MST]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_FUNDER_TRAN_MST](
	[Company_ID] [int] NOT NULL,
	[Location_ID] [int] NULL,
	[Location_Code] [varchar](12) NULL,
	[Funder_Tran_ID] [int] IDENTITY(1,1) NOT NULL,
	[Funder_ID] [int] NOT NULL,
	[Funder_Tran_No] [varchar](50) NOT NULL,
	[Fund_Type] [varchar](5) NULL,
	[Commitment_Amt] [decimal](18, 4) NOT NULL,
	[Tenure] [int] NOT NULL,
	[Validity_Date] [datetime] NULL,
	[Currency_Code] [nchar](10) NULL,
	[Created_By] [int] NOT NULL,
	[Created_On] [datetime] NULL,
	[Modified_By] [int] NULL,
	[Modified_On] [datetime] NULL,
 CONSTRAINT [PK_FA_FUNDER_TRAN_MST] PRIMARY KEY CLUSTERED 
(
	[Funder_Tran_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_ACCOUNT_LOCATION_MAP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_ACCOUNT_LOCATION_MAP](
	[Loc_Acct_Map_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NOT NULL,
	[Account_ID] [int] NULL,
	[GL_Code] [varchar](8) NOT NULL,
	[SL_Code] [varchar](14) NULL,
	[Location_ID] [int] NOT NULL,
	[Created_By] [int] NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_by] [int] NULL,
	[Modified_Date] [datetime] NULL,
	[Txn_ID] [int] NULL,
 CONSTRAINT [PK_FA_AccountLocationMap] PRIMARY KEY CLUSTERED 
(
	[Loc_Acct_Map_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_CompanyMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_CompanyMaster](
	[Company_ID] [int] NOT NULL,
	[Company_code] [varchar](60) NOT NULL,
	[Company_name] [varchar](60) NOT NULL,
	[HO_Address] [varchar](200) NULL,
	[HO_Phone] [varchar](20) NULL,
	[HO_Email] [varchar](40) NULL,
	[Comu_Address] [varchar](200) NULL,
	[Comu_Phone] [varchar](20) NULL,
	[Comu_Email] [varchar](40) NULL,
	[Comp_PAN] [varchar](16) NOT NULL,
	[Comp_TIN] [varchar](16) NOT NULL,
	[Comp_Incorp_Date] [datetime] NOT NULL,
	[Default_Currency] [int] NULL,
	[FinancialYear] [varchar](16) NULL,
	[Group_code] [varchar](60) NULL,
	[Group_name] [varchar](60) NULL,
	[Cont_Per_Name] [varchar](60) NULL,
	[Cont_Per_Designation] [varchar](60) NULL,
	[Cont_Per_Address] [varchar](200) NULL,
	[Cont_Per_Mobile] [varchar](16) NULL,
	[Cont_Per_Phone] [varchar](20) NULL,
	[Cont_Per_Email] [varchar](40) NULL,
	[SA_UserName] [varchar](6) NOT NULL,
	[SA_Password] [varchar](100) NOT NULL,
	[Comp_Status] [bit] NULL,
	[Created_By] [int] NOT NULL,
	[Modified_By] [int] NULL,
 CONSTRAINT [PK_FA_CompanyMaster] PRIMARY KEY CLUSTERED 
(
	[Company_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_YearLock]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_YearLock](
	[Yr_Lock_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NULL,
	[Fin_Year] [varchar](25) NULL,
	[Next_Yr_Open] [bit] NULL,
	[Nxt_Yr_Open_By] [int] NULL,
	[Nxt_Yr_Open_Date] [datetime] NULL,
	[Final_Lock] [bit] NULL,
	[Created_By] [int] NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [int] NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_FA_YearLock] PRIMARY KEY CLUSTERED 
(
	[Yr_Lock_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_MonthLock]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_MonthLock](
	[Month_Lock_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NOT NULL,
	[Location_ID] [int] NOT NULL,
	[Fin_Year] [varchar](25) NOT NULL,
	[Lock_Month] [varchar](25) NOT NULL,
	[Is_Month_Lock] [bit] NULL,
	[Txn_Date] [datetime] NOT NULL,
	[Created_By] [int] NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [int] NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_FA_MonthLock] PRIMARY KEY CLUSTERED 
(
	[Month_Lock_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_ACCOUNT_MASTER]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_ACCOUNT_MASTER](
	[Account_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NOT NULL,
	[GL_Code] [varchar](8) NOT NULL,
	[GL_Desc] [varchar](50) NOT NULL,
	[Acct_Type_Code] [int] NOT NULL,
	[Acct_Type_ID] [int] NOT NULL,
	[Posit_Type_Code] [int] NOT NULL,
	[Posit_Type_ID] [int] NOT NULL,
	[Nature_Type_Code] [int] NOT NULL,
	[Nature_Type_ID] [int] NOT NULL,
	[Acct_Leg_Code] [int] NOT NULL,
	[Acct_Leg_ID] [int] NOT NULL,
	[Acct_Char_Code] [int] NULL,
	[Acct_Char_ID] [int] NULL,
	[Is_Active] [bit] NULL,
	[Created_By] [int] NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_by] [int] NULL,
	[Modified_Date] [datetime] NULL,
	[Txn_ID] [int] NULL,
 CONSTRAINT [PK_FA_AccountMaster] PRIMARY KEY CLUSTERED 
(
	[Account_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_DocType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_DocType](
	[Document_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Document_Type_Code] [varchar](8) NOT NULL,
	[Document_Type_Desc] [varchar](30) NOT NULL,
	[Program_ID] [int] NULL,
 CONSTRAINT [PK_FA_Doc_Type] PRIMARY KEY CLUSTERED 
(
	[Document_Type_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_CurrencyMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_CurrencyMaster](
	[Currency_ID] [int] IDENTITY(1,1) NOT NULL,
	[Currency_Name] [varchar](50) NOT NULL,
	[Currency_Code] [varchar](5) NOT NULL,
	[Currency_Default] [varchar](10) NULL,
	[Is_Active] [bit] NOT NULL,
 CONSTRAINT [PK_FA_SYS_CurrencyMaster] PRIMARY KEY CLUSTERED 
(
	[Currency_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_INVESTMENT_TRAN_DOCUMENT]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_INVESTMENT_TRAN_DOCUMENT](
	[Invst_Document_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NULL,
	[Invest_Header_ID] [int] NULL,
	[Document_Name] [varchar](100) NULL,
	[Document_Ref_No] [varchar](50) NULL,
	[File_Name] [varchar](100) NULL,
	[ContentType] [varchar](50) NULL,
	[File_Path] [varchar](1500) NULL,
 CONSTRAINT [PK_FA_INVESTMENT_TRAN_DOCUMENT] PRIMARY KEY CLUSTERED 
(
	[Invst_Document_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_CashFlow_Credit]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_CashFlow_Credit](
	[CF_Credit_ID] [int] IDENTITY(1,1) NOT NULL,
	[CashFlow_ID] [int] NOT NULL,
	[GL_Account_Code] [varchar](50) NOT NULL,
	[Credit_Type_ID] [int] NOT NULL,
	[SL_Account_Code] [varchar](50) NULL,
	[Created_By] [int] NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [int] NULL,
	[Modified_Date] [datetime] NULL,
	[Credit_Lookup] [int] NOT NULL CONSTRAINT [DF_FA_CashFlow_Credit_Credit_Lookup]  DEFAULT ((9)),
 CONSTRAINT [PK_FA_CFCredit] PRIMARY KEY CLUSTERED 
(
	[CF_Credit_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_HIAR_MST]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_HIAR_MST](
	[Hierachy] [int] NOT NULL,
	[Company_ID] [int] NOT NULL,
	[Width] [int] NOT NULL,
	[Location_Description] [varchar](50) NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Is_Operational] [bit] NULL,
	[Created_By] [int] NOT NULL,
	[Created_On] [datetime] NOT NULL,
	[Modified_By] [int] NULL,
	[Modified_On] [datetime] NULL,
 CONSTRAINT [PK_FA_SYS_HIAR_MST] PRIMARY KEY CLUSTERED 
(
	[Hierachy] ASC,
	[Company_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_RoleCodeMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_RoleCodeMaster](
	[Role_Code_ID] [int] IDENTITY(1,1) NOT NULL,
	[Program_ID] [int] NOT NULL,
	[Company_ID] [int] NOT NULL,
	[Role_Code] [varchar](20) NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Created_By] [int] NOT NULL,
	[Modified_By] [int] NULL,
	[Txn_Date] [datetime] NOT NULL,
	[Txn_ID] [int] NULL,
 CONSTRAINT [PK_FA_SYS_RoleCodeMaster] PRIMARY KEY CLUSTERED 
(
	[Role_Code_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_UserLevelAccess]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_UserLevelAccess](
	[User_Level_Access_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NOT NULL,
	[User_Level_ID] [int] NOT NULL,
	[Add_Access] [bit] NOT NULL,
	[Modify_Access] [bit] NOT NULL,
	[Delete_Access] [bit] NOT NULL,
	[View_Access] [bit] NOT NULL,
	[Report_Access] [bit] NOT NULL,
	[MakerChecker_Access] [bit] NOT NULL,
	[Is_UserLevel_Update] [bit] NULL,
	[Is_Active] [bit] NOT NULL,
	[Created_By] [int] NOT NULL,
	[Created_On] [datetime] NOT NULL,
 CONSTRAINT [PK_FA_UserLevelRoles] PRIMARY KEY CLUSTERED 
(
	[User_Level_Access_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_CashFlow_Debit]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_CashFlow_Debit](
	[CF_Debit_ID] [int] IDENTITY(1,1) NOT NULL,
	[CashFlow_ID] [int] NOT NULL,
	[GL_Account_Code] [varchar](50) NOT NULL,
	[Debit_Type_ID] [int] NOT NULL,
	[SL_Account_Code] [varchar](50) NULL,
	[Created_By] [int] NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [int] NULL,
	[Modified_Date] [datetime] NULL,
	[Debit_Lookup] [int] NOT NULL CONSTRAINT [DF_FA_CashFlow_Debit_Debit_Lookup]  DEFAULT ((9)),
 CONSTRAINT [PK_FA_CFDebit] PRIMARY KEY CLUSTERED 
(
	[CF_Debit_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_UserLevelMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_UserLevelMapping](
	[User_Level_ID] [int] NOT NULL,
	[User_Level_Name] [varchar](30) NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Created_By] [int] NOT NULL,
	[Created_On] [datetime] NOT NULL,
	[Modified_By] [int] NULL,
	[Modified_On] [datetime] NULL,
 CONSTRAINT [PK_FA_UserLevel_Master] PRIMARY KEY CLUSTERED 
(
	[User_Level_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_ACCOUNT_ENTITY_DETAIL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_ACCOUNT_ENTITY_DETAIL](
	[Details_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NOT NULL,
	[Account_ID] [int] NULL,
	[GL_Code] [varchar](8) NOT NULL,
	[Acct_Type_Code] [int] NULL,
	[Acct_Type_ID] [int] NOT NULL,
	[SL_Code] [varchar](14) NOT NULL,
	[SL_Desc] [varchar](50) NOT NULL,
	[Address1] [varchar](80) NOT NULL,
	[Address2] [varchar](80) NULL,
	[City] [varchar](60) NOT NULL,
	[PIN] [varchar](20) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[Cont_Person] [varchar](75) NULL,
	[Cont_Desig] [varchar](50) NULL,
	[Telephone] [varchar](20) NULL,
	[Mobile] [varchar](14) NULL,
	[Email] [varchar](50) NULL,
	[Web] [varchar](50) NULL,
	[Cont_UID] [varchar](50) NULL,
	[Cont_ITNo] [varchar](20) NULL,
	[GST_No1] [varchar](20) NULL,
	[GST1_Date] [datetime] NULL,
	[GST_No2] [varchar](20) NULL,
	[GST2_Date] [datetime] NULL,
	[Tax_Ref_No] [varchar](20) NULL,
	[IS_Active] [bit] NULL,
	[Created_By] [int] NULL,
	[Created_Date] [datetime] NULL,
	[Modified_by] [int] NULL,
	[Modified_Date] [datetime] NULL,
	[Txn_ID] [int] NULL,
	[Fund_rate] [decimal](4, 2) NULL,
 CONSTRAINT [PK_FA_AccountDtls1] PRIMARY KEY CLUSTERED 
(
	[Details_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_ProgramMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_ProgramMaster](
	[Program_ID] [int] NOT NULL,
	[Program_Code] [varchar](7) NOT NULL,
	[Program_Name] [varchar](100) NOT NULL,
	[Module_Code] [varchar](1) NULL,
	[Program_Ref_No] [varchar](3) NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Created_By] [int] NOT NULL,
	[Created_On] [datetime] NOT NULL,
	[Modified_By] [int] NULL,
	[Modified_On] [datetime] NULL,
	[Page_Url] [varchar](100) NULL,
	[Detail_Url] [varchar](100) NULL,
	[Sequence] [int] NULL,
	[IsTransaction] [bit] NULL,
	[WFUrl] [varchar](150) NULL,
	[Is_Authorize] [bit] NULL,
	[Document_Path_Setup] [bit] NULL,
	[Document_Flag] [varchar](100) NULL,
	[JV_Applicable] [bit] NULL CONSTRAINT [DF_FA_SYS_ProgramMaster_JV Applicable]  DEFAULT ((0))
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_ACCOUNT_BANK_DETAIL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_ACCOUNT_BANK_DETAIL](
	[Bank_Map_ID] [int] IDENTITY(1,1) NOT NULL,
	[Account_ID] [int] NOT NULL,
	[Bank_Name] [varchar](60) NOT NULL,
	[Bank_Branch_Name] [varchar](60) NULL,
	[IFSC] [varchar](15) NOT NULL,
	[GL_Code] [varchar](8) NOT NULL,
	[SL_Code] [varchar](14) NULL,
	[Bank_Acct_code] [int] NOT NULL,
	[Bank_Acct_ID] [int] NOT NULL,
	[Bank_Acct_No] [varchar](20) NOT NULL,
	[Status] [bit] NOT NULL,
	[Created_By] [int] NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_by] [int] NULL,
	[Modified_Date] [datetime] NULL,
	[Txn_ID] [int] NULL,
 CONSTRAINT [PK_FA_SLAccountBankMap] PRIMARY KEY CLUSTERED 
(
	[Bank_Map_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_Auth_RCMST]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_Auth_RCMST](
	[Authorization_Rule_Card_ID] [int] IDENTITY(1,1) NOT NULL,
	[Transaction_Type_ID] [int] NULL,
	[Company_ID] [int] NOT NULL,
	[Program_Id] [int] NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Created_By] [int] NOT NULL,
	[Modified_By] [int] NULL,
	[Trans_Date] [datetime] NOT NULL CONSTRAINT [DF_FA_SYS_Auth_RCMST_Modified_On]  DEFAULT (getdate()),
	[Activity] [int] NOT NULL,
 CONSTRAINT [PK_FA_SYS_Auth_RCMST] PRIMARY KEY CLUSTERED 
(
	[Authorization_Rule_Card_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_FUNDER_INT_DUE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_FUNDER_INT_DUE](
	[Company_ID] [int] NULL,
	[Location_ID] [int] NULL,
	[Location_Code] [varchar](12) NULL,
	[Funder_Int_DTL_Id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Funder_Tran_ID] [int] NULL,
	[Funder_ID] [int] NULL,
	[Serial_Number] [int] NULL,
	[Fund_Ref_No] [varchar](50) NULL,
	[Due_Date] [datetime] NULL,
	[Due_Amount] [decimal](25, 4) NULL,
	[Payment_Ref_No] [varchar](50) NULL,
	[Payment_Amount] [decimal](25, 4) NULL,
	[Remarks] [varchar](200) NULL,
	[Created_By] [int] NULL,
	[Created_On] [datetime] NULL,
	[Modified_By] [int] NULL,
	[Modified_On] [datetime] NULL,
	[Funder_Int_Hdr_Id] [numeric](18, 0) NOT NULL,
	[Fund_Rate] [decimal](4, 2) NULL,
	[Amount_Outstanding] [decimal](25, 4) NULL,
	[Principal_Amount] [decimal](25, 4) NULL,
 CONSTRAINT [PK_FA_FUNDER_INT_DUE] PRIMARY KEY CLUSTERED 
(
	[Funder_Int_DTL_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_Approvals]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_Approvals](
	[Approval_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NOT NULL,
	[Geo_Code] [varchar](30) NOT NULL,
	[Task_Type] [varchar](25) NOT NULL,
	[Task_Number] [varchar](25) NOT NULL,
	[Task_Approval_No] [int] NOT NULL,
	[Task_Status_Type_Code] [int] NOT NULL,
	[Task_Status_Code] [int] NOT NULL,
	[Task_SNO] [char](2) NOT NULL,
	[Task_User_ID] [int] NOT NULL,
	[Status_Date] [datetime] NOT NULL,
	[Remarks] [varchar](150) NOT NULL,
	[User_ID] [int] NOT NULL,
	[Txn_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_FA_Approvals] PRIMARY KEY CLUSTERED 
(
	[Approval_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_ModuleMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_ModuleMaster](
	[Module_ID] [int] NOT NULL,
	[Module_Code] [varchar](1) NOT NULL,
	[Module_Name] [varchar](40) NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Created_By] [int] NOT NULL,
	[Created_On] [datetime] NOT NULL,
	[Modified_By] [int] NULL,
	[Modified_On] [datetime] NULL,
 CONSTRAINT [PK_FA_SYS_ModuleMaster] PRIMARY KEY CLUSTERED 
(
	[Module_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_FUNDER_LOADING_DTL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_FUNDER_LOADING_DTL](
	[Company_ID] [int] NULL,
	[Funder_Loading_DTL_ID] [int] IDENTITY(1,1) NOT NULL,
	[Funder_Loading_ID] [int] NULL,
	[LOB_ID] [int] NULL,
	[Customer_ID] [int] NULL,
	[PANum] [varchar](60) NULL,
	[SANum] [varchar](60) NULL,
	[Account_Creation_Date] [datetime] NULL,
	[Allocation_Status] [bit] NULL,
	[Remarks] [varchar](200) NULL,
	[Created_By] [int] NOT NULL,
	[Created_On] [datetime] NOT NULL,
 CONSTRAINT [PK_FA_FUNDER_LOADING_DTL] PRIMARY KEY CLUSTERED 
(
	[Funder_Loading_DTL_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_PP_JV_HDR]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_PP_JV_HDR](
	[PP_JV_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NULL,
	[Location_ID] [int] NULL,
	[Location_Code] [varchar](50) NULL,
	[Activity] [int] NULL,
	[Tran_Type] [varchar](10) NULL,
	[Document_No] [varchar](50) NULL,
	[Document_Date] [datetime] NULL,
	[Value_Date] [datetime] NULL,
	[Auth_Status] [varchar](2) NOT NULL,
	[Document_Type] [varchar](2) NULL,
	[EntityType_Lookup] [int] NULL,
	[Entity_Type] [int] NULL,
	[Entity_ID] [int] NULL,
	[Party_Code] [varchar](50) NULL,
	[Mode] [varchar](50) NULL,
	[Mode_Lookup] [int] NULL,
	[Mode_ID] [int] NULL,
	[Tran_Currency_Code] [varchar](50) NULL,
	[Tran_Currency_ID] [int] NULL,
	[Tran_Currency_Amount] [numeric](25, 4) NULL,
	[Def_Currency_Amount] [numeric](25, 4) NULL,
	[Exchange_Rate_ID] [int] NULL,
	[Document_Status] [varchar](2) NULL,
	[Document_Update_Status] [varchar](2) NULL,
	[Dim1] [varchar](10) NULL,
	[Dim2] [varchar](10) NULL,
	[Dim3] [varchar](20) NULL,
	[From_Date] [datetime] NULL,
	[To_Date] [datetime] NULL,
	[Print_Count] [int] NULL,
	[Cross_Ref] [varchar](50) NULL,
	[Paid_Status] [varchar](2) NULL,
	[Created_By] [int] NOT NULL,
	[Created_On] [datetime] NULL,
	[Modified_By] [int] NULL,
	[Modified_On] [datetime] NULL,
 CONSTRAINT [PK_FA_PP_JV_HDR] PRIMARY KEY CLUSTERED 
(
	[PP_JV_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'FA_PP_JV_HDR', N'COLUMN',N'Tran_Type'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FARE -- FA Receipt,
FAPY -- FA Payment,
FAMJ -- FA Manual JV,
FASJ -- FA System JV, 
FACN -- FA Credit Note,
FADN -- FA Debit Note, 
FACQ -- FA Cheque Return, 
S3GRE -- S3G Receipt,
S3GPY -- S3G Payment, 
S3GMJ -- S3G Manual JV,
S3GSJ -- S3G System JV, 
S3GCN -- S3G Credit Note, 
S3GDN -- S3G Debit Note, 
S3GCQ -- S3G Cheque Return.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FA_PP_JV_HDR', @level2type=N'COLUMN',@level2name=N'Tran_Type'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'FA_PP_JV_HDR', N'COLUMN',N'Auth_Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'N -- Not Approved
P -- Partialy Approved
A -- Approved
R -- Rejected' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FA_PP_JV_HDR', @level2type=N'COLUMN',@level2name=N'Auth_Status'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'FA_PP_JV_HDR', N'COLUMN',N'Document_Type'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'S -- System JV
G -- General
E -- Entity
C -- Customer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FA_PP_JV_HDR', @level2type=N'COLUMN',@level2name=N'Document_Type'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'FA_PP_JV_HDR', N'COLUMN',N'Mode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CA -- Cash
CH -- Cheque
DD -- Demand Draft
PDC -- Post Dated Cheque (PD)
EG -- Electronic Gateway
BI -- Bank Instruction' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FA_PP_JV_HDR', @level2type=N'COLUMN',@level2name=N'Mode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'FA_PP_JV_HDR', N'COLUMN',N'Document_Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A -- Authorized
C -- Cancelled' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FA_PP_JV_HDR', @level2type=N'COLUMN',@level2name=N'Document_Status'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'FA_PP_JV_HDR', N'COLUMN',N'Document_Update_Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'N -- Not Updated
U -- Updated
M -- Modied
D -- Deleted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FA_PP_JV_HDR', @level2type=N'COLUMN',@level2name=N'Document_Update_Status'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'FA_PP_JV_HDR', N'COLUMN',N'Paid_Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'N -- Not Paid
P -- Paid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FA_PP_JV_HDR', @level2type=N'COLUMN',@level2name=N'Paid_Status'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_INVESTMENT_TRAN_ROI]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_INVESTMENT_TRAN_ROI](
	[Invst_Tran_ROI_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NULL,
	[Activity] [int] NULL,
	[Location_ID] [int] NULL,
	[Location_Code] [varchar](50) NULL,
	[Investment_No] [varchar](50) NULL,
	[Invest_Link_Key] [int] NULL,
	[Interest_Due_On] [datetime] NULL,
	[Interest_Due_Amount] [numeric](25, 4) NULL,
	[Value] [numeric](25, 4) NULL,
	[Tax_Deduction_Amount] [numeric](25, 4) NULL,
	[Receipt_Ref_No] [varchar](50) NULL,
	[Receipt_Amount] [numeric](25, 4) NULL,
	[Receipt_Date] [datetime] NULL,
	[Status] [varchar](50) NULL,
	[Invest_Start_Date] [datetime] NULL,
	[Maturity_Date] [datetime] NULL,
	[From_Date] [datetime] NULL,
	[To_Date] [datetime] NULL,
	[No_of_Units] [int] NULL,
	[Unit_Value] [numeric](25, 4) NULL,
	[Account_Due_Date] [bit] NULL,
 CONSTRAINT [PK_FA_INVESTMENT_TRAN_ROI] PRIMARY KEY CLUSTERED 
(
	[Invst_Tran_ROI_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_FUNDER_BANK_DTL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_FUNDER_BANK_DTL](
	[Company_ID] [int] NOT NULL,
	[Funder_ID] [int] NOT NULL,
	[Bank_ID] [int] IDENTITY(1,1) NOT NULL,
	[Bank_Name] [varchar](60) NOT NULL,
	[Bank_Address] [varchar](200) NULL,
	[IFSC] [varchar](15) NOT NULL,
	[Bank_Acct_Type] [int] NOT NULL,
	[Bank_Acct_No] [varchar](20) NOT NULL,
	[Def_Account] [bit] NULL,
	[Created_By] [int] NOT NULL,
	[Created_On] [datetime] NOT NULL,
	[Modified_By] [int] NULL,
	[Modified_On] [datetime] NULL,
 CONSTRAINT [PK_FA_FUNDER_BANK_DTL] PRIMARY KEY CLUSTERED 
(
	[Bank_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_PP_JV_DTL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_PP_JV_DTL](
	[PP_JV_DTL_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PP_JV_ID] [bigint] NULL,
	[Company_ID] [int] NULL,
	[Location_ID] [int] NULL,
	[Location_Code] [varchar](50) NULL,
	[Account_No] [varchar](50) NULL,
	[Sub_Account_No] [varchar](50) NULL,
	[GL_Code] [varchar](50) NULL,
	[SL_Code] [varchar](50) NULL,
	[Account_Flag] [varchar](50) NULL,
	[Account_Flag_ID] [int] NULL,
	[Tran_Currency_Amount] [numeric](25, 4) NULL,
	[Def_Currency_Amount] [numeric](25, 4) NULL,
	[Remarks] [varchar](200) NULL,
	[Dim1] [varchar](10) NULL,
	[Dim2] [varchar](10) NULL,
	[Dim4] [varchar](20) NULL,
	[Created_By] [int] NOT NULL,
	[Created_On] [datetime] NULL,
	[Modified_By] [int] NULL,
	[Modified_On] [datetime] NULL,
 CONSTRAINT [PK_FA_PP_JV_DTL] PRIMARY KEY CLUSTERED 
(
	[PP_JV_DTL_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_CompanyCurrency]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_CompanyCurrency](
	[Company_ID] [int] NULL,
	[Currency_ID] [int] NULL,
	[Default_Currency_ID] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_LOOKUP_DETAILS1]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_LOOKUP_DETAILS1](
	[Lookup_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NOT NULL,
	[LookupType_Code] [int] NOT NULL,
	[Lookup_Code] [int] NOT NULL,
	[Lookup_Desc] [varchar](50) NOT NULL,
	[Is_Active] [bit] NULL,
 CONSTRAINT [PK_FA_LOOKUP_DETAILS1] PRIMARY KEY CLUSTERED 
(
	[Lookup_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_CurrencyMap]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_CurrencyMap](
	[Currency_Map_ID] [int] IDENTITY(1,1) NOT NULL,
	[Currency_ID] [int] NOT NULL,
	[Precision] [int] NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[User_ID] [int] NOT NULL,
	[Txn_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_FA_SYS_CmpCurrMap] PRIMARY KEY CLUSTERED 
(
	[Currency_Map_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_LOCA_CAT]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_LOCA_CAT](
	[Location_Category_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NOT NULL,
	[Location_Code] [varchar](50) NULL,
	[LocationCat_Description] [varchar](50) NULL,
	[Hierarchy_Type] [int] NOT NULL,
	[Parent_Id] [int] NULL,
	[Is_Active] [bit] NULL,
	[Created_By] [int] NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [int] NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_FA_SYS_LOCA_CAT_1] PRIMARY KEY CLUSTERED 
(
	[Location_Category_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_FUNDER_CONDITIONS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_FUNDER_CONDITIONS](
	[Company_ID] [int] NOT NULL,
	[Funder_Condition_ID] [int] NOT NULL,
	[Funder_ID] [int] NOT NULL,
	[Location_ID] [int] NULL,
	[Activity] [int] NOT NULL,
	[Asset_Category] [int] NULL,
	[Asset_Class] [int] NULL,
	[Bucket_Category] [varchar](60) NULL,
	[Bucket_Value] [varchar](60) NULL,
	[Credit_Score] [varchar](60) NULL,
	[Exp_Variance] [varchar](60) NULL,
	[TXN_Date] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_ACCOUNT_INSTRUMENT_DTL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_ACCOUNT_INSTRUMENT_DTL](
	[Cheque_Det_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NOT NULL,
	[Account_ID] [int] NOT NULL,
	[GL_Code] [varchar](8) NOT NULL,
	[Bank_Detail_ID] [int] NOT NULL,
	[SL_Code] [varchar](14) NULL,
	[Acct_Number] [varchar](30) NOT NULL,
	[Bank_Acct_Code] [int] NOT NULL,
	[Bank_Acct_ID] [int] NOT NULL,
	[Cheq_St_No] [varchar](25) NOT NULL,
	[Cheq_End_No] [varchar](25) NOT NULL,
	[Last_used_No] [varchar](25) NULL,
	[Created_By] [int] NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_by] [int] NULL,
	[Modified_Date] [datetime] NULL,
	[Txn_ID] [int] NULL,
 CONSTRAINT [PK_FA_AccountChqDtl] PRIMARY KEY CLUSTERED 
(
	[Cheque_Det_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_Budget_MST]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_Budget_MST](
	[BudgetMaster_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NOT NULL,
	[Location_ID] [int] NULL,
	[GL_Account_Code] [varchar](50) NOT NULL,
	[SL_Account_Code] [varchar](50) NULL,
	[Budget_Type] [nvarchar](50) NOT NULL,
	[Budget_Pattern] [nvarchar](50) NOT NULL,
	[Fin_Year] [varchar](50) NOT NULL,
	[Yearly_Amount] [decimal](25, 4) NOT NULL,
	[Created_By] [int] NOT NULL,
	[Trans_Date] [datetime] NOT NULL,
	[Modified_By] [int] NULL,
	[Is_Active] [bit] NOT NULL,
 CONSTRAINT [PK_FA_Budget_MST] PRIMARY KEY CLUSTERED 
(
	[BudgetMaster_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_Budget_DTL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_Budget_DTL](
	[Budget_Detail_ID] [int] IDENTITY(1,1) NOT NULL,
	[BudgetMaster_ID] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Budget] [decimal](25, 4) NOT NULL,
	[Created_By] [int] NULL,
	[Txn_Date] [datetime] NOT NULL,
	[Modified_By] [int] NULL,
	[Serial_Number] [int] NULL,
 CONSTRAINT [PK_FA_Budget_DTL] PRIMARY KEY CLUSTERED 
(
	[Budget_Detail_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_FUNDER_TRAN_DTL1]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_FUNDER_TRAN_DTL1](
	[Company_ID] [int] NULL,
	[Location_ID] [int] NULL,
	[Location_Code] [varchar](12) NULL,
	[Funder_Tran_DTL1_ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Funder_Tran_ID] [int] NOT NULL,
	[Funder_ID] [int] NULL,
	[Serial_Number] [int] NOT NULL,
	[Fund_Ref_No] [varchar](50) NOT NULL,
	[Repay_Date] [datetime] NULL,
	[Repay_Amount] [decimal](25, 4) NULL,
	[JV_No] [varchar](50) NULL,
	[JV_Date] [datetime] NULL,
	[Created_By] [int] NULL,
	[Created_On] [datetime] NULL,
	[Modified_By] [int] NULL,
	[Modified_On] [datetime] NULL,
 CONSTRAINT [PK_FA_FUNDER_TRAN_DTL1] PRIMARY KEY CLUSTERED 
(
	[Funder_Tran_DTL1_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_AddressLookup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_AddressLookup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Category] [int] NOT NULL,
 CONSTRAINT [PK_FA_SYS_AddressLookup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'FA_SYS_AddressLookup', N'COLUMN',N'Category'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 - City, 2 - State, 3- Country' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FA_SYS_AddressLookup', @level2type=N'COLUMN',@level2name=N'Category'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_UserMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_UserMaster](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NOT NULL,
	[User_Code] [varchar](6) NOT NULL,
	[User_Name] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Mobile_No] [varchar](12) NULL,
	[Email_ID] [varchar](60) NOT NULL,
	[DOJ] [datetime] NOT NULL,
	[Designation] [varchar](40) NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[User_Level_ID] [int] NOT NULL,
	[Reporting_Next_level] [int] NULL,
	[Reporting_Higher_level] [int] NULL,
	[Current_Period] [bit] NULL,
	[Prior_Period] [bit] NULL,
	[Created_By] [int] NOT NULL,
	[Created_On] [datetime] NOT NULL,
	[Modified_By] [int] NULL,
	[Modified_On] [datetime] NULL,
	[Last_LoginDate] [datetime] NULL,
	[User_Theme] [varchar](50) NULL,
 CONSTRAINT [PK_FA_UserMaster] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_UserLocRoleMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_UserLocRoleMapping](
	[User_Location_Mapping_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NOT NULL,
	[Location_ID] [int] NOT NULL,
	[Role_ID] [int] NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Created_By] [int] NOT NULL,
	[Created_On] [datetime] NOT NULL,
	[Modified_By] [int] NULL,
	[Modified_On] [datetime] NULL,
 CONSTRAINT [PK_FA_UserLocationRoleMappingNew] PRIMARY KEY CLUSTERED 
(
	[User_Location_Mapping_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_LOOKUP_DETAILS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_LOOKUP_DETAILS](
	[Lookup_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NOT NULL,
	[LookupType_Code] [int] NOT NULL,
	[Lookup_Code] [int] NOT NULL,
	[Lookup_Desc] [varchar](50) NOT NULL,
	[Is_Active] [bit] NULL,
 CONSTRAINT [PK_FA_LOOKUP_DETAILS] PRIMARY KEY CLUSTERED 
(
	[Lookup_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_CompanyLocCurrency]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_CompanyLocCurrency](
	[Company_ID] [int] NOT NULL,
	[Location_ID] [varchar](10) NOT NULL,
	[Location_Code] [varchar](50) NOT NULL,
	[Currency_Id] [int] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_LOOKUP_MASTER]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_LOOKUP_MASTER](
	[Company_ID] [int] NOT NULL,
	[LookupType_Code] [int] NOT NULL,
	[LookupType_Desc] [varchar](50) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_Challan_Generation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_Challan_Generation](
	[Challan_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NOT NULL,
	[Location_Id] [int] NOT NULL,
	[Deposit_bank_ID] [int] NOT NULL,
	[Challan_No] [varchar](50) NOT NULL,
	[Receipt_Type_Code] [int] NULL,
	[Receipt_Code] [int] NULL,
	[Instr_Type_Code] [int] NULL,
	[Instr_Code] [int] NULL,
	[Challan_Date] [datetime] NULL,
	[Created_By] [int] NULL,
	[Created_On] [datetime] NULL,
	[Modified_By] [int] NULL,
	[Modified_On] [datetime] NULL,
 CONSTRAINT [PK_FA_Challan_Generation] PRIMARY KEY CLUSTERED 
(
	[Challan_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_FUNDER_TRAN_DTL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_FUNDER_TRAN_DTL](
	[Company_ID] [int] NULL,
	[Location_ID] [int] NULL,
	[Location_Code] [varchar](12) NULL,
	[Funder_Tran_Details_ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Funder_Tran_ID] [int] NOT NULL,
	[Funder_ID] [int] NULL,
	[Serial_Number] [int] NULL,
	[Fund_Ref_No] [varchar](50) NOT NULL,
	[Fund_Rate] [decimal](4, 2) NULL,
	[Due_Date] [datetime] NULL,
	[Due_Amount] [decimal](25, 4) NOT NULL,
	[JV_No] [varchar](50) NULL,
	[JV_Date] [datetime] NULL,
	[Created_By] [int] NULL,
	[Created_On] [datetime] NULL,
	[Modified_By] [int] NULL,
	[Modified_On] [datetime] NULL,
 CONSTRAINT [PK_FA_FUNDER_TRAN_DTL] PRIMARY KEY CLUSTERED 
(
	[Funder_Tran_Details_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_Exchange_Rate_MST]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_Exchange_Rate_MST](
	[Company_ID] [int] NULL,
	[Location_ID] [varchar](30) NULL,
	[Exchange_Rate_ID] [int] IDENTITY(1,1) NOT NULL,
	[Base_Cur_Code] [varchar](50) NOT NULL,
	[BCC_Def_Value] [varchar](50) NOT NULL,
	[Exch_Cur_Code] [varchar](50) NOT NULL,
	[EXC_Def_Value] [varchar](50) NOT NULL,
	[Recorded_Date] [datetime] NOT NULL,
	[Recorded_Time] [varchar](50) NOT NULL,
	[Ref_Site] [varchar](100) NULL,
	[Upload_Path] [varchar](100) NULL,
	[Created_By] [int] NOT NULL,
	[Created_On] [datetime] NOT NULL,
 CONSTRAINT [PK_FA_SYS_Exchange_Rate_MST] PRIMARY KEY CLUSTERED 
(
	[Exchange_Rate_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_DB_Names]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_DB_Names](
	[Company_ID] [int] NULL,
	[FA_DB_Name] [varchar](60) NULL,
	[S3G_DB_Name] [varchar](60) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_LOCA_DTL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_LOCA_DTL](
	[Company_ID] [int] NOT NULL,
	[Location_Serial_No] [int] IDENTITY(1,1) NOT NULL,
	[Location_ID] [int] NOT NULL,
	[Location_Category_ID] [int] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_GlobalParameter_Setup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_GlobalParameter_Setup](
	[Global_Parameter_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NOT NULL,
	[Date_Format] [int] NULL,
	[DateFormat_Lookup] [int] NULL,
	[Currency_Max_Prefix] [numeric](2, 0) NULL,
	[Currency_Max_Suffex] [numeric](1, 0) NULL,
	[Company_Type] [int] NULL,
	[CompanyType_Lookup] [int] NULL,
	[Denominator_Days] [int] NULL,
	[Financial_Year] [varchar](15) NULL,
	[Year_StartMonth] [varchar](10) NULL,
	[Year_EndMonth] [varchar](10) NULL,
	[Budget_Applicable] [bit] NULL,
	[Dimension_Applicable] [bit] NULL,
	[Dim2_Linkwith_Dim1] [bit] NULL,
	[Multi_Company] [bit] NULL CONSTRAINT [DF_FA_GlobalParameter_Setup_Multi_Company]  DEFAULT ((0)),
	[Currency_Level_ID] [int] NULL,
	[Currency_Level] [varchar](50) NULL,
	[Instrument_Valied_Days] [int] NULL CONSTRAINT [DF_FA_GlobalParameter_Setup_Instrument_Valied_Days]  DEFAULT ((0)),
	[Created_By] [int] NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [int] NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_FA_GlobalParameter_Setup] PRIMARY KEY CLUSTERED 
(
	[Global_Parameter_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_MoveTables]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_MoveTables](
	[Order_ID] [int] NOT NULL,
	[Table_Names] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FA_MoveTableNames] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_INVESTMENT_TRAN_HDR]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_INVESTMENT_TRAN_HDR](
	[Invest_Header_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NULL,
	[Location_ID] [int] NULL,
	[Location_Code] [varchar](50) NULL,
	[Activity] [int] NULL,
	[Investment_Type] [int] NULL,
	[Investment_Code] [varchar](50) NULL,
	[Investment_Tran_No] [varchar](50) NULL,
	[Investment_Serial_No] [varchar](50) NULL,
	[Date] [datetime] NULL,
	[Invest_Trans_Date] [datetime] NULL,
	[Invest_Link_Key] [int] NULL,
	[Transaction_Type] [int] NULL,
	[TransactionType_Lookup] [int] NULL,
	[Entity_Detail_ID] [int] NULL,
	[Entity_Code] [varchar](50) NULL,
	[Is_Authorized] [bit] NULL,
	[Authorized_By] [int] NULL,
	[Created_By] [int] NULL,
	[Created_on] [datetime] NULL,
	[Modified_By] [int] NULL,
	[Modified_on] [datetime] NULL,
 CONSTRAINT [PK_FA_INVESTMENT_TRAN_HDR] PRIMARY KEY CLUSTERED 
(
	[Invest_Header_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_CashFlow_ProgramMap]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_CashFlow_ProgramMap](
	[CF_Program_ID] [int] IDENTITY(1,1) NOT NULL,
	[Cashflow_ID] [int] NOT NULL,
	[Program_ID] [int] NOT NULL,
	[Is_Post] [bit] NULL,
	[Is_Capture] [bit] NULL,
	[Is_Display] [bit] NULL,
 CONSTRAINT [PK_FA_CFProgramMapping] PRIMARY KEY CLUSTERED 
(
	[CF_Program_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_OTHERS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_TRANSACTION_OTHERS](
	[Tran_Others_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Tran_Header_ID] [bigint] NULL,
	[Company_ID] [int] NULL,
	[Location_ID] [int] NULL,
	[Location_Code] [varchar](50) NULL,
	[Tran_Pattern] [varchar](50) NULL,
	[Ref_Doc_No] [varchar](50) NULL,
	[Ref_Desc] [varchar](100) NULL,
	[Ref_Type] [varchar](50) NULL,
	[Tran_Amount] [numeric](25, 4) NULL,
	[Amount] [nvarchar](50) NULL,
 CONSTRAINT [PK_FA_TRANSACTION_OTHER] PRIMARY KEY CLUSTERED 
(
	[Tran_Others_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_BANK_DET]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_TRANSACTION_BANK_DET](
	[Tran_Bank_Details_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Tran_Header_ID] [bigint] NULL,
	[Company_ID] [int] NULL,
	[Location_ID] [int] NULL,
	[Location_Code] [varchar](50) NULL,
	[Deposit_Bank] [bigint] NULL,
	[Pay_Bank] [bigint] NULL,
	[Drawn_On] [varchar](100) NULL,
	[Drawn_On_Location] [varchar](100) NULL,
	[Intrument_Type] [varchar](50) NULL,
	[Instrument_No] [varchar](50) NULL,
	[Instrument_Date] [datetime] NULL,
	[Realization_Date] [datetime] NULL,
	[Bank_Charges] [numeric](18, 4) NULL,
 CONSTRAINT [PK_FA_TRANSACTION_BANK_DET] PRIMARY KEY CLUSTERED 
(
	[Tran_Bank_Details_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_DET]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_TRANSACTION_DET](
	[Tran_Details_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Tran_Header_ID] [bigint] NULL,
	[Company_ID] [int] NULL,
	[Location_ID] [int] NULL,
	[Location_Code] [varchar](50) NULL,
	[Account_No] [varchar](50) NULL,
	[Sub_Account_No] [varchar](50) NULL,
	[GL_Code] [varchar](50) NULL,
	[SL_Code] [varchar](50) NULL,
	[Account_Flag] [varchar](50) NULL,
	[Account_Flag_ID] [int] NULL,
	[Tran_Currency_Amount] [numeric](25, 4) NULL,
	[Def_Currency_Amount] [numeric](25, 4) NULL,
	[Remarks] [varchar](200) NULL,
	[Dim1] [varchar](10) NULL,
	[Dim2] [varchar](10) NULL,
	[Dim4] [varchar](20) NULL,
	[Created_By] [int] NOT NULL,
	[Created_On] [datetime] NULL,
	[Modified_By] [int] NULL,
	[Modified_On] [datetime] NULL,
 CONSTRAINT [PK_FA_TRANSACTION_DET] PRIMARY KEY CLUSTERED 
(
	[Tran_Details_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_ADDLESS_DET]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_TRANSACTION_ADDLESS_DET](
	[Tran_Detail_AL_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Tran_Header_ID] [bigint] NULL,
	[Company_ID] [int] NULL,
	[Location_ID] [int] NULL,
	[Location_Code] [varchar](50) NULL,
	[Add_Less] [varchar](10) NULL,
	[TAX_Code] [varchar](50) NULL,
	[Account_No] [varchar](50) NULL,
	[Sub_Account_No] [varchar](50) NULL,
	[GL_Code] [varchar](20) NULL,
	[SL_Code] [varchar](20) NULL,
	[Account_Flag] [varchar](100) NULL,
	[Account_Flag_ID] [int] NULL,
	[Tran_Currency_Amount] [numeric](25, 4) NULL,
	[Def_Currency_Amount] [numeric](25, 4) NULL,
 CONSTRAINT [PK_FA_TRANSACTION_ADDLESS_DET] PRIMARY KEY CLUSTERED 
(
	[Tran_Detail_AL_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_AUTH]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_TRANSACTION_AUTH](
	[Tran_Auth_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NULL,
	[Location_ID] [int] NULL,
	[Location_Code] [varchar](50) NULL,
	[Tran_Header_ID] [bigint] NULL,
	[Tran_Type] [varchar](10) NULL,
	[Auth_Date] [datetime] NULL,
	[Auth_Sequence_No] [int] NULL,
	[Auth_User_ID] [int] NULL,
	[Auth_Status] [varchar](50) NULL,
	[Remarks] [varchar](250) NULL,
 CONSTRAINT [PK_FA_TRANSACTION_AUTH] PRIMARY KEY CLUSTERED 
(
	[Tran_Auth_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'FA_TRANSACTION_AUTH', N'COLUMN',N'Auth_Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Y -- Yes
N -- No
R -- Rejected
C -- Cancelled ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FA_TRANSACTION_AUTH', @level2type=N'COLUMN',@level2name=N'Auth_Status'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_PAYRECPT]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_TRANSACTION_PAYRECPT](
	[Tran_Details_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Tran_Header_ID] [bigint] NULL,
	[Company_ID] [int] NULL,
	[Location_ID] [int] NULL,
	[Location_Code] [varchar](50) NULL,
	[Account_No] [varchar](50) NULL,
	[Sub_Account_No] [varchar](50) NULL,
	[GL_Code] [varchar](50) NULL,
	[SL_Code] [varchar](50) NULL,
	[Account_Flag] [varchar](50) NULL,
	[Account_Flag_ID] [int] NULL,
	[Tran_Currency_Amount] [numeric](25, 4) NULL,
	[Def_Currency_Amount] [numeric](25, 4) NULL,
	[Remarks] [varchar](200) NULL,
	[Dim1] [varchar](10) NULL,
	[Dim2] [varchar](10) NULL,
	[Dim4] [varchar](20) NULL,
	[Created_By] [int] NOT NULL,
	[Created_On] [datetime] NULL,
	[Modified_By] [int] NULL,
	[Modified_On] [datetime] NULL,
 CONSTRAINT [PK_FA_TRANSACTION_PAYRECPT] PRIMARY KEY CLUSTERED 
(
	[Tran_Details_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_DimensionMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_DimensionMaster](
	[Dim_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NOT NULL,
	[Activity] [int] NOT NULL,
	[LookupType_Code] [int] NOT NULL,
	[Dim_Type] [int] NOT NULL,
	[Dim_Code] [varchar](10) NOT NULL,
	[Dim_Desc] [varchar](40) NOT NULL,
	[Dim_Pattern] [int] NOT NULL,
	[Pattern_LookupCode] [int] NULL,
	[User_ID] [int] NOT NULL,
	[Dim1_Ref_ID] [int] NULL,
	[Trans_Date] [datetime] NOT NULL,
	[Is_Active] [bit] NULL CONSTRAINT [DF_FA_SYS_DimensionMaster_Is_Active]  DEFAULT ((1)),
	[Created_By] [int] NULL,
	[Modified_By] [int] NULL,
 CONSTRAINT [PK_FA_DimensionMaster] PRIMARY KEY CLUSTERED 
(
	[Dim_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_INVESTMENT_INTRST_SCHED]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_INVESTMENT_INTRST_SCHED](
	[RepayInterest_ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NULL,
	[Investment_Code] [varchar](10) NULL,
	[Investment_Tran_No] [varchar](50) NULL,
	[Installment_No] [int] NULL,
	[From_Date] [datetime] NULL,
	[To_Date] [datetime] NULL,
	[Interest_Date] [datetime] NULL,
	[NoofDays] [int] NULL,
	[Amount] [numeric](25, 4) NULL,
 CONSTRAINT [PK_FA_REPAY_INTEREST_SCHEDULE] PRIMARY KEY CLUSTERED 
(
	[RepayInterest_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_GPS_PROGRAM_AUTHORIZE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_GPS_PROGRAM_AUTHORIZE](
	[AuthorizeRole_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NULL,
	[Program_ID] [int] NULL,
	[Global_Parameter_ID] [int] NULL,
	[Is_Authorize] [bit] NULL,
 CONSTRAINT [PK_FA_GPS_PROGRAM_AUTHORIZE] PRIMARY KEY CLUSTERED 
(
	[AuthorizeRole_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_INVESTMENT_TRAN_DTL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_INVESTMENT_TRAN_DTL](
	[Invst_Tran_Det_ID] [int] IDENTITY(1,1) NOT NULL,
	[Invest_Header_ID] [int] NULL,
	[Company_ID] [int] NULL,
	[Location_ID] [int] NULL,
	[Location_Code] [varchar](50) NULL,
	[Activity] [int] NULL,
	[Investment_Tran_No] [varchar](50) NULL,
	[Invest_Link_Key] [int] NULL,
	[JV_Ref_No] [varchar](50) NULL,
	[JV_Date] [datetime] NULL,
	[NoofUnits] [int] NULL,
	[Unit_Value] [numeric](10, 4) NULL,
	[Market_Value] [numeric](10, 4) NULL,
	[Invst_DInvst_Amount] [numeric](10, 4) NULL,
	[TenureType_Lookup] [int] NULL,
	[Tenure_ID] [int] NULL,
	[Tenure_Value] [int] NULL,
	[Maturity_Date] [datetime] NULL,
	[Other_Charges] [numeric](10, 4) NULL,
	[Taxes] [numeric](10, 4) NULL,
	[Total_Amount] [numeric](25, 4) NULL,
	[Profit_Loss] [numeric](10, 4) NULL,
	[Created_By] [int] NULL,
	[Created_On] [datetime] NULL,
	[Modified_By] [int] NULL,
	[Modified_On] [datetime] NULL,
 CONSTRAINT [PK_FA_INVESTMENT_TRAN_DTL] PRIMARY KEY CLUSTERED 
(
	[Invst_Tran_Det_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_HEADER]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_TRANSACTION_HEADER](
	[Tran_Header_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NULL,
	[Location_ID] [int] NULL,
	[Location_Code] [varchar](50) NULL,
	[Activity] [int] NULL,
	[Tran_Type] [varchar](10) NULL,
	[Document_No] [varchar](50) NULL,
	[Document_Date] [datetime] NULL,
	[Value_Date] [datetime] NULL,
	[Auth_Status] [varchar](2) NOT NULL,
	[Document_Type] [varchar](2) NULL,
	[EntityType_Lookup] [int] NULL,
	[Entity_Type] [int] NULL,
	[Entity_ID] [int] NULL,
	[Party_Code] [varchar](50) NULL,
	[Mode] [varchar](50) NULL,
	[Mode_Lookup] [int] NULL,
	[Mode_ID] [int] NULL,
	[Tran_Currency_Code] [varchar](50) NULL,
	[Tran_Currency_ID] [int] NULL,
	[Tran_Currency_Amount] [numeric](25, 4) NULL,
	[Def_Currency_Amount] [numeric](25, 4) NULL,
	[Exchange_Rate_ID] [int] NULL,
	[Document_Status] [varchar](2) NULL,
	[Document_Update_Status] [varchar](2) NULL,
	[Dim1] [varchar](10) NULL,
	[Dim2] [varchar](10) NULL,
	[Dim3] [varchar](20) NULL,
	[From_Date] [datetime] NULL,
	[To_Date] [datetime] NULL,
	[Print_Count] [int] NULL,
	[Cross_Ref] [varchar](50) NULL,
	[Paid_Status] [varchar](2) NULL,
	[Live_Status] [bit] NULL,
	[CHR_Reasons] [int] NULL,
	[CHR_Reasons_Lookup] [int] NULL,
	[Created_By] [int] NOT NULL,
	[Created_On] [datetime] NULL,
	[Modified_By] [int] NULL,
	[Modified_On] [datetime] NULL,
 CONSTRAINT [PK_FA_Transaction_Header] PRIMARY KEY CLUSTERED 
(
	[Tran_Header_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'FA_TRANSACTION_HEADER', N'COLUMN',N'Tran_Type'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FARE -- FA Receipt,
FAPR -- FA Payment,
FAMJ -- FA Manual JV,
FAPJ -- FA Prior Period JV
FASJ -- FA System JV, 
FACN -- FA Credit Note,
FADN -- FA Debit Note, 
FACQ -- FA Cheque Return, 
FAIA -- FA Investment Transaction,
S3GRE -- S3G Receipt,
S3GPY -- S3G Payment, 
S3GMJ -- S3G Manual JV,
S3GSJ -- S3G System JV, 
S3GCN -- S3G Credit Note, 
S3GDN -- S3G Debit Note, 
S3GCQ -- S3G Cheque Return.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FA_TRANSACTION_HEADER', @level2type=N'COLUMN',@level2name=N'Tran_Type'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'FA_TRANSACTION_HEADER', N'COLUMN',N'Auth_Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'N -- Not Approved
P -- Partialy Approved
A -- Approved
R -- Rejected' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FA_TRANSACTION_HEADER', @level2type=N'COLUMN',@level2name=N'Auth_Status'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'FA_TRANSACTION_HEADER', N'COLUMN',N'Document_Type'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'S -- System JV
G -- General
E -- Entity
C -- Customer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FA_TRANSACTION_HEADER', @level2type=N'COLUMN',@level2name=N'Document_Type'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'FA_TRANSACTION_HEADER', N'COLUMN',N'Mode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CA -- Cash
CH -- Cheque
DD -- Demand Draft
PDC -- Post Dated Cheque (PD)
EG -- Electronic Gateway
BI -- Bank Instruction' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FA_TRANSACTION_HEADER', @level2type=N'COLUMN',@level2name=N'Mode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'FA_TRANSACTION_HEADER', N'COLUMN',N'Document_Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A -- Authorized
C -- Cancelled' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FA_TRANSACTION_HEADER', @level2type=N'COLUMN',@level2name=N'Document_Status'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'FA_TRANSACTION_HEADER', N'COLUMN',N'Document_Update_Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'N -- Not Updated
U -- Updated
M -- Modied
D -- Deleted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FA_TRANSACTION_HEADER', @level2type=N'COLUMN',@level2name=N'Document_Update_Status'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'FA_TRANSACTION_HEADER', N'COLUMN',N'Paid_Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'N -- Not Paid
P -- Paid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FA_TRANSACTION_HEADER', @level2type=N'COLUMN',@level2name=N'Paid_Status'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_DNC]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_DNC](
	[DNC_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NOT NULL,
	[Location_Code] [varchar](30) NULL,
	[Document_Type_ID] [int] NOT NULL,
	[Financial_Year] [varchar](15) NULL,
	[Batch] [varchar](5) NOT NULL,
	[From_Number] [numeric](12, 0) NOT NULL,
	[To_Number] [numeric](12, 0) NOT NULL,
	[Level] [varchar](1) NOT NULL,
	[Is_Active] [bit] NULL,
	[Last_User_No] [varchar](12) NULL,
	[Created_By] [int] NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_Date] [datetime] NULL,
	[Modified_By] [int] NULL,
	[Activity] [int] NOT NULL,
 CONSTRAINT [PK_FA_DNC] PRIMARY KEY CLUSTERED 
(
	[DNC_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_INVESTMENT_MASTER]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_INVESTMENT_MASTER](
	[InvestMaster_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Company_Id] [int] NOT NULL,
	[Location_ID] [int] NULL,
	[Location_Code] [varchar](30) NULL,
	[Investment_Type] [int] NULL,
	[Investment_Lookup] [int] NULL,
	[Investment_Code] [varchar](10) NULL,
	[Investment_Desc] [varchar](60) NULL,
	[Investment_AddDesc] [varchar](40) NULL,
	[Unit_Base] [int] NULL,
	[Unit_FaceValue] [numeric](10, 0) NULL,
	[Interest_Periodicity] [int] NULL,
	[Interest_Period_Lookup] [int] NULL,
	[Rate_of_Interest] [numeric](10, 4) NULL,
	[Nature_of_Interest] [int] NULL,
	[NatureofInterest_Lookup] [int] NULL,
	[Interest_Type] [int] NULL,
	[Interesttype_Lookup] [int] NULL,
	[Interest_Frequency] [int] NULL,
	[Interest_Freq_Lookup] [int] NULL,
	[Principal_Frequency] [int] NULL,
	[Principal_Freq_Lookup] [int] NULL,
	[Remarks] [varchar](300) NULL,
	[Is_Active] [bit] NULL,
	[Created_By] [int] NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [int] NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_FA_INVESTMENT_MASTER] PRIMARY KEY CLUSTERED 
(
	[InvestMaster_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_ACCOUNT_DETAIL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_ACCOUNT_DETAIL](
	[Bank_Detail_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NOT NULL,
	[Account_ID] [int] NOT NULL,
	[GL_Code] [varchar](8) NOT NULL,
	[SL_Code] [varchar](14) NULL,
	[SL_Desc] [varchar](50) NULL,
	[Bank_Name] [varchar](60) NULL,
	[Bank_Branch_Name] [varchar](60) NULL,
	[Bank_Acct_Type_Code] [int] NULL,
	[Bank_Acct_Type_ID] [int] NULL,
	[Bank_Address1] [varchar](80) NULL,
	[Bank_Address2] [varchar](80) NULL,
	[Bank_City] [varchar](60) NULL,
	[Bank_PIN] [varchar](20) NULL,
	[Bank_State] [varchar](30) NULL,
	[Bank_Country] [varchar](30) NULL,
	[Cont_Person] [varchar](75) NULL,
	[Cont_Desig] [varchar](50) NULL,
	[Telephone] [varchar](20) NULL,
	[Mobile] [varchar](14) NULL,
	[Email] [varchar](50) NULL,
	[Web] [varchar](50) NULL,
	[Web_Code] [varchar](50) NULL,
	[IS_Active] [bit] NULL,
	[Created_By] [int] NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_by] [int] NULL,
	[Modified_Date] [datetime] NULL,
	[Txn_ID] [int] NULL,
 CONSTRAINT [PK_FA_ACCOUNT_DETAIL] PRIMARY KEY CLUSTERED 
(
	[Bank_Detail_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'text' , N'SCHEMA',N'dbo', N'TABLE',N'FA_ACCOUNT_DETAIL', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'text', @value=N'trf' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FA_ACCOUNT_DETAIL'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_COMP_GL_SUM]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_COMP_GL_SUM](
	[COMP_GL_SUM_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NOT NULL,
	[Location_ID] [int] NOT NULL,
	[Activity] [int] NULL,
	[GL_Code] [varchar](50) NULL,
	[FinMonth] [varchar](50) NULL,
	[Budget_Amt] [decimal](25, 4) NULL,
	[Debit_Amt] [decimal](25, 4) NULL,
	[Credit_Amt] [decimal](25, 4) NULL,
 CONSTRAINT [PK_FA_COMP_GL_SUM] PRIMARY KEY CLUSTERED 
(
	[COMP_GL_SUM_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_COMP_SL_SUM]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_COMP_SL_SUM](
	[COMP_SL_SUM_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NULL,
	[Location_ID] [int] NULL,
	[Activity] [int] NULL,
	[GL_Code] [varchar](50) NULL,
	[SL_Code] [varchar](50) NULL,
	[FinMonth] [varchar](50) NULL,
	[Budget_Amt] [decimal](25, 4) NULL,
	[Debit_Amt] [decimal](25, 4) NULL,
	[Credit_Amt] [decimal](25, 4) NULL,
 CONSTRAINT [PK_FA_COMP_SL_SUM] PRIMARY KEY CLUSTERED 
(
	[COMP_SL_SUM_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_SYS_LOCA_MST]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_SYS_LOCA_MST](
	[Location_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NOT NULL,
	[Location_Code] [varchar](100) NULL,
	[Location_Category_ID] [int] NULL,
	[Parent_ID] [int] NULL,
	[Is_Active] [bit] NULL,
	[Is_Operational] [bit] NULL,
	[Created_By] [int] NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [int] NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_FA_SYS_LOCA_MST] PRIMARY KEY CLUSTERED 
(
	[Location_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_DIMENSION_LOOKUP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_DIMENSION_LOOKUP](
	[Dim_Lookup_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_ID] [int] NOT NULL,
	[Lookup_Id] [int] NOT NULL,
	[Dimension_Type] [int] NOT NULL,
	[Dimension_Value] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FA_DIMENSION_LOOKUP] PRIMARY KEY CLUSTERED 
(
	[Dim_Lookup_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_Challan_Gener_Det]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_Challan_Gener_Det](
	[Challan_Det_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Company_Id] [int] NOT NULL,
	[Challan_Id] [int] NOT NULL,
	[Instrument_Date] [datetime] NULL,
	[Receipt_No] [varchar](50) NOT NULL,
	[Drawee_Bank] [varchar](150) NULL,
	[Drawee_Location] [varchar](50) NULL,
	[Amount] [numeric](25, 4) NOT NULL,
	[Created_By] [int] NOT NULL,
	[Created_On] [datetime] NOT NULL,
	[Modified_By] [int] NULL,
	[Modified_On] [datetime] NULL,
 CONSTRAINT [PK_FA_Challan_Gener_Det] PRIMARY KEY CLUSTERED 
(
	[Challan_Det_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FA_INVESTMENT_TRAN_DTL_OTH]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FA_INVESTMENT_TRAN_DTL_OTH](
	[Trans_Det_Oth_ID] [int] IDENTITY(1,1) NOT NULL,
	[Invest_Header_ID] [int] NULL,
	[Company_ID] [int] NULL,
	[Activity] [int] NULL,
	[Location_ID] [int] NULL,
	[Location_Code] [varchar](50) NULL,
	[Investment_Tran_No] [varchar](50) NULL,
	[Details_Serial_No] [int] NULL,
	[Invest_Link_Key] [int] NULL,
	[Physical_Demat] [int] NULL,
	[Physical_Demat_Lookup] [int] NULL,
	[DP_ID] [varchar](25) NULL,
	[DP_Name] [varchar](100) NULL,
	[Client_ID] [varchar](25) NULL,
	[Account_Number] [varchar](25) NULL,
	[Maintained_At] [varchar](25) NULL,
	[Bought_Date] [datetime] NULL,
	[Bought_Quantity] [int] NULL,
	[Sale_Date] [datetime] NULL,
	[Sale_Quantity] [int] NULL,
 CONSTRAINT [PK_FA_INVESTMENT_TRAN_DTL_OTH] PRIMARY KEY CLUSTERED 
(
	[Trans_Det_Oth_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_LOOKUP_DETAILS_FA_LOOKUP_DETAILS]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_LOOKUP_DETAILS]'))
ALTER TABLE [dbo].[FA_LOOKUP_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_FA_LOOKUP_DETAILS_FA_LOOKUP_DETAILS] FOREIGN KEY([Lookup_ID])
REFERENCES [dbo].[FA_LOOKUP_DETAILS] ([Lookup_ID])
GO
ALTER TABLE [dbo].[FA_LOOKUP_DETAILS] CHECK CONSTRAINT [FK_FA_LOOKUP_DETAILS_FA_LOOKUP_DETAILS]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_LOOKUP_DETAILS_FA_LOOKUP_DETAILS1]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_LOOKUP_DETAILS]'))
ALTER TABLE [dbo].[FA_LOOKUP_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_FA_LOOKUP_DETAILS_FA_LOOKUP_DETAILS1] FOREIGN KEY([Lookup_ID])
REFERENCES [dbo].[FA_LOOKUP_DETAILS] ([Lookup_ID])
GO
ALTER TABLE [dbo].[FA_LOOKUP_DETAILS] CHECK CONSTRAINT [FK_FA_LOOKUP_DETAILS_FA_LOOKUP_DETAILS1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_CFProgramMapping_FA_CashflowMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_CashFlow_ProgramMap]'))
ALTER TABLE [dbo].[FA_CashFlow_ProgramMap]  WITH CHECK ADD  CONSTRAINT [FK_FA_CFProgramMapping_FA_CashflowMaster] FOREIGN KEY([Cashflow_ID])
REFERENCES [dbo].[FA_CashflowMaster] ([CashFlow_ID])
GO
ALTER TABLE [dbo].[FA_CashFlow_ProgramMap] CHECK CONSTRAINT [FK_FA_CFProgramMapping_FA_CashflowMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_TRANSACTION_OTHER_FA_SYS_CompanyMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_OTHERS]'))
ALTER TABLE [dbo].[FA_TRANSACTION_OTHERS]  WITH CHECK ADD  CONSTRAINT [FK_FA_TRANSACTION_OTHER_FA_SYS_CompanyMaster] FOREIGN KEY([Company_ID])
REFERENCES [dbo].[FA_SYS_CompanyMaster] ([Company_ID])
GO
ALTER TABLE [dbo].[FA_TRANSACTION_OTHERS] CHECK CONSTRAINT [FK_FA_TRANSACTION_OTHER_FA_SYS_CompanyMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_TRANSACTION_OTHER_FA_SYS_LOCA_MST]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_OTHERS]'))
ALTER TABLE [dbo].[FA_TRANSACTION_OTHERS]  WITH CHECK ADD  CONSTRAINT [FK_FA_TRANSACTION_OTHER_FA_SYS_LOCA_MST] FOREIGN KEY([Location_ID])
REFERENCES [dbo].[FA_SYS_LOCA_MST] ([Location_ID])
GO
ALTER TABLE [dbo].[FA_TRANSACTION_OTHERS] CHECK CONSTRAINT [FK_FA_TRANSACTION_OTHER_FA_SYS_LOCA_MST]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_TRANSACTION_OTHER_FA_TRANSACTION_HEADER]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_OTHERS]'))
ALTER TABLE [dbo].[FA_TRANSACTION_OTHERS]  WITH CHECK ADD  CONSTRAINT [FK_FA_TRANSACTION_OTHER_FA_TRANSACTION_HEADER] FOREIGN KEY([Tran_Header_ID])
REFERENCES [dbo].[FA_TRANSACTION_HEADER] ([Tran_Header_ID])
GO
ALTER TABLE [dbo].[FA_TRANSACTION_OTHERS] CHECK CONSTRAINT [FK_FA_TRANSACTION_OTHER_FA_TRANSACTION_HEADER]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_TRANSACTION_BANK_DET_FA_SYS_CompanyMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_BANK_DET]'))
ALTER TABLE [dbo].[FA_TRANSACTION_BANK_DET]  WITH CHECK ADD  CONSTRAINT [FK_FA_TRANSACTION_BANK_DET_FA_SYS_CompanyMaster] FOREIGN KEY([Company_ID])
REFERENCES [dbo].[FA_SYS_CompanyMaster] ([Company_ID])
GO
ALTER TABLE [dbo].[FA_TRANSACTION_BANK_DET] CHECK CONSTRAINT [FK_FA_TRANSACTION_BANK_DET_FA_SYS_CompanyMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_TRANSACTION_BANK_DET_FA_SYS_LOCA_MST]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_BANK_DET]'))
ALTER TABLE [dbo].[FA_TRANSACTION_BANK_DET]  WITH CHECK ADD  CONSTRAINT [FK_FA_TRANSACTION_BANK_DET_FA_SYS_LOCA_MST] FOREIGN KEY([Location_ID])
REFERENCES [dbo].[FA_SYS_LOCA_MST] ([Location_ID])
GO
ALTER TABLE [dbo].[FA_TRANSACTION_BANK_DET] CHECK CONSTRAINT [FK_FA_TRANSACTION_BANK_DET_FA_SYS_LOCA_MST]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_TRANSACTION_BANK_DET_FA_TRANSACTION_HEADER]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_BANK_DET]'))
ALTER TABLE [dbo].[FA_TRANSACTION_BANK_DET]  WITH CHECK ADD  CONSTRAINT [FK_FA_TRANSACTION_BANK_DET_FA_TRANSACTION_HEADER] FOREIGN KEY([Tran_Header_ID])
REFERENCES [dbo].[FA_TRANSACTION_HEADER] ([Tran_Header_ID])
GO
ALTER TABLE [dbo].[FA_TRANSACTION_BANK_DET] CHECK CONSTRAINT [FK_FA_TRANSACTION_BANK_DET_FA_TRANSACTION_HEADER]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_TRANSACTION_DET_FA_SYS_CompanyMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_DET]'))
ALTER TABLE [dbo].[FA_TRANSACTION_DET]  WITH CHECK ADD  CONSTRAINT [FK_FA_TRANSACTION_DET_FA_SYS_CompanyMaster] FOREIGN KEY([Company_ID])
REFERENCES [dbo].[FA_SYS_CompanyMaster] ([Company_ID])
GO
ALTER TABLE [dbo].[FA_TRANSACTION_DET] CHECK CONSTRAINT [FK_FA_TRANSACTION_DET_FA_SYS_CompanyMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_TRANSACTION_DET_FA_SYS_LOCA_MST]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_DET]'))
ALTER TABLE [dbo].[FA_TRANSACTION_DET]  WITH CHECK ADD  CONSTRAINT [FK_FA_TRANSACTION_DET_FA_SYS_LOCA_MST] FOREIGN KEY([Location_ID])
REFERENCES [dbo].[FA_SYS_LOCA_MST] ([Location_ID])
GO
ALTER TABLE [dbo].[FA_TRANSACTION_DET] CHECK CONSTRAINT [FK_FA_TRANSACTION_DET_FA_SYS_LOCA_MST]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_TRANSACTION_DET_FA_TRANSACTION_HEADER]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_DET]'))
ALTER TABLE [dbo].[FA_TRANSACTION_DET]  WITH CHECK ADD  CONSTRAINT [FK_FA_TRANSACTION_DET_FA_TRANSACTION_HEADER] FOREIGN KEY([Tran_Header_ID])
REFERENCES [dbo].[FA_TRANSACTION_HEADER] ([Tran_Header_ID])
GO
ALTER TABLE [dbo].[FA_TRANSACTION_DET] CHECK CONSTRAINT [FK_FA_TRANSACTION_DET_FA_TRANSACTION_HEADER]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_TRANSACTION_ADDLESS_DET_FA_SYS_CompanyMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_ADDLESS_DET]'))
ALTER TABLE [dbo].[FA_TRANSACTION_ADDLESS_DET]  WITH CHECK ADD  CONSTRAINT [FK_FA_TRANSACTION_ADDLESS_DET_FA_SYS_CompanyMaster] FOREIGN KEY([Company_ID])
REFERENCES [dbo].[FA_SYS_CompanyMaster] ([Company_ID])
GO
ALTER TABLE [dbo].[FA_TRANSACTION_ADDLESS_DET] CHECK CONSTRAINT [FK_FA_TRANSACTION_ADDLESS_DET_FA_SYS_CompanyMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_TRANSACTION_ADDLESS_DET_FA_SYS_LOCA_MST]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_ADDLESS_DET]'))
ALTER TABLE [dbo].[FA_TRANSACTION_ADDLESS_DET]  WITH CHECK ADD  CONSTRAINT [FK_FA_TRANSACTION_ADDLESS_DET_FA_SYS_LOCA_MST] FOREIGN KEY([Location_ID])
REFERENCES [dbo].[FA_SYS_LOCA_MST] ([Location_ID])
GO
ALTER TABLE [dbo].[FA_TRANSACTION_ADDLESS_DET] CHECK CONSTRAINT [FK_FA_TRANSACTION_ADDLESS_DET_FA_SYS_LOCA_MST]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_TRANSACTION_ADDLESS_DET_FA_TRANSACTION_HEADER]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_ADDLESS_DET]'))
ALTER TABLE [dbo].[FA_TRANSACTION_ADDLESS_DET]  WITH CHECK ADD  CONSTRAINT [FK_FA_TRANSACTION_ADDLESS_DET_FA_TRANSACTION_HEADER] FOREIGN KEY([Tran_Header_ID])
REFERENCES [dbo].[FA_TRANSACTION_HEADER] ([Tran_Header_ID])
GO
ALTER TABLE [dbo].[FA_TRANSACTION_ADDLESS_DET] CHECK CONSTRAINT [FK_FA_TRANSACTION_ADDLESS_DET_FA_TRANSACTION_HEADER]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_TRANSACTION_AUTH_FA_SYS_CompanyMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_AUTH]'))
ALTER TABLE [dbo].[FA_TRANSACTION_AUTH]  WITH CHECK ADD  CONSTRAINT [FK_FA_TRANSACTION_AUTH_FA_SYS_CompanyMaster] FOREIGN KEY([Company_ID])
REFERENCES [dbo].[FA_SYS_CompanyMaster] ([Company_ID])
GO
ALTER TABLE [dbo].[FA_TRANSACTION_AUTH] CHECK CONSTRAINT [FK_FA_TRANSACTION_AUTH_FA_SYS_CompanyMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_TRANSACTION_AUTH_FA_SYS_LOCA_MST]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_AUTH]'))
ALTER TABLE [dbo].[FA_TRANSACTION_AUTH]  WITH CHECK ADD  CONSTRAINT [FK_FA_TRANSACTION_AUTH_FA_SYS_LOCA_MST] FOREIGN KEY([Location_ID])
REFERENCES [dbo].[FA_SYS_LOCA_MST] ([Location_ID])
GO
ALTER TABLE [dbo].[FA_TRANSACTION_AUTH] CHECK CONSTRAINT [FK_FA_TRANSACTION_AUTH_FA_SYS_LOCA_MST]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_TRANSACTION_AUTH_FA_TRANSACTION_HEADER]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_AUTH]'))
ALTER TABLE [dbo].[FA_TRANSACTION_AUTH]  WITH CHECK ADD  CONSTRAINT [FK_FA_TRANSACTION_AUTH_FA_TRANSACTION_HEADER] FOREIGN KEY([Tran_Header_ID])
REFERENCES [dbo].[FA_TRANSACTION_HEADER] ([Tran_Header_ID])
GO
ALTER TABLE [dbo].[FA_TRANSACTION_AUTH] CHECK CONSTRAINT [FK_FA_TRANSACTION_AUTH_FA_TRANSACTION_HEADER]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_TRANSACTION_PAYRECPT_FA_SYS_CompanyMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_PAYRECPT]'))
ALTER TABLE [dbo].[FA_TRANSACTION_PAYRECPT]  WITH CHECK ADD  CONSTRAINT [FK_FA_TRANSACTION_PAYRECPT_FA_SYS_CompanyMaster] FOREIGN KEY([Company_ID])
REFERENCES [dbo].[FA_SYS_CompanyMaster] ([Company_ID])
GO
ALTER TABLE [dbo].[FA_TRANSACTION_PAYRECPT] CHECK CONSTRAINT [FK_FA_TRANSACTION_PAYRECPT_FA_SYS_CompanyMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_TRANSACTION_PAYRECPT_FA_SYS_LOCA_MST]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_PAYRECPT]'))
ALTER TABLE [dbo].[FA_TRANSACTION_PAYRECPT]  WITH CHECK ADD  CONSTRAINT [FK_FA_TRANSACTION_PAYRECPT_FA_SYS_LOCA_MST] FOREIGN KEY([Location_ID])
REFERENCES [dbo].[FA_SYS_LOCA_MST] ([Location_ID])
GO
ALTER TABLE [dbo].[FA_TRANSACTION_PAYRECPT] CHECK CONSTRAINT [FK_FA_TRANSACTION_PAYRECPT_FA_SYS_LOCA_MST]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_TRANSACTION_PAYRECPT_FA_TRANSACTION_HEADER]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_PAYRECPT]'))
ALTER TABLE [dbo].[FA_TRANSACTION_PAYRECPT]  WITH CHECK ADD  CONSTRAINT [FK_FA_TRANSACTION_PAYRECPT_FA_TRANSACTION_HEADER] FOREIGN KEY([Tran_Header_ID])
REFERENCES [dbo].[FA_TRANSACTION_HEADER] ([Tran_Header_ID])
GO
ALTER TABLE [dbo].[FA_TRANSACTION_PAYRECPT] CHECK CONSTRAINT [FK_FA_TRANSACTION_PAYRECPT_FA_TRANSACTION_HEADER]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_SYS_DimensionMaster_FA_SYS_CompanyMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_SYS_DimensionMaster]'))
ALTER TABLE [dbo].[FA_SYS_DimensionMaster]  WITH CHECK ADD  CONSTRAINT [FK_FA_SYS_DimensionMaster_FA_SYS_CompanyMaster] FOREIGN KEY([Company_ID])
REFERENCES [dbo].[FA_SYS_CompanyMaster] ([Company_ID])
GO
ALTER TABLE [dbo].[FA_SYS_DimensionMaster] CHECK CONSTRAINT [FK_FA_SYS_DimensionMaster_FA_SYS_CompanyMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_REPAY_INTEREST_SCHEDULE_FA_SYS_CompanyMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_INVESTMENT_INTRST_SCHED]'))
ALTER TABLE [dbo].[FA_INVESTMENT_INTRST_SCHED]  WITH CHECK ADD  CONSTRAINT [FK_FA_REPAY_INTEREST_SCHEDULE_FA_SYS_CompanyMaster] FOREIGN KEY([Company_ID])
REFERENCES [dbo].[FA_SYS_CompanyMaster] ([Company_ID])
GO
ALTER TABLE [dbo].[FA_INVESTMENT_INTRST_SCHED] CHECK CONSTRAINT [FK_FA_REPAY_INTEREST_SCHEDULE_FA_SYS_CompanyMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_GPS_PROGRAM_AUTHORIZE_FA_GlobalParameter_Setup]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_GPS_PROGRAM_AUTHORIZE]'))
ALTER TABLE [dbo].[FA_GPS_PROGRAM_AUTHORIZE]  WITH CHECK ADD  CONSTRAINT [FK_FA_GPS_PROGRAM_AUTHORIZE_FA_GlobalParameter_Setup] FOREIGN KEY([Global_Parameter_ID])
REFERENCES [dbo].[FA_GlobalParameter_Setup] ([Global_Parameter_ID])
GO
ALTER TABLE [dbo].[FA_GPS_PROGRAM_AUTHORIZE] CHECK CONSTRAINT [FK_FA_GPS_PROGRAM_AUTHORIZE_FA_GlobalParameter_Setup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_GPS_PROGRAM_AUTHORIZE_FA_GPS_PROGRAM_AUTHORIZE]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_GPS_PROGRAM_AUTHORIZE]'))
ALTER TABLE [dbo].[FA_GPS_PROGRAM_AUTHORIZE]  WITH CHECK ADD  CONSTRAINT [FK_FA_GPS_PROGRAM_AUTHORIZE_FA_GPS_PROGRAM_AUTHORIZE] FOREIGN KEY([AuthorizeRole_ID])
REFERENCES [dbo].[FA_GPS_PROGRAM_AUTHORIZE] ([AuthorizeRole_ID])
GO
ALTER TABLE [dbo].[FA_GPS_PROGRAM_AUTHORIZE] CHECK CONSTRAINT [FK_FA_GPS_PROGRAM_AUTHORIZE_FA_GPS_PROGRAM_AUTHORIZE]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_GPS_PROGRAM_AUTHORIZE_FA_SYS_CompanyMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_GPS_PROGRAM_AUTHORIZE]'))
ALTER TABLE [dbo].[FA_GPS_PROGRAM_AUTHORIZE]  WITH CHECK ADD  CONSTRAINT [FK_FA_GPS_PROGRAM_AUTHORIZE_FA_SYS_CompanyMaster] FOREIGN KEY([Company_ID])
REFERENCES [dbo].[FA_SYS_CompanyMaster] ([Company_ID])
GO
ALTER TABLE [dbo].[FA_GPS_PROGRAM_AUTHORIZE] CHECK CONSTRAINT [FK_FA_GPS_PROGRAM_AUTHORIZE_FA_SYS_CompanyMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_INVESTMENT_TRAN_DTL_FA_INVESTMENT_TRAN_HDR]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_INVESTMENT_TRAN_DTL]'))
ALTER TABLE [dbo].[FA_INVESTMENT_TRAN_DTL]  WITH CHECK ADD  CONSTRAINT [FK_FA_INVESTMENT_TRAN_DTL_FA_INVESTMENT_TRAN_HDR] FOREIGN KEY([Invest_Header_ID])
REFERENCES [dbo].[FA_INVESTMENT_TRAN_HDR] ([Invest_Header_ID])
GO
ALTER TABLE [dbo].[FA_INVESTMENT_TRAN_DTL] CHECK CONSTRAINT [FK_FA_INVESTMENT_TRAN_DTL_FA_INVESTMENT_TRAN_HDR]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_INVESTMENT_TRAN_DTL_FA_SYS_CompanyMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_INVESTMENT_TRAN_DTL]'))
ALTER TABLE [dbo].[FA_INVESTMENT_TRAN_DTL]  WITH CHECK ADD  CONSTRAINT [FK_FA_INVESTMENT_TRAN_DTL_FA_SYS_CompanyMaster] FOREIGN KEY([Company_ID])
REFERENCES [dbo].[FA_SYS_CompanyMaster] ([Company_ID])
GO
ALTER TABLE [dbo].[FA_INVESTMENT_TRAN_DTL] CHECK CONSTRAINT [FK_FA_INVESTMENT_TRAN_DTL_FA_SYS_CompanyMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_TRANSACTION_HEADER_FA_SYS_CompanyMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_HEADER]'))
ALTER TABLE [dbo].[FA_TRANSACTION_HEADER]  WITH CHECK ADD  CONSTRAINT [FK_FA_TRANSACTION_HEADER_FA_SYS_CompanyMaster] FOREIGN KEY([Company_ID])
REFERENCES [dbo].[FA_SYS_CompanyMaster] ([Company_ID])
GO
ALTER TABLE [dbo].[FA_TRANSACTION_HEADER] CHECK CONSTRAINT [FK_FA_TRANSACTION_HEADER_FA_SYS_CompanyMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_TRANSACTION_HEADER_FA_SYS_LOCA_MST]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_TRANSACTION_HEADER]'))
ALTER TABLE [dbo].[FA_TRANSACTION_HEADER]  WITH CHECK ADD  CONSTRAINT [FK_FA_TRANSACTION_HEADER_FA_SYS_LOCA_MST] FOREIGN KEY([Location_ID])
REFERENCES [dbo].[FA_SYS_LOCA_MST] ([Location_ID])
GO
ALTER TABLE [dbo].[FA_TRANSACTION_HEADER] CHECK CONSTRAINT [FK_FA_TRANSACTION_HEADER_FA_SYS_LOCA_MST]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_DNC_FA_CompanyMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_SYS_DNC]'))
ALTER TABLE [dbo].[FA_SYS_DNC]  WITH CHECK ADD  CONSTRAINT [FK_FA_DNC_FA_CompanyMaster] FOREIGN KEY([Company_ID])
REFERENCES [dbo].[FA_SYS_CompanyMaster] ([Company_ID])
GO
ALTER TABLE [dbo].[FA_SYS_DNC] CHECK CONSTRAINT [FK_FA_DNC_FA_CompanyMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_DNC_FA_DNC]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_SYS_DNC]'))
ALTER TABLE [dbo].[FA_SYS_DNC]  WITH CHECK ADD  CONSTRAINT [FK_FA_DNC_FA_DNC] FOREIGN KEY([Document_Type_ID])
REFERENCES [dbo].[FA_SYS_DocType] ([Document_Type_ID])
GO
ALTER TABLE [dbo].[FA_SYS_DNC] CHECK CONSTRAINT [FK_FA_DNC_FA_DNC]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_INVESTMENT_MASTER_FA_SYS_CompanyMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_INVESTMENT_MASTER]'))
ALTER TABLE [dbo].[FA_INVESTMENT_MASTER]  WITH CHECK ADD  CONSTRAINT [FK_FA_INVESTMENT_MASTER_FA_SYS_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[FA_SYS_CompanyMaster] ([Company_ID])
GO
ALTER TABLE [dbo].[FA_INVESTMENT_MASTER] CHECK CONSTRAINT [FK_FA_INVESTMENT_MASTER_FA_SYS_CompanyMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_ACCOUNT_DETAIL_FA_ACCOUNT_MASTER]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_ACCOUNT_DETAIL]'))
ALTER TABLE [dbo].[FA_ACCOUNT_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_FA_ACCOUNT_DETAIL_FA_ACCOUNT_MASTER] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[FA_ACCOUNT_MASTER] ([Account_ID])
GO
ALTER TABLE [dbo].[FA_ACCOUNT_DETAIL] CHECK CONSTRAINT [FK_FA_ACCOUNT_DETAIL_FA_ACCOUNT_MASTER]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_ACCOUNT_DETAIL_FA_SYS_CompanyMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_ACCOUNT_DETAIL]'))
ALTER TABLE [dbo].[FA_ACCOUNT_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_FA_ACCOUNT_DETAIL_FA_SYS_CompanyMaster] FOREIGN KEY([Company_ID])
REFERENCES [dbo].[FA_SYS_CompanyMaster] ([Company_ID])
GO
ALTER TABLE [dbo].[FA_ACCOUNT_DETAIL] CHECK CONSTRAINT [FK_FA_ACCOUNT_DETAIL_FA_SYS_CompanyMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_COMP_GL_SUM_FA_SYS_CompanyMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_COMP_GL_SUM]'))
ALTER TABLE [dbo].[FA_COMP_GL_SUM]  WITH CHECK ADD  CONSTRAINT [FK_FA_COMP_GL_SUM_FA_SYS_CompanyMaster] FOREIGN KEY([Company_ID])
REFERENCES [dbo].[FA_SYS_CompanyMaster] ([Company_ID])
GO
ALTER TABLE [dbo].[FA_COMP_GL_SUM] CHECK CONSTRAINT [FK_FA_COMP_GL_SUM_FA_SYS_CompanyMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_COMP_GL_SUM_FA_SYS_LOCA_MST]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_COMP_GL_SUM]'))
ALTER TABLE [dbo].[FA_COMP_GL_SUM]  WITH CHECK ADD  CONSTRAINT [FK_FA_COMP_GL_SUM_FA_SYS_LOCA_MST] FOREIGN KEY([Location_ID])
REFERENCES [dbo].[FA_SYS_LOCA_MST] ([Location_ID])
GO
ALTER TABLE [dbo].[FA_COMP_GL_SUM] CHECK CONSTRAINT [FK_FA_COMP_GL_SUM_FA_SYS_LOCA_MST]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_COMP_SL_SUM_FA_SYS_CompanyMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_COMP_SL_SUM]'))
ALTER TABLE [dbo].[FA_COMP_SL_SUM]  WITH CHECK ADD  CONSTRAINT [FK_FA_COMP_SL_SUM_FA_SYS_CompanyMaster] FOREIGN KEY([Company_ID])
REFERENCES [dbo].[FA_SYS_CompanyMaster] ([Company_ID])
GO
ALTER TABLE [dbo].[FA_COMP_SL_SUM] CHECK CONSTRAINT [FK_FA_COMP_SL_SUM_FA_SYS_CompanyMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_COMP_SL_SUM_FA_SYS_LOCA_MST]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_COMP_SL_SUM]'))
ALTER TABLE [dbo].[FA_COMP_SL_SUM]  WITH CHECK ADD  CONSTRAINT [FK_FA_COMP_SL_SUM_FA_SYS_LOCA_MST] FOREIGN KEY([Location_ID])
REFERENCES [dbo].[FA_SYS_LOCA_MST] ([Location_ID])
GO
ALTER TABLE [dbo].[FA_COMP_SL_SUM] CHECK CONSTRAINT [FK_FA_COMP_SL_SUM_FA_SYS_LOCA_MST]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_SYS_LOCA_MST_FA_SYS_LOCA_CAT]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_SYS_LOCA_MST]'))
ALTER TABLE [dbo].[FA_SYS_LOCA_MST]  WITH CHECK ADD  CONSTRAINT [FK_FA_SYS_LOCA_MST_FA_SYS_LOCA_CAT] FOREIGN KEY([Location_Category_ID])
REFERENCES [dbo].[FA_SYS_LOCA_CAT] ([Location_Category_ID])
GO
ALTER TABLE [dbo].[FA_SYS_LOCA_MST] CHECK CONSTRAINT [FK_FA_SYS_LOCA_MST_FA_SYS_LOCA_CAT]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_DIMENSION_LOOKUP_FA_LOOKUP_DETAILS]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_DIMENSION_LOOKUP]'))
ALTER TABLE [dbo].[FA_DIMENSION_LOOKUP]  WITH CHECK ADD  CONSTRAINT [FK_FA_DIMENSION_LOOKUP_FA_LOOKUP_DETAILS] FOREIGN KEY([Lookup_Id])
REFERENCES [dbo].[FA_LOOKUP_DETAILS] ([Lookup_ID])
GO
ALTER TABLE [dbo].[FA_DIMENSION_LOOKUP] CHECK CONSTRAINT [FK_FA_DIMENSION_LOOKUP_FA_LOOKUP_DETAILS]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_Challan_Gener_Det_FA_Challan_Generation]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_Challan_Gener_Det]'))
ALTER TABLE [dbo].[FA_Challan_Gener_Det]  WITH CHECK ADD  CONSTRAINT [FK_FA_Challan_Gener_Det_FA_Challan_Generation] FOREIGN KEY([Challan_Id])
REFERENCES [dbo].[FA_Challan_Generation] ([Challan_ID])
GO
ALTER TABLE [dbo].[FA_Challan_Gener_Det] CHECK CONSTRAINT [FK_FA_Challan_Gener_Det_FA_Challan_Generation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FA_INVESTMENT_TRAN_DTL_OTH_FA_INVESTMENT_TRAN_HDR]') AND parent_object_id = OBJECT_ID(N'[dbo].[FA_INVESTMENT_TRAN_DTL_OTH]'))
ALTER TABLE [dbo].[FA_INVESTMENT_TRAN_DTL_OTH]  WITH CHECK ADD  CONSTRAINT [FK_FA_INVESTMENT_TRAN_DTL_OTH_FA_INVESTMENT_TRAN_HDR] FOREIGN KEY([Invest_Header_ID])
REFERENCES [dbo].[FA_INVESTMENT_TRAN_HDR] ([Invest_Header_ID])
GO
ALTER TABLE [dbo].[FA_INVESTMENT_TRAN_DTL_OTH] CHECK CONSTRAINT [FK_FA_INVESTMENT_TRAN_DTL_OTH_FA_INVESTMENT_TRAN_HDR]
