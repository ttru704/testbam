<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="employeeKPI.aspx.cs" Inherits="Test.employeekpi" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
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
                <br />
                <br />
            </div>
                
                <%--Here are all the controls at the top of the page--%>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>

                <telerik:RadDatePicker ID="DatePicker1" runat="server" PopupDirection="BottomLeft"></telerik:RadDatePicker>
                <telerik:RadDatePicker ID="DatePicker2" runat="server" PopupDirection="BottomLeft"></telerik:RadDatePicker>
                <asp:DropDownList ID="Company" runat="server">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="Branch" runat="server" AutoPostBack="True" DataTextField="Branch_Ref" DataValueField="Branch_Ref">
                    <asp:ListItem>0</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="TimeType" runat="server">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                <%--Here are all the controls at the top of the page--%>
                
                <p><strong>Number of Customers Seen By Employee</strong></p>
                <telerik:RadHtmlChart ID="CustomersSeenByEmpComRHC1" runat="server">

                </telerik:RadHtmlChart>

            <asp:ObjectDataSource ID="CustomersSeenByEmpComODS1" runat="server" SelectMethod="usp_CustomersSeenByEmpCom" TypeName="Test.BLL.Productivity.CustomersSeenByEmpComBL">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-01-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-12-31" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="Company" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TimeType" DefaultValue="2" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:GridView ID="CustomersSeenByEmpComG1" runat="server" AutoGenerateColumns="False" DataSourceID="CustomersSeenByEmpComODS1">
                <Columns>
                    <asp:BoundField DataField="Employee_Name" HeaderText="Employee_Name" SortExpression="Employee_Name" />
                    <asp:BoundField DataField="YearMonth" HeaderText="YearMonth" SortExpression="YearMonth" />
                    <asp:BoundField DataField="Number_Of_Customers_Seen_By_An_Employee" HeaderText="Number_Of_Customers_Seen_By_An_Employee" SortExpression="Number_Of_Customers_Seen_By_An_Employee" />
                </Columns>
            </asp:GridView>

        </div>
    </form>
</asp:Content>
