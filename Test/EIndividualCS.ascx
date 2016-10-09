<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EIndividualCS.ascx.cs" Inherits="Test.EIndividualCS" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<div class="demo-container size-thin">
    <%--This export manager is for every chart on the page--%>
    <telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"></telerik:RadClientExportManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Metro"></telerik:RadAjaxLoadingPanel>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="EmployeeCB1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="EmployeeCB1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass=""/>
                    <telerik:AjaxUpdatedControl ControlID="CustomersSeenByEmployeeIndividualRHC1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="CustomersSeenByEmployeeIndividualG1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="AnimalsSeenByEmployeeIndividualRHC1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="AnimalsSeenByEmployeeIndividualG1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="IncomeByEmployeeIndividualRHC1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="IncomeByEmployeeIndividualG1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="IncomeFromAnimalTypeEmployeeIndividualRHC1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadPanelBar RenderMode="Lightweight" runat="server" ID="RadPanelBar1" Width="100%" Skin="MetroTouch">
        <Items>
            <telerik:RadPanelItem Width="100%">
                <ContentTemplate>
                        <%--Employee combo box--%>
                        <telerik:RadComboBox ID="EmployeeCB1" runat="server" Skin="Metro" DataSourceID="EmployeeODS1" DataTextField="Name" DataValueField="Stf_Number" AutoPostBack="true" EmptyMessage="Search for Employee" OnSelectedIndexChanged="EmployeeCB1_SelectedIndexChanged" MarkFirstMatch="True" Filter="Contains"></telerik:RadComboBox>
                        <%--Datasource for employee combo box--%>
                        <asp:ObjectDataSource ID="EmployeeODS1" runat="server" SelectMethod="usp_EmployeeSearchBox" TypeName="Test.BLL.Controls.EmployeeSearchBoxBL">
                            <SelectParameters>
                                <asp:SessionParameter SessionField="CompanyRef" DefaultValue="" Name="companyRef" Type="Int32"></asp:SessionParameter>

                            </SelectParameters>
                        </asp:ObjectDataSource>
                </ContentTemplate>
            </telerik:RadPanelItem>
        </Items>
        <Items>
            <%--Number of customers seen by employee KPI--%>
            <telerik:RadPanelItem Text="Number of Customers Seen by An Employee - Individual" Visible="false" Expanded="False">
                <ContentTemplate>
                    <%--Chart + export--%>
                    <div class="export">
                        <telerik:RadButton ID="CustomersSeenByEmployeeIndividualEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportCustomersSeenByEmployeeIndividualRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <telerik:RadHtmlChart ID="CustomersSeenByEmployeeIndividualRHC1" RenderAs="Canvas" RenderMode="Lightweight" runat="server" CssClass="MonthlyExport1" Skin="Bootstrap">
                            <ClientEvents OnLoad="formatCustomersSeenByEmployeeIndividualRHC1" />
                            <Pan Enabled="true" Lock="X" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="X" />
                                <Selection Enabled="true" Lock="X" ModifierKey="Shift" />
                            </Zoom>
                        </telerik:RadHtmlChart>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="CustomersSeenByEmployeeIndividualODS1" runat="server" SelectMethod="usp_CustomersSeenByEmployeeIndividual" TypeName="Test.BLL.Productivity.CustomersSeenByEmployeeIndividualBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="&#39;2015-01-01&#39;" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="&#39;2015-12-31&#39;" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="CompanyRef" DefaultValue="" Name="companyRef" Type="Int64"></asp:SessionParameter>

                            <asp:SessionParameter SessionField="Employee" DefaultValue="" Name="staffNumber" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="Time" DefaultValue="2" Name="timeType" Type="Int32"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <br />
                    <br />
                    <telerik:RadGrid ID="CustomersSeenByEmployeeIndividualG1" RenderMode="Lightweight" runat="server" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True" DataSourceID="CustomersSeenByEmployeeIndividualODS1" OnItemCommand="ExportGridCustomiser">
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <ClientSettings AllowDragToGroup="True" AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True"></Selecting>
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView Width="100%" CommandItemDisplay="Top" DataSourceID="CustomersSeenByEmployeeIndividualODS1" AutoGenerateColumns="False">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ExportToCsvText="ExporttoCSV" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod" FilterControlAltText="Filter TimePeriod column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Number_Of_Customers_Seen_By_An_Employee" HeaderText="Number of Customers Seen" SortExpression="Number_Of_Customers_Seen_By_An_Employee" UniqueName="Number_Of_Customers_Seen_By_An_Employee" DataType="System.Decimal" FilterControlAltText="Filter Number_Of_Customers_Seen_By_An_Employee column"></telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--Number of animals seen employee KPI--%>
            <telerik:RadPanelItem Text="Number of Animals Seen by An Employee - Individual" Visible="false" Expanded="False">
                <ContentTemplate>
                    <%--Chart + export--%>
                    <div class="export">
                        <telerik:RadButton ID="AnimalsSeenByEmployeeIndividualEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportAnimalsSeenByEmployeeIndividualRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <telerik:RadHtmlChart ID="AnimalsSeenByEmployeeIndividualRHC1" RenderAs="Canvas" RenderMode="Lightweight" runat="server" Skin="Metro">
                            <ClientEvents OnLoad="formatAnimalsSeenByEmployeeIndividualRHC1" />
                            <Pan Enabled="true" Lock="X" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="X" />
                                <Selection Enabled="true" Lock="X" ModifierKey="Shift" />
                            </Zoom>
                        </telerik:RadHtmlChart>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="AnimalsSeenByEmployeeIndividualODS1" runat="server" SelectMethod="usp_AnimalsSeenByEmployeeIndividual" TypeName="Test.BLL.Productivity.AnimalsSeenByEmployeeIndividualBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="&#39;2015-01-01&#39;" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="&#39;2015-12-31&#39;" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="CompanyRef" DefaultValue="" Name="companyRef" Type="Int64"></asp:SessionParameter>

                            <asp:SessionParameter SessionField="Employee" DefaultValue="" Name="staffNumber" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="Time" DefaultValue="2" Name="timeType" Type="Int32"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <br />
                    <br />
                    <telerik:RadGrid ID="AnimalsSeenByEmployeeIndividualG1" RenderMode="Lightweight" OnItemCommand="ExportGridCustomiser" runat="server" DataSourceID="AnimalsSeenByEmployeeIndividualODS1" AllowPaging="True" AllowSorting="True">
                        <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True"></Selecting>
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView DataSourceID="AnimalsSeenByEmployeeIndividualODS1" Width="100%" CommandItemDisplay="Top" AutoGenerateColumns="False">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ExportToCsvText="ExporttoCSV" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod" FilterControlAltText="Filter TimePeriod column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Number_Of_Animals_Seen_By_An_Employee" HeaderText="Number Of Animals Seen" SortExpression="Number_Of_Animals_Seen_By_An_Employee" UniqueName="Number_Of_Animals_Seen_By_An_Employee" DataType="System.Decimal" FilterControlAltText="Filter Number_Of_Animals_Seen_By_An_Employee column"></telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--Income by employee KPI--%>
            <telerik:RadPanelItem Text="Income by Employee - Individual" Visible="false" Expanded="False">
                <ContentTemplate>
                    <%--Chart + export--%>
                    <div class="export">
                        <telerik:RadButton ID="IncomeByEmployeeIndividualEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportIncomeByEmployeeIndividualRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <telerik:RadHtmlChart ID="IncomeByEmployeeIndividualRHC1" RenderAs="Canvas" RenderMode="Lightweight" runat="server" Skin="Bootstrap">
                            <ClientEvents OnLoad="formatIncomeByEmployeeIndividualRHC1" />
                            <Pan Enabled="true" Lock="Y" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="Y" />
                                <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                            </Zoom>
                        </telerik:RadHtmlChart>
                        <%--Datasource--%>
                        <asp:ObjectDataSource ID="IncomeByEmployeeIndividualODS1" runat="server" SelectMethod="usp_IncomeByEmployeeIndividual" TypeName="Test.BLL.Productivity.IncomeByEmployeeIndividualBL">
                            <SelectParameters>
                                <asp:SessionParameter SessionField="StartDate" DefaultValue="&#39;2015-01-01&#39;" Name="start" Type="DateTime"></asp:SessionParameter>
                                <asp:SessionParameter SessionField="EndDate" DefaultValue="&#39;2015-12-31&#39;" Name="end" Type="DateTime"></asp:SessionParameter>
                                <asp:SessionParameter SessionField="CompanyRef" DefaultValue="" Name="companyRef" Type="Int64"></asp:SessionParameter>

                                <asp:SessionParameter SessionField="Employee" DefaultValue="" Name="staffNumber" Type="Int64"></asp:SessionParameter>
                                <asp:SessionParameter SessionField="Time" DefaultValue="2" Name="timeType" Type="Int32"></asp:SessionParameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <%--Table--%>
                        <br />
                        <br />
                        <telerik:RadGrid ID="IncomeByEmployeeIndividualG1" RenderMode="Lightweight" runat="server" OnItemCommand="ExportGridCustomiser" DataSourceID="IncomeByEmployeeIndividualODS1" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True">
                            <ClientSettings AllowDragToGroup="True" AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                                <Selecting AllowRowSelect="True"></Selecting>
                            </ClientSettings>
                            <ExportSettings HideStructureColumns="true"></ExportSettings>
                            <MasterTableView DataSourceID="IncomeByEmployeeIndividualODS1" Width="100%" CommandItemDisplay="Top" AutoGenerateColumns="False">
                                <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ExportToCsvText="ExporttoCSV" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="TimePeriod" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod" FilterControlAltText="Filter TimePeriod column"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Income_By_Employee" HeaderText="Income" SortExpression="Income_By_Employee" UniqueName="Income_By_Employee" DataType="System.Decimal" FilterControlAltText="Filter Income_By_Employee column"></telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--Income by employee from each animal type--%>
            <telerik:RadPanelItem Text="Income by Employee from Each Animal Type - Individual" Visible="false" Expanded="False">
                <ContentTemplate>
                    <%--Chart + export--%>
                    <div class="export">
                        <telerik:RadButton ID="IncomeFromAnimalTypeEmployeeIndividualEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportIncomeFromAnimalTypeEmployeeIndividualRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <telerik:RadHtmlChart ID="IncomeFromAnimalTypeEmployeeIndividualRHC1" RenderAs="Canvas" RenderMode="Lightweight" runat="server" Skin="Metro">
                            <ClientEvents OnLoad="formatIncomeFromAnimalTypeEmployeeIndividualRHC1" />
                            <Pan Enabled="true" Lock="Y" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="Y" />
                                <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                            </Zoom>
                        </telerik:RadHtmlChart>
                        <%--Datasource--%>
                        <asp:ObjectDataSource ID="IncomeFromAnimalTypeEmployeeIndividualODS1" runat="server" SelectMethod="usp_IncomeFromAnimalTypeEmployeeIndividual" TypeName="Test.BLL.Productivity.IncomeFromAnimalTypeEmployeeIndividualBL">
                            <SelectParameters>
                                <asp:SessionParameter SessionField="StartDate" DefaultValue="&#39;2015-01-01&#39;" Name="start" Type="DateTime"></asp:SessionParameter>
                                <asp:SessionParameter SessionField="EndDate" DefaultValue="&#39;2015-12-31&#39;" Name="end" Type="DateTime"></asp:SessionParameter>
                                <asp:SessionParameter SessionField="CompanyRef" DefaultValue="" Name="companyRef" Type="Int64"></asp:SessionParameter>

                                <asp:SessionParameter SessionField="Employee" DefaultValue="" Name="staffNumber" Type="Int64"></asp:SessionParameter>
                                <asp:SessionParameter SessionField="TIme" DefaultValue="2" Name="timeType" Type="Int32"></asp:SessionParameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <%--Table--%>
                        <br />
                        <br />
                        <telerik:RadGrid ID="IncomeFromAnimalTypeEmployeeIndividualG1" RenderMode="Lightweight" OnItemCommand="ExportGridCustomiser" runat="server" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True" DataSourceID="IncomeFromAnimalTypeEmployeeIndividualODS1">
                            <ClientSettings AllowDragToGroup="True" AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                                <Selecting AllowRowSelect="True"></Selecting>
                            </ClientSettings>
                            <ExportSettings HideStructureColumns="true"></ExportSettings>
                            <MasterTableView Width="100%" CommandItemDisplay="Top" AutoGenerateColumns="False" DataSourceID="IncomeFromAnimalTypeEmployeeIndividualODS1">
                                <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ExportToCsvText="ExporttoCSV" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="Animal_Type_Name" HeaderText="Animal Type" SortExpression="Animal_Type_Name" UniqueName="Animal_Type_Name" FilterControlAltText="Filter Animal_Type_Name column"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TimePeriod" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod" FilterControlAltText="Filter TimePeriod column"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Income_By_Vet_For_Each_Animal_Type" HeaderText="Income" SortExpression="Income_By_Vet_For_Each_Animal_Type" UniqueName="Income_By_Vet_For_Each_Animal_Type" DataType="System.Decimal" FilterControlAltText="Filter Income_By_Vet_For_Each_Animal_Type column"></telerik:GridBoundColumn>
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
        //Without this hide export button would not work
        var $ = $telerik.$;

        //For chart exporting
        function exportCustomersSeenByEmployeeIndividualRHC1(sender, args) {
            exportRadHtmlChart('<%=CustomersSeenByEmployeeIndividualRHC1.ClientID%>')
        }

        function exportAnimalsSeenByEmployeeIndividualRHC1(sender, args) {
            exportRadHtmlChart('<%=AnimalsSeenByEmployeeIndividualRHC1.ClientID%>')
        }

        function exportIncomeByEmployeeIndividualRHC1(sender, args) {
            exportRadHtmlChart('<%=IncomeByEmployeeIndividualRHC1.ClientID%>')
        }

        function exportIncomeFromAnimalTypeEmployeeIndividualRHC1(sender, args) {
            exportRadHtmlChart('<%=IncomeFromAnimalTypeEmployeeIndividualRHC1.ClientID%>')
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

        (function (global, undefined) {
            var telerikDemo = global.telerikDemo = {};
            telerikDemo.initialize = function () {
                $ = $telerik.$;
                //show or hide the print button when the mouse is over or leaves the chart
                $("$RadHtmlChart").mouseover(function () {
                    $(".RadButton", this).css("display", "inline-block");
                });
                $("$RadHtmlChart").mouseout(function () {
                    $(".RadButton", this).css("display", "none");
                });
            };
        })(window);

        //format Y axis value based on value
        function formatCustomersSeenByEmployeeIndividualRHC1() {
            var chart1 = $find("<%=CustomersSeenByEmployeeIndividualRHC1.ClientID%>");
            chart1.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart1.repaint();
        };

        function formatAnimalsSeenByEmployeeIndividualRHC1() {
            var chart2 = $find("<%=AnimalsSeenByEmployeeIndividualRHC1.ClientID%>");
            chart2.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart2.repaint();
        };
        function formatIncomeByEmployeeIndividualRHC1() {
            var chart3 = $find("<%=IncomeByEmployeeIndividualRHC1.ClientID%>");
            chart3.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart3.repaint();
        };
        function formatIncomeFromAnimalTypeEmployeeIndividualRHC1() {
            var chart4 = $find("<%=IncomeFromAnimalTypeEmployeeIndividualRHC1.ClientID%>");
            chart4.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart4.repaint();
        };
    </script>
</telerik:RadScriptBlock>
