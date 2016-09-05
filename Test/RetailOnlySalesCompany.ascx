<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RetailOnlySalesCompany.ascx.cs" Inherits="Test.RetailOnlySalesCompany" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<div class="demo-container size-thin">
    <telerik:RadPanelBar RenderMode="Lightweight" runat="server" ID="RadPanelBar1" Width="100%" Skin="MetroTouch">
        <Items>
            <%--This section is for Retail Only Sales companywide chart--%>
            <telerik:RadPanelItem Text="Retail Only Sales Company-wide" Expanded="false">
                <ContentTemplate>
                    <%--This export manager is for all the KPI charts--%>
                    <telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"></telerik:RadClientExportManager>
                    <%--Chart--%>
                    <telerik:RadPanelItem Text="Retail Only Sales Company-wide" Expanded="false">
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
                </ContentTemplate>
            </telerik:RadPanelItem>
        </Items>
        <ExpandAnimation Type="None" />
        <CollapseAnimation Type="None" />
    </telerik:RadPanelBar>
</div>


