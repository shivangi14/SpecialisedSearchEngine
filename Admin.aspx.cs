using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAdmin_Click(object sender, EventArgs e)
    {
        string name = txtboxUserName.Text;
        string password = txtbxAdminPassword.Text;

        if (name == "admin" && password == "admin")
        {
            Session["Admin"] = 1;
            Response.Redirect("ApproveServiceRequests.aspx");
        }

        else
        {
            //lblMessage.Text = "Invalid username or password!!! ";
            Response.Write("<script>alert('Incorrect Username or Password');</script>");
        }
    }
}