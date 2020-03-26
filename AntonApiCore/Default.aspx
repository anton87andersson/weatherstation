<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AntonApiCore.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Weather :: Temp</title>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <link href="css/App.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <h1>Temps</h1>
            <p>Simple temprature from API</p>
            <div class="row">
                <div class="col"></div>
                <div class="col">Select City <br />
                    <asp:DropDownList ID="CityDropDownList" runat="server" CssClass="form-control">
                        <asp:ListItem>Stockholm</asp:ListItem>
                        <asp:ListItem>Göteborg</asp:ListItem>
                        <asp:ListItem>Malmö</asp:ListItem>
                        <asp:ListItem>Växjö</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:Button ID="SelectCityBtn" runat="server" CssClass="btn btn-success" Text="Select City" OnClick="SelectCityBtn_Click" />
                    
                    <div runat="server" id="errorBox" visible="false" class="alert alert-danger error_box">
                        <strong>Error!</strong> Cant get data from API.

                    </div>
                
                <hr />
                <br />
                <div id="weatherDiv">
                    <table class="table_temps">
                        <tr>
                            <td>City Selected</td>
                            <td> <asp:Label ID="CityLabel" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Todays date:</td>
                            <td> <asp:Label ID="TodaysDateLabel" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Temprature:</td>
                            <td> <asp:Label ID="TempLabel" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>

                </div>
                <div class="col">

                </div>

            </div>

        </div>
    </form>
</body>
</html>
