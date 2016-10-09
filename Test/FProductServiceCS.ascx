<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FProductServiceCS.ascx.cs" Inherits="Test.FProduct_ServiceCS" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<div class="demo-container size-thin">
    <telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"></telerik:RadClientExportManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Metro"></telerik:RadAjaxLoadingPanel>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="ServiceSB1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="ServiceSB1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="IncomeByServiceIndividualRHC1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="IncomeByServiceIndividualG1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="ProductSB1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="ProductSB1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="IncomeByProductIndividualRHC1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="IncomeByProductIndividualG1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadPanelBar RenderMode="Lightweight" runat="server" ID="RadPanelBar1" Width="100%" Skin="MetroTouch">
        <Items>
            
            <%--This section is for Income by Product Category Companywide--%>
            <telerik:RadPanelItem Text="Income by Product Category - ProductService" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <br />
                    <div class="export">
                        <telerik:RadButton ID="IncomeByProductCategoryCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportIncomeByProductCategoryCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <telerik:RadHtmlChart ID="IncomeByProductCategoryCompanyRHC1" RenderMode="Lightweight" RenderAs="Canvas" runat="server" DataSourceID="IncomeByProductCategoryCompanyODS1" Skin="Bootstrap">
                            <ClientEvents OnLoad="chartLoad" />
                            <ChartTitle Text="Income by Product Category Company-Wide"></ChartTitle>
                            <PlotArea>
                                <Series>
                                    <telerik:PieSeries StartAngle="90" DataFieldY="Income" ExplodeField="IsExploded" NameField="Category_Type" Name="Name">
                                        <LabelsAppearance Visible="false"></LabelsAppearance>
                                        <TooltipsAppearance DataFormatString="{0:N0} %" />
                                        <Appearance Overlay-Gradient="None"></Appearance>
                                    </telerik:PieSeries>
                                </Series>
                            </PlotArea>
                        </telerik:RadHtmlChart>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="IncomeByProductCategoryCompanyODS1" runat="server" SelectMethod="usp_IncomeByProductCategoryCompany" TypeName="Test.BLL.Financial.IncomeByProductCategoryCompanyBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>



                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <hr />
                    <br />
                    <telerik:RadGrid ID="IncomeByProductCategoryCompanyG1" RenderMode="Lightweight" runat="server" DataSourceID="IncomeByProductCategoryCompanyODS1" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True" Skin="Metro" CellSpacing="-1" GridLines="Both" OnItemCommand="ExportGridCustomiser" ExportSettings-FileName="Income by Product Category Company-wide">
                        <ClientSettings AllowDragToGroup="True" AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True"></Selecting>
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <ClientSettings AllowDragToGroup="True">
                        </ClientSettings>

                        <MasterTableView Width="100%" CommandItemDisplay="Top" DataSourceID="IncomeByProductCategoryCompanyODS1" AutoGenerateColumns="False">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="Category_Type" HeaderText="Product Category" SortExpression="Category_Type" UniqueName="Category_Type" FilterControlAltText="Filter Category_Type column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Income" HeaderText="Income (%)" SortExpression="Income" UniqueName="Income" DataType="System.Decimal" FilterControlAltText="Filter Income column"></telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Income by Service Activity Companywide--%>
            <telerik:RadPanelItem Text="Income by Service Activity - ProductService" Visible="false" Expanded="false">
                <ContentTemplate>

                    <%--Chart--%>
                    <br />
                    <div class="export">
                        <telerik:RadButton ID="IncomeByServiceActivityCompanyEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportIncomeByServiceActivityCompanyRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <telerik:RadHtmlChart ID="IncomeByServiceActivityCompanyRHC1" RenderMode="Lightweight" RenderAs="Canvas" Transitions="true" runat="server" DataSourceID="IncomeByServiceActivityCompanyODS1" Skin="Material">
                            <ClientEvents OnLoad="chartLoad" />
                            <ChartTitle Text="Income by Service Activity Company-Wide">
                                <Appearance Align="Center"></Appearance>
                            </ChartTitle>
                            <PlotArea>
                                <Series>
                                    <telerik:PieSeries StartAngle="90" DataFieldY="Income" ExplodeField="IsExploded" NameField="Category_Type" Name="Name">
                                        <LabelsAppearance Visible="false"></LabelsAppearance>
                                        <TooltipsAppearance DataFormatString="{0:N0} %" />
                                        <Appearance Overlay-Gradient="None"></Appearance>
                                    </telerik:PieSeries>

                                </Series>
                            </PlotArea>
                            <Legend>
                                <Appearance OffsetX="-70"></Appearance>
                            </Legend>
                        </telerik:RadHtmlChart>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="IncomeByServiceActivityCompanyODS1" runat="server" SelectMethod="usp_IncomeByServiceActivityCompany" TypeName="Test.BLL.Financial.IncomeByServiceActivityCompanyBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" DefaultValue="" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" DefaultValue="" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>



                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <hr />
                    <br />
                    <telerik:RadGrid ID="IncomeByServiceActivityCompanyG1" RenderMode="Lightweight" runat="server" DataSourceID="IncomeByServiceActivityCompanyODS1" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True" CellSpacing="-1" Skin="Metro" GridLines="Both" OnItemCommand="ExportGridCustomiser" ExportSettings-FileName="Income By Service Activity Company-wide">
                        <ClientSettings AllowDragToGroup="True" AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True"></Selecting>
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <ClientSettings AllowDragToGroup="True"></ClientSettings>

                        <MasterTableView Width="100%" CommandItemDisplay="Top" DataSourceID="IncomeByServiceActivityCompanyODS1" AutoGenerateColumns="False">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="Category_Type" HeaderText="Service Activity" SortExpression="Category_Type" UniqueName="Category_Type" FilterControlAltText="Filter Category_Type column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Income" HeaderText="Income (%)" SortExpression="Income" UniqueName="Income" DataType="System.Decimal" FilterControlAltText="Filter Income column"></telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--Display Income By Service Activity individually--%>
            <telerik:RadPanelItem Text="Income by Service - ProductService" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Combox to select service activity--%>
                    <telerik:RadComboBox runat="server" ID="ServiceSB1" Width="300" EmptyMessage="Search for Service" RenderMode="Lightweight" DataTextField="Prd_Name" DataValueField="Prd_Number" OnSelectedIndexChanged="ServiceSB1_SelectedIndexChanged" AutoPostBack="true" DataSourceID="ServiceODS1" MarkFirstMatch="True" Skin="Metro" Filter="Contains"></telerik:RadComboBox>
                    <asp:ObjectDataSource ID="ServiceODS1" runat="server" SelectMethod="usp_ProductServiceNameSearchBox" TypeName="Test.BLL.Controls.ProductServiceNameSearchBoxBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="CompanyRef" DefaultValue="" Name="companyRef" Type="Int64"></asp:SessionParameter>

                            <asp:Parameter DefaultValue="Service" Name="Class" Type="String"></asp:Parameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>

                    <%--Chart--%>
                    <div class="export">
                        <telerik:RadButton ID="ExportButton" runat="server" RenderMode="Lightweight" CssClass="ExportButton" OnClientClicked="exportIncomeByServiceIndividualRHC1"  Text="Export to PDF" UseSubmitBehaviour="false" AutoPostBack="false"></telerik:RadButton>

                        <telerik:RadHtmlChart ID="IncomeByServiceIndividualRHC1" RenderMode="Lightweight" RenderAs="Canvas" runat="server" Skin="Material">
                            <ClientEvents OnLoad="formatIncomeByServiceIndividualRHC1" />
                            <Pan Enabled="true" Lock="X" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="X" />
                                <Selection Enabled="true" Lock="X" ModifierKey="Shift" />
                            </Zoom>
                        </telerik:RadHtmlChart>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="IncomeByServiceIndividualODS1" runat="server" SelectMethod="usp_IncomeByServiceIndividual_Result" TypeName="Test.BLL.Financial.IncomeByServiceIndividualBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:ControlParameter ControlID="ServiceSB1" PropertyName="SelectedValue" Name="productNumnber" Type="Int64"></asp:ControlParameter>
                            <asp:SessionParameter SessionField="Time" Name="timeType" Type="Int32"></asp:SessionParameter>

                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <br />
                    <br />
                    <telerik:RadGrid ID="IncomeByServiceIndividualG1" runat="server" DataSourceID="IncomeByServiceIndividualODS1" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True" Skin="Metro" OnItemCommand="ExportGridCustomiser">
                        <ClientSettings AllowDragToGroup="True"></ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView DataSourceID="IncomeByServiceIndividualODS1" Width="100%" CommandItemDisplay="Top" AutoGenerateColumns="False">
                            <CommandItemSettings ShowExportToWordButton="true" ShowExportToPdfButton="true" ShowExportToExcelButton="true" ShowPrintButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="false" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="Service_Name" HeaderText="Service" SortExpression="Service_Name" UniqueName="Service_Name" FilterControlAltText="Filter Service_Name column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TimePeriod" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod" FilterControlAltText="Filter TimePeriod column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Income_By_Service" HeaderText="Income" SortExpression="Income_By_Service" UniqueName="Income_By_Service" DataType="System.Decimal" FilterControlAltText="Filter Income_By_Service column"></telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--Display Income By Product Category individually--%>
            <telerik:RadPanelItem Text="Income by Product - ProductService" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Combox to select product--%>
                    <telerik:RadComboBox runat="server" ID="ProductSB1" Width="300" EmptyMessage="Search for Product" OnSelectedIndexChanged="ProductSB1_SelectedIndexChanged" RenderMode="Lightweight" DataTextField="Prd_Name" DataValueField="Prd_Number" AutoPostBack="true" DataSourceID="ProductODS1" MarkFirstMatch="True" Skin="Metro" Filter="Contains"></telerik:RadComboBox>
                    <asp:ObjectDataSource ID="ProductODS1" runat="server" SelectMethod="usp_ProductServiceNameSearchBox" TypeName="Test.BLL.Controls.ProductServiceNameSearchBoxBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64" DefaultValue="Product"></asp:SessionParameter>

                            <asp:Parameter Name="Class" Type="String" DefaultValue="Product"></asp:Parameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Chart--%>

                    <div class="export">
                        <telerik:RadButton ID="IncomeByProductIndividualEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportIncomeByProductIndividualRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <telerik:RadHtmlChart ID="IncomeByProductIndividualRHC1" RenderMode="Lightweight" RenderAs="Canvas" runat="server" Skin="Material">
                            <ClientEvents OnLoad="formatIncomeByProductIndividualRHC1" />
                            <Pan Enabled="true" Lock="X" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="X" />
                                <Selection Enabled="true" Lock="X" ModifierKey="Shift" />
                            </Zoom>
                        </telerik:RadHtmlChart>
                    </div>


                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="IncomeByProductIndividualODS1" runat="server" SelectMethod="usp_IncomeByProductIndividual_Result" TypeName="Test.BLL.Financial.IncomeByProductIndividualBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="StartDate" Name="start" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="EndDate" Name="end" Type="DateTime"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:ControlParameter ControlID="ProductSB1" PropertyName="SelectedValue" Name="productNumnber" Type="Int64"></asp:ControlParameter>
                            <asp:SessionParameter SessionField="Time" Name="timeType" Type="Int32"></asp:SessionParameter>

                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <br />
                    <br />
                    <telerik:RadGrid ID="IncomeByProductIndividualG1" RenderMode="Lightweight" runat="server" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True" Skin="Metro" OnItemCommand="ExportGridCustomiser" DataSourceID="IncomeByProductIndividualODS1">
                        <ClientSettings AllowDragToGroup="True"></ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView AutoGenerateColumns="False" Width="100%" CommandItemDisplay="Top" DataSourceID="IncomeByProductIndividualODS1">
                            <CommandItemSettings ShowExportToWordButton="true" ShowExportToPdfButton="true" ShowExportToExcelButton="true" ShowPrintButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="false" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="Product_Name" HeaderText="Product" SortExpression="Product_Name" UniqueName="Product_Name" FilterControlAltText="Filter Product_Name column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TimePeriod" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod" FilterControlAltText="Filter TimePeriod column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Income_By_Product" HeaderText="Income" SortExpression="Income_By_Product" UniqueName="Income_By_Product" DataType="System.Decimal" FilterControlAltText="Filter Income_By_Product column"></telerik:GridBoundColumn>
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
        var $ = $telerik.$;
        //For Exporting Charts
        function exportIncomeByServiceIndividualRHC1(sender, args) {
            exportRadHtmlChart('<%=IncomeByServiceIndividualRHC1.ClientID%>')
        }

        function exportIncomeByProductIndividualRHC1(sender, args) {
            exportRadHtmlChart('<%=IncomeByProductIndividualRHC1.ClientID%>')
        }

        function exportIncomeByProductCategoryCompanyRHC1(sender, args) {
            exportRadHtmlChart('<%=IncomeByProductCategoryCompanyRHC1.ClientID%>')
        }

        function exportIncomeByServiceActivityCompanyRHC1(sender, args) {
            exportRadHtmlChart('<%=IncomeByServiceActivityCompanyRHC1.ClientID%>')
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

        function formatIncomeByServiceIndividualRHC1() {
            var chart1 = $find("<%=IncomeByServiceIndividualRHC1.ClientID%>");
            chart1.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart1.repaint();
        };
        function formatIncomeByProductIndividualRHC1() {
            var chart2 = $find("<%=IncomeByProductIndividualRHC1.ClientID%>");
            chart2.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart2.repaint();
        };


    </script>
</telerik:RadScriptBlock>
