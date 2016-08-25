<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ECompanyCS.ascx.cs" Inherits="Test.ECompanyCS" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<div class="demo-container size-thin">
    <telerik:RadPanelBar RenderMode="Lightweight" runat="server" ID="RadPanelBar1" Width="100%" Skin="MetroTouch">
        <Items>
            <telerik:RadPanelItem Text="Number of Customers Seen By Employee" Expanded="False">
                <ContentTemplate>
                    <%--Number of Customers Seen By Employee--%>
                    <%--Export button--%>
                    <telerik:RadButton RenderMode="Lightweight" runat="server" OnClientClicked="exportRadHtmlChart" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                    <telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"></telerik:RadClientExportManager>
                    <%--Chart--%>
                    <telerik:RadHtmlChart ID="CustomersSeenByEmployeeCompanyRHC1" Width="100%" class="chart" runat="server" CssClass="MonthlyExport" Skin="Material">
                    </telerik:RadHtmlChart>
                    <%--Table--%>
                    <telerik:RadGrid ID="CustomersSeenByEmployeeCompanyG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="CustomersSeenByEmployeeCompanyODS1" ShowGroupPanel="True" Skin="Metro">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="False" DataSourceID="CustomersSeenByEmployeeCompanyODS1">
                            <Columns>
                                <telerik:GridBoundColumn DataField="Employee_Name" FilterControlAltText="Filter Employee_Name column" HeaderText="Employee" SortExpression="Employee_Name" UniqueName="Employee_Name">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Number_Of_Customers_Seen_By_An_Employee" DataFormatString="{0:N0}" DataType="System.Int32" FilterControlAltText="Filter Number_Of_Customers_Seen_By_An_Employee column" HeaderText="Number Of Customers Seen" SortExpression="Number_Of_Customers_Seen_By_An_Employee" UniqueName="Number_Of_Customers_Seen_By_An_Employee">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="CustomersSeenByEmployeeCompanyODS1" runat="server" SelectMethod="usp_CustomersSeenByEmployeeCompany" TypeName="Test.BLL.Productivity.CustomersSeenByEmployeeCompanyBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-01-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-12-31" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="2" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <telerik:RadPanelItem Text="Number of Animal Seen By Employee" Expanded="false">
                <ContentTemplate>
                    <%--Number of Animal Seen By Employee--%>
                    <%--Chart--%>
                    <telerik:RadHtmlChart ID="AnimalsSeenByEmployeeCompanyRHC1" runat="server" Skin="MetroTouch"></telerik:RadHtmlChart>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="AnimalsSeenByEmployeeCompanyODS1" runat="server" SelectMethod="usp_AnimalsSeenByEmployeeCompany" TypeName="Test.BLL.Productivity.AnimalsSeenByEmployeeCompanyBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-01-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-12-31" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="2" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <telerik:RadGrid ID="AnimalsSeenByEmployeeCompanyG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="AnimalsSeenByEmployeeCompanyODS1" ShowGroupPanel="True" Skin="Metro">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="False" DataSourceID="AnimalsSeenByEmployeeCompanyODS1">
                            <Columns>
                                <telerik:GridBoundColumn DataField="Employee_Name" FilterControlAltText="Filter Employee_Name column" HeaderText="Employee" SortExpression="Employee_Name" UniqueName="Employee_Name">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Number_Of_Animals_Seen_By_An_Employee" DataFormatString="{0:N0}" DataType="System.Int32" FilterControlAltText="Filter Number_Of_Animals_Seen_By_An_Employee column" HeaderText="Number of Animals Seen" SortExpression="Number_Of_Animals_Seen_By_An_Employee" UniqueName="Number_Of_Animals_Seen_By_An_Employee">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
        </Items>
        <ExpandAnimation Type="None" />
        <CollapseAnimation Type="None" />
    </telerik:RadPanelBar>
</div>
<script>
    var $ = $telerik.$;

    function exportRadHtmlChart() {
        $find('<%=RadClientExportManager1.ClientID%>').exportPDF($(".MonthlyExport"));
        };
    <%--For panning and zooming--%>
    (function (global) {
        var chart;

        function ChartLoad(sender, args) {
            chart = sender.get_kendoWidget(); //store a reference to the Kendo Chart widget, we will use its methods
        }

        global.chartLoad = ChartLoad;

        function resizeChart() {
            if (chart)
                chart.resize(); //redraw the chart so it takes the new size of its container when it changes (e.g., browser window size change, parent container size change)
        }


        //this logic ensures that the chart resizing will happen only once, at most - every 200ms
        //to prevent calling the handler too often if old browsers fire the window.onresize event multiple times
        var TO = false;
        window.onresize = function () {
            if (TO !== false)
                clearTimeout(TO);
            TO = setTimeout(resizeChart, 200);
        }

    })(window);
    <%--For panning and zooming--%>

        <%--For responsive chart--%>
    (function (global) {
        var chart;

        function ChartLoad(sender, args) {
            chart = sender.get_kendoWidget(); //store a reference to the Kendo Chart widget, we will use its methods
        }

        global.chartLoad = ChartLoad;

        function resizeChart() {
            if (chart)
                chart.resize(); //redraw the chart so it takes the new size of its container when it changes (e.g., browser window size change, parent container size change)
        }


        //this logic ensures that the chart resizing will happen only once, at most - every 200ms
        //to prevent calling the handler too often if old browsers fire the window.onresize event multiple times
        var TO = false;
        window.onresize = function () {
            if (TO !== false)
                clearTimeout(TO);
            TO = setTimeout(resizeChart, 200);
        }

    })(window);
    <%--For responsive chart--%>
</script>
