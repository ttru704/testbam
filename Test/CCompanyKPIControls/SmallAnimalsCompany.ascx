<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SmallAnimalsCompany.ascx.cs" Inherits="Test.CCompanyKPIControls.SmallAnimalsCompany" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"></telerik:RadClientExportManager>

<div class="export">
    <%--Export chart button--%>
    <telerik:RadButton ID="SmallAnimalsCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportSmallAnimalsCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
    <%--Chart--%>
    <telerik:RadHtmlChart ID="SmallAnimalsCompanyRHC1" runat="server" DataSourceID="SmallAnimalsCompanyODS1" Skin="Material">
        <PlotArea>
            <Series>
                <telerik:LineSeries Name="Small Animals" DataFieldY="Number_of_Small_Animals">
                    <TooltipsAppearance DataFormatString="N0"></TooltipsAppearance>
                    <LabelsAppearance DataFormatString="N0"></LabelsAppearance>
                </telerik:LineSeries>
            </Series>

            <XAxis DataLabelsField="TimePeriod" Type="Auto">
                <TitleAppearance>
                    <TextStyle Margin="20" />
                </TitleAppearance>
                <LabelsAppearance DataFormatString="MMM yyyy">
                </LabelsAppearance>
                <MajorGridLines Visible="false" />
                <MinorGridLines Visible="false" />
            </XAxis>

            <YAxis>
                <TitleAppearance Text="No of Small Animals">
                    <TextStyle Margin="20" />
                </TitleAppearance>
                <MinorGridLines Visible="false" />
            </YAxis>
        </PlotArea>

        <ChartTitle Text="Number of Small Animals Companywide">
        </ChartTitle>
    </telerik:RadHtmlChart>
    <%--Datasource--%>
    <asp:ObjectDataSource ID="SmallAnimalsCompanyODS1" runat="server" SelectMethod="usp_SmallAnimalsCompany" TypeName="Test.BLL.Customer.SmallAnimalsCompanyBL">
        <SelectParameters>
            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <%--Table--%>
    <telerik:RadGrid ID="SmallAnimalsCompanyG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SmallAnimalsCompanyODS1" ShowGroupPanel="True" Skin="MetroTouch" CellSpacing="-1" GridLines="Both">
        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <MasterTableView AutoGenerateColumns="False" DataSourceID="SmallAnimalsCompanyODS1">
            <Columns>
                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Number_of_Small_Animals" DataFormatString="{0:N0}" DataType="System.Int32" FilterControlAltText="Filter Number_of_Small_Animals column" HeaderText="Number of Small Animals" SortExpression="Number_of_Small_Animals" UniqueName="Number_of_Small_Animals">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
</div>
<script>
    var $ = $telerik.$;
    function exportSmallAnimalsCompanyRHC1(sender, args) {
        exportRadHtmlChart('<%=SmallAnimalsCompanyRHC1.ClientID%>')
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
