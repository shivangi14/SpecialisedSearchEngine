using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Threading.Tasks;

public partial class info_entry : System.Web.UI.Page
{
    public string service_type, owner_name, name, phone_no, email, street1, street2;
    int pin;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.UnobtrusiveValidationMode = 0;
    }

    protected async void btnSave_Click(object sender, EventArgs e)
    {

        var i = await new Location().GetLocFromAddress(txtboxStreet1.Text, txtboxStreet2.Text);

        int a = 0;
        service_type = ddlServiceName.SelectedValue.ToString();
        name = txtboxName.Text;
        owner_name = txboxOwnerName.Text;
        phone_no = txtboxContact1.Text;
        email = txtboxEmail.Text;
        street1 = txtboxStreet1.Text;
        street2 = txtboxStreet2.Text;
        pin = Convert.ToInt32(txtboxPin.Text);
        Register_services service = new Register_services();
        int service_id = service.register(service_type, name, owner_name, email,false, phone_no, street1, street2, i.lat, i.lng, pin);
        service.inputRating(service_id,5);
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
        Response.Write("<script>alert('Entry Successful. Your request is sent for Approval');</script>");
    }

   
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public async static Task<List<string>> GetCompletionList(string prefixText)
    {
        var loc = await new Location().AddresAutoComplete(prefixText);
        List<string> placeNames = new List<string>();

        int i = 0;
       // foreach(int count in loc.predictions.Count)
       // {
            placeNames.Add(loc.predictions[i].terms[0].value);
       // }

        return placeNames;
        

        }

    }

