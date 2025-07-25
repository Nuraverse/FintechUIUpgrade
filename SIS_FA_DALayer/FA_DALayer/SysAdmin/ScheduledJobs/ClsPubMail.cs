
using System.Collections.Generic;
using System.Web;
using System.Net.Mail;
using System.Configuration;
using FA_BusEntity;
using System.Data.SqlClient;
using System.Data;
using System;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Runtime.Serialization.Formatters.Binary;
using System.Xml.Serialization;
using System.IO;

namespace FA_DALayer
{
    [Serializable]
    public class ClsPubMail
    {
        string strSMTPServerName = string.Empty;
        public ClsPubMail()
        {
            AppSettingsReader ObjAppSettReader = new AppSettingsReader();
            strSMTPServerName = (string)ObjAppSettReader.GetValue("SMTPServer", typeof(string));
        }
        public void FunSendMail(FA_BusEntity.FAClsPubCommMail ObjComMail)
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
    }
}
