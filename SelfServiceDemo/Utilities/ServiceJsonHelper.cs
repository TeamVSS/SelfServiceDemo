using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.IO;
using SelfServiceDemo.Models;
using System.Net;

namespace SelfServiceDemo.Utilities
{
    public class ServiceJsonHelper
    {
        private static string PROFILE_PULL_URL = "http://192.168.1.19:8080/OrderManagement/rest/om/profilePull";

        private static string CHANGE_DUE_DATE_URL = "http://192.168.1.19:8080/OrderManagement/rest/om/changeDueDate";

        private static string CANCEL_ORDER_URL = "http://192.168.1.19:8080/OrderManagement/rest/om/cancelOrder";

        private static string BILL_PULL_URL = "http://192.168.1.42:8080/BillingSystem/rest/selfservice?accountNumber=";

        private static string BILL_PAY_URL = "http://192.168.1.42:8080/BillingSystem/rest/paymentselfservice?accountNumber=";

        public static Profile PullProfile(string customerId)
        {
            Profile customProfile = null;
            //string profileJson = GetJsonFromUrl(String.Format(@"{0}/{1}", PROFILE_PULL_URL, customerId));
            string profileJson = File.ReadAllText(@"F:\profile.json");//REMOVE
            if(!String.IsNullOrWhiteSpace(profileJson) && profileJson!="null")
            {
                ProfilePull fullProfile = GetObjectFromJson<ProfilePull>(profileJson);
                customProfile = fullProfile.GetCustomProfile();
            }
            
            return customProfile;
        }

        public static int ChangeDueDate(string orderId, string newDate)
        {
            try
            {
                using (WebClient client = new WebClient())
                {
                    string response = GetJsonFromUrl(String.Format(@"{0}/{1}&{2}", CHANGE_DUE_DATE_URL, orderId,newDate));
                    if (response == "true")
                        return 1;
                    else
                        return 0;
                }
            }
            catch (Exception e)
            {
                return 0;
            }

        }

        public static int CancelOrder(string orderId)
        {
            try
            {
                    string response = GetJsonFromUrl(String.Format(@"{0}/{1}", CANCEL_ORDER_URL, orderId));
                    if (response == "true")
                        return 1;
                    else
                        return 0;
                
            }
            catch(Exception e)
            {
                return 0;
            }
            
        }

        public static Bill GetBill(string customerId)
        {
            Bill bill = null;
            //string billJson = GetJsonFromUrl(BILL_PULL_URL+customerId);
            string billJson = File.ReadAllText("F:\\bill.json");//REMOVE
            if (!String.IsNullOrWhiteSpace(billJson) && billJson!="No Bill Found")
            {
                bill = GetObjectFromJson<Bill>(billJson);
            }

            return bill;
        }

        public static int PayBill(string customerId, string amountPaid, string billDate)
        {
            try
            {
            //    string[] monthNames = { "JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC" };
            //    DateTime today= DateTime.Now.Date;
            //    string day = today.Day.ToString();
            //    string month = monthNames[today.Month-1];
            //    string year = today.Year.ToString();
            //    string date = day+"-"+month+"-"+year;
                //string billJson = GetJsonFromUrl(String.Format("{0}{1}&amount={2}&paymentdate={3}",BILL_PAY_URL,customerId,amountPaid,billDate));
                string billJson = File.ReadAllText("F:\\bill.json");//REMOVE
                if (!String.IsNullOrWhiteSpace(billJson))
                {
                    DataAccessHelper.LogPaidBill(customerId, billDate);
                    return 1;
                }
                else
                    return 0;
            }
            catch (Exception e)
            {
                return 0;
            }
        }        

        public static T GetObjectFromJson<T>(string json)
        {
            JavaScriptSerializer convertor = new JavaScriptSerializer();
            return convertor.Deserialize<T>(json);
        }

        public static string GetJsonFromUrl(string url)
        {
            try
            {
                using (WebClient client = new WebClient())
                {
                    return client.DownloadString(url);
                }
            }
            catch (Exception e)
            {
                return null;
            }
        }

    }
}