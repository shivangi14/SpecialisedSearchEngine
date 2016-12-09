using DALHelper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ServiceApproval : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.UnobtrusiveValidationMode = 0;
        int id = Convert.ToInt32(Session["Admin"]);
        if (id != 1)
            Response.Redirect("Admin.aspx");
        BindData();
    }


    protected void BindData()
    {
        DBDataHelper.ConnectionString = ConfigurationManager.ConnectionStrings["sseCS"].ConnectionString;
        DBDataHelper helper = new DBDataHelper();
        DataTable dt = helper.GetDataTable("spGetUnapprovedRequests", SQLTextType.Stored_Proc);
        gridviewApproveService.DataSource = dt;
        gridviewApproveService.DataBind();
    }
    protected void btnDeny_Click(object sender, EventArgs e)
    {
        int service_id = Convert.ToInt32(((Button)sender).CommandArgument);
        DBDataHelper helper = new DBDataHelper();
        List<SqlParameter> list1 = new List<SqlParameter>();
        list1.Add(new SqlParameter("@service_id", service_id));
        DataTable dt = helper.GetDataTable("spDenyService", SQLTextType.Stored_Proc, list1);
        BindData();


    }
    protected void btnApprove_Click1(object sender, EventArgs e)
    {
        int service_id = Convert.ToInt32(((Button)sender).CommandArgument);
        DBDataHelper helper = new DBDataHelper();
        List<SqlParameter> list1 = new List<SqlParameter>();
        list1.Add(new SqlParameter("@service_id", service_id));
        DataTable dt = helper.GetDataTable("spApproveService", SQLTextType.Stored_Proc, list1);
        BindData();
    }
}