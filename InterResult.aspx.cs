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

public partial class InterResult : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["demo"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {

        string rollCode = Request.QueryString["Rollcode"];
        string rollNumber = Request.QueryString["Rollnumber"];
        if (Request.QueryString["Rollcode"] == null || Request.QueryString["Rollnumber"] == "")
        {
            Session.Abandon();
            Response.Redirect("Index.html");
        }

        if (!IsPostBack)
        {
            try
            {
                if (Request.QueryString["Rollcode"] != null && Request.QueryString["Rollnumber"] != "" && Request.QueryString["Rollcode"] != null && Request.QueryString["Rollnumber"] != "")
                {
                    DataSet ds = new DataSet();
                    ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "LoginSp", new SqlParameter("rollcode", Request.QueryString["Rollcode"]), new SqlParameter("rollno", Request.QueryString["Rollnumber"]));
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
                        Response.Write("<script>alert('No Record Found')</script>");
                        //Response.Redirect("Index.html");
                    }

                }

            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }

        }
    }
    //protected void btnBack_Click(object sender, EventArgs e)
    //{
    //    Session.Abandon();
    //    Response.Redirect("Index.html");
    //}
}


