<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="ServiceApproval.aspx.cs" Inherits="ServiceApproval" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="container" style="margin:3%">
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
        

           
         
    </div>

</asp:Content>

