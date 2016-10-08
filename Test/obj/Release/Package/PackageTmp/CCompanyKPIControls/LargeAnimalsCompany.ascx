<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LargeAnimalsCompany.ascx.cs" Inherits="Test.CCompanyKPIControls.LargeAnimalsCompany" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"> </telerik:RadClientExportManager>

<div class="export">
    <telerik:RadButton ID="LargeAnimalsCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportLargeAnimalsCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
    <%--Chart--%>
                    <telerik:RadHtmlChart ID="LargeAnimalsCompanyRHC1" runat="server" DataSourceID="LargeAnimalsCompanyODS1">
                        <PlotArea>
                            <Series>
                                <telerik:LineSeries Name="Large Animals" DataFieldY="Number_of_Large_Animals">
                                    <TooltipsAppearance DataFormatString="N0"></TooltipsAppearance>
                                    <LabelsAppearance DataFormatString="N0"></LabelsAppearance>
                                </telerik:LineSeries>
                            </Series>

                            <XAxis DataLabelsField="TimePeriod" Type="Auto">
                                <TitleAppearance >
                                    <TextStyle Margin="20" />
                                </TitleAppearance>
                                <LabelsAppearance>
                                </LabelsAppearance>
                                <MajorGridLines Visible="false" />
                                <MinorGridLines Visible="false" />
                            </XAxis>

                            <YAxis>
                                <TitleAppearance Text="No of Large Animals">
                                    <TextStyle Margin="20" />
                                </TitleAppearance>
                                <MinorGridLines Visible="false" />
                            </YAxis>
                        </PlotArea>

                        <ChartTitle Text="Number of Large Animals Companywide">
                        </ChartTitle>
                    </telerik:RadHtmlChart>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="LargeAnimalsCompanyODS1" runat="server" SelectMethod="usp_LargeAnimalsCompany" TypeName="Test.BLL.Customer.LargeAnimalsCompanyBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <telerik:RadGrid ID="LargeAnimalsCompanyG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="LargeAnimalsCompanyODS1" ShowGroupPanel="True" Skin="MetroTouch">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="False" DataSourceID="LargeAnimalsCompanyODS1">
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Number_of_Large_Animals" DataFormatString="{0:N0}" DataType="System.Int32" FilterControlAltText="Filter Number_of_Large_Animals column" HeaderText="Number of Large Animals" SortExpression="Number_of_Large_Animals" UniqueName="Number_of_Large_Animals">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
    </div>
<script>
    var $ = $telerik.$;
    function exportLargeAnimalsCompanyRHC1(sender, args) {
        exportRadHtmlChart('<%=LargeAnimalsCompanyRHC1.ClientID%>')
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