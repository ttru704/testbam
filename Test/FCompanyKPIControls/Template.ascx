<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Template.ascx.cs" Inherits="Test.FCompanyKPIControls.Template" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"> </telerik:RadClientExportManager>

<div class="export">
    <telerik:RadButton ID="TotalSalesCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportTotalSalesCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
    </div>
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
</script>