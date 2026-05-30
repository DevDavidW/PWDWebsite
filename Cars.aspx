<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cars.aspx.cs" Inherits="Cars" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title><asp:Literal ID="PWDTitle" runat="server" Text="<%$ appSettings:Title %>"></asp:Literal></title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link rel="stylesheet" href="Content/bootstrap.min.css" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid" style="color:#333333;background-color:#E9ECF1;font-weight:bold;font-size:large;font-family:Arial">
            Current Race Details:
            <span style="margin-left: 20px">
                <asp:LinkButton ID="LinkButton1" runat="server">Reload</asp:LinkButton>
            </span>
        </div>

        <div class="container-fluid" style="margin-bottom:20px;">
            <asp:DetailsView ID="DetailsView1" runat="server" Width="324px" AutoGenerateRows="False" DataSourceID="PinewoodRace" Font-Bold="False" GridLines="None" HorizontalAlign="Left" HeaderStyle-Width="120px">
                <Fields>
                    <asp:BoundField DataField="RaceName" HeaderText="Race Name" SortExpression="RaceName" >
                    <HeaderStyle Width="120px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="RaceDate" HeaderText="Race Date" SortExpression="RaceDate" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="RaceType" HeaderText="Race Type" SortExpression="RaceType" />
                    <asp:BoundField DataField="CurrentRound" HeaderText="Current Round" SortExpression="CurrentRound" />
                </Fields>
            </asp:DetailsView>
            <asp:AccessDataSource ID="PinewoodRace" runat="server" DataFile="<%$ appSettings:PinewoodDB %>" SelectCommand="SELECT tblRaces.RaceName, tblRaces.RaceDate, tblRaces.RaceType, tblConfig.CurrentRound FROM tblRaces INNER JOIN tblConfig ON tblRaces.ID = tblConfig.CurrentRaceID"></asp:AccessDataSource>
        </div>
        <br />

        <div class="container-fluid" style="margin-top: 20px;">
            <a href="Race.aspx">View Current Race Information</a>
        </div>

        <div class="container-fluid" style="color:#333333;background-color:#E9ECF1;font-weight:bold;font-size:large;font-family:Arial;margin-top: 50px"><span>Select Car:</span>
        
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="PinewoodRacers" DataTextField="Name" DataValueField="RacerID" AppendDataBoundItems="true" ForeColor="#333333" Font-Size="Large" AutoPostBack="True">
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            <asp:AccessDataSource ID="PinewoodRacers" runat="server" DataFile="<%$ appSettings:PinewoodDB %>" SelectCommand="SELECT [Name], [RacerID] FROM [qryRacers] ORDER BY [Name]">
            </asp:AccessDataSource>

        </div>

        <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="container-fluid" style="color:#333333;background-color:#E9ECF1;font-weight:bold;font-size:large;font-family:Arial;float:left;">Car Race Times:
                <br />
                <span style="font-size:medium">(Click heading to sort)</span>

            </div>

            <div class="container-fluid" style="float: left;">

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  AllowSorting="true" DataSourceID="PinewoodHeats" CellPadding="4" ForeColor="#333333" GridLines="None" Font-Names="Arial" Font-Size="Larger">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="Round" HeaderText="Round" SortExpression="Round" />
                            <asp:BoundField DataField="Heat" HeaderText="Heat" SortExpression="Heat" />
                            <asp:BoundField DataField="Lane" HeaderText="Lane" SortExpression="Lane" />
                            <asp:BoundField DataField="RunTime" HeaderText="RunTime" SortExpression="RunTime" DataFormatString="{0:0.000}" />
                        </Columns>
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="False" ForeColor="White" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />

                    </asp:GridView>

                <asp:AccessDataSource ID="PinewoodHeats" runat="server" DataFile="<%$ appSettings:PinewoodDB %>" SelectCommand="SELECT qryHeats.Car, qryHeats.Name, qryHeats.Round, qryHeats.Heat, qryHeats.Lane, qryHeats.RunTime FROM (qryHeats INNER JOIN tblConfig ON qryHeats.RaceID = tblConfig.CurrentRaceID) WHERE (qryHeats.RacerID = ?) ORDER BY qryHeats.Round, qryHeats.RunTime">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="?" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:AccessDataSource>

            </div>

            <div class="container-fluid" style="margin-top:20px;float:left;">
                <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" />
                <span style="color:#333333;font-weight:bold;font-size:large;font-family: Arial">Enable Auto-Refresh</span>
                <asp:Timer ID="Timer1" runat="server" Interval="5000" OnTick="Timer1_Tick" Enabled="False"></asp:Timer>
            </div>

        </ContentTemplate>
        </asp:UpdatePanel>

    </form>

    <script src="Scripts/jquery-3.0.0.slim.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>

</body>
</html>
