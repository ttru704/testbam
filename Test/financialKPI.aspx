<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="financialKPI.aspx.cs" Inherits="Test.financialkpi" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<%--Header For the top of the Page--%>
<asp:Content ID="ContentTitle" ContentPlaceHolderID="pageHeader" runat="Server">
    <header style="padding: inherit; margin-top: 15px">
        <h3>Financial</h3>
    </header>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadStyleSheetManager runat="server"></telerik:RadStyleSheetManager>
    <telerik:RadScriptManager ID="ScriptManager1" runat="server">
    </telerik:RadScriptManager>
    <div class="right_col" role="main">
      <%--Spaces to push the datepickers down--%>
        <br />
        <br />
        <br />
        <%--Div for the User inputs aka datepickers and user controls accessible to all levels--%>
        <div class="userInputs">
            <%--Dropdown for the type of time perspective--%>
            <telerik:RadDropDownList ID="TimeDDL1" runat="server" height="24px" Width="120px" Skin="Metro">
                <Items>
                    <telerik:DropDownListItem Text="Weekly" Value="3" />
                    <telerik:DropDownListItem Text="Monthly" Value="1" Selected="true" />
                    <telerik:DropDownListItem Text="Yearly" Value="2" />
                </Items>
            </telerik:RadDropDownList>
            <%--Date Picker for the Start date--%>
            <telerik:RadDatePicker ID="DatePicker1" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-04-01" SelectedDate="2015-04-01" Height="29px" Width="120px" Skin="Metro">
                <DatePopupButton
                    CssClass="rcCalPopup"
                    Width="2em" />
            </telerik:RadDatePicker>
            <%--Date Picker for the end Date--%>
            <telerik:RadDatePicker ID="DatePicker2" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-09-01" SelectedDate="2015-09-01" Height="29px" Width="120px" Skin="Metro">
                <DatePopupButton
                    CssClass="rcCalPopup"
                    Width="2em" />
            </telerik:RadDatePicker>
            <%--Button to trigger a refresh for the sessions to be stored--%>
            <telerik:RadButton ID="Button1" runat="server" Text="View" Skin="Metro"></telerik:RadButton>
        </div>
        <br />

        <%--Container The RadTabStrips/RadMultipage - which will contain all KPIs--%>
        <div class="demo-container no-bg">
            <%--Loading Panel--%>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Metro"></telerik:RadAjaxLoadingPanel>
            <%--AjaxManager based on controls with link to loading panel--%>
            <telerik:RadAjaxManager runat="server" ID="RadAjaxManager1">
                <AjaxSettings>
                    <%--Go button trigger callback for multipage with loading animation--%>
                    <telerik:AjaxSetting AjaxControlID="Button1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadMultiPage1" UpdatePanelCssClass="" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <%--RadTabStrip buttons will trigger callback for multipage and tabstrip with loading animation--%>
                    <telerik:AjaxSetting AjaxControlID="RadTabStrip1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadTabStrip1"></telerik:AjaxUpdatedControl>
                            <telerik:AjaxUpdatedControl ControlID="RadMultiPage1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <%--RadMultipage change will trigger callback for multipage--%>
                    <telerik:AjaxSetting AjaxControlID="RadMultiPage1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadMultiPage1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>

                <%--Tabstrip for Company,Branch...etc perspectives--%>
                <telerik:RadTabStrip RenderMode="Lightweight" OnClientTabSelecting="onTabSelecting" ID="RadTabStrip1" SelectedIndex="0"
                    runat="server" MultiPageID="RadMultiPage1" Skin="Metro" Width="100%" Align="Justify" Orientation="HorizontalTop"
                    OnTabClick="RadTabStrip1_TabClick" ClickSelectedTab="true" OnClientLoad="OnClientLoad">
                </telerik:RadTabStrip>
                <%--The resepective content for the Tabstrip--%>
                <telerik:RadMultiPage ID="RadMultiPage1" CssClass="RadMultiPage" runat="server" SelectedIndex="0" OnPageViewCreated="RadMultiPage1_PageViewCreated">
                </telerik:RadMultiPage>
        </div>

    </div>

    <%--Radscriptblock for the tab fuctions--%>
    <telerik:RadScriptBlock ID="radScript1" runat="server">
        <script type="text/javascript">
            /* <![CDATA[ */
            function onTabSelecting(sender, args) {

                if (args.get_tab().get_pageViewID()) {
                    args.get_tab().set_postBack(false);
                }
            }
            /* ]]> */

            function OnClientLoad(tabstrip) {
                setTimeout(function () {
                    tabstrip.repaint();
                }, 0);
            };

        </script>
    </telerik:RadScriptBlock>
</asp:Content>


