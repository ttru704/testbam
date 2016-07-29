<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="employeeKPI.aspx.cs" Inherits="Test.employeekpi" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="right_col" role="main">
            <div id="KPIMenu" style="text-align: center">
                <a href="/financialKPI.aspx" style="font-size: 20px"><strong>Financial</strong></a>
                <strong>|</strong>
                <a href="/employeekpi.aspx" style="font-size: 20px"><strong>Employee</strong></a>
                <strong>|</strong>
                <a href="/customerkpi.aspx" style="font-size: 20px"><strong>Customer</strong></a>
                <br />
                <br />
            </div>
            <br />
            <br />

            <br />
            <%--Here are all the controls at the top of the page--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>

            <telerik:RadDatePicker ID="DatePicker1" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-01-01"></telerik:RadDatePicker>
            <telerik:RadDatePicker ID="DatePicker2" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-12-31"></telerik:RadDatePicker>
            <asp:DropDownList ID="Company" runat="server" Width="100px">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="Branch" runat="server" AutoPostBack="True" DataTextField="Branch_Ref" DataValueField="Branch_Ref" Width="100px">
                <asp:ListItem Value="0">All Branches</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="TimeType" runat="server" Width="100px">
                <asp:ListItem Value="1"> Monthly </asp:ListItem>
                <asp:ListItem Value="2" Selected="True"> Yearly </asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" Text="View" OnClick="Button1_Click" />
            <br />
            <telerik:RadButton RenderMode="Lightweight" runat="server" OnClientClicked="exportRadHtmlChart" Text="Export RadHtmlChart to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
            <telerik:RadClientExportManager runat="server" ID="RadClientExportManager1">
            </telerik:RadClientExportManager>

            <%--Here are all the controls at the top of the page--%>

            <div class="kpiheader">Number of Customers Seen By Employee</div>
            <telerik:RadHtmlChart ID="CustomersSeenByEmpComRHC1" runat="server" CssClass="MonthlyExport">
            </telerik:RadHtmlChart>

            <asp:ObjectDataSource ID="CustomersSeenByEmpComODS1" runat="server" SelectMethod="usp_CustomersSeenByEmpCom" TypeName="Test.BLL.Productivity.CustomersSeenByEmpComBL">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-01-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-12-31" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="Company" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TimeType" DefaultValue="2" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:GridView ID="CustomersSeenByEmpComG1" Visible="False" runat="server" AutoGenerateColumns="False" DataSourceID="CustomersSeenByEmpComODS1">
                <Columns>
                    <asp:BoundField DataField="Employee_Name" HeaderText="Employee_Name" SortExpression="Employee_Name" />
                    <asp:BoundField DataField="YearMonth" HeaderText="YearMonth" SortExpression="YearMonth" />
                    <asp:BoundField DataField="Number_Of_Customers_Seen_By_An_Employee" HeaderText="Number_Of_Customers_Seen_By_An_Employee" SortExpression="Number_Of_Customers_Seen_By_An_Employee" />
                </Columns>
            </asp:GridView>

            <telerik:RadGrid RenderMode="Lightweight" ID="CustomersSeenByEmpComGV1" runat="server" DataSourceID="CustomersSeenByEmpComODS1" AllowFilteringByColumn="True" AllowSorting="True" AllowPaging="True" >
                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                <MasterTableView DataSourceID="CustomersSeenByEmpComODS1" AllowFilteringByColumn="True"  AutoGenerateColumns="False">
                    <Columns>
                        <telerik:GridBoundColumn DataField="Employee_Name" FilterControlAltText="Filter Employee_Name column" HeaderText="Employee_Name" SortExpression="Employee_Name" UniqueName="Employee_Name" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="YearMonth" DataType="System.DateTime" FilterControlAltText="Filter YearMonth column" HeaderText="YearMonth" SortExpression="YearMonth" UniqueName="YearMonth">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Number_Of_Customers_Seen_By_An_Employee" DataType="System.Int32" FilterControlAltText="Filter Number_Of_Customers_Seen_By_An_Employee column" HeaderText="Number_Of_Customers_Seen_By_An_Employee" SortExpression="Number_Of_Customers_Seen_By_An_Employee" UniqueName="Number_Of_Customers_Seen_By_An_Employee">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>

        </div>
    </form>
    <script>
        var $ = $telerik.$;

        function exportRadHtmlChart() {
            $find('<%=RadClientExportManager1.ClientID%>').exportPDF($(".MonthlyExport"));
        };



    </script>
</asp:Content>
