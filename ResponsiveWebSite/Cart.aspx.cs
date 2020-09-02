using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCartProducts();
        }
    }

    private void BindCartProducts()
    {
        if (Request.Cookies["CartPID"] != null)
        {
            string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
            string[] CookieDataArray = CookieData.Split(',');
            if (CookieDataArray.Length > 0)
            {
                h5NoItems.InnerText = "My cart ("+ CookieDataArray.Length+" Items)";
                DataTable dt = new DataTable();
                for (int i = 0; i < CookieDataArray.Length; i++)
                {
                    string PID = CookieDataArray[i].ToString().Split('-')[0];
                    string SizeID = CookieDataArray[i].ToString().Split('-')[1];

                    String CS = ConfigurationManager.ConnectionStrings["MyDataBaseConnectionString1"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        using (SqlCommand cmd = new SqlCommand("select A.*,dbo.getSizeName("+SizeID+") as SizeNameP,"+SizeID+" as SizeIDD,SizeData.Name," +
                            "SizeData.Extension  from tblProducts A cross apply(select top 1 B.Name,Extension from tblProductImages B where B.PID=A.PID)" +
                            " SizeData where A.PID='" + PID + "'", con))
                        {
                            cmd.CommandType = CommandType.Text;
                            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                            {
                                
                                sda.Fill(dt);
                               
                            }
                        }
                    }
                }
                rptrCartProducts.DataSource = dt;
                rptrCartProducts.DataBind();
                divPriceDetails.Visible = true;
            }
            else
            {
                h5NoItems.InnerText = "Your Shopping Cart is Empty";
                divPriceDetails.Visible = false;
            }
        }
        else
        {
            h5NoItems.InnerText = "Your Shopping Cart is Empty";
            divPriceDetails.Visible = false;
        }
    }

    protected void btnRemoveItem_Click(object sender, EventArgs e)
    {

    }

    protected void btnBuyNow_Click(object sender, EventArgs e)
    {

    }
}