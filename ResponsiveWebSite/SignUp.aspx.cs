using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        if (txtUserName.Text != "" && txtPassword.Text != "" && txtConfirmPassword.Text != "" && txtName.Text != "" && txtEmail.Text != "") 
        {
            if (txtPassword.Text == txtConfirmPassword.Text)
            {
                String CS = ConfigurationManager.ConnectionStrings["MyDataBaseConnectionString1"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("insert into Users values('" + txtUserName.Text + "','" + txtPassword.Text + "','" + txtEmail.Text + "','" + txtName.Text + "')", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.ForeColor = Color.Green;
                    lblMsg.Text = "Registration Successfull!";
                    Response.Redirect("~/SignIn.aspx");
                }
            }
            else
            {
                lblMsg.ForeColor = Color.Red;
                lblMsg.Text = "Passwords do not match!";
            }
        }
        else {
            lblMsg.ForeColor = Color.Red;
            lblMsg.Text = "All fields are mandatory!";
        }
    }
}