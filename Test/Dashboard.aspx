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
                <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                    <span class="count_top"><i class="fa fa-money"></i>Total Sales</span>
                    <div class="count">$15,000</div>
                    <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>4% </i>From last Month</span>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                    <span class="count_top"><i class="fa fa-money"></i>Avg $ per Transaction</span>
                    <div class="count">$8</div>
                    <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>4% </i>From last Month</span>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                    <span class="count_top"><i class="fa fa-money"></i>Avg $ per Customer</span>
                    <div class="count">$15</div>
                    <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i>From last Month</span>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                    <span class="count_top"><i class="fa fa-plus"></i>Number of New Clients</span>
                    <div class="count">123</div>
                    <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>3% </i>From last Month</span>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                    <span class="count_top"><i class="fa fa-paw"></i>Total Large Animals</span>
                    <div class="count green">250</div>
                    <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i>From last Month</span>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                    <span class="count_top"><i class="fa fa-paw"></i>Total Small Animals</span>
                    <div class="count">456</div>
                    <span class="count_bottom"><i class="red"><i class="fa fa-sort-desc"></i>12% </i>From last Month</span>
                </div>


            </div>
            <!-- /top tiles -->


            <div class="col-sm-12">
                <%-- Line chart --%>
                <div class="col-sm-12">
                    <telerik:RadHtmlChart ID="RadHtmlChart1" runat="server" DataSourceID="ObjectDataSource1">

                       <ChartTitle Text="Retail Total">
        <Appearance Align="Center" Position="Top" />
    </ChartTitle>
    <Legend>
        <Appearance Position="Bottom" />
    </Legend>
    <PlotArea>
        <XAxis Color="Black" DataLabelsField="YearMonth">
            <TitleAppearance Position="Center" Text="Time Period" />
        </XAxis>
        <YAxis Color="Black">
            <MajorGridLines Color="#EFEFEF" Width="1" />
            <MinorGridLines Color="#F7F7F7" Width="1" />
            <TitleAppearance Position="Center" Text="Retail Total" RotationAngle="90" />
        </YAxis>
        <Series>
            <telerik:AreaSeries Name="Retail Total" DataFieldY="Retail_Total">
                <Appearance>
                    <FillStyle BackgroundColor="Orange" />
                </Appearance>
                <MarkersAppearance MarkersType="Circle" BackgroundColor="White" />
                <TooltipsAppearance BackgroundColor="White" />
            </telerik:AreaSeries>
        </Series>
    </PlotArea>

                        <ChartTitle Text="Total Sales Between Branches">
                        </ChartTitle>
                    </telerik:RadHtmlChart>

                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="RetailTotal" TypeName="Test.BLL.Financial.RetailTotalBL">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="2015-01-16" Name="start" Type="DateTime" />
                            <asp:Parameter DefaultValue="2016-06-06" Name="end" Type="DateTime" />
                            <asp:Parameter DefaultValue="3" Name="companyRef" Type="Int32" />
                            <asp:Parameter DefaultValue="1" Name="timeType" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>


                <%--   Pie Chart --%>
                <div class="col-sm-6">
                    <telerik:RadHtmlChart ID="RadHtmlChart4" runat="server" DataSourceID="ObjectDataSource4">
                        <ChartTitle Text="Product Category"> </ChartTitle>
                        <PlotArea>
                            <Series>
                                <telerik:PieSeries StartAngle="90" DataFieldY="Income" ExplodeField="IsExploded" NameField="Category_Type" Name="Name">
                                    <LabelsAppearance Position="OutsideEnd" DataFormatString="{0} %" />
                                    <TooltipsAppearance DataFormatString="{0} %" />
                                </telerik:PieSeries>
                            </Series>
                        </PlotArea>
                        <Zoom Enabled="False"></Zoom>
                    </telerik:RadHtmlChart>
                    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" SelectMethod="ProductCategory" TypeName="Test.BLL.Financial.ProductCategoryBL">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="2010-01-01" Name="start" Type="DateTime" />
                            <asp:Parameter DefaultValue="2020-01-11" Name="end" Type="DateTime" />
                            <asp:Parameter DefaultValue="1" Name="branchRef" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
                <%--This is donut chart of Product Category--%>
                <div class="col-sm-6">


                    <telerik:RadHtmlChart ID="ProductCategory1" runat="server" DataSourceID="ObjectDataSource5">
                        <Appearance>
                        </Appearance>
                        <ChartTitle Text="Product Category">
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
            <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="ObjectDataSource5">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <MasterTableView AutoGenerateColumns="False" DataSourceID="ObjectDataSource5">
                    <Columns>
                        <telerik:GridBoundColumn DataField="Category_Type" FilterControlAltText="Filter Category_Type column" HeaderText="Category_Type" SortExpression="Category_Type" UniqueName="Category_Type">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Income" DataType="System.Decimal" FilterControlAltText="Filter Income column" HeaderText="Income" SortExpression="Income" UniqueName="Income">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>


    </form>

</asp:Content>
