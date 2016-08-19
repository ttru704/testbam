<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="financialKPI.aspx.cs" Inherits="Test.financialkpi" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server"></telerik:RadStyleSheetManager>
        <telerik:RadScriptManager ID="ScriptManager1" runat="server" EnableTheming="True">
            <Scripts>
                
            </Scripts>
        </telerik:RadScriptManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="BranchDDL1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="TotalSalesBranchRHC1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="RetailOnlySalesBranchRHC1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="ServiceOnlySalesBranchRHC1" UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="Button1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="TotalSalesCompanyRHC1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="TotalSalesBranchRHC1" UpdatePanelCssClass=""  LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="AvgDollarPerTransactionCompanyRHC1" UpdatePanelCssClass="" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="AvgDollarPerTransactionBranchRHC1" UpdatePanelCssClass="" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="TransExcludeZeroTotalCompanyRHC1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="TransExcludeZeroTotalBranchRHC1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="RetailOnlySalesCompanyRHC1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="ServiceOnlySalesCompanyRHC1" UpdatePanelCssClass="" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="RetailOnlySalesBranchRHC1" UpdatePanelCssClass="" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="ServiceOnlySalesBranchRHC1" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="TotalSalesComG1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="TotalSalesComG1" UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="TotalSalesBranchG1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="TotalSalesBranchG1" UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="AvgPerTransactionComG1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="AvgPerTransactionComG1" UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadGrid1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadGrid1" UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="TransExcludeZeroTotalComG1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="TransExcludeZeroTotalComG1" UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="TransExcludeZeroTotalBranchG1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="TransExcludeZeroTotalBranchG1" UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RetailOnlySalesComG1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RetailOnlySalesComG1" UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="ServiceOnlySalesComG1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="ServiceOnlySalesComG1" UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RetailOnlySalesBranchG1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RetailOnlySalesBranchG1" UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="ServiceOnlySalesBranchG1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="ServiceOnlySalesBranchG1" UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <div class="right_col" role="main">
            <%--KPI Menu--%>
            <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="0" Skin="MetroTouch" Style="overflow: visible" MultiPageID="RadMultiPage1">
                <Tabs>
                    <telerik:RadTab runat="server" NavigateUrl="~/financialKPI.aspx" Text="Financial " Width="150px" Selected="True" SelectedIndex="0">
                        <Tabs>
                            <telerik:RadTab runat="server" Text="Company" Selected="True">
                            </telerik:RadTab>
                            <telerik:RadTab runat="server" Text="Branch">
                            </telerik:RadTab>
                        </Tabs>
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" NavigateUrl="~/employeeKPI.aspx" Text="Employee" Width="150px">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" NavigateUrl="~/customerKPI.aspx" Text="Customer" Width="150px">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <br />
            <%--Datepickers and input--%>
            <div class="text-center">
                <telerik:RadDatePicker ID="DatePicker1" runat="server" Class="Random" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-04-01" SelectedDate="2015-04-01" Height="24px" Width="200px">
                    <DatePopupButton
                        CssClass="rcCalPopup"
                        Width="2em" />
                </telerik:RadDatePicker>
                <telerik:RadDatePicker ID="DatePicker2" runat="server" Class="Random" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-09-01" SelectedDate="2015-09-01" Height="24px" Width="200px">
                    <DatePopupButton
                        CssClass="rcCalPopup"
                        Width="2em" />
                </telerik:RadDatePicker>

                <asp:DropDownList ID="CompanyDDL1" runat="server" Width="100px" OnSelectedIndexChanged="Company_SelectedIndexChanged" Visible="false">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                </asp:DropDownList>
                

                <telerik:RadDropDownList ID="BranchDDL1" runat="server" AppendDataBoundItems="True" DataSourceID="BranchDropDownODS1" DataTextField="Branch_Name" DataValueField="Ref_Number" height="24px" Width="197px">
                    <Items>
                        <telerik:DropDownListItem Text="All Branches" Value="0" />
                    </Items>
                </telerik:RadDropDownList>
                <asp:ObjectDataSource ID="BranchDropDownODS1" runat="server" SelectMethod="usp_BranchDropDownList" TypeName="Test.BLL.BranchDropDownListBL">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <telerik:RadDropDownList ID="TimeDDL1" runat="server" height="24px" Width="197px">
                    <Items>
                        <telerik:DropDownListItem Text="Weekly" Value="3" />
                        <telerik:DropDownListItem Text="Monthly" Value="1" selected="true"/>
                        <telerik:DropDownListItem Text="Yearly" Value="2" />
                        
                    </Items>
                </telerik:RadDropDownList>
                <telerik:RadButton ID="Button1" runat="server" Text="View" OnClick="Button1_Click"></telerik:RadButton>
            </div>

            <br />
            <%--This section is for Total Sales Company--%>
            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Total Sales Company Wide</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                            <%--Chart--%>
                            <telerik:RadHtmlChart ID="TotalSalesCompanyRHC1" runat="server" DataSourceID="TotalSalesCompanyODS" Skin="Metro">
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
                            <asp:ObjectDataSource ID="TotalSalesCompanyODS" runat="server" SelectMethod="usp_TotalSalesCompany" TypeName="Test.BLL.Financial.TotalSalesCompanyBL">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015/04/01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015/09/01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <%--Table--%>
                            <telerik:RadGrid ID="TotalSalesComG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="TotalSalesCompanyODS" ShowGroupPanel="True" Skin="Bootstrap">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" DataSourceID="TotalSalesCompanyODS">
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
                        </div>
                    </div>
                </div>
            </div>

            <%--This section is for Average Dollar Earned Per Transaction Companywide--%>
            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Average Dollar Earned Per Transaction Company Wide</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                            <%--Chart--%>
                            <telerik:RadHtmlChart ID="AvgDollarPerTransactionCompanyRHC1" runat="server" DataSourceID="AvgDollarPerTransactionCompanyODS1" Skin="Bootstrap">
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
                            <asp:ObjectDataSource ID="AvgDollarPerTransactionCompanyODS1" runat="server" SelectMethod="usp_AvgDollarPerTransactionCompany" TypeName="Test.BLL.Financial.AvgDollarPerTransactionCompanyBL" OnSelecting="AvgPerTransactionComODS1_Selecting">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="TimeDDL1" Name="timeType" PropertyName="SelectedValue" Type="Int32" DefaultValue="1" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <%--Table--%>
                            <telerik:RadGrid ID="AvgPerTransactionComG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="AvgDollarPerTransactionCompanyODS1" ShowGroupPanel="True" Skin="Bootstrap">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" DataSourceID="AvgDollarPerTransactionCompanyODS1">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Average_Dollar_per_Transaction" DataType="System.Decimal" FilterControlAltText="Filter Average_Dollar_per_Transaction column" HeaderText="Average Dollar per Transaction" SortExpression="Average_Dollar_per_Transaction" UniqueName="Average_Dollar_per_Transaction" DataFormatString="{0:N0}">
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
                        </div>
                    </div>
                </div>
            </div>
            <%--This section is for Number of Transactions excluding Zero Total Bills companywide presented on column chart--%>
            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Number of Transactions excluding Zero Total Bills Company Wide</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                            <%--Chart--%>
                            <telerik:RadHtmlChart ID="TransExcludeZeroTotalCompanyRHC1" runat="server" DataSourceID="TransExcludeZeroTotalCompanyODS1" Skin="Material">
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
                            <asp:ObjectDataSource ID="TransExcludeZeroTotalCompanyODS1" runat="server" SelectMethod="usp_TransExcludeZeroTotalCompany" TypeName="Test.BLL.Financial.TransExcludeZeroTotalCompanyBL">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <%--Table--%>
                            <telerik:RadGrid ID="TransExcludeZeroTotalComG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="TransExcludeZeroTotalCompanyODS1" ShowGroupPanel="True" Skin="Bootstrap">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" DataSourceID="TransExcludeZeroTotalCompanyODS1">
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
            <%--This section is for Number of Transactions excluding Zero Total Bills branch comparison presented on column chart--%>
            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Number of Transactions excluding Zero Total Bills Branch Comparison</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
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
                        </div>
                    </div>
                </div>
            </div>
            <%--This section is for Retail Only Sales companywide chart--%>
            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Retail Only Sales Company Wide</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                            <%--Chart--%>
                            <telerik:RadHtmlChart ID="RetailOnlySalesCompanyRHC1" runat="server" DataSourceID="RetailOnlySalesCompanyODS1" Skin="MetroTouch">
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
                            <asp:ObjectDataSource ID="RetailOnlySalesCompanyODS1" runat="server" SelectMethod="usp_RetailOnlySalesCompany" TypeName="Test.BLL.Financial.RetailOnlySalesCompanyBL">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <%--Table--%>
                            <telerik:RadGrid ID="RetailOnlySalesComG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="RetailOnlySalesCompanyODS1" ShowGroupPanel="True" Skin="Bootstrap">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" DataSourceID="RetailOnlySalesCompanyODS1">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Retail_Total_Only" DataFormatString="{0:N0}" DataType="System.Decimal" FilterControlAltText="Filter Retail_Total_Only column" HeaderText="Retail Total Only" SortExpression="Retail_Total_Only" UniqueName="Retail_Total_Only">
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
                        <h2>Service Only Sales Company Wide</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                            <%--Chart--%>
                            <telerik:RadHtmlChart ID="ServiceOnlySalesCompanyRHC1" runat="server" DataSourceID="ServiceOnlySalesCompanyODS1" Skin="Metro">
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
                            <asp:ObjectDataSource ID="ServiceOnlySalesCompanyODS1" runat="server" SelectMethod="usp_ServiceOnlySalesCompany" TypeName="Test.BLL.Financial.ServiceOnlySalesCompanyBL">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <%--Table--%>
                            <telerik:RadGrid ID="ServiceOnlySalesComG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="ServiceOnlySalesCompanyODS1" ShowGroupPanel="True" Skin="Bootstrap">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" DataSourceID="ServiceOnlySalesCompanyODS1">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Service_Total_Only" DataFormatString="{0:N0}" DataType="System.Decimal" FilterControlAltText="Filter Service_Total_Only column" HeaderText="Service Total Only" SortExpression="Service_Total_Only" UniqueName="Service_Total_Only">
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


