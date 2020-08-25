using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddGender : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGenderRptr();
        }
    }

    private void BindGenderRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDataBaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblGender", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtGender = new DataTable();
                    sda.Fill(dtGender);
                    rptrGender.DataSource = dtGender;
                    rptrGender.DataBind();
                }
            }
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDataBaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("insert into tblGender values('" + txtGenderName.Text + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            txtGenderName.Text = String.Empty;
        }
        BindGenderRptr();
    }
}