using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Amazon.S3;
using Amazon;
using Amazon.S3.Model;
using System.Collections.Specialized;
using System.Configuration;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using System.Data;
using System.Text;
using System.Security.Cryptography;
using System.IO;
using System.Drawing;
using System.Net.Http;
using Newtonsoft.Json.Linq;
using System.Threading.Tasks;
using System.Drawing.Imaging;
using Microsoft.Win32;
using System.EnterpriseServices;
using System.Data.Common;
using iTextSharp.text.pdf;
using System.Reflection;

public partial class Result : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["demo"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["mobile"] == null || Request.Form["mobile"] == "" )
        {
            Session.Abandon();
            Response.Redirect("Default.html");
        }

            if (!IsPostBack)
        {
            try
            {

                string rollCode = Request.Form["mobile"];
                string rollNo = Request.Form["password"];

                //  If user comes without form data
                if (string.IsNullOrEmpty(rollCode) || string.IsNullOrEmpty(rollNo))
                {
                    Session.Abandon();
                    Response.Redirect("Default.html?msg=invalid", false);
                    return;
                }


                if (Request.Form["mobile"] != null && Request.Form["mobile"] != "" && Request.Form["password"] != null && Request.Form["password"] != "")
                {
                    DataSet ds = new DataSet();
                    ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "LoginSp", new SqlParameter("rollcode", Request.Form["mobile"]), new SqlParameter("rollno", Request.Form["password"]));
                    if (ds.Tables[0].Rows.Count > 0 && ds.Tables[0].Rows[0]["status"].ToString() == "1")
                    {
                        Session["rollcode"] = ds.Tables[0].Rows[0]["rollcode"].ToString();
                        Session["rollno"] = ds.Tables[0].Rows[0]["rollno"].ToString();
                        Session["dsrs"] = ds;

                        if (ds.Tables[0].Rows[0]["IsCCEMarks"].ToString() == "1")
                        {
                            Response.Redirect("Resultcce.aspx");
                        }
                        //else
                        //{
                        //    Response.Redirect("Result.aspx");
                        //}
                    }
                    else
                    {
                        Response.Redirect("Default.html?msg=invalid", false);
                        return;
                        // Response.Redirect("Default.html");
                    }

                }

            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }

        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Default.html");
    }
}


