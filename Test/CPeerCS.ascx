<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CPeerCS.ascx.cs" Inherits="Test.CPeerCS" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<div class="demo-container size-thin">
    
    <telerik:RadPanelBar RenderMode="Lightweight" runat="server" ID="RadPanelBar1" Width="100%" Skin="MetroTouch">
        <Items>
            <%--This section is for Average dollar per customer peer comparison  chart--%>
            <telerik:RadPanelItem Text="Average Dollar per Customer Peer Comparison" Expanded="false">
                <ContentTemplate>
                    <telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"></telerik:RadClientExportManager>
                    <%--Chart--%>
                    <div class="export">
                        <telerik:RadButton ID="AvgDollarPerCustomerPeerEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportAvgDollarPerCustomerPeerRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <telerik:RadHtmlChart ID="AvgDollarPerCustomerPeerRHC1" runat="server" Skin="Bootstrap">
                            <ClientEvents OnLoad="formatAvgDollarPerCustomerPeerRHC1" />
                            <Pan Enabled="true" Lock="Y" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="Y" />
                                <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                            </Zoom>
                        </telerik:RadHtmlChart>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="AvgDollarPerCustomerPeerODS1" runat="server" SelectMethod="usp_AvgDollarPerCustomerPeer" TypeName="Test.BLL.Customer.AvgDollarPerCustomerPeerBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="&#39;2015-04-01&#39;" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="&#39;2015-09-01&#39;" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="Branch" DefaultValue="" Name="branchRef" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="BranchType" DefaultValue="" Name="branchType" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="Time" DefaultValue="1" Name="timeType" Type="Int32"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="Country" DefaultValue="" Name="country" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="State" DefaultValue="" Name="state" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="Region" DefaultValue="" Name="region" Type="Int64"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <br />
                    <br />
                    <telerik:RadGrid ID="AvgDollarPerCustomerPeerG1" runat="server" OnItemCommand="ExportGridCustomiser" DataSourceID="AvgDollarPerCustomerPeerODS1" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True" Skin="Metro">
                        <ClientSettings AllowDragToGroup="True" AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True"></Selecting>
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView DataSourceID="AvgDollarPerCustomerPeerODS1" Width="100%" CommandItemDisplay="Top" AutoGenerateColumns="False">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="Name" HeaderText="Name" SortExpression="Name" UniqueName="Name" FilterControlAltText="Filter Name column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TimePeriod" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod" FilterControlAltText="Filter TimePeriod column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Average_Dollar_per_Customer" HeaderText="Average Dollar per Customer" SortExpression="Average_Dollar_per_Customer" UniqueName="Average_Dollar_per_Customer" DataType="System.Decimal" FilterControlAltText="Filter Average_Dollar_per_Customer column"></telerik:GridBoundColumn>
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
    //for chart exporting
    var $ = $telerik.$;
        //For Exporting Charts
    function exportAvgDollarPerCustomerPeerRHC1(sender, args) {
            exportRadHtmlChart('<%=AvgDollarPerCustomerPeerRHC1.ClientID%>')
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
    
    //format Y axis value based on value
    function formatAvgDollarPerCustomerPeerRHC1() {

        var chart1 = $find("<%=AvgDollarPerCustomerPeerRHC1.ClientID%>");
        chart1.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
        chart1.repaint();
    };
</script>
</telerik:RadScriptBlock>