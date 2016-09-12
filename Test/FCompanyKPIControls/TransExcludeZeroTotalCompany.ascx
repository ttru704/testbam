<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TransExcludeZeroTotalCompany.ascx.cs" Inherits="Test.FCompanyKPIControls.TransExcludeZeroTotalCompany" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"></telerik:RadClientExportManager>

<div class="export">
    <%--Export chart button--%>
    <telerik:RadButton ID="TransExcludeZeroTotalCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportTransExcludeZeroTotalCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
    <%--Chart--%>
    <telerik:RadHtmlChart ID="TransExcludeZeroTotalCompanyRHC1" runat="server" DataSourceID="TransExcludeZeroTotalCompanyODS1" Skin="Material">
        <ClientEvents OnLoad="chartLoad" />
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
<script>
    var $ = $telerik.$;
    function exportTransExcludeZeroTotalCompanyRHC1(sender, args) {
        exportRadHtmlChart('<%=TransExcludeZeroTotalCompanyRHC1.ClientID%>')
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
