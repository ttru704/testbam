<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CCompanyCS.ascx.cs" Inherits="Test.CCompanyCS" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<div class="demo-container size-thin">
    <%--This export manager is for all the KPI charts--%>
    <telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"></telerik:RadClientExportManager>
    <telerik:RadPanelBar RenderMode="Lightweight" runat="server" ID="RadPanelBar1" Width="100%" Skin="MetroTouch" >
        <Items>
            <%--Display Number of Unique Customers Seen by a company--%>
            <telerik:RadPanelItem Text="Number of Unique Customers Seen - Company" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <br />
                    <div class="export">
                        <telerik:RadButton ID="UniqueCustomersSeenCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportUniqueCustomersSeenCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <telerik:RadHtmlChart ID="UniqueCustomersSeenCompanyRHC1" runat="server" RenderAs="Canvas" RenderMode="Lightweight" DataSourceID="UniqueCustomersSeenCompanyODS1" Skin="MetroTouch">
                            <ClientEvents OnLoad="formatUniqueCustomersSeenCompanyRHC1" />
                            <Pan Enabled="true" Lock="Y" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="Y" />
                                <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                            </Zoom>
                            <PlotArea>
                                <Series>
                                    <telerik:ColumnSeries DataFieldY="Number_of_Unique_Clients">
                                        <TooltipsAppearance DataFormatString="N0"></TooltipsAppearance>
                                        <LabelsAppearance DataFormatString="N0"></LabelsAppearance>
                                    </telerik:ColumnSeries>
                                </Series>
                                <XAxis DataLabelsField="TimePeriod" Type="auto">
                                    <TitleAppearance>
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

                            <ChartTitle Text="No of Unique Customers Company-Wide">
                            </ChartTitle>
                        </telerik:RadHtmlChart>
                    </div>
                    <%--Table--%>
                    <br />
                    <br />
                    <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" AllowSorting="True" OnItemCommand="ExportGridCustomiser" RenderMode="Lightweight" DataSourceID="UniqueCustomersSeenCompanyODS1" CellSpacing="-1" GridLines="Both" ShowGroupPanel="True" Skin="MetroTouch">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True" AllowDragToGroup="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView AllowPaging="False" Width="100%" CommandItemDisplay="Top" AllowSorting="False" AutoGenerateColumns="False" DataSourceID="UniqueCustomersSeenCompanyODS1">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Number_of_Unique_Clients" DataFormatString="{0:N0}" DataType="System.Int32" FilterControlAltText="Filter Number_of_Unique_Clients column" HeaderText="Number of Unique Clients" SortExpression="Number_of_Unique_Clients" UniqueName="Number_of_Unique_Clients">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="UniqueCustomersSeenCompanyODS1" runat="server" SelectMethod="usp_UniqueCustomersSeenCompany" TypeName="Test.BLL.Customer.UniqueCustomersSeenCompanyBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="Time" DefaultValue="" Name="timeType" Type="Int32"></asp:SessionParameter>


                        </SelectParameters>
                    </asp:ObjectDataSource>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--Display Number of Animals Seen Company Wide--%>
            <telerik:RadPanelItem Text="Number of Animals Seen - Company" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <br />
                    <div class="export">
                        <telerik:RadButton ID="AnimalsSeenCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportAnimalsSeenCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <telerik:RadHtmlChart ID="AnimalsSeenCompanyRHC1" runat="server" RenderAs="Canvas" RenderMode="Lightweight" DataSourceID="AnimalsSeenCompanyODS1" Skin="Material">
                            <ClientEvents OnLoad="formatAnimalsSeenCompanyRHC1" />
                            <Pan Enabled="true" Lock="Y" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="Y" />
                                <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                            </Zoom>
                            <PlotArea>
                                <Series>
                                    <telerik:LineSeries Name="No of Animals Seen" DataFieldY="Number_of_animals_seen">
                                        <TooltipsAppearance DataFormatString="N0"></TooltipsAppearance>
                                        <LabelsAppearance DataFormatString="N0"></LabelsAppearance>
                                    </telerik:LineSeries>
                                </Series>

                                <XAxis DataLabelsField="TimePeriod" Type="Auto">
                                    <TitleAppearance>
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

                            <ChartTitle Text="Number of Animals Seens Company-Wide">
                            </ChartTitle>
                        </telerik:RadHtmlChart>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="AnimalsSeenCompanyODS1" runat="server" SelectMethod="usp_AnimalsSeenCompany" TypeName="Test.BLL.Customer.AnimalsSeenCompanyBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="Time" DefaultValue="" Name="timeType" Type="Int32"></asp:SessionParameter>


                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <br />
                    <br />
                    <telerik:RadGrid ID="AnimalsSeenComG1" runat="server" AllowPaging="True" OnItemCommand="ExportGridCustomiser" AllowSorting="True" RenderMode="Lightweight" DataSourceID="AnimalsSeenCompanyODS1" ShowGroupPanel="True" Skin="MetroTouch" CellSpacing="-1" GridLines="Both">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView AutoGenerateColumns="False" Width="100%" CommandItemDisplay="Top" DataSourceID="AnimalsSeenCompanyODS1">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Number_of_animals_seen" DataFormatString="{0:N0}" DataType="System.Int32" FilterControlAltText="Filter Number_of_animals_seen column" HeaderText="Number of Animals Seen" SortExpression="Number_of_animals_seen" UniqueName="Number_of_animals_seen">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Average dollar per customer company wide  chart--%>
            <telerik:RadPanelItem Text="Average Dollar per Customer - Company" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <br />
                    <div class="export">
                        <telerik:RadButton ID="AvgDollarPerCustomerCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportAvgDollarPerCustomerCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <telerik:RadHtmlChart ID="AvgDollarPerCustomerCompanyRHC1" runat="server" RenderAs="Canvas" RenderMode="Lightweight" DataSourceID="AvgDollarPerCustomerCompanyODS1" Skin="Telerik">
                            <ClientEvents OnLoad="formatAvgDollarPerCustomerCompanyRHC1" />
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
                                    <TitleAppearance Position="Center" />
                                    <LabelsAppearance DataFormatString="MMM yy">
                                    </LabelsAppearance>
                                </XAxis>
                                <YAxis Color="Black">
                                    <MajorGridLines Color="#EFEFEF" Width="1" />
                                    <MinorGridLines Color="#F7F7F7" Width="1" />
                                    <TitleAppearance Position="Center" Text="Average per Customer" RotationAngle="90" />
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

                            <ChartTitle Text="Average Dollar Value per Customer Company-Wide">
                            </ChartTitle>
                        </telerik:RadHtmlChart>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="AvgDollarPerCustomerCompanyODS1" runat="server" SelectMethod="usp_AvgDollarPerCustomerCompany" TypeName="Test.BLL.Customer.AvgDollarPerCustomerCompanyBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="Time" DefaultValue="" Name="timeType" Type="Int32"></asp:SessionParameter>


                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <br />
                    <br />
                    <telerik:RadGrid ID="AvgDollarPerCustomerCompanyG1" runat="server" AllowPaging="True" RenderMode="Lightweight" AllowSorting="True" DataSourceID="AvgDollarPerCustomerCompanyODS1" OnItemCommand="ExportGridCustomiser" ShowGroupPanel="True" Skin="MetroTouch" CellSpacing="-1" GridLines="Both">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView AutoGenerateColumns="False" Width="100%" CommandItemDisplay="Top" DataSourceID="AvgDollarPerCustomerCompanyODS1">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Average_Dollar_per_customer" DataFormatString="{0:N0}" DataType="System.Decimal" FilterControlAltText="Filter Average_Dollar_per_customer column" HeaderText="Average Dollar per Customer" SortExpression="Average_Dollar_per_customer" UniqueName="Average_Dollar_per_customer">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Number of New Customers company wide  chart--%>
            <telerik:RadPanelItem Text="Number of New Customers - Company" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <br />
                    <div class="export">
                        <telerik:RadButton ID="NewCustomersCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportNewCustomersCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <telerik:RadHtmlChart ID="NewCustomersCompanyRHC1" runat="server" RenderAs="Canvas" RenderMode="Lightweight" DataSourceID="NewCustomersCompanyODS1" Skin="Metro">
                            <ClientEvents OnLoad="formatNewCustomersCompanyRHC1" />
                            <Pan Enabled="true" Lock="Y" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="Y" />
                                <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                            </Zoom>
                            <PlotArea>
                                <Series>
                                    <telerik:ColumnSeries DataFieldY="Number_of_New_Customers">
                                        <TooltipsAppearance DataFormatString="N0"></TooltipsAppearance>
                                        <LabelsAppearance DataFormatString="N0"></LabelsAppearance>
                                    </telerik:ColumnSeries>
                                </Series>
                                <XAxis DataLabelsField="TimePeriod" Type="auto">
                                    <TitleAppearance>
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

                            <ChartTitle Text="No of New Customers Company-Wide">
                            </ChartTitle>
                        </telerik:RadHtmlChart>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="NewCustomersCompanyODS1" runat="server" SelectMethod="usp_NewCustomersCompany" TypeName="Test.BLL.Customer.NewCustomersCompanyBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="Time" DefaultValue="" Name="timeType" Type="Int32"></asp:SessionParameter>


                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <br />
                    <br />
                    <telerik:RadGrid ID="NewCustomersCompanyG1" runat="server" AllowPaging="True" RenderMode="Lightweight" AllowSorting="True" DataSourceID="NewCustomersCompanyODS1" ShowGroupPanel="True" OnItemCommand="ExportGridCustomiser" Skin="MetroTouch" CellSpacing="-1" GridLines="Both">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView AutoGenerateColumns="False" Width="100%" CommandItemDisplay="Top" DataSourceID="NewCustomersCompanyODS1">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Number_of_New_Customers" DataFormatString="{0:N0}" DataType="System.Int32" FilterControlAltText="Filter Number_of_New_Customers column" HeaderText="Number of New Customers" SortExpression="Number_of_New_Customers" UniqueName="Number_of_New_Customers">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Number of Small Animals company wide  chart--%>
            <telerik:RadPanelItem Text="Number of Small Animals - Company" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <br />
                    <div class="export">
                        <telerik:RadButton ID="SmallAnimalsCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportSmallAnimalsCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <telerik:RadHtmlChart ID="SmallAnimalsCompanyRHC1" runat="server" RenderAs="Canvas" RenderMode="Lightweight" DataSourceID="SmallAnimalsCompanyODS1" Skin="Metro">
                            <ClientEvents OnLoad="formatSmallAnimalsCompanyRHC1" />
                            <Pan Enabled="true" Lock="Y" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="Y" />
                                <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                            </Zoom>
                            <PlotArea>
                                <Series>
                                    <telerik:LineSeries Name="Small Animals" DataFieldY="Number_of_Small_Animals">
                                        <TooltipsAppearance DataFormatString="N0"></TooltipsAppearance>
                                        <LabelsAppearance DataFormatString="N0"></LabelsAppearance>
                                    </telerik:LineSeries>
                                </Series>

                                <XAxis DataLabelsField="TimePeriod" Type="Auto">
                                    <TitleAppearance>
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

                            <ChartTitle Text="Number of Small Animals Company-Wide">
                            </ChartTitle>
                        </telerik:RadHtmlChart>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="SmallAnimalsCompanyODS1" runat="server" SelectMethod="usp_SmallAnimalsCompany" TypeName="Test.BLL.Customer.SmallAnimalsCompanyBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="Time" DefaultValue="" Name="timeType" Type="Int32"></asp:SessionParameter>


                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <telerik:RadGrid ID="SmallAnimalsCompanyG1" runat="server" OnItemCommand="ExportGridCustomiser" AllowPaging="True" AllowSorting="True" RenderMode="Lightweight" DataSourceID="SmallAnimalsCompanyODS1" ShowGroupPanel="True" Skin="MetroTouch" CellSpacing="-1" GridLines="Both">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView AutoGenerateColumns="False" Width="100%" CommandItemDisplay="Top" DataSourceID="SmallAnimalsCompanyODS1">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Number_of_Small_Animals" DataFormatString="{0:N0}" DataType="System.Int32" FilterControlAltText="Filter Number_of_Small_Animals column" HeaderText="Number of Small Animals" SortExpression="Number_of_Small_Animals" UniqueName="Number_of_Small_Animals">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Number of Large Animals company wide  chart--%>
            <telerik:RadPanelItem Text="Number of Large Animals - Company" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <br />
                    <div class="export">
                        <telerik:RadButton ID="LargeAnimalsCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportLargeAnimalsCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <telerik:RadHtmlChart ID="LargeAnimalsCompanyRHC1" runat="server" RenderAs="Canvas" RenderMode="Lightweight" DataSourceID="LargeAnimalsCompanyODS1" Skin="Material">
                            <ClientEvents OnLoad="formatLargeAnimalsCompanyRHC1" />
                            <Pan Enabled="true" Lock="Y" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="Y" />
                                <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                            </Zoom>
                            <PlotArea>
                                <Series>
                                    <telerik:LineSeries Name="Large Animals" DataFieldY="Number_of_Large_Animals">
                                        <TooltipsAppearance DataFormatString="N0"></TooltipsAppearance>
                                        <LabelsAppearance DataFormatString="N0"></LabelsAppearance>
                                    </telerik:LineSeries>
                                </Series>

                                <XAxis DataLabelsField="TimePeriod" Type="Auto">
                                    <TitleAppearance>
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

                            <ChartTitle Text="Number of Large Animals Company-Wide">
                            </ChartTitle>
                        </telerik:RadHtmlChart>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="LargeAnimalsCompanyODS1" runat="server" SelectMethod="usp_LargeAnimalsCompany" TypeName="Test.BLL.Customer.LargeAnimalsCompanyBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="Time" DefaultValue="" Name="timeType" Type="Int32"></asp:SessionParameter>


                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <br />
                    <br />
                    <telerik:RadGrid ID="LargeAnimalsCompanyG1" runat="server" OnItemCommand="ExportGridCustomiser" AllowPaging="True" AllowSorting="True" RenderMode="Lightweight" DataSourceID="LargeAnimalsCompanyODS1" ShowGroupPanel="True" Skin="MetroTouch" CellSpacing="-1" GridLines="Both">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView AutoGenerateColumns="False" Width="100%" CommandItemDisplay="Top" DataSourceID="LargeAnimalsCompanyODS1">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Number_of_Large_Animals" DataFormatString="{0:N0}" DataType="System.Int32" FilterControlAltText="Filter Number_of_Large_Animals column" HeaderText="Number of Large Animals" SortExpression="Number_of_Large_Animals" UniqueName="Number_of_Large_Animals">
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


    function exportUniqueCustomersSeenCompanyRHC1(sender, args) {
        exportRadHtmlChart('<%=UniqueCustomersSeenCompanyRHC1.ClientID%>')
    }

    function exportAnimalsSeenCompanyRHC1(sender, args) {
        exportRadHtmlChart('<%=AnimalsSeenCompanyRHC1.ClientID%>')
    }

    function exportAvgDollarPerCustomerCompanyRHC1(sender, args) {
        exportRadHtmlChart('<%=AvgDollarPerCustomerCompanyRHC1.ClientID%>')
    }
    function exportNewCustomersCompanyRHC1(sender, args) {
        exportRadHtmlChart('<%=NewCustomersCompanyRHC1.ClientID%>')
        }

        function exportSmallAnimalsCompanyRHC1(sender, args) {
            exportRadHtmlChart('<%=SmallAnimalsCompanyRHC1.ClientID%>')
    }

    function exportLargeAnimalsCompanyRHC1(sender, args) {
        exportRadHtmlChart('<%=LargeAnimalsCompanyRHC1.ClientID%>')
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
    <%--(function pageLoad() {
        var chart = $find("<%=UniqueCustomersSeenCompanyRHC1.ClientID%>");
        chart.get_kendoWidget().options.valueAxis.labels.template =
            "#if(9999999>value > 9999) {# #=value / 1000# #} else{# #=value / 1000000# #}#";
        chart.repaint();
    })(window);--%>

    //format Y axis value based on value
    function formatUniqueCustomersSeenCompanyRHC1() {
        var chart1 = $find("<%=UniqueCustomersSeenCompanyRHC1.ClientID%>");
        chart1.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
        chart1.repaint();
    };
    function formatAnimalsSeenCompanyRHC1() {
        var chart2 = $find("<%=AnimalsSeenCompanyRHC1.ClientID%>");
        chart2.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
        chart2.repaint();
    };
    function formatAvgDollarPerCustomerCompanyRHC1() {
        var chart3 = $find("<%=AvgDollarPerCustomerCompanyRHC1.ClientID%>");
        chart3.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
        chart3.repaint();
    };
    function formatNewCustomersCompanyRHC1() {
        var chart4 = $find("<%=NewCustomersCompanyRHC1.ClientID%>");
            chart4.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart4.repaint();
    };
    function formatSmallAnimalsCompanyRHC1() {
        var chart5 = $find("<%=SmallAnimalsCompanyRHC1.ClientID%>");
        chart5.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
        chart5.repaint();
    };
    function formatLargeAnimalsCompanyRHC1() {
        var chart6 = $find("<%=LargeAnimalsCompanyRHC1.ClientID%>");
        chart6.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
        chart6.repaint();
    };
</script>
</telerik:RadScriptBlock>
