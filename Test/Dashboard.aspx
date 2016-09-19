<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Test.Dashboard" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="kpiNameHeader" runat="Server">
    <header style="padding: inherit; margin-top: 15px">
        <h3>As of 14th of May</h3>
    </header>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadStyleSheetManager runat="server"></telerik:RadStyleSheetManager>
    <telerik:RadScriptManager runat="server"></telerik:RadScriptManager>
    <!-- page content -->
    <div class="right_col" role="main">
        <!-- top tiles -->
        <div class="row tile_count" style="margin-top: 55px;">
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count" runat="server">
                <span class="count_top"><i class="fa fa-money"></i>Total Sales</span>
                <div class="count blue">
                    <asp:Label ID="Label1" runat="server"  Text="Label" class="count blue"></asp:Label>
                </div>
                <span id="Label1span" class="count_bottom" runat="server">
                    <i id="icon1" runat="server"></i>
                    <asp:Label ID="LabelPercent1" runat="server" Font-Bold="true"></asp:Label>
                </span>
                <span>From Last Month</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                <span class="count_top"><i class="fa fa-money"></i>Avg $ per Transaction</span>
                <div class="count blue">
                    <asp:Label ID="Label2" runat="server" class="count blue"></asp:Label>
                </div>
                <span id="Label2span" class="count_bottom" runat="server">
                    <i id="icon2" runat="server"></i>
                    <asp:Label ID="LabelPercent2" runat="server" Font-Bold="true"></asp:Label>
                </span>
                <span>From Last Month</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                <span class="count_top"><i class="fa fa-money"></i>Avg $ per Customer</span>
                <div class="count blue">
                    <asp:Label ID="Label3" runat="server" class="count blue"></asp:Label>
                </div>
                <span id="Label3span" class="count_bottom" runat="server">
                    <i id="icon3" runat="server"></i>
                    <asp:Label ID="LabelPercent3" runat="server" Font-Bold="true"></asp:Label>
                </span>
                <span>From Last Month</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                <span class="count_top"><i class="fa fa-plus"></i>New Customers</span>
                <div class="count blue">
                    <asp:Label ID="Label4" runat="server" class="count blue"></asp:Label>
                </div>
                <span id="Label4span" class="count_bottom" runat="server">
                    <i id="icon4" runat="server"></i>
                    <asp:Label ID="LabelPercent4" runat="server" Font-Bold="true"></asp:Label>
                </span>
                <span>From Last Month</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                <span class="count_top"><i class="fa fa-plus"></i>Unique Customers Seen</span>
                <div class="count blue">
                    <asp:Label ID="Label5" runat="server" class="count blue"></asp:Label>
                </div>
                <span id="Label5span" class="count_bottom" runat="server">
                    <i id="icon5" runat="server"></i>
                    <asp:Label ID="LabelPercent5" runat="server" Font-Bold="true"></asp:Label>
                </span>
                <span>From Last Month</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                <span class="count_top"><i class="fa fa-paw"></i>Animals Seen</span>
                <div class="count blue">
                    <asp:Label ID="Label6" runat="server" class="count blue"></asp:Label>
                </div>
                <span id="Label6span" class="count_bottom" runat="server">
                    <i id="icon6" runat="server"></i>
                    <asp:Label ID="LabelPercent6" runat="server" Font-Bold="true"></asp:Label>
                </span>
                <span>From Last Month</span>
            </div>
            <!-- /top tiles -->


            <div class="col-sm-12">
                <%-- Line chart --%>
                <div class="col-sm-12">
                    <telerik:radhtmlchart id="TotalSalesCompanyRHC1" runat="server" RenderAs="Canvas" RenderMode="Lightweight" datasourceid="TotalSalesCompanyODS1" skin="MetroTouch" width="100%">
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
                                        <TextStyle Margin="10" />
                                    </TitleAppearance>
                                    <MinorGridLines Visible="false" />
                                </YAxis>
                            </PlotArea>

                            <ChartTitle Text="Total Sales">
                            </ChartTitle>
                        </telerik:radhtmlchart>
                    <asp:ObjectDataSource ID="TotalSalesCompanyODS1" runat="server" SelectMethod="usp_TotalSalesCompany" TypeName="Test.BLL.Financial.TotalSalesCompanyBL">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="2015/04/01" Name="start" Type="DateTime" />
                            <asp:Parameter DefaultValue="2015/09/30" Name="end" Type="DateTime" />
                            <asp:SessionParameter SessionField="CompanyRef" DefaultValue="" Name="companyRef" Type="Int32"></asp:SessionParameter>
                            <asp:Parameter DefaultValue="1" Name="timeType" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
                <div class="col-sm-6">
                    <telerik:radhtmlchart id="IncomeByProductCategoryComRHC1" runat="server" RenderAs="Canvas" RenderMode="Lightweight" datasourceid="IncomeByProductCategoryCompanyODS1" skin="Bootstrap">
                            <ClientEvents OnLoad="chartLoad" />
                            <ChartTitle Text="Income by Product Category Companywide"></ChartTitle>
                            <PlotArea>
                                <Series>
                                    <telerik:PieSeries StartAngle="90" DataFieldY="Income" ExplodeField="IsExploded" NameField="Category_Type" Name="Name">
                                        <LabelsAppearance Visible="false"></LabelsAppearance>
                                        <TooltipsAppearance DataFormatString="{0:N0} %" />
                                    </telerik:PieSeries>
                                </Series>
                            </PlotArea>
                            <Zoom Enabled="False"></Zoom>
                        </telerik:radhtmlchart>
                    <asp:ObjectDataSource ID="IncomeByProductCategoryCompanyODS1" runat="server" SelectMethod="usp_IncomeByProductCategoryCompany" TypeName="Test.BLL.Financial.IncomeByProductCategoryCompanyBL">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="2015-01-01" Name="start" Type="DateTime" />
                            <asp:Parameter DefaultValue="2015-12-31" Name="end" Type="DateTime" />
                            <asp:SessionParameter SessionField="CompanyRef" DefaultValue="" Name="companyRef" Type="Int32"></asp:SessionParameter>



                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
                <div class="col-sm-6">
                    <telerik:radhtmlchart id="IncomeByServiceActivityComRHC1" runat="server" RenderAs="Canvas" RenderMode="Lightweight" datasourceid="IncomeByServiceActivityCompanyODS1" skin="Material">
                            <ClientEvents OnLoad="chartLoad" />
                            <ChartTitle Text="Income by Service Activity Companywide"></ChartTitle>
                            <PlotArea>
                                <Series>
                                    <telerik:PieSeries StartAngle="90" DataFieldY="Income" ExplodeField="IsExploded" NameField="Category_Type" Name="Name">
                                        <LabelsAppearance Visible="false"></LabelsAppearance>
                                        <TooltipsAppearance DataFormatString="{0:N0} %" />
                                    </telerik:PieSeries>
                                </Series>
                            </PlotArea>
                            <Zoom Enabled="False"></Zoom>
                        </telerik:radhtmlchart>
                    <asp:ObjectDataSource ID="IncomeByServiceActivityCompanyODS1" runat="server" SelectMethod="usp_IncomeByServiceActivityCompany" TypeName="Test.BLL.Financial.IncomeByServiceActivityCompanyBL">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="2015-01-01" Name="start" Type="DateTime" />
                            <asp:Parameter DefaultValue="2015-12-31" Name="end" Type="DateTime" />
                            <asp:SessionParameter SessionField="CompanyRef" DefaultValue="" Name="companyRef" Type="Int32"></asp:SessionParameter>



                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
                <div class="col-sm-6">
                </div>

            </div>
        </div>
    </div>
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

        //format Y axis value based on value
        function pageLoad() {

            var chart1 = $find("<%=TotalSalesCompanyRHC1.ClientID%>");
            chart1.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart1.repaint();
        }
    </script>

</asp:Content>
