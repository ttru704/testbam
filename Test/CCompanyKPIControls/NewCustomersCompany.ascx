<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewCustomersCompany.ascx.cs" Inherits="Test.CCompanyKPIControls.NewCustomersCompany" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"></telerik:RadClientExportManager>

<div class="export">
    <%--Export chart button--%>
    <telerik:RadButton ID="NewCustomersCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportNewCustomersCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
    <%--Chart--%>
    <telerik:RadHtmlChart ID="NewCustomersCompanyRHC1" runat="server" DataSourceID="NewCustomersCompanyODS1" Skin="Silk">
        <PlotArea>
            <Series>
                <telerik:ColumnSeries DataFieldY="Number_of_New_Customers">
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
                <TitleAppearance Text="No of New Customers">
                    <TextStyle Margin="20" />
                </TitleAppearance>
                <MinorGridLines Visible="false" />
            </YAxis>
        </PlotArea>

        <ChartTitle Text="No of New Customers Companywide">
        </ChartTitle>
    </telerik:RadHtmlChart>
    <%--Datasource--%>
    <asp:ObjectDataSource ID="NewCustomersCompanyODS1" runat="server" SelectMethod="usp_NewCustomersCompany" TypeName="Test.BLL.Customer.NewCustomersCompanyBL">
        <SelectParameters>
            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-30" Name="end" PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <%--Table--%>
    <telerik:RadGrid ID="NewCustomersCompanyG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="NewCustomersCompanyODS1" ShowGroupPanel="True" Skin="MetroTouch" CellSpacing="-1" GridLines="Both">
        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <MasterTableView AutoGenerateColumns="False" DataSourceID="NewCustomersCompanyODS1">
            <Columns>
                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Number_of_New_Customers" DataFormatString="{0:N0}" DataType="System.Int32" FilterControlAltText="Filter Number_of_New_Customers column" HeaderText="Number of New Customers" SortExpression="Number_of_New_Customers" UniqueName="Number_of_New_Customers">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
</div>
<script>
    var $ = $telerik.$;
    function exportNewCustomersCompanyRHC1(sender, args) {
        exportRadHtmlChart('<%=NewCustomersCompanyRHC1.ClientID%>')
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
