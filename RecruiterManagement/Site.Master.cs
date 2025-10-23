using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecruiterManagement
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["loggedIn"] = true;
            Session["role"] = "admin";
            Session["email"] = "ayush@gmail.com";
            Session["name"] = "Aayush Pathak";
            if (Session["loggedIn"] == null)
            {
                Response.Redirect("/Login");
            }

        }

    }
}