using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PaypalConfiguration
/// </summary>
public class PaypalConfiguration
{
    public readonly static string clientId;
    public readonly static string clientSecret;

    static PaypalConfiguration()
    {
        var config = getconfig();
        clientId = "ATu55vkFDn-q5o1fnDaTShnpKRWHXX0Bu2klkbIN9zqTA2UiAi4vqC-_2IUYvtNaAe2kp10MaYNS3tlK";
        clientSecret = "EOO39fsI3bRe4l75LcvOccKJSLKhN3dvR5b6_zv6d4nDT15Ai41YoMjxWujgNJN9svJIsh0ag5VkZTAn";
    }

    private static Dictionary<string,string> getconfig()
    {
        return PayPal.Api.ConfigManager.Instance.GetProperties();
    }
    private static string GetAccessToken()
    {
        string accessToken = new OAuthTokenCredential(clientId,clientSecret,getconfig()).GetAccessToken();
        return accessToken;
    }
    public static APIContext GetAPIContext()
    {
        APIContext apicontext = new APIContext(GetAccessToken());
        apicontext.Config = getconfig();
        return apicontext;
    }
}