<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="customerKPI.aspx.cs" Inherits="Test.customerkpi" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/jquery-ui.min.js"></script>
    <script src="Scripts/accordion.js" type="text/javascript"></script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="right_col" role="main">
            <%--KPI menu--%>
            <div id="KPIMenu" style="text-align: center">
                <a href="/financialKPI.aspx" style="font-size: 20px"><strong>Financial</strong></a>
                <strong>|</strong>
                <a href="/employeekpi.aspx" style="font-size: 20px"><strong>Employee</strong></a>
                <strong>|</strong>
                <a href="/customerkpi.aspx" style="font-size: 20px"><strong>Customer</strong></a>
                <br />
            </div>
            <br />
            <%--Datepickers and input--%>
            <div>
                <telerik:RadDatePicker ID="DatePicker1" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-05-01" SelectedDate="2015-05-01"></telerik:RadDatePicker>
                <telerik:RadDatePicker ID="DatePicker2" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-09-30" SelectedDate="2015-09-30"></telerik:RadDatePicker>
                <asp:DropDownList ID="CompanyDDL1" runat="server" Width="100px">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="BranchDDL1" runat="server" AutoPostBack="True" AppendDataBoundItems="True" EnableViewState="False" Width="100px" DataSourceID="BranchDropDownODS1" DataTextField="Branch_Name" DataValueField="Ref_Number">
                    <asp:ListItem Value="0" Selected="True">All Branches</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="TimeDDL1" runat="server" Width="100px">
                    <asp:ListItem Value="1"> Monthly </asp:ListItem>
                    <asp:ListItem Value="2"> Yearly </asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="Button1" runat="server" Text="View" OnClick="Button1_Click" />
                <asp:ObjectDataSource ID="BranchDropDownODS1" runat="server" SelectMethod="usp_BranchDropDownList" TypeName="Test.BLL.BranchDropDownListBL">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>

            <br />
            <div id="accordion">
                <%--Display Number of Unique Customers Seen by a company--%>
                <div class="accordionable">
                    <div class="kpiheader">Number of Unique Customers Seen Companywide</div>
                    <div class="chartcontainer">
                        <%--Chart--%>
                        <telerik:RadHtmlChart ID="UniqueCustomersSeenComRHC1" runat="server" DataSourceID="UniqueCustomersSeenComODC1" Skin="MetroTouch">
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

                            <ChartTitle Text="No of Unique Clients Companywide">
                            </ChartTitle>
                            <Zoom Enabled="False"></Zoom>
                        </telerik:RadHtmlChart>
                        <%--Table--%>
                        <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="UniqueCustomersSeenComODC1">
                            <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                            <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <MasterTableView AllowPaging="False" AllowSorting="False" AutoGenerateColumns="False" DataSourceID="UniqueCustomersSeenComODC1">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Number_of_Unique_Clients" DataType="System.Int32" FilterControlAltText="Filter Number_of_Unique_Clients column" HeaderText="Number of Unique Clients" SortExpression="Number_of_Unique_Clients" UniqueName="Number_of_Unique_Clients">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <%--Datasource--%>
                        <asp:ObjectDataSource ID="UniqueCustomersSeenComODC1" runat="server" SelectMethod="usp_UniqueCustomersSeenCom" TypeName="Test.BLL.Customer.UniqueCustomersSeenComBL">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-30" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                </div>
                <%--Display Number of Unique Customers Seen branch comparison--%>
                <div class="accordionable">
                    <div class="kpiheader">Number of Unique Customers Seen Branch Comparison</div>
                    <div class="chartcontainer">
                        <%--Chart--%>
                        <telerik:RadHtmlChart ID="UniqueCustomersSeenBranchRHC1" runat="server" Skin="Material">
                            <ChartTitle Text="Number of Unique Clients Seen">
                            </ChartTitle>

                            <PlotArea>
                            </PlotArea>

                            <Zoom Enabled="False"></Zoom>
                        </telerik:RadHtmlChart>

                        <%--Export button--%>
                        <telerik:RadButton ID="RadButton1" runat="server" OnClick="RadButton1_Click" Skin="Metro" Text="Export Table to Excel">
                        </telerik:RadButton>

                        <br />
                        <%--Table--%>
                        <telerik:RadGrid ID="RadGrid2" runat="server" AllowPaging="True" AllowSorting="True" OnExcelMLWorkBookCreated="RadGrid2_ExcelMLWorkBookCreated" DataSourceID="UniqueCustomersSeenBranchODC1" AllowFilteringByColumn="True">
                            <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                            <ExportSettings IgnorePaging="True">
                                <Pdf PaperSize="A4" DefaultFontFamily="Arial Unicode MS" PageTopMargin="45mm"
                                    BorderStyle="Medium" BorderColor="#666666" PageHeight="210mm" PageWidth="297mm">
                                </Pdf>
                                <Excel Format="Xlsx" />
                            </ExportSettings>
                            <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <MasterTableView AutoGenerateColumns="False" DataSourceID="UniqueCustomersSeenBranchODC1">
                                <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="false" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="Branch_Name" FilterControlAltText="Filter Branch_Name column" HeaderText="Branch" SortExpression="Branch_Name" UniqueName="Branch_Name">
                                        <FilterTemplate>
                                            <telerik:RadComboBox RenderMode="Lightweight" ID="RadComboBoxTitle" DataSourceID="BranchDropDownODS1" DataTextField="Branch_Name"
                                                DataValueField="Branch_Name" Width="200px" AppendDataBoundItems="true" SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("Branch_Name").CurrentFilterValue %>'
                                                runat="server" OnClientSelectedIndexChanged="TitleIndexChanged">
                                                <Items>
                                                    <telerik:RadComboBoxItem Text="All" />
                                                </Items>
                                            </telerik:RadComboBox>
                                            <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                                                <script type="text/javascript">
                                                    function TitleIndexChanged(sender, args) {
                                                        var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                                        tableView.filter("Branch_Name", args.get_item().get_value(), "EqualTo");
                                                    }
                                                </script>
                                            </telerik:RadScriptBlock>
                                        </FilterTemplate>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TimePeriod" AllowFiltering="false" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Number_of_Unique_Clients" AllowFiltering="false" DataType="System.Int32" FilterControlAltText="Filter Number_of_Unique_Clients column" HeaderText="Number of Unique Clients" SortExpression="Number_of_Unique_Clients" UniqueName="Number_of_Unique_Clients">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <%--Datasource--%>
                        <asp:ObjectDataSource ID="UniqueCustomersSeenBranchODC1" runat="server" SelectMethod="usp_UniqueCustomersSeenBranch" TypeName="Test.BLL.Customer.UniqueCustomersSeenBranchBL">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-30" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="BranchDDL1" DefaultValue="0" Name="branchRef" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                </div>
                <%--Display Number of Animals Seen Companywide--%>
                <div class="accordionable">
                    <div class="kpiheader">Number of Animals Seen Companywide</div>
                    <div class="chartcontainer">
                        <%--Chart--%>
                        <telerik:RadHtmlChart ID="AnimalsSeenComRHC1" runat="server" DataSourceID="AnimalsSeenComODS1" Skin="Vista">
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
                        <asp:ObjectDataSource ID="AnimalsSeenComODS1" runat="server" SelectMethod="usp_AnimalsSeenCom" TypeName="Test.BLL.Customer.AnimalsSeenComBL">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-30" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                </div>
                <%--Display Number of Animals Seen Branch Comparison--%>
                <div class="accordionable">
                    <div class="kpiheader">Number of Animals Seen Branch Comparison</div>
                    <div class="chartcontainer">
                        <%--Chart--%>
                        <telerik:RadHtmlChart ID="AnimalsSeenBranchRHC1" runat="server" Skin="Metro"></telerik:RadHtmlChart>
                        <%--Datasource--%>
                        <asp:ObjectDataSource ID="AnimalsSeenBranchODS1" runat="server" SelectMethod="usp_AnimalsSeenBranch" TypeName="Test.BLL.Customer.AnimalsSeenBranchBL">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-30" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="BranchDDL1" DefaultValue="0" Name="branchRef" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                </div>
                <%--This section is for Average dollar per customer companywide  chart--%>
                <div class="accordionable">
                    <div class="kpiheader">Average Dollar Earned per Customer Companywide</div>
                    <div class="chartcontainer">
                        <%--Chart--%>
                        <telerik:RadHtmlChart ID="AvgDollarPerCustomerComRHC1" runat="server" DataSourceID="AvgDollarPerCustomerComODS1" Skin="Metro">
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
                        <asp:ObjectDataSource ID="AvgDollarPerCustomerComODS1" runat="server" SelectMethod="usp_AvgDollarPerCustomerCom" TypeName="Test.BLL.Customer.AvgDollarPerCustomerComBL">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-30" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                </div>
                <%--This section is for Average dollar per customer branch comparison  chart--%>
                <div class="accordionable">
                    <div class="kpiheader">Average Dollar Earned per Customer Branch Comparison</div>
                    <div class="chartcontainer">
                        <%--Chart--%>
                        <telerik:RadHtmlChart ID="AvgDollarPerCustomerBranchRHC1" runat="server" Skin="Metro"></telerik:RadHtmlChart>

                    </div>
                </div>
                <%--This section is for Number of New Customers companywide  chart--%>
                <div class="accordionable">
                    <div class="kpiheader">Number of New Customers Companywide</div>
                    <div class="chartcontainer">
                        <%--Chart--%>
                        <telerik:RadHtmlChart ID="NewCustomersComRHC1" runat="server" DataSourceID="NewCustomersComODS1" Skin="Silk">
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
                        <asp:ObjectDataSource ID="NewCustomersComODS1" runat="server" SelectMethod="usp_NewCustomersCom" TypeName="Test.BLL.Customer.NewCustomersComBL">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-30" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                </div>
                <%--This section is for Number of Small Animals companywide  chart--%>
                <div class="accordionable">
                    <div class="kpiheader">Number of Small Animals Companywide</div>
                    <div class="chartcontainer">
                        <%--Chart--%>
                        <telerik:RadHtmlChart ID="SmallAnimalsComRHC1" runat="server" DataSourceID="SmallAnimalsComODS1" Skin="Material">
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
                        <asp:ObjectDataSource ID="SmallAnimalsComODS1" runat="server" SelectMethod="usp_SmallAnimalsCom" TypeName="Test.BLL.Customer.SmallAnimalsComBL">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                </div>
                <%--This section is for Number of Large Animals companywide  chart--%>
                <div class="accordionable">
                    <div class="kpiheader">Number of Large Animals Companywide</div>
                    <div class="chartcontainer">
                        <%--Chart--%>
                        <telerik:RadHtmlChart ID="LargeAnimalsComRHC1" runat="server" DataSourceID="LargeAnimalsComODS1">
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
                        <asp:ObjectDataSource ID="LargeAnimalsComODS1" runat="server" SelectMethod="usp_LargeAnimalsCom" TypeName="Test.BLL.Customer.LargeAnimalsComBL">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                </div>

            </div>

        </div>
    </form>
    <script>
        (function () {
            var demo = window.demo = {};

            demo.onRequestStart = function (sender, args) {
                if (args.get_eventTarget().indexOf("Button") >= 0) {
                    args.set_enableAjax(false);
                }
            }
        })();
    </script>
</asp:Content>
