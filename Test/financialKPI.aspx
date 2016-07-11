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
            <asp:MultiView ID="MultiView1" runat="server">
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
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="RetailTotal" TypeName="Test.BLL.RetailTotalBL">
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
            <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="ProductCategory" TypeName="Test.BLL.ProductCategoryBL">
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
        </div>

    </form>





</asp:Content>


