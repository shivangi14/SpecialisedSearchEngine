<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" EnableEventValidation="false"  Inherits="Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   
    <meta charset="utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>

	<title>Specialized Search Engine</title>

	<link href="css/bootstrap.min.css" rel="stylesheet"/>
	<link href="css/style.css" rel="stylesheet"/>
	<link href="css/foxy.css" rel="stylesheet"/>

	<script src="https://maps.googleapis.com/maps/api/js"></script>
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="bootstrap.js"></script>
</head>


<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-default navbar-static-top navbar-inverse" role="navigation">
		<div class="navbar-header"><img src="images/SSE_logo.png" width="150"/>
		</div>
	</nav>
   	<header class="image-bg-fluid-height">

		<!-- Page Content -->
		<div class="container" style="padding-top:100px;">

			<div class="col-md-12 portfolio-item" >
				<h3><center>Admin Log-In.<center></h3>
				<div class="row" style="margin-top:20px">
					<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
						<form role="form" class="my_form">
							<fieldset>

								<hr class="colorgraph">
								<div class="form-group my_form-group">
									<asp:TextBox ID="txtboxUserName" placeholder="Username" class="form-control input-lg" runat="server"></asp:TextBox>
								</div>

								<div class="form-group">
                                    <asp:TextBox ID="txtbxAdminPassword" placeholder="Password" runat="server"  class="form-control input-lg" TextMode="Password"></asp:TextBox>
								</div>

								<hr class="colorgraph"/>
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-12">
                                        <asp:Button ID="Button1" runat="server" onclick="btnAdmin_Click" Text="Sign In" class="btn btn-lg btn-success btn-block" CausesValidation="False" />
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->
	</header>

	<!--FOOTER BEGINS------------------------------------------>
	<div class="navbar-custom navbar-inverse navbar-static-bottom" role="navigation">
		<footer>
			<div id="footer_wrap">

				<div id="coll" class="col-md-3 portfolio-item" style="text-align: center;">
					<br/><p><b>©2015 Specialized Search Engine.</b></p>
				</div>

				<div id="colr" class="col-md-6 portfolio-item" style="text-align: center; font-size: 20px;">
					<p><b>Ghaziabad Development Authority, Ghaziabad</b></p>
				</div>
				<div id="colr" class="col-md-3 portfolio-item" style="text-align: center;">
					<br/><p><b>Powered By:Software Incubator</b></p>
				</div>
			</div>
		</footer>
	</div>
	<!---FOOTER ENDS------------------------------------------>

    </form>
</body>
</html>
