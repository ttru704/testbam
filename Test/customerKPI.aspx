<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="customerKPI.aspx.cs" Inherits="Test.customerkpi" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="kpiNameHeader" runat="Server">
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
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="MetroTouch"></telerik:RadAjaxLoadingPanel>
            <telerik:RadDropDownList ID="BranchDDL1" runat="server" AppendDataBoundItems="True" DataSourceID="BranchDropDownODS1" DataTextField="Branch_Name" DataValueField="Ref_Number" Height="24px" Width="120px" Skin="Metro">
                <Items>
                    <telerik:DropDownListItem Text="All Branches" Value="0" />
                </Items>
            </telerik:RadDropDownList>
            <telerik:RadWindow RenderMode="Lightweight" Title="Peer Comparison" runat="server" ID="RadWindow_ContentTemplate" RestrictionZoneID="ContentTemplateZone"
                Modal="true" Width="340px" Height="340px" Skin="Metro">
                <ContentTemplate>
                    <div class="contButton">

                        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" >
                            <%--Combobox for branch--%>
                            <telerik:RadLabel runat="server">Your Branch</telerik:RadLabel>
                            <br />
                            <telerik:RadComboBox RenderMode="Lightweight" ID="BranchCB1" DataTextField="Branch_Name" DataValueField="Ref_Number" runat="server" Width="186px"
                                AutoPostBack="true" EmptyMessage="- Select a Branch -" DataSourceID="BranchDropDownODS1"
                                Skin="Metro">
                            </telerik:RadComboBox>
                            <br />
                            <%--Combobox for branch type--%>
                            <telerik:RadLabel runat="server">Clinic Type:</telerik:RadLabel>
                            <br />
                            <telerik:RadComboBox RenderMode="Lightweight" ID="BranchTypeDDL1" DataTextField="Name" DataValueField="Ref_Number" runat="server" Width="186px"
                                AutoPostBack="true" EmptyMessage="- Select a Clinic Type -" DataSourceID="BranchTypeODS1"
                                Skin="Metro">
                            </telerik:RadComboBox>

                            <%--Objectdatasource for branch type--%>
                            
                            <asp:ObjectDataSource ID="BranchTypeODS1" runat="server" SelectMethod="usp_BranchTypeDropDownList" TypeName="Test.BLL.Controls.BranchTypeDropDownListBL">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="1" Name="businessType" Type="Int32"></asp:Parameter>
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <br />
                            <%--Combobox for country--%>
                            <telerik:RadLabel runat="server">Country</telerik:RadLabel>
                            <br />

                            <telerik:RadComboBox RenderMode="Lightweight" ID="CountryDDL1" DataTextField="Country_Name" DataValueField="Country_Ref" runat="server" Width="186px"
                                AutoPostBack="true" EmptyMessage="- Select a Country -" DataSourceID="CountryODS1"
                                Skin="Metro">
                            </telerik:RadComboBox>
                            
                            <%--Objectdatasource for country--%>
                            <asp:ObjectDataSource ID="CountryODS1" runat="server" SelectMethod="usp_CountryDropDownList" TypeName="Test.BLL.Controls.CountryDropDownListBL">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="BranchCB1" PropertyName="SelectedValue" Name="branchRef" Type="Int64"></asp:ControlParameter>


                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <br />
                            <%--COmbobox for state--%>
                            <telerik:RadLabel runat="server">State</telerik:RadLabel>
                            <br />

                            <telerik:RadComboBox RenderMode="Lightweight" ID="StateDDL1" DataTextField="State_Name" DataValueField="State_Ref" runat="server" Width="186px"
                                AutoPostBack="true" EmptyMessage="- Select a State -" DataSourceID="StateODS1"
                                Skin="Metro">
                            </telerik:RadComboBox>
                            <%--Objectdatasource for state--%>
                            <asp:ObjectDataSource ID="StateODS1" runat="server" SelectMethod="usp_StateDropDownList" TypeName="Test.BLL.Controls.StateDropDownListBL">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="CountryDDL1" PropertyName="SelectedValue" Name="countryRef" Type="Int64"></asp:ControlParameter>

                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <br />

                            <%--Combobox for region--%>
                            <telerik:RadLabel  runat="server">Region</telerik:RadLabel>
                            <br />

                            <telerik:RadComboBox RenderMode="Lightweight" ID="RegionDDL1" DataTextField="Region_Name" DataValueField="Region_Ref" runat="server" Width="186px"
                                AutoPostBack="true" EmptyMessage="- Select a Region -" DataSourceID="RegionODS1"
                                Skin="Metro">
                            </telerik:RadComboBox>
                            <%--Objectdatasource for region--%>
                            <asp:ObjectDataSource ID="RegionODS1" runat="server" SelectMethod="usp_RegionDropDownList" TypeName="Test.BLL.Controls.RegionDropDownListBL">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="StateDDL1" PropertyName="SelectedValue" Name="stateRef" Type="Int64"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <br />
                            <br />
                            <telerik:RadButton ID="PopUpButton" runat="server" Text="Done" AutoPostBack="true" OnClick="PopupButton_Click" Skin="Metro"></telerik:RadButton>
                        </telerik:RadAjaxPanel>
                    </div>
                </ContentTemplate>
            </telerik:RadWindow>
            <telerik:RadButton ID="PeerButton" Text="Peer Comparison" Height="28px" runat="server" OnClientClicked="openWinContentTemplate" AutoPostBack="false" Skin="Metro"></telerik:RadButton>
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
                <telerik:RadTabStrip RenderMode="Lightweight" OnClientTabSelecting="onTabSelecting" OnClientTabSelected="OnClientTabSelected" ID="RadTabStrip1" SelectedIndex="0"
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
        //This is for the pop up

            //<![CDATA[
            Sys.Application.add_load(function () {
                $windowContentDemo.contentTemplateID = "<%=RadWindow_ContentTemplate.ClientID%>";
                $windowContentDemo.templateWindowID = "<%=RadWindow_ContentTemplate.ClientID %>";
            });
        //]]>

        (function (global, undefined) {
            var demo = {};
            function populateValue() {
                $get(demo.label).innerHTML = $get(demo.textBox).value;
                //the RadWindow's content template is an INaming container and the server code block is needed
                $find(demo.contentTemplateID).close();
            }
            function openWinContentTemplate() {
                $find(demo.templateWindowID).show();
            }
            function openWinNavigateUrl() {
                $find(demo.urlWindowID).show();
            }
            global.$windowContentDemo = demo;
            global.populateValue = populateValue;
            global.openWinContentTemplate = openWinContentTemplate;
            global.openWinNavigateUrl = openWinNavigateUrl;
        })(window);

        function OnClientLoad(tabstrip) {
            setTimeout(function () {
                tabstrip.repaint();
            }, 0);
        }

        (function () {
            var demo = window.demo = {};

            demo.onRequestStart = function (sender, args) {
                if (args.get_eventTarget().indexOf("Button") >= 0) {
                    args.set_enableAjax(false);
                }
            }
        })();
        //Hides peer comparison and branch dropdownlist
            $(document).ready(function () {
                document.getElementById('<%=PeerButton.ClientID%>').style.display = 'none';
                document.getElementById('<%=BranchDDL1.ClientID%>').style.display = 'none';
            });

        //This code configures the visibility of the set of controls at the top based on which tab has been clicked
            function OnClientTabSelected(sender, eventArgs) {
                var tab = eventArgs.get_tab();
                var tabName = tab.get_text();
                if (tabName == 'Branch') {
                    document.getElementById('<%=PeerButton.ClientID%>').style.display = 'none';
                    document.getElementById('<%=BranchDDL1.ClientID%>').style.display = 'inline-block';
                    document.getElementById('<%=TimeDDL1.ClientID%>').style.display = 'inline-block';
                }
                else if (tabName == 'Company') {
                    document.getElementById('<%=PeerButton.ClientID%>').style.display = 'none';
                    document.getElementById('<%=BranchDDL1.ClientID%>').style.display = 'none';
                    document.getElementById('<%=TimeDDL1.ClientID%>').style.display = 'inline-block';
                }
                else if (tabName == 'Peer') {
                    document.getElementById('<%=BranchDDL1.ClientID%>').style.display = 'none';
                    document.getElementById('<%=PeerButton.ClientID%>').style.display = 'inline-block';
                    document.getElementById('<%=TimeDDL1.ClientID%>').style.display = 'inline-block';
                }
};

    </script>
        </telerik:RadScriptBlock>
</asp:Content>
