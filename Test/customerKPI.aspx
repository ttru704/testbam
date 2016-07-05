<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="customerKPI.aspx.cs" Inherits="Test.customerkpi" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #form1 {
            height: 259px;
        }

        #KPIMenu {
            height: 246px;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="right_col" role="main">
            <div id="KPIMenu"  style="text-align: center">
                <a href="/financialKPI.aspx" style="font-size: 20px"><strong>Financial</strong></a>
                <strong>|</strong>
                <a href="/employeekpi.aspx" style="font-size: 20px"><strong>Employee</strong></a>
                <strong>|</strong>
                <a href="/customerkpi.aspx" style="font-size: 20px"><strong>Customer</strong></a>
                <br />
                <br />
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            </div>

            <br />

            <div id="KPIs">

                <%--Number of New Clients KPI--%>

                <telerik:RadDatePicker ID="RDPStartNumberOfNewClients" runat="server" Style="text-align: left"  PopupDirection="BottomLeft"></telerik:RadDatePicker>
                <telerik:RadDatePicker ID="RDPEndNumberOfNewClients" runat="server"  PopupDirection="BottomLeft"></telerik:RadDatePicker>
                <asp:DropDownList ID="DropDownList1" runat="server" Width="58px">
                    <asp:ListItem> 1 </asp:ListItem>
                    <asp:ListItem> 2 </asp:ListItem>
                    <asp:ListItem> 3 </asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownList2" runat="server" Width="99px">
                    <asp:ListItem Value="1"> Monthly </asp:ListItem>
                    <asp:ListItem Value="2"> Yearly </asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="Button1" runat="server" Text="View" OnClick="Button1_Click" />
                <asp:GridView ID="GridViewNumberOfNewClients" runat="server">
                    <Columns>
                        <asp:BoundField DataField="YearMonth" HeaderText="YearMonth" SortExpression="YearMonth" />
                        <asp:BoundField DataField="Retail_Total" HeaderText="Retail_Total" SortExpression="Retail_Total" />
                    </Columns>
                </asp:GridView>
                <telerik:RadHtmlChart ID="RadHtmlNumberOfNewClients" runat="server">
                </telerik:RadHtmlChart>
                <asp:ObjectDataSource ID="ObjectDataSourceNumberOfNewClients" runat="server" SelectMethod="GetNumberOfNewClients" TypeName="Test.BLL.NumberOfNewClientsBL">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RDPStartNumberOfNewClients" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                        <asp:ControlParameter ControlID="RDPEndNumberOfNewClients" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                        <asp:ControlParameter ControlID="DropDownList1" Name="branchRef" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="DropDownList2" Name="TimeType" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>



            </div>
        </div>
    </form>
</asp:Content>
