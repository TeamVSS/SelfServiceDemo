using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SelfServiceDemo.Models;
using SelfServiceDemo.Utilities;

namespace SelfServiceDemo
{
    public partial class BillPay : System.Web.UI.Page
    {
        Bill customerBill;
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
            Response.Cache.SetValidUntilExpires(false);
            Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();


            if (Session["customerId"] != null)
            {

                customerBill = Bill.GetUserBill((string)Session["customerId"]);

                if (customerBill != null)
                {
                    if (!IsPostBack)
                        Session.Add("customerBill", customerBill);
                    Bill temp = (Bill)Session["customerBill"];

                    //Bill temp = Bill.GetUserBill();
                    lblPhone.Text = temp.currentBill.PrimaryPhone;
                    lblAccount.Text = temp.currentBill.AccountNumber;
                    lblDate.Text = temp.currentBill.BillDate;

                    lblPreviousBalance.Text = temp.currentBill.Account_Summary.Previous_Period.PreviousBalance;
                    lblPaymentReceived.Text = temp.currentBill.Account_Summary.Previous_Period.PaymentReceived;
                    lblBalanceForward.Text = temp.currentBill.Account_Summary.Previous_Period.BalanceForward;
                    //foreach (var service in temp.Account_Summary.CurrentCharges.Services)
                    //{
                    //    ServicesName.Text += service.name+" ";
                    //}
                    lblFIOS.Text = temp.currentBill.Account_Summary.Current_Charges.Subtotal.ToString();

                    //foreach (var service in temp.Account_Summary.AdditionalCharges.AdditionalServices)
                    //{
                    //    AdditionalServivesName.Text  += service.name + " ";
                    //}

                    lblAddService.Text = temp.currentBill.Account_Summary.Additional_Charges.Subtotal;
                    lblFees.Text = temp.currentBill.taxes;
                    lblTotalDue1.Text = temp.currentBill.totalAmount;
                    if (DataAccessHelper.IsBillPaid((string)Session["customerId"], temp.currentBill.BillDate))
                    {
                        Pay.Visible = false;
                        LabelPay.Visible = true;
                        LabelPay.Text = "Thank you for online payment";
                    }
                    else
                    {
                        Pay.Visible = true;
                    }
                }
                else
                {
                    Response.Clear();
                    Response.Write("No Bill Found");
                    Response.End();
                }
                    
            }
            else
            {
               
                Response.Redirect("Index.aspx");
                
            }
               
        }


        protected void Pay_Click(object sender, EventArgs e)
        {
            if (ServiceJsonHelper.PayBill((string)Session["customerId"], ((Bill)Session["customerBill"]).currentBill.totalAmount, ((Bill)Session["customerBill"]).currentBill.BillDate) == 1)
            {
                Pay.Visible = false;
                LabelPay.Visible = true;
                LabelPay.Text = "Thank you for online payment";
            }
        }

        protected void LabelPay_Click(object sender, EventArgs e)
        {
            Response.Redirect("BillView.aspx");
        }
    }
}