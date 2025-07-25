using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


/// <summary>
/// Class is used to set user related Information
/// </summary>
public class UserInfo_FA : IDisposable
{
	public UserInfo_FA()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /// <summary>
    /// Constructor to set Companyid,UserId,CompanyName & UserName
    /// </summary>
    /// <param name="Companyid"></param>
    /// <param name="UserId"></param>
    /// <param name="CompanyName"></param>
    /// <param name="UserName"></param>
    public UserInfo_FA(int intCompanyid, int intUserId, int intUserLevelId, string strUserLogin, string strCompanyName, string strUserName, string strlocalization, string strTheme, DateTime LastLogin, string strAccess, string strCountryName, string strUserType, string strCompanyCode, string strMarquee)
    {
        ProCompanyIdRW = intCompanyid;
        ProUserIdRW = intUserId;
        ProUserLevelIdRW = intUserLevelId;
        ProCompanyNameRW = strCompanyName;
        ProUserNameRW = strUserName;
        ProUserLoginRW = strUserLogin;
        ProLocalizationRW=strlocalization;
        ProUserThemeRW = strTheme;
        ProLastLoginRW = LastLogin;
        ProUserLevelAccessRW = strAccess;
        ProCountryNameR = strCountryName;
        ProUserTypeRW = strUserType;
        ProCompanyCodeRW = strCompanyCode;
        ProMarqueeRW = strMarquee;  //Added by Santhosh.S on 03/07/2013

    }

    public int ProUserIdRW
    {
        get
        {
            return Convert.ToInt32(Utility_FA.Load("User_Id", ""));
        }

        set
        {
            Utility_FA.store("User_Id", value);
        }
    }

    public int ProUserLevelIdRW
    {
        get
        {
            return Convert.ToInt32(Utility_FA.Load("User_Level_Id", ""));
        }

        set
        {
            Utility_FA.store("User_Level_Id", value);
        }
    }

    public string ProCompanyNameRW
    {
        get
        {
            return ((string)Utility_FA.Load("Company_Name", ""));
        }

        set
        {
            Utility_FA.store("Company_Name", value);
        }
    }

    public string ProCompanyCodeRW
    {
        get
        {
            return ((string)Utility_FA.Load("Company_Code", ""));
        }

        set
        {
            Utility_FA.store("Company_Code", value);
        }
    }


    public string ProUserTypeRW
    {
        get
        {
            return ((string)Utility_FA.Load("User_Type", ""));
        }

        set
        {
            Utility_FA.store("User_Type", value);
        }
    }

    public string ProCountryNameR
    {
        get
        {
            return ((string)Utility_FA.Load("Country_Name", ""));
        }

        set
        {
            Utility_FA.store("Country_Name", value);
        }
    }
    public string ProUserLoginRW
    {
        get
        {
            return ((string)Utility_FA.Load("User_Code", ""));
        }

        set
        {
            Utility_FA.store("User_Code", value);
        }
    }

    public string ProLocalizationRW
    {
        get
        {
            return ((string)Utility_FA.Load("localization", ""));
        }

        set
        {
            Utility_FA.store("localization", value);
        }
    }
    public string ProUserThemeRW
    {
        get
        {
            if(((string)Utility_FA.Load("User_Theme", "")==string.Empty)||((string)Utility_FA.Load("User_Theme", "")==null))
                return "S3GTheme_Blue2";
            else
                return ((string)Utility_FA.Load("User_Theme", ""));
        }

        set
        {
            Utility_FA.store("User_Theme", value);
        }
    }

    public string ProUserNameRW
    {
        get
        {
            return ((string)Utility_FA.Load("User_Name", ""));
        }

        set
        {
            Utility_FA.store("User_Name", value);
        }
    }

    //Added by Santhosh.S on 03/07/2013
    public string ProMarqueeRW
    {
        get
        {
            return ((string)Utility_FA.Load("Marquee", ""));
        }
        set
        {
            Utility_FA.store("Marquee", value);
        }
    }

    public DateTime ProLastLoginRW
    {
        get
        {
            return Convert.ToDateTime(Utility_FA.Load("Last_Login", ""));
        }

        set
        {
            Utility_FA.store("Last_Login", value);
        }
    }
    public int ProCompanyIdRW
    {
        get
        {
            return (Convert.ToInt32(Utility_FA.Load("Company_Id", "")));
        }

        set
        {
            Utility_FA.store("Company_Id", value);
        }
    }

    public string ProUserLevelAccessRW
    {
        get
        {
            return ((string)Utility_FA.Load("UserLevelAccess", ""));
        }
        set
        {
            Utility_FA.store("UserLevelAccess", value);
        }
    }

    public bool ProCreateRW
    {
        get
        {
            return (FunGetValidateAccess("C"));
        }
    }
    
    public bool ProModifyRW
    {
        get
        {
            return (FunGetValidateAccess("MO"));
        }
    }

    public bool ProDeleteRW
    {
        get
        {
            return (FunGetValidateAccess("D"));
        }
    }

    public bool ProViewRW
    {
        get
        {
            return (FunGetValidateAccess("V"));
        }
    }
    public bool ProReportRW
    {
        get
        {
            return (FunGetValidateAccess("R"));
        }
    }
    public bool ProMakerCheckerRW
    {
        get
        {
            return (FunGetValidateAccess("MC"));
        }
    }
    public bool ProIsActiveRW
    {
        get
        {
            return (FunGetValidateAccess("AC"));
        }
    }

    public bool ProUserLevelUpdate
    {
        get
        {
            return (FunGetValidateAccess("ULU"));
        }
    }
    
    private bool FunGetValidateAccess(string strAccessID)
    {
        //string[] strAccess = ProAccessRW.Split(new char[]{'|'});
        //strAccessID = "|" + strAccessID;
        //strAccess.
        if (ProUserLevelAccessRW != null)
        {
            if (ProUserLevelAccessRW.Contains("|" + strAccessID))
                return true;
            else
                return false;
        }
        return false;
        //foreach(string s in strAccess)
        //{
        //    if (s==strAccessID)
        //    {
        //        return true;
        //    }
        //}
        //return false;
    }

    //Added by Kali on 26-Jul-2010 to validate user based on user level and Maker Checker.

    public bool IsUserLevelUpdate(int intUserID, int intUserLevelID)
    {

        //If MakerChecker is true and Record created by the Logged in User then false

        if ((ProMakerCheckerRW) && (ProUserIdRW == intUserID))
        {
            return false;
        }
        if (!ProUserLevelUpdate)
        {
            return true;
        }

        if ((ProUserLevelIdRW == 1) || (ProUserLevelIdRW == 2))
        {
            return false;
        }
        ////If LoggedIn user level id is 5 then true
        if (ProUserLevelIdRW == 5)
        {
            return true;
        }
        
        //If Logged In User Level is 3 and records created by level 2 or level 1 then true
        if (ProUserLevelIdRW == 3 && ((intUserLevelID == 1) || (intUserLevelID == 2) || (intUserLevelID == 3 && ProUserIdRW != intUserID) || (intUserLevelID==4)))
        {
            return true;
        }
        if ((ProUserLevelIdRW == 4) && (ProUserLevelIdRW >= intUserLevelID) && (ProUserIdRW != intUserID))
        {
            return true;
        }
        return false;
    }
    //Code end

    //Added by Saranya on 10-Feb-2012 to validate user based on user level and Maker Checker.

    public bool IsUserLevelUpdate(int intUserID, int intUserLevelID, bool boolSysAdmProgram)
    {
        if (ProUserLevelIdRW == 5 && boolSysAdmProgram)
        {
            return true;
        }
        //If MakerChecker is true and Record created by the Logged in User then false

        if ((ProMakerCheckerRW) && (ProUserIdRW == intUserID))
        {
            return false;
        }
        if (!ProUserLevelUpdate)
        {
            return true;
        }

        if ((ProUserLevelIdRW == 1) || (ProUserLevelIdRW == 2))
        {
            return false;
        }
        ////If LoggedIn user level id is 5 then true
        if (ProUserLevelIdRW == 5)
        {
            return true;
        }

        //If Logged In User Level is 3 and records created by level 2 or level 1 then true
        if (ProUserLevelIdRW == 3 && ((intUserLevelID == 1) || (intUserLevelID == 2) || (intUserLevelID == 3 && ProUserIdRW != intUserID) || (intUserLevelID == 4) || (intUserLevelID == 5)))
        {
            return true;
        }
        //changed by bhuvana as per Sudarsan Sir mail on 22/11/2012 for approval

        //if ((ProUserLevelIdRW == 4) && (ProUserLevelIdRW >= intUserLevelID) && (ProUserIdRW != intUserID))
        //{
        //    return true;
        //}
        if ((ProUserLevelIdRW == 4) && (ProUserIdRW != intUserID))
        {
            return true;
        }
        return false;
    }
    //Code end

    #region IDisposable Members

    public void Dispose()
    {
        GC.SuppressFinalize(this);
    }

    #endregion
}