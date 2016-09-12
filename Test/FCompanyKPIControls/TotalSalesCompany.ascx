<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TotalSalesCompany.ascx.cs" Inherits="Test.FCompanyKPIControls.TotalSalesCompany" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"> </telerik:RadClientExportManager>

<div class="export">
    <telerik:RadButton ID="TotalSalesCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportTotalSalesCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
    <telerik:RadHtmlChart ID="TotalSalesCompanyRHC1" RenderAs="canvas" runat="server" DataSourceID="TotalSalesCompanyODS" Skin="Metro">
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
<telerik:RadGrid ID="TotalSalesComG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="TotalSalesCompanyODS" ExportSettings-FileName="TotalSalesCompanyWide" ShowGroupPanel="True" Skin="Bootstrap" OnItemCommand="ExportGridCustomiser">
    <ExportSettings HideStructureColumns="true"></ExportSettings>
    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
    <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True" >
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

<script>
    var $ = $telerik.$;
    function exportTotalSalesCompanyRHC1(sender, args) {
        exportRadHtmlChart('<%=TotalSalesCompanyRHC1.ClientID%>')
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
            var chart = $find("<%=TotalSalesCompanyRHC1.ClientID%>");
        chart.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #} else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #} else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart.repaint();
    }
</script>

