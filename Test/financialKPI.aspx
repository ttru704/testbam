<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="financialKPI.aspx.cs" Inherits="Test.KPI" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="right_col" role="main">
            <div id="KPIMenu" style="text-align: center">
                <a href="/financialKPI.aspx" style="font-size: 20px"><strong>Financial</strong></a>
                <strong>|</strong>
                <a href="/employeekpi.aspx" style="font-size: 20px"><strong>Employee</strong></a>
                <strong>|</strong>
                <a href="/customerkpi.aspx" style="font-size: 20px"><strong>Customer</strong></a>
            </div>
            <%--Trying the Panel change--%>
            Search by product or by category?
        <br />
            <asp:RadioButton ID="radioProduct"
                runat="server"
                AutoPostBack="true"
                GroupName="SearchType"
                Text="Product"
                OnCheckedChanged="radioButton_CheckedChanged" />
            &nbsp;
        <asp:RadioButton ID="radioCategory"
            runat="server"
            AutoPostBack="true"
            GroupName="SearchType"
            Text="Category"
            OnCheckedChanged="radioButton_CheckedChanged" />
            <br />
            <br />
            <asp:MultiView ID="MultiView1" runat="server" >
                <asp:View ID="viewProductSearch" runat="server">
                    Enter product name: 
                <asp:TextBox ID="textProductName" runat="server">
                </asp:TextBox>
                </asp:View>
                <asp:View ID="viewCategorySearch" runat="server">
                    Enter category: 
                <asp:TextBox ID="textCategory" runat="server">
                </asp:TextBox>
                </asp:View>
            </asp:MultiView>&nbsp;<br />
            <br />

            <asp:Button ID="btnSearch"
                OnClick="Button1_Click"
                runat="server" Text="Search" />
            <br />
            <%-- Retail Total KPI --%>


            <telerik:RadDatePicker ID="RDP1" runat="server" PopupDirection="BottomLeft"></telerik:RadDatePicker>
            <telerik:RadDatePicker ID="RDP2" runat="server" PopupDirection="BottomLeft"></telerik:RadDatePicker>
            <asp:DropDownList ID="DropDownList1" runat="server" Width="58px">
                <asp:ListItem> 1 </asp:ListItem>
                <asp:ListItem> 2 </asp:ListItem>
                <asp:ListItem> 3 </asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem Value="1">Monthly</asp:ListItem>
                <asp:ListItem Value="2">Yearly</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Button2" runat="server" Text="View" OnClick="Button2_Click" />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
                <Columns>
                    <asp:BoundField DataField="YearMonth" HeaderText="YearMonth" SortExpression="YearMonth" />
                    <asp:BoundField DataField="Retail_Total" HeaderText="Retail_Total" SortExpression="Retail_Total" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="RetailTotal" TypeName="Test.BLL.Financial.RetailTotalBL">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RDP1" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="RDP2" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="branchRef" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="DropDownList2" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>


            <%--Income by Product Category KPI--%>
            <telerik:RadDatePicker ID="StartDateforIncomeProdCat" runat="server" PopupDirection="BottomLeft"></telerik:RadDatePicker>
            <telerik:RadDatePicker ID="EndDateforIncomeProdCat" runat="server" PopupDirection="BottomLeft"></telerik:RadDatePicker>
            <asp:DropDownList ID="DropDownList3" runat="server" Width="58px">
                <asp:ListItem> 1 </asp:ListItem>
                <asp:ListItem> 2 </asp:ListItem>
                <asp:ListItem> 3 </asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList4" runat="server" Width="99px">
                <asp:ListItem Value="1"> Monthly </asp:ListItem>
                <asp:ListItem Value="2"> Yearly </asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" Text="View" OnClick="Button1_Click1" />
            <br />
            <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="ProductCategory" TypeName="Test.BLL.Financial.ProductCategoryBL">
                <SelectParameters>
                    <asp:ControlParameter ControlID="StartDateforIncomeProdCat" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="EndDateforIncomeProdCat" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="DropDownList3" Name="branchRef" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <br />
            <telerik:RadHtmlChart ID="PieChart1" runat="server" DataSourceID="ObjectDataSource3">
                <PlotArea>
                    <Series>
                        <telerik:PieSeries StartAngle="90" DataFieldY="Income" ExplodeField="IsExploded" NameField="Category_Type" Name="Name">
                            <LabelsAppearance Position="OutsideEnd" DataFormatString="{0} %" />
                            <TooltipsAppearance DataFormatString="{0} %" />
                        </telerik:PieSeries>
                    </Series>
                </PlotArea>
                <ChartTitle Text="Income by Product Category">
                </ChartTitle>
                <Zoom Enabled="False"></Zoom>
            </telerik:RadHtmlChart>
            <%--This section is for Income by Product Category--%>

            <%--This section is for Total Sales Bcomparison presented on colum chart--%>
<%--            <telerik:RadDatePicker ID="TotalSalesBComparison1" runat="server" PopupDirection="BottomLeft"></telerik:RadDatePicker>
            <telerik:RadDatePicker ID="TotalSalesBComparison2" runat="server" PopupDirection="BottomLeft"></telerik:RadDatePicker>
            <asp:DropDownList ID="TotalSalesBComparison3" runat="server" Width="99px">
                <asp:ListItem Value="1"> Monthly </asp:ListItem>
                <asp:ListItem Value="2"> Yearly </asp:ListItem>
            </asp:DropDownList>
            <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" SelectMethod="TotalSalesBComparison" TypeName="Test.BLL.Financial.TotalSalesBComparisonBL">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TotalSalesBComparison1" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="TotalSalesBComparison2" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:Parameter DefaultValue="null" Name="branchRef" Type="Int32" />
                    <asp:ControlParameter ControlID="TotalSalesBComparison3" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Button" />
            <telerik:RadHtmlChart ID="RadHtmlChart1" runat="server" DataSourceID="SqlDataSource1">
            </telerik:RadHtmlChart>--%>

            <!--Commented out the SQL data source trial -->
            <%--            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KPIConnectionString %>" SelectCommand="SELECT Branch_Ref, SUM(Retail_Total + Service_Total) AS [Total Sales]
 FROM Transaction_Summary 
WHERE (Trn_Date BETWEEN @start AND @end ) 
GROUP BY Branch_Ref, dbo.Get_TimeType(@TimeType, Trn_Date) 
ORDER BY Branch_Ref, [Total Sales]">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TotalSalesBComparison1" Name="start" PropertyName="SelectedDate" />
                    <asp:ControlParameter ControlID="TotalSalesBComparison2" Name="end" PropertyName="SelectedDate" />
                    <asp:ControlParameter ControlID="TotalSalesBComparison3" Name="TimeType" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server">
            </asp:EntityDataSource>--%>

            <!-- Trying the column chart-->
            <%--<telerik:RadHtmlChart runat="server" ID="ColumnChart" Width="800px" Height="500px" Skin="Silk" DataSourceID="ObjectDataSource4">
            <PlotArea>
                <Series>
                    <telerik:ColumnSeries Name="Branch_Ref" Stacked="false" Gap="1.5" Spacing="0.4"  DataFieldY="Total Sales">
                        <Appearance>
                            <FillStyle BackgroundColor="#d5a2bb"></FillStyle>
                        </Appearance>
                        <LabelsAppearance DataFormatString="{0} sales" Position="OutsideEnd"></LabelsAppearance>
                        <TooltipsAppearance DataFormatString="{0} sales" Color="White"></TooltipsAppearance>
                        <SeriesItems>
                            <telerik:CategorySeriesItem ></telerik:CategorySeriesItem>
                        </SeriesItems>
                    </telerik:ColumnSeries>
                </Series>
                <Appearance>
                    <FillStyle BackgroundColor="Transparent"></FillStyle>
                </Appearance>
                <XAxis AxisCrossingValue="0" Color="black" MajorTickType="Outside" MinorTickType="Outside"
                    Reversed="false">
                    <Items>
                        <telerik:AxisItem LabelText="1"></telerik:AxisItem>
                        <telerik:AxisItem LabelText="2"></telerik:AxisItem>
                        <telerik:AxisItem LabelText="3"></telerik:AxisItem>
                    </Items>
                    <LabelsAppearance DataFormatString="Q{0}" RotationAngle="0" Skip="0" Step="1"></LabelsAppearance>
                    <TitleAppearance Position="Center" RotationAngle="0" Text="Quarters">
                    </TitleAppearance>
                </XAxis>
                <YAxis AxisCrossingValue="0" Color="black" MajorTickSize="1" MajorTickType="Outside"
                    MinorTickType="None" Reversed="false">
                    <LabelsAppearance DataFormatString="{0} sales" RotationAngle="0" Skip="0" Step="1"></LabelsAppearance>
                    <TitleAppearance Position="Center" RotationAngle="0" Text="Sales">
                    </TitleAppearance>
                </YAxis>
            </PlotArea>
            <Appearance>
                <FillStyle BackgroundColor="Transparent"></FillStyle>
            </Appearance>
            <ChartTitle Text="Product sales for 2011">
                <Appearance Align="Center" BackgroundColor="Transparent" Position="Top">
                </Appearance>
            </ChartTitle>
            <Legend>
                <Appearance BackgroundColor="Transparent" Position="Bottom">
                </Appearance>
            </Legend>

<Zoom Enabled="False"></Zoom>
        </telerik:RadHtmlChart>--%>
            <%--This section is for Total Sales Bcomparison presented on colum chart--%>


            <telerik:RadDatePicker ID="TotalSalesBComparison1" runat="server" PopupDirection="BottomLeft"></telerik:RadDatePicker>
            <telerik:RadDatePicker ID="TotalSalesBComparison2" runat="server" PopupDirection="BottomLeft" ></telerik:RadDatePicker>
            <asp:DropDownList ID="TotalSalesBComparison4" runat="server" Width="58px">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem> 1 </asp:ListItem>
                    <asp:ListItem> 2 </asp:ListItem>
                    <asp:ListItem> 3 </asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="TotalSalesBComparison3" runat="server" Width="99px">
                <asp:ListItem Value="1"> Monthly </asp:ListItem>
                <asp:ListItem Value="2"> Yearly </asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="ViewTotalSalesBComparison" runat="server" Text="View" OnClick="ViewTotalSalesBComparison_Click" />

            <telerik:RadHtmlChart ID="RadHtmlChart2" runat="server" DataSourceID ="ObjectDataSource5">
                 <PlotArea>
                        <Series>
                            <telerik:LineSeries DataFieldY ="Total_Sales">
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
                            <TitleAppearance Text="Total_Sales">
                                <TextStyle Margin="20" />
                            </TitleAppearance>
                            <MinorGridLines Visible="false" />
                        </YAxis>
                    </PlotArea>

                    <ChartTitle Text="Total Sales Between Branches">
                    </ChartTitle>
                    <Zoom Enabled="False"></Zoom>
            </telerik:RadHtmlChart>
            <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" SelectMethod="TotalSalesBComparison" TypeName="Test.BLL.Financial.TotalSalesBComparisonBL">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TotalSalesBComparison1" DefaultValue="2000/01/01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="TotalSalesBComparison2" DefaultValue="2020/01/01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:Parameter DefaultValue="" Name="branchRef" Type="Int32" ConvertEmptyStringToNull="true"/>
                    <asp:ControlParameter ControlID="TotalSalesBComparison3" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>

        </div>

    </form>
</asp:Content>


