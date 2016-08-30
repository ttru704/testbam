<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EIndividualCS.ascx.cs" Inherits="Test.EIndividualCS" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<div class="demo-container size-thin">
    <telerik:RadPanelBar RenderMode="Lightweight" runat="server" ID="RadPanelBar1" Width="100%" Skin="MetroTouch">
        <Items>
            <telerik:RadPanelItem Text="Number of Customers Seen By Employee" Expanded="False">
                <ContentTemplate>
                    <%--Export button--%>
                            <telerik:RadButton RenderMode="Lightweight" runat="server" OnClientClicked="exportRadHtmlChart" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                            <telerik:RadClientExportManager runat="server" ID="RadClientExportManager1">
                            </telerik:RadClientExportManager>
                    <%--Chart--%>
                    <telerik:RadHtmlChart ID="CustomersSeenByEmployeeIndividualRHC1" runat="server" CssClass="MonthlyExport1"></telerik:RadHtmlChart>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="CustomersSeenByEmployeeIndividualODS1" runat="server" SelectMethod="usp_CustomersSeenByEmployeeIndividual" TypeName="Test.BLL.Productivity.CustomersSeenByEmployeeIndividualBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="&#39;2015-01-01&#39;" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="&#39;2015-12-31&#39;" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:Parameter DefaultValue="1" Name="companyRef" Type="Int32"></asp:Parameter>
                            <asp:SessionParameter SessionField="Employee" DefaultValue="" Name="staffNumber" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="Time" DefaultValue="2" Name="timeType" Type="Int32"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <telerik:RadGrid ID="CustomersSeenByEmployeeIndividualG1" runat="server" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True" DataSourceID="CustomersSeenByEmployeeIndividualODS1" OnItemCommand="RadGrid1_ItemCommand">
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <ClientSettings AllowDragToGroup="True" AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True"></Selecting>
                        </ClientSettings>
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
            <telerik:RadPanelItem Text="Number of Animals Seen By Employee" Expanded="False">
                <ContentTemplate>
                    <%--Chart--%>
                    <telerik:RadHtmlChart ID="AnimalsSeenByEmployeeIndividualRHC1" runat="server"></telerik:RadHtmlChart>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="AnimalsSeenByEmployeeIndividualODS1" runat="server" SelectMethod="usp_AnimalsSeenByEmployeeIndividual" TypeName="Test.BLL.Productivity.AnimalsSeenByEmployeeIndividualBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="&#39;2015-01-01&#39;" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="&#39;2015-12-31&#39;" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:Parameter DefaultValue="1" Name="companyRef" Type="Int32"></asp:Parameter>
                            <asp:SessionParameter SessionField="Employee" DefaultValue="" Name="staffNumber" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="Time" DefaultValue="2" Name="timeType" Type="Int32"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <telerik:RadGrid ID="AnimalsSeenByEmployeeIndividualG1" runat="server" DataSourceID="AnimalsSeenByEmployeeIndividualODS1" AllowPaging="True" AllowSorting="True">
                        <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True"></Selecting>
                        </ClientSettings>

                        <MasterTableView DataSourceID="AnimalsSeenByEmployeeIndividualODS1" AutoGenerateColumns="False">
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod" FilterControlAltText="Filter TimePeriod column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Number_Of_Animals_Seen_By_An_Employee" HeaderText="Number Of Animals Seen" SortExpression="Number_Of_Animals_Seen_By_An_Employee" UniqueName="Number_Of_Animals_Seen_By_An_Employee" DataType="System.Decimal" FilterControlAltText="Filter Number_Of_Animals_Seen_By_An_Employee column"></telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <telerik:RadPanelItem Text="Income by Employee" Expanded="False">
                <ContentTemplate>
                    <%--Chart--%>
                    <telerik:RadHtmlChart ID="IncomeByEmployeeIndividualRHC1" runat="server"></telerik:RadHtmlChart>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="IncomeByEmployeeIndividualODS1" runat="server" SelectMethod="usp_IncomeByEmployeeIndividual" TypeName="Test.BLL.Productivity.IncomeByEmployeeIndividualBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="&#39;2015-01-01&#39;" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="&#39;2015-12-31&#39;" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:Parameter DefaultValue="1" Name="companyRef" Type="Int32"></asp:Parameter>
                            <asp:SessionParameter SessionField="Employee" DefaultValue="" Name="staffNumber" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="Time" DefaultValue="2" Name="timeType" Type="Int32"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <telerik:RadGrid ID="IncomeByEmployeeIndividualG1" runat="server" DataSourceID="IncomeByEmployeeIndividualODS1" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True">
                        <ClientSettings AllowDragToGroup="True" AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True"></Selecting>
                        </ClientSettings>

                        <MasterTableView DataSourceID="IncomeByEmployeeIndividualODS1" AutoGenerateColumns="False">
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod" FilterControlAltText="Filter TimePeriod column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Income_By_Employee" HeaderText="Income" SortExpression="Income_By_Employee" UniqueName="Income_By_Employee" DataType="System.Decimal" FilterControlAltText="Filter Income_By_Employee column"></telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <telerik:RadPanelItem Text="Income by Employee From Each Animal Type" Expanded="False">
                <ContentTemplate>
                    <%--Chart--%>
                    <telerik:RadHtmlChart ID="IncomeFromAnimalTypeEmployeeIndividualRHC1" runat="server"></telerik:RadHtmlChart>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="IncomeFromAnimalTypeEmployeeIndividualODS1" runat="server" SelectMethod="usp_IncomeFromAnimalTypeEmployeeIndividual" TypeName="Test.BLL.Productivity.IncomeFromAnimalTypeEmployeeIndividualBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="&#39;2015-01-01&#39;" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="&#39;2015-12-31&#39;" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:Parameter DefaultValue="1" Name="companyRef" Type="Int32"></asp:Parameter>
                            <asp:SessionParameter SessionField="Employee" DefaultValue="" Name="staffNumber" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="TIme" DefaultValue="2" Name="timeType" Type="Int32"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <telerik:RadGrid ID="IncomeFromAnimalTypeEmployeeIndividualG1" runat="server" DataSourceID="IncomeFromAnimalTypeEmployeeIndividualODS1" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True">
                        <ClientSettings AllowDragToGroup="True" AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True"></Selecting>
                        </ClientSettings>

                        <MasterTableView DataSourceID="IncomeFromAnimalTypeEmployeeIndividualODS1" AutoGenerateColumns="False">
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod" FilterControlAltText="Filter TimePeriod column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Income_By_Vet_For_Each_Animal_Type" HeaderText="Income from Each Animal Type" SortExpression="Income_By_Vet_For_Each_Animal_Type" UniqueName="Income_By_Vet_For_Each_Animal_Type" FilterControlAltText="Filter Income_By_Vet_For_Each_Animal_Type column" DataType="System.Decimal"></telerik:GridBoundColumn>
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
<script>
    
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
        telerikDemo.printChartOnly = function (sender, args) {
            //Prevent printing if the browser is Safari due to a bug in WebKit related to gradients
            if (navigator.userAgent.search("Safari") >= 0 && navigator.userAgent.search("Chrome") < 0) {
                alert("Your browser has a printing bug. See the Description section for more details. Please use a different browser (e.g., Internet Explorer or Firefox)");
                return;
            }
            //Get the sibling chart that is to be hidden during printing
            var allChartContainers = $(''),
                currChartContainer = $(sender.get_element().parentNode)[0],
                siblingChartContainer;
            if (allChartContainers[0] == currChartContainer) {
                siblingChartContainer = allChartContainers[1];
            }
            else {
                siblingChartContainer = allChartContainers[0];
            }
            //Add a class to the sibling chart that will hide it when printing the target chart
            $(siblingChartContainer).addClass('chartToHide');

            //hide the print button
            $(sender.get_element()).css("display", "none");

            //call the browser print() method
            window.print();

            //Remove the class that hides the sibling chart
            $(siblingChartContainer).removeClass('chartToHide');
        }
    })(window);
</script>
