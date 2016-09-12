<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ECompanyCS.ascx.cs" Inherits="Test.ECompanyCS" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<div class="demo-container size-thin">
    <telerik:RadPanelBar RenderMode="Lightweight" runat="server" ID="RadPanelBar1" Width="100%" Skin="MetroTouch">
        <Items>
            <%--Number of Customers Seen By Employee - Company--%>
            <telerik:RadPanelItem Text="Number of Customers Seen by Employee - Company" Visible="false" Expanded="False">
                <ContentTemplate>
                    <%--Export button--%>
                    <telerik:RadButton RenderMode="Lightweight" runat="server" ID="RadButton1" OnClientClicked="exportRadHtmlChart" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                    <telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"></telerik:RadClientExportManager>
                    <%--Chart--%>
                    <telerik:RadHtmlChart ID="CustomersSeenByEmployeeCompanyRHC1" Width="100%" runat="server" CssClass="MonthlyExport" Skin="Material">
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
                                <telerik:GridBoundColumn DataField="Number_Of_Customers_Seen_By_An_Employee" DataType="System.Decimal" FilterControlAltText="Filter Number_Of_Customers_Seen_By_An_Employee column" HeaderText="Number Of Customers Seen" SortExpression="Number_Of_Customers_Seen_By_An_Employee" UniqueName="Number_Of_Customers_Seen_By_An_Employee">
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
            <%--Number of Animal Seen By Employee - Company--%>
            <telerik:RadPanelItem Text="Number of Animals Seen by Employee - Company" Visible="false" Expanded="false">
                <ContentTemplate>
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
                                <telerik:GridBoundColumn DataField="Number_Of_Animals_Seen_By_An_Employee" DataType="System.Decimal" FilterControlAltText="Filter Number_Of_Animals_Seen_By_An_Employee column" HeaderText="Number Of Animals Seen" SortExpression="Number_Of_Animals_Seen_By_An_Employee" UniqueName="Number_Of_Animals_Seen_By_An_Employee">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--Average Number of Customers Seen by Employee - Company--%>
            <telerik:RadPanelItem Text="Average Customers Seen by Employee - Company" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <telerik:RadHtmlChart ID="AvgCustomersSeenByEmployeeCompanyRHC1" runat="server"></telerik:RadHtmlChart>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="AvgCustomersSeenByEmployeeCompanyODS1" runat="server" SelectMethod="usp_AvgCustomersSeenByEmployeeCompany" TypeName="Test.BLL.Productivity.AvgCustomersSeenByEmployeeCompanyBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="&#39;2015-01-01&#39;" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="&#39;2015-12-31&#39;" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:Parameter DefaultValue="1" Name="companyRef" Type="Int32"></asp:Parameter>
                            <asp:SessionParameter SessionField="Time" DefaultValue="2" Name="timeType" Type="Int32"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <telerik:RadGrid ID="AvgCustomersSeenByEmployeeCompanyG1" runat="server" DataSourceID="AvgCustomersSeenByEmployeeCompanyODS1" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True">
                        <ClientSettings AllowDragToGroup="True" AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True"></Selecting>
                        </ClientSettings>

                        <MasterTableView DataSourceID="AvgCustomersSeenByEmployeeCompanyODS1" AutoGenerateColumns="False" AllowPaging="False" AllowSorting="False">
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod" FilterControlAltText="Filter TimePeriod column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Number_Of_Customers_Seen_By_An_Employee" HeaderText="Number Of Customers Seen" SortExpression="Number_Of_Customers_Seen_By_An_Employee" UniqueName="Number_Of_Customers_Seen_By_An_Employee" DataType="System.Decimal" FilterControlAltText="Filter Number_Of_Customers_Seen_By_An_Employee column"></telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--Average Number of Animals Seen by Employee - Company--%>
            <telerik:RadPanelItem Text="Average Animals Seen by Employee - Company" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <telerik:RadHtmlChart ID="AvgAnimalsSeenByEmployeeCompanyRHC1" runat="server"></telerik:RadHtmlChart>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="AvgAnimalsSeenByEmployeeCompanyODS1" runat="server" SelectMethod="usp_AvgAnimalsSeenByEmployeeCompany" TypeName="Test.BLL.Productivity.AvgAnimalsSeenByEmployeeCompanyBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="&#39;2015-01-01&#39;" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="&#39;2015-12-31&#39;" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:Parameter DefaultValue="1" Name="companyRef" Type="Int32"></asp:Parameter>
                            <asp:SessionParameter SessionField="Time" DefaultValue="2" Name="timeType" Type="Int32"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <telerik:RadGrid ID="AvgAnimalsSeenByEmployeeCompanyG1" runat="server" DataSourceID="AvgAnimalsSeenByEmployeeCompanyODS1" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True">
                        <ClientSettings AllowDragToGroup="True" AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True"></Selecting>
                        </ClientSettings>

                        <MasterTableView DataSourceID="AvgAnimalsSeenByEmployeeCompanyODS1" AutoGenerateColumns="False">
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod" FilterControlAltText="Filter TimePeriod column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Average_Number_Of_Animals_Seen_By_Employee" HeaderText="Average Number Of Animals Seen" SortExpression="Average_Number_Of_Animals_Seen_By_Employee" UniqueName="Average_Number_Of_Animals_Seen_By_Employee" DataType="System.Decimal" FilterControlAltText="Filter Average_Number_Of_Animals_Seen_By_Employee column"></telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--Income by Employee - Company--%>
            <telerik:RadPanelItem Text="Income by Employee - Company" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <telerik:RadButton RenderMode="Lightweight" runat="server" ID="RadButton2" OnClientClicked="exportRadHtmlChart" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                    <telerik:RadHtmlChart ID="IncomeByEmployeeCompanyRHC1" runat="server"></telerik:RadHtmlChart>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="IncomeByEmployeeCompanyODS1" runat="server" SelectMethod="usp_IncomeByEmployeeCompany" TypeName="Test.BLL.Productivity.IncomeByEmployeeCompanyBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="2015-01-01" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="&#39;2015-12-31&#39;" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:Parameter DefaultValue="1" Name="companyRef" Type="Int32"></asp:Parameter>
                            <asp:SessionParameter SessionField="Time" DefaultValue="2" Name="timeType" Type="Int32"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <telerik:RadGrid ID="IncomeByEmployeeCompanyG1" runat="server" DataSourceID="IncomeByEmployeeCompanyODS1" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True">
                        <ClientSettings AllowDragToGroup="True" AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True"></Selecting>
                        </ClientSettings>

                        <MasterTableView DataSourceID="IncomeByEmployeeCompanyODS1" AutoGenerateColumns="False">
                            <Columns>
                                <telerik:GridBoundColumn DataField="Employee_Name" HeaderText="Employee" SortExpression="Employee_Name" UniqueName="Employee_Name" FilterControlAltText="Filter Employee_Name column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TimePeriod" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod" FilterControlAltText="Filter TimePeriod column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Income_By_Employee" HeaderText="Income" SortExpression="Income_By_Employee" UniqueName="Income_By_Employee" DataType="System.Decimal" FilterControlAltText="Filter Income_By_Employee column"></telerik:GridBoundColumn>
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
        $find('<%=RadClientExportManager1.ClientID%>').exportPDF($("#CustomersSeenByEmployeeCompanyRHC1"));
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
