<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="financialKPI.aspx.cs" Inherits="Test.KPI" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="right_col" role="main">
            <div id="KPIMenu" style="text-align: center">
                <a href="/financialKPI.aspx" style="font-size: 20px"><strong>Financial</strong></a>
                <strong>|</strong>
                <a href="/employeekpi.aspx" style="font-size: 20px"><strong>Employee</strong></a>
                <strong>|</strong>
                <a href="/customerkpi.aspx" style="font-size: 20px"><strong>Customer</strong></a>
            </div>
            <%--Trying the Panel change--%>

            
            <telerik:RadDatePicker ID="DatePicker1" runat="server" PopupDirection="BottomLeft"></telerik:RadDatePicker>
            <telerik:RadDatePicker ID="DatePicker2" runat="server" PopupDirection="BottomLeft"></telerik:RadDatePicker>
            <asp:DropDownList ID="Company" runat="server">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
            </asp:DropDownList>
               
            <asp:DropDownList ID="Dropdown1" runat="server">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />

            <%--Display Average Per Transaction Company--%>
            <telerik:RadHtmlChart ID="RadHtmlChart1" runat="server" DataSourceID="ObjectDataSource1">

                <Legend>
                      <Appearance Position="Bottom" />
                </Legend>
                <PlotArea>
                    <XAxis Color="Black" DataLabelsField="Year_Month">
                        <TitleAppearance Position="Center" Text="Time Period" />
                    </XAxis>
                    <YAxis Color="Black">
                        <MajorGridLines Color="#EFEFEF" Width="1" />
                        <MinorGridLines Color="#F7F7F7" Width="1" />
                        <TitleAppearance Position="Center" Text="Retail Total" RotationAngle="90" />
                    </YAxis>
                    <Series>
                        <telerik:AreaSeries Name="Average Per Transaction" DataFieldY="Average_Dollar_per_Transaction">
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
           
            <%--Display Average Per Transaction Company--%>

            <%--Display Average Per Transaction Branch--%>
            <telerik:RadHtmlChart ID="RadHtmlChart2" runat="server">
            </telerik:RadHtmlChart>
            <br />
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="usp_AvgPerTransactionCom" TypeName="Test.BLL.Financial.AvgPerTransactionComBL">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="Company" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="Dropdown1" Name="timeType" PropertyName="SelectedValue" Type="Int32" DefaultValue="1" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="usp_AvgPerTransactionBranch" TypeName="Test.BLL.Financial.AvgPerTransactionBranchBL">
                <SelectParameters>
                    <asp:Parameter DefaultValue="2013-01-01" Name="start" Type="DateTime" />
                    <asp:Parameter DefaultValue="2014-12-31" Name="end" Type="DateTime" />
                    <asp:Parameter DefaultValue="1" Name="companyRef" Type="Int32" />
                    <asp:Parameter DefaultValue="0" Name="branchRef" Type="Int32" />
                    <asp:Parameter DefaultValue="2" Name="timeType" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="Branch_Ref" HeaderText="Branch_Ref" SortExpression="Branch_Ref" />
                    <asp:BoundField DataField="Year_Month" HeaderText="Year_Month" SortExpression="Year_Month" />
                    <asp:BoundField DataField="Average_Dollar_per_Transaction" HeaderText="Average_Dollar_per_Transaction" SortExpression="Average_Dollar_per_Transaction" />
                </Columns>
            </asp:GridView>

             <%--This section is for Total Sales Company--%> 

            <telerik:RadDatePicker ID="TotalSalesComRDP1" runat="server" PopupDirection="BottomLeft"></telerik:RadDatePicker>
            <telerik:RadDatePicker ID="TotalSalesComRDP2" runat="server" PopupDirection="BottomLeft"></telerik:RadDatePicker>
            <asp:DropDownList ID="TotalSalesComDDLBranch" runat="server" Width="58px">
                <asp:ListItem Value="0">All Branches</asp:ListItem>
                <asp:ListItem> 1 </asp:ListItem>
                <asp:ListItem> 2 </asp:ListItem>
                <asp:ListItem> 3 </asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="TotalSalesComDDLTime" runat="server" Width="99px">
                <asp:ListItem Value="1"> Monthly </asp:ListItem>
                <asp:ListItem Value="2"> Yearly </asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="TotalSalesComButton1" runat="server" Text="View" OnClick="ViewTotalSalesCom_Click" />

            <telerik:RadHtmlChart ID="TotalSalesComRHC1" runat="server" DataSourceID="TotalSalesComODS">
                <Pan Enabled="true" Lock="Y" />
                <Zoom Enabled="true">
                    <MouseWheel Enabled="true" Lock="Y" />
                    <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                </Zoom>
                
                <PlotArea>
                    <Series>
                        <telerik:ColumnSeries DataFieldY="Total_Sales">
                        </telerik:ColumnSeries>
                    </Series>
                    <XAxis DataLabelsField="YearMonth" Type="Date">
                        <TitleAppearance Text="Month">
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
            <asp:ObjectDataSource ID="TotalSalesComODS" runat="server" SelectMethod="usp_TotalSalesCom" TypeName="Test.BLL.Financial.TotalSalesComBL" >
                <SelectParameters>
                    <asp:ControlParameter ControlID="TotalSalesComRDP1" DefaultValue="2015/04/01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="TotalSalesComRDP2" DefaultValue="2015/09/01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:Parameter DefaultValue="1" Name="companyRef" Type="Int32" />
                    <asp:ControlParameter ControlID="TotalSalesComDDLTime" Name="timeType" PropertyName="SelectedValue" Type="Int32" DefaultValue="1" />
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


            <telerik:RadDatePicker ID="TotalSalesBComparison1" runat="server" PopupDirection="BottomLeft"></telerik:RadDatePicker>
            <telerik:RadDatePicker ID="TotalSalesBComparison2" runat="server" PopupDirection="BottomLeft"></telerik:RadDatePicker>
            <asp:DropDownList ID="TotalSalesBComparison4" runat="server" Width="58px">
                <asp:ListItem Value="0">All Branches</asp:ListItem>
                <asp:ListItem> 1 </asp:ListItem>
                <asp:ListItem> 2 </asp:ListItem>
                <asp:ListItem> 3 </asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="TotalSalesBComparison3" runat="server" Width="99px">
                <asp:ListItem Value="1"> Monthly </asp:ListItem>
                <asp:ListItem Value="2"> Yearly </asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="ViewTotalSalesBComparison" runat="server" Text="View" OnClick="ViewTotalSalesBComparison_Click" />

            <telerik:RadHtmlChart ID="RadHtmlChart3" runat="server">
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
            <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" SelectMethod="usp_TotalSalesBranch" TypeName="Test.BLL.Financial.TotalSalesBranchBL">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TotalSalesBComparison1" DefaultValue="2015/04/01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="TotalSalesBComparison2" DefaultValue="2015/09/01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:Parameter DefaultValue="1" Name="companyRef" Type="Int32" />
                    <asp:ControlParameter ControlID="TotalSalesBComparison4" DefaultValue="0" Name="branchRef" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TotalSalesBComparison3" Name="timeType" PropertyName="SelectedValue" Type="Int32" DefaultValue="1" />
                </SelectParameters>
            </asp:ObjectDataSource>

            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource5">
                <Columns>
                    <asp:BoundField DataField="Branch_Ref" HeaderText="Branch_Ref" SortExpression="Branch_Ref" />
                    <asp:BoundField DataField="YearMonth" HeaderText="YearMonth" SortExpression="YearMonth" />
                    <asp:BoundField DataField="Total_Sales" HeaderText="Total_Sales" SortExpression="Total_Sales" />
                </Columns>
            </asp:GridView>
        </div>


    </form>
<Script>
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
</Script>
</asp:Content>


