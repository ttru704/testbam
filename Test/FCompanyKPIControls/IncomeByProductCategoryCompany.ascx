<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="IncomeByProductCategoryCompany.ascx.cs" Inherits="Test.FCompanyKPIControls.IncomeByProductCategoryCompany" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"></telerik:RadClientExportManager>

<div class="export">
    <%--Export chart button--%>
    <telerik:RadButton ID="IncomeByProductCategoryComEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportIncomeByProductCategoryComRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
    <%--Chart--%>
    <telerik:RadHtmlChart ID="IncomeByProductCategoryComRHC1" runat="server" DataSourceID="IncomeByProductCategoryCompanyODS1" Skin="Bootstrap">
        <ClientEvents OnLoad="chartLoad" />
        <ChartTitle Text="Income by Product Category Companywide"></ChartTitle>
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
    <asp:ObjectDataSource ID="IncomeByProductCategoryCompanyODS1" runat="server" SelectMethod="usp_IncomeByProductCategoryCompany" TypeName="Test.BLL.Financial.IncomeByProductCategoryCompanyBL">
        <SelectParameters>
            <asp:SessionParameter SessionField="StartDate" DefaultValue="2015-04-01" Name="start" Type="DateTime"></asp:SessionParameter>
            <asp:SessionParameter SessionField="EndDate" DefaultValue="2015-09-01" Name="end" Type="DateTime"></asp:SessionParameter>

            <asp:Parameter DefaultValue="1" Name="companyRef" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <%--Table--%>
    <telerik:RadGrid ID="IncomeByProductCategoryCompanyG1" runat="server" DataSourceID="IncomeByProductCategoryCompanyODS1" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True" Skin="Metro">
        <ClientSettings AllowDragToGroup="True" AllowColumnsReorder="True" ReorderColumnsOnClient="True">
            <Selecting AllowRowSelect="True"></Selecting>
        </ClientSettings>

        <MasterTableView DataSourceID="IncomeByProductCategoryCompanyODS1" AutoGenerateColumns="False">
            <Columns>
                <telerik:GridBoundColumn DataField="Category_Type" HeaderText="Product Category" SortExpression="Category_Type" UniqueName="Category_Type" FilterControlAltText="Filter Category_Type column"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Income" HeaderText="Income (%)" SortExpression="Income" UniqueName="Income" DataType="System.Decimal" FilterControlAltText="Filter Income column"></telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
</div>
<script>
    var $ = $telerik.$;
    function exportIncomeByProductCategoryComRHC1(sender, args) {
        exportRadHtmlChart('<%=IncomeByProductCategoryComRHC1.ClientID%>')
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
