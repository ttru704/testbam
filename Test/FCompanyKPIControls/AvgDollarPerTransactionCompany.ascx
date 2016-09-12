<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AvgDollarPerTransactionCompany.ascx.cs" Inherits="Test.FCompanyKPIControls.AvgDollarPerTransactionCompany" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"></telerik:RadClientExportManager>

<div class="export">
    <telerik:RadButton ID="AvgDollarPerTransactionCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportAvgDollarPerTransactionCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
    <%--Chart--%>
    <div class="export">
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
</div>
<script>
    var $ = $telerik.$;
    function exportAvgDollarPerTransactionCompanyRHC1(sender, args) {
        exportRadHtmlChart('<%=AvgDollarPerTransactionCompanyRHC1.ClientID%>')
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
    function pageLoad() {
            var chart = $find("<%=AvgDollarPerTransactionCompanyRHC1.ClientID%>");
        chart.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #} else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #} else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart.repaint();
    }
</script>
