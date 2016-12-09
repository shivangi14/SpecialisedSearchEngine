<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ApproveServiceRequests.aspx.cs" Inherits="ApproveServiceRequests" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Approve</title>

	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
    <style>
        .btn-admin{
            border-radius:4px;  
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

    <div class="container" style="margin-top:3%">
        <h3><span class="label label-info">Approval Requests</span></h3>

        <asp:GridView ID="gridviewApproveService" runat="server" class="table table-hover" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField HeaderText="Service Name" DataField="service_name" />
                    <asp:BoundField HeaderText="Name" DataField="name" />
                    <asp:BoundField HeaderText="Contact No" DataField="contact_no" />
                    <asp:BoundField HeaderText="Street 1" DataField="street1" />
                    <asp:BoundField HeaderText="Street 2" DataField="street2" />
                  <asp:TemplateField>
                      <ItemTemplate>
                          <asp:Button ID="btnApprove" CausesValidation="false" class="btn-admin btn btn-success"  runat="server" OnClick="btnApprove_Click1" Text="Approve" CommandArgument='<%# Eval("id") %>' />
                          <asp:Button ID="btnDeny" CausesValidation="false"  runat="server"  class="btn-admin btn btn-danger" OnClick="btnDeny_Click" Text="Deny" CommandArgument='<%# Eval("id") %>' />
                      </ItemTemplate>
                  </asp:TemplateField>
                </Columns>
        </asp:GridView>
        

            <br />
            <asp:Button ID="btnLogout" runat="server" CausesValidation="False" OnClick="btnLogout_Click" Text="Log Out" />
            <br />

            <br />
            <asp:Button ID="btnRegister" runat="server" CausesValidation="False" onclick="btnRegister_Click" Text="Register a New Service" />
            <br />
            <br />
             
    </div>
    </form>
</body>
</html>
