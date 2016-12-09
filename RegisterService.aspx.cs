using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegisterService : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.UnobtrusiveValidationMode = 0;
    }

    protected async void btnSave_Click(object sender, EventArgs e)
    {
        string service_type, owner_name, name, phone_no, email, street1, street2;
        int pin;
        var i = await new Location().GetLocFromAddress(txtbxStreet1.Text, txtbxStreet2.Text);

        int a = 0;
        service_type = ddlService.SelectedValue.ToString();
        name = txtbxName.Text;
        owner_name = txbxOwnerName.Text;
        phone_no = txtbxPhone.Text;
        email = txtbxEmail.Text;
        street1 = txtbxStreet1.Text;
        street2 = txtbxStreet2.Text;
        pin = Convert.ToInt32(txtbxPin.Text);
        Register_services service = new Register_services();
        int service_id = service.register(service_type, name, owner_name, email, true, phone_no, street1, street2, i.lat, i.lng, pin);
        if (fileuploadimages.HasFile)
        {
            foreach (HttpPostedFile postedFile in fileuploadimages.PostedFiles)
            {
                string filename = Path.GetFileName(fileuploadimages.PostedFiles[a].FileName);
                postedFile.SaveAs(Server.MapPath("Images/" + filename));
                service.registerimages(filename, service_id);
                a++;
            }
        }
        Response.Write("<script>alert('Entry Successful.');</script>");
    }


  

}