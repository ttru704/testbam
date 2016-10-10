<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FCompanyCS.ascx.cs" Inherits="Test.FCompanyCS" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<div class="demo-container size-thin">
    <%--Export Manager for exporting--%>
    <telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"></telerik:RadClientExportManager>
    <%--RadPanelBar which holds all the RadPanel Items--%>
    <%--RadPanel Items hold all the KPI information (Graphs and Tables)--%>
    <telerik:RadPanelBar RenderMode="Lightweight" runat="server" ID="RadPanelBar1" Width="100%" Skin="MetroTouch">
        <Items>
            <%--This section is for Total Sales Company--%>
            <telerik:RadPanelItem Text="Total Sales - Company" Expanded="false" Visible="false">
                <ContentTemplate>
                    <%--This export manager is for all the KPI charts--%>
                    <%--Chart--%>
                    <br />
                    <%--Class for Export which sets the area for the hover to show Chart export button--%>
                    <div class="export">
                        <%--Button for the Chart Export--%>
                        <telerik:RadButton ID="TotalSalesCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportTotalSalesCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <%--The RadHtmlChart for Total Sales for Company-wide --%>
                        <div class="border">
                        <telerik:RadHtmlChart ID="TotalSalesCompanyRHC1" runat="server" RenderMode="Lightweight" RenderAs="Canvas" Transitions="true" DataSourceID="TotalSalesCompanyODS" Skin="Bootstrap">
                            <ClientEvents OnLoad="formatTotalSalesCompanyRHC1" />
                            <%--Enabling the Pan and Zoom--%>
                            <Pan Enabled="true" Lock="Y" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="Y" />
                                <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                            </Zoom>
                            <%--Formatting Plot Area--%>
                            <PlotArea>
                                <Series>
                                    <%--Tells which column in the data is used for plotting graph--%>
                                    <telerik:ColumnSeries DataFieldY="Total_Sales">
                                        <LabelsAppearance DataFormatString="N0"></LabelsAppearance>
                                        <TooltipsAppearance DataFormatString="C0"></TooltipsAppearance>
                                        <Appearance Overlay-Gradient="None"></Appearance>
                                    </telerik:ColumnSeries>
                                </Series>
                                <%--Formats the X axis eg. Labels--%>
                                <XAxis DataLabelsField="TimePeriod" Type="Auto">
                                    <TitleAppearance Text="Time Period">
                                        <TextStyle Margin="20" />
                                    </TitleAppearance>
                                    <MinorGridLines Visible="false" />
                                    <MajorGridLines Visible="false" />
                                    <LabelsAppearance RotationAngle="65"></LabelsAppearance>
                                </XAxis>
                                <%--Formats the Y axis eg. Labels--%>
                                <YAxis>
                                    <TitleAppearance Position="Center">
                                    </TitleAppearance>
                                    <MinorGridLines Visible="false" />
                                </YAxis>
                            </PlotArea>
                            <%--Gives the Chart Title--%>
                            <ChartTitle Text="Total Sales Company-Wide">
                            </ChartTitle>
                        </telerik:RadHtmlChart>
                        </div>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="TotalSalesCompanyODS" runat="server" SelectMethod="usp_TotalSalesCompany" TypeName="Test.BLL.Financial.TotalSalesCompanyBL">
                        <SelectParameters>
                            <%--Establishes the parameters of the object data source--%>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="Time" DefaultValue="" Name="timeType" Type="Int32"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <hr />
                    <div class="padding">
                    <telerik:RadGrid ID="TotalSalesComG1" runat="server" RenderMode="Lightweight" AllowPaging="True" DataSourceID="TotalSalesCompanyODS" ExportSettings-FileName="Total Sales Company-Wide" ShowGroupPanel="True" OnItemCommand="ExportGridCustomiser" AllowSorting="True">
                        <%--Settings for the Drag and Drop Bar--%>
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>

                        <MasterTableView Width="100%" CommandItemDisplay="Top" AutoGenerateColumns="False" AllowFilteringByColumn="True" DataSourceID="TotalSalesCompanyODS">
                            <%--Display export button on radgrid--%>
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Total_Sales" DataFormatString="{0:N0}" DataType="System.Decimal" FilterControlAltText="Filter Total_Sales column" HeaderText="Total Sales" SortExpression="Total_Sales" UniqueName="Total_Sales">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                        <FilterMenu RenderMode="Lightweight"></FilterMenu>
                    </telerik:RadGrid>
                        </div>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Average Dollar Earned Per Transaction Companywide--%>
            <telerik:RadPanelItem Text="Average Dollar per Transaction - Company" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <br />
                    <div class="export">
                        <telerik:RadButton ID="AvgDollarPerTransactionCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportAvgDollarPerTransactionCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <div class="border">
                        <telerik:RadHtmlChart ID="AvgDollarPerTransactionCompanyRHC1" RenderMode="Lightweight" RenderAs="Canvas" Transitions="false" runat="server" DataSourceID="AvgDollarPerTransactionCompanyODS1" Skin="Material">
                            <Pan Enabled="true" Lock="Y" />
                            <ClientEvents  OnLoad="formatAvgDollarPerTransactionCompanyRHC1"/>
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
                                    <MinorGridLines Visible="false" />
                                    <MajorGridLines Visible="false" />
                                </XAxis>
                                <YAxis Color="Black">
                                    <MajorGridLines Color="#EFEFEF" Width="1" />
                                    <MinorGridLines Color="#F7F7F7" Width="1" Visible="false" />
                                    <TitleAppearance Position="Center" Text="$" />
                                </YAxis>
                                <Series>
                                    <telerik:AreaSeries Name="Average Per Transaction" DataFieldY="Average_Dollar_per_Transaction">
                                        <Appearance Overlay-Gradient="None">
                                            <FillStyle BackgroundColor="Orange" />
                                        </Appearance>
                                        <MarkersAppearance MarkersType="Circle" BackgroundColor="White" />
                                        <TooltipsAppearance Visible="true" DataFormatString="C2" />
                                        <LabelsAppearance Visible="false">
                                        </LabelsAppearance>
                                    </telerik:AreaSeries>
                                </Series>
                            </PlotArea>

                            <ChartTitle Text="Average Dollar Value per Transaction Company-Wide ">
                            </ChartTitle>
                        </telerik:RadHtmlChart>
                            </div>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="AvgDollarPerTransactionCompanyODS1" runat="server" SelectMethod="usp_AvgDollarPerTransactionCompany" TypeName="Test.BLL.Financial.AvgDollarPerTransactionCompanyBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="Time" DefaultValue="" Name="timeType" Type="Int32"></asp:SessionParameter>


                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <hr />
                    <div class="padding">
                    <telerik:RadGrid ID="AvgPerTransactionComG1" runat="server" RenderMode="Lightweight" AllowPaging="True" AllowSorting="True" DataSourceID="AvgDollarPerTransactionCompanyODS1" ExportSettings-FileName="Average Dollar Per Transaction Company-wide" ShowGroupPanel="True" OnItemCommand="ExportGridCustomiser">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>

                        <MasterTableView Width="100%" CommandItemDisplay="Top" AutoGenerateColumns="False" AllowFilteringByColumn="True" DataSourceID="AvgDollarPerTransactionCompanyODS1">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Average_Dollar_per_Transaction" DataType="System.Decimal" FilterControlAltText="Filter Average_Dollar_per_Transaction column" HeaderText="Average Dollar per Transaction" SortExpression="Average_Dollar_per_Transaction" UniqueName="Average_Dollar_per_Transaction" DataFormatString="{0:N0}">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                        <FilterMenu RenderMode="Lightweight"></FilterMenu>
                    </telerik:RadGrid>
                        </div>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Number of Transactions excluding Zero Total Bills companywide presented on column chart--%>
            <telerik:RadPanelItem Text="Number of Transactions excluding zero total bills - Company" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <br />
                    <div class="export">
                        <telerik:RadButton ID="TransExcludeZeroTotalCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportTransExcludeZeroTotalCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <div class="border">
                        <telerik:RadHtmlChart ID="TransExcludeZeroTotalCompanyRHC1" RenderMode="Lightweight" RenderAs="Canvas" Transitions="false" runat="server" DataSourceID="TransExcludeZeroTotalCompanyODS1" Skin="MetroTouch">
                            <Pan Enabled="true" Lock="Y" />
                            <ClientEvents OnLoad="formatTransExcludeZeroTotalCompanyRHC1" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="Y" />
                                <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                            </Zoom>

                            <PlotArea>
                                <Series>
                                    <telerik:ColumnSeries DataFieldY="No_of_transactions_excluding_zero_total_bill">
                                        <LabelsAppearance DataFormatString="N0">
                                        </LabelsAppearance>
                                        <Appearance Overlay-Gradient="None"></Appearance>
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
                                    </TitleAppearance>
                                    <MinorGridLines Visible="false" />
                                </YAxis>
                            </PlotArea>

                            <ChartTitle Text="No of Transactions excluding Zero Total Bills Company-Wide">
                            </ChartTitle>
                        </telerik:RadHtmlChart>
                            </div>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="TransExcludeZeroTotalCompanyODS1" runat="server" SelectMethod="usp_TransExcludeZeroTotalCompany" TypeName="Test.BLL.Financial.TransExcludeZeroTotalCompanyBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="Time" DefaultValue="" Name="timeType" Type="Int32"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <%--Line and break--%>
                    <hr />
                    <div class="padding">
                    <telerik:RadGrid ID="TransExcludeZeroTotalComG1" RenderMode="Lightweight" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="TransExcludeZeroTotalCompanyODS1" ShowGroupPanel="True" OnItemCommand="ExportGridCustomiser" ExportSettings-FileName="Transactions Excl Zero Total Company-wide">
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <MasterTableView Width="100%" CommandItemDisplay="Top" AutoGenerateColumns="False" AllowFilteringByColumn="True" DataSourceID="TransExcludeZeroTotalCompanyODS1">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="No_of_transactions_excluding_zero_total_bill" DataFormatString="{0:N0}" DataType="System.Int32" FilterControlAltText="Filter No_of_transactions_excluding_zero_total_bill column" HeaderText="No of Transactions excluding Zero Total Bill" SortExpression="No_of_transactions_excluding_zero_total_bill" UniqueName="No_of_transactions_excluding_zero_total_bill">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                        <FilterMenu RenderMode="Lightweight"></FilterMenu>
                    </telerik:RadGrid>
                        </div>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Retail Only Sales companywide chart--%>
            <telerik:RadPanelItem Text="Retail Only Sales - Company" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <br />
                    <%--Class for Export which sets the area for the hover to show Chart export button--%>
                    <div class="export">
                        <%--Button for the Chart Export--%>
                        <telerik:RadButton ID="RetailOnlySalesCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportRetailOnlySalesCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <%--The RadHtmlChart for Retail Only Sales for Company-wide --%>
                        <div class="border">
                        <telerik:RadHtmlChart ID="RetailOnlySalesCompanyRHC1" RenderMode="Lightweight" RenderAs="Canvas" Transitions="false" runat="server" DataSourceID="RetailOnlySalesCompanyODS1" Skin="MetroTouch">
                            <ClientEvents OnLoad="formatRetailOnlySalesCompanyRHC1" />
                            <Pan Enabled="true" Lock="Y" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="Y" />
                                <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                            </Zoom>
                            <Legend>
                                <Appearance Position="Bottom" />
                            </Legend>
                            <PlotArea>
                                <%--Format the X axis eg. labels--%>
                                <XAxis Color="Black" DataLabelsField="TimePeriod" Type="Auto">
                                    <TitleAppearance Position="Center" Text="Time Period" />
                                    <LabelsAppearance DataFormatString="MMM yy">
                                    </LabelsAppearance>
                                    <MajorGridLines Visible="false" />
                                    <MinorGridLines Visible="false" />
                                </XAxis>
                                <%--Format for the Y axis--%>
                                <YAxis Color="Black">
                                    <MajorGridLines Color="#EFEFEF" Width="1" />
                                    <MinorGridLines Color="#F7F7F7" Width="1" Visible="false" />
                                    <TitleAppearance Position="Center" />
                                </YAxis>
                                <%--Format the AreaSeries--%>
                                <Series>
                                    <telerik:AreaSeries Name="Retail Sales" DataFieldY="Retail_Total_Only">
                                        <Appearance Overlay-Gradient="None">
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
                            <%--Gives the Chart its title--%>
                            <ChartTitle Text="Retail Only Sales Company-Wide">
                            </ChartTitle>
                        </telerik:RadHtmlChart>
                            </div>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="RetailOnlySalesCompanyODS1" runat="server" SelectMethod="usp_RetailOnlySalesCompany" TypeName="Test.BLL.Financial.RetailOnlySalesCompanyBL">
                        <SelectParameters>
                            <%--The Parameters required for the ObjectDataSource for the Chart--%>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="Time" DefaultValue="" Name="timeType" Type="Int32"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <hr />
                    <div class="padding">
                    <telerik:RadGrid ID="RetailOnlySalesComG1" RenderMode="Lightweight" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="RetailOnlySalesCompanyODS1" ShowGroupPanel="True" OnItemCommand="ExportGridCustomiser" ExportSettings-FileName="Retail Only Sales Company-wide">
                        <%--Settings for the Drag and Drop Bar--%>
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <%--Shows the Export Settings Bar--%>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView Width="100%" CommandItemDisplay="Top" AutoGenerateColumns="False" AllowFilteringByColumn="True" DataSourceID="RetailOnlySalesCompanyODS1">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <%--Tells Which Columns the table should have--%>
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Retail_Total_Only" DataFormatString="{0:N0}" DataType="System.Decimal" FilterControlAltText="Filter Retail_Total_Only column" HeaderText="Retail Total Only" SortExpression="Retail_Total_Only" UniqueName="Retail_Total_Only">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                        <FilterMenu RenderMode="Lightweight"></FilterMenu>
                    </telerik:RadGrid>
                        </div>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Service Only Sales companywide chart--%>
            <telerik:RadPanelItem Text="Service Only Sales - Company" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <br />
                    <div class="export">
                        <telerik:RadButton ID="ServiceOnlySalesCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportServiceOnlySalesCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <div class="border">
                        <telerik:RadHtmlChart ID="ServiceOnlySalesCompanyRHC1" RenderMode="Lightweight" RenderAs="Canvas" Transitions="false" runat="server" DataSourceID="ServiceOnlySalesCompanyODS1" Skin="Bootstrap">
                            <ClientEvents OnLoad="formatServiceOnlySalesCompanyRHC1" />
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
                                    <MajorGridLines Visible="false" />
                                    <MinorGridLines Visible="false" />
                                </XAxis>
                                <YAxis Color="Black">
                                    <MajorGridLines Color="#EFEFEF" Width="1" />
                                    <MinorGridLines Color="#F7F7F7" Width="1" Visible="false" />
                                    <TitleAppearance Position="Center" />
                                </YAxis>
                                <Series>
                                    <telerik:AreaSeries Name="Service Sales" DataFieldY="Service_Total_Only">
                                        <Appearance Overlay-Gradient="None">
                                            <FillStyle BackgroundColor="Orange" />
                                        </Appearance>
                                        <MarkersAppearance MarkersType="Circle" BackgroundColor="White" />
                                        <TooltipsAppearance BackgroundColor="White" Color="Black" />
                                        <LabelsAppearance Visible="false">
                                        </LabelsAppearance>
                                        <TooltipsAppearance DataFormatString="C0"></TooltipsAppearance>
                                    </telerik:AreaSeries>
                                </Series>
                            </PlotArea>

                            <ChartTitle Text="Service Only Sales Company-Wide">
                            </ChartTitle>
                        </telerik:RadHtmlChart>
                            </div>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="ServiceOnlySalesCompanyODS1" runat="server" SelectMethod="usp_ServiceOnlySalesCompany" TypeName="Test.BLL.Financial.ServiceOnlySalesCompanyBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="Time" DefaultValue="" Name="timeType" Type="Int32"></asp:SessionParameter>


                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <hr />
                    <div class="padding">
                        <telerik:RadGrid ID="ServiceOnlySalesComG1" RenderMode="Lightweight" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="ServiceOnlySalesCompanyODS1" ShowGroupPanel="True" OnItemCommand="ExportGridCustomiser" ExportSettings-FileName="Service Only Sales Company-wide">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True" >
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView Width="100%" CommandItemDisplay="Top" AutoGenerateColumns="False" AllowFilteringByColumn="True" DataSourceID="ServiceOnlySalesCompanyODS1" >
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Service_Total_Only" DataFormatString="{0:N0}" DataType="System.Decimal" FilterControlAltText="Filter Service_Total_Only column" HeaderText="Service Total Only" SortExpression="Service_Total_Only" UniqueName="Service_Total_Only">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                        <FilterMenu RenderMode="Lightweight"></FilterMenu>
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
            var chartTitle = $find(chartId).get_kendoWidget().options.title.text;
            var manager = $find('<%=RadClientExportManager1.ClientID%>');
            var pdfSettings = {
                fileName: chartTitle

            };

            manager.set_pdfSettings(pdfSettings);
            manager.exportPDF($("#" + chartId));
        }
        <%--For panning and zooming and hiding export button--%>
        (function (global) {
            
            //Hide Export Button 

            $("div.export").mouseover(function () {
                $(".RadButton", this).css("display", "inline-block");
            });
            $("div.export").mouseout(function () {
                $(".RadButton", this).css("display", "none");
            });

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

        //format Y axis value based on value
        function formatTotalSalesCompanyRHC1() {
            var chart1 = $find("<%=TotalSalesCompanyRHC1.ClientID%>");
            chart1.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart1.repaint();
        };
        function formatAvgDollarPerTransactionCompanyRHC1() {
            var chart2 = $find("<%=AvgDollarPerTransactionCompanyRHC1.ClientID%>");
            chart2.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart2.repaint();
        };

        function formatTransExcludeZeroTotalCompanyRHC1() {
            var chart3 = $find("<%=TransExcludeZeroTotalCompanyRHC1.ClientID%>");
            chart3.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart3.repaint();
        };

        function formatRetailOnlySalesCompanyRHC1() {
            var chart4 = $find("<%=RetailOnlySalesCompanyRHC1.ClientID%>");
            chart4.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart4.repaint();
        };

        function formatServiceOnlySalesCompanyRHC1() {
            var chart5 = $find("<%=ServiceOnlySalesCompanyRHC1.ClientID%>");
            chart5.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart5.repaint();
        };

    </script>
</telerik:RadScriptBlock>
