<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FProduct&ServiceCS.ascx.cs" Inherits="Test.FProduct_ServiceCS" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<div class="demo-container size-thin">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
    <telerik:RadPanelBar RenderMode="Lightweight" runat="server" ID="RadPanelBar1" Width="100%" Skin="MetroTouch">
        <Items>
            <%--Display Income By Service Activity individually--%>
            <telerik:RadPanelItem Text="Income By Service Activity" Expanded="false">
                <ContentTemplate>
                    <telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"></telerik:RadClientExportManager>
                    <%--Combox to select service activity--%>
                    <telerik:RadComboBox runat="server" ID="ServiceSB1" EmptyMessage="Search for Service" RenderMode="Lightweight" DataTextField="Prd_Name" DataValueField="Prd_Number" OnSelectedIndexChanged="ServiceSB1_SelectedIndexChanged" AutoPostBack="true" DataSourceID="ServiceODS1" MarkFirstMatch="True" Skin="Metro" Filter="Contains"></telerik:RadComboBox>
                    <asp:ObjectDataSource ID="ServiceODS1" runat="server" SelectMethod="usp_ProductServiceNameSearchBox" TypeName="Test.BLL.Controls.ProductServiceNameSearchBoxBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="CompanyRef" DefaultValue="" Name="companyRef" Type="Int64"></asp:SessionParameter>

                            <asp:Parameter DefaultValue="Service" Name="Class" Type="String"></asp:Parameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>

                    <%--Chart--%>

                    <telerik:RadButton ID="ExportButton" runat="server" OnClientClicked="exportMe" Text="Export to PDF" AutoPostBack="false"></telerik:RadButton>
                    <telerik:RadHtmlChart ID="IncomeByServiceIndividualRHC1" runat="server"></telerik:RadHtmlChart>

                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="IncomeByServiceIndividualODS1" runat="server" SelectMethod="usp_IncomeByServiceIndividual_Result" TypeName="Test.BLL.Financial.IncomeByServiceIndividualBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:ControlParameter ControlID="ServiceSB1" PropertyName="SelectedValue" Name="productNumnber" Type="Int64"></asp:ControlParameter>
                            <asp:SessionParameter SessionField="Time" Name="timeType" Type="Int32"></asp:SessionParameter>

                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <br />
                    <br />
                    <telerik:RadGrid ID="IncomeByServiceIndividualG1" runat="server" DataSourceID="IncomeByServiceIndividualODS1" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True" Skin="Metro" OnItemCommand="ExportGridCustomiser">
                        <ClientSettings AllowDragToGroup="True"></ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView DataSourceID="IncomeByServiceIndividualODS1" Width="100%" CommandItemDisplay="Top" AutoGenerateColumns="False">
                            <CommandItemSettings  ShowExportToWordButton="true" ShowExportToPdfButton="true" ShowExportToExcelButton="true" ShowPrintButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="false" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="Service_Name" HeaderText="Service" SortExpression="Service_Name" UniqueName="Service_Name" FilterControlAltText="Filter Service_Name column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TimePeriod" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod" FilterControlAltText="Filter TimePeriod column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Income_By_Service" HeaderText="Income" SortExpression="Income_By_Service" UniqueName="Income_By_Service" DataType="System.Decimal" FilterControlAltText="Filter Income_By_Service column"></telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--Display Income By Product Category individually--%>
            <telerik:RadPanelItem Text="Income By Product" Expanded="false">
                <ContentTemplate>
                    <%--Combox to select service activity--%>
                    <telerik:RadComboBox runat="server" ID="ProductSB1" EmptyMessage="Search for Product" OnSelectedIndexChanged="ProductSB1_SelectedIndexChanged" RenderMode="Lightweight" DataTextField="Prd_Name" DataValueField="Prd_Number" AutoPostBack="true" DataSourceID="ProductODS1" MarkFirstMatch="True" Skin="Metro" Filter="Contains"></telerik:RadComboBox>
                    <asp:ObjectDataSource ID="ProductODS1" runat="server" SelectMethod="usp_ProductServiceNameSearchBox" TypeName="Test.BLL.Controls.ProductServiceNameSearchBoxBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64" DefaultValue="Product"></asp:SessionParameter>

                            <asp:Parameter Name="Class" Type="String" DefaultValue="Product"></asp:Parameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Chart--%>


                    <telerik:RadHtmlChart ID="IncomeByProductIndividualRHC1" runat="server"></telerik:RadHtmlChart>

                    
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="IncomeByProductIndividualODS1" runat="server" SelectMethod="usp_IncomeByProductIndividual_Result" TypeName="Test.BLL.Financial.IncomeByProductIndividualBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:ControlParameter ControlID="ProductSB1" PropertyName="SelectedValue" Name="productNumnber" Type="Int64"></asp:ControlParameter>
                            <asp:SessionParameter SessionField="Time" Name="timeType" Type="Int32"></asp:SessionParameter>

                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <br />
                    <br />
                    <telerik:RadGrid ID="IncomeByProductIndividualG1" runat="server" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True" Skin="Metro" OnItemCommand="ExportGridCustomiser">
                        <ClientSettings AllowDragToGroup="True"></ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView AutoGenerateColumns="False" Width="100%" CommandItemDisplay="Top">
                            <CommandItemSettings  ShowExportToWordButton="true" ShowExportToPdfButton="true" ShowExportToExcelButton="true" ShowPrintButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="false" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="Product_Name" HeaderText="Product" SortExpression="Product_Name" UniqueName="Product_Name" FilterControlAltText="Filter Product_Name column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TimePeriod" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod" FilterControlAltText="Filter TimePeriod column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Income_By_Product" HeaderText="Income" SortExpression="Income_By_Product" UniqueName="Income_By_Product" DataType="System.Decimal" FilterControlAltText="Filter Income_By_Product column"></telerik:GridBoundColumn>
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
        var $ = $telerik.$;
        function exportMe(sender, args){
            exportRadHtmlChart("<%=IncomeByServiceIndividualRHC1.ClientID%>")
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
    </script>
</telerik:RadScriptBlock>
