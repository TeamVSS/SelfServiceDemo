using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SelfServiceDemo.Models;
using SelfServiceDemo.Utilities;
using System.Web.Services;

namespace SelfServiceDemo
{
    public partial class OrderStatus : System.Web.UI.Page
    {
        Profile p;

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
            Response.Cache.SetValidUntilExpires(false);
            Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            

            if (Session["customerId"] != null)
            {
                if (!Page.IsPostBack)
                {
                    //Session["customerId"] = "VZ/1234";//REMOVE
                    string cid = (string)Session["customerId"];
                    p = Profile.GetUserProfile(cid);
                    List<string> orderId = new List<string>();
                    if (p != null)
                    {
                        foreach (OrderWrapper orders in p.Orders)
                        {
                            if (orders.Status != "cancelled")
                            {
                                orderId.Add(orders.Id);
                            }

                        }

                        DropDownList1.DataSource = orderId;
                        DropDownList1.DataBind();
                        if (p.Orders[0].Status != "cancelled")
                        {
                            string firstorder_id = p.Orders[0].Id;
                            DateTime firstorder_date = p.Orders[0].OrderDate;
                            DateTime firstinstal_date = Extensions.ToDateTime(p.Orders[0].InstallationDate.ToString());
                            if (p.Orders[0].Status == "new" || p.Orders[0].Status == "out provision")
                            {
                                ifNew(p.Orders[0], firstinstal_date, firstorder_date);
                            }
                            if (p.Orders[0].Status == "in provision")
                            {
                                ifInProvision(p.Orders[0], firstinstal_date, firstorder_date);
                            }

                            if (p.Orders[0].Status == "completed")
                            {
                                ifCompleted(p.Orders[0], firstinstal_date, firstorder_date);
                            }
                        }
                        //lbl_instal.Text = "Your order is scheduled installation on:";
                        //btnDay.Visible = true;
                        //btnDay.Text = instal_date.Day.ToString();
                        //btnmonth.Visible = true;
                        //btnmonth.Text = instal_date.Month.ToString();
                        //btnyear.Visible = true;
                        //btnyear.Text = instal_date.Year.ToString();
                        //btnChangeDate.Visible = true;
                        //btnCancelOrder.Visible = true;
                        //orderDateid.Text = order_date.ToString();
                        //lbl_esti.Text = "Estimated Time :";
                        //lbltime.Text = "1hr 15 mins";

                        //lblServ.Text = p.ServiceAddress;

                        //lbl_prodinfo.Text = "Included in this order ";
                        //products.DataSource = p.Orders[0].Services;
                        //products.DataBind();
                        else
                        {
                            lbl_instal.Text = "You do not have any order information to view";
                        }
                        string order_id = p.Orders[0].Id;
                        DateTime order_date = p.Orders[0].OrderDate;
                        DateTime instal_date = Extensions.ToDateTime(p.Orders[0].InstallationDate.ToString());
                        lbl_instal.Text = "Your order is scheduled installation on:";
                        btnDay.Visible = true;
                        btnDay.Text = instal_date.Day.ToString();
                        btnmonth.Visible = true;
                        btnmonth.Text = instal_date.Month.ToString();
                        btnyear.Visible = true;
                        btnyear.Text = instal_date.Year.ToString();
                        btnChangeDate.Visible = true;
                        btnCancelOrder.Visible = true;
                        orderDateid.Text =order_date.ToString();
                        lbl_esti.Text = "Estimated Time :";
                        lbltime.Text = "1hr 15 mins";
                        
                        lblServ.Text = p.ServiceAddress;
                     
                        lbl_prodinfo.Text = "Included in this order ";
                        products.DataSource = p.Orders[0].Services;
                        products.DataBind();

                    }
                }

            }
            else
            {
                Response.Redirect("Index.aspx");
            }


        }

        [WebMethod]
        public static void ChangeDueDateStub(string orderId, string selectedDate)
        {
            Profile.ChangeDueDate(orderId, selectedDate);
        }
        public void ifNew(OrderWrapper oid,DateTime instal_date,DateTime order_date)
        {
            lbl_instal.Text = "Your order is scheduled installation on:";
            btnDay.Visible = true;
            btnDay.Text = instal_date.Day.ToString();
            btnmonth.Visible = true;
            btnmonth.Text = instal_date.Month.ToString();
            btnyear.Visible = true;
            btnyear.Text = instal_date.Year.ToString();
            btnChangeDate.Visible = true;
            btnCancelOrder.Visible = true;
            orderDateid.Text = order_date.ToString();
            lbl_esti.Text = "Estimated Time :";
            lbltime.Text = "1hrs 15 mins";

            lblServ.Text = p.ServiceAddress;

            lbl_prodinfo.Text = "Included in this order ";
            products.DataSource = oid.Services;
            products.DataBind();
        }
        public void ifCompleted(OrderWrapper oid, DateTime instal_date, DateTime order_date)
        {
            lbl_instal.Text = "Your order was Successfully completed!";
            lblInstal.Text = "Installed on";
            btnDay.Visible = true;
            btnDay.Text = instal_date.Day.ToString();
            btnmonth.Visible = true;
            btnmonth.Text = instal_date.Month.ToString();
            btnyear.Visible = true;
            btnyear.Text = instal_date.Year.ToString();
            btnChangeDate.Visible = false;
            btnCancelOrder.Visible = false;
            //lbl_esti.Text = "Estimated Time :";
            //lbltime.Text = "1hrs 15 mins";
            orderDateid.Text = order_date.ToString();
            lblServ.Text = p.ServiceAddress;

            lbl_prodinfo.Text = "Included in this order ";
            products.DataSource = oid.Services;
            products.DataBind();
        }
        public void ifInProvision(OrderWrapper oid, DateTime instal_date, DateTime order_date)
        {
            lbl_instal.Text = "Your order is scheduled installation on:";
            btnDay.Visible = true;
            btnDay.Text = instal_date.Day.ToString();
            btnmonth.Visible = true;
            btnmonth.Text = instal_date.Month.ToString();
            btnyear.Visible = true;
            btnyear.Text = instal_date.Year.ToString();
            btnChangeDate.Visible = true;
            btnCancelOrder.Visible = false;
            orderDateid.Text = order_date.ToString();
            lbl_esti.Text = "Estimated Time :";
            lbltime.Text = "1hrs 15 mins";

            lblServ.Text = p.ServiceAddress;

            lbl_prodinfo.Text = "Included in this order ";
            products.DataSource = oid.Services;
            products.DataBind();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cid = (string)Session["customerId"];
            p = Profile.GetUserProfile(cid);
            string orderid = DropDownList1.SelectedItem.Value;
            foreach (OrderWrapper oid in p.Orders)
            {
                if (oid.Id == orderid)
                {
                    string status = oid.Status;
                    DateTime order_date = oid.OrderDate;
                    DateTime instal_date = oid.InstallationDate;
                    if (status == "new" || status == "out provision")
                    {
                        ifNew(oid,instal_date,order_date);
                    }
                    if (status == "in provision")
                    {
                        ifInProvision(oid, instal_date, order_date);
                     }
                    if (status == "completed")
                    {
                        ifCompleted(oid, instal_date, order_date);
                        lbl_instal.Text = "Your order is scheduled installation on:";
                        btnDay.Visible = true;
                        btnDay.Text = instal_date.Day.ToString();
                        btnmonth.Visible = true;
                        btnmonth.Text = instal_date.Month.ToString();
                        btnyear.Visible = true;
                        btnyear.Text = instal_date.Year.ToString();
                        btnChangeDate.Visible = true;
                        btnCancelOrder.Visible = true;
                        orderDateid.Text = order_date.ToString();
                        lbl_esti.Text = "Estimated Time :";
                        lbltime.Text = "1hrs 15 mins";
                       
                        lblServ.Text=p.ServiceAddress;
                       
                        lbl_prodinfo.Text = "Included in this order ";
                        products.DataSource = oid.Services;
                        products.DataBind();
                    }
                    if (status == "in provision")
                    {
                        lbl_instal.Text = "Your order is scheduled installation on:";
                        btnDay.Visible = true;
                        btnDay.Text = instal_date.Day.ToString();
                        btnmonth.Visible = true;
                        btnmonth.Text = instal_date.Month.ToString();
                        btnyear.Visible = true;
                        btnyear.Text = instal_date.Year.ToString();
                        btnChangeDate.Visible = true;
                        btnCancelOrder.Visible = false;
                        orderDateid.Text = order_date.ToString();
                        lbl_esti.Text = "Estimated Time :";
                        lbltime.Text = "1hrs 15 mins";
                        
                        lblServ.Text = p.ServiceAddress;
                       
                        lbl_prodinfo.Text = "Included in this order ";
                        products.DataSource = oid.Services;
                        products.DataBind();
                    }
                    if (status == "Completed")
                    {
                        lbl_instal.Text = "Your order was Successfully completed!";
                        lblInstal.Text = "Installed on";
                        btnDay.Visible = true;
                        btnDay.Text = instal_date.Day.ToString();
                        btnmonth.Visible = true;
                        btnmonth.Text = instal_date.Month.ToString();
                        btnyear.Visible = true;
                        btnyear.Text = instal_date.Year.ToString();
                        btnChangeDate.Visible = false;
                        btnCancelOrder.Visible = false;
                        //lbl_esti.Text = "Estimated Time :";
                        //lbltime.Text = "1hrs 15 mins";
                        orderDateid.Text = order_date.ToString();
                        lblServ.Text = p.ServiceAddress;
                        
                        lbl_prodinfo.Text = "Included in this order ";
                        products.DataSource = oid.Services;
                        products.DataBind();
                    }
                }
                
            }
        }

        protected void btnCancelOrder_Click1(object sender, EventArgs e)
        {
            int i = Profile.CancelOrder(DropDownList1.SelectedItem.Value);  
            //int i = 1;          
            if (i == 1)
            {
                ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "redirect", "alertCancel();", true);
                              
            }
            else
            {

                Response.Clear();
                Response.Write("The order dint get cancelled!Please Try again later");
                Response.End();
                
            }

        }
    }
}