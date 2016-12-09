<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="userview.aspx.cs" Inherits="userview" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search Services</title>

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />



    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/foxy.css" rel="stylesheet" />

    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="js/bootstrap.js"></script>



</head>
<body>
    <form id="form1" runat="server">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top navbar-inverse" role="navigation">
            <div class="navbar-header">
                <img src="images/SSE_logo.png" width="150" />
            </div>
        </nav>

        <header class="image-bg-fluid-height">
            <!-- Page Content -->
            <div class="container" style="padding-top: 100px;">

                <div class="row">
                <div class="col-md-12 portfolio-item">

                    <div class="bs_search_wrapper">
                       <h2>&nbsp&nbspWhat are you looking for today?</h2>
                        <form class="form-wrapper cf">
                            <asp:TextBox ID="txtbxArea" runat="server" placeholder="Address..." />
                            <%--<input type="text" placeholder="I am looking for..." required>--%>
                            <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Search" CausesValidation="False" />
                        </form>
                    </div>
                </div>
                </div>


                <br />
                <br />
                <br />
                <div class="row" align="center">
                <div class="col-md-12 portfolio-item" style="padding-top: 40px;">
                    <ul class="nav navbar-nav navbar-left">
                        <span id="dropdownhead">Service Type</span>
                        <asp:DropDownList class="dropdown form-control" ID="ddlService" runat="server" AutoPostBack="True" Style="margin-left: 23px" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name">
                        </asp:DropDownList>
                        <%--<li class="dropdown">--%>
                        <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="true" style="color:white;font-size:17px;">Dropdown <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Separated link</a></li>
                        </ul>
                    </li--%>
                    </ul>

                </div>
                </div>
        </header>

        <!--FOOTER BEGINS------------------------------------------>
        <div class="row navbar-custom navbar-inverse navbar-static-bottom" role="navigation" style="background-color:#000;">
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


            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=ANUPPC;Initial Catalog=SSE;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [name] FROM [Type_of_Services]"></asp:SqlDataSource>
            <asp:ToolkitScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ToolkitScriptManager>
            <asp:AutoCompleteExtender ID="AutoCompleteExtender1"
                ServiceMethod="GetCompletionList"
                CompletionInterval="1"
                EnableCaching="false"
                CompletionSetCount="1"
                TargetControlID="txtbxArea" runat="server" MinimumPrefixLength="1" FirstRowSelected="false">
            </asp:AutoCompleteExtender>
    </form>
</body>
</html>
