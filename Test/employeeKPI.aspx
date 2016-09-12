<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="employeeKPI.aspx.cs" Inherits="Test.employeekpi" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="ContentHeaderTitle" ContentPlaceHolderID="kpiNameHeader" runat="server">
    Employee
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <%--<telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="true" />--%>
<%--        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="Button1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="CustomersSeenByEmployeeCompanyRHC1" UpdatePanelCssClass="" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="AnimalsSeenByEmployeeCompanyRHC1" UpdatePanelCssClass="" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="AnimalsSeenIndustryRHC1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="CustomersSeenByEmployeeCompanyG1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="CustomersSeenByEmployeeCompanyG1" UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="AnimalsSeenByEmployeeCompanyG1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="AnimalsSeenByEmployeeCompanyG1" UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>--%>
        <div class="right_col" role="main">
            <%--KPI menu--%>
            EMPLOYEE
            <br />
            <%--Datepickers and input--%>
            <div class="text-center">
                <telerik:RadSearchBox ID="EmployeeSB1" runat="server" EnableAutoComplete="true" DataSourceID="EmployeeODS1" Filter="StartsWith"
                    DataTextField="Name"  DataValueField="Stf_Number" Width="197px" Height="24px" EmptyMessage="Search for Employee" OnSearch="EmployeeSB_Search" Skin="MetroTouch" HighlightFirstMatch="True">
                </telerik:RadSearchBox>
                <asp:ObjectDataSource ID="EmployeeODS1" runat="server" SelectMethod="usp_EmployeeSearchBox" TypeName="Test.BLL.Controls.EmployeeSearchBoxBL">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="CompanyDDL1" PropertyName="SelectedValue" DefaultValue="1" Name="companyRef" Type="Int32"></asp:ControlParameter>
                    </SelectParameters>
                </asp:ObjectDataSource>     
                <telerik:RadDropDownList ID="TimeDDL1" runat="server" Height="24px" Width="197px">
                    <Items>
                        <telerik:DropDownListItem Text="Weekly" Value="3" />
                        <telerik:DropDownListItem Text="Monthly" Value="1" />
                        <telerik:DropDownListItem Text="Yearly" Value="2" Selected="true" />
                    </Items>
                </telerik:RadDropDownList>

                <telerik:RadDatePicker ID="DatePicker1" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-01-01" SelectedDate="2015-01-01" Height="24px" Width="197px">
                    <DatePopupButton
                        CssClass="rcCalPopup"
                        Width="2em" />
                </telerik:RadDatePicker>
                <telerik:RadDatePicker ID="DatePicker2" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-12-31" SelectedDate="2015-12-31" Height="24px" Width="197px">
                    <DatePopupButton
                        CssClass="rcCalPopup"
                        Width="2em" />
                </telerik:RadDatePicker>
                <asp:DropDownList ID="CompanyDDL1" runat="server" Width="100px" Visible="false">
                    <asp:ListItem Selected="True">1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                </asp:DropDownList>
                <%--<asp:DropDownList ID="Branch" runat="server" AutoPostBack="True" DataTextField="Branch_Ref" DataValueField="Branch_Ref" Width="100px">
                    <asp:ListItem Value="0">All Branches</asp:ListItem>
                </asp:DropDownList>--%>
                
                <%--<asp:DropDownList ID="TimeType" runat="server" Width="100px">
                    <asp:ListItem Value="1"> Monthly </asp:ListItem>
                    <asp:ListItem Value="2" Selected="True"> Yearly </asp:ListItem>
                </asp:DropDownList>--%>
                
                <%--<asp:Button ID="Button1" runat="server" Text="View" OnClick="Button1_Click" />--%>
                <telerik:RadButton ID="Button1" runat="server" Text="View" OnClick="Button1_Click"></telerik:RadButton>
            </div>

            <br />
            <%--KPIs--%>
            <%--KPI Container--%>
            <div class="demo-container no-bg">
                <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel1" Skin="MetroTouch">
                </telerik:RadAjaxLoadingPanel>
                <telerik:RadAjaxManager runat="server" ID="RadAjaxManager1">
                    <AjaxSettings>
                        <telerik:AjaxSetting AjaxControlID="EmployeeSB1">
                            <UpdatedControls>
                                <telerik:AjaxUpdatedControl ControlID="EmployeeSB1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                            </UpdatedControls>
                        </telerik:AjaxSetting>
                        <telerik:AjaxSetting AjaxControlID="RadTabStrip1">
                            <UpdatedControls>
                                <telerik:AjaxUpdatedControl ControlID="RadTabStrip1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                                <telerik:AjaxUpdatedControl ControlID="RadMultiPage1" LoadingPanelID="LoadingPanel1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                            </UpdatedControls>
                        </telerik:AjaxSetting>
                        <telerik:AjaxSetting AjaxControlID="RadMultiPage1">
                            <UpdatedControls>
                                <telerik:AjaxUpdatedControl ControlID="RadMultiPage1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                            </UpdatedControls>
                        </telerik:AjaxSetting>
                    </AjaxSettings>
                    <ajaxsettings>
                        <telerik:AjaxSetting AjaxControlID="RadTabStrip1">
                            <UpdatedControls>
                                <telerik:AjaxUpdatedControl ControlID="RadTabStrip1"></telerik:AjaxUpdatedControl>
                                <telerik:AjaxUpdatedControl ControlID="RadMultiPage1" LoadingPanelID="LoadingPanel1"></telerik:AjaxUpdatedControl>
                            </UpdatedControls>
                        </telerik:AjaxSetting>
                        <telerik:AjaxSetting AjaxControlID="RadMultiPage1">
                            <UpdatedControls>
                                <telerik:AjaxUpdatedControl ControlID="RadMultiPage1"></telerik:AjaxUpdatedControl>
                            </UpdatedControls>
                        </telerik:AjaxSetting>
                    </ajaxsettings>
                </telerik:RadAjaxManager>
                <script type="text/javascript">
                    /* <![CDATA[ */
                    function onTabSelecting(sender, args) {

                        if (args.get_tab().get_pageViewID()) {
                            args.get_tab().set_postBack(false);
                        }
                    }
                    /* ]]> */
                </script>
                <telerik:RadTabStrip RenderMode="Lightweight" OnClientTabSelecting="onTabSelecting" ID="RadTabStrip1" SelectedIndex="0"
                    runat="server" MultiPageID="RadMultiPage1" Skin="MetroTouch" Width="100%" Align="Justify"
                    OnTabClick="RadTabStrip1_TabClick">
                </telerik:RadTabStrip>
                <telerik:RadMultiPage ID="RadMultiPage1" CssClass="RadMultiPage" runat="server" SelectedIndex="0" OnPageViewCreated="RadMultiPage1_PageViewCreated">
                </telerik:RadMultiPage>
            </div>



            

        </div>
</asp:Content>
