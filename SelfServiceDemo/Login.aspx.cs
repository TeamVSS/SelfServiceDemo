using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SelfServiceDemo.Models;

namespace SelfServiceDemo
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
            Response.Cache.SetValidUntilExpires(false);
            Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            if (Request.Form.Count != 0 && Request.Form["username"] != null && Request.Form["password"] != null)
            {
                User user = new Models.User(Request.Form["username"], Request.Form["password"]);
                if (Models.User.IsRegistered(user))
                {
                    user.LoadUserDetails();
                    Session.Add("customerId", user.CustomerId);
                    Response.Redirect("OrderStatus.aspx");
                }
                else
                {
                    Response.Redirect("Index.aspx?tab=login&error=true");
                }
            }
            else
                Response.Redirect("Index.aspx");

        }
    }
}