<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="view_details.aspx.cs" Inherits="view_details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Details</title>
    <style type="text/css">
        .auto-style1 {
            width: 453px;
        }
    </style>
    <script type="text/javascript">

        var x = document.getElementById("lat_long_of_user");

        function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition);
            } else {
                x.innerHTML = "Geolocation is not supported by this browser.";
            }
        }
        var x = document.getElementById("lat_long_of_user");

        function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition);
            } else {
                x.innerHTML = "Geolocation is not supported by this browser.";
            }
        }
    </script>

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">

        <asp:HiddenField ID="hiddenfieldUserLat" runat="server" Value="" />
        <asp:HiddenField ID="hiddenfieldUserLong" runat="server" Value="" />
        <asp:HiddenField ID="hiddenfieldServiceLat" runat="server" Value="" />
        <asp:HiddenField ID="hiddenfieldServiceLong" runat="server" Value="" />
        <div>

            <nav class="navbar navbar-default navbar-static-top navbar-inverse" role="navigation">

                <div class="navbar-header my-header">
                    <img src="images/SSE_logo.png" width="150px" />
                </div>

            </nav>
            <header class="image-bg-fixed-height">


                <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&mode=walking"></script>
                <script type="text/javascript">
                    var markers = [
                        {
                            "title": 'User',
                            "lat": form1.hiddenfieldUserLat.value,
                            "lng": form1.hiddenfieldUserLong.value,
                            "description": 'User'
                        }
                    ,
                        {
                            "title": 'User',
                            "lat": form1.hiddenfieldServiceLat.value,
                            "lng": form1.hiddenfieldServiceLong.value,
                            "description": 'Service'
                        }

                    ];
                    window.onload = function () {
                        var mapOptions = {
                            center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
                            zoom: 10,
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        };
                        var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
                        var infoWindow = new google.maps.InfoWindow();
                        var lat_lng = new Array();
                        var latlngbounds = new google.maps.LatLngBounds();
                        for (i = 0; i < markers.length; i++) {
                            var data = markers[i]
                            var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                            lat_lng.push(myLatlng);
                            var marker = new google.maps.Marker({
                                position: myLatlng,
                                map: map,
                                title: data.title
                            });
                            latlngbounds.extend(marker.position);
                            (function (marker, data) {
                                google.maps.event.addListener(marker, "click", function (e) {
                                    infoWindow.setContent(data.description);
                                    infoWindow.open(map, marker);
                                });
                            })(marker, data);
                        }
                        map.setCenter(latlngbounds.getCenter());
                        map.fitBounds(latlngbounds);


                        //Intialize the Path Array
                        var path = new google.maps.MVCArray();

                        //Intialize the Direction Service
                        var service = new google.maps.DirectionsService();

                        //Set the Path Stroke Color
                        var poly = new google.maps.Polyline({ map: map, strokeColor: '#4986E7' });

                        //Loop and Draw Path Route between the Points on MAP
                        for (var i = 0; i < lat_lng.length; i++) {
                            if ((i + 1) < lat_lng.length) {
                                var src = lat_lng[i];
                                var des = lat_lng[i + 1];
                                path.push(src);
                                poly.setPath(path);
                                service.route({
                                    origin: src,
                                    destination: des,
                                    travelMode: google.maps.DirectionsTravelMode.DRIVING
                                }, function (result, status) {
                                    if (status == google.maps.DirectionsStatus.OK) {
                                        for (var i = 0, len = result.routes[0].overview_path.length; i < len; i++) {
                                            path.push(result.routes[0].overview_path[i]);
                                        }
                                    }
                                });
                            }
                        }
                    }
                </script>




                <div style="min-height: 500px; padding-top: 200px;">

                    <div class="col-md-6 col-lg-6 toppad">



                        <div class="panel panel-info" style="min-height: 350px;">
                            <div class="panel-heading">
                                <h3 class="panel-title">Service</h3>
                            </div>
                            <div class="panel-body">
                                <div class="row">


                                    <div class=" col-md-12 col-lg-12 ">

                                        <asp:Repeater ID="RepeaterDetails" runat="server">

                                            <ItemTemplate>

                                                <table class="table table-user-information">
                                                    <tbody>
                                                        <tr>
                                                            <strong>Service Details</strong>
                                                        </tr>
                                                        <tr>
                                                            <td>Service Name:</td>
                                                            <td><%#Eval("name") %></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Owner Name:</td>
                                                            <td><%#Eval("ownername") %></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Phone:</td>
                                                            <td><%#Eval("phoneNo") %></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Email:</td>
                                                            <td><%#Eval("email") %></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Address:</td>
                                                            <td><%#Eval("street1") %></td>
                                                        </tr>

                                                        <tr>
                                                            <td>Ratings</td>
                                                            <td><%#Eval("ratings") %>/5</td>
                                                        </tr>

                                                    </tbody>
                                                </table>


                                            </ItemTemplate>

                                        </asp:Repeater>
                                    </div>
                                </div>
                                <div class="panel-footer">
                                </div>

                            </div>


                        </div>
                        <br />

                    </div>
                    <div class="col-md-6 col-lg-6 toppad">
                        <div class="panel panel-info" style="min-height: 350px;">
                            <div class="panel-heading">
                                <h3 class="panel-title">Images</h3>
                            </div>
                            <asp:Repeater ID="RepeaterImage" runat="server">

                                <HeaderTemplate>
                                    <div class="panel-body row">
                                        

                                </HeaderTemplate>
                                <ItemTemplate>


                                    
                                        <div class="col-md-5" >
                                        <img alt="User Pic" src="<%#Eval("image") %>" width="230px;" />
                                        </div>

                                </ItemTemplate>
                                <FooterTemplate>
                                    </div>
                                </FooterTemplate>
                            </asp:Repeater>

                        </div>
                    </div>

                </div>

            </header>



            <div class="row">




                <div class="col-md-5 col-md-pull-2" style="background-color: white;">
                    <div class="titleBox">
                        <label>Comments</label>
                    </div>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>


                            <div class="actionBox">
                                <ul class="commentList">
                                    <li>
                                        <div class="commenterImage">
                                            <img src="images/noprofile.jpg" />
                                        </div>
                                        <div class="commentText">
                                            <p class=""><%#Eval("username_comment") %>.</p>
                                            <strong>says</strong><p><%#Eval("comment") %></p>
                                            <span class="date sub-text"><%#Eval("comment_postedat") %></span>

                                        </div>
                                    </li>
                                </ul>
                                <form class="form-inline" role="form">
                                </form>
                            </div>
                        </ItemTemplate>

                    </asp:Repeater>
                    <table>
                        <tr>

                            <td><strong>Name: </strong></td>
                            <td class="auto-style1">
                                <asp:TextBox ID="txtName" runat="server" />
                                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <br>
                        <tr>
                            <td><strong>Email: </strong></td>
                            <td class="auto-style1">
                                <asp:TextBox ID="txtbxEmail" runat="server" TextMode="Email" />
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtbxEmail" ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top"><strong>Comment:</strong></td>
                            <td class="auto-style1">
                                <asp:TextBox ID="txtComment" runat="server" Rows="5" Columns="20"
                                    TextMode="MultiLine" Width="391px" />
                                <asp:RequiredFieldValidator ID="rfvComment" runat="server" ControlToValidate="txtComment" ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="auto-style1">
                                <asp:Button ID="Button2" runat="server" Text="Submit" OnClick="Button2_Click" class="btn btn-primary" /></td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <strong>Ratings:</strong>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;<asp:Button ID="Button3" runat="server" OnClick="Button3_Click" class="btn btn-primary" Text="Give Ratings" CausesValidation="False" />

                </div>
            </div>
            <br />
            <br />
            <div class="col-md-4 col-md-offset-2" id="dvMap" style="width: 800px; height: 800px"></div>
    </form>
</body>
</html>
