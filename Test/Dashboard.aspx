<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Test.Dashboard" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <!-- page content -->
        <div class="right_col" role="main">
            <!-- top tiles -->
            <div class="row tile_count" style="position: center">
                <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count" runat="server">
                    <span class="count_top"><i class="fa fa-money"></i>Total Sales</span>
                    <div class="count blue"> 
                        <asp:Label ID="Label1" runat="server" Text="Label" class="count blue"></asp:Label>
                    </div>
                    <span class="count_bottom" runat="server">
                        <i id="color" class="red">
                            <i class="fa fa-sort-desc"></i>
                            <asp:Label ID="LabelPercent1" runat="server"></asp:Label>
                        </i>From last Month
                    </span>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                    <span class="count_top"><i class="fa fa-money"></i>Avg $ per Transaction</span>
                    <div class="count blue">
                        <asp:Label ID="Label2" runat="server" class="count blue"></asp:Label>
                    </div>
                    <span class="count_bottom">
                        <i class="green">
                            <i class="fa fa-sort-asc"></i>
                            <asp:Label ID="LabelPercent2" runat="server"></asp:Label>
                        </i>From last Month</span>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                    <span class="count_top"><i class="fa fa-money"></i>Avg $ per Customer</span>
                    <div class="count blue">
                        <asp:Label ID="Label3" runat="server" class="count blue"></asp:Label>
                    </div>
                    <span class="count_bottom">
                        <i class="green">
                            <i class="fa fa-sort-asc"></i>
                            <asp:Label ID="LabelPercent3" runat="server"></asp:Label>
                        </i>From last Month</span>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                    <span class="count_top"><i class="fa fa-plus"></i>Number of New Customers</span>
                    <div class="count blue">
                        <asp:Label ID="Label4" runat="server" class="count blue"></asp:Label>
                    </div>
                    <span class="count_bottom">
                        <i class="green">
                            <i class="fa fa-sort-asc"></i>
                            <asp:Label ID="LabelPercent4" runat="server"></asp:Label>
                        </i>From last Month</span>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                    <span class="count_top"><i class="fa fa-plus"></i>Unique Number of New Customers</span>
                    <div class="count blue">
                        <asp:Label ID="Label5" runat="server" class="count blue"></asp:Label>
                    </div>
                    <span class="count_bottom">
                        <i class="red">
                            <i class="fa fa-sort-desc"></i>
                            <asp:Label ID="LabelPercent5" runat="server"></asp:Label>
                        </i>From last Month</span>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                    <span class="count_top"><i class="fa fa-paw"></i>Total Number of Animals Seen</span>
                    <div class="count blue">
                        <asp:Label ID="Label6" runat="server" class="count blue"></asp:Label>
                    </div>
                    <span class="count_bottom">
                        <i class="red">
                            <i class="fa fa-sort-desc"></i>
                            <asp:Label ID="LabelPercent6" runat="server"></asp:Label>
                        </i>From last Month</span>
                </div>
                


            </div>
            <!-- /top tiles -->


            <div class="col-sm-12">
                <%-- Line chart --%>
                <div class="col-sm-12">
                    <telerik:RadHtmlChart ID="RadHtmlChart1" runat="server" DataSourceID="TotalSalesComODS1" Skin="MetroTouch">
                        <ClientEvents OnLoad="chartLoad" />
                        <PlotArea>
                            <Series>
                                <telerik:LineSeries DataFieldY="Total_Sales">
                                    <LabelsAppearance DataFormatString="N0">
                                    </LabelsAppearance>
                                    <TooltipsAppearance DataFormatString="C0"></TooltipsAppearance>
                                </telerik:LineSeries>
                            </Series>
                            <XAxis DataLabelsField="YearMonth" Type="Date">
                                <TitleAppearance Text="Time Period">
                                    <TextStyle Margin="20" />
                                </TitleAppearance>
                                <LabelsAppearance DataFormatString="MMM yyyy" RotationAngle="60">
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

                        <ChartTitle Text="Total Sales">
                        </ChartTitle>
                    </telerik:RadHtmlChart>
                    <asp:ObjectDataSource ID="TotalSalesComODS1" runat="server" SelectMethod="usp_TotalSalesCom" TypeName="Test.BLL.Financial.TotalSalesComBL">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="2015/04/01" Name="start" Type="DateTime" />
                            <asp:Parameter DefaultValue="2015/09/01" Name="end" Type="DateTime" />
                            <asp:Parameter DefaultValue="1" Name="companyRef" Type="Int32" />
                            <asp:Parameter DefaultValue="1" Name="timeType" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>


                
                <div class="col-sm-6">
                    <telerik:RadHtmlChart ID="IncomeByProductCategoryComRHC1" runat="server" DataSourceID="IncomeByProductCategoryComODS1" Skin="Bootstrap">
                        <ClientEvents OnLoad="chartLoad" />
                        <ChartTitle Text="Income by Product Category Companywide"> </ChartTitle>
                        <PlotArea>
                            <Series>
                                <telerik:PieSeries StartAngle="90" DataFieldY="Income"  ExplodeField="IsExploded" NameField="Category_Type" Name="Name">
                                    <LabelsAppearance Visible="false"></LabelsAppearance>
                                    <TooltipsAppearance DataFormatString="{0:N0} %" />
                                </telerik:PieSeries>
                            </Series>
                        </PlotArea>
                        <Zoom Enabled="False"></Zoom>
                    </telerik:RadHtmlChart>
                    <asp:ObjectDataSource ID="IncomeByProductCategoryComODS1" runat="server" SelectMethod="usp_IncomeByProductCategoryCom" TypeName="Test.BLL.Financial.IncomeByProductCategoryComBL">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="2015-01-01" Name="start" Type="DateTime" />
                            <asp:Parameter DefaultValue="2015-12-31" Name="end" Type="DateTime" />
                            <asp:Parameter DefaultValue="1" Name="companyRef" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    </div>
                <div class="col-sm-6">
                    <telerik:RadHtmlChart ID="IncomeByServiceActivityComRHC1" runat="server" DataSourceID="IncomeByServiceActivityComODS1" Skin="Material">
                        <ClientEvents OnLoad="chartLoad" />
                        <ChartTitle Text="Income by Service Activity Companywide"> </ChartTitle>
                        <PlotArea>
                            <Series>
                                <telerik:PieSeries StartAngle="90" DataFieldY="Income" ExplodeField="IsExploded" NameField="Category_Type" Name="Name">
                                    <LabelsAppearance Visible="false"></LabelsAppearance>
                                    <TooltipsAppearance DataFormatString="{0:N0} %" />
                                </telerik:PieSeries>
                            </Series>
                        </PlotArea>
                        <Zoom Enabled="False"></Zoom>
                    </telerik:RadHtmlChart>
                    <asp:ObjectDataSource ID="IncomeByServiceActivityComODS1" runat="server" SelectMethod="usp_IncomeByServiceActivityCom" TypeName="Test.BLL.Financial.IncomeByServiceActivityComBL">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="2015-01-01" Name="start" Type="DateTime" />
                            <asp:Parameter DefaultValue="2015-12-31" Name="end" Type="DateTime" />
                            <asp:Parameter DefaultValue="1" Name="companyRef" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
                <%--This is donut chart for Income by Product Category of a company--%>
                <div class="col-sm-6">
                    <%--<telerik:RadHtmlChart ID="ProductCategory1" runat="server" DataSourceID="ObjectDataSource5">
                        <Appearance>
                        </Appearance>
                        <ChartTitle Text="Income by Product Category Companywide">
                            <Appearance Align="Center" Position="Top"></Appearance>
                        </ChartTitle>
                        <PlotArea>
                            <Series>
                                <telerik:donutSeries HoleSize="50" StartAngle="90" DataFieldY="Income" NameField="Category_Type" Name="Income">
                                    <LabelsAppearance Visible="false">
                                    </LabelsAppearance>
                                  
                                    <TooltipsAppearance DataFormatString="{0}%"></TooltipsAppearance>
                                </telerik:donutSeries>
                            </Series>
                        </PlotArea>
                        <Zoom Enabled="False"></Zoom>
                    </telerik:RadHtmlChart>

                    <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" SelectMethod="ProductCategory" TypeName="Test.BLL.Financial.ProductCategoryBL">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="2011-01-01" Name="start" Type="DateTime" />
                            <asp:Parameter DefaultValue="2020-01-01" Name="end" Type="DateTime" />
                            <asp:Parameter DefaultValue="1" Name="branchRef" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--This is donut chart of Product Category--%>
                </div>

            </div>
            <%--Grids/data tables end--%>
            <%--<telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="ObjectDataSource5">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <MasterTableView AutoGenerateColumns="False" DataSourceID="ObjectDataSource5">
                    <Columns>
                        <telerik:GridBoundColumn DataField="Category_Type" FilterControlAltText="Filter Category_Type column" HeaderText="Category_Type" SortExpression="Category_Type" UniqueName="Category_Type">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Income" DataType="System.Decimal" FilterControlAltText="Filter Income column" HeaderText="Income" SortExpression="Income" UniqueName="Income">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>--%>
        </div>


    </form>
    <script>
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
    </script>

</asp:Content>
