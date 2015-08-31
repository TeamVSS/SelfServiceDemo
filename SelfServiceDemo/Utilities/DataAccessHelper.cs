using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using Oracle.DataAccess.Client;
using SelfServiceDemo.Models;

namespace SelfServiceDemo.Utilities
{
    public static class DataAccessHelper
    {
        private static string CONNECTION_STRING = ConfigurationManager.ConnectionStrings["oracleXE"].ConnectionString;
        
        

        public static User GetUser(string username)
        {
            User user = null;
            if (username != null)
            {
                try
                {
                    using (OracleConnection connection = new OracleConnection(CONNECTION_STRING))
                    {
                        OracleCommand command = new OracleCommand();
                        command.CommandText = "SELECT password,customerId,securityQuestion,securityAnswer,email FROM Users WHERE username LIKE :username";
                        command.Parameters.Add(":username", OracleDbType.NVarchar2).Value = username;
                        command.Connection = connection;
                        connection.Open();
                        OracleDataReader reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            string password = reader["password"].ToString();
                            string customerId = reader["customerId"].ToString();
                            string securityQuestion = reader["securityQuestion"].ToString();
                            string securityAnswer = reader["securityAnswer"].ToString();
                            string email = reader["email"].ToString();
                            user = new User(username, password, customerId, securityQuestion, securityAnswer, email);
                        }
                    }
                }

                catch (Exception e)
                {
                    user = null;
                    Logger.LogException(e);
                }
            }
            return user;
        }
    

        public static bool IsUserExists(User user)
        {
            bool exists = false;
            if(user!= null)
            {
                try
                {
                    using (OracleConnection connection = new OracleConnection(CONNECTION_STRING))
                    {
                        OracleCommand command = new OracleCommand();
                        command.CommandText = "SELECT COUNT(*) FROM Users WHERE username LIKE :username AND password LIKE :password";
                        command.Parameters.Add(":username", OracleDbType.NVarchar2).Value = user.Username;
                        command.Parameters.Add(":password", OracleDbType.NVarchar2).Value = user.Password;
                        command.Connection = connection;
                        connection.Open();
                        int count = Convert.ToInt32(command.ExecuteScalar());
                        if (count == 1)
                            exists= true;
                        else
                            exists= false;
                    }
                }

                catch (Exception e)
                {
                    exists = false;
                    Logger.LogException(e);                    
                }
            }
            return exists;                        
        }


        public static bool IsAvailable(string columnName, string value)
        {
            bool available = false;
            if (!String.IsNullOrWhiteSpace(columnName) && value != null)
            {
                try
                {
                    using (OracleConnection connection = new OracleConnection(CONNECTION_STRING))
                    {
                        OracleCommand command = new OracleCommand();
                        command.CommandText = String.Format("SELECT COUNT(*) FROM Users WHERE {0} LIKE :value",columnName);
                        command.Parameters.Add(":value", OracleDbType.NVarchar2).Value = value;
                        command.Connection = connection;
                        connection.Open();
                        int count = Convert.ToInt32(command.ExecuteScalar());                         
                        if (count==0)
                            available = true;
                        else
                            available = false;
                    }
                }

                catch (Exception e)
                {
                    available = false;
                    Logger.LogException(e);
                }
            }
            return available;
        }

        public static bool IsUserNameAvailable(string username)
        {
            return IsAvailable("username", username);                 
        }

        public static bool IsCustomerIdAvailable(string customerId)
        {
            return IsAvailable("customerId", customerId);
        }

        public static void RegisterUser(User user)
        {
            if (user != null)
            {
                try
                {
                    using (OracleConnection connection = new OracleConnection(CONNECTION_STRING))
                    {
                        OracleCommand command = new OracleCommand();
                        command.CommandText = "INSERT INTO Users VALUES(:username,:password,:customerId,:securityQuestion,:securityAnswer,:email)";
                        command.Parameters.Add(":username", OracleDbType.NVarchar2).Value = user.Username;
                        command.Parameters.Add(":password", OracleDbType.NVarchar2).Value = user.Password;
                        command.Parameters.Add(":customerId", OracleDbType.NVarchar2).Value = user.CustomerId;
                        command.Parameters.Add(":securityQuestion", OracleDbType.NVarchar2).Value = user.SecurityQuestion;
                        command.Parameters.Add(":securityAnswer", OracleDbType.NVarchar2).Value = user.SecurtiyAnswer;
                        command.Parameters.Add(":email", OracleDbType.NVarchar2).Value = user.EmailId;
                        command.Connection = connection;
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }

                catch (Exception e)
                {                    
                    Logger.LogException(e);
                }
            }
        }

        public static void LogPaidBill(string customerId, string paidDate)
        {
            if (!String.IsNullOrWhiteSpace(customerId) && paidDate != null)
            {
                try
                {
                    using (OracleConnection connection = new OracleConnection(CONNECTION_STRING))
                    {
                        OracleCommand command = new OracleCommand();
                        command.CommandText = "INSERT INTO BillPayLog VALUES(:cid,:pdate)";
                        command.Parameters.Add(":cid", OracleDbType.NVarchar2).Value = customerId;
                        command.Parameters.Add(":pdate", OracleDbType.NVarchar2).Value = paidDate;
                        command.Connection = connection;
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }

                catch (Exception e)
                {                    
                    Logger.LogException(e);
                }
            }
        }

        public static bool IsBillPaid(string customerId, string billDate)
        {
            bool paid = false;
            if (!String.IsNullOrWhiteSpace(customerId) && billDate != null)
            {
                try
                {
                    using (OracleConnection connection = new OracleConnection(CONNECTION_STRING))
                    {
                        //string[] monthNames = { "JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC" };
                        //DateTime temp = billDate.ToDateTime();
                        //string day = temp.Day.ToString();
                        //string month = monthNames[temp.Month-1];
                        //string year = temp.Year.ToString();
                        //string date = day + "-" + month + "-" + year;
                        OracleCommand command = new OracleCommand();
                        command.CommandText = "SELECT COUNT(*) FROM BillPayLog WHERE customerId LIKE :cid AND paidDate LIKE :pdate";
                        command.Parameters.Add(":cid", OracleDbType.NVarchar2).Value = customerId;
                        command.Parameters.Add(":pdate", OracleDbType.NVarchar2).Value = billDate;
                        command.Connection = connection;
                        connection.Open();
                        int count = Convert.ToInt32(command.ExecuteScalar());
                        if (count == 1)
                            paid = true;
                        else
                            paid = false;
                    }
                }

                catch (Exception e)
                {
                    paid = false;
                    Logger.LogException(e);
                }
            }
            return paid;
        }




        public static string reportIssue(string cust_id, string rep_name, string rep_desc)
        {
            try
            {
                using (OracleConnection connection = new OracleConnection(CONNECTION_STRING))
                {


                    connection.Open();

                    string query1 = "select max(report_id) from reportrepair";
                    OracleCommand command = new OracleCommand(query1, connection);
                    object value=command.ExecuteScalar();
                    int rep_id = 0;
                    if (value != DBNull.Value && value != null)
                        rep_id = Convert.ToInt32(value);
                    connection.Close();
                    
                    rep_id += 1;
                   
                    string raised_date = DateTime.Now.ToString("dd-MMM-yy");
                    string provision_date = DateTime.Now.AddDays(7).ToString("dd-MMM-yy");
                    connection.Open();
                    string query = "insert into reportrepair values('" + cust_id + "'," + rep_id + ", '" + rep_name + "', '" + rep_desc + "','" + raised_date + "' , 'pending', '" + provision_date + "')";
                    OracleCommand command1 = new OracleCommand(query, connection);

                    int count = command1.ExecuteNonQuery();

                    if (count > 0)
                    {
                        Console.WriteLine("Inserted");
                    }
                    else
                    {
                        Console.WriteLine("Not Inserted");
                    }
                    connection.Close();
                    return rep_id.ToString();
                }
            }
            catch (Exception ex)
            {
                return "";

            }
        }


        public static string retStatus(string custId, string repId)
        {
            try
            {
                using (OracleConnection connection = new OracleConnection(CONNECTION_STRING))
                {
                    connection.Open();
                    string query = "select status from reportrepair where customer_id LIKE :cust and report_id LIKE :rep";

                    OracleCommand command = new OracleCommand(query, connection);
                    command.Parameters.Add(":cust", OracleDbType.NVarchar2).Value = custId;
                    command.Parameters.Add(":rep", OracleDbType.NVarchar2).Value = repId;
                    string status = (string)command.ExecuteScalar();
                    connection.Close();
                    return status;
                }
            }

            catch (Exception ex)
            {

                return null;
            }
        }

        public static DateTime retProvisionDate(string custId, string repId)
        {
            try
            {
                using (OracleConnection connection = new OracleConnection(CONNECTION_STRING))
                {


                    connection.Open();
                    string query = "select provision_date from reportrepair where customer_id LIKE :cust and report_id LIKE :rep";

                    OracleCommand command = new OracleCommand(query, connection);
                    command.Parameters.Add(":cust", OracleDbType.NVarchar2).Value = custId;
                    command.Parameters.Add(":rep", OracleDbType.NVarchar2).Value = repId;
                    DateTime provision_date = Convert.ToDateTime(command.ExecuteScalar());
                    connection.Close();
                    return provision_date;
                }
            }

            catch (Exception ex)
            {

                return DateTime.Now;
            }
        }


        public static void setStatus(string custId, string repId)
        {

            try
            {
                using (OracleConnection connection = new OracleConnection(CONNECTION_STRING))
                {


                    connection.Open();
                    string query = "update reportrepair set status='escalated' where customer_id LIKE :cust and report_id LIKE :rep";

                    OracleCommand command = new OracleCommand(query, connection);
                    command.Parameters.Add(":cust", OracleDbType.NVarchar2).Value = custId;
                    command.Parameters.Add(":rep", OracleDbType.NVarchar2).Value = repId;
                    command.ExecuteNonQuery();
                    connection.Close();
                }

            }

            catch (Exception ex)
            {


            }
        }

        public static List<string> retPendingIssues(string custId)
        {

            using (OracleConnection connection = new OracleConnection(CONNECTION_STRING))
            {

                connection.Open();
                string query = "select report_name from reportrepair where customer_id LIKE :cust and status='pending'";
                OracleCommand command = new OracleCommand(query, connection);
                command.Parameters.Add(":cust", OracleDbType.NVarchar2).Value = custId;
                List<string> listobj = new List<string>();

                OracleDataReader reader = command.ExecuteReader();

                try
                {
                    while (reader.Read())
                    {
                        listobj.Add(reader.GetValue(0).ToString());

                    }
                    connection.Close();
                    return listobj;
                }


                catch (Exception ex)
                {

                    List<string> listobj1 = new List<string>();
                    listobj1.Add("error");
                    return listobj1;
                }
            }
        }


        public static List<string> retEscalatedIssues(string custId)
        {

            using (OracleConnection connection = new OracleConnection(CONNECTION_STRING))
            {

                connection.Open();
                string query = "select report_name from reportrepair where customer_id LIKE :cust and status='escalated'";
                OracleCommand command = new OracleCommand(query, connection);
                command.Parameters.Add(":cust", OracleDbType.NVarchar2).Value = custId;
                List<string> listobj = new List<string>();

                OracleDataReader reader = command.ExecuteReader();

                try
                {
                    while (reader.Read())
                    {
                        listobj.Add(reader.GetValue(0).ToString());

                    }
                    connection.Close();
                    return listobj;
                }


                catch (Exception ex)
                {

                    List<string> listobj1 = new List<string>();
                    listobj1.Add("error");
                    return listobj1;
                }
            }
        }

    }
}