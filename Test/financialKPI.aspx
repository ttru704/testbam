<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="financialKPI.aspx.cs" Inherits="Test.financialkpi" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ContentTitle" ContentPlaceHolderID="kpiNameHeader" runat="Server">
    <header style="padding: inherit; margin-top: 15px">
        <h3>Financial</h3>
    </header>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadStyleSheetManager runat="server"></telerik:RadStyleSheetManager>
    <telerik:RadScriptManager ID="ScriptManager1" runat="server">
    </telerik:RadScriptManager>
    <div class="right_col" role="main">
        <br />
        <%--Datepickers and input--%>

        <div class="userInputs">
            <br />
            <telerik:RadDropDownList ID="BranchDDL1" OnSelectedIndexChanged="BranchDDL1_SelectedIndexChanged" runat="server" AppendDataBoundItems="True" DataSourceID="BranchDropDownODS1" DataTextField="Branch_Name" DataValueField="Ref_Number" height="24px" Width="120px">
                <Items>
                    <telerik:DropDownListItem Text="All Branches" Value="0" />
                </Items>
            </telerik:RadDropDownList>
            <telerik:RadWindow RenderMode="Lightweight" runat="server" ID="RadWindow_ContentTemplate" RestrictionZoneID="ContentTemplateZone"
                Modal="true" Width="340px" Height="340px">
                <ContentTemplate>
                    <div class="contButton">
                        <%--Combobox for Branch Type--%>
                        <telerik:RadComboBox RenderMode="Lightweight" ID="BranchTypeDDL1" DataTextField="Name" DataValueField="Ref_Number" runat="server" Width="186px"
                            AutoPostBack="false" EmptyMessage="- Select a Branch Type -" DataSourceID="BranchTypeODS1"
                            Skin="Metro">
                        </telerik:RadComboBox>

                        <%--Object data source for branch type combobox--%>
                        <asp:ObjectDataSource ID="BranchTypeODS1" runat="server" SelectMethod="usp_BranchTypeDropDownList" TypeName="Test.BLL.Controls.BranchTypeDropDownListBL">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="businessType" Type="Int32"></asp:Parameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>

                        <%--Combobox for Country--%>
                        <telerik:RadComboBox RenderMode="Lightweight" ID="CountryCB" DataTextField="Country_Name" DataValueField="Country_Ref" runat="server" Width="186px"
                            AutoPostBack="true" EmptyMessage="- Select a Country -"
                            OnSelectedIndexChanged="CountryCB_SelectedIndexChanged"
                            Skin="Metro" DataSourceID="CountryODS" AppendDataBoundItems="true"
                            >
                        </telerik:RadComboBox>

                        <%--Objectdatsource for country combobox--%>
                        <asp:ObjectDataSource ID="CountryODS" runat="server" SelectMethod="usp_CountryDropDownList" TypeName="Test.BLL.Controls.CountryDropDownListBL">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="BranchDDL1" PropertyName="SelectedValue" Name="branchRef" Type="Int64"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>

                        <%--Combobox for state--%>
                        <telerik:RadComboBox RenderMode="Lightweight" ID="StateCB" DataValueField="State_Ref" DataTextField="State_Name" runat="server" Width="186px"
                            AutoPostBack="true" EmptyMessage="- Select a State -"
                            OnSelectedIndexChanged="StateCB_SelectedIndexChanged"
                            Skin="Metro" DataSourceID="StateODS">
                        </telerik:RadComboBox>

                        <%--Objectdatasource for state combobox--%>
                        <asp:ObjectDataSource ID="StateODS" runat="server" SelectMethod="usp_StateDropDownList" TypeName="Test.BLL.Controls.StateDropDownListBL">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="CountryCB" PropertyName="SelectedValue" Name="countryRef" Type="Int64"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>

                        <%--Combobox for region--%>
                        <telerik:RadComboBox RenderMode="Lightweight" ID="RegionCB" Visible="true"  runat="server" DataTextField="Region_Name" DataValueField="Region_Ref" Skin="Metro"
                            EmptyMessage="- Select a City -" DataSourceID="RegionODS"  >
                        </telerik:RadComboBox>

                        <%--Objectdatasource for region--%>
                        <asp:ObjectDataSource ID="RegionODS" runat="server" SelectMethod="usp_RegionDropDownList" TypeName="Test.BLL.Controls.RegionDropDownListBL">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="StateCB" PropertyName="SelectedValue" Name="stateRef" Type="Int64"></asp:ControlParameter>


                            </SelectParameters>
                        </asp:ObjectDataSource>

                    </div>
                    <div class="contButton">
                        <asp:Button ID="Button2" Text="Done" runat="server" OnClick="Button2_Click"></asp:Button>
                    </div>
                </ContentTemplate>
            </telerik:RadWindow>
            <asp:Button ID="Button3" Text="Peer Comparison" Height="28px" runat="server" OnClientClick="openWinContentTemplate(); return false;" />

            <telerik:RadDropDownList ID="TimeDDL1" runat="server" height="24px" Width="120px">
                <Items>
                    <telerik:DropDownListItem Text="Weekly" Value="3" />
                    <telerik:DropDownListItem Text="Monthly" Value="1" Selected="true" />
                    <telerik:DropDownListItem Text="Yearly" Value="2" />
                </Items>
            </telerik:RadDropDownList>
            <telerik:RadDatePicker ID="DatePicker1" runat="server" Class="Random" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-04-01" SelectedDate="2015-04-01" Height="29px" Width="120px">
                <DatePopupButton
                    CssClass="rcCalPopup"
                    Width="2em" />
            </telerik:RadDatePicker>
            <telerik:RadDatePicker ID="DatePicker2" runat="server" Class="Random" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-09-01" SelectedDate="2015-09-01" Height="29px" Width="120px">
                <DatePopupButton
                    CssClass="rcCalPopup"
                    Width="2em" />
            </telerik:RadDatePicker>


            <asp:DropDownList ID="CompanyDDL1" runat="server" Width="100px" Visible="false">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
            </asp:DropDownList>

            <asp:ObjectDataSource ID="BranchDropDownODS1" runat="server" SelectMethod="usp_BranchDropDownList" TypeName="Test.BLL.Controls.BranchDropDownListBL">
                <SelectParameters>
                    <asp:SessionParameter SessionField="CompanyRef" DefaultValue="" Name="companyRef" Type="Int32"></asp:SessionParameter>

                </SelectParameters>
            </asp:ObjectDataSource>

            <telerik:RadButton ID="Button1" runat="server" Text="View" OnClick="Button1_Click"></telerik:RadButton>
        </div>

        <br />

        <%--KPIs--%>
        <%--KPI Container--%>
        <div class="demo-container no-bg">
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="MetroTouch"></telerik:RadAjaxLoadingPanel>
            <telerik:RadAjaxManager runat="server" ID="RadAjaxManager1">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="BranchDDL1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="CountryCB"></telerik:AjaxUpdatedControl>
                            <telerik:AjaxUpdatedControl ControlID="StateCB" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                            <telerik:AjaxUpdatedControl ControlID="RegionCB" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="CountryCB">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="StateCB" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                            <telerik:AjaxUpdatedControl ControlID="RegionCB"></telerik:AjaxUpdatedControl>
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="StateCB">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RegionCB" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
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
                    runat="server" MultiPageID="RadMultiPage1" Skin="MetroTouch" Width="100%" Align="Justify" Orientation="HorizontalTop"
                    OnTabClick="RadTabStrip1_TabClick" ClickSelectedTab="true" OnClientLoad="OnClientLoad">
                </telerik:RadTabStrip>
                <telerik:RadMultiPage ID="RadMultiPage1" CssClass="RadMultiPage" runat="server" SelectedIndex="0" OnPageViewCreated="RadMultiPage1_PageViewCreated">
                </telerik:RadMultiPage>
            </div>
        </div>



    </div>
    <telerik:RadScriptBlock ID="radScript1" runat="server">
        <script type="text/javascript">
            //<![CDATA[
            Sys.Application.add_load(function () {
                $windowContentDemo.contentTemplateID = "<%=RadWindow_ContentTemplate.ClientID%>";
                $windowContentDemo.templateWindowID = "<%=RadWindow_ContentTemplate.ClientID %>";
            });
            //]]>
            <%--For panning and zooming--%>
            (function (global) {
                var chart;
                function ChartLoad(sender, args) {
                    chart = sender.get_kendoWidget(); //store a reference to the Kendo Chart widget, we will use its methods
                }
                global.chartLoad = ChartLoad;
                function resizeChart() {
                    if (chart)
                        chart.resize(); //redraw the chart so it takes the new size of its container when it changes (e.g., browser window size change, parent container size change)
                }
                //this logic ensures that the chart resizing will happen only once, at most - every 200ms
                //to prevent calling the handler too often if old browsers fire the window.onresize event multiple times
                var TO = false;
                window.onresize = function () {
                    if (TO !== false)
                        clearTimeout(TO);
                    TO = setTimeout(resizeChart, 200);
                }
            })(window);

            <%--For responsive chart--%>
            (function (global) {
                var chart;
                function ChartLoad(sender, args) {
                    chart = sender.get_kendoWidget(); //store a reference to the Kendo Chart widget, we will use its methods
                }
                global.chartLoad = ChartLoad;
                function resizeChart() {
                    if (chart)
                        chart.resize(); //redraw the chart so it takes the new size of its container when it changes (e.g., browser window size change, parent container size change)
                }
                //this logic ensures that the chart resizing will happen only once, at most - every 200ms
                //to prevent calling the handler too often if old browsers fire the window.onresize event multiple times
                var TO = false;
                window.onresize = function () {
                    if (TO !== false)
                        clearTimeout(TO);
                    TO = setTimeout(resizeChart, 200);
                }
            })(window);
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
            };



        </script>
    </telerik:RadScriptBlock>
</asp:Content>


