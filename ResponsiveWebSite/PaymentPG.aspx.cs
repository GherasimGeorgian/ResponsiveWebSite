using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PayPal.Api;
using paytm;

public partial class PaymentPG : System.Web.UI.Page
{
    private PayPal.Api.Payment payment;
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {
            if (!IsPostBack) {
                BindPriceData();
            }
        }
        else
        {
            Response.Redirect("~/SignIn.aspx");
        }
        
    }
  
    public void PaymentWithPaypal(string Cancel = null)
    {
        APIContext apiContext = PaypalConfiguration.GetAPIContext();
        ////try
        ////{
        //A resource representing a Payer that funds a payment Payment Method as paypal  
        //Payer Id will be returned when payment proceeds or click to pay  
        string payerId = Request.Params["PayerID"];
        try
        {

            
            if (string.IsNullOrEmpty(payerId))
            {
                string baseUrl = Request.Url.Scheme + "://" + Request.Url.Authority +
                    "/PaymentPG?";
                var Guid = Convert.ToString((new Random()).Next(1000000000));
                var createPayment = CreatePayment(apiContext, baseUrl + "guid=" + Guid);

                var links = createPayment.links.GetEnumerator();
                string paypalRedirectURL = null;
                while (links.MoveNext()) {
                    Links lnk = links.Current;
                    if (lnk.rel.ToLower().Trim().Equals("approval_url")) {
                        paypalRedirectURL = lnk.href;
                        HttpContext.Current.Response.Redirect(paypalRedirectURL);
                    }
                }
                
            }
            else{
                var guid = Request.Params["guid"];
                var executePayment = ExecutePayment(apiContext, payerId, Session[guid] as string);

                if (executePayment.ToString().ToLower()!= "approved") {
                    Response.Redirect("~/FailureView.aspx");
                }
             }
        }
        catch (PayPal.PaymentsException ex)
        {
            Response.Redirect("~/FailurePayment.aspx");
        }
        Response.Redirect("~/SuccessPayment.aspx");
    }

    private object ExecutePayment(APIContext apicontext, string payerId, string PaymentId)
    {
        var paymentExecution = new PaymentExecution() { payer_id = payerId };
        payment = new Payment() { id = PaymentId };
        return payment.Execute(apicontext, paymentExecution);
    }

    private Payment CreatePayment(APIContext apicontext, string redirectUrl)
    {
       // Int64 Total = 0;
        var ItemList = new ItemList() { items = new List<Item>() };
        //  if (Request.Cookies["CartPID"] != null)
        //  {
       
            ItemList.items.Add(new Item()
            {
                name = "gdgdhd",
                currency = "USD",
                price = "0.12",
                quantity = "1",
                sku = "sku"

            });
    
        //Total += Convert.ToInt64(dt.Rows[i]["PSelPrice"]);


        var payer = new Payer() { payment_method = "paypal" };

            var redirUrl = new RedirectUrls()
            {
                cancel_url = redirectUrl + "&Cancel=true",
                return_url = redirectUrl
            };
            var details = new Details()
            {
                tax = "1",
                shipping = "1",
                subtotal = "0.12"

            };
            var amount = new Amount()
            {
                currency = "USD",
                total = "2.12", /*Total.ToString(),*/
                details = details
            };
            
            var transactionList = new List<Transaction>();

            transactionList.Add(new Transaction()
            {
                description = "Transaction Description",
                invoice_number = "#100000",
                amount = amount,
                item_list = ItemList

            });
            payment = new Payment()
            {
                intent = "sale",
                payer = payer,
                transactions = transactionList,
                redirect_urls = redirUrl
            };
     //   }
        return payment.Create(apicontext);
     
    }

    public void BindPriceData()
    {
        if (Request.Cookies["CartPID"] != null)
        {
            string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
            string[] CookieDataArray = CookieData.Split(',');
            if (CookieDataArray.Length > 0)
            {
              
                
                Int64 CartTotal = 0;
                Int64 Total = 0;
                for (int i = 0; i < CookieDataArray.Length; i++)
                {
                    string PID = CookieDataArray[i].ToString().Split('-')[0];
                    string SizeID = CookieDataArray[i].ToString().Split('-')[1];

                    if (hdPidSizeID.Value != null && hdPidSizeID.Value != "")
                    {
                        hdPidSizeID.Value += "," + PID + "-" + SizeID;
                    }
                    else
                    {
                        hdPidSizeID.Value +=  PID + "-" + SizeID;
                    }

                    String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        using (SqlCommand cmd = new SqlCommand("select A.*,dbo.getSizeName(" + SizeID + ") as SizeNamee,"
                            + SizeID + " as SizeIDD,SizeData.Name,SizeData.Extension from tblProducts A cross apply( select top 1 B.Name,Extension from tblProductImages B where B.PID=A.PID ) SizeData where A.PID="
                            + PID + "", con))
                        {
                            cmd.CommandType = CommandType.Text;
                            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                            {
                                sda.Fill(dt);
                            }

                        }
                    }
                    CartTotal += Convert.ToInt64(dt.Rows[i]["PPrice"]);
                    Total += Convert.ToInt64(dt.Rows[i]["PSelPrice"]);
                }
             
                divPriceDetails.Visible = true;

                spanCartTotal.InnerText = CartTotal.ToString();
                spanTotal.InnerText = "Rs. " + Total.ToString();
                spanDiscount.InnerText = "-" + (CartTotal - Total).ToString();

                hdCartAmonut.Value = CartTotal.ToString();
                hdCartDiscount.Value = (CartTotal - Total).ToString();
                hdTotalPayed.Value = Total.ToString();
            }
            else
            {
                //TODO Show Empty Cart
                Response.Redirect("~/Products.aspx");
            }
        }
        else
        {
            //TODO Show Empty Cart
            Response.Redirect("~/Products.aspx");

        }
    }


    protected void btnPaytm_Click(object sender, EventArgs e)
    {
        if (Session["USERID"] != null)
        {
            string USERID = Session["USERID"].ToString();
            string PaymentType = "Paytm";
            string PaymentStatus = "NotPaid";
            DateTime DateofPurchase = DateTime.Now;
            string EMAILID = Session["USEREMAIL"].ToString();
            string CallbackURL = "http://www.callback.aspx";

            //Insert data to tblPurchase
            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("insert into tblPurchase values('"+USERID+"','"
                    +hdPidSizeID.Value+"','"+hdCartAmonut.Value+"','"+hdCartDiscount.Value+"','"+hdTotalPayed.Value+"','"
                    +PaymentType+"','"+PaymentStatus+"','"+DateofPurchase+"','"+
                    txtName.Text+"','"+txtAddress.Text+"','"+txtPinCode.Text+ "','" + txtMobileNumber.Text + "') select SCOPE_IDENTITY()", con);
                con.Open();
                Int64 PurchaseID = Convert.ToInt64(cmd.ExecuteScalar());
                PaytmPayment(EMAILID, txtMobileNumber.Text, USERID,PurchaseID.ToString(), hdTotalPayed.Value, CallbackURL);
            }
        }
        else
        {
            Response.Redirect("~/SignIn.aspx");
        }
    }
    public void PaytmPayment(string EMAIL,string MOBILE_NO,string CUST_ID,string ORDER_ID, string TXN_AMOUNT,string CALLBACK_URL)
    {
        String merchantKey = "merchantKey value" ;
        Dictionary<string, string> parameters = new Dictionary<string, string>();
        parameters.Add("MID", "mid value");
        parameters.Add("CHANNEL_ID", "WEB");
        parameters.Add("INDUSTRY_TYPE_ID", "Retail");
        parameters.Add("WEBSITE", "Web_STAGING");
        parameters.Add("EMAIL", EMAIL);
        parameters.Add("MOBILE_NO", MOBILE_NO);
        parameters.Add("CUST_ID", CUST_ID);
        parameters.Add("ORDER_ID", ORDER_ID);
        parameters.Add("TXN_AMOUNT", TXN_AMOUNT);
        parameters.Add("CALLBACK_URL", CALLBACK_URL); //This parameter is not mandatory. Use this to pass the callback url dynamically.

        string checksum = CheckSum.generateCheckSum(merchantKey, parameters);

        string paytmURL = "https://securegw-stage.paytm.in/theia/processTransaction?orderid=" + ORDER_ID;

        string outputHTML = "<html>";
        outputHTML += "<head>";
        outputHTML += "<title>Merchant Check Out Page</title>";
        outputHTML += "</head>";
        outputHTML += "<body>";
        outputHTML += "<center><h1>Please do not refresh this page...</h1></center>";
        outputHTML += "<form method='post' action='" + paytmURL + "' name='f1'>";
        outputHTML += "<table border='1'>";
        outputHTML += "<tbody>";
        foreach (string key in parameters.Keys)
        {
            outputHTML += "<input type='hidden' name='" + key + "' value='" + parameters[key] + "'>";
        }
        outputHTML += "<input type='hidden' name='CHECKSUMHASH' value='" + checksum + "'>";
        outputHTML += "</tbody>";
        outputHTML += "</table>";
        outputHTML += "<script type='text/javascript'>";
        outputHTML += "document.f1.submit();";
        outputHTML += "</script>";
        outputHTML += "</form>";
        outputHTML += "</body>";
        outputHTML += "</html>";
        Response.Write(outputHTML);
    }

    protected void btnPayPal_Click(object sender, EventArgs e)
    {
        PaymentWithPaypal(); 
    }
}