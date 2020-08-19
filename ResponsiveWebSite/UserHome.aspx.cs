using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"]!= null) {
            lblSuccess.Text = "Login Success, Welcome '"+Session["UserName"].ToString()+"'";
        }
        else {
            Response.Redirect("~/SignIn.aspx");
        }
    }

    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        Session["UserName"] = null;
        Response.Redirect("~/Default.aspx");
    }
}