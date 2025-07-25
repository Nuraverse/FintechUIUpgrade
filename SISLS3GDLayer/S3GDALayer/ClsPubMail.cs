
using System.Collections.Generic;
using System.Web;
using System.Net.Mail;
using System.Configuration;
using S3GBusEntity;
using System.Data.SqlClient;
using System.Data;
using System;using S3GDALayer.S3GAdminServices;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Runtime.Serialization.Formatters.Binary;
using System.Xml.Serialization;
using System.IO;
using System.Configuration;

namespace S3GDALayer
{
    [Serializable]
    public class ClsPubMail
    {
        //SqlConnection sqlcon = null;   
        //SqlCommand sqlcom;
        //SqlDataAdapter sqldap;
        //DataSet ds;

        //Code added for getting common connection string  from config file
            Database db;
            

        string strSMTPServerName = string.Empty;
        public ClsPubMail()
        {
            AppSettingsReader ObjAppSettReader = new AppSettingsReader();
            strSMTPServerName = (string)ObjAppSettReader.GetValue("SMTPServer", typeof(string));

            db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

            //sqlcon = new SqlConnection(db.ConnectionString);//((string)ObjAppSettReader.GetValue("connectionString", typeof(string)));
        }
        public void FunSendMail(ClsPubCOM_Mail ObjComMail)
        {

            try
            {
                MailMessage ObjMailMessage = new MailMessage();
                string[] arrToEMail;
                string[] arrCCEMail;
                string[] arrBCcEMail;

                ObjMailMessage.From = new MailAddress(ObjComMail.ProFromRW);

                arrToEMail = ObjComMail.ProTORW.Split(new char[] { ',' });
                
                foreach (string strMailAddress in arrToEMail)
                {
                    if (!string.IsNullOrEmpty(strMailAddress))
                    {
                        ObjMailMessage.To.Add(strMailAddress);
                    }
                }

                if (!string.IsNullOrEmpty(ObjComMail.ProCCRW))
                {
                    arrCCEMail = ObjComMail.ProCCRW.Split(new char[] { ',' });
                    foreach (string strMailAddress in arrCCEMail)
                    {
                        if (!string.IsNullOrEmpty(strMailAddress))
                        {
                            ObjMailMessage.CC.Add(strMailAddress);
                        }
                    }
                }

                if (!string.IsNullOrEmpty(ObjComMail.ProBCCRW))
                {
                    arrBCcEMail = ObjComMail.ProBCCRW.Split(new char[] { ',' });
                    foreach (string strMailAddress in arrBCcEMail)
                    {
                        if (!string.IsNullOrEmpty(strMailAddress))
                        {
                            ObjMailMessage.Bcc.Add(strMailAddress);
                        }
                    }
                }
                ObjMailMessage.Subject = string.IsNullOrEmpty(ObjComMail.ProSubjectRW) ? string.Empty : ObjComMail.ProSubjectRW;
                ObjMailMessage.IsBodyHtml = true;
                ObjMailMessage.Body = ObjComMail.ProMessageRW;
                //ObjMailMessage.Headers.Add("Disposition-Notification-To", "email address");
                ObjMailMessage.DeliveryNotificationOptions = DeliveryNotificationOptions.OnSuccess & DeliveryNotificationOptions.Delay & DeliveryNotificationOptions.OnFailure;

                ////single file attachment
                //if (!string.IsNullOrEmpty(FileAttachmentPath))
                //{
                //    Attachment objAttachment = new Attachment(FileAttachmentPath);
                //    ObjMailMessage.Attachments.Add(objAttachment);
                //}
                //Multi file attachment

                if (ObjComMail.ProFileAttachementRW != null)
                {
                    foreach (string ObjAttachmentCollection in ObjComMail.ProFileAttachementRW)
                    {
                        if (!string.IsNullOrEmpty(ObjAttachmentCollection))
                        {
                            Attachment objAttachmentS = new Attachment(ObjAttachmentCollection);
                            ObjMailMessage.Attachments.Add(objAttachmentS);
                        }
                    }
                }
                ObjMailMessage.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
                SmtpClient ObjClient = new SmtpClient(strSMTPServerName);
                ObjClient.Credentials = System.Net.CredentialCache.DefaultNetworkCredentials;
                ObjClient.UseDefaultCredentials = true;
                ObjClient.Send(ObjMailMessage);
                
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        //public string[] GetData(string prefixText, int count)
        //{
        //    DataView data = GetView();

        //    data = FilterData(data, prefixText);

        //    int intTotalCount = data.Count;
        //    if (data.Count > count)
        //        intTotalCount = count;

        //    string[] suggestion = new string[intTotalCount];

        //    int i = 0;
        //    foreach (DataRowView row in data)
        //    {
        //        suggestion[i++] = row["Program_Name"] as string;
        //        if (i >= count) break;
        //    }
        //    return suggestion;
        //}

        //private DataView GetView()
        //{
        //    //   DataView view = (DataView)HttpContext.Current.Cache["Suggestion"];
        //    // if (view == null)
        //    //{
        //    //string strConnectionString = Convert.ToString(ConfigurationManager.AppSettings["connectionString"]);

        //    DataView view = new DataView();

        //    SqlDataAdapter adapter = new SqlDataAdapter("select Program_Name from snxg_program_Master", sqlcon);

        //    DataTable table = new DataTable();
        //    adapter.Fill(table);
        //    view = table.DefaultView;

        //    //  HttpContext.Current.Cache["Suggestion"] = view;
        //    //}
        //    return view;
        //}
        private DataView FilterData(DataView view, string strPrefixText)
        {
            view.RowFilter = string.Format("Program_Name like '{0}%'", strPrefixText);
            return view;
        }
    }
}
