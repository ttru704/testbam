<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="employeeKPI.aspx.cs" Inherits="Test.employeekpi" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
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
    </div>
    </form>
</asp:Content>
