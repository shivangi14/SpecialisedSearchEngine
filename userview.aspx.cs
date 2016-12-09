using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DALHelper;
using System.Data.SqlClient;
using System.Configuration;

public partial class userview : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        this.UnobtrusiveValidationMode = 0;
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetCompletionList(string prefixText)
    {
        using (SqlConnection con = new SqlConnection())
        {
            con.ConnectionString = ConfigurationManager.ConnectionStrings["sseCS"].ConnectionString;

            using (SqlCommand com = new SqlCommand())
            {
                com.CommandText = "select distinct street1 from Addresses Where street1 like @txtboxText + '%'";

                com.Parameters.AddWithValue("@txtboxText", prefixText);
                com.Connection = con;
                con.Open();
                List<string> placeNames = new List<string>();
                using (SqlDataReader sdr = com.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        placeNames.Add(sdr["street1"].ToString());
                    }
                }
                con.Close();
                return placeNames;


            }

        }

    } 
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
       
        Session["service"] = ddlService.SelectedItem.ToString();
       Session["area"] = txtbxArea.Text;
       Response.Redirect("details.aspx");
    }
   
}