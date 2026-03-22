<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InterResult.aspx.cs" Inherits="InterResult" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Bseb Result </title>
    <%-- <style type="text/css">
        @page {
            margin: 10px 20px;
        }
    </style>--%>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        .table-responsive {
            width: 100%;
            overflow-x: auto;
        }

        th, td {
            border: 1px solid black;
            padding: 7px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: auto;
            /*border: 2px solid black;*/
            padding: 20px;
        }

        .header {
            text-align: center;
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .logo {
            text-align: center;
            margin-bottom: 10px;
        }

            .logo img {
                width: 80px;
            }

        .marksheet {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 10px;
        }

            .marksheet, .marksheet th, .marksheet td {
                border: 1px solid black;
            }

                .marksheet th, .marksheet td {
                    padding: 10px;
                    text-align: center;
                }

        .subject-group {
            text-align: left;
            font-weight: bold;
            background-color: #e0e0e0;
        }

        .watermark {
            position: fixed;
            top: 40%;
            left: 50%;
            transform: translate(-50%, -50%) rotate(-30deg);
            font-size: 70px;
            font-weight: bold;
            color: rgba(0, 0, 0, 0.3);
            z-index: 9999;
            white-space: nowrap;
            pointer-events: none;
            text-align: center;
        }

        .watermark-subtext {
            display: block;
            font-size: 20px;
            font-weight: normal;
            margin-top: 10px;
            color: rgba(0, 0, 0, 0.4);
        }

        @page {
            margin: 10px 20px;
        }

        .print-btn-container {
            text-align: center;
            margin-top: 10px;
            margin-bottom: 20px;
        }

        .noprint {
            display: inline-block;
            width: 120px;
            padding: 10px;
            font-size: 16px;
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .text_center th,
        .text_center td {
            text-align: center;
        }

        .bottom-tag {
            display: none; /* hide on screen */
        }

        .bottom-tag {
            width: 100%;
            text-align: right;
            font-size: 10px;
            font-weight: bold;
            color: #555;
            margin-top: 10px;
        }

        @media print {
            .bottom-tag {
                display: block;
                position: fixed;
                bottom: 5px;
                right: 10px;
                font-size: 8px;
                font-weight: bold;
                color: #000;
            }
        }
    </style>
    <%--   <script type="text/javascript">
        function printDiv(divName) {
            var printContents = document.getElementById(divName).innerHTML;
            var originalContents = document.body.innerHTML;
            document.body.innerHTML = printContents;
            window.print();
            document.body.innerHTML = originalContents;
        }
    </script>--%>

    <script type="text/javascript">
        //with watermark
        function printDiv(divName) {
            var printContents = document.getElementById(divName).innerHTML;
            var originalContents = document.body.innerHTML;

            // Append watermark inside the print area
            var watermarkDiv = document.createElement("div");
            watermarkDiv.className = "watermark";
            watermarkDiv.innerHTML = `
            WEB COPY
           <span class="watermark-subtext">
    1. Bihar School Examination Board, Patna is not responsible for any <br>
    inadvertent error that may have crept in the results being published <br>
    on the NET. <br>
    2. The results published on the NET are for immediate information to <br>
    the examinees. <br>
    3. This is not a valid document.
</span>
        `;

            document.getElementById(divName).appendChild(watermarkDiv);
            // Set body content to the print section
            document.body.innerHTML = document.getElementById(divName).innerHTML;
            window.print();

            // Restore original content
            document.body.innerHTML = originalContents;
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <div style="margin-top: 50px">
                <%--<asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CssClass="btn btn-success" style="display: block;width: 100px;cursor: pointer;float: right;margin-right: 54px;"  />--%>
                <input type="button" value="PRINT" class="noprint btn btn-success" onclick="printDiv('pagewrap')" style="display: block; width: 100px; cursor: pointer" />
            </div>
            <div class="container" id="pagewrap">
                <div class="bottom-tag">SSBD</div>
                <%
                    if (Session["rollcode"] == null || Session["rollno"] == null || Session["dsrs"] == null)
                    {
                        Response.Write("No Record Found");
                        return;
                    }
                    System.Data.DataSet ds = (System.Data.DataSet)Session["dsrs"];
                    System.Data.DataRow dr = ds.Tables[0].Rows[0];
                    System.Data.DataTable dt1 = ds.Tables[1];
                    System.Data.DataTable dt2 = ds.Tables[2];
                    System.Data.DataTable dt3 = ds.Tables[3];
                    System.Data.DataTable dt4 = ds.Tables[4];
                %>
                <table style="width: 100%;" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <table style="width: 100%;" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="border: solid 1px #000; text-align: center;">
                                        <img src="images/bseorissa-logo-w.png" style="width: 80px;" alt="" />
                                    </td>
                                    <td style="text-align: center; border: solid 1px #000; border-left: 0;">
                                        <h3 style="margin: 5px; font-size: 18px; font-weight: 700; color: #000; font-family: arial;">Bihar School Examination Board</h3>
                                        <p style="margin: 5px; font-size: 18px; font-weight: 700; color: #000; font-family: arial;">RESULT</p>
                                        <h4 style="margin: 5px; font-size: 18px; font-weight: 700; color: #000; font-family: arial;">INTERMEDIATE ANNUAL EXAMINATION-2026</h4>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <table width="100%" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>BSEB Unique Id</td>
                                    <td><% Response.Write(dr["BsebUniqueID"]); %></td>
                                </tr>
                                <tr>
                                    <td>Student's Name</td>
                                    <td><% Response.Write(dr["NameoftheCandidate"]); %></td>
                                </tr>
                                <tr>
                                    <td>Father's Name</td>
                                    <td><% Response.Write(dr["FathersName"]); %></td>
                                </tr>
                                <tr>
                                    <td>School/College Name</td>
                                    <td><% Response.Write(dr["CollegeName"]); %></td>
                                </tr>
                                <tr>
                                    <td>Roll Code</td>
                                    <td><% Response.Write(dr["rollcode"]); %></td>
                                </tr>
                                <tr>
                                    <td>Roll Number</td>
                                    <td><% Response.Write(dr["rollno"]); %></td>
                                </tr>
                                <tr>
                                    <td>Registration Number</td>
                                    <td><% Response.Write(dr["RegistrationNo"]); %></td>
                                </tr>
                                <tr>
                                    <td>Faculty</td>
                                    <td><% Response.Write(dr["FACULTY"]); %></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: solid 1px #000; padding: 5px; border-top: none; font-size: 14px; font-weight: bold; font-family: arial;">Marks Details</td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" cellspacing="0" cellpadding="0">
                                <tr class="text_center">
                                    <th rowspan="2">Subject</th>
                                    <th rowspan="2">Full Marks</th>
                                    <th rowspan="2">Pass Marks</th>
                                    <th rowspan="2">Theory</th>
                                    <th rowspan="2">Practical</th>
                                    <th colspan="2">Regulation</th>
                                    <th rowspan="2">Subject Total</th>
                                </tr>
                                <tr class="text_center">
                                    <th>Th.</th>
                                    <th>Pr.</th>
                                </tr>
                                <%
                                    if (dt1.Rows.Count > 0)
                                    {
                                %>
                                <tr>
                                    <td colspan="8" style="border: solid 1px #000; padding: 5px; border-top: none; font-size: 14px; font-weight: bold; font-family: arial;">1. अनिवार्य (Compulsory)</td>
                                </tr>

                                <%}%>


                                <%
                                    foreach (System.Data.DataRow dr1 in dt1.Rows)
                                    {
                                %>


                                <tr class="text_center">
                                    <td><% Response.Write(dr1["Sub"]); %></td>
                                    <td><% Response.Write(dr1["maxMark"]); %></td>
                                    <td><% Response.Write(dr1["passMark"]); %></td>
                                    <td><% Response.Write(dr1["theory"]); %></td>
                                    <td><% Response.Write(dr1["OB_PR"]); %></td>
                                    <td><% Response.Write(dr1["GRC_THO"].ToString() == "0" ? "" : dr1["GRC_THO"]); %></td>
                                    <td><% Response.Write(dr1["GRC_PR"].ToString() == "0" ? "" : dr1["GRC_PR"]); %></td>
                                    <td><% Response.Write(dr1["TOT_SUB"]); %></td>
                                </tr>


                                <%}%>


                                <%
                                    if (dt2.Rows.Count > 0)
                                    {
                                %>
                                <tr>
                                    <td colspan="8" style="border: solid 1px #000; padding: 5px; border-top: none; font-size: 14px; font-weight: bold; font-family: arial;">2. ऐच्छिक (Elective)</td>
                                </tr>

                                <%}%>


                                <%
                                    foreach (System.Data.DataRow dr2 in dt2.Rows)
                                    {
                                %>

                                <tr class="text_center">
                                    <td><% Response.Write(dr2["Sub"]); %></td>
                                    <td><% Response.Write(dr2["maxMark"]); %></td>
                                    <td><% Response.Write(dr2["passMark"]); %></td>
                                    <td><% Response.Write(dr2["theory"]); %></td>
                                    <td><% Response.Write(dr2["OB_PR"]); %></td>
                                    <td><% Response.Write(dr2["GRC_THO"].ToString() == "0" ? "" : dr2["GRC_THO"]); %></td>
                                    <td><% Response.Write(dr2["GRC_PR"].ToString() == "0" ? "" : dr2["GRC_PR"]); %></td>
                                    <td><% Response.Write(dr2["TOT_SUB"]); %></td>
                                </tr>

                                <%}%>




                                <%
                                    if (dt3.Rows.Count > 0)
                                    {
                                %>
                                <tr>
                                    <td colspan="8" style="border: solid 1px #000; padding: 5px; border-top: none; font-size: 14px; font-weight: bold; font-family: arial;">3. अतिरिक्त Additional</td>
                                </tr>

                                <%}%>

                                <%
                                    foreach (System.Data.DataRow dr3 in dt3.Rows)
                                    {
                                %>

                                <tr class="text_center">
                                    <td><% Response.Write(dr3["Sub"]); %></td>
                                    <td><% Response.Write(dr3["maxMark"]); %></td>
                                    <td><% Response.Write(dr3["passMark"]); %></td>
                                    <td><% Response.Write(dr3["theory"]); %></td>
                                    <td><% Response.Write(dr3["OB_PR"]); %></td>
                                    <td><% Response.Write(dr3["GRC_THO"].ToString() == "0" ? "" : dr3["GRC_THO"]); %></td>
                                    <td><% Response.Write(dr3["GRC_PR"].ToString() == "0" ? "" : dr3["GRC_PR"]); %></td>
                                    <td><% Response.Write(dr3["TOT_SUB"]); %></td>
                                </tr>

                                <%}%>


                                <%
                                    if (dt4.Rows.Count > 0)
                                    {
                                %>
                                <tr>
                                    <td colspan="8" style="border: solid 1px #000; padding: 5px; border-top: none; font-size: 14px; font-weight: bold; font-family: arial;">Vocational Trade</td>
                                </tr>

                                <%}%>


                                <%
                                    foreach (System.Data.DataRow dr4 in dt4.Rows)
                                    {
                                %>
                                <tr class="text_center">
                                    <td><% Response.Write(dr4["Sub"]); %></td>
                                    <td><% Response.Write(dr4["maxMark"]); %></td>
                                    <td><% Response.Write(dr4["passMark"]); %></td>
                                    <td><% Response.Write(dr4["theory"]); %></td>
                                    <td><% Response.Write(dr4["OB_PR"]); %></td>
                                    <td><% Response.Write(dr4["GRC_THO"].ToString() == "0" ? "" : dr4["GRC_THO"]); %></td>
                                    <td><% Response.Write(dr4["GRC_PR"].ToString() == "0" ? "" : dr4["GRC_PR"]); %></td>
                                    <td><% Response.Write(dr4["TOT_SUB"]); %></td>
                                </tr>

                                <%}%>
                            </table>
                        </td>
                    </tr>


                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td colspan="2"><strong>Final Result:</strong></td>
                                </tr>
                                <tr>
                                    <td style="width: 20%;"><strong>Aggregate Marks:</strong></td>
                                    <td><% Response.Write(dr["TotalAggregateMarkinNumber"]); %></td>
                                </tr>
                                <tr>
                                    <td style="width: 20%;"><strong>Result/Division:</strong></td>
                                    <td><% Response.Write(dr["DIVISION"]); %></td>
                                </tr>
                            </table>

                        </td>
                    </tr>
                    <tr>
                        <td style="border: solid 1px #000; padding: 5px; border-top: none; font-size: 14px; font-weight: bold; font-family: arial; text-align: center; text-decoration: underline;">Abbreviations Used:</td>
                    </tr>
                    <tr>
                        <td>
                            <div class="table-responsive">
                                <table>

                                    <tr>
                                        <td>* - Grace</td>
                                        <td>@ - Swapping</td>
                                        <td># - Greater Marks of Last Year</td>
                                        <td>D - Distinction</td>
                                        <td>F - Fail</td>
                                        <td>U/R - Under Regulation</td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>


            </div>
        </center>
    </form>
</body>
</html>
