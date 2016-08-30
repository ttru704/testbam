<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="missedcharge.aspx.cs" Inherits="Test.missedcharge" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server"></telerik:RadStyleSheetManager>
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="BranchDDL1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="CountryDDL1" />
                        <telerik:AjaxUpdatedControl ControlID="StateDLL1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="CountryDDL1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="StateDLL1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="BranchDDL1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="CountryDDL1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="CountryDDL1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="StateDLL1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
        <div class="right_col" role="main">
            <div class="col-12">
                <telerik:RadSearchBox ID="RadSearchBox1" Width="200px" runat="server"
                    DataSourceID="SqlDataSource1" DataTextField="Prd_Name" DataValueField="Prd_Number" DataContextKeyField="Prd_Class"
                    EmptyMessage="First Item" Filter="StartsWith" Skin="MetroTouch">
                    <SearchContext DataSourceID="SqlDataSource2" DataTextField="Name" DataKeyField="Prd_Class">
                    </SearchContext>
                </telerik:RadSearchBox>
                <telerik:RadSearchBox ID="RadSearchBox2" runat="server" Width="200px" EmptyMessage="Second Item"
                    DataSourceID="SqlDataSource1" DataTextField="Prd_Name" DataValueField="Prd_Number"
                    DataContextKeyField="Prd_Class" Filter="StartsWith" Skin="MetroTouch">
                    <SearchContext DataSourceID="SqlDataSource2" DataTextField="Name" DataKeyField="Prd_Class">
                    </SearchContext>
                </telerik:RadSearchBox>
                <telerik:RadButton ID="RadButton1" runat="server" Text="Search"></telerik:RadButton>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KPIConnectionString %>" SelectCommand="usp_SearchBoxforProductandServiceName" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:KPIConnectionString %>" SelectCommand="usp_SearchBox1SearchContext" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <br />
            </div>
        </div>
    </form>
</asp:Content>
