<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FPeerCS.ascx.cs" Inherits="Test.FPeerCS" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<div class="demo-container size-thin">
    <telerik:RadPanelBar RenderMode="Lightweight" runat="server" ID="RadPanelBar1" Width="100%" Skin="MetroTouch">
        <Items>
            <%--This section is for Average dollar per transaction peer comparison  chart--%>
            <telerik:RadPanelItem Text="Average Dollar per Transaction Peer Comparison" Expanded="false">
                <ContentTemplate>
                    <%--This export manager is for all the KPI charts--%>
                    <telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"></telerik:RadClientExportManager>
                    <%--Chart--%>
                    <br />
                    <div class="export">
                        <telerik:RadButton ID="AvgDollarPerTransactionPeerEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportAvgDollarPerTransactionPeerRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <telerik:RadHtmlChart ID="AvgDollarPerTransactionPeerRHC1" runat="server" Skin="Metro">
                        </telerik:RadHtmlChart>
                        </div>
                        <%--Datasource--%>
                        <asp:ObjectDataSource ID="AvgDollarPerTransactionPeerODS1" runat="server" SelectMethod="usp_AvgDollarPerTransactionPeer" TypeName="Test.BLL.Financial.AvgDollarPerTransactionPeerBL">

                            <SelectParameters>
                                <asp:SessionParameter SessionField="StartDate" Name="start" Type="DateTime"></asp:SessionParameter>
                                <asp:SessionParameter SessionField="EndDate" Name="end" Type="DateTime"></asp:SessionParameter>
                                <asp:SessionParameter SessionField="BranchRef" Name="branchRef" Type="Int64"></asp:SessionParameter>
                                <asp:SessionParameter SessionField="BranchType" Name="branchType" Type="Int64"></asp:SessionParameter>
                                <asp:SessionParameter SessionField="Time" Name="timeType" Type="Int32"></asp:SessionParameter>
                                <asp:SessionParameter SessionField="Country" Name="country" Type="Int64"></asp:SessionParameter>
                                <asp:SessionParameter SessionField="State" Name="state" Type="Int64"></asp:SessionParameter>
                                <asp:SessionParameter SessionField="Region" Name="region" Type="Int64"></asp:SessionParameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        
                        <%--Table--%>
                        <hr />
                        <br />
                        <telerik:RadGrid ID="AvgDollarPerTransactionPeerG1" runat="server" DataSourceID="AvgDollarPerTransactionPeerODS1" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True" Skin="Metro" OnItemCommand="ExportGridCustomiser" ExportSettings-FileName="Average Dollar per Transaction Peer Comparison">
                            <ClientSettings AllowDragToGroup="True" AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                                <Selecting AllowRowSelect="True"></Selecting>
                            </ClientSettings>
                            <ExportSettings HideStructureColumns="true"></ExportSettings>
                            <MasterTableView Width="100%" CommandItemDisplay="Top" DataSourceID="AvgDollarPerTransactionPeerODS1" AutoGenerateColumns="False">
                                <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="Name" HeaderText="Name" SortExpression="Name" UniqueName="Name" FilterControlAltText="Filter Name column"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TimePeriod" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod" FilterControlAltText="Filter TimePeriod column"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Average_Dollar_per_Transaction" HeaderText="Average Dollar per Transaction" SortExpression="Average_Dollar_per_Transaction" UniqueName="Average_Dollar_per_Transaction" DataType="System.Decimal" FilterControlAltText="Filter Average_Dollar_per_Transaction column"></telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
        </Items>
        <ExpandAnimation Type="None" />
        <CollapseAnimation Type="None" />
    </telerik:RadPanelBar>
</div>
<telerik:RadScriptBlock runat="server">
<script>
    var $ = $telerik.$
        function exportAvgDollarPerTransactionPeerRHC1(sender, args) {
            exportRadHtmlChart('<%=AvgDollarPerTransactionPeerRHC1.ClientID%>')
        }

        function exportRadHtmlChart(chartId) {
            var chartTitle = $find(chartId).get_kendoWidget().options.title.text;
            var manager = $find('<%=RadClientExportManager1.ClientID%>');
            var pdfSettings = {
                fileName: chartTitle
                
            };
            
            manager.set_pdfSettings(pdfSettings);
            manager.exportPDF($("#" + chartId));
        }

    <%--For panning and zooming--%>
    (function (global) {
        var chart;

        function ChartLoad(sender, args) {
            chart = sender.get_kendoWidget(); //store a reference to the Kendo Chart widget, we will use its methods
        }

        global.chartLoad = ChartLoad;

        function resizeChart() {
            if (chart)
                chart.resize(); //redraw the chart so it takes the new size of its container when it changes (e.g., browser window size change, parent container size change)
        }


        //this logic ensures that the chart resizing will happen only once, at most - every 200ms
        //to prevent calling the handler too often if old browsers fire the window.onresize event multiple times
        var TO = false;
        window.onresize = function () {
            if (TO !== false)
                clearTimeout(TO);
            TO = setTimeout(resizeChart, 200);
        }

    })(window);
    <%--For panning and zooming--%>

        <%--For responsive chart--%>
    (function (global) {
        var chart;
        //Hide Export Button 

        $("div.export").mouseover(function () {
            $(".RadButton", this).css("display", "inline-block");
        });
        $("div.export").mouseout(function () {
            $(".RadButton", this).css("display", "none");
        });

        function ChartLoad(sender, args) {
            chart = sender.get_kendoWidget(); //store a reference to the Kendo Chart widget, we will use its methods
        }

        global.chartLoad = ChartLoad;

        function resizeChart() {
            if (chart)
                chart.resize(); //redraw the chart so it takes the new size of its container when it changes (e.g., browser window size change, parent container size change)
        }


        //this logic ensures that the chart resizing will happen only once, at most - every 200ms
        //to prevent calling the handler too often if old browsers fire the window.onresize event multiple times
        var TO = false;
        window.onresize = function () {
            if (TO !== false)
                clearTimeout(TO);
            TO = setTimeout(resizeChart, 200);
        }

    })(window);

    //format Y axis value based on value
    function pageLoad() {

        var chart1 = $find("<%=AvgDollarPerTransactionPeerRHC1.ClientID%>");
        chart1.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
        chart1.repaint();
    }
</script>
</telerik:RadScriptBlock>
