using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RecoverPassword : System.Web.UI.Page
{
    String CS = ConfigurationManager.ConnectionStrings["MyDataBaseConnectionString1"].ConnectionString;
    String GUIDvalue;
    DataTable dt = new DataTable();
    int UId;
    protected void Page_Load(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(CS)) {
            GUIDvalue = Request.QueryString["UId"];
            if (GUIDvalue != null)
            {
                SqlCommand cmd = new SqlCommand("select * from ForgotPassRequests where id = '" + GUIDvalue + "'", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    UId = Convert.ToInt32(dt.Rows[0][1]);
                }
                else
                {
                    lblMsg.Text = "Your password reset link  Expired or Invalid !";
                    lblMsg.ForeColor = Color.Red;
                }
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }
        if (!IsPostBack) {
            if (dt.Rows.Count != 0)
            {
                txtNewPass.Visible = true;
                txtConfirmPass.Visible = true;
                lblPassword.Visible = true;
                lblReTypePass.Visible = true;
                btnRecPass.Visible = true;
            }
            else
            {
                lblMsg.Text = "Your password reset link  Expired or Invalid !";
                lblMsg.ForeColor = Color.Red;
                Response.Redirect("~/Default.aspx");
            }
        }
    }

    protected void btnRecPass_Click(object sender, EventArgs e)
    {
        if (txtNewPass.Text != "" && txtConfirmPass.Text != "" && txtNewPass.Text == txtConfirmPass.Text)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("update users set Password = '" + txtNewPass.Text + "' where UId = '" + UId + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                SqlCommand cmd2 = new SqlCommand("delete from ForgotPassRequests where UId = '" + UId + "'", con);
                cmd2.ExecuteNonQuery();
                Response.Redirect("~/SignIn.aspx");
            }
        }
    }
}