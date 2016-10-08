<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ServiceOnlySalesCompany.ascx.cs" Inherits="Test.FCompanyKPIControls.ServiceOnlySalesCompany" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"></telerik:RadClientExportManager>
<div class="export">
<%--Export chart button--%>
<telerik:RadButton ID="IncomeByServiceActivityCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportincomeByServiceActivityComRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
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
    </div>
<script>
    var $ = $telerik.$;
    function exportincomeByServiceActivityComRHC1(sender, args) {
        exportRadHtmlChart('<%=IncomeByServiceActivityComRHC1.ClientID%>')
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
