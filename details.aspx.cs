using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        getdetails details = new getdetails();
        if (Session["area"].ToString() == "")
        {
            Repeater1.DataSource = details.getdetailsbyservicetype(Session["service"].ToString());
            Repeater1.DataBind();
        }
        else
        {
            Repeater1.DataSource = details.getdetailsbyArea(Session["service"].ToString(), Session["area"].ToString());
            Repeater1.DataBind();
        }
    }
  
    protected void Button1_Click1(object sender, EventArgs e)
    {
        int service_id = Convert.ToInt32(((Button)sender).CommandArgument);
        Session["id"] = service_id;
        Session["Lat"] = hf1.Value;
        Session["Long"] = hf2.Value;
        Response.Redirect("view_details.aspx");

    }
}