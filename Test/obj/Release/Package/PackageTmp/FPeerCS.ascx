<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FPeerCS.ascx.cs" Inherits="Test.FPeerCS" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<div class="demo-container size-thin">
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Metro"></telerik:RadAjaxLoadingPanel>
    <telerik:RadPanelBar RenderMode="Lightweight" runat="server" ID="RadPanelBar1" Width="100%" Skin="MetroTouch">
        <Items>
            <telerik:RadPanelItem Width="100%">
               <ContentTemplate>
                   <div style="display:inline-block"><telerik:RadAjaxPanel runat="server" RenderMode="Block" LoadingPanelID="RadAjaxLoadingPanel1" >
                    <%--Combobox for branch--%>
                    <telerik:RadComboBox RenderMode="Lightweight"  ID="BranchCB1" OnSelectedIndexChanged="BranchCB1_SelectedIndexChanged" DataTextField="Branch_Name" DataValueField="Ref_Number" runat="server" Width="186px" CssClass="Display:none"
                        AutoPostBack="true" EmptyMessage="- Select a Branch -" DataSourceID="BranchDropDownODS1"
                        Skin="Metro">
                    </telerik:RadComboBox>
                    <%--Objectdatasource for branch combo box--%>
                    <asp:ObjectDataSource ID="BranchDropDownODS1" runat="server" SelectMethod="usp_BranchDropDownList" TypeName="Test.BLL.Controls.BranchDropDownListBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="CompanyRef" DefaultValue="" Name="companyRef" Type="Int32"></asp:SessionParameter>

                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Combobox for branch type--%>
                    <telerik:RadComboBox RenderMode="Lightweight" ID="BranchTypeDDL1" OnSelectedIndexChanged="BranchTypeDDL1_SelectedIndexChanged" DataTextField="Name" DataValueField="Ref_Number" runat="server" Width="186px"
                        AutoPostBack="true" EmptyMessage="- Select a Branch Type -" DataSourceID="BranchTypeODS1"
                        Skin="Metro">
                    </telerik:RadComboBox>

                    <%--Objectdatasource for branch type--%>
                    <asp:ObjectDataSource ID="BranchTypeODS1" runat="server" SelectMethod="usp_BranchTypeDropDownList" TypeName="Test.BLL.Controls.BranchTypeDropDownListBL">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="businessType" Type="Int32"></asp:Parameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>

                    <%--Combobox for country--%>
                    <telerik:RadComboBox RenderMode="Lightweight" ID="CountryDDL1" DataTextField="Country_Name" OnSelectedIndexChanged="CountryDDL1_SelectedIndexChanged" DataValueField="Country_Ref" runat="server" Width="186px"
                        AutoPostBack="true" EmptyMessage="- Select a Country -" DataSourceID="CountryODS1"
                        Skin="Metro">
                    </telerik:RadComboBox>
                    <%--Objectdatasource for country--%>
                    <asp:ObjectDataSource ID="CountryODS1" runat="server" SelectMethod="usp_CountryDropDownList" TypeName="Test.BLL.Controls.CountryDropDownListBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BranchCB1" PropertyName="SelectedValue" Name="branchRef" Type="Int64"></asp:ControlParameter>


                        </SelectParameters>
                    </asp:ObjectDataSource>

                    <%--COmbobox for state--%>
                    <telerik:RadComboBox RenderMode="Lightweight" ID="StateDDL1" OnSelectedIndexChanged="StateDDL1_SelectedIndexChanged" DataTextField="State_Name" DataValueField="State_Ref" runat="server" Width="186px"
                        AutoPostBack="true" EmptyMessage="- Select a State -" DataSourceID="StateODS1"
                        Skin="Metro">
                    </telerik:RadComboBox>
                    <%--Objectdatasource for state--%>
                    <asp:ObjectDataSource ID="StateODS1" runat="server" SelectMethod="usp_StateDropDownList" TypeName="Test.BLL.Controls.StateDropDownListBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="CountryDDL1" PropertyName="SelectedValue" Name="countryRef" Type="Int64"></asp:ControlParameter>

                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Combobox for region--%>
                    <telerik:RadComboBox RenderMode="Lightweight" OnSelectedIndexChanged="RegionDDL1_SelectedIndexChanged" ID="RegionDDL1" DataTextField="Region_Name" DataValueField="Region_Ref" runat="server" Width="186px"
                        AutoPostBack="true" EmptyMessage="- Select a Region -" DataSourceID="RegionODS1"
                        Skin="Metro" >
                        <DefaultItem Value="0" Visible="false" />
                    </telerik:RadComboBox>
                    <%--Objectdatasource for region--%>
                    <asp:ObjectDataSource ID="RegionODS1" runat="server" SelectMethod="usp_RegionDropDownList" TypeName="Test.BLL.Controls.RegionDropDownListBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="StateDDL1" PropertyName="SelectedValue" Name="stateRef" Type="Int64"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                       </telerik:RadAjaxPanel></div>
                   <telerik:RadButton ID="Button1" runat="server" Text="Go" Skin="Metro" CssClass="display:inline-block"></telerik:RadButton>
                   <br />
                   <br />
                   </ContentTemplate>
                </telerik:RadPanelItem>
            </Items>
        
        <Items>
            
            <%--This section is for Average dollar per transaction peer comparison  chart--%>
            <telerik:RadPanelItem Text="Average Dollar per Transaction - Peer Comparison" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--This export manager is for all the KPI charts--%>
                    <telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"></telerik:RadClientExportManager>
                    <%--Chart--%>
                    <br />
                    <div class="export">
                        <telerik:RadButton ID="AvgDollarPerTransactionPeerEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportAvgDollarPerTransactionPeerRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <telerik:RadHtmlChart ID="AvgDollarPerTransactionPeerRHC1" RenderMode="Lightweight" RenderAs="Canvas" runat="server" Skin="Bootstrap">
                            <ClientEvents OnLoad="formatAvgDollarPerTransactionPeerRHC1" />
                            <Pan Enabled="true" Lock="Y" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="Y" />
                                <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                            </Zoom>
                        </telerik:RadHtmlChart>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="AvgDollarPerTransactionPeerODS1" runat="server" SelectMethod="usp_AvgDollarPerTransactionPeer" TypeName="Test.BLL.Financial.AvgDollarPerTransactionPeerBL">

                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="Branch" Name="branchRef" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="BranchType" Name="branchType" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="Time" Name="timeType" Type="Int32"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="Country" Name="country" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="State" Name="state" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="Region" Name="region" Type="Int64"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>

                    <%--Table--%>
                    <hr />
                    <br />
                    <telerik:RadGrid ID="AvgDollarPerTransactionPeerG1" RenderMode="Lightweight" runat="server" DataSourceID="AvgDollarPerTransactionPeerODS1" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True" Skin="Metro" OnItemCommand="ExportGridCustomiser" ExportSettings-FileName="Average Dollar per Transaction Peer Comparison">
                        <ClientSettings AllowDragToGroup="True" AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True"></Selecting>
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView Width="100%" CommandItemDisplay="Top" DataSourceID="AvgDollarPerTransactionPeerODS1" AutoGenerateColumns="False">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="Name" HeaderText="Name" SortExpression="Name" UniqueName="Name" FilterControlAltText="Filter Name column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TimePeriod" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod" FilterControlAltText="Filter TimePeriod column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Average_Dollar_per_Transaction" HeaderText="Average Dollar per Transaction" SortExpression="Average_Dollar_per_Transaction" UniqueName="Average_Dollar_per_Transaction" DataType="System.Decimal" FilterControlAltText="Filter Average_Dollar_per_Transaction column"></telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
        </Items>
        <ExpandAnimation Type="None" />
        <CollapseAnimation Type="None" />
    </telerik:RadPanelBar>
</div>
<telerik:RadScriptBlock runat="server">
    <script>
        var $ = $telerik.$
        function exportAvgDollarPerTransactionPeerRHC1(sender, args) {
            exportRadHtmlChart('<%=AvgDollarPerTransactionPeerRHC1.ClientID%>')
        }

        function exportRadHtmlChart(chartId) {
            var chartTitle = $find(chartId).get_kendoWidget().options.title.text;
            var manager = $find('<%=RadClientExportManager1.ClientID%>');
            var pdfSettings = {
                fileName: chartTitle

            };

            manager.set_pdfSettings(pdfSettings);
            manager.exportPDF($("#" + chartId));
        }

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
            //Hide Export Button 

            $("div.export").mouseover(function () {
                $(".RadButton", this).css("display", "inline-block");
            });
            $("div.export").mouseout(function () {
                $(".RadButton", this).css("display", "none");
            });

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

        //format Y axis value based on value
        function formatAvgDollarPerTransactionPeerRHC1() {

            var chart1 = $find("<%=AvgDollarPerTransactionPeerRHC1.ClientID%>");
            chart1.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart1.repaint();
        };
    </script>
</telerik:RadScriptBlock>
