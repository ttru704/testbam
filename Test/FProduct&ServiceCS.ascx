<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FProduct&ServiceCS.ascx.cs" Inherits="Test.FProduct_ServiceCS" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<div class="demo-container size-thin">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
        <%--<AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="ServiceSB1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="i0" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="ProductSB1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="i1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>--%>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>

    <telerik:RadPanelBar RenderMode="Lightweight" runat="server" ID="RadPanelBar1" Width="100%" Skin="MetroTouch">
        <Items>
            <%--Display Income By Service Activity individually--%>
            <telerik:RadPanelItem Text="Income By Service Activity"  Expanded="false">
                <ContentTemplate>
                        <%--Combox to select service activity--%>
                        <telerik:RadComboBox runat="server" ID="ServiceSB1" EmptyMessage="Search for Service" RenderMode="Lightweight" DataTextField="Prd_Name" DataValueField="Prd_Number" OnSelectedIndexChanged="ServiceSB1_SelectedIndexChanged" AutoPostBack="true" DataSourceID="ServiceODS1" MarkFirstMatch="True" Skin="Metro" Filter="StartsWith"></telerik:RadComboBox>
                        <asp:ObjectDataSource ID="ServiceODS1" runat="server" SelectMethod="usp_ProductServiceNameSearchBox" TypeName="Test.BLL.Controls.ProductServiceNameSearchBoxBL">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="companyRef" Type="Int32"></asp:Parameter>
                                <asp:Parameter DefaultValue="S" Name="productClass" Type="String"></asp:Parameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>

                        <%--Chart--%>
                        <telerik:RadHtmlChart ID="IncomeByServiceIndividualRHC1" runat="server"></telerik:RadHtmlChart>
                        <%--Datasource--%>
                        <%--Table--%>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--Display Income By Product Category individually--%>
            <telerik:RadPanelItem Text="Income By Product" Expanded="false">
                <ContentTemplate>
                    <%--Combox to select service activity--%>
                        <telerik:RadComboBox runat="server" ID="ProductSB1" EmptyMessage="Search for Product" OnSelectedIndexChanged="ProductSB1_SelectedIndexChanged" RenderMode="Lightweight" DataTextField="Prd_Name" DataValueField="Prd_Number" AutoPostBack="true" DataSourceID="ProductODS1" MarkFirstMatch="True" Skin="Metro" Filter="StartsWith"></telerik:RadComboBox>
                        <asp:ObjectDataSource ID="ProductODS1" runat="server" SelectMethod="usp_ProductServiceNameSearchBox" TypeName="Test.BLL.Controls.ProductServiceNameSearchBoxBL">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="companyRef" Type="Int32"></asp:Parameter>
                                <asp:Parameter DefaultValue="R" Name="productClass" Type="String"></asp:Parameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <%--Chart--%>
                        <telerik:RadHtmlChart ID="IncomeByProductIndividualRHC1" runat="server"></telerik:RadHtmlChart>
                        <%--Datasource--%>
                        <%--Table--%>
                </ContentTemplate>
            </telerik:RadPanelItem>
        </Items>
        <ExpandAnimation Type="None" />
        <CollapseAnimation Type="None" />
    </telerik:RadPanelBar>
</div>
<script>
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
    <%--For responsive chart--%>
</script>
