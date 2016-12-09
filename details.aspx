<%@ Page Language="C#" AutoEventWireup="true" CodeFile="details.aspx.cs" Inherits="details" enableEventValidation="false"%>

<!DOCTYPE html>

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>Results</title>

  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">

</head>
<body>
     <nav class="navbar navbar-default navbar-static-top navbar-inverse" role="navigation">
    <div class="navbar-header my-header"><img src="images/SSE_logo.png" width="150">
    </div>
  </nav>
<header class="image-bg-fixed-height">
    <form ID="form1" runat="server">
    <div>    
                 <asp:Repeater ID="Repeater1" runat="server">
<HeaderTemplate>

</HeaderTemplate>
<ItemTemplate>

   <%-- <tr>
        <td>
          name:  <asp:Label ID="lblUser" runat="server" Font-Bold="true" Text='<%#Eval("name") %>'/>::::
           ownername: <asp:Label ID="lblemail" runat="server" Font-Bold="true" Text='<%#Eval("ownername") %>'/>::::
            address: <asp:Label ID="Label1" runat="server" Font-Bold="true" Text='<%#Eval("street1") %>'/>::::
            ratings: <asp:Label ID="Label2" runat="server" Font-Bold="true" Text='<%#Eval("ratings") %>'/>::::
            contact: <asp:Label ID="Label3" runat="server" Font-Bold="true" Text='<%#Eval("phoneNo") %>'/>::::
            
          
            <asp:Button ID="Button1" Text="View Details" CommandArgument='<%#Eval("service_id") %>' runat="server" OnClick="Button1_Click1" />
</td>
</tr>--%>

    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >


          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">Service</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class=" col-md-12 col-lg-12 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>Service Name:</td>
                        <td><%#Eval("name") %></td>
                      </tr>
                      <tr>
                        <td>Phone:</td>
                        <td><%#Eval("phoneNo") %></td>
                      </tr>
                      <tr>
                        <td>Email:</td>
                        <td>abc@example.com</td>
                      </tr>
                      <tr>
                        <td>Address:</td>
                        <td><%#Eval("street1") %></td>
                      </tr>


                      <tr>
                        <tr>
                          <td>Location</td>
                          <td>Kavi Nagar</td>
                        </tr>
                       

                      </tr>

                    </tbody>
                  </table>
                  <h4><span class="label label-default">Rating:</span> <%#Eval("ratings") %>/5</h4>
                  <span class="pull-right">
                    
                      <asp:Button ID="Button1" class="btn btn-primary" Text="View" CommandArgument='<%#Eval("service_id") %>' runat="server" OnClick="Button1_Click1" />
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>




</ItemTemplate>
<FooterTemplate>

</FooterTemplate>
</asp:Repeater>
    </div>
       
        



         <asp:HiddenField ID="hf1" runat="server" />
        <asp:HiddenField ID="hf2" runat="server" />
    </form>
     </header>
</body>
     <script>
         //var x = document.getElementById("demo");
         //console.log(x);
         console.log("hi");
         function getLocation() {
             //console.log(x);
             if (navigator.geolocation) {
                 navigator.geolocation.getCurrentPosition(showPosition);
             } else {
                 x.innerHTML = "Geolocation is not supported by this browser.";
             }
         }

         function showPosition(position) {
             //console.log(x);
             //x.innerHTML = "Latitude: " + position.coords.latitude +
             //"<br>Longitude: " + position.coords.longitude;
             form1.hf1.value = position.coords.latitude;
             form1.hf2.value = position.coords.longitude;

         }
         window.onload = function () {
             getLocation();
         }
</script>
</html>
