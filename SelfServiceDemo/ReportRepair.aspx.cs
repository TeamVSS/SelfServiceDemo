using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SelfServiceDemo.Models;

namespace SelfServiceDemo
{
    public partial class ReportRepair : System.Web.UI.Page
    {
        Report rp = new Report();


        string CustomerId;

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
            Response.Cache.SetValidUntilExpires(false);
            Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();


            if (Session["customerId"] != null)
            {
                CustomerId = (string)Session["customerId"];
                GridView1.DataSource = rp.retPendingIssues(CustomerId);
                GridView1.DataBind();

                GridView2.DataSource = rp.retEscalatedIssues(CustomerId);
                GridView2.DataBind();

                Label11.Enabled = false;
                Label12.Enabled = false;
                TextIssue.Enabled = false;
                TextDesc.Enabled = false;
                BtnRaiseTkt.Enabled = false;


                Label15.Visible = false;
                Label24.Visible = false;
                Label23.Visible = false;
                LblRefId.Visible = false;
                LblProvisionDate.Visible = false;



            }
            else
                Response.Redirect("Index.aspx");


        }



        protected void BtnRaiseTkt_Click1(object sender, EventArgs e)
        {



            if (DropDownList1.SelectedValue.ToString() == "Others")
            {
                if (String.IsNullOrEmpty(TextIssue.Text))
                {
                    DropDownList1.SelectedIndex = 0;
                }
                else
                    LblRefId.Text=rp.reportIssue(CustomerId, TextIssue.Text, TextDesc.Text);

            }



            if (!String.IsNullOrEmpty(TextIssue.Text))
            {



                Label15.Visible = true;
                Label23.Visible = true;

                Label24.Visible = true;
                LblRefId.Visible = true;
                LblProvisionDate.Visible = true;
                LblRefId.Text = rp.reportIssue(CustomerId, DropDownList1.SelectedValue.ToString(), DropDownList1.SelectedValue.ToString());

                DropDownList1.SelectedIndex = 0;




                TextIssue.Text = "";
                TextDesc.Text = "";
                
                LblProvisionDate.Text = DateTime.Now.AddDays(7).ToString("dd-MMM-yy");
            }
            if(TextIssue.Enabled==false)
            {
                Label15.Visible = true;
                Label23.Visible = true;

                Label24.Visible = true;
                LblRefId.Visible = true;
                LblProvisionDate.Visible = true;

                LblRefId.Text = rp.reportIssue(CustomerId, DropDownList1.SelectedValue.ToString(), DropDownList1.SelectedValue.ToString());
                DropDownList1.SelectedIndex = 0;




                TextIssue.Text = "";
                TextDesc.Text = "";
                
                LblProvisionDate.Text = DateTime.Now.AddDays(7).ToString("dd-MMM-yy");

            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {


            //BtnRaiseTkt.Enabled = true;
            if (DropDownList1.SelectedValue.ToString() == "Others")
            {
                Label11.Enabled = true;
                Label12.Enabled = true;
                TextIssue.Enabled = true;
                TextDesc.Enabled = true;
                BtnRaiseTkt.Enabled = true;

            }
            else if (DropDownList1.SelectedValue.ToString() == "Choose an issue")
            {
                Label11.Enabled = false;
                Label12.Enabled = false;
                TextIssue.Enabled = false;
                TextDesc.Enabled = false;
                BtnRaiseTkt.Enabled = false;

            }
            else
                BtnRaiseTkt.Enabled = true;

            //else
            //{
            //    string desc = "";
            //    if (DropDownList1.SelectedValue.ToString() == "Resume Connectivity")
            //        desc = "The pending bill was paid but still the connection is not restored";

            //    if (DropDownList1.SelectedValue.ToString() == "Change service address")
            //        desc = "The service address has been updated in the profile ";

            //    BtnRaiseTkt.Enabled = true;
            //    LblRefId.Text= rp.reportIssue(CustomerId, DropDownList1.SelectedValue.ToString(), desc);

            //}
        }



        protected void BtnEscalateTkt_Click(object sender, EventArgs e)
        {




            Label15.Visible = false;
            Label24.Visible = false;
            Label23.Visible = false;
            LblRefId.Visible = false;
            LblProvisionDate.Visible = false;


            string status = rp.retStatus(CustomerId, TxtEscalate.Text);


            if (status == "completed")
            {
                TxtEscalate.Text = "";
                Page.ClientScript.RegisterStartupScript(GetType(), "Scripts", "<script>alert('The issue was already resolved. Raise a ticket for further assistance');</script>");
            }

            else if (status == "escalated")
            {
                TxtEscalate.Text = "";
                Page.ClientScript.RegisterStartupScript(GetType(), "Scripts", "<script>alert('The issue was already escalated');</script>");
            }
            else if (status == "pending")
            {


                DateTime provision_dt = rp.retProvisionDate(CustomerId, TxtEscalate.Text);

                if (DateTime.Now > provision_dt)
                {
                    rp.setStatus(CustomerId, TxtEscalate.Text);
                    Page.ClientScript.RegisterStartupScript(GetType(), "Scripts", "<script>alert('The issue is escalated.');</script>");
                }
                else
                    Page.ClientScript.RegisterStartupScript(GetType(), "Scripts", "<script>alert('The provisioning date is due.');</script>");

                TxtEscalate.Text = "";
            }
            else
            {
                TxtEscalate.Text = "";
                Page.ClientScript.RegisterStartupScript(GetType(), "Scripts", "<script>alert('Invalid Repair Ticket ID');</script>");

            }


        }
    }
}