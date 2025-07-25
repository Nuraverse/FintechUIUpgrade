using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace CRMMobile.Server.Infrastructure.Services
{
    public class SMSNotificationService
    {
        public void SendSMS(List<string> MobileNumber, string message)
        {
            try
            {

                string userName = System.Configuration.ConfigurationManager.AppSettings["SMSUserName"].ToString();
                string password = System.Configuration.ConfigurationManager.AppSettings["SMSPassword"].ToString();
                string addressfrom = System.Configuration.ConfigurationManager.AppSettings["SMSAddressFrom"].ToString();

                //string msgText = "Hi Massi";

                //string no1 = "96892809844";Massi

                //string no1 = "96892809844";

                // string no1 = "92809844";

                //string no1 = "96898906907"; Raja


                foreach (var mobileno in MobileNumber)
                {
                    string URL = "http://globalapi.myvfirst.com/psms/servlet/psms.Eservice2?data=<?xml version='1.0' encoding='ISO-8859-1'?><!DOCTYPE MESSAGE SYSTEM 'http://127.0.0.1/psms/dtd/message.dtd'><MESSAGE><USER USERNAME='" + userName + "' PASSWORD='" + password + "' /><SMS UDH='0' CODING='1' TEXT='" + message + "' PROPERTY='0' ID='1'><ADDRESS FROM='" + addressfrom + "' TO='" + mobileno + "' SEQ='1' TAG='some customer end random data' /></SMS></MESSAGE>&action=send";

                    WebRequest myWebRequest = WebRequest.Create(URL);
                    myWebRequest.ContentType = "text/xml; encoding=utf-8";
                    //myWebRequest.Proxy = GetProxy();
                    WebResponse myWebResponse = myWebRequest.GetResponse();
                    Stream ReceiveStream = myWebResponse.GetResponseStream();
                    Encoding encode = System.Text.Encoding.GetEncoding("utf-8");
                    StreamReader readStream = new StreamReader(ReceiveStream, encode);
                    string strResponse = readStream.ReadToEnd();

                }
            }
            catch(Exception ex)
            {

            }
        }
        public void SendOTP(string MobileNumber, string otp)
        {

            try
            {

                string userName = System.Configuration.ConfigurationManager.AppSettings["SMSUserName"].ToString();
                string password = System.Configuration.ConfigurationManager.AppSettings["SMSPassword"].ToString();
                string addressfrom = System.Configuration.ConfigurationManager.AppSettings["SMSAddressFrom"].ToString();                

               
                string URL = "http://globalapi.myvaluefirst.com/psms/servlet/psms.Eservice2?data=<?xml version='1.0' encoding='ISO-8859-1'?><!DOCTYPE MESSAGE SYSTEM 'http://127.0.0.1/psms/dtd/message.dtd'><MESSAGE><USER USERNAME='" + userName + "' PASSWORD='" + password + "' /><SMS UDH='0' CODING='1' TEXT='OTP to login MFC account : " + otp + "' PROPERTY='0' ID='1'><ADDRESS FROM='" + addressfrom + "' TO='" + MobileNumber + "' SEQ='1' TAG='some customer end random data' /></SMS></MESSAGE>&action=send";

                WebRequest myWebRequest = WebRequest.Create(URL);
                myWebRequest.ContentType = "text/xml; encoding=utf-8";
                //myWebRequest.Proxy = GetProxy();
                WebResponse myWebResponse = myWebRequest.GetResponse();
                Stream ReceiveStream = myWebResponse.GetResponseStream();
                Encoding encode = System.Text.Encoding.GetEncoding("utf-8");
                StreamReader readStream = new StreamReader(ReceiveStream, encode);
                string strResponse = readStream.ReadToEnd();

               
            }
            catch (Exception ex)
            {

            }

        }
    }
}
