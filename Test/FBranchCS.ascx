<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FBranchCS.ascx.cs" Inherits="Test.FBranchCS" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<div class="demo-container size-thin">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="BranchCB1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="BranchCB1" UpdatePanelCssClass="" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="TotalSalesBranchRHC1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="TotalSalesBranchG1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="AvgDollarPerTransactionBranchRHC1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="TransExcludeZeroTotalBranchRHC1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="TransExcludeZeroTotalBranchG1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="RetailOnlySalesBranchRHC1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="RetailOnlySalesBranchG1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="ServiceOnlySalesBranchRHC1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="ServiceOnlySalesBranchG1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
        <ClientEvents OnResponseEnd="ResponseEnd" />
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Metro"></telerik:RadAjaxLoadingPanel>
    <telerik:RadPanelBar RenderMode="Lightweight" runat="server" ID="RadPanelBar1" Width="100%" Skin="MetroTouch">
        <Items>
            <telerik:RadPanelItem Width="100%" Height="30">
                <ContentTemplate>
                    <%--Label for branch combo box--%>
                    <asp:Label ID="BranchCBLabel" runat="server" Text="Select your branch: "></asp:Label>
                    <%--Combobox for branch--%>
                    <telerik:RadComboBox RenderMode="Lightweight" ID="BranchCB1" DataTextField="Branch_Name" DataValueField="Ref_Number" runat="server" Width="186px"
                        AutoPostBack="true" EmptyMessage="- Select a Branch -" DataSourceID="BranchDropDownODS1"
                        Skin="Metro" AppendDataBoundItems="true">
                        <Items>
                            <telerik:RadComboBoxItem Value="0" Text="All Branches" Selected="true" />
                        </Items>
                    </telerik:RadComboBox>

                    <%--Objectdatasource for branch combo box--%>
                    <asp:ObjectDataSource ID="BranchDropDownODS1" runat="server" SelectMethod="usp_BranchDropDownList" TypeName="Test.BLL.Controls.BranchDropDownListBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="CompanyRef" DefaultValue="" Name="companyRef" Type="Int32"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>

                </ContentTemplate>
            </telerik:RadPanelItem>
        </Items>

        <Items>
            <%--This section is for Total Sales Branch Comparison--%>
            <telerik:RadPanelItem Text="Total Sales - Branch Comparison" Visible="false">
                <ContentTemplate>
                    <%--This export manager is for all the KPI charts--%>
                    <telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"></telerik:RadClientExportManager>
                    <%--Chart--%>
                    <br />
                    <div class="export">
                        <telerik:RadButton ID="TotalSalesBranchEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportTotalSalesBranchRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <div class="border">
                            <telerik:RadHtmlChart ID="TotalSalesBranchRHC1" RenderMode="Lightweight" RenderAs="Canvas" runat="server" Skin="Bootstrap">
                                <ClientEvents OnLoad="formatTotalSalesBranchRHC1" />
                                <Pan Enabled="true" Lock="Y" />
                                <Zoom Enabled="true">
                                    <MouseWheel Enabled="true" Lock="Y" />
                                    <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                                </Zoom>
                            </telerik:RadHtmlChart>
                        </div>
                    </div>
                    <%--DataSource--%>
                    <asp:ObjectDataSource ID="TotalSalesBranchODS1" runat="server" SelectMethod="usp_TotalSalesBranch" TypeName="Test.BLL.Financial.TotalSalesBranchBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015/04/01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015/09/01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="BranchRef" DefaultValue="" Name="branchRef" Type="Int64"></asp:SessionParameter>
                            <asp:ControlParameter ControlID="TimeDDL1" Name="timeType" PropertyName="SelectedValue" Type="Int32" DefaultValue="1" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <hr />
                    <div class="padding">
                        <telerik:RadGrid ID="TotalSalesBranchG1" RenderMode="Lightweight" runat="server" DataSourceID="TotalSalesBranchODS1" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True" Skin="Metro" CellSpacing="-1" GridLines="Both" ExportSettings-FileName="Total Sales Branch Comparison" OnItemCommand="ExportGridCustomiser">
                            <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                            <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <ExportSettings HideStructureColumns="true"></ExportSettings>
                            <MasterTableView Width="100%" CommandItemDisplay="Top" AutoGenerateColumns="False" AllowFilteringByColumn="True" DataSourceID="TotalSalesBranchODS1">
                                <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="Branch_Name" FilterControlAltText="Filter Branch_Name column" HeaderText="Branch Name" SortExpression="Branch_Name" UniqueName="Branch_Name">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Total_Sales" DataFormatString="{0:N0}" DataType="System.Decimal" FilterControlAltText="Filter Total_Sales column" HeaderText="Total Sales" SortExpression="Total_Sales" UniqueName="Total_Sales">
                                    </telerik:GridBoundColumn>

                                </Columns>
                            </MasterTableView>
                            <FilterMenu RenderMode="Lightweight"></FilterMenu>
                            <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                        </telerik:RadGrid>
                    </div>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Average Per Transaction Branch Comparison--%>
            <telerik:RadPanelItem Text="Average Dollar per Transaction - Branch Comparison" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <br />
                    <div class="export">
                        <telerik:RadButton ID="AvgDollarPerTransactionBranchEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportAvgDollarPerTransactionBranchRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <div class="border">
                            <telerik:RadHtmlChart ID="AvgDollarPerTransactionBranchRHC1" RenderMode="Lightweight" RenderAs="Canvas" runat="server" Skin="Metro">
                                <ClientEvents OnLoad="formatAvgDollarPerTransactionBranchRHC1" />
                                <Pan Enabled="true" Lock="Y" />
                                <Zoom Enabled="true">
                                    <MouseWheel Enabled="true" Lock="Y" />
                                    <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                                </Zoom>
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
                        </div>
                    </div>
                    <%--Table--%>
                    <hr />
                    <div class="padding">
                        <telerik:RadGrid ID="RadGrid1" RenderMode="Lightweight" runat="server" DataSourceID="AvgDollarPerTransactionBranchODS1" CellSpacing="-1" GridLines="Both" AllowSorting="True" AllowPaging="True" Skin="Metro" ShowGroupPanel="True" ExportSettings-FileName="Average Dollar per Transaction Branch Comparison" OnItemCommand="ExportGridCustomiser">
                            <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                            <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <ExportSettings HideStructureColumns="true"></ExportSettings>
                            <MasterTableView Width="100%" CommandItemDisplay="Top" AutoGenerateColumns="False" DataSourceID="AvgDollarPerTransactionBranchODS1" AllowFilteringByColumn="True">
                                <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
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
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="AvgDollarPerTransactionBranchODS1" runat="server" SelectMethod="usp_AvgDollarPerTransactionBranch" TypeName="Test.BLL.Financial.AvgDollarPerTransactionBranchBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="BranchRef" Name="branchRef" Type="Int64"></asp:SessionParameter>
                            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Number of Transactions excluding Zero Total Bills branch comparison --%>
            <telerik:RadPanelItem Text="Number of Transactions excluding zero total bills - Branch Comparison" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <br />
                    <div class="export">
                        <telerik:RadButton ID="TransExcludeZeroTotalBranchEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportTransExcludeZeroTotalBranchRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <div class="border">
                            <telerik:RadHtmlChart ID="TransExcludeZeroTotalBranchRHC1" RenderMode="Lightweight" RenderAs="Canvas" runat="server" Skin="Bootstrap">
                                <ClientEvents OnLoad="formatTransExcludeZeroTotalBranchRHC1" />
                                <Pan Enabled="true" Lock="Y" />
                                <Zoom Enabled="true">
                                    <MouseWheel Enabled="true" Lock="Y" />
                                    <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                                </Zoom>
                            </telerik:RadHtmlChart>
                        </div>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="TransExcludeZeroTotalBranchODS1" runat="server" SelectMethod="usp_TransExcludeZeroTotalBranch" TypeName="Test.BLL.Financial.TransExcludeZeroTotalBranchBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="BranchRef" Name="branchRef" Type="Int64"></asp:SessionParameter>

                            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <hr />
                    <div class="padding">
                        <telerik:RadGrid ID="TransExcludeZeroTotalBranchG1" RenderMode="Lightweight" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="TransExcludeZeroTotalBranchODS1" ShowGroupPanel="True" Skin="Metro" CellSpacing="-1" GridLines="Both" ExportSettings-FileName="Transactions Excluding Zero Total Bills Branch Comparison" OnItemCommand="ExportGridCustomiser">
                            <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                            <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <ExportSettings HideStructureColumns="true"></ExportSettings>
                            <MasterTableView Width="100%" CommandItemDisplay="Top" AutoGenerateColumns="False" DataSourceID="TransExcludeZeroTotalBranchODS1" AllowFilteringByColumn="True">
                                <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="Branch_Name" FilterControlAltText="Filter Branch_Name column" HeaderText="Branch" SortExpression="Branch_Name" UniqueName="Branch_Name">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="No_of_transactions_excluding_zero_total_bill" DataType="System.Decimal" FilterControlAltText="Filter No_of_transactions_excluding_zero_total_bill column" HeaderText="No of Transactions excluding Zero Total Bills" SortExpression="No_of_transactions_excluding_zero_total_bill" UniqueName="No_of_transactions_excluding_zero_total_bill">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                            <FilterMenu RenderMode="Lightweight"></FilterMenu>
                            <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                        </telerik:RadGrid>
                    </div>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Retail Only Sales branch comparison chart--%>
            <telerik:RadPanelItem Text="Retail Only Sales - Branch Comparison" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <br />
                    <div class="export">
                        <telerik:RadButton ID="RetailOnlySalesBranchEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportRetailOnlySalesBranchRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <div class="border">
                            <telerik:RadHtmlChart ID="RetailOnlySalesBranchRHC1" RenderMode="Lightweight" RenderAs="Canvas" runat="server" Skin="Bootstrap">
                                <ClientEvents OnLoad="formatRetailOnlySalesBranchRHC1" />
                                <Pan Enabled="true" Lock="Y" />
                                <Zoom Enabled="true">
                                    <MouseWheel Enabled="true" Lock="Y" />
                                    <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                                </Zoom>
                            </telerik:RadHtmlChart>
                        </div>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="RetailOnlySalesBranchODS1" runat="server" SelectMethod="usp_RetailOnlySalesBranch" TypeName="Test.BLL.Financial.RetailOnlySalesBranchBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="BranchRef" Name="branchRef" Type="Int64"></asp:SessionParameter>

                            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <hr />
                    <div class="padding">
                        <telerik:RadGrid ID="RetailOnlySalesBranchG1" RenderMode="Lightweight" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="RetailOnlySalesBranchODS1" ShowGroupPanel="True" Skin="Metro" CellSpacing="-1" GridLines="Both" ExportSettings-FileName="Retail Only Sales Branch Comparison" OnItemCommand="ExportGridCustomiser">
                            <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                            <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <ExportSettings HideStructureColumns="true"></ExportSettings>
                            <MasterTableView Width="100%" CommandItemDisplay="Top" AutoGenerateColumns="False" AllowFilteringByColumn="True" DataSourceID="RetailOnlySalesBranchODS1">
                                <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="Branch_Name" FilterControlAltText="Filter Branch_Name column" HeaderText="Branch" SortExpression="Branch_Name" UniqueName="Branch_Name">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Retail_Total_Only" DataType="System.Decimal" DataFormatString="{0:N0}" FilterControlAltText="Filter Retail_Total_Only column" HeaderText="Retail Total Only" SortExpression="Retail_Total_Only" UniqueName="Retail_Total_Only">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                            <FilterMenu RenderMode="Lightweight"></FilterMenu>
                            <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                        </telerik:RadGrid>
                    </div>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Service Only Sales branch comparison chart--%>
            <telerik:RadPanelItem Text="Service Only Sales - Branch Comparison" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <br />
                    <div class="export">
                        <telerik:RadButton ID="ServiceOnlySalesBranchEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportServiceOnlySalesBranchRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <div class="border">
                            <telerik:RadHtmlChart ID="ServiceOnlySalesBranchRHC1" RenderMode="Lightweight" RenderAs="Canvas" runat="server" Skin="Material">
                                <ClientEvents OnLoad="formatServiceOnlySalesBranchRHC1" />
                                <Pan Enabled="true" Lock="Y" />
                                <Zoom Enabled="true">
                                    <MouseWheel Enabled="true" Lock="Y" />
                                    <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                                </Zoom>
                            </telerik:RadHtmlChart>
                        </div>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="ServiceOnlySalesBranchODS1" runat="server" SelectMethod="usp_ServiceOnlySalesBranch" TypeName="Test.BLL.Financial.ServiceOnlySalesBranchBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="BranchRef" Name="branchRef" Type="Int64"></asp:SessionParameter>

                            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <hr />
                    <div class="padding">
                        <telerik:RadGrid ID="ServiceOnlySalesBranchG1" RenderMode="Lightweight" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="ServiceOnlySalesBranchODS1" ShowGroupPanel="True" Skin="Metro" CellSpacing="-1" GridLines="Both" ExportSettings-FileName="Service Only Sales Branch Comparison" OnItemCommand="ExportGridCustomiser">
                            <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                            <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <ExportSettings HideStructureColumns="true"></ExportSettings>
                            <MasterTableView Width="100%" CommandItemDisplay="Top" AutoGenerateColumns="False" AllowFilteringByColumn="True" DataSourceID="ServiceOnlySalesBranchODS1">
                                <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="Branch_Name" FilterControlAltText="Filter Branch_Name column" HeaderText="Branch" SortExpression="Branch_Name" UniqueName="Branch_Name">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Service_Total_Only" DataType="System.Decimal" DataFormatString="{0:N0}" FilterControlAltText="Filter Service_Total_Only column" HeaderText="Service Total Only" SortExpression="Service_Total_Only" UniqueName="Service_Total_Only">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                            <FilterMenu RenderMode="Lightweight"></FilterMenu>
                            <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                        </telerik:RadGrid>
                    </div>
                </ContentTemplate>
            </telerik:RadPanelItem>
        </Items>
        <ExpandAnimation Type="None" />
        <CollapseAnimation Type="None" />
    </telerik:RadPanelBar>
</div>
<telerik:RadScriptBlock runat="server">
    <script>
        var $ = $telerik.$;
        //For Exporting Charts
        function exportTotalSalesBranchRHC1(sender, args) {
            exportRadHtmlChart('<%=TotalSalesBranchRHC1.ClientID%>')
        }

        function exportAvgDollarPerTransactionBranchRHC1(sender, args) {
            exportRadHtmlChart('<%=AvgDollarPerTransactionBranchRHC1.ClientID%>')
        }

        function exportTransExcludeZeroTotalBranchRHC1(sender, args) {
            exportRadHtmlChart('<%=TransExcludeZeroTotalBranchRHC1.ClientID%>')
        }

        function exportRetailOnlySalesBranchRHC1(sender, args) {
            exportRadHtmlChart('<%=RetailOnlySalesBranchRHC1.ClientID%>')
        }
        function exportServiceOnlySalesBranchRHC1(sender, args) {
            exportRadHtmlChart('<%=ServiceOnlySalesBranchRHC1.ClientID%>')
         }


         function exportRadHtmlChart(chartId) {
             var chartTitle = $find(chartId).get_kendoWidget().options.title.text;
             var manager = $find('<%=RadClientExportManager1.ClientID%>');
            var pdfSettings = {
                fileName: chartTitle

            };

            manager.set_pdfSettings(pdfSettings);
            manager.exportPDF($("#" + chartId));
        }

        <%--For responsive chart--%>
        (function (global) {
            var chart;
            //Hide Export Button 

            $("div.export").mouseover(function () {
                $(".RadButton", this).css("display", "inline-block");
            });
            $("div.export").mouseout(function () {
                $(".RadButton", this).css("display", "none");
            });
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

        //format Y axis value based on value
        function formatTotalSalesBranchRHC1() {
            var chart = $find("<%=TotalSalesBranchRHC1.ClientID%>");
            chart.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart.repaint();
        };

        function formatAvgDollarPerTransactionBranchRHC1() {
            var chart2 = $find("<%=AvgDollarPerTransactionBranchRHC1.ClientID%>");
            chart2.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart2.repaint();
        };

        function formatTransExcludeZeroTotalBranchRHC1() {
            var chart3 = $find("<%=TransExcludeZeroTotalBranchRHC1.ClientID%>");
            chart3.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart3.repaint();
        };

        function formatRetailOnlySalesBranchRHC1() {
            var chart4 = $find("<%=RetailOnlySalesBranchRHC1.ClientID%>");
            chart4.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart4.repaint();
        };

        function formatServiceOnlySalesBranchRHC1() {
            var chart5 = $find("<%=ServiceOnlySalesBranchRHC1.ClientID%>");
            chart5.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart5.repaint();
        };

        //Hide radloadingpanel when request is completed
        var currentLoadingPanel = null;
        var currentUpdatedControl = null;

        function ResponseEnd() {
            ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            //hide the loading panel without knowing the updated control
            if (currentLoadingPanel != null)
                ajaxManager.hideLoadingPanels();
        }
    </script>
</telerik:RadScriptBlock>
