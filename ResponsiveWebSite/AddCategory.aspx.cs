﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCategoriesRptr();
        }
    }
    private void BindCategoriesRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDataBaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblCategories", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtCategories = new DataTable();
                    sda.Fill(dtCategories);
                    rptrCategory.DataSource = dtCategories;
                    rptrCategory.DataBind();
                }
            }
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDataBaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("insert into tblCategories values('" + txtCatName.Text + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            txtCatName.Text = String.Empty;
        }
        BindCategoriesRptr();
    }
}