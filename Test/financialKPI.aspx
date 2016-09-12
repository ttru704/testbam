<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="financialKPI.aspx.cs" Inherits="Test.financialkpi" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadScriptManager ID="ScriptManager1" runat="server">
    </telerik:RadScriptManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
    <div class="right_col" role="main">
        FINANCIAL
            <br />
        <%--Datepickers and input--%>
        <div class="text-center">
            <telerik:RadDropDownList ID="BranchDDL1" runat="server" AppendDataBoundItems="True" DataSourceID="BranchDropDownODS1" DataTextField="Branch_Name" DataValueField="Ref_Number" height="24px" Width="197px">
                <Items>
                    <telerik:DropDownListItem Text="All Branches" Value="0" />
                </Items>
            </telerik:RadDropDownList>
            <telerik:RadWindow RenderMode="Lightweight" runat="server" ID="RadWindow_ContentTemplate" RestrictionZoneID="ContentTemplateZone"
                Modal="true" Width="340px" Height="340px">
                <ContentTemplate>
                    <div class="contButton">
                        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                <telerik:RadComboBox RenderMode="Lightweight" ID="BranchTypeDDL1" DataTextField="Name" DataValueField="Ref_Number" runat="server" Width="186px"
                                    AutoPostBack="true" EmptyMessage="- Select a Branch Type -" DataSourceID="BranchTypeODS1"
                                    Skin="Metro">
                                </telerik:RadComboBox>
                                <asp:ObjectDataSource ID="BranchTypeODS1" runat="server" SelectMethod="usp_BranchTypeDropDownList" TypeName="Test.BLL.Controls.BranchTypeDropDownListBL">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="1" Name="businessType" Type="Int32"></asp:Parameter>
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <telerik:RadComboBox RenderMode="Lightweight" ID="CountryDDL1" DataTextField="Name" DataValueField="Ref_Number" runat="server" Width="186px"
                                    AutoPostBack="true" EmptyMessage="- Select a Country -" DataSourceID="CountryODS1"
                                    Skin="Metro">
                                </telerik:RadComboBox>
                                <br />
                                <asp:ObjectDataSource ID="CountryODS1" runat="server" SelectMethod="usp_CountryDropDownList" TypeName="Test.BLL.Controls.CountryDropDownListBL">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="1" Name="branchRef" Type="Int32"></asp:Parameter>

                                    </SelectParameters>
                                </asp:ObjectDataSource>

                                <telerik:RadComboBox RenderMode="Lightweight" ID="StateDDL1" DataTextField="Name" DataValueField="Ref_Number" runat="server" Width="186px"
                                    AutoPostBack="true" EmptyMessage="- Select a State -" DataSourceID="StateODS1"
                                    Skin="Metro">
                                </telerik:RadComboBox>
                                <asp:ObjectDataSource ID="StateODS1" runat="server" SelectMethod="usp_StateDropDownList" TypeName="Test.BLL.Controls.StateDropDownListBL">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="CountryDDL1" PropertyName="SelectedValue" Name="countryRef" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <telerik:RadComboBox RenderMode="Lightweight" ID="RegionDDL1" DataTextField="Name" DataValueField="Ref_Number" runat="server" Width="186px"
                                    AutoPostBack="true" EmptyMessage="- Select a Region -" DataSourceID="RegionODS1"
                                    Skin="Metro">
                                </telerik:RadComboBox>
                                <asp:ObjectDataSource ID="RegionODS1" runat="server" SelectMethod="usp_RegionDropDownList" TypeName="Test.BLL.Controls.RegionDropDownListBL">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="StateDDL1" PropertyName="SelectedValue" DefaultValue="" Name="stateRef" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </telerik:RadAjaxPanel>
                    </div>
                    <div class="contButton">
                        <asp:Button ID="Button2" Text="Done" runat="server" OnClick="Button2_Click"></asp:Button>
                    </div>
                </ContentTemplate>
            </telerik:RadWindow>
            <asp:Button ID="Button3" Text="Peer Comparison" runat="server" OnClientClick="openWinContentTemplate(); return false;" />

            <telerik:RadDropDownList ID="TimeDDL1" runat="server" height="24px" Width="197px">
                <Items>
                    <telerik:DropDownListItem Text="Weekly" Value="3" />
                    <telerik:DropDownListItem Text="Monthly" Value="1" Selected="true" />
                    <telerik:DropDownListItem Text="Yearly" Value="2" />
                </Items>
            </telerik:RadDropDownList>
            <telerik:RadDatePicker ID="DatePicker1" runat="server" Class="Random" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-04-01" SelectedDate="2015-04-01" Height="24px" Width="200px">
                <DatePopupButton
                    CssClass="rcCalPopup"
                    Width="2em" />
            </telerik:RadDatePicker>
            <telerik:RadDatePicker ID="DatePicker2" runat="server" Class="Random" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-09-01" SelectedDate="2015-09-01" Height="24px" Width="200px">
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
                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>

            <telerik:RadButton ID="Button1" runat="server" Text="View" OnClick="Button1_Click"></telerik:RadButton>
        </div>

        <br />

        <%--KPIs--%>
        <%--KPI Container--%>
        <div class="demo-container no-bg">
            
            <telerik:RadAjaxManager runat="server" ID="RadAjaxManager1">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadTabStrip1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadTabStrip1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                            <telerik:AjaxUpdatedControl ControlID="RadMultiPage1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadMultiPage1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadTabStrip1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
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
            <telerik:RadTabStrip RenderMode="Lightweight" OnClientTabSelecting="onTabSelecting" ID="RadTabStrip1" SelectedIndex="0"
                runat="server" MultiPageID="RadMultiPage1" Skin="MetroTouch" Width="100%" Align="Justify" Orientation="HorizontalTop"
                OnTabClick="RadTabStrip1_TabClick">
            </telerik:RadTabStrip>
            <telerik:RadMultiPage ID="RadMultiPage1" CssClass="RadMultiPage" runat="server" SelectedIndex="0" OnPageViewCreated="RadMultiPage1_PageViewCreated">
            </telerik:RadMultiPage>
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
            <%--For panning and zooming--%>

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
            //function openWin() {
            //    var oWnd = radopen("Dialog1.aspx", "RadWindow1");
            //};

            <%--For responsive chart--%>


        </script>
    </telerik:RadScriptBlock>
</asp:Content>


