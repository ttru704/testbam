<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FBranchCS.ascx.cs" Inherits="Test.FBranchCS" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<div class="demo-container size-thin">
    <telerik:RadPanelBar RenderMode="Lightweight" runat="server" ID="RadPanelBar1" Width="100%" Skin="MetroTouch">
        <Items>
            <%--This section is for Total Sales Branch Comparison--%>
            <telerik:RadPanelItem Text="Total Sales - Branch Comparison" Visible="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <telerik:RadHtmlChart ID="TotalSalesBranchRHC1" runat="server" Skin="Metro">
                        <ClientEvents OnLoad="chartLoad" />
                        <Pan Enabled="true" Lock="Y" />
                        <Zoom Enabled="true">
                            <MouseWheel Enabled="true" Lock="Y" />
                            <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                        </Zoom>
                    </telerik:RadHtmlChart>
                    <%--DataSource--%>
                    <asp:ObjectDataSource ID="TotalSalesBranchODS1" runat="server" SelectMethod="usp_TotalSalesBranch" TypeName="Test.BLL.Financial.TotalSalesBranchBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015/04/01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015/09/01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="CompanyDDL1" PropertyName="SelectedValue" DefaultValue="1" Name="companyRef" Type="Int32"></asp:ControlParameter>
                            <asp:ControlParameter ControlID="BranchDDL1" DefaultValue="0" Name="branchRef" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="TimeDDL1" Name="timeType" PropertyName="SelectedValue" Type="Int32" DefaultValue="1" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <telerik:RadGrid ID="TotalSalesBranchG1" runat="server" DataSourceID="TotalSalesBranchODS1" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True" Skin="Bootstrap">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="False" DataSourceID="TotalSalesBranchODS1">
                            <Columns>
                                <telerik:GridBoundColumn DataField="Branch_Name" FilterControlAltText="Filter Branch_Name column" HeaderText="Branch Name" SortExpression="Branch_Name" UniqueName="Branch_Name">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Total_Sales" DataFormatString="{0:N0}" DataType="System.Decimal" FilterControlAltText="Filter Total_Sales column" HeaderText="Total Sales" SortExpression="Total_Sales" UniqueName="Total_Sales">
                                </telerik:GridBoundColumn>

                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Average Per Transaction Branch Comparison--%>
            <telerik:RadPanelItem Text="Average Dollar per Transaction - Branch Comparison" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <telerik:RadHtmlChart ID="AvgDollarPerTransactionBranchRHC1" runat="server" Skin="Metro">
                        <Pan Enabled="true" Lock="Y" />
                        <ChartTitle Text="Average Dollar Earned Per Transaction">
                        </ChartTitle>
                        <PlotArea>
                            <XAxis BaseUnit="Months">
                            </XAxis>
                        </PlotArea>
                        <Zoom Enabled="true">
                            <MouseWheel Enabled="true" Lock="Y" />
                            <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                        </Zoom>
                    </telerik:RadHtmlChart>
                    <%--Table--%>
                    <telerik:RadGrid ID="RadGrid1" RenderMode="Lightweight" runat="server" DataSourceID="AvgDollarPerTransactionBranchODS1" CellSpacing="-1" GridLines="Both"
                        AllowSorting="True" AllowPaging="True" OnNeedDataSource="RadGrid1_NeedDataSource" Skin="Bootstrap" ShowGroupPanel="True">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="False" DataSourceID="AvgDollarPerTransactionBranchODS1" AllowFilteringByColumn="True">
                            <Columns>
                                <telerik:GridBoundColumn DataField="Branch_Name" FilterControlAltText="Filter Branch_Name column" HeaderText="Branch" SortExpression="Branch_Name" UniqueName="Branch_Name">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Average_Dollar_per_Transaction" DataFormatString="{0:N0}" DataType="System.Decimal"
                                    FilterControlAltText="Filter Average_Dollar_per_Transaction column" HeaderText="Average Dollar per Transaction"
                                    SortExpression="Average_Dollar_per_Transaction" UniqueName="Average_Dollar_per_Transaction">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>

                        <FilterMenu RenderMode="Lightweight"></FilterMenu>

                        <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                    </telerik:RadGrid>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="AvgDollarPerTransactionBranchODS1" runat="server" SelectMethod="usp_AvgDollarPerTransactionBranch" TypeName="Test.BLL.Financial.AvgDollarPerTransactionBranchBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                            <asp:Parameter DefaultValue="0" Name="branchRef" Type="Int32" />
                            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Number of Transactions excluding Zero Total Bills branch comparison --%>
            <telerik:RadPanelItem Text="Number of Transactions excluding zero total bills - Branch Comparison" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <telerik:RadHtmlChart ID="TransExcludeZeroTotalBranchRHC1" runat="server" Skin="Material"></telerik:RadHtmlChart>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="TransExcludeZeroTotalBranchODS1" runat="server" SelectMethod="usp_TransExcludeZeroTotalBranch" TypeName="Test.BLL.Financial.TransExcludeZeroTotalBranchBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="BranchDDL1" DefaultValue="0" Name="branchRef" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <telerik:RadGrid ID="TransExcludeZeroTotalBranchG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="TransExcludeZeroTotalBranchODS1" ShowGroupPanel="True" Skin="Bootstrap">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="False" DataSourceID="TransExcludeZeroTotalBranchODS1">
                            <Columns>
                                <telerik:GridBoundColumn DataField="Branch_Name" FilterControlAltText="Filter Branch_Name column" HeaderText="Branch" SortExpression="Branch_Name" UniqueName="Branch_Name">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="No_of_transactions_excluding_zero_total_bill" DataType="System.Decimal" FilterControlAltText="Filter No_of_transactions_excluding_zero_total_bill column" HeaderText="No of Transactions excluding Zero Total Bills" SortExpression="No_of_transactions_excluding_zero_total_bill" UniqueName="No_of_transactions_excluding_zero_total_bill">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Retail Only Sales branch comparison chart--%>
            <telerik:RadPanelItem Text="Retail Only Sales - Branch Comparison" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <telerik:RadHtmlChart ID="RetailOnlySalesBranchRHC1" runat="server" Skin="Metro"></telerik:RadHtmlChart>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="RetailOnlySalesBranchODS1" runat="server" SelectMethod="usp_RetailOnlySalesBranch" TypeName="Test.BLL.Financial.RetailOnlySalesBranchBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                            <asp:Parameter DefaultValue="0" Name="branchRef" Type="Int32" />
                            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <telerik:RadGrid ID="RetailOnlySalesBranchG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="RetailOnlySalesBranchODS1" ShowGroupPanel="True" Skin="Bootstrap">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="False" DataSourceID="RetailOnlySalesBranchODS1">
                            <Columns>
                                <telerik:GridBoundColumn DataField="Branch_Name" FilterControlAltText="Filter Branch_Name column" HeaderText="Branch" SortExpression="Branch_Name" UniqueName="Branch_Name">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Retail_Total_Only" DataType="System.Decimal" DataFormatString="{0:N0}" FilterControlAltText="Filter Retail_Total_Only column" HeaderText="Retail Total Only" SortExpression="Retail_Total_Only" UniqueName="Retail_Total_Only">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Service Only Sales branch comparison chart--%>
            <telerik:RadPanelItem Text="Service Only Sales - Branch Comparison" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <telerik:RadHtmlChart ID="ServiceOnlySalesBranchRHC1" runat="server" Skin="Metro"></telerik:RadHtmlChart>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="ServiceOnlySalesBranchODS1" runat="server" SelectMethod="usp_ServiceOnlySalesBranch" TypeName="Test.BLL.Financial.ServiceOnlySalesBranchBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                            <asp:Parameter DefaultValue="0" Name="branchRef" Type="Int32" />
                            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <telerik:RadGrid ID="ServiceOnlySalesBranchG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="ServiceOnlySalesBranchODS1" ShowGroupPanel="True" Skin="Bootstrap">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="False" DataSourceID="ServiceOnlySalesBranchODS1">
                            <Columns>
                                <telerik:GridBoundColumn DataField="Branch_Name" FilterControlAltText="Filter Branch_Name column" HeaderText="Branch" SortExpression="Branch_Name" UniqueName="Branch_Name">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Service_Total_Only" DataType="System.Decimal" DataFormatString="{0:N0}" FilterControlAltText="Filter Service_Total_Only column" HeaderText="Service Total Only" SortExpression="Service_Total_Only" UniqueName="Service_Total_Only">
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
