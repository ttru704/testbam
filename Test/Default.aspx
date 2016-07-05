<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Test.Default" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Charting" tagprefix="telerik" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Charting" tagprefix="telerik" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Charting" tagprefix="telerik" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Charting" tagprefix="telerik" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a cool and free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>
    <div class="row">
    </div>
    <div class="row">
        <telerik:RadDatePicker ID="RadDatePicker1" runat="server"></telerik:RadDatePicker>
        <telerik:RadDatePicker ID="RadDatePicker2" runat="server"></telerik:RadDatePicker>
        <asp:Button ID="Button2" runat="server" Text="View" OnClick="Button2_Click" />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource2">
            <Columns>
                <asp:BoundField DataField="Retail_Total" HeaderText="Retail_Total" SortExpression="Retail_Total" />
                <asp:BoundField DataField="Service_Total" HeaderText="Service_Total" SortExpression="Service_Total" />
                <asp:BoundField DataField="Total_sales" HeaderText="Total_sales" SortExpression="Total_sales" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetTotalSale" TypeName="Test.BLL.GetTotalSaleBL">
            <SelectParameters>
                <asp:ControlParameter ControlID="RadDatePicker1" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                <asp:ControlParameter ControlID="RadDatePicker2" Name="end" PropertyName="SelectedDate" Type="DateTime" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
        <br />
        <br />
    </div>
    <div class="row">
        <telerik:RadDatePicker ID="RadDatePickerStart" runat="server"></telerik:RadDatePicker>
        <telerik:RadDatePicker ID="RadDatePickerEnd" runat="server"></telerik:RadDatePicker>
        <asp:Button ID="Button3" runat="server" Text="View" OnClick="Button3_Click" />
        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="ObjectDataSource3" AllowPaging="True" BorderColor="#00C0C0" PageSize="2" >
            <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView DataSourceID="ObjectDataSource3" AutoGenerateColumns="False">
                <Columns>
                    <telerik:GridBoundColumn DataField="Retail_Total" DataType="System.Decimal" FilterControlAltText="Filter Retail_Total column" HeaderText="Retail_Total" SortExpression="Retail_Total" UniqueName="Retail_Total">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Service_Total" DataType="System.Decimal" FilterControlAltText="Filter Service_Total column" HeaderText="Service_Total" SortExpression="Service_Total" UniqueName="Service_Total">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Total_sales" DataType="System.Decimal" FilterControlAltText="Filter Total_sales column" HeaderText="Total_sales" SortExpression="Total_sales" UniqueName="Total_sales">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>

        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="GetTotalSale" TypeName="Test.BLL.GetTotalSaleBL">
            <SelectParameters>
                <asp:ControlParameter ControlID="RadDatePickerStart" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                <asp:ControlParameter ControlID="RadDatePickerEnd" Name="end" PropertyName="SelectedDate" Type="DateTime" />
            </SelectParameters>
        </asp:ObjectDataSource>


    <br />
    <telerik:RadDatePicker ID="NumberOfNewClientsStartDate" runat="server">
    </telerik:RadDatePicker>
    <telerik:RadDatePicker ID="NumberOfNewClientsStartEnd" runat="server">
    </telerik:RadDatePicker>
    <asp:DropDownList ID="DropDownListNewClientsBranch" runat="server" Width="58px" >
        <asp:ListItem> 1 </asp:ListItem>
        <asp:ListItem> 2 </asp:ListItem>
        <asp:ListItem> 3 </asp:ListItem>
    </asp:DropDownList>
  <asp:DropDownList ID="DropDownListNewClientsYearMonth" runat="server" Width="99px">
                <asp:ListItem Value="1"> Monthly </asp:ListItem>
                <asp:ListItem Value="2"> Yearly </asp:ListItem>
            </asp:DropDownList>


    <br />


        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource4">
            <Columns>
                <asp:BoundField DataField="YearMonth" HeaderText="YearMonth" SortExpression="YearMonth" />
                <asp:BoundField DataField="Number_of_New_Clients" HeaderText="Number_of_New_Clients" SortExpression="Number_of_New_Clients" />
            </Columns>
        </asp:GridView>




        <br />
        <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" SelectMethod="GetNumberOfNewClients" TypeName="Test.BLL.NumberOfNewClientsBL">
            <SelectParameters>
                <asp:ControlParameter ControlID="NumberOfNewClientsStartDate" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                <asp:ControlParameter ControlID="NumberOfNewClientsStartEnd" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                <asp:ControlParameter ControlID="DropDownListNewClientsBranch" Name="branchRef" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownListNewClientsYearMonth" Name="TimeType" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>



        <asp:Button ID="Button4" runat="server" Text="Button" />










    </div>
    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>
</asp:Content>

