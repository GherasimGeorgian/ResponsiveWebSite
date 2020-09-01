using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindCartNumber();
        if (Session["UserName"] != null)
        {
            btnSignUp.Visible = false;
            btnSignIn.Visible = false;
            btnSignOut.Visible = true;
        }
        else
        {
            btnSignUp.Visible = true;
            btnSignIn.Visible = true;
            btnSignOut.Visible = false;
        }
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

    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        Session["UserName"] = null;
        Response.Redirect("~/Default.aspx");
    }
}