<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="employeeKPI.aspx.cs" Inherits="Test.employeekpi" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>


<asp:Content ID="ContentTitle" ContentPlaceHolderID="pageHeader" runat="Server">
    <header style="padding: inherit; margin-top: 15px">
        <h3>Employee</h3>
    </header>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadStyleSheetManager runat="server"></telerik:RadStyleSheetManager>
    <telerik:RadScriptManager runat="server"></telerik:RadScriptManager>

    <div class="right_col" role="main">
        <%--KPI menu--%>
        <br />
        <br />
        <br />
        <%--Datepickers and input--%>
        <div class="userInputs">
            <telerik:RadDropDownList ID="TimeDDL1" runat="server" Height="29px" Width="120px" Skin="Metro">
                <Items>
                    <telerik:DropDownListItem Text="Weekly" Value="3" Selected="true" />
                    <telerik:DropDownListItem Text="Monthly" Value="1" />
                    <telerik:DropDownListItem Text="Yearly" Value="2" />
                </Items>
            </telerik:RadDropDownList>

            <telerik:RadDatePicker ID="DatePicker1" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="2016-06-06" SelectedDate="2016-06-06" Height="29px" Width="120px" Skin="Metro">
                <DatePopupButton
                    CssClass="rcCalPopup"
                    Width="2em" />
            </telerik:RadDatePicker>
            <telerik:RadDatePicker ID="DatePicker2" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="2016-06-26" SelectedDate="2016-06-26" Height="29px" Width="120px" Skin="Metro">
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

            <telerik:RadButton ID="Button1" runat="server" Text="View" OnClick="Button1_Click" Skin="Metro"></telerik:RadButton>
        </div>

        <br />
        <%--KPIs--%>
        <%--KPI Container--%>
        <div class="demo-container no-bg">
            <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel1" Skin="MetroTouch">
            </telerik:RadAjaxLoadingPanel>
            <telerik:RadAjaxManager runat="server" ID="RadAjaxManager1">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="EmployeeCB1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="EmployeeCB1" LoadingPanelID="LoadingPanel1"></telerik:AjaxUpdatedControl>
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="Button1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadMultiPage1" UpdatePanelCssClass="" LoadingPanelID="LoadingPanel1"></telerik:AjaxUpdatedControl>
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadTabStrip1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadTabStrip1"></telerik:AjaxUpdatedControl>
                            <telerik:AjaxUpdatedControl ControlID="RadMultiPage1" LoadingPanelID="LoadingPanel1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadMultiPage1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadMultiPage1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
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
            <div style="height: 100%">
                <telerik:RadTabStrip RenderMode="Lightweight" OnClientTabSelecting="onTabSelecting" ID="RadTabStrip1" SelectedIndex="0"
                    runat="server" MultiPageID="RadMultiPage1" Skin="MetroTouch" Width="100%" Align="Justify"
                    OnTabClick="RadTabStrip1_TabClick" OnClientLoad="OnClientLoad">
                </telerik:RadTabStrip>
                <telerik:RadMultiPage ID="RadMultiPage1" CssClass="RadMultiPage" runat="server" SelectedIndex="0" OnPageViewCreated="RadMultiPage1_PageViewCreated">
                </telerik:RadMultiPage>

            </div>

        </div>





    </div>
    <telerik:RadScriptBlock runat="server">
        <script>
            function OnClientLoad(tabstrip) {
                setTimeout(function () {
                    tabstrip.repaint();
                }, 0);
            };
        </script>
    </telerik:RadScriptBlock>
</asp:Content>
