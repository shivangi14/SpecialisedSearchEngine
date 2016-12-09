<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" Async="true"  EnableEventValidation="false" CodeFile="RegisterService.aspx.cs" Inherits="RegisterService" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <header class="image-bg-fluid-height">

        <!-- Page Content -->
        <div class="container">

            <div class="row">

                <div class="col-md-6 margintop">
                    <form role="form">
                        <h2>Please Fill Up <small style="color: #CCC;">To register a service</small></h2>
                        <hr class="colorgraph">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtbxName" runat="server" class="form-control input-lg" placeholder="Name" TabIndex="1" />
                                    <asp:RequiredFieldValidator ID="rfvName" ErrorMessage="required" ControlToValidate="txtbxName" runat="server" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txbxOwnerName" class="form-control input-lg" placeholder="Owner Name" TabIndex="2" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>



                        <div class="form-group">
                            <asp:TextBox runat="server" ID="txtbxPhone" class="form-control input-lg" placeholder="Mobile Phone" TabIndex="4" />
                        </div>
                        <div class="form-group">
                            <asp:TextBox runat="server" ID="txtbxPhone1" class="form-control input-lg" placeholder="Work Phone" TabIndex="5" />
                        </div>

                        <div class="form-group">
                            <asp:TextBox runat="server" ID="txtbxEmail" class="form-control input-lg" placeholder="Email Address" TabIndex="6" />
                        </div>
                        <div class="form-group">
                            <asp:FileUpload ID="fileuploadimages" runat="server" AllowMultiple="true" Style="margin-left: 62px" accept="image/gif, image/jpeg, image/png" />
                        </div>
                        <div class="form-group">
                            <asp:TextBox runat="server" ID="txtbxStreet1" class="form-control input-lg" placeholder="Street 1" TabIndex="7" />
                        </div>
                        <div class="form-group">
                            <asp:TextBox runat="server" ID="txtbxStreet2" class="form-control input-lg" placeholder="Street 2" TabIndex="8" />
                        </div>
                        <div class="form-group">
                            <asp:TextBox runat="server" ID="txtbxPin" class="form-control input-lg" placeholder="Pin No" TabIndex="9" />
                        </div>
                        <div class="dropdown form-group">
                            <asp:DropDownList ID="ddlService" runat="server" AutoPostBack="True" Style="margin-left: 23px" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=ANUPPC;Initial Catalog=SSE;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [name] FROM [Type_of_Services]"></asp:SqlDataSource>
                        </div>

                        <div class="row">

                            <div class="col-md-6 col-md-offset-3">
                                <asp:Button ID="btnSave" runat="server" Height="39px" class="btn btn-primary btn-block btn-lg" TabIndex="8" Text="save" Width="70px" OnClick="btnSave_Click" />

                                <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>

                            </div>
                        </div>

                        <hr class="colorgraph">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="required" ControlToValidate="txtbxName" runat="server" />
                        <asp:RequiredFieldValidator ID="rfvStreet1" runat="server" ControlToValidate="txtbxStreet1" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfvPin" runat="server" ControlToValidate="txtbxPin" ErrrMessage="Required"></asp:RequiredFieldValidator>

                    </form>
                </div>

            </div>


        </div>
    </header>

</asp:Content>

