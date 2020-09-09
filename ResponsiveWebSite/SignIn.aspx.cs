using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
public partial class SignIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["UNAME"] != null && Request.Cookies["PWD"] != null)
            {
                UserName.Text = Request.Cookies["UNAME"].Value;
                Password.Attributes["value"] = Request.Cookies["PWD"].Value;
                CheckBox1.Checked = true;
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDataBaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand sqlcmd = new SqlCommand("select * from users where Username='" + UserName.Text + "' and Password='" + Password.Text + "'", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcmd);

            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                if (CheckBox1.Checked)
                {
                    Response.Cookies["UNAME"].Value = UserName.Text;
                    Response.Cookies["PWD"].Value = Password.Text;

                    Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(15);
                    Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(15);
                }
                else
                {
                    Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(-1);
                }
                string UType;
                UType = dt.Rows[0][5].ToString().Trim();
                if (UType == "U") {
                    Session["UserName"] = UserName.Text;
                    if (Request.QueryString["rurl"] != null)
                    {
                        if (Request.QueryString["rurl"] == "cart")
                        {
                            Response.Redirect("~/Cart.aspx");
                        }
                    }
                    else
                    {
                        Response.Redirect("~/UserHome.aspx");
                    }
                    
                }
                if (UType == "A")
                {
                    Session["UserName"] = UserName.Text;
                    if (Request.QueryString["rurl"] != null)
                    {
                        if (Request.QueryString["rurl"] == "cart")
                        {
                            Response.Redirect("~/Cart.aspx");
                        }
                    }
                    else
                    {
                        Response.Redirect("~/AdminHome.aspx");
                    }
                    
                }


            }
            else
            {
                lblError.Text = "Invalid user name or password";

            }

        }
    }
}