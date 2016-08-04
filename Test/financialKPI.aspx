<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="financialKPI.aspx.cs" Inherits="Test.KPI" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/jquery-ui.min.js"></script>
    <script src="Scripts/accordion.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="BranchDDL1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="TotalSalesBranchRHC1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="AvgPerTransactionBranchRHC1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="RetailOnlySalesBranchRHC1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="ServiceOnlySalesBranchRHC1" UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="Button1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="TotalSalesComRHC1" UpdatePanelCssClass="" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="TotalSalesComODS" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="TotalSalesBranchRHC1" UpdatePanelCssClass="" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="TotalSalesBranchODS1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="AvgPerTransactionComRHC1" UpdatePanelCssClass="" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="AvgPerTransactionComODS1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="AvgPerTransactionBranchRHC1" UpdatePanelCssClass="" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="AvgPerTransactionBranchODS1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="TransExcludeZeroTotalComRHC1" UpdatePanelCssClass="" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="TransExcludeZeroTotalComODS1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="RetailOnlySalesComRHC1" UpdatePanelCssClass="" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="RetailOnlySalesComODS1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="ServiceOnlySalesComRHC1" UpdatePanelCssClass="" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="ServiceOnlySalesComODS1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="RetailOnlySalesBranchRHC1" UpdatePanelCssClass="" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="ServiceOnlySalesBranchRHC1" UpdatePanelCssClass="" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <div class="right_col" role="main">
            <%--KPI Menu--%>
            <div id="KPIMenu" style="text-align: center">
                <a href="/financialKPI.aspx" style="font-size: 20px"><strong>Financial</strong></a>
                <strong>|</strong>
                <a href="/employeekpi.aspx" style="font-size: 20px"><strong>Employee</strong></a>
                <strong>|</strong>
                <a href="/customerkpi.aspx" style="font-size: 20px"><strong>Customer</strong></a>
            </div>
            <br />
            <%--Datepickers and input--%>
            <div class="text-center">
                <telerik:RadDatePicker ID="DatePicker1" runat="server" Class="Random" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-04-01" SelectedDate="2015-04-01" Height="24px" Width="200px">
                </telerik:RadDatePicker>
                <telerik:RadDatePicker ID="DatePicker2" runat="server" Class="Random" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-09-01" SelectedDate="2015-09-01" height="24px" width="200px">
                </telerik:RadDatePicker>

                <asp:DropDownList ID="CompanyDDL1" runat="server" Width="100px" OnSelectedIndexChanged="Company_SelectedIndexChanged" Visible="false">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                </asp:DropDownList>
                <%--                <telerik:RadDropDownList ID="BranchDDL1" runat="server" AppendDataBoundItems="True" EnableViewState="False" DataSourceID="BranchDropDownODS1" DataTextField="Branch_Name" DataValueField="Ref_Number" EnableVirtualScrolling="True"></telerik:RadDropDownList>--%>
                <%--<asp:DropDownList ID="BranchDDL1" runat="server" AutoPostBack="false" AppendDataBoundItems="True" EnableViewState="False" Width="100px" DataSourceID="BranchDropDownODS1" DataTextField="Branch_Name" DataValueField="Ref_Number">
                    <asp:ListItem Value="0" Selected="True">All Branches</asp:ListItem>
                </asp:DropDownList>--%>

                <telerik:RadDropDownList ID="BranchDDL1" runat="server" AppendDataBoundItems="True" DataSourceID="BranchDropDownODS1" DataTextField="Branch_Name" DataValueField="Ref_Number" height="24px" width="197px">
                    <Items>
                        <telerik:DropDownListItem Text="All Branches" Value="0" />
                    </Items>
                </telerik:RadDropDownList>
                <asp:ObjectDataSource ID="BranchDropDownODS1" runat="server" SelectMethod="usp_BranchDropDownList" TypeName="Test.BLL.BranchDropDownListBL">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <%--<asp:DropDownList ID="TimeDDL1" runat="server" Width="100px">
                    <asp:ListItem Value="1"> Monthly </asp:ListItem>
                    <asp:ListItem Value="2"> Yearly </asp:ListItem>
                </asp:DropDownList>--%>
                <telerik:RadDropDownList ID="TimeDDL1" runat="server" height="24px" width="197px">
                    <Items>
                        <telerik:DropDownListItem Text="Monthly" Value="1" />
                        <telerik:DropDownListItem Text="Yearly" Value="2" />
                        <telerik:DropDownListItem Text="Weekly" Value="3" />
                    </Items>
                </telerik:RadDropDownList>
                <%--<asp:Button ID="Button1" runat="server" Text="View" OnClick="Button1_Click" />--%>
                <telerik:RadButton ID="Button1" runat="server" Text="View" OnClick="Button1_Click"></telerik:RadButton>
            </div>

            <br />
            <%--This section is for Total Sales Company--%>
            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Total Sales Companywide</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                            <%--Chart--%>
                            <telerik:RadHtmlChart ID="TotalSalesComRHC1" runat="server" DataSourceID="TotalSalesComODS" Skin="Metro">
                                <ClientEvents OnLoad="chartLoad" />
                                <Pan Enabled="true" Lock="Y" />
                                <Zoom Enabled="true">
                                    <MouseWheel Enabled="true" Lock="Y" />
                                    <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                                </Zoom>

                                <PlotArea>
                                    <Series>
                                        <telerik:ColumnSeries DataFieldY="Total_Sales">
                                            <LabelsAppearance DataFormatString="N0">
                                            </LabelsAppearance>
                                            <TooltipsAppearance DataFormatString="C0">
                                            </TooltipsAppearance>
                                        </telerik:ColumnSeries>
                                    </Series>
                                    <XAxis DataLabelsField="TimePeriod" Type="Auto">
                                        <TitleAppearance Text="Time Period">
                                            <TextStyle Margin="20" />
                                        </TitleAppearance>
                                        <LabelsAppearance RotationAngle="65">
                                        </LabelsAppearance>
                                        <MajorGridLines Visible="false" />
                                        <MinorGridLines Visible="false" />
                                    </XAxis>
                                    <YAxis>
                                        <TitleAppearance Text="Total Sales" Position="Center">
                                            <TextStyle Margin="20" />
                                        </TitleAppearance>
                                        <MinorGridLines Visible="false" />
                                    </YAxis>
                                </PlotArea>

                                <ChartTitle Text="Total Sales Companywide">
                                </ChartTitle>
                            </telerik:RadHtmlChart>
                            <%--Datasource--%>
                            <asp:ObjectDataSource ID="TotalSalesComODS" runat="server" SelectMethod="usp_TotalSalesCom" TypeName="Test.BLL.Financial.TotalSalesComBL">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015/04/01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015/09/01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <%--Table--%>
                            <telerik:RadGrid ID="TotalSalesComG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="TotalSalesComODS" ShowGroupPanel="True" Skin="Bootstrap">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" DataSourceID="TotalSalesComODS">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Total_Sales" DataFormatString="{0:N0}" DataType="System.Decimal" FilterControlAltText="Filter Total_Sales column" HeaderText="Total Sales" SortExpression="Total_Sales" UniqueName="Total_Sales">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </div>
                    </div>
                </div>
            </div>
            <%--This section is for Total Sales Branch Comparison--%>
            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Total Sales Branch Comparison</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                                <%--Chart--%>
                                <telerik:RadHtmlChart ID="TotalSalesBranchRHC1" runat="server" Skin="Metro">
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
                                            <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="TimePeriod" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Total_Sales" DataFormatString="{0:N0}" DataType="System.Decimal" FilterControlAltText="Filter Total_Sales column" HeaderText="Total_Sales" SortExpression="Total_Sales" UniqueName="Total_Sales">
                                            </telerik:GridBoundColumn>
                                            
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                        </div>
                    </div>
                </div>
            </div>

            <%--This section is for Average Dollar Earned Per Transaction Companywide--%>
            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Average Dollar Earned Per Transaction Companywide</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                                <%--Chart--%>
                                <telerik:RadHtmlChart ID="AvgPerTransactionComRHC1" runat="server" DataSourceID="AvgPerTransactionComODS1" Skin="Bootstrap">
                                    <Pan Enabled="true" Lock="Y" />
                                    <Zoom Enabled="true">
                                        <MouseWheel Enabled="true" Lock="Y" />
                                        <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                                    </Zoom>
                                    <Legend>
                                        <Appearance Position="Bottom" />
                                    </Legend>
                                    <PlotArea>
                                        <XAxis Color="Black" DataLabelsField="TimePeriod" Type="Auto">
                                            <TitleAppearance Position="Center" Text="Time Period" />
                                            <LabelsAppearance DataFormatString="MMM yy">
                                            </LabelsAppearance>
                                        </XAxis>
                                        <YAxis Color="Black">
                                            <MajorGridLines Color="#EFEFEF" Width="1" />
                                            <MinorGridLines Color="#F7F7F7" Width="1" />
                                            <TitleAppearance Position="Center" Text="$" RotationAngle="90" />
                                        </YAxis>
                                        <Series>
                                            <telerik:AreaSeries Name="Average Per Transaction" DataFieldY="Average_Dollar_per_Transaction">
                                                <Appearance>
                                                    <FillStyle BackgroundColor="Orange" />
                                                </Appearance>
                                                <MarkersAppearance MarkersType="Circle" BackgroundColor="White" />
                                                <TooltipsAppearance Visible="true" DataFormatString="C2" />
                                                <LabelsAppearance Visible="false">
                                                </LabelsAppearance>
                                            </telerik:AreaSeries>
                                        </Series>
                                    </PlotArea>

                                    <ChartTitle Text="Average Dollar Value per Transaction Companywide ">
                                    </ChartTitle>
                                </telerik:RadHtmlChart>
                                <%--Datasource--%>
                                <asp:ObjectDataSource ID="AvgPerTransactionComODS1" runat="server" SelectMethod="usp_AvgPerTransactionCom" TypeName="Test.BLL.Financial.AvgPerTransactionComBL" OnSelecting="AvgPerTransactionComODS1_Selecting">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                        <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                        <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="TimeDDL1" Name="timeType" PropertyName="SelectedValue" Type="Int32" DefaultValue="1" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <%--Table--%>
                                <telerik:RadGrid ID="AvgPerTransactionComG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="AvgPerTransactionComODS1" ShowGroupPanel="True" Skin="Bootstrap">
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                    <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                        <Selecting AllowRowSelect="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" DataSourceID="AvgPerTransactionComODS1">
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Average_Dollar_per_Transaction" DataFormatString="{0:N0}" DataType="System.Decimal" FilterControlAltText="Filter Average_Dollar_per_Transaction column" HeaderText="Average Dollar per Transaction" SortExpression="Average_Dollar_per_Transaction" UniqueName="Average_Dollar_per_Transaction">
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                        </div>
                    </div>
                </div>
            </div>
            <%--This section is for Average Per Transaction Branch Comparison--%>
            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Average Dollar Earned Per Transaction Branch Comparison</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                                <%--Chart--%>
                                <telerik:RadHtmlChart ID="AvgPerTransactionBranchRHC1" runat="server" Skin="Metro">
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
                                <telerik:RadGrid ID="RadGrid1" RenderMode="Lightweight" runat="server" DataSourceID="AvgPerTransactionBranchODS1" CellSpacing="-1" GridLines="Both" AllowFilteringByColumn="True"
                                    AllowSorting="True" AllowPaging="True" OnNeedDataSource="RadGrid1_NeedDataSource" Skin="Bootstrap">
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                    <MasterTableView AutoGenerateColumns="False" DataSourceID="AvgPerTransactionBranchODS1">
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="Branch_Name" FilterControlAltText="Filter Branch_Name column" HeaderText="Branch" SortExpression="Branch_Name" UniqueName="Branch_Name">
                                                <FilterTemplate>
                                                    <telerik:RadComboBox RenderMode="Lightweight" ID="RadComboBoxTitle" DataSourceID="BranchDropDownODS1" DataTextField="Branch_Name"
                                                        DataValueField="Branch_Name" Width="200px" AppendDataBoundItems="true" SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("Branch_Name").CurrentFilterValue %>'
                                                        runat="server" OnClientSelectedIndexChanged="TitleIndexChanged">
                                                        <Items>
                                                            <telerik:RadComboBoxItem Text="All" />
                                                        </Items>
                                                    </telerik:RadComboBox>
                                                    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                                                        <script type="text/javascript">
                                                            function TitleIndexChanged(sender, args) {
                                                                var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                                        tableView.filter("Branch_Name", args.get_item().get_value(), "EqualTo");
                                                    }
                                                        </script>
                                                    </telerik:RadScriptBlock>
                                                </FilterTemplate>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Year_Month" DataFormatString="{0:MMM yyyy}" AllowFiltering="false" DataType="System.DateTime" FilterControlAltText="Filter Year_Month column" HeaderText="Time Period" SortExpression="Year_Month" UniqueName="Year_Month">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Average_Dollar_per_Transaction" DataFormatString="{0:N0}" AllowFiltering="false" DataType="System.Decimal"
                                                FilterControlAltText="Filter Average_Dollar_per_Transaction column" HeaderText="Average Dollar per Transaction"
                                                SortExpression="Average_Dollar_per_Transaction" UniqueName="Average_Dollar_per_Transaction">
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <%--Datasource--%>
                                <asp:ObjectDataSource ID="AvgPerTransactionBranchODS1" runat="server" SelectMethod="usp_AvgPerTransactionBranch" TypeName="Test.BLL.Financial.AvgPerTransactionBranchBL">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                        <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                        <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:Parameter DefaultValue="0" Name="branchRef" Type="Int32" />
                                        <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                        </div>
                    </div>
                </div>
            </div>
            <%--This section is for Number of Transactions excluding Zero Total Bills companywide presented on column chart--%>
            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Number of Transactions excluding Zero Total Bills Companywide</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                                <%--Chart--%>
                                <telerik:RadHtmlChart ID="TransExcludeZeroTotalComRHC1" runat="server" DataSourceID="TransExcludeZeroTotalComODS1" Skin="Material">
                                    <Pan Enabled="true" Lock="Y" />
                                    <Zoom Enabled="true">
                                        <MouseWheel Enabled="true" Lock="Y" />
                                        <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                                    </Zoom>

                                    <PlotArea>
                                        <Series>
                                            <telerik:ColumnSeries DataFieldY="No_of_transactions_excluding_zero_total_bill">
                                                <LabelsAppearance DataFormatString="N0">
                                                </LabelsAppearance>
                                                <TooltipsAppearance DataFormatString="C0"></TooltipsAppearance>
                                            </telerik:ColumnSeries>
                                        </Series>
                                        <XAxis DataLabelsField="TimePeriod" Type="Auto">
                                            <TitleAppearance Text="Time Period">
                                                <TextStyle Margin="20" />
                                            </TitleAppearance>
                                            <LabelsAppearance DataFormatString="MMM yyyy">
                                            </LabelsAppearance>
                                            <MajorGridLines Visible="false" />
                                            <MinorGridLines Visible="false" />
                                        </XAxis>
                                        <YAxis>
                                            <TitleAppearance Text="No of Transacts Excluding Zero Total">
                                                <TextStyle Margin="20" />
                                            </TitleAppearance>
                                            <MinorGridLines Visible="false" />
                                        </YAxis>
                                    </PlotArea>

                                    <ChartTitle Text="No of Transactions excluding Zero Total Bills">
                                    </ChartTitle>
                                </telerik:RadHtmlChart>
                                <%--Datasource--%>
                                <asp:ObjectDataSource ID="TransExcludeZeroTotalComODS1" runat="server" SelectMethod="usp_TransExcludeZeroTotalCom" TypeName="Test.BLL.Financial.TransExcludeZeroTotalComBL">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                        <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                        <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <%--Table--%>
                                <telerik:RadGrid ID="TransExcludeZeroTotalComG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="TransExcludeZeroTotalComODS1" ShowGroupPanel="True" Skin="Bootstrap">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                    <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                        <Selecting AllowRowSelect="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" DataSourceID="TransExcludeZeroTotalComODS1">
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="No_of_transactions_excluding_zero_total_bill" DataFormatString="{0:N0}" DataType="System.Int32" FilterControlAltText="Filter No_of_transactions_excluding_zero_total_bill column" HeaderText="No of Transactions excluding Zero Total Bill" SortExpression="No_of_transactions_excluding_zero_total_bill" UniqueName="No_of_transactions_excluding_zero_total_bill">
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                        </div>
                    </div>
                </div>
            </div>
            <%--This section is for Retail Only Sales companywide chart--%>
            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Retail Only Sales Companywide</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                                <%--Chart--%>
                                <telerik:RadHtmlChart ID="RetailOnlySalesComRHC1" runat="server" DataSourceID="RetailOnlySalesComODS1" Skin="MetroTouch">
                                    <Pan Enabled="true" Lock="Y" />
                                    <Zoom Enabled="true">
                                        <MouseWheel Enabled="true" Lock="Y" />
                                        <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                                    </Zoom>
                                    <Legend>
                                        <Appearance Position="Bottom" />
                                    </Legend>
                                    <PlotArea>
                                        <XAxis Color="Black" DataLabelsField="TimePeriod" Type="Auto">
                                            <TitleAppearance Position="Center" Text="Time Period" />
                                            <LabelsAppearance DataFormatString="MMM yy">
                                            </LabelsAppearance>
                                        </XAxis>
                                        <YAxis Color="Black">
                                            <MajorGridLines Color="#EFEFEF" Width="1" />
                                            <MinorGridLines Color="#F7F7F7" Width="1" />
                                            <TitleAppearance Position="Center" Text="$" RotationAngle="90" />
                                        </YAxis>
                                        <Series>
                                            <telerik:AreaSeries Name="Retail Sales" DataFieldY="Retail_Total_Only">
                                                <Appearance>
                                                    <FillStyle BackgroundColor="Orange" />
                                                </Appearance>
                                                <MarkersAppearance MarkersType="Circle" BackgroundColor="White" />
                                                <TooltipsAppearance BackgroundColor="White" />
                                                <LabelsAppearance Visible="false">
                                                </LabelsAppearance>
                                                <TooltipsAppearance DataFormatString="C0"></TooltipsAppearance>
                                            </telerik:AreaSeries>
                                        </Series>
                                    </PlotArea>

                                    <ChartTitle Text="Retail Only Sales Companywide">
                                    </ChartTitle>
                                </telerik:RadHtmlChart>
                                <%--Datasource--%>
                                <asp:ObjectDataSource ID="RetailOnlySalesComODS1" runat="server" SelectMethod="usp_RetailOnlySalesCom" TypeName="Test.BLL.Financial.RetailOnlySalesComBL">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                        <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                        <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <%--Table--%>
                                <telerik:RadGrid ID="RetailOnlySalesComG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="RetailOnlySalesComODS1" ShowGroupPanel="True" Skin="Bootstrap">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                    <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                        <Selecting AllowRowSelect="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" DataSourceID="RetailOnlySalesComODS1">
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Retail_Total_Only" DataType="System.Decimal" DataFormatString="{0:N0}" FilterControlAltText="Filter Retail_Total_Only column" HeaderText="Retail Total Only" SortExpression="Retail_Total_Only" UniqueName="Retail_Total_Only">
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                        </div>
                    </div>
                </div>
            </div>
            <%--This section is for Service Only Sales companywide chart--%>
            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Service Only Sales Companywide</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                                <%--Chart--%>
                                <telerik:RadHtmlChart ID="ServiceOnlySalesComRHC1" runat="server" DataSourceID="ServiceOnlySalesComODS1" Skin="Metro">
                                    <Pan Enabled="true" Lock="Y" />
                                    <Zoom Enabled="true">
                                        <MouseWheel Enabled="true" Lock="Y" />
                                        <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                                    </Zoom>
                                    <Legend>
                                        <Appearance Position="Bottom" />
                                    </Legend>
                                    <PlotArea>
                                        <XAxis Color="Black" DataLabelsField="TimePeriod" Type="Auto">
                                            <TitleAppearance Position="Center" Text="Time Period" />
                                            <LabelsAppearance DataFormatString="MMM yy">
                                            </LabelsAppearance>
                                        </XAxis>
                                        <YAxis Color="Black">
                                            <MajorGridLines Color="#EFEFEF" Width="1" />
                                            <MinorGridLines Color="#F7F7F7" Width="1" />
                                            <TitleAppearance Position="Center" Text="$" RotationAngle="90" />
                                        </YAxis>
                                        <Series>
                                            <telerik:AreaSeries Name="Service Sales" DataFieldY="Service_Total_Only">
                                                <Appearance>
                                                    <FillStyle BackgroundColor="Orange" />
                                                </Appearance>
                                                <MarkersAppearance MarkersType="Circle" BackgroundColor="White" />
                                                <TooltipsAppearance BackgroundColor="White" />
                                                <LabelsAppearance Visible="false">
                                                </LabelsAppearance>
                                                <TooltipsAppearance DataFormatString="C0"></TooltipsAppearance>
                                            </telerik:AreaSeries>
                                        </Series>
                                    </PlotArea>

                                    <ChartTitle Text="Service Only Sales Companywide">
                                    </ChartTitle>
                                </telerik:RadHtmlChart>
                                <%--Datasource--%>
                                <asp:ObjectDataSource ID="ServiceOnlySalesComODS1" runat="server" SelectMethod="usp_ServiceOnlySalesCom" TypeName="Test.BLL.Financial.ServiceOnlySalesComBL">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                        <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                        <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <%--Table--%>
                                <telerik:RadGrid ID="ServiceOnlySalesComG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="ServiceOnlySalesComODS1" ShowGroupPanel="True" Skin="Bootstrap">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                    <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                        <Selecting AllowRowSelect="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" DataSourceID="ServiceOnlySalesComODS1">
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Service_Total_Only" DataType="System.Decimal" DataFormatString="{0:N0}" FilterControlAltText="Filter Service_Total_Only column" HeaderText="Service Total Only" SortExpression="Service_Total_Only" UniqueName="Service_Total_Only">
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                        </div>
                    </div>
                </div>
            </div>
            <%--This section is for Retail Only Sales branch comparison chart--%>
            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Retail Only Sales Branch Comparison</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
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
                        </div>
                    </div>
                </div>
            </div>
            <%--This section is for Retail Only Sales branch comparison chart--%>
            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Service Only Sales Branch Comparison</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
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
                        </div>
                    </div>
                </div>
            </div>


        </div>

    </form>
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
</asp:Content>


