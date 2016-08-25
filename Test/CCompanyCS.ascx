<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CCompanyCS.ascx.cs" Inherits="Test.CCompanyCS" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<div class="demo-container size-thin">
    <telerik:RadPanelBar RenderMode="Lightweight" runat="server" ID="RadPanelBar1" Width="100%" Skin="MetroTouch">
        <Items>
            <%--Display Number of Unique Customers Seen by a company--%>
            <telerik:RadPanelItem Text="Number of Unique Customers Seen Company-wide" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <telerik:RadHtmlChart ID="UniqueCustomersSeenCompanyRHC1" runat="server" DataSourceID="UniqueCustomersSeenCompanyODC1" Skin="MetroTouch">
                        <PlotArea>
                            <Series>
                                <telerik:ColumnSeries DataFieldY="Number_of_Unique_Clients">
                                    <TooltipsAppearance DataFormatString="N0"></TooltipsAppearance>
                                    <LabelsAppearance DataFormatString="N0"></LabelsAppearance>
                                </telerik:ColumnSeries>
                            </Series>
                            <XAxis DataLabelsField="TimePeriod" Type="auto">
                                <TitleAppearance Text="Time Period">
                                    <TextStyle Margin="20" />
                                </TitleAppearance>
                                <LabelsAppearance DataFormatString="MMM yyyy">
                                </LabelsAppearance>
                                <MajorGridLines Visible="false" />
                                <MinorGridLines Visible="false" />
                            </XAxis>
                            <YAxis>
                                <TitleAppearance Text="No of Unique Customers">
                                    <TextStyle Margin="20" />
                                </TitleAppearance>
                                <MinorGridLines Visible="false" />
                            </YAxis>
                        </PlotArea>

                        <ChartTitle Text="No of Unique Customers Companywide">
                        </ChartTitle>
                        <Zoom Enabled="False"></Zoom>
                    </telerik:RadHtmlChart>
                    <%--Table--%>
                    <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="UniqueCustomersSeenCompanyODC1" CellSpacing="-1" GridLines="Both" ShowGroupPanel="True" Skin="MetroTouch">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True" AllowDragToGroup="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <MasterTableView AllowPaging="False" AllowSorting="False" AutoGenerateColumns="False" DataSourceID="UniqueCustomersSeenCompanyODC1">
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Number_of_Unique_Clients" DataFormatString="{0:N0}" DataType="System.Int32" FilterControlAltText="Filter Number_of_Unique_Clients column" HeaderText="Number of Unique Clients" SortExpression="Number_of_Unique_Clients" UniqueName="Number_of_Unique_Clients">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="UniqueCustomersSeenCompanyODC1" runat="server" SelectMethod="usp_UniqueCustomersSeenCompany" TypeName="Test.BLL.Customer.UniqueCustomersSeenCompanyBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-30" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--Display Number of Animals Seen Company Wide--%>
            <telerik:RadPanelItem Text="Number of Animals Seen Company-wide" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <telerik:RadHtmlChart ID="AnimalsSeenCompanyRHC1" runat="server" DataSourceID="AnimalsSeenCompanyODS1" Skin="Vista">
                        <PlotArea>
                            <Series>
                                <telerik:LineSeries Name="No of Animals Seen" DataFieldY="Number_of_animals_seen">
                                    <TooltipsAppearance DataFormatString="N0"></TooltipsAppearance>
                                    <LabelsAppearance DataFormatString="N0"></LabelsAppearance>
                                </telerik:LineSeries>
                            </Series>

                            <XAxis DataLabelsField="TimePeriod" Type="Auto">
                                <TitleAppearance Text="Period">
                                    <TextStyle Margin="20" />
                                </TitleAppearance>
                                <LabelsAppearance DataFormatString="MMM yyyy">
                                </LabelsAppearance>
                                <MajorGridLines Visible="false" />
                                <MinorGridLines Visible="false" />
                            </XAxis>

                            <YAxis>
                                <TitleAppearance Text="No of Animals Seen">
                                    <TextStyle Margin="20" />
                                </TitleAppearance>
                                <MinorGridLines Visible="false" />
                            </YAxis>
                        </PlotArea>

                        <ChartTitle Text="Number of Animals Seens Companywide">
                        </ChartTitle>
                        <Zoom Enabled="False"></Zoom>
                    </telerik:RadHtmlChart>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="AnimalsSeenCompanyODS1" runat="server" SelectMethod="usp_AnimalsSeenCompany" TypeName="Test.BLL.Customer.AnimalsSeenCompanyBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-30" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <telerik:RadGrid ID="AnimalsSeenComG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="AnimalsSeenCompanyODS1" ShowGroupPanel="True" Skin="MetroTouch" CellSpacing="-1" GridLines="Both">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="False" DataSourceID="AnimalsSeenCompanyODS1">
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Number_of_animals_seen" DataFormatString="{0:N0}" DataType="System.Int32" FilterControlAltText="Filter Number_of_animals_seen column" HeaderText="Number of Animals Seen" SortExpression="Number_of_animals_seen" UniqueName="Number_of_animals_seen">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Average dollar per customer company wide  chart--%>
            <telerik:RadPanelItem Text="Average Dollar per Customer Company-wide" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <telerik:RadHtmlChart ID="AvgDollarPerCustomerCompanyRHC1" runat="server" DataSourceID="AvgDollarPerCustomerCompanyODS1" Skin="Metro">
                        <Pan Enabled="true" Lock="Y" />
                        <Zoom Enabled="true">
                            <MouseWheel Enabled="true" Lock="Y" />
                            <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                        </Zoom>
                        <Legend>
                            <Appearance Position="Bottom" />
                        </Legend>
                        <PlotArea>
                            <XAxis Color="Black" DataLabelsField="TimePeriod" Type="Auto">
                                <TitleAppearance Position="Center" Text="Time Period" />
                                <LabelsAppearance DataFormatString="MMM yy">
                                </LabelsAppearance>
                            </XAxis>
                            <YAxis Color="Black">
                                <MajorGridLines Color="#EFEFEF" Width="1" />
                                <MinorGridLines Color="#F7F7F7" Width="1" />
                                <TitleAppearance Position="Center" Text="$" RotationAngle="90" />
                            </YAxis>
                            <Series>
                                <telerik:AreaSeries Name="Average Dollar per Customer" DataFieldY="Average_Dollar_per_customer">
                                    <Appearance>
                                        <FillStyle BackgroundColor="Orange" />
                                    </Appearance>
                                    <MarkersAppearance MarkersType="Circle" BackgroundColor="White" />
                                    <TooltipsAppearance DataFormatString="C0" BackgroundColor="White" />
                                    <LabelsAppearance Visible="false">
                                    </LabelsAppearance>
                                </telerik:AreaSeries>
                            </Series>
                        </PlotArea>

                        <ChartTitle Text="Average Dollar Value per Customer ">
                        </ChartTitle>
                    </telerik:RadHtmlChart>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="AvgDollarPerCustomerCompanyODS1" runat="server" SelectMethod="usp_AvgDollarPerCustomerCompany" TypeName="Test.BLL.Customer.AvgDollarPerCustomerCompanyBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-30" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <telerik:RadGrid ID="AvgDollarPerCustomerCompanyG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="AvgDollarPerCustomerCompanyODS1" ShowGroupPanel="True" Skin="MetroTouch" CellSpacing="-1" GridLines="Both">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="False" DataSourceID="AvgDollarPerCustomerCompanyODS1">
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Average_Dollar_per_customer" DataFormatString="{0:N0}" DataType="System.Decimal" FilterControlAltText="Filter Average_Dollar_per_customer column" HeaderText="Average Dollar per Customer" SortExpression="Average_Dollar_per_customer" UniqueName="Average_Dollar_per_customer">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Number of New Customers company wide  chart--%>
            <telerik:RadPanelItem Text="Number of New Customers Company-wide" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <telerik:RadHtmlChart ID="NewCustomersCompanyRHC1" runat="server" DataSourceID="NewCustomersCompanyODS1" Skin="Silk">
                        <PlotArea>
                            <Series>
                                <telerik:ColumnSeries DataFieldY="Number_of_New_Customers">
                                    <TooltipsAppearance DataFormatString="N0"></TooltipsAppearance>
                                    <LabelsAppearance DataFormatString="N0"></LabelsAppearance>
                                </telerik:ColumnSeries>
                            </Series>
                            <XAxis DataLabelsField="TimePeriod" Type="auto">
                                <TitleAppearance Text="Time Period">
                                    <TextStyle Margin="20" />
                                </TitleAppearance>
                                <LabelsAppearance DataFormatString="MMM yyyy">
                                </LabelsAppearance>
                                <MajorGridLines Visible="false" />
                                <MinorGridLines Visible="false" />
                            </XAxis>
                            <YAxis>
                                <TitleAppearance Text="No of New Customers">
                                    <TextStyle Margin="20" />
                                </TitleAppearance>
                                <MinorGridLines Visible="false" />
                            </YAxis>
                        </PlotArea>

                        <ChartTitle Text="No of New Customers Companywide">
                        </ChartTitle>
                    </telerik:RadHtmlChart>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="NewCustomersCompanyODS1" runat="server" SelectMethod="usp_NewCustomersCompany" TypeName="Test.BLL.Customer.NewCustomersCompanyBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-30" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <telerik:RadGrid ID="NewCustomersCompanyG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="NewCustomersCompanyODS1" ShowGroupPanel="True" Skin="MetroTouch" CellSpacing="-1" GridLines="Both">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="False" DataSourceID="NewCustomersCompanyODS1">
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Number_of_New_Customers" DataFormatString="{0:N0}" DataType="System.Int32" FilterControlAltText="Filter Number_of_New_Customers column" HeaderText="Number of New Customers" SortExpression="Number_of_New_Customers" UniqueName="Number_of_New_Customers">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Number of Small Animals company wide  chart--%>
            <telerik:RadPanelItem Text="Number of Small Animals Company-wide" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <telerik:RadHtmlChart ID="SmallAnimalsCompanyRHC1" runat="server" DataSourceID="SmallAnimalsCompanyODS1" Skin="Material">
                        <PlotArea>
                            <Series>
                                <telerik:LineSeries Name="Small Animals" DataFieldY="Number_of_Small_Animals">
                                    <TooltipsAppearance DataFormatString="N0"></TooltipsAppearance>
                                    <LabelsAppearance DataFormatString="N0"></LabelsAppearance>
                                </telerik:LineSeries>
                            </Series>

                            <XAxis DataLabelsField="TimePeriod" Type="Auto">
                                <TitleAppearance Text="Period">
                                    <TextStyle Margin="20" />
                                </TitleAppearance>
                                <LabelsAppearance DataFormatString="MMM yyyy">
                                </LabelsAppearance>
                                <MajorGridLines Visible="false" />
                                <MinorGridLines Visible="false" />
                            </XAxis>

                            <YAxis>
                                <TitleAppearance Text="No of Small Animals">
                                    <TextStyle Margin="20" />
                                </TitleAppearance>
                                <MinorGridLines Visible="false" />
                            </YAxis>
                        </PlotArea>

                        <ChartTitle Text="Number of Small Animals Companywide">
                        </ChartTitle>
                    </telerik:RadHtmlChart>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="SmallAnimalsCompanyODS1" runat="server" SelectMethod="usp_SmallAnimalsCompany" TypeName="Test.BLL.Customer.SmallAnimalsCompanyBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <telerik:RadGrid ID="SmallAnimalsCompanyG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SmallAnimalsCompanyODS1" ShowGroupPanel="True" Skin="MetroTouch" CellSpacing="-1" GridLines="Both">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="False" DataSourceID="SmallAnimalsCompanyODS1">
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Number_of_Small_Animals" DataFormatString="{0:N0}" DataType="System.Int32" FilterControlAltText="Filter Number_of_Small_Animals column" HeaderText="Number of Small Animals" SortExpression="Number_of_Small_Animals" UniqueName="Number_of_Small_Animals">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Number of Large Animals company wide  chart--%>
            <telerik:RadPanelItem Text="Number of Large Animals Company-wide" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <telerik:RadHtmlChart ID="LargeAnimalsCompanyRHC1" runat="server" DataSourceID="LargeAnimalsCompanyODS1">
                        <PlotArea>
                            <Series>
                                <telerik:LineSeries Name="Large Animals" DataFieldY="Number_of_Large_Animals">
                                    <TooltipsAppearance DataFormatString="N0"></TooltipsAppearance>
                                    <LabelsAppearance DataFormatString="N0"></LabelsAppearance>
                                </telerik:LineSeries>
                            </Series>

                            <XAxis DataLabelsField="TimePeriod" Type="Auto">
                                <TitleAppearance Text="Period">
                                    <TextStyle Margin="20" />
                                </TitleAppearance>
                                <LabelsAppearance>
                                </LabelsAppearance>
                                <MajorGridLines Visible="false" />
                                <MinorGridLines Visible="false" />
                            </XAxis>

                            <YAxis>
                                <TitleAppearance Text="No of Large Animals">
                                    <TextStyle Margin="20" />
                                </TitleAppearance>
                                <MinorGridLines Visible="false" />
                            </YAxis>
                        </PlotArea>

                        <ChartTitle Text="Number of Large Animals Companywide">
                        </ChartTitle>
                    </telerik:RadHtmlChart>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="LargeAnimalsCompanyODS1" runat="server" SelectMethod="usp_LargeAnimalsCompany" TypeName="Test.BLL.Customer.LargeAnimalsCompanyBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <telerik:RadGrid ID="LargeAnimalsCompanyG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="LargeAnimalsCompanyODS1" ShowGroupPanel="True" Skin="MetroTouch">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="False" DataSourceID="LargeAnimalsCompanyODS1">
                            <Columns>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Number_of_Large_Animals" DataFormatString="{0:N0}" DataType="System.Int32" FilterControlAltText="Filter Number_of_Large_Animals column" HeaderText="Number of Large Animals" SortExpression="Number_of_Large_Animals" UniqueName="Number_of_Large_Animals">
                                </telerik:GridBoundColumn>
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
