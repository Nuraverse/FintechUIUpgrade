using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;


/// <summary>
/// This class is used to store and retrive session data in FA project
/// created By Tamilselvan.S
/// Cretaed Date 01/02/2012
/// </summary>
public class FASession
{
    public FASession()
    {

    }

    public FASession(string strDatformat, 
                     string strCurrencyName,
                     string strCurrencyCode, 
                     int intCurrencyId, 
                     int intGpsPrefix,
                     int intGpsSuffix,
                     decimal decCurrencyValue, 
                     string strFinYear, 
                     string strFinStartYear, 
                     string strFinEndYear, 
                     string strFinYearStartMonth, 
                     string strFinYearEndMonth, 
                     bool blnDimApplicable, 
                     bool blnDim2_Linkwith_Dim1,
                     bool blnBudgetAllicable, 
                     int intExchangeRateID,
                     int intDenominatorDays, 
                     bool blnMultiCompany, 
                     string strCurrencyLevel, 
                     int intCurrencyLevelID,
                     int intChequeValidDays, 
                     string strConnectionName,
                     int intnofprojectedyr )
    {
        ProDateFormatRW = strDatformat;
        ProCurrencyNameRW = strCurrencyName;
        ProCurrencyCodeRW = strCurrencyCode;
        ProCurrencyIdRW = intCurrencyId;
        ProCurrencyValueRW = decCurrencyValue;
        ProGpsPrefixRW = intGpsPrefix;
        ProGpsSuffixRW = intGpsSuffix;
        ProFinYearRW = strFinYear;
        ProFinStartYearRW = strFinStartYear;
        ProFinEndYearRW = strFinEndYear;
        ProFinYearStartMonthRW = strFinYearStartMonth;
        ProFinYearEndMonthRW = strFinYearEndMonth;
        ProDimensionApplicableRW = blnDimApplicable;
        ProDim2_Linkwith_Dim1RW = blnDim2_Linkwith_Dim1;
        ProBudgetApplicableRW = blnBudgetAllicable;
        ProExchangeRateIDRW = intExchangeRateID;
        ProDenominatorDaysRW = intDenominatorDays;
        ProMultiCompanyRW = blnMultiCompany;
        ProCurrencyLevelIDRW = intCurrencyLevelID;
        ProCurrencyLevelRW = strCurrencyLevel;
        ProInstrumentValidDaysRW = intChequeValidDays;        
        ProConnectionName = strConnectionName;
        probudgetprojectedyear = intnofprojectedyr;
    }

    public string ProDateFormatRW
    {
        get
        {
            return ((string)Utility_FA.Load("DateFormat", ""));
        }

        set
        {
            Utility_FA.store("DateFormat", value);
        }

    }

    public string ProCurrencyCodeRW
    {
        get
        {
            return ((string)Utility_FA.Load("CurrencyCode", ""));
        }

        set
        {
            Utility_FA.store("CurrencyCode", value);
        }

    }

    public string ProCurrencyNameRW
    {
        get
        {
            return ((string)Utility_FA.Load("CurrencyName", ""));
        }

        set
        {
            Utility_FA.store("CurrencyName", value);
        }

    }

    public int ProCurrencyIdRW
    {
        get
        {
            return ((int)Utility_FA.Load("Currencyid", ""));
        }

        set
        {
            Utility_FA.store("Currencyid", value);
        }

    }

    /// <summary>
    /// Added on 17/03/2012 by Tamilselvan.S 
    /// </summary>
    public decimal ProCurrencyValueRW
    {
        get
        {
            return ((decimal)Utility_FA.Load("CurrencyValue", ""));
        }

        set
        {
            Utility_FA.store("CurrencyValue", value);
        }

    }

    public int ProGpsPrefixRW
    {
        get
        {
            return ((int)Utility_FA.Load("GpsPrefix", ""));
        }

        set
        {
            Utility_FA.store("GpsPrefix", value);
        }

    }

    public int ProGpsSuffixRW
    {
        get
        {
            return ((int)Utility_FA.Load("GpsSuffix", ""));
        }

        set
        {
            Utility_FA.store("GpsSuffix", value);
        }

    }

    /// <summary>
    /// Added on 17/03/2012 by Tamilselvan.S 
    /// </summary>
    public string ProFinYearRW
    {
        get
        {
            return ((string)Utility_FA.Load("FinYear", ""));
        }
        set
        {
            Utility_FA.store("FinYear", value);
        }
    }

    /// <summary>
    /// Added on 17/03/2012 by Tamilselvan.S 
    /// </summary>
    public string ProFinStartYearRW
    {
        get
        {
            return ((string)Utility_FA.Load("FinStartYear", ""));
        }
        set
        {
            Utility_FA.store("FinStartYear", value);
        }
    }

    /// <summary>
    /// Added on 17/03/2012 by Tamilselvan.S 
    /// </summary>
    public string ProFinEndYearRW
    {
        get
        {
            return ((string)Utility_FA.Load("FinEndYear", ""));
        }
        set
        {
            Utility_FA.store("FinEndYear", value);
        }
    }

    /// <summary>
    /// Added on 17/03/2012 by Tamilselvan.S 
    /// </summary>
    public string ProFinYearStartMonthRW
    {
        get
        {
            return ((string)Utility_FA.Load("FinYearStartMonth", ""));
        }
        set
        {
            Utility_FA.store("FinYearStartMonth", value);
        }
    }

    /// <summary>
    /// Added on 17/03/2012 by Tamilselvan.S 
    /// </summary>
    public string ProFinYearEndMonthRW
    {
        get
        {
            return ((string)Utility_FA.Load("FinYearEndMonth", ""));
        }
        set
        {
            Utility_FA.store("FinYearEndMonth", value);
        }
    }

    /// <summary>
    /// Added on 17/03/2012 by Tamilselvan.S 
    /// </summary>
    public bool ProDimensionApplicableRW
    {
        get
        {
            return ((bool)Utility_FA.Load("DimensionApplicable", ""));
        }
        set
        {
            Utility_FA.store("DimensionApplicable", value);
        }
    }

    /// <summary>
    /// Added on 12/04/2012 by Tamilselvan.S 
    /// </summary>
    public bool ProDim2_Linkwith_Dim1RW
    {
        get
        {
            return ((bool)Utility_FA.Load("Dim2_Linkwith_Dim1", ""));
        }
        set
        {
            Utility_FA.store("Dim2_Linkwith_Dim1", value);
        }
    }

    /// <summary>
    /// Added on 17/03/2012 by Tamilselvan.S 
    /// </summary>
    public bool ProBudgetApplicableRW
    {
        get
        {
            return ((bool)Utility_FA.Load("BudgetApplicable", ""));
        }
        set
        {
            Utility_FA.store("BudgetApplicable", value);
        }
    }

    /// <summary>
    /// Added on 17/03/2012 by Tamilselvan.S 
    /// </summary>
    public int ProExchangeRateIDRW
    {
        get
        {
            return ((int)Utility_FA.Load("ExchangeRateID", ""));
        }
        set
        {
            Utility_FA.store("ExchangeRateID", value);
        }
    }

    /// <summary>
    /// Added on 17/03/2012 by Tamilselvan.S 
    /// </summary>
    public int ProDenominatorDaysRW
    {
        get
        {
            return ((int)Utility_FA.Load("DenominatorDays", ""));
        }
        set
        {
            Utility_FA.store("DenominatorDays", value);
        }
    }

    /// <summary>
    /// Added on 31/03/2012 by Tamilselvan.S
    /// </summary>
    public bool ProMultiCompanyRW
    {
        get
        {
            return ((bool)Utility_FA.Load("MultiCompany", ""));
        }
        set
        {
            Utility_FA.store("MultiCompany", value);
        }
    }

    /// <summary>
    /// Added on 31/03/2012 by Tamilselvan.S
    /// </summary>
    public string ProCurrencyLevelRW
    {
        get
        {
            return ((string)Utility_FA.Load("CurrencyLevel", ""));
        }
        set
        {
            Utility_FA.store("CurrencyLevel", value);
        }
    }

    /// <summary>
    /// Added on 31/03/2012 by Tamilselvan.S
    /// </summary>
    public int ProCurrencyLevelIDRW
    {
        get
        {
            return ((int)Utility_FA.Load("CurrencyLevelID", ""));
        }
        set
        {
            Utility_FA.store("CurrencyLevelID", value);
        }
    }

    /// <summary>
    /// Added on 31/03/2012 by Tamilselvan.S
    /// </summary>
    public int ProInstrumentValidDaysRW
    {
        get
        {
            return ((int)Utility_FA.Load("InstrumentValidDays", ""));
        }
        set
        {
            Utility_FA.store("InstrumentValidDays", value);
        }
    }

    public string ProConnectionName
    {
        get
        {
            return ((string)Utility_FA.Load("ConnectionName", ""));
        }
        set
        {
            Utility_FA.store("ConnectionName", value);
        }
    }

    public int probudgetprojectedyear
    {
        get
        {
            return ((int)Utility_FA.Load("NOOF_BUDGET_PRJ_YR", ""));
        }

        set
        {
            Utility_FA.store("NOOF_BUDGET_PRJ_YR", value);
        }

    }
}
