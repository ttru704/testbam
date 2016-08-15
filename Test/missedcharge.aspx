<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="missedcharge.aspx.cs" Inherits="Test.missedcharge" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server"></telerik:RadStyleSheetManager>
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
        <div class="right_col" role="main">
            <div class="col-12">
                <telerik:RadSearchBox ID="RadSearchBox1" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="Prd_Name" DataValueField="Prd_Number" DataContextKeyField="Prd_Class"
                    EmptyMessage="Seach for First Item" Filter="StartsWith" Skin="MetroTouch">
                    <SearchContext DataSourceID="SqlDataSource2" DataTextField="Prd_Class" DataKeyField="Prd_Class">

                    </SearchContext>
                </telerik:RadSearchBox>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KPIConnectionString %>" SelectCommand="usp_SearchBoxforProductandServiceName" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:KPIConnectionString %>" SelectCommand="usp_SearchBox1SearchContext" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </div>
        </div>
    </form>
</asp:Content>
