<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AnimalsSeenCompany.ascx.cs" Inherits="Test.CCompanyKPIControls.AnimalsSeenCompany" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"></telerik:RadClientExportManager>

<div class="export">
    <%--Expoert chart button--%>
    <telerik:RadButton ID="AnimalsSeenCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportAnimalsSeenCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
    <%--Chart--%>
    <telerik:RadHtmlChart ID="AnimalsSeenCompanyRHC1" runat="server" DataSourceID="AnimalsSeenCompanyODS1" Skin="Vista">
        <PlotArea>
            <Series>
                <telerik:LineSeries Name="No of Animals Seen" DataFieldY="Number_of_animals_seen">
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
                <TitleAppearance Text="No of Animals Seen">
                    <TextStyle Margin="20" />
                </TitleAppearance>
                <MinorGridLines Visible="false" />
            </YAxis>
        </PlotArea>

        <ChartTitle Text="Number of Animals Seens Companywide">
        </ChartTitle>
        <Zoom Enabled="False"></Zoom>
    </telerik:RadHtmlChart>
    <%--Datasource--%>
    <asp:ObjectDataSource ID="AnimalsSeenCompanyODS1" runat="server" SelectMethod="usp_AnimalsSeenCompany" TypeName="Test.BLL.Customer.AnimalsSeenCompanyBL">
        <SelectParameters>
            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-30" Name="end" PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <%--Table--%>
    <telerik:RadGrid ID="AnimalsSeenComG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="AnimalsSeenCompanyODS1" ShowGroupPanel="True" Skin="MetroTouch" CellSpacing="-1" GridLines="Both">
        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <MasterTableView AutoGenerateColumns="False" DataSourceID="AnimalsSeenCompanyODS1">
            <Columns>
                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Number_of_animals_seen" DataFormatString="{0:N0}" DataType="System.Int32" FilterControlAltText="Filter Number_of_animals_seen column" HeaderText="Number of Animals Seen" SortExpression="Number_of_animals_seen" UniqueName="Number_of_animals_seen">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
</div>
<script>
    var $ = $telerik.$;
    function exportAnimalsSeenCompanyRHC1(sender, args) {
        exportRadHtmlChart('<%=AnimalsSeenCompanyRHC1.ClientID%>')
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
