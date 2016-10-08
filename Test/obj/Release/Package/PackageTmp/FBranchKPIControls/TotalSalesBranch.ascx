<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TotalSalesBranch.ascx.cs" Inherits="Test.FBranchKPIControls.TotalSalesBranch" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"></telerik:RadClientExportManager>

<div class="export">
    <%--Export chart button--%>
    <telerik:RadButton ID="TotalSalesBranchEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportTotalSalesBranchRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
    <%--Chart--%>
    <telerik:RadHtmlChart ID="TotalSalesBranchRHC1" runat="server" Skin="Metro" OnLoad="Page_Load">
        <ClientEvents OnLoad="chartLoad" />
        <Pan Enabled="true" Lock="Y" />
        <Zoom Enabled="true">
            <MouseWheel Enabled="true" Lock="Y" />
            <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
        </Zoom>
    </telerik:RadHtmlChart>
    <%--DataSource--%>
    <asp:ObjectDataSource ID="TotalSalesBranchODS1" runat="server" SelectMethod="usp_TotalSalesBranch" TypeName="Test.BLL.Financial.TotalSalesBranchBL">
        <SelectParameters>
            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015/04/01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015/09/01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="CompanyDDL1" PropertyName="SelectedValue" DefaultValue="1" Name="companyRef" Type="Int32"></asp:ControlParameter>
            <asp:ControlParameter ControlID="BranchDDL1" DefaultValue="0" Name="branchRef" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="TimeDDL1" Name="timeType" PropertyName="SelectedValue" Type="Int32" DefaultValue="1" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <%--Table--%>
    <telerik:RadGrid ID="TotalSalesBranchG1" runat="server" DataSourceID="TotalSalesBranchODS1" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True" Skin="Bootstrap">
        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <MasterTableView AutoGenerateColumns="False" DataSourceID="TotalSalesBranchODS1">
            <Columns>
                <telerik:GridBoundColumn DataField="Branch_Name" FilterControlAltText="Filter Branch_Name column" HeaderText="Branch Name" SortExpression="Branch_Name" UniqueName="Branch_Name">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Total_Sales" DataFormatString="{0:N0}" DataType="System.Decimal" FilterControlAltText="Filter Total_Sales column" HeaderText="Total Sales" SortExpression="Total_Sales" UniqueName="Total_Sales">
                </telerik:GridBoundColumn>

            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
</div>
<script>
    var $ = $telerik.$;
    function exportTotalSalesBranchRHC1(sender, args) {
        exportRadHtmlChart('<%=TotalSalesBranchRHC1.ClientID%>')
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
