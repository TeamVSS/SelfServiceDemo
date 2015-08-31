using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SelfServiceDemo.Utilities;

namespace SelfServiceDemo.Models
{
    public class Bill
    {
        public Currentbill currentBill { get; set; }
        public P1 P1 { get; set; }
        public P2 P2 { get; set; }
        public static Bill GetUserBill(string customerId)
        {
            return ServiceJsonHelper.GetBill(customerId);
        }

        public static bool IsBillPaid(string customerId, string date)
        {
            return DataAccessHelper.IsBillPaid(customerId, date);
        }
    }

    public class Currentbill
    {
        public string Name { get; set; }
        public string PrimaryPhone { get; set; }
        public string Address { get; set; }
        public string AccountNumber { get; set; }
        public string BillDate { get; set; }
        public Account_Summary Account_Summary { get; set; }
        public string taxes { get; set; }
        public string totalAmount { get; set; }
    }

    public class Account_Summary
    {
        public Previous_Period Previous_Period { get; set; }
        public Current_Charges Current_Charges { get; set; }
        public Additional_Charges Additional_Charges { get; set; }
    }

    public class Previous_Period
    {
        public string PreviousBalance { get; set; }
        public string PaymentReceived { get; set; }
        public string BalanceForward { get; set; }
    }

    public class Current_Charges
    {
        public ServiceCB[] Services { get; set; }
        public float Subtotal { get; set; }
    }

    public class ServiceCB
    {
        public string name { get; set; }
        public float price { get; set; }
    }

    public class Additional_Charges
    {
        public Additional_Services[] Additional_Services { get; set; }
        public string Subtotal { get; set; }
    }

    public class Additional_Services
    {
        public string name { get; set; }
        public float price { get; set; }
    }

    public class P1
    {
        public string Name { get; set; }
        public string PrimaryPhone { get; set; }
        public string Address { get; set; }
        public string AccountNumber { get; set; }
        public string BillDate { get; set; }
        public Account_Summary1 Account_Summary { get; set; }
        public string taxes { get; set; }
        public string totalAmount { get; set; }
    }

    public class Account_Summary1
    {
        public Previous_Period1 Previous_Period { get; set; }
        public Current_Charges1 Current_Charges { get; set; }
        public Additional_Charges1 Additional_Charges { get; set; }
    }

    public class Previous_Period1
    {
        public string PreviousBalance { get; set; }
        public string PaymentReceived { get; set; }
        public string BalanceForward { get; set; }
    }

    public class Current_Charges1
    {
        public ServiceP1[] Services { get; set; }
        public float Subtotal { get; set; }
    }

    public class ServiceP1
    {
        public string name { get; set; }
        public float price { get; set; }
    }

    public class Additional_Charges1
    {
        public Additional_Services1[] Additional_Services { get; set; }
        public string Subtotal { get; set; }
    }

    public class Additional_Services1
    {
        public string name { get; set; }
        public float price { get; set; }
    }

    public class P2
    {
        public string Name { get; set; }
        public string PrimaryPhone { get; set; }
        public string Address { get; set; }
        public string AccountNumber { get; set; }
        public string BillDate { get; set; }
        public Account_Summary2 Account_Summary { get; set; }
        public string taxes { get; set; }
        public string totalAmount { get; set; }
    }

    public class Account_Summary2
    {
        public Previous_Period2 Previous_Period { get; set; }
        public Current_Charges2 Current_Charges { get; set; }
        public Additional_Charges2 Additional_Charges { get; set; }
    }

    public class Previous_Period2
    {
        public string PreviousBalance { get; set; }
        public string PaymentReceived { get; set; }
        public string BalanceForward { get; set; }
    }

    public class Current_Charges2
    {
        public ServiceP2[] Services { get; set; }
        public float Subtotal { get; set; }
    }

    public class ServiceP2
    {
        public string name { get; set; }
        public float price { get; set; }
    }

    public class Additional_Charges2
    {
        public Additional_Services2[] Additional_Services { get; set; }
        public string Subtotal { get; set; }
    }

    public class Additional_Services2
    {
        public string name { get; set; }
        public float price { get; set; }
    }
}