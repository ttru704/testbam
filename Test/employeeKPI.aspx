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

            <%--Display Number of Customers Seen by Employee--%>
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
            
           
            
            <telerik:RadGrid RenderMode="Lightweight" ID="CustomersSeenByEmpComRG1" runat="server" DataSourceID="CustomersSeenByEmpComODS1" AllowFilteringByColumn="True" AllowSorting="True" AllowPaging="True" AutoGenerateColumns="False">
                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                <MasterTableView DataSourceID="CustomersSeenByEmpComODS1" AllowFilteringByColumn="True"  AutoGenerateColumns="False">
                    <Columns>
                        <telerik:GridBoundColumn DataField="Employee_Name" FilterControlAltText="Filter Employee_Name column" HeaderText="Employee Name" SortExpression="Employee_Name" UniqueName="Employee_Name" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="YearMonth" DataType="System.DateTime" FilterControlAltText="Filter YearMonth column" HeaderText="Period" SortExpression="YearMonth" UniqueName="YearMonth">
                        </telerik:GridBoundColumn>

<%--                        <FilterTemplate>
                        <telerik:RadLabel runat="server" AssociatedControlID="FromOrderDatePicker" Text="Form"></telerik:RadLabel>
                        <telerik:RadDatePicker RenderMode="Lightweight" ID="FromOrderDatePicker" runat="server" Width="140px" ClientEvents-OnDateSelected="FromDateSelected"
                            MinDate="07-04-1996" MaxDate="05-06-1998" FocusedDate="07-04-1996" DbSelectedDate='<%# startDate %>' />
                        <telerik:RadLabel runat="server" AssociatedControlID="ToOrderDatePicker" Text="to" Style="padding-left: 5px;"></telerik:RadLabel>
                        <telerik:RadDatePicker RenderMode="Lightweight" ID="ToOrderDatePicker" runat="server" Width="140px" ClientEvents-OnDateSelected="ToDateSelected"
                            MinDate="07-04-1996" MaxDate="05-06-1998" FocusedDate="05-06-1998" DbSelectedDate='<%# endDate %>' />
                            <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                                <script type="text/javascript">
                                    function FromDateSelected(sender, args) {
                                    var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                    var ToPicker = $find('<%# ((GridItem)Container).FindControl("ToOrderDatePicker").ClientID %>');
 
                                    var fromDate = FormatSelectedDate(sender);
                                    var toDate = FormatSelectedDate(ToPicker);
 
                                    tableView.filter("OrderDate", fromDate + " " + toDate, "Between");
 
                                }
                                function ToDateSelected(sender, args) {
                                    var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                    var FromPicker = $find('<%# ((GridItem)Container).FindControl("FromOrderDatePicker").ClientID %>');
 
                                    var fromDate = FormatSelectedDate(FromPicker);
                                    var toDate = FormatSelectedDate(sender);
 
                                    tableView.filter("OrderDate", fromDate + " " + toDate, "Between");
                                }
                                function FormatSelectedDate(picker) {
                                    var date = picker.get_selectedDate();
                                    var dateInput = picker.get_dateInput();
                                    var formattedDate = dateInput.get_dateFormatInfo().FormatDate(date, dateInput.get_displayDateFormat());
 
                                    return formattedDate;
                                }
                                </script>
                            </telerik:RadScriptBlock>
                        </FilterTemplate>--%>
                        <telerik:GridBoundColumn DataField="Number_Of_Customers_Seen_By_An_Employee" DataType="System.Int32" FilterControlAltText="Filter Number_Of_Customers_Seen_By_An_Employee column" HeaderText="Number of Customers Seen by Employee" SortExpression="Number_Of_Customers_Seen_By_An_Employee" UniqueName="Number_Of_Customers_Seen_By_An_Employee">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
            <%--Display Number of Customers Seen by Employee--%>
            <div class="kpiheader">Number of Animal Seen By Employee</div>
            <telerik:RadHtmlChart ID="AnimalsSeenByEmpComRHC1" runat="server"></telerik:RadHtmlChart>
            <%--Display Number of Animals Seen by Employee--%>

            <%--Display Number of Animals Seen by Employee--%>
        </div>
    </form>
    <script>
        var $ = $telerik.$;

        function exportRadHtmlChart() {
            $find('<%=RadClientExportManager1.ClientID%>').exportPDF($(".MonthlyExport"));
        };



    </script>
</asp:Content>
