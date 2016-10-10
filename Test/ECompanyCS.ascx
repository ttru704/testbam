<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ECompanyCS.ascx.cs" Inherits="Test.ECompanyCS" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<div class="demo-container size-thin">
    <%--This export manager is for all the KPI charts--%>
    <telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"></telerik:RadClientExportManager>

    <telerik:RadPanelBar RenderMode="Lightweight" runat="server" ID="RadPanelBar1" Width="100%" Skin="MetroTouch">
        <Items>
            <%--Number of Customers Seen By Employee - Company--%>
            <telerik:RadPanelItem Text="Number of Customers Seen by Employee - Company" Visible="false" Expanded="False">
                <ContentTemplate>
                    <%--Chart--%>
                    <br />
                    <div class="export">
                        <telerik:RadButton ID="CustomersSeenByEmployeeCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportCustomersSeenByEmployeeCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <div class="border">
                        <telerik:RadHtmlChart ID="CustomersSeenByEmployeeCompanyRHC1" RenderAs="Canvas" RenderMode="Lightweight" Width="100%" runat="server" CssClass="MonthlyExport" Skin="Bootstrap">
                            <ClientEvents OnLoad="formatCustomersSeenByEmployeeCompanyRHC1" />
                            <Pan Enabled="true" Lock="X" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="X" />
                                <Selection Enabled="true" Lock="X" ModifierKey="Shift" />
                            </Zoom>
                        </telerik:RadHtmlChart>
                            </div>
                    </div>
                    <%--Table--%>
                    <hr />
                    <div class="padding">
                    <telerik:RadGrid ID="CustomersSeenByEmployeeCompanyG1" RenderMode="Lightweight" OnItemCommand="ExportGridCustomiser" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="CustomersSeenByEmployeeCompanyODS1" ShowGroupPanel="True">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView AutoGenerateColumns="False" Width="100%" CommandItemDisplay="Top" AllowFilteringByColumn="True" DataSourceID="CustomersSeenByEmployeeCompanyODS1">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="Employee_Name" FilterControlAltText="Filter Employee_Name column" HeaderText="Employee" SortExpression="Employee_Name" UniqueName="Employee_Name">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Number_Of_Customers_Seen_By_An_Employee" DataType="System.Decimal" FilterControlAltText="Filter Number_Of_Customers_Seen_By_An_Employee column" HeaderText="Number Of Customers Seen" SortExpression="Number_Of_Customers_Seen_By_An_Employee" UniqueName="Number_Of_Customers_Seen_By_An_Employee">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    <FilterMenu RenderMode="Lightweight"></FilterMenu>
                        </telerik:RadGrid>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="CustomersSeenByEmployeeCompanyODS1" runat="server" SelectMethod="usp_CustomersSeenByEmployeeCompany" TypeName="Test.BLL.Productivity.CustomersSeenByEmployeeCompanyBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-01-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-12-31" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>

                            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="2" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--Number of Animal Seen By Employee - Company--%>
            <telerik:RadPanelItem Text="Number of Animals Seen by Employee - Company" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <br />
                    <div class="export">
                        <telerik:RadButton ID="AnimalsSeenByEmployeeCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportAnimalsSeenByEmployeeCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <div class="border">
                        <telerik:RadHtmlChart ID="AnimalsSeenByEmployeeCompanyRHC1" RenderAs="Canvas" RenderMode="Lightweight" runat="server" Skin="Metro">
                            <ClientEvents OnLoad="formatAnimalsSeenByEmployeeCompanyRHC1" />
                            <Pan Enabled="true" Lock="Y" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="Y" />
                                <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                            </Zoom>
                        </telerik:RadHtmlChart>
                            </div>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="AnimalsSeenByEmployeeCompanyODS1" runat="server" SelectMethod="usp_AnimalsSeenByEmployeeCompany" TypeName="Test.BLL.Productivity.AnimalsSeenByEmployeeCompanyBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-01-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-12-31" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>

                            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="2" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <hr />
                    <div class="padding">
                    <telerik:RadGrid ID="AnimalsSeenByEmployeeCompanyG1" RenderMode="Lightweight" OnItemCommand="ExportGridCustomiser" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="AnimalsSeenByEmployeeCompanyODS1" ShowGroupPanel="True" Skin="Metro">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView AutoGenerateColumns="False" Width="100%" CommandItemDisplay="Top" AllowFilteringByColumn="True" DataSourceID="AnimalsSeenByEmployeeCompanyODS1">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="Employee_Name" FilterControlAltText="Filter Employee_Name column" HeaderText="Employee" SortExpression="Employee_Name" UniqueName="Employee_Name">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Number_Of_Animals_Seen_By_An_Employee" DataType="System.Decimal" FilterControlAltText="Filter Number_Of_Animals_Seen_By_An_Employee column" HeaderText="Number Of Animals Seen" SortExpression="Number_Of_Animals_Seen_By_An_Employee" UniqueName="Number_Of_Animals_Seen_By_An_Employee">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    <FilterMenu RenderMode="Lightweight"></FilterMenu>
                        </telerik:RadGrid>
                    </div>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--Average Number of Customers Seen by Employee - Company--%>
            <telerik:RadPanelItem Text="Average Customers Seen by Employee - Company" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <br />
                    <div class="export">
                        <telerik:RadButton ID="AvgCustomersSeenByEmployeeCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportAvgCustomersSeenByEmployeeCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <div class="border">
                        <telerik:RadHtmlChart ID="AvgCustomersSeenByEmployeeCompanyRHC1" RenderAs="Canvas" RenderMode="Lightweight" runat="server" Skin="Bootstrap">
                            <ClientEvents OnLoad="formatAvgCustomersSeenByEmployeeCompanyRHC1" />
                            <Pan Enabled="true" Lock="Y" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="Y" />
                                <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                            </Zoom>
                        </telerik:RadHtmlChart>
                        </div>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="AvgCustomersSeenByEmployeeCompanyODS1" runat="server" SelectMethod="usp_AvgCustomersSeenByEmployeeCompany" TypeName="Test.BLL.Productivity.AvgCustomersSeenByEmployeeCompanyBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="&#39;2015-01-01&#39;" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="&#39;2015-12-31&#39;" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="CompanyRef" DefaultValue="" Name="companyRef" Type="Int64"></asp:SessionParameter>

                            <asp:SessionParameter SessionField="Time" DefaultValue="2" Name="timeType" Type="Int32"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <hr />
                    <div class="padding">
                    <telerik:RadGrid ID="AvgCustomersSeenByEmployeeCompanyG1" RenderMode="Lightweight" OnItemCommand="ExportGridCustomiser" runat="server" DataSourceID="AvgCustomersSeenByEmployeeCompanyODS1" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True">
                        <ClientSettings AllowDragToGroup="True" AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True"></Selecting>
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView DataSourceID="AvgCustomersSeenByEmployeeCompanyODS1" Width="100%" CommandItemDisplay="Top" AutoGenerateColumns="False" AllowFilteringByColumn="True">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod" FilterControlAltText="Filter TimePeriod column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Number_Of_Customers_Seen_By_An_Employee" HeaderText="Number Of Customers Seen" SortExpression="Number_Of_Customers_Seen_By_An_Employee" UniqueName="Number_Of_Customers_Seen_By_An_Employee" DataType="System.Decimal" FilterControlAltText="Filter Number_Of_Customers_Seen_By_An_Employee column"></telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    <FilterMenu RenderMode="Lightweight"></FilterMenu>
                        </telerik:RadGrid>
                    </div>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--Average Number of Animals Seen by Employee - Company--%>
            <telerik:RadPanelItem Text="Average Animals Seen by Employee - Company" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <br />
                    <div class="export">
                        <telerik:RadButton ID="AvgAnimalsSeenByEmployeeCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportAvgAnimalsSeenByEmployeeCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <div class="border">
                        <telerik:RadHtmlChart ID="AvgAnimalsSeenByEmployeeCompanyRHC1" RenderAs="Canvas" RenderMode="Lightweight" runat="server" Skin="Bootstrap">
                            <ClientEvents OnLoad="formatAvgAnimalsSeenByEmployeeCompanyRHC1" />
                            <Pan Enabled="true" Lock="Y" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="Y" />
                                <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                            </Zoom>
                        </telerik:RadHtmlChart>
                    </div>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="AvgAnimalsSeenByEmployeeCompanyODS1" runat="server" SelectMethod="usp_AvgAnimalsSeenByEmployeeCompany" TypeName="Test.BLL.Productivity.AvgAnimalsSeenByEmployeeCompanyBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="&#39;2015-01-01&#39;" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="&#39;2015-12-31&#39;" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="CompanyRef" DefaultValue="" Name="companyRef" Type="Int64"></asp:SessionParameter>

                            <asp:SessionParameter SessionField="Time" DefaultValue="2" Name="timeType" Type="Int32"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <hr />
                    <div class="padding">
                    <telerik:RadGrid ID="AvgAnimalsSeenByEmployeeCompanyG1" RenderMode="Lightweight" OnItemCommand="ExportGridCustomiser" runat="server" DataSourceID="AvgAnimalsSeenByEmployeeCompanyODS1" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True">
                        <ClientSettings AllowDragToGroup="True" AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True"></Selecting>
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView DataSourceID="AvgAnimalsSeenByEmployeeCompanyODS1" Width="100%" CommandItemDisplay="Top" AllowFilteringByColumn="True" AutoGenerateColumns="False">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod" FilterControlAltText="Filter TimePeriod column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Average_Number_Of_Animals_Seen_By_Employee" HeaderText="Average Number Of Animals Seen" SortExpression="Average_Number_Of_Animals_Seen_By_Employee" UniqueName="Average_Number_Of_Animals_Seen_By_Employee" DataType="System.Decimal" FilterControlAltText="Filter Average_Number_Of_Animals_Seen_By_Employee column"></telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    <FilterMenu RenderMode="Lightweight"></FilterMenu>
                        </telerik:RadGrid>
                    </div>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--Income by Employee - Company--%>
            <telerik:RadPanelItem Text="Income by Employee - Company" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <br />
                    <div class="export">
                        <telerik:RadButton ID="IncomeByEmployeeCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportIncomeByEmployeeCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <div class="border">
                        <telerik:RadHtmlChart ID="IncomeByEmployeeCompanyRHC1" RenderAs="Canvas" RenderMode="Lightweight" runat="server" Skin="Metro">
                            <ClientEvents OnLoad="formatIncomeByEmployeeCompanyRHC1" />
                            <Pan Enabled="true" Lock="Y" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="Y" />
                                <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                            </Zoom>
                        </telerik:RadHtmlChart>
                            </div>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="IncomeByEmployeeCompanyODS1" runat="server" SelectMethod="usp_IncomeByEmployeeCompany" TypeName="Test.BLL.Productivity.IncomeByEmployeeCompanyBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="2015-01-01" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="&#39;2015-12-31&#39;" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="CompanyRef" DefaultValue="" Name="companyRef" Type="Int64"></asp:SessionParameter>

                            <asp:SessionParameter SessionField="Time" DefaultValue="2" Name="timeType" Type="Int32"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <hr />
                    <div class="padding">
                    <telerik:RadGrid ID="IncomeByEmployeeCompanyG1" RenderMode="Lightweight" runat="server" OnItemCommand="ExportGridCustomiser" DataSourceID="IncomeByEmployeeCompanyODS1" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True">
                        <ClientSettings AllowDragToGroup="True" AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True"></Selecting>
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView DataSourceID="IncomeByEmployeeCompanyODS1" Width="100%" CommandItemDisplay="Top" AllowFilteringByColumn="True" AutoGenerateColumns="False">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="Employee_Name" HeaderText="Employee" SortExpression="Employee_Name" UniqueName="Employee_Name" FilterControlAltText="Filter Employee_Name column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TimePeriod" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod" FilterControlAltText="Filter TimePeriod column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Income_By_Employee" HeaderText="Income" SortExpression="Income_By_Employee" UniqueName="Income_By_Employee" DataType="System.Decimal" FilterControlAltText="Filter Income_By_Employee column"></telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    <FilterMenu RenderMode="Lightweight"></FilterMenu>
                        </telerik:RadGrid>
                    </div>
                </ContentTemplate>
            </telerik:RadPanelItem>
        </Items>
        <ExpandAnimation Type="None" />
        <CollapseAnimation Type="None" />
    </telerik:RadPanelBar>

</div>
<telerik:RadScriptBlock runat="server">
    <script>
        //Without this hide export button would not work
        var $ = $telerik.$;

        //For chart exporting
        function exportCustomersSeenByEmployeeCompanyRHC1(sender, args) {
            exportRadHtmlChart('<%=CustomersSeenByEmployeeCompanyRHC1.ClientID%>')
        }

        function exportAnimalsSeenByEmployeeCompanyRHC1(sender, args) {
            exportRadHtmlChart('<%=AnimalsSeenByEmployeeCompanyRHC1.ClientID%>')
        }

        function exportAvgCustomersSeenByEmployeeCompanyRHC1(sender, args) {
            exportRadHtmlChart('<%=AvgCustomersSeenByEmployeeCompanyRHC1.ClientID%>')
        }

        function exportAvgAnimalsSeenByEmployeeCompanyRHC1(sender, args) {
            exportRadHtmlChart('<%=AvgAnimalsSeenByEmployeeCompanyRHC1.ClientID%>')
        }

        function exportIncomeByEmployeeCompanyRHC1(sender, args) {
            exportRadHtmlChart('<%=IncomeByEmployeeCompanyRHC1.ClientID%>')
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
    <%--For responsive chart--%>
        //format Y axis value based on value
        function formatCustomersSeenByEmployeeCompanyRHC1() {
            var chart1 = $find("<%=CustomersSeenByEmployeeCompanyRHC1.ClientID%>");
            chart1.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart1.repaint();
        };

        function formatAnimalsSeenByEmployeeCompanyRHC1() {
            var chart2 = $find("<%=AnimalsSeenByEmployeeCompanyRHC1.ClientID%>");
            chart2.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart2.repaint();
        };

        function formatAvgCustomersSeenByEmployeeCompanyRHC1() {
            var chart3 = $find("<%=AvgCustomersSeenByEmployeeCompanyRHC1.ClientID%>");
            chart3.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart3.repaint();
        };

        function formatAvgAnimalsSeenByEmployeeCompanyRHC1() {
            var chart4 = $find("<%=AvgAnimalsSeenByEmployeeCompanyRHC1.ClientID%>");
            chart4.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart4.repaint();
        };

        function formatIncomeByEmployeeCompanyRHC1() {
            var chart5 = $find("<%=IncomeByEmployeeCompanyRHC1.ClientID%>");
            chart5.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart5.repaint();
        };
    </script>
</telerik:RadScriptBlock>
