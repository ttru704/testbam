<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="financialKPI.aspx.cs" Inherits="Test.KPI" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <%--<asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
            <Scripts>
                <asp:ScriptReference Path="/Scripts/accordion.js" />
            </Scripts>
        </asp:ScriptManagerProxy>--%>
        <div class="right_col" role="main">
            <div id="KPIMenu" style="text-align: center">
                <a href="/financialKPI.aspx" style="font-size: 20px"><strong>Financial</strong></a>
                <strong>|</strong>
                <a href="/employeekpi.aspx" style="font-size: 20px"><strong>Employee</strong></a>
                <strong>|</strong>
                <a href="/customerkpi.aspx" style="font-size: 20px"><strong>Customer</strong></a>
            </div>
            <%--Trying the Panel change--%>

            <div>
                <telerik:RadDatePicker ID="DatePicker1" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-04-01" SelectedDate="2015-04-01"></telerik:RadDatePicker>
                <telerik:RadDatePicker ID="DatePicker2" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-09-01" SelectedDate="2015-09-01"></telerik:RadDatePicker>
                <asp:DropDownList ID="CompanyDDL1" runat="server" Width="100px" OnSelectedIndexChanged="Company_SelectedIndexChanged">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="BranchDDL1" runat="server" AutoPostBack="True" DataTextField="Branch_Name" AppendDataBoundItems="True" EnableViewState="False" DataValueField="Ref_Number" Width="100px" DataSourceID="BranchDropDownODS1" OnSelectedIndexChanged="Branch_SelectedIndexChanged">
                    <asp:ListItem Value="0" Selected="True">All Branches</asp:ListItem>
                </asp:DropDownList>
                <asp:ObjectDataSource ID="BranchDropDownODS1" runat="server" SelectMethod="usp_BranchDropDownList" TypeName="Test.BLL.BranchDropDownListBL">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    </asp:ObjectDataSource>
                <asp:DropDownList ID="TimeDDL1" runat="server" Width="100px">
                    <asp:ListItem Value="1"> Monthly </asp:ListItem>
                    <asp:ListItem Value="2"> Yearly </asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="Button1" runat="server" Text="View" OnClick="Button1_Click" />
            </div>

            <%--This section is for Total Sales Company--%>
            <div id="accordion">
                <div class="kpiheader">Total Sales Companywide
                </div>
                <div class="accordionable">
                    <telerik:RadHtmlChart ID="TotalSalesComRHC1" runat="server" DataSourceID="TotalSalesComODS">
                        <Pan Enabled="true" Lock="Y" />
                        <Zoom Enabled="true">
                            <MouseWheel Enabled="true" Lock="Y" />
                            <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                        </Zoom>

                        <PlotArea>
                            <Series>
                                <telerik:ColumnSeries DataFieldY="Total_Sales">
                                    <LabelsAppearance DataFormatString="C2">
                                    </LabelsAppearance>
                                </telerik:ColumnSeries>
                            </Series>
                            <XAxis DataLabelsField="YearMonth" Type="Date">
                                <TitleAppearance Text="Time Period">
                                    <TextStyle Margin="20" />
                                </TitleAppearance>
                                <LabelsAppearance DataFormatString="MMM yyyy">
                                </LabelsAppearance>
                                <MajorGridLines Visible="false" />
                                <MinorGridLines Visible="false" />
                            </XAxis>
                            <YAxis>
                                <TitleAppearance Text="Total Sales">
                                    <TextStyle Margin="20" />
                                </TitleAppearance>
                                <MinorGridLines Visible="false" />
                            </YAxis>
                        </PlotArea>

                        <ChartTitle Text="Total Sales Companywide">
                        </ChartTitle>
                    </telerik:RadHtmlChart>
                </div>
            </div>
            <asp:ObjectDataSource ID="TotalSalesComODS" runat="server" SelectMethod="usp_TotalSalesCom" TypeName="Test.BLL.Financial.TotalSalesComBL">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015/04/01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015/09/01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>

            <%--to check the data--%>
            <%--            <asp:GridView ID="TotalSalesComGV1" runat="server" AutoGenerateColumns="False" DataSourceID="TotalSalesComODS">
                <Columns>
                    <asp:BoundField DataField="YearMonth" HeaderText="YearMonth" SortExpression="YearMonth" />
                    <asp:BoundField DataField="Total_Sales" HeaderText="Total_Sales" SortExpression="Total_Sales" />
                </Columns>
            </asp:GridView>--%>

            <%--This section is for Total Sales Bcomparison presented on column chart--%>

            <div class="kpiheader">Total Sales Branch Comparison</div>
            <telerik:RadHtmlChart ID="TotalSalesBranchRHC1" runat="server">
                <Pan Enabled="true" Lock="Y" />
                <Zoom Enabled="true">
                    <MouseWheel Enabled="true" Lock="Y" />
                    <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                </Zoom>
                <%--Commented out because we are binding it using code behind--%>
                <%--<PlotArea>
                    <Series>
                        <telerik:LineSeries Name="Total Sale" DataFieldY="Total_Sales" >
                        </telerik:LineSeries>
                    </Series>

                    <XAxis DataLabelsField="Year_Month">
                        <TitleAppearance Text="Month">
                            <TextStyle Margin="20" />
                        </TitleAppearance>
                        <LabelsAppearance DataFormatString="MMM yyyy">
                        </LabelsAppearance>
                        <MajorGridLines Visible="false" />
                        <MinorGridLines Visible="false" />
                    </XAxis>

                    <YAxis>
                        <TitleAppearance Text="Branches">
                            <TextStyle Margin="20" />
                        </TitleAppearance>
                        <MinorGridLines Visible="false" />
                    </YAxis>
                </PlotArea>

                <ChartTitle Text="Total Sales Between Branches">
                </ChartTitle>
                <Zoom Enabled="False"></Zoom>--%>
            </telerik:RadHtmlChart>
            <asp:ObjectDataSource ID="TotalSalesBranchODS1" runat="server" SelectMethod="usp_TotalSalesBranch" TypeName="Test.BLL.Financial.TotalSalesBranchBL">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015/04/01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015/09/01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="CompanyDDL1" PropertyName="SelectedValue" DefaultValue="1" Name="companyRef" Type="Int32"></asp:ControlParameter>
                    <asp:ControlParameter ControlID="BranchDDL1" DefaultValue="0" Name="branchRef" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TimeDDL1" Name="timeType" PropertyName="SelectedValue" Type="Int32" DefaultValue="1" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <%--This section is for Total Sales Bcomparison presented on column chart--%>
            <%--Display Average Per Transaction Company--%>
            <br />
            <br />

            <br />
            <div class="kpiheader">Average Dollar Earned Per Transaction Companywide</div>
            <div style="">
                <telerik:RadHtmlChart ID="AvgPerTransactionComRHC1" runat="server" DataSourceID="AvgPerTransactionComODS1">
                    <Pan Enabled="true" Lock="Y" />
                    <Zoom Enabled="true">
                        <MouseWheel Enabled="true" Lock="Y" />
                        <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                    </Zoom>
                    <Legend>
                        <Appearance Position="Bottom" />
                    </Legend>
                    <PlotArea>
                        <XAxis Color="Black" DataLabelsField="Year_Month">
                            <TitleAppearance Position="Center" Text="Time Period" />
                            <LabelsAppearance DataFormatString="MMM yy">
                            </LabelsAppearance>
                        </XAxis>
                        <YAxis Color="Black">
                            <MajorGridLines Color="#EFEFEF" Width="1" />
                            <MinorGridLines Color="#F7F7F7" Width="1" />
                            <TitleAppearance Position="Center" Text="$" RotationAngle="90" />
                        </YAxis>
                        <Series>
                            <telerik:AreaSeries Name="Average Per Transaction" DataFieldY="Average_Dollar_per_Transaction">
                                <Appearance>
                                    <FillStyle BackgroundColor="Orange" />
                                </Appearance>
                                <MarkersAppearance MarkersType="Circle" BackgroundColor="White" />
                                <TooltipsAppearance BackgroundColor="White" />
                                <LabelsAppearance DataFormatString="C2">
                                </LabelsAppearance>
                            </telerik:AreaSeries>
                        </Series>
                    </PlotArea>

                    <ChartTitle Text="Average Dollar Value per Transaction Companywide ">
                    </ChartTitle>
                </telerik:RadHtmlChart>
            </div>
            <asp:ObjectDataSource ID="AvgPerTransactionComODS1" runat="server" SelectMethod="usp_AvgPerTransactionCom" TypeName="Test.BLL.Financial.AvgPerTransactionComBL" OnSelecting="AvgPerTransactionComODS1_Selecting">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TimeDDL1" Name="timeType" PropertyName="SelectedValue" Type="Int32" DefaultValue="1" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <telerik:RadGrid ID="RadGrid1" RenderMode="Lightweight" runat="server" DataSourceID="AvgPerTransactionBranchODS1" CellSpacing="-1" GridLines="Both" AllowFilteringByColumn="True"
            AllowSorting="True" AllowPaging="True" OnNeedDataSource="RadGrid1_NeedDataSource" Skin="Bootstrap">
                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <MasterTableView AutoGenerateColumns="False" DataSourceID="AvgPerTransactionBranchODS1">
                    <Columns>
                        <telerik:GridBoundColumn DataField="Branch_Name" FilterControlAltText="Filter Branch_Name column" HeaderText="Branch" SortExpression="Branch_Name" UniqueName="Branch_Name">
                            <FilterTemplate>
                                <telerik:RadComboBox RenderMode="Lightweight" ID="RadComboBoxTitle" DataSourceID="BranchDropDownODS1" DataTextField="Branch_Name"
                                DataValueField="Branch_Name" Width="200px" AppendDataBoundItems="true" SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("Branch_Name").CurrentFilterValue %>'
                                runat="server" OnClientSelectedIndexChanged="TitleIndexChanged">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="All" />
                                    </Items>
                                </telerik:RadComboBox>
                                <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                                <script type="text/javascript">
                                    function TitleIndexChanged(sender, args) {
                                        var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                        tableView.filter("Branch_Name", args.get_item().get_value(), "EqualTo");
                                }
                                </script>
                            </telerik:RadScriptBlock>
                            </FilterTemplate>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Year_Month" AllowFiltering="false" DataType="System.DateTime" FilterControlAltText="Filter Year_Month column" HeaderText="Time Period" SortExpression="Year_Month" UniqueName="Year_Month">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Average_Dollar_per_Transaction" AllowFiltering="false" DataType="System.Decimal" FilterControlAltText="Filter Average_Dollar_per_Transaction column" HeaderText="Average Dollar per Transaction" SortExpression="Average_Dollar_per_Transaction" UniqueName="Average_Dollar_per_Transaction">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
            <br />

            <%--Display Average Per Transaction Branch--%>
            <div class="kpiheader">Average Dollar Earned Per Transaction Branch Comparison</div>
            <telerik:RadHtmlChart ID="AvgPerTransactionBranchRHC1" runat="server">
                <Pan Enabled="true" Lock="Y" />
                <ChartTitle Text="Average Dollar Earned Per Transaction">
                </ChartTitle>
                <PlotArea>
                    <XAxis BaseUnit="Months">
                    </XAxis>
                </PlotArea>
                <Zoom Enabled="true">
                    <MouseWheel Enabled="true" Lock="Y" />
                    <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                </Zoom>
            </telerik:RadHtmlChart>
            <br />

            <asp:ObjectDataSource ID="AvgPerTransactionBranchODS1" runat="server" SelectMethod="usp_AvgPerTransactionBranch" TypeName="Test.BLL.Financial.AvgPerTransactionBranchBL">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                    <asp:Parameter DefaultValue="0" Name="branchRef" Type="Int32" />
                    <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>



            <%--This section is for Number of Transactions excluding Zero Total Bills companywide presented on column chart--%>
            <div class="kpiheader">Number of Transactions excluding Zero Total Bills Companywide</div>
            <telerik:RadHtmlChart ID="TransExcludeZeroTotalComRHC1" runat="server" DataSourceID="TransExcludeZeroTotalComODS1">
                <Pan Enabled="true" Lock="Y" />
                <Zoom Enabled="true">
                    <MouseWheel Enabled="true" Lock="Y" />
                    <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                </Zoom>

                <PlotArea>
                    <Series>
                        <telerik:ColumnSeries DataFieldY="No_of_transactions_excluding_zero_total_bill">
                            <LabelsAppearance DataFormatString="N">
                            </LabelsAppearance>
                        </telerik:ColumnSeries>
                    </Series>
                    <XAxis DataLabelsField="YearMonth" Type="Date">
                        <TitleAppearance Text="Time Period">
                            <TextStyle Margin="20" />
                        </TitleAppearance>
                        <LabelsAppearance DataFormatString="MMM yyyy">
                        </LabelsAppearance>
                        <MajorGridLines Visible="false" />
                        <MinorGridLines Visible="false" />
                    </XAxis>
                    <YAxis>
                        <TitleAppearance Text="No.">
                            <TextStyle Margin="20" />
                        </TitleAppearance>
                        <MinorGridLines Visible="false" />
                    </YAxis>
                </PlotArea>

                <ChartTitle Text="No of Transactions excluding Zero Total Bills">
                </ChartTitle>
            </telerik:RadHtmlChart>
            <asp:ObjectDataSource ID="TransExcludeZeroTotalComODS1" runat="server" SelectMethod="usp_TransExcludeZeroTotalCom" TypeName="Test.BLL.Financial.TransExcludeZeroTotalComBL">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <%--This section is for Number of Transactions excluding Zero Total Bills companywide presented on column chart--%>

            <%--This section is for Retail Only Sales companywide chart--%>

            <div class="kpiheader">Retail Only Sales Companywide</div>
            <telerik:RadHtmlChart ID="RetailOnlySalesComRHC1" runat="server" DataSourceID="RetailOnlySalesComODS1">
                <Pan Enabled="true" Lock="Y" />
                <Zoom Enabled="true">
                    <MouseWheel Enabled="true" Lock="Y" />
                    <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                </Zoom>
                <Legend>
                    <Appearance Position="Bottom" />
                </Legend>
                <PlotArea>
                    <XAxis Color="Black" DataLabelsField="Year_Month">
                        <TitleAppearance Position="Center" Text="Time Period" />
                        <LabelsAppearance DataFormatString="MMM yy">
                        </LabelsAppearance>
                    </XAxis>
                    <YAxis Color="Black">
                        <MajorGridLines Color="#EFEFEF" Width="1" />
                        <MinorGridLines Color="#F7F7F7" Width="1" />
                        <TitleAppearance Position="Center" Text="$" RotationAngle="90" />
                    </YAxis>
                    <Series>
                        <telerik:AreaSeries Name="Retail Sales" DataFieldY="Retail_Total_Only">
                            <Appearance>
                                <FillStyle BackgroundColor="Orange" />
                            </Appearance>
                            <MarkersAppearance MarkersType="Circle" BackgroundColor="White" />
                            <TooltipsAppearance BackgroundColor="White" />
                            <LabelsAppearance DataFormatString="C2">
                            </LabelsAppearance>
                        </telerik:AreaSeries>
                    </Series>
                </PlotArea>

                <ChartTitle Text="Retail Only Sales Companywide">
                </ChartTitle>
            </telerik:RadHtmlChart>

            <asp:ObjectDataSource ID="RetailOnlySalesComODS1" runat="server" SelectMethod="usp_RetailOnlySalesCom" TypeName="Test.BLL.Financial.RetailOnlySalesComBL">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <%--This section is for Retail Only Sales companywide chart--%>

            <%--This section is for Service Only Sales companywide chart--%>
            <div class="kpiheader">Service Only Sales Companywide</div>
            <telerik:RadHtmlChart ID="ServiceOnlySalesComRHC1" runat="server" DataSourceID="ServiceOnlySalesComODS1">
                <Pan Enabled="true" Lock="Y" />
                <Zoom Enabled="true">
                    <MouseWheel Enabled="true" Lock="Y" />
                    <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                </Zoom>
                <Legend>
                    <Appearance Position="Bottom" />
                </Legend>
                <PlotArea>
                    <XAxis Color="Black" DataLabelsField="Year_Month">
                        <TitleAppearance Position="Center" Text="Time Period" />
                        <LabelsAppearance DataFormatString="MMM yy">
                        </LabelsAppearance>
                    </XAxis>
                    <YAxis Color="Black">
                        <MajorGridLines Color="#EFEFEF" Width="1" />
                        <MinorGridLines Color="#F7F7F7" Width="1" />
                        <TitleAppearance Position="Center" Text="$" RotationAngle="90" />
                    </YAxis>
                    <Series>
                        <telerik:AreaSeries Name="Service Sales" DataFieldY="Service_Total_Only">
                            <Appearance>
                                <FillStyle BackgroundColor="Orange" />
                            </Appearance>
                            <MarkersAppearance MarkersType="Circle" BackgroundColor="White" />
                            <TooltipsAppearance BackgroundColor="White" />
                            <LabelsAppearance DataFormatString="C2">
                            </LabelsAppearance>
                        </telerik:AreaSeries>
                    </Series>
                </PlotArea>

                <ChartTitle Text="Service Only Sales Companywide">
                </ChartTitle>
            </telerik:RadHtmlChart>
            <asp:ObjectDataSource ID="ServiceOnlySalesComODS1" runat="server" SelectMethod="usp_ServiceOnlySalesCom" TypeName="Test.BLL.Financial.ServiceOnlySalesComBL">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <%--This section is for Service Only Sales companywide chart--%>

            <%--This section is for Retail Only Sales branch comparison chart--%>
            <div class="kpiheader">Retail Only Sales Branch Comparison</div>
            <telerik:RadHtmlChart ID="RetailOnlySalesBranchRHC1" runat="server"></telerik:RadHtmlChart>
            <%--This section is for Retail Only Sales branch comparison chart--%>

            <%--This section is for Service Only Sales branch comparison chart--%>
            <div class="kpiheader">Service Only Sales Branch Comparison</div>
            <telerik:RadHtmlChart ID="ServiceOnlySalesBranchRHC1" runat="server"></telerik:RadHtmlChart>
            <%--This section is for Service Only Sales branch comparison chart--%>
        </div>



    </form>
    <script>
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
</asp:Content>


