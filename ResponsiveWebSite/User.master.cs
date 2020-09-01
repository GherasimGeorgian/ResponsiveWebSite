using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindCartNumber();
        if (Session["UserName"] != null)
        {
            btnAdminLogout.Visible = true;
            btnSignIn.Visible = false;
        }
        else
        {
            btnAdminLogout.Visible = false;
            btnSignIn.Visible = true;
        }
    }

    protected void btnAdminLogout_Click(object sender, EventArgs e)
    {
        Session["UserName"] = null;
        Response.Redirect("~/Default.aspx");
    }

    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/SignIn.aspx");
    }
    private void BindCartNumber()
    {

        if (Request.Cookies["CartPID"] != null)
        {
            string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
            string[] ProductArray = CookiePID.Split(',');
            int productCount = ProductArray.Length;
            pcount.InnerText = productCount.ToString();
        }
        else
        {
            pcount.InnerText = 0.ToString();
        }
    }
}
