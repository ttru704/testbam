﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FCompanyCS.ascx.cs" Inherits="Test.FCompanyCS" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<div class="demo-container size-thin">

    <telerik:RadPanelBar RenderMode="Lightweight" runat="server" ID="RadPanelBar1" Width="100%" Skin="MetroTouch">
        <Items>
            <%--This section is for Total Sales Company--%>
            <telerik:RadPanelItem Text="Total Sales - Company" Expanded="false" Visible="false">
                <ContentTemplate>
                    <%--This export manager is for all the KPI charts--%>
                    <telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"></telerik:RadClientExportManager>
                    <%--Chart--%>
                    <br />
                    <div class="export">
                        <telerik:RadButton ID="TotalSalesCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportTotalSalesCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
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
                                    <TitleAppearance Position="Center">
                                        <TextStyle Margin="20" />
                                    </TitleAppearance>
                                    <MinorGridLines Visible="false" />
                                    <LabelsAppearance DataFormatString="C0">
                                    </LabelsAppearance>
                                </YAxis>
                            </PlotArea>
                            <ChartTitle Text="Total Sales Companywide">
                            </ChartTitle>
                        </telerik:RadHtmlChart>
                    </div>
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
                    <hr />
                    <br />
                    <telerik:RadGrid ID="TotalSalesComG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="TotalSalesCompanyODS" ExportSettings-FileName="TotalSalesCompanyWide" ShowGroupPanel="True" Skin="Bootstrap">
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <MasterTableView Width="100%" CommandItemDisplay="Top" AutoGenerateColumns="False" DataSourceID="TotalSalesCompanyODS">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ExportToCsvText="ExporttoCSV" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Total_Sales" DataFormatString="{0:N0}" DataType="System.Decimal" FilterControlAltText="Filter Total_Sales column" HeaderText="Total Sales" SortExpression="Total_Sales" UniqueName="Total_Sales">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Average Dollar Earned Per Transaction Companywide--%>
            <telerik:RadPanelItem Text="Average Dollar per Transaction - Company" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <div class="export">
                        <telerik:RadButton ID="AvgDollarPerTransactionCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportAvgDollarPerTransactionCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
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
                                    <TitleAppearance Position="Center" Text="$" />
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
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="AvgDollarPerTransactionCompanyODS1" runat="server" SelectMethod="usp_AvgDollarPerTransactionCompany" TypeName="Test.BLL.Financial.AvgDollarPerTransactionCompanyBL">
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
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Number of Transactions excluding Zero Total Bills companywide presented on column chart--%>
            <telerik:RadPanelItem Text="Number of Transactions excluding zero total bills - Company" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <div class="export">
                        <telerik:RadButton ID="TransExcludeZeroTotalCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportTransExcludeZeroTotalCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
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
                    </div>
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
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Income by Product Category Companywide--%>
            <telerik:RadPanelItem Text="Income by Product Category - Company" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <telerik:RadHtmlChart ID="IncomeByProductCategoryComRHC1" runat="server" DataSourceID="IncomeByProductCategoryCompanyODS1" Skin="Bootstrap">
                        <ClientEvents OnLoad="chartLoad" />
                        <ChartTitle Text="Income by Product Category Companywide"></ChartTitle>
                        <PlotArea>
                            <Series>
                                <telerik:PieSeries StartAngle="90" DataFieldY="Income" ExplodeField="IsExploded" NameField="Category_Type" Name="Name">
                                    <LabelsAppearance Visible="false"></LabelsAppearance>
                                    <TooltipsAppearance DataFormatString="{0:N0} %" />
                                </telerik:PieSeries>
                            </Series>
                        </PlotArea>
                        <Zoom Enabled="False"></Zoom>
                    </telerik:RadHtmlChart>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="IncomeByProductCategoryCompanyODS1" runat="server" SelectMethod="usp_IncomeByProductCategoryCompany" TypeName="Test.BLL.Financial.IncomeByProductCategoryCompanyBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="2015-04-01" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="2015-09-01" Name="end" Type="DateTime"></asp:SessionParameter>

                            <asp:Parameter DefaultValue="1" Name="companyRef" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <telerik:RadGrid ID="IncomeByProductCategoryCompanyG1" runat="server" DataSourceID="IncomeByProductCategoryCompanyODS1" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True" Skin="Metro">
                        <ClientSettings AllowDragToGroup="True" AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True"></Selecting>
                        </ClientSettings>

                        <MasterTableView DataSourceID="IncomeByProductCategoryCompanyODS1" AutoGenerateColumns="False">
                            <Columns>
                                <telerik:GridBoundColumn DataField="Category_Type" HeaderText="Product Category" SortExpression="Category_Type" UniqueName="Category_Type" FilterControlAltText="Filter Category_Type column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Income" HeaderText="Income (%)" SortExpression="Income" UniqueName="Income" DataType="System.Decimal" FilterControlAltText="Filter Income column"></telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Income by Service Activity Companywide--%>
            <telerik:RadPanelItem Text="Income by Service Activity - Company" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <telerik:RadHtmlChart ID="IncomeByServiceActivityComRHC1" runat="server" DataSourceID="IncomeByServiceActivityCompanyODS1" Skin="Material">
                        <ClientEvents OnLoad="chartLoad" />
                        <ChartTitle Text="Income by Service Activity Companywide"></ChartTitle>
                        <PlotArea>
                            <Series>
                                <telerik:PieSeries StartAngle="90" DataFieldY="Income" ExplodeField="IsExploded" NameField="Category_Type" Name="Name">
                                    <LabelsAppearance Visible="false"></LabelsAppearance>
                                    <TooltipsAppearance DataFormatString="{0:N0} %" />
                                </telerik:PieSeries>
                            </Series>
                        </PlotArea>
                        <Zoom Enabled="False"></Zoom>
                    </telerik:RadHtmlChart>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="IncomeByServiceActivityCompanyODS1" runat="server" SelectMethod="usp_IncomeByServiceActivityCompany" TypeName="Test.BLL.Financial.IncomeByServiceActivityCompanyBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="2015-04-01" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="2015-09-01" Name="end" Type="DateTime"></asp:SessionParameter>

                            <asp:Parameter DefaultValue="1" Name="companyRef" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <telerik:RadGrid ID="IncomeByServiceActivityCompanyG1" runat="server" DataSourceID="IncomeByServiceActivityCompanyODS1" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True">
                        <ClientSettings AllowDragToGroup="True" AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True"></Selecting>
                        </ClientSettings>

                        <MasterTableView DataSourceID="IncomeByServiceActivityCompanyODS1" AutoGenerateColumns="False">
                            <Columns>
                                <telerik:GridBoundColumn DataField="Category_Type" HeaderText="Service Activity" SortExpression="Category_Type" UniqueName="Category_Type" FilterControlAltText="Filter Category_Type column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Income" HeaderText="Income (%)" SortExpression="Income" UniqueName="Income" DataType="System.Decimal" FilterControlAltText="Filter Income column"></telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Retail Only Sales companywide chart--%>
            <telerik:RadPanelItem Text="Retail Only Sales - Company" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <div class="export">
                        <telerik:RadButton ID="RetailOnlySalesCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportRetailOnlySalesCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
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
                                    <TitleAppearance Position="Center" />
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
                    </div>
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
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Service Only Sales companywide chart--%>
            <telerik:RadPanelItem Text="Service Only Sales - Company" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <div class="export">
                        <telerik:RadButton ID="ServiceOnlySalesCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportServiceOnlySalesCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
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
                                    <TitleAppearance Position="Center" />
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
                    </div>
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
                </ContentTemplate>
            </telerik:RadPanelItem>
        </Items>
        <ExpandAnimation Type="None" />
        <CollapseAnimation Type="None" />
    </telerik:RadPanelBar>
</div>
<telerik:RadScriptBlock runat="server">
    <script>
        //This is very important (without this, the hide export button will stop working)
        var $ = $telerik.$;
        //For Exporting Charts
        function exportTotalSalesCompanyRHC1(sender, args) {
            exportRadHtmlChart('<%=TotalSalesCompanyRHC1.ClientID%>')
        }

        function exportAvgDollarPerTransactionCompanyRHC1(sender, args) {
            exportRadHtmlChart('<%=AvgDollarPerTransactionCompanyRHC1.ClientID%>')
    }

    function exportTransExcludeZeroTotalCompanyRHC1(sender, args) {
        exportRadHtmlChart('<%=TransExcludeZeroTotalCompanyRHC1.ClientID%>')
    }

    function exportRetailOnlySalesCompanyRHC1(sender, args) {
        exportRadHtmlChart('<%=RetailOnlySalesCompanyRHC1.ClientID%>')
    }
    function exportServiceOnlySalesCompanyRHC1(sender, args) {
        exportRadHtmlChart('<%=ServiceOnlySalesCompanyRHC1.ClientID%>')
    }

    function exportRadHtmlChart(chartId) {

        $find('<%=RadClientExportManager1.ClientID%>').exportPDF($("#" + chartId));
    }





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
        function pageLoad() {

            var chart1 = $find("<%=TotalSalesCompanyRHC1.ClientID%>");
            chart1.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart1.repaint();
            var chart2 = $find("<%=AvgDollarPerTransactionCompanyRHC1.ClientID%>");
        chart2.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
        chart2.repaint();
        var chart3 = $find("<%=TransExcludeZeroTotalCompanyRHC1.ClientID%>");
        chart3.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
        chart3.repaint();
        var chart4 = $find("<%=RetailOnlySalesCompanyRHC1.ClientID%>");
        chart4.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
        chart4.repaint();
        var chart5 = $find("<%=ServiceOnlySalesCompanyRHC1.ClientID%>");
            chart5.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart5.repaint();
        }
    
    </script>
</telerik:RadScriptBlock>
