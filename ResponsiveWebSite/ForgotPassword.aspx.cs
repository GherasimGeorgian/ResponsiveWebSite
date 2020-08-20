using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Net.Mail;
using System.Net;
public partial class ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btmPassRec_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDataBaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("select * from users where Email='"+txtEmail.Text+"'",con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                String MyGUID = Guid.NewGuid().ToString();
                int UId = Convert.ToInt32(dt.Rows[0][0]);
                SqlCommand cmd1 = new SqlCommand("insert into ForgotPassRequests values('" + MyGUID + "','" + UId + "',getdate())", con);
                cmd1.ExecuteNonQuery();
                //send email
                String ToEmailAddress = dt.Rows[0][3].ToString();
                String UserName = dt.Rows[0][1].ToString();
                String EmailBody = "Hi " + UserName + ",<br/><br/> Click the link below to reset your password <br/> <br/> http://localhost:51637/RecoverPassword.aspx?UId=" + MyGUID;
                MailMessage PassRecMail = new MailMessage("gaois.gaos@gmail.com", ToEmailAddress);
                PassRecMail.Body = EmailBody;
                PassRecMail.IsBodyHtml = true;
                PassRecMail.Subject = "Reset Password";

                SmtpClient SMTP = new SmtpClient("smtp.gmail.com",587);
                SMTP.Credentials = new NetworkCredential()
                {
                    UserName = "gaois.gaos@gmail.com",
                    Password = "mypassword"
                };
                SMTP.EnableSsl = true;
                SMTP.Send(PassRecMail);

                lblPassRec.Text = "Check your email to reset your password";
                lblPassRec.ForeColor = Color.Green;
            }
            else
            {
                lblPassRec.Text = "Opss this email DOES NOT exist in our database !";
                lblPassRec.ForeColor = Color.Red;
            }
        }
    }
}