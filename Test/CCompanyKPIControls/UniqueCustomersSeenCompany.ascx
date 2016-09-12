<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UniqueCustomersSeenCompany.ascx.cs" Inherits="Test.CCompanyKPIControls.UniqueCustomersSeenCompany" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"></telerik:RadClientExportManager>

<div class="export">
    <%--Export chart button--%>
    <telerik:RadButton ID="UniqueCustomersSeenCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportUniqueCustomersSeenCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
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
                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Number_of_Unique_Clients" DataFormatString="{0:N0}" DataType="System.Int32" FilterControlAltText="Filter Number_of_Unique_Clients column" HeaderText="Number of Unique Clients" SortExpression="Number_of_Unique_Clients" UniqueName="Number_of_Unique_Clients">
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
<script>
    var $ = $telerik.$;
    function exportUniqueCustomersSeenCompanyRHC1(sender, args) {
        exportRadHtmlChart('<%=UniqueCustomersSeenCompanyRHC1.ClientID%>')
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
