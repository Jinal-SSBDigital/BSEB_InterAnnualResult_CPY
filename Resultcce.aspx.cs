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

public partial class Resultcce : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["demo"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["rollcode"] == null || Session["rollno"] == null)
        {
            Response.Redirect("Default.html");
            //Response.Redirect("Index.html");
        }
        if (!IsPostBack)
        {

            if (Session["rollcode"] != null || Session["rollno"] != null)
            {
            }
            else
            {
                Response.Redirect("Default.html");
            }
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Default.html");
    }
}


