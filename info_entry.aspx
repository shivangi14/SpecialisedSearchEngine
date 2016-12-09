<%@ Page Language="C#" AutoEventWireup="true" CodeFile="info_entry.aspx.cs" Inherits="info_entry" Async="true" EnableEventValidation="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register Services</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/foxy.css" rel="stylesheet">

    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="js/bootstrap.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-default navbar-static-top navbar-inverse" role="navigation">
            <div class="navbar-header">
                <img src="images/SSE_logo.png" width="150">
            </div>
        </nav>

        <header class="image-bg-fluid-height">

            <!-- Page Content -->
            <div class="container" style="padding-top: 120px;">

                <div class="row">
                    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                        <form role="form">
                            <h2>Please Fill Up <small style="color: #CCC;">To register a service</small></h2>
                            <hr class="colorgraph">
                            <div class="row">
                                <div class="col-xs-12 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtboxName" placeholder="Service Name" runat="server" class="form-control input-lg" required="true"/>
                                        <%--<input type="text" name="first_name" id="first_name" class="form-control input-lg" placeholder="First Name" tabindex="1">--%>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <asp:TextBox ID="txboxOwnerName" class="form-control input-lg" placeholder="Owner Name" runat="server" required="true"></asp:TextBox>
                                        <%--<input type="text" name="last_name" id="last_name" class="form-control input-lg" placeholder="Last Name" tabindex="2">--%>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-12 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <%--<img alt="Picture" src="images/noprofile.jpg" height="110" width="110">
								</div>--%>
                                        <asp:FileUpload ID="fileuploadimages" runat="server" class="fileupload" AllowMultiple="true" Style="margin-left: 0px" accept="image/gif, image/jpeg, image/png" />
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:TextBox ID="txtboxStreet1" class="form-control input-lg" placeholder="Street 1" runat="server" required="true"/>
                                <%--<input type="text" name="display_name" id="display_name" class="form-control input-lg" placeholder="Address" tabindex="3">--%>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtboxStreet2" class="form-control input-lg" placeholder="Street 2" runat="server" required="true" />
                                <%--<input type="text" name="display_name" id="display_name" class="form-control input-lg" placeholder="Address" tabindex="3">--%>
                            </div>
                            <div class="row">
                                <div class="col-xs-12 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtboxContact1" placeholder="Contact Work" runat="server" class="form-control input-lg" required="true" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtboxContact2" class="form-control input-lg" placeholder="Contact Home" runat="server"></asp:TextBox>
                                        <%--<input type="text" name="last_name" id="last_name" class="form-control input-lg" placeholder="Last Name" tabindex="2">--%>
                                    </div>
                                </div>
                            </div>


                            <div class="form-group">
                                 <asp:TextBox ID="txtboxPin"  runat="server" class="form-control input-lg" placeholder="Pincode" required="true" TextMode="number" />
                            </div>
                            <div class="form-group">
                                 <asp:TextBox ID="txtboxEmail" runat="server" TextMode="Email" placeholder="Email Address" class="form-control input-lg" required="true"></asp:TextBox>
                            </div>
                            <div class="dropdown form-group">
                                        <span id="dropdownhead">Service Type</span>    <asp:DropDownList ID="ddlServiceName" class="dropdown form-control" runat="server" AutoPostBack="True" Style="margin-left: 23px" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name">
            </asp:DropDownList>
                            </div>
                       
                            <hr class="colorgraph">

                            <div class="row">

                                <div class="col-xs-12 col-md-6">
                                    <asp:Button ID="btnSave" runat="server" class="btn btn-primary btn-block btn-lg" Text="Register" OnClick="btnSave_Click" />

                                </div>
                            </div>

                        </form>
                    </div>
                </div>

            </div>
        </header>
        <!--FOOTER BEGINS------------------------------------------>
        <div class="navbar-custom navbar-inverse navbar-static-bottom" role="navigation">
            <footer>
                <div id="footer_wrap">

                    <div id="coll" class="col-md-3 portfolio-item" style="text-align: center;">
                        <br>
                        <p><b>©2015 Specialized Search Engine.</b></p>
                    </div>

                    <div id="colr" class="col-md-6 portfolio-item" style="text-align: center; font-size: 20px;">
                        <p><b>Ghaziabad Development Authority, Ghaziabad</b></p>
                    </div>
                    <div id="colr" class="col-md-3 portfolio-item" style="text-align: center;">
                        <br>
                        <p><b>Powered By:Software Incubator</b></p>
                    </div>
                </div>
            </footer>
        </div>
        <!---FOOTER ENDS------------------------------------------>
            <asp:SqlDataSource ID=  "SqlDataSource1" runat="server" ConnectionString="Data Source=ANUPPC;Initial Catalog=SSE;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [name] FROM [Type_of_Services]"></asp:SqlDataSource>
            <asp:RequiredFieldValidator ID="rfvName" ErrorMessage="required" ControlToValidate="txtboxName" runat="server" />
            <asp:RequiredFieldValidator ID="rfvStreet1" runat="server" ControlToValidate="txtboxStreet1" ErrorMessage="Required"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="rfvPin" runat="server" ControlToValidate="txtboxPin" ErrrMessage="Required"></asp:RequiredFieldValidator>
        <%--<asp:TextBox ID="txtbxAddMore" runat="server"></asp:TextBox>
            <asp:Button ID="btnAdd" runat="server" Text="Add Item" OnClick="AddItem" CausesValidation="False" />--%>
                        <asp:ToolkitScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ToolkitScriptManager>
            <asp:AutoCompleteExtender ID="AutoCompleteExtender1"
                ServiceMethod="GetCompletionList"
                CompletionInterval="1"
                EnableCaching="false"
                CompletionSetCount="1"
                TargetControlID="txtboxStreet1" runat="server" MinimumPrefixLength="2" FirstRowSelected="false">
            </asp:AutoCompleteExtender>

    </form>
</body>
</html>

