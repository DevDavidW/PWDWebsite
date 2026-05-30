<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Race.aspx.cs" Inherits="Race" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title><asp:Literal ID="PWDTitle" runat="server" Text="<%$ appSettings:Title %>"></asp:Literal></title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
	<style>
		.larger td {
			font-size: 25px;
		}
	</style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>

        <div class="container-fluid" style="color:#333333;background-color:#E9ECF1;font-weight:bold;font-size:large;font-family:Arial">
            Current Race Details:
            <span style="margin-left: 50px">
                <asp:LinkButton ID="LinkButton1" runat="server">Reload</asp:LinkButton>
				<span style="color:#333333;font-weight:bold;font-size:large;font-family: Arial; margin-left: 50px">Enable Auto-Refresh:
				<asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" /></span>
				<asp:Timer ID="Timer1" runat="server" Interval="2000" OnTick="Timer1_Tick" Enabled="False"></asp:Timer>
            </span>
        </div>

        <div class="container-fluid" style="margin-bottom:20px">
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="PinewoodRace" Font-Bold="False" GridLines="None" HorizontalAlign="Left" HeaderStyle-Width="120px">
                <Fields>
                    <asp:BoundField DataField="RaceName" HeaderText="Race Name" SortExpression="RaceName" HeaderStyle-Width="200" />
                    <asp:BoundField DataField="RaceDate" HeaderText="Race Date" SortExpression="RaceDate" DataFormatString="{0:d}" />
                    <%-- <asp:BoundField DataField="RaceType" HeaderText="Race Type" SortExpression="RaceType" /> --%>
                    <asp:BoundField DataField="CurrentRound" HeaderText="Current Round" SortExpression="CurrentRound" />
                </Fields>
            </asp:DetailsView>
            <asp:AccessDataSource ID="PinewoodRace" runat="server" DataFile="<%$ appSettings:PinewoodDB %>" SelectCommand="SELECT tblRaces.RaceName, tblRaces.RaceDate, tblRaces.RaceType, tblConfig.CurrentRound FROM tblRaces INNER JOIN tblConfig ON tblRaces.ID = tblConfig.CurrentRaceID"></asp:AccessDataSource>
        </div>
        <br />
        <br />
		<br />
		
        <div class="container-fluid" style="color:#333333;background-color:#E9ECF1;font-weight:bold;font-size:large;font-family:Arial;">Current Racers:<br />
            <span style="font-size:medium">(Click heading to sort)</span></div>

        <div class="container-fluid">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  AllowSorting="true" DataSourceID="CurrentHeat" CellPadding="6" ForeColor="#333333" GridLines="None" Font-Names="Arial" Font-Size="20px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Lane" HeaderText="Lane" SortExpression="Lane" ItemStyle-Width="60" />
                        <asp:BoundField DataField="Car" HeaderText="Car" SortExpression="Car" ItemStyle-Width="60" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ItemStyle-Width="300" />
                        <asp:BoundField DataField="RunTime" HeaderText="Time" SortExpression="RunTime" DataFormatString="{0:0.000}" ItemStyle-Width="80" />
                        <asp:BoundField DataField="Place" HeaderText="Place" SortExpression="Place" ItemStyle-Width="60" />
                        <asp:BoundField DataField="Speed" HeaderText="Speed (MPH)" SortExpression="Speed" ItemStyle-Width="150" />
                    </Columns>
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="False" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />

                </asp:GridView>

            <asp:AccessDataSource ID="CurrentHeat" runat="server" DataFile="<%$ appSettings:PinewoodDB %>" SelectCommand="SELECT tmpHeat.Lane, tblCars.Car, tblCars.Name, tmpHeat.RunTime, tmpHeat.Place, tmpHeat.Speed FROM tblCars INNER JOIN (tmpHeat INNER JOIN tblRacers ON tmpHeat.[RacerID] = tblRacers.[ID]) ON tblCars.[ID] = tblRacers.[CarID] WHERE (((tmpHeat.Type)='Current')) ORDER BY tmpHeat.Lane">
            </asp:AccessDataSource>
        </div>

        <br />

        <div class="container-fluid" style="color:#333333;background-color:#E9ECF1;font-weight:bold;font-size:large;font-family:Arial;">Up Next:<br /></div>

        <div class="container-fluid"  style="larger">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"  AllowSorting="false" DataSourceID="NextHeat" CellPadding="6" ForeColor="#333333" GridLines="None" Font-Names="Arial" Font-Size="20px" OnRowDataBound="GridView2_RowDataBound" BorderStyle="solid" BorderWidth="1">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Lane" HeaderText="Lane" ItemStyle-Width="60" />
                        <asp:BoundField DataField="Car" HeaderText="Car" ItemStyle-Width="60"/>
                        <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="300" />
                    </Columns>
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="False" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />

                </asp:GridView>

            <asp:AccessDataSource ID="NextHeat" runat="server" DataFile="<%$ appSettings:PinewoodDB %>" SelectCommand="SELECT tmpHeat.Lane, tblCars.Car, tblCars.Name FROM tmpHeat INNER JOIN (tblCars INNER JOIN tblRacers ON tblCars.ID=tblRacers.CarID) ON tmpHeat.RacerID=tblRacers.ID WHERE tmpHeat.Type='Next' ORDER BY tmpHeat.Lane">
            </asp:AccessDataSource>
        </div>

        <div class="container-fluid" style="margin-top: 20px;float: left;">
        <a href="Cars.aspx">View Single Racer Information</a>
        </div>
    </form>

    <script src="Scripts/jquery-3.0.0.slim.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>

</body>
</html>
