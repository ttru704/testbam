<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AvgDollarPerCustomerCompany.ascx.cs" Inherits="Test.CCompanyKPIControls.AvgDollarPerCustomerCompany" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"> </telerik:RadClientExportManager>

<div class="export">
    <%--Export chart button--%>
    <telerik:RadButton ID="AvgDollarPerCustomerCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportAvgDollarPerCustomerCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
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
                                <TitleAppearance Position="Center"/>
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
                                <telerik:GridBoundColumn DataField="Average_Dollar_per_customer" DataFormatString="{0:N0}" DataType="System.Decimal" FilterControlAltText="Filter Average_Dollar_per_customer column" HeaderText="Average Dollar per Customer" SortExpression="Average_Dollar_per_customer" UniqueName="Average_Dollar_per_customer">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
    </div>
<script>
    var $ = $telerik.$;
    function exportAvgDollarPerCustomerCompanyRHC1(sender, args) {
        exportRadHtmlChart('<%=AvgDollarPerCustomerCompanyRHC1.ClientID%>')
    }

    function exportRadHtmlChart(chartId) {
        var chartTitle = $find(chartId).get_kendoWidget().options.title.text;
        var manager = $find('<%=RadClientExportManager1.ClientID%>');
        var pdfSettings = {
            fileName: chartTitle
        };
        manager.set_pdfSettings(pdfSettings);
        manager.exportPDF($("#" + chartId));
    };
</script>