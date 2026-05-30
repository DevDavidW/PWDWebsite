<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><asp:Literal ID="PWDTitle" runat="server" Text="<%$ appSettings:Title %>"></asp:Literal> Car Registration Form</title>
    <style type="text/css">
        .cntrls {
            font-family: Arial;
            font-size: large;
        }
        .leftmargin {
            margin-left: 30px;
        }
        .cellleftpad th, .cellleftpad td {
            padding-left: 25px
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="ID" DataSourceID="PinewoodCars" 
                         DefaultMode="Insert" ForeColor="#333333" GridLines="None" Height="50px" Width="600px" Font-Names="Arial" Font-Size="Large"
                         OnDataBound="DetailsView1_DataBound">
            <Fields>
                <asp:TemplateField HeaderText="Car Number" SortExpression="Car">
                    <InsertItemTemplate>
                        <div>
                            <asp:TextBox ID="txtCar" runat="server" Text='<%# Bind("Car") %>' ValidationGroup="RequiredFields" CssClass="cntrls" Width="50px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Required" ControlToValidate="txtCar" Display="Dynamic" ValidationGroup="RequiredFields"></asp:RequiredFieldValidator>
                            <asp:LinkButton ID="getNextCarNumber" runat="server" Text="Get Next Number" OnClick="getNextCarNumber_Click" Width="150px" CssClass="leftmargin" />
                        </div>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Car Name" SortExpression="Name">
                    <InsertItemTemplate>
                        <div>
                            <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Required" ControlToValidate="txtName" Display="Dynamic" ValidationGroup="RequiredFields"></asp:RequiredFieldValidator>
                        </div>
                    </InsertItemTemplate>
                    <ControlStyle CssClass="cntrls" Width="200px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Den Name" SortExpression="Den">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="dlDen" runat="server" DataSourceID="PinewoodDens" DataTextField="Den" DataValueField="Den" SelectedValue='<%# Bind("Den") %>' Font-Names="Arial" Font-Size="Large" AppendDataBoundItems="true" >
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Required" ControlToValidate="dlDen" Display="Dynamic" ValidationGroup="RequiredFields"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" InsertText="Save and Add Car to Race" ShowCancelButton="False" ValidationGroup="RequiredFields" ControlStyle-Font-Size="Larger"  >
                    <ControlStyle Font-Size="Larger"></ControlStyle>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:CommandField>
            </Fields>
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="False" ForeColor="White" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775"  />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="False" ForeColor="White" />
        </asp:DetailsView>
        <br />
        <asp:Button ID="RefreshBtn" runat="server" OnClick="RefreshBtn_Click" Text="Refresh" Font-Names="Arial" Font-Size="Large" />
        <br />    
        <br />    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="PinewoodCars" 
                     CellPadding ="6" ForeColor="#333333" GridLines="None" Font-Names="Arial" Font-Size="Larger" CssClass="cellleftpad">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Car" HeaderText="Car Number" SortExpression="Car" ControlStyle-CssClass="cntrls" />
                <asp:BoundField DataField="Name" HeaderText="Car Name" SortExpression="Name" ControlStyle-CssClass="cntrls" />
                <asp:TemplateField HeaderText="Den Name" SortExpression="Den">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="PinewoodDens" DataTextField="Den" DataValueField="Den" SelectedValue='<%# Bind("Den") %>' Font-Names="Arial" Font-Size="Large">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Den") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="False" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="False" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>

        <asp:AccessDataSource ID="PinewoodCars" runat="server" DataFile="<%$ appSettings:PinewoodDB %>" SelectCommand="SELECT * FROM [tblCars] ORDER BY [Car] Desc" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [tblCars] WHERE [ID] = ? AND (([Car] = ?) OR ([Car] IS NULL AND ? IS NULL)) AND [Name] = ? AND [Den] = ?" InsertCommand="INSERT INTO [tblCars] ([Car], [Name], [Den]) VALUES (?, ?, ?)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [tblCars] SET [Car] = ?, [Name] = ?, [Den] = ? WHERE [ID] = ? AND (([Car] = ?) OR ([Car] IS NULL AND ? IS NULL)) AND [Name] = ? AND [Den] = ?">
            <DeleteParameters>
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_Car" Type="Int32" />
                <asp:Parameter Name="original_Car" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Den" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Car" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Den" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Car" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Den" Type="String" />
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_Car" Type="Int32" />
                <asp:Parameter Name="original_Car" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Den" Type="String" />
            </UpdateParameters>
        </asp:AccessDataSource>
    
        <asp:AccessDataSource ID="PinewoodDens" runat="server" DataFile="<%$ appSettings:PinewoodDB %>" SelectCommand="SELECT * FROM [tblDens] ORDER BY [Den]"></asp:AccessDataSource>
    
        <asp:AccessDataSource ID="PinewoodNextCar" runat="server" DataFile="<%$ appSettings:PinewoodDB %>" SelectCommand="SELECT Max([tblCars].[Car])+1 AS NextCar FROM tblCars;"></asp:AccessDataSource>
    
    </div>
    </form>
</body>
</html>
