<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="customerKPI.aspx.cs" Inherits="Test.customerkpi" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="pageHeader" runat="Server">
    <header style="padding: inherit; margin-top: 15px">
        <h3>Customer</h3>
    </header>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="right_col" role="main">
        <br />
        <br />
        <br />
        <%--Datepickers and input--%>
        <div class="userInputs">
            <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server"></telerik:RadStyleSheetManager>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Metro"></telerik:RadAjaxLoadingPanel>
            <telerik:RadDropDownList ID="TimeDDL1" runat="server" Height="24px" Width="120px" Skin="Metro">
                <Items>
                    <telerik:DropDownListItem Text="Weekly" Value="3" />
                    <telerik:DropDownListItem Text="Monthly" Value="1" Selected="true" />
                    <telerik:DropDownListItem Text="Yearly" Value="2" />
                </Items>
            </telerik:RadDropDownList>
            <telerik:RadDatePicker ID="DatePicker1" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-08-01" SelectedDate="2015-08-01" Height="24px" Width="120px" Skin="Metro">
                <DatePopupButton
                    CssClass="rcCalPopup"
                    Width="2em" />
            </telerik:RadDatePicker>
            <telerik:RadDatePicker ID="DatePicker2" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-12-31" SelectedDate="2015-12-31" Height="24px" Width="120px" Skin="Metro">
                <DatePopupButton
                    CssClass="rcCalPopup"
                    Width="2em" />
            </telerik:RadDatePicker>



            <telerik:RadButton ID="Button1" runat="server" Text="View" OnClick="Button1_Click" Skin="Metro"></telerik:RadButton>
            <asp:ObjectDataSource ID="BranchDropDownODS1" runat="server" SelectMethod="usp_BranchDropDownList" TypeName="Test.BLL.Controls.BranchDropDownListBL">
                <SelectParameters>
                    <asp:SessionParameter SessionField="CompanyRef" DefaultValue="" Name="companyRef" Type="Int32"></asp:SessionParameter>

                </SelectParameters>
            </asp:ObjectDataSource>
        </div>

        <br />


        <%--KPIs--%>
        <%--KPI Container--%>
        <div class="demo-container no-bg">
            <telerik:RadAjaxManager runat="server" ID="RadAjaxManager1">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="Button1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadMultiPage1" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadTabStrip1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadTabStrip1"></telerik:AjaxUpdatedControl>
                            <telerik:AjaxUpdatedControl ControlID="RadMultiPage1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadMultiPage1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadMultiPage1" UpdatePanelCssClass="" ></telerik:AjaxUpdatedControl>
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
                <telerik:RadTabStrip RenderMode="Lightweight" OnClientTabSelecting="onTabSelecting"  ID="RadTabStrip1" SelectedIndex="0"
                    runat="server" MultiPageID="RadMultiPage1" Skin="MetroTouch" Width="100%" Align="Justify"
                    OnTabClick="RadTabStrip1_TabClick" OnClientLoad="OnClientLoad">
                </telerik:RadTabStrip>
                <telerik:RadMultiPage ID="RadMultiPage1" CssClass="RadMultiPage" Width="100%" runat="server" SelectedIndex="0" OnPageViewCreated="RadMultiPage1_PageViewCreated">
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
        }



    </script>
        </telerik:RadScriptBlock>
</asp:Content>
