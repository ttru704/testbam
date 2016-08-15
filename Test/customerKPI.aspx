<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="customerKPI.aspx.cs" Inherits="Test.customerkpi" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server"></telerik:RadStyleSheetManager>
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="Button1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="UniqueCustomersSeenCompanyRHC1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="UniqueCustomersSeenCompanyODC1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="UniqueCustomersSeenBranchRHC1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="AnimalsSeenCompanyRHC1" UpdatePanelCssClass="" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="AnimalsSeenBranchRHC1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="AvgDollarPerCustomerCompanyRHC1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="AvgDollarPerCustomerBranchRHC1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="NewCustomersCompanyRHC1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="NewCustomersBranchRHC1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="SmallAnimalsCompanyRHC1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="LargeAnimalsCompanyRHC1" UpdatePanelCssClass="" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <div class="right_col" role="main">
            <%--KPI menu--%>
            <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="2" Skin="MetroTouch" Style="overflow: visible" MultiPageID="RadMultiPage1">
                <Tabs>
                    <telerik:RadTab runat="server" NavigateUrl="~/financialKPI.aspx" Text="Financial " Width="150px">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" NavigateUrl="~/employeeKPI.aspx" Text="Employee" Width="150px">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" NavigateUrl="~/customerKPI.aspx" Text="Customer" Width="150px" Selected="True" SelectedIndex="0">
                        <Tabs>
                            <telerik:RadTab runat="server" Text="Company" Selected="True">
                            </telerik:RadTab>
                            <telerik:RadTab runat="server" Text="Branch">
                            </telerik:RadTab>
                        </Tabs>
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <br />
            <%--Datepickers and input--%>
            <div class="text-center">
                <telerik:RadDatePicker ID="DatePicker1" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-05-01" SelectedDate="2015-05-01" Height="24px" Width="197px">
                    <DatePopupButton
                        CssClass="rcCalPopup"
                        Width="2em" />
                </telerik:RadDatePicker>
                <telerik:RadDatePicker ID="DatePicker2" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-09-30" SelectedDate="2015-09-30" Height="24px" Width="197px">
                    <DatePopupButton
                        CssClass="rcCalPopup"
                        Width="2em" />
                </telerik:RadDatePicker>
                <asp:DropDownList ID="CompanyDDL1" runat="server" Width="100px" Visible="false">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                </asp:DropDownList>
                <telerik:RadDropDownList ID="BranchDDL1" runat="server" AppendDataBoundItems="True" DataSourceID="BranchDropDownODS1" DataTextField="Branch_Name" DataValueField="Ref_Number" Height="24px" Width="197px">
                    <Items>
                        <telerik:DropDownListItem Text="All Branches" Value="0" />
                    </Items>
                </telerik:RadDropDownList>
                <telerik:RadDropDownList ID="TimeDDL1" runat="server" Height="24px" Width="197px">
                    <Items>
                        <telerik:DropDownListItem Text="Weekly" Value="3" />
                        <telerik:DropDownListItem Text="Monthly" Value="1" Selected="true" />
                        <telerik:DropDownListItem Text="Yearly" Value="2" />
                        
                    </Items>
                </telerik:RadDropDownList>

                <telerik:RadButton ID="Button1" runat="server" Text="View" OnClick="Button1_Click"></telerik:RadButton>
                <asp:ObjectDataSource ID="BranchDropDownODS1" runat="server" SelectMethod="usp_BranchDropDownList" TypeName="Test.BLL.BranchDropDownListBL">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>

            <br />
            <%--Display Number of Unique Customers Seen by a company--%>
            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Number of Unique Customers Seen Companywide</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                            <%--Chart--%>
                            <telerik:RadHtmlChart ID="UniqueCustomersSeenCompanyRHC1" runat="server" DataSourceID="UniqueCustomersSeenCompanyODC1" Skin="MetroTouch">
                                <PlotArea>
                                    <Series>
                                        <telerik:ColumnSeries DataFieldY="Number_of_Unique_Clients">
                                            <TooltipsAppearance DataFormatString="N0"></TooltipsAppearance>
                                            <LabelsAppearance DataFormatString="N0"></LabelsAppearance>
                                        </telerik:ColumnSeries>
                                    </Series>
                                    <XAxis DataLabelsField="TimePeriod" Type="auto">
                                        <TitleAppearance Text="Time Period">
                                            <TextStyle Margin="20" />
                                        </TitleAppearance>
                                        <LabelsAppearance DataFormatString="MMM yyyy">
                                        </LabelsAppearance>
                                        <MajorGridLines Visible="false" />
                                        <MinorGridLines Visible="false" />
                                    </XAxis>
                                    <YAxis>
                                        <TitleAppearance Text="No of Unique Customers">
                                            <TextStyle Margin="20" />
                                        </TitleAppearance>
                                        <MinorGridLines Visible="false" />
                                    </YAxis>
                                </PlotArea>

                                <ChartTitle Text="No of Unique Customers Companywide">
                                </ChartTitle>
                                <Zoom Enabled="False"></Zoom>
                            </telerik:RadHtmlChart>
                            <%--Table--%>
                            <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="UniqueCustomersSeenCompanyODC1" CellSpacing="-1" GridLines="Both" ShowGroupPanel="True" Skin="MetroTouch">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True" AllowDragToGroup="True">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <MasterTableView AllowPaging="False" AllowSorting="False" AutoGenerateColumns="False" DataSourceID="UniqueCustomersSeenCompanyODC1">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Time_Period" FilterControlAltText="Filter Time_Period column" HeaderText="Time_Period" SortExpression="Time_Period" UniqueName="Time_Period" DataType="System.DateTime">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Number_of_Unique_Clients" DataType="System.Int32" FilterControlAltText="Filter Number_of_Unique_Clients column" HeaderText="Number_of_Unique_Clients" SortExpression="Number_of_Unique_Clients" UniqueName="Number_of_Unique_Clients">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="TimePeriod" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                            <%--Datasource--%>
                            <asp:ObjectDataSource ID="UniqueCustomersSeenCompanyODC1" runat="server" SelectMethod="usp_UniqueCustomersSeenCompany" TypeName="Test.BLL.Customer.UniqueCustomersSeenCompanyBL">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-30" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </div>
                    </div>
                </div>
            </div>
            <%--Display Number of Unique Customers Seen branch comparison--%>
            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Number of Unique Customers Seen Branch Comparison</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                            <%--Chart--%>
                            <telerik:RadHtmlChart ID="UniqueCustomersSeenBranchRHC1" runat="server" Skin="Material">
                                <ChartTitle Text="Number of Unique Clients Seen">
                                </ChartTitle>

                                <PlotArea>
                                </PlotArea>

                                <Zoom Enabled="False"></Zoom>
                            </telerik:RadHtmlChart>

                            <%--Export button--%>
                            <telerik:RadButton ID="RadButton1" runat="server" OnClick="RadButton1_Click" Skin="Metro" Text="Export to Excel">
                            </telerik:RadButton>

                            <br />
                            <%--Table--%>
                            <telerik:RadGrid ID="RadGrid2" runat="server" AllowPaging="True" AllowSorting="True" OnExcelMLWorkBookCreated="RadGrid2_ExcelMLWorkBookCreated" DataSourceID="UniqueCustomersSeenBranchODC1" AllowFilteringByColumn="True" CellSpacing="-1" GridLines="Both" ShowGroupPanel="True" Skin="MetroTouch">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                <ExportSettings IgnorePaging="True">
                                    <Pdf PaperSize="A4" DefaultFontFamily="Arial Unicode MS" PageTopMargin="45mm"
                                        BorderStyle="Medium" BorderColor="#666666" PageHeight="210mm" PageWidth="297mm">
                                    </Pdf>
                                    <Excel Format="Xlsx" />
                                </ExportSettings>
                                <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True" AllowDragToGroup="True">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" DataSourceID="UniqueCustomersSeenBranchODC1">
                                    <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="false" />
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
                                        <telerik:GridBoundColumn DataField="TimePeriod" AllowFiltering="false" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Number_of_Unique_Clients" DataFormatString="{0:N0}" AllowFiltering="false" DataType="System.Int32" FilterControlAltText="Filter Number_of_Unique_Clients column" HeaderText="Number of Unique Clients" SortExpression="Number_of_Unique_Clients" UniqueName="Number_of_Unique_Clients">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                            <%--Datasource--%>
                            <asp:ObjectDataSource ID="UniqueCustomersSeenBranchODC1" runat="server" SelectMethod="usp_UniqueCustomersSeenBranch" TypeName="Test.BLL.Customer.UniqueCustomersSeenBranchBL">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-30" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="BranchDDL1" DefaultValue="0" Name="branchRef" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </div>
                    </div>
                </div>
            </div>
            <%--Display Number of Animals Seen Companywide--%>
            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Number of Animals Seen Companywide</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                            <ul class="to_do">
                                <%--Chart--%>
                                <telerik:RadHtmlChart ID="AnimalsSeenCompanyRHC1" runat="server" DataSourceID="AnimalsSeenCompanyODS1" Skin="Vista">
                                    <PlotArea>
                                        <Series>
                                            <telerik:LineSeries Name="No of Animals Seen" DataFieldY="Number_of_animals_seen">
                                                <TooltipsAppearance DataFormatString="N0"></TooltipsAppearance>
                                                <LabelsAppearance DataFormatString="N0"></LabelsAppearance>
                                            </telerik:LineSeries>
                                        </Series>

                                        <XAxis DataLabelsField="TimePeriod" Type="Auto">
                                            <TitleAppearance Text="Period">
                                                <TextStyle Margin="20" />
                                            </TitleAppearance>
                                            <LabelsAppearance DataFormatString="MMM yyyy">
                                            </LabelsAppearance>
                                            <MajorGridLines Visible="false" />
                                            <MinorGridLines Visible="false" />
                                        </XAxis>

                                        <YAxis>
                                            <TitleAppearance Text="No of Animals Seen">
                                                <TextStyle Margin="20" />
                                            </TitleAppearance>
                                            <MinorGridLines Visible="false" />
                                        </YAxis>
                                    </PlotArea>

                                    <ChartTitle Text="Number of Animals Seens Companywide">
                                    </ChartTitle>
                                    <Zoom Enabled="False"></Zoom>
                                </telerik:RadHtmlChart>
                                <%--Datasource--%>
                                <asp:ObjectDataSource ID="AnimalsSeenCompanyODS1" runat="server" SelectMethod="usp_AnimalsSeenCompany" TypeName="Test.BLL.Customer.AnimalsSeenCompanyBL">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                        <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-30" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                        <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <%--Table--%>
                                <telerik:RadGrid ID="AnimalsSeenComG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="AnimalsSeenCompanyODS1" ShowGroupPanel="True" Skin="MetroTouch" CellSpacing="-1" GridLines="Both">
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                    <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                        <Selecting AllowRowSelect="True" />
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" DataSourceID="AnimalsSeenCompanyODS1">
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Number_of_animals_seen" DataType="System.Int32" FilterControlAltText="Filter Number_of_animals_seen column" HeaderText="Number of Animals Seen" SortExpression="Number_of_animals_seen" UniqueName="Number_of_animals_seen">
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <%--Display Number of Animals Seen Branch Comparison--%>
            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Number of Animals Seen Branch Comparison</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                            <%--Chart--%>
                            <telerik:RadHtmlChart ID="AnimalsSeenBranchRHC1" runat="server" Skin="Metro"></telerik:RadHtmlChart>
                            <%--Datasource--%>
                            <asp:ObjectDataSource ID="AnimalsSeenBranchODS1" runat="server" SelectMethod="usp_AnimalsSeenBranch" TypeName="Test.BLL.Customer.AnimalsSeenBranchBL">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-30" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="BranchDDL1" DefaultValue="0" Name="branchRef" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <%--Table--%>
                            <telerik:RadGrid ID="AnimalsSeenBranchG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="AnimalsSeenBranchODS1" ShowGroupPanel="True" Skin="MetroTouch">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" DataSourceID="AnimalsSeenBranchODS1">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Branch_Name" FilterControlAltText="Filter Branch_Name column" HeaderText="Branch" SortExpression="Branch_Name" UniqueName="Branch_Name">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Number_of_animals_seen" DataFormatString="{0:N0}" DataType="System.Int32" FilterControlAltText="Filter Number_of_animals_seen column" HeaderText="Number of Animals Seen" SortExpression="Number_of_animals_seen" UniqueName="Number_of_animals_seen">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </div>
                    </div>
                </div>
            </div>
            <%--This section is for Average dollar per customer companywide  chart--%>
            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Average Dollar Earned per Customer Companywide</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                            <%--Chart--%>
                            <telerik:RadHtmlChart ID="AvgDollarPerCustomerCompanyRHC1" runat="server" DataSourceID="AvgDollarPerCustomerCompanyODS1" Skin="Metro">
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
                                        <telerik:AreaSeries Name="Average Dollar per Customer" DataFieldY="Average_Dollar_per_customer">
                                            <Appearance>
                                                <FillStyle BackgroundColor="Orange" />
                                            </Appearance>
                                            <MarkersAppearance MarkersType="Circle" BackgroundColor="White" />
                                            <TooltipsAppearance DataFormatString="C0" BackgroundColor="White" />
                                            <LabelsAppearance Visible="false">
                                            </LabelsAppearance>
                                        </telerik:AreaSeries>
                                    </Series>
                                </PlotArea>

                                <ChartTitle Text="Average Dollar Value per Customer ">
                                </ChartTitle>
                            </telerik:RadHtmlChart>
                            <%--Datasource--%>
                            <asp:ObjectDataSource ID="AvgDollarPerCustomerCompanyODS1" runat="server" SelectMethod="usp_AvgDollarPerCustomerCompany" TypeName="Test.BLL.Customer.AvgDollarPerCustomerCompanyBL">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-30" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <%--Table--%>
                            <telerik:RadGrid ID="AvgDollarPerCustomerCompanyG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="AvgDollarPerCustomerCompanyODS1" ShowGroupPanel="True" Skin="MetroTouch" CellSpacing="-1" GridLines="Both">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" DataSourceID="AvgDollarPerCustomerCompanyODS1">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Average_Dollar_per_customer" DataType="System.Decimal" FilterControlAltText="Filter Average_Dollar_per_customer column" HeaderText="Average Dollar per Customer" SortExpression="Average_Dollar_per_customer" UniqueName="Average_Dollar_per_customer">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </div>
                    </div>
                </div>
            </div>
            <%--This section is for Average dollar per customer branch comparison  chart--%>
            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Average Dollar Earned per Customer Branch Comparison</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                            <%--Chart--%>
                            <telerik:RadHtmlChart ID="AvgDollarPerCustomerBranchRHC1" runat="server" Skin="Metro"></telerik:RadHtmlChart>
                            <%--Datasource--%>
                            <asp:ObjectDataSource ID="AvgDollarPerCustomerBranchODS1" runat="server" SelectMethod="usp_AvgDollarPerCustomerBranch" TypeName="Test.BLL.Customer.AvgDollarPerCustomerBranchBL">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:Parameter DefaultValue="0" Name="branchRef" Type="Int32" />
                                    <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <%--Table--%>
                            <telerik:RadGrid ID="AvgDollarPerCustomerBranchG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="AvgDollarPerCustomerBranchODS1" ShowGroupPanel="True" Skin="MetroTouch">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" DataSourceID="AvgDollarPerCustomerBranchODS1">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Branch_Name" FilterControlAltText="Filter Branch_Name column" HeaderText="Branch" SortExpression="Branch_Name" UniqueName="Branch_Name">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Average_Dollar_per_customer" DataFormatString="{0:N0}" DataType="System.Decimal" FilterControlAltText="Filter Average_Dollar_per_customer column" HeaderText="Average Dollar per Customer" SortExpression="Average_Dollar_per_customer" UniqueName="Average_Dollar_per_customer">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </div>
                    </div>
                </div>
            </div>
            <%--This section is for Number of New Customers companywide  chart--%>
            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Number of New Customers Companywide</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                            <%--Chart--%>
                            <telerik:RadHtmlChart ID="NewCustomersCompanyRHC1" runat="server" DataSourceID="NewCustomersCompanyODS1" Skin="Silk">
                                <PlotArea>
                                    <Series>
                                        <telerik:ColumnSeries DataFieldY="Number_of_New_Customers">
                                            <TooltipsAppearance DataFormatString="N0"></TooltipsAppearance>
                                            <LabelsAppearance DataFormatString="N0"></LabelsAppearance>
                                        </telerik:ColumnSeries>
                                    </Series>
                                    <XAxis DataLabelsField="TimePeriod" Type="auto">
                                        <TitleAppearance Text="Time Period">
                                            <TextStyle Margin="20" />
                                        </TitleAppearance>
                                        <LabelsAppearance DataFormatString="MMM yyyy">
                                        </LabelsAppearance>
                                        <MajorGridLines Visible="false" />
                                        <MinorGridLines Visible="false" />
                                    </XAxis>
                                    <YAxis>
                                        <TitleAppearance Text="No of New Customers">
                                            <TextStyle Margin="20" />
                                        </TitleAppearance>
                                        <MinorGridLines Visible="false" />
                                    </YAxis>
                                </PlotArea>

                                <ChartTitle Text="No of New Customers Companywide">
                                </ChartTitle>
                            </telerik:RadHtmlChart>
                            <%--Datasource--%>
                            <asp:ObjectDataSource ID="NewCustomersCompanyODS1" runat="server" SelectMethod="usp_NewCustomersCompany" TypeName="Test.BLL.Customer.NewCustomersCompanyBL">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-30" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <%--Table--%>
                            <telerik:RadGrid ID="NewCustomersCompanyG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="NewCustomersCompanyODS1" ShowGroupPanel="True" Skin="MetroTouch" CellSpacing="-1" GridLines="Both">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" DataSourceID="NewCustomersCompanyODS1">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Number_of_New_Customers" DataType="System.Int32" FilterControlAltText="Filter Number_of_New_Customers column" HeaderText="Number of New Customers" SortExpression="Number_of_New_Customers" UniqueName="Number_of_New_Customers">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </div>
                    </div>
                </div>
            </div>
            <%--This section is for Number of New Customers Branch Comparison--%>
            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Number of New Customers Branch Comparison</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                            <%--Chart--%>
                            <telerik:RadHtmlChart ID="NewCustomersBranchRHC1" runat="server">
                                <ChartTitle Text="No of New Customers Branch Comparison">
                                </ChartTitle>
                            </telerik:RadHtmlChart>
                            <%--Datasource--%>
                            
                            <%--Table--%>
                            
                        </div>
                    </div>
                </div>
            </div>
            <%--This section is for Number of Small Animals companywide  chart--%>
            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Number of Small Animals Companywide</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                            <%--Chart--%>
                            <telerik:RadHtmlChart ID="SmallAnimalsCompanyRHC1" runat="server" DataSourceID="SmallAnimalsCompanyODS1" Skin="Material">
                                <PlotArea>
                                    <Series>
                                        <telerik:LineSeries Name="Small Animals" DataFieldY="Number_of_Small_Animals">
                                            <TooltipsAppearance DataFormatString="N0"></TooltipsAppearance>
                                            <LabelsAppearance DataFormatString="N0"></LabelsAppearance>
                                        </telerik:LineSeries>
                                    </Series>

                                    <XAxis DataLabelsField="TimePeriod" Type="Auto">
                                        <TitleAppearance Text="Period">
                                            <TextStyle Margin="20" />
                                        </TitleAppearance>
                                        <LabelsAppearance DataFormatString="MMM yyyy">
                                        </LabelsAppearance>
                                        <MajorGridLines Visible="false" />
                                        <MinorGridLines Visible="false" />
                                    </XAxis>

                                    <YAxis>
                                        <TitleAppearance Text="No of Small Animals">
                                            <TextStyle Margin="20" />
                                        </TitleAppearance>
                                        <MinorGridLines Visible="false" />
                                    </YAxis>
                                </PlotArea>

                                <ChartTitle Text="Number of Small Animals Companywide">
                                </ChartTitle>
                            </telerik:RadHtmlChart>
                            <%--Datasource--%>
                            <asp:ObjectDataSource ID="SmallAnimalsCompanyODS1" runat="server" SelectMethod="usp_SmallAnimalsCompany" TypeName="Test.BLL.Customer.SmallAnimalsCompanyBL">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <%--Table--%>
                            <telerik:RadGrid ID="SmallAnimalsCompanyG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SmallAnimalsCompanyODS1" ShowGroupPanel="True" Skin="MetroTouch" CellSpacing="-1" GridLines="Both">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" DataSourceID="SmallAnimalsCompanyODS1">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Number_of_Small_Animals" DataType="System.Int32" FilterControlAltText="Filter Number_of_Small_Animals column" HeaderText="Number of Small Animals" SortExpression="Number_of_Small_Animals" UniqueName="Number_of_Small_Animals">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </div>
                    </div>
                </div>
            </div>
            <%--This section is for Number of Large Animals companywide  chart--%>
            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Number of Large Animals Companywide</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                            <%--Chart--%>
                            <telerik:RadHtmlChart ID="LargeAnimalsCompanyRHC1" runat="server" DataSourceID="LargeAnimalsCompanyODS1">
                                <PlotArea>
                                    <Series>
                                        <telerik:LineSeries Name="Large Animals" DataFieldY="Number_of_Large_Animals">
                                            <TooltipsAppearance DataFormatString="N0"></TooltipsAppearance>
                                            <LabelsAppearance DataFormatString="N0"></LabelsAppearance>
                                        </telerik:LineSeries>
                                    </Series>

                                    <XAxis DataLabelsField="TimePeriod" Type="Auto">
                                        <TitleAppearance Text="Period">
                                            <TextStyle Margin="20" />
                                        </TitleAppearance>
                                        <LabelsAppearance>
                                        </LabelsAppearance>
                                        <MajorGridLines Visible="false" />
                                        <MinorGridLines Visible="false" />
                                    </XAxis>

                                    <YAxis>
                                        <TitleAppearance Text="No of Large Animals">
                                            <TextStyle Margin="20" />
                                        </TitleAppearance>
                                        <MinorGridLines Visible="false" />
                                    </YAxis>
                                </PlotArea>

                                <ChartTitle Text="Number of Large Animals Companywide">
                                </ChartTitle>
                            </telerik:RadHtmlChart>

                            <%--Datasource--%>
                            <asp:ObjectDataSource ID="LargeAnimalsCompanyODS1" runat="server" SelectMethod="usp_LargeAnimalsCompany" TypeName="Test.BLL.Customer.LargeAnimalsCompanyBL">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <%--Table--%>
                            <telerik:RadGrid ID="LargeAnimalsCompanyG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="LargeAnimalsCompanyODS1" ShowGroupPanel="True" Skin="MetroTouch">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" DataSourceID="LargeAnimalsCompanyODS1">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Number_of_Large_Animals" DataType="System.Int32" FilterControlAltText="Filter Number_of_Large_Animals column" HeaderText="Number of Large Animals" SortExpression="Number_of_Large_Animals" UniqueName="Number_of_Large_Animals">
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
        (function () {
            var demo = window.demo = {};

            demo.onRequestStart = function (sender, args) {
                if (args.get_eventTarget().indexOf("Button") >= 0) {
                    args.set_enableAjax(false);
                }
            }
        })();
    </script>
</asp:Content>
