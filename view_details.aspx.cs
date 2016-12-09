using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class view_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.UnobtrusiveValidationMode = 0;
        Services service = new Services();
        string lat = Session["Lat"].ToString();
        string lng = Session["Long"].ToString();
        hiddenfieldUserLat.Value = lat;
        hiddenfieldUserLong.Value = lng;
        hiddenfieldServiceLat.Value = service.getlatitude(Convert.ToInt32(Session["id"])).ToString();
        hiddenfieldServiceLong.Value = service.getlongitude(Convert.ToInt32(Session["id"])).ToString();
        RepeaterDetails.DataSource = service.getName(Convert.ToInt32(Session["id"]));
        RepeaterDetails.DataBind();

        RepeaterImage.DataSource = service.getImages(Convert.ToInt32(Session["id"]));
        RepeaterImage.DataBind();

        Repeater1.DataSource = service.getComments(Convert.ToInt32(Session["id"]));
        Repeater1.DataBind();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        int service_id = Convert.ToInt32(Session["id"]);
        Services service = new Services();
        string name = txtName.Text;
        string email = txtbxEmail.Text;
        string comment = txtComment.Text;
        Register_services service1 = new Register_services();
        service1.insertincomment(service_id, name, email, comment);
        Repeater1.DataSource = service.getComments(service_id);
        Repeater1.DataBind();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        int ratings = DropDownList1.SelectedIndex+1;
        Register_services service = new Register_services();
        service.inputRating(Convert.ToInt32(Session["id"]),ratings);
    }
}