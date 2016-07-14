<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Test.Dashboard" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">

        <!-- page content -->
        <div class="right_col" role="main">
            <!-- top tiles -->
            <div class="row tile_count">
                <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                    <span class="count_top"><i class="fa fa-money"></i> Avg $ per Transaction</span>
                    <div class="count">$8</div>
                    <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>4% </i>From last Month</span>
                </div>
                  <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                    <span class="count_top"><i class="fa fa-money"></i> Avg $ per Customer</span>
                    <div class="count">$15</div>
                    <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i>From last Month</span>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                    <span class="count_top"><i class="fa fa-plus"></i> Number of New Clients</span>
                    <div class="count">123</div>
                    <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>3% </i>From last Month</span>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                    <span class="count_top"><i class="fa fa-paw"></i> Total Large Animals</span>
                    <div class="count green">250</div>
                    <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i>From last Month</span>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                    <span class="count_top"><i class="fa fa-paw"></i> Total Small Animals</span>
                    <div class="count">456</div>
                    <span class="count_bottom"><i class="red"><i class="fa fa-sort-desc"></i>12% </i>From last Month</span>
                </div>
              
               
            </div>
            <!-- /top tiles -->

            <div>
            </div>
            <div style="width: 100%; overflow: hidden;">
                <div style="width: 388px; float: left;">
                    Left - sqldatasource 
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        <telerik:RadHtmlChart ID="RadHtmlChart1" runat="server" DataSourceID="SqlDataSource1"></telerik:RadHtmlChart>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KPIConnectionString %>" SelectCommand="TotalSalesBComparison" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter DbType="Date" Name="start" />
                            <asp:Parameter DbType="Date" Name="end" />
                            <asp:Parameter Name="branchRef" Type="Int32" />
                            <asp:Parameter Name="TimeType" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetTotalSalesMonth" TypeName="Test.BLL.Financial.GetTotalSalesMonthBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="start" PropertyName="SelectedValue" Type="DateTime" />
                            <asp:ControlParameter ControlID="GridView1" Name="end" PropertyName="SelectedValue" Type="DateTime" />
                            <asp:ControlParameter ControlID="GridView1" Name="branchRef" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="GridView1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
                <div style="width: 409px; float: right; margin-left: 0px; height: 318px;">
                    Right - Objectdatasource
        <telerik:RadHtmlChart ID="RadHtmlChart2" runat="server"></telerik:RadHtmlChart>
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetTotalSalesMonth" TypeName="Test.BLL.Financial.GetTotalSalesMonthBL">
                        <SelectParameters>
                            <asp:Parameter Name="start" Type="DateTime" />
                            <asp:Parameter Name="end" Type="DateTime" />
                            <asp:Parameter Name="branchRef" Type="Int32" />
                            <asp:Parameter Name="timeType" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>

         <%--   Grids/data tables start--%>
             <div style="width: 388px; float: left; height: 316px;">
                  <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1" AutoGenerateColumns="False"  DataKeyNames="YearMonth"
                       Width="207px">
                      <Columns>
                          <asp:BoundField DataField="YearMonth" HeaderText="YearMonth" SortExpression="YearMonth" />
                          <asp:BoundField DataField="Total_Sales" HeaderText="Total_Sales" SortExpression="Total_Sales" />
                      </Columns>
                  </asp:GridView>
            </div>
            <div style="width: 409px; float: right; margin-left: 0px; height: 318px;">
                </div>
           
        </div>
        <%--Grids/data tables end--%>
    </form>

       </asp:Content>
