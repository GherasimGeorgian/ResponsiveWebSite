using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddSubCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindMainCategory();
            BindSubCatRptr();
        }
    }

    private void BindSubCatRptr()
    {

        String CS = ConfigurationManager.ConnectionStrings["MyDataBaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select A.*,B.* from tblSubCategories A inner join tblCategories B on B.CatID=A.MainCatID", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtSubCategories = new DataTable();
                    sda.Fill(dtSubCategories);
                    rptrSubCategory.DataSource = dtSubCategories;
                    rptrSubCategory.DataBind();
                }
            }
        }
    }

    private void BindMainCategory()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDataBaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand sqlcmd = new SqlCommand("select * from tblCategories", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcmd);

            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlCategory.DataSource = dt;
                ddlCategory.DataTextField = "CatName";
                ddlCategory.DataValueField = "CatID";
                ddlCategory.DataBind();
                ddlCategory.Items.Insert(0, new ListItem("-Select-", "0")); 
            }
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDataBaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("insert into tblSubCategories values('" + txtSubCatName.Text + "','"+ddlCategory.SelectedItem.Value+"')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            txtSubCatName.Text = String.Empty;
            ddlCategory.ClearSelection();
            ddlCategory.Items.FindByValue("0").Selected = true;
        }
        BindSubCatRptr();
    }
}