<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CBranchCS.ascx.cs" Inherits="Test.CBranchCS" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<div class="demo-container size-thin">
    <%--This export manager is for all the KPI charts--%>
    <telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"></telerik:RadClientExportManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Metro"></telerik:RadAjaxLoadingPanel>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="BranchCB1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="BranchCB1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="i1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="i2" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="i3" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="i4" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="i5" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="i6" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadPanelBar RenderMode="Lightweight" runat="server" ID="RadPanelBar1" Width="100%" Skin="MetroTouch">
        <Items>
            <telerik:RadPanelItem Width="100%" Height="30">
                <ContentTemplate>
                    <%--Label for branch combo box--%>
                    <asp:Label ID="BranchCBLabel" runat="server" Text="Select your branch: "></asp:Label>
                    <%--Combobox for branch--%>
                    <telerik:RadComboBox RenderMode="Lightweight" ID="BranchCB1" DataTextField="Branch_Name" DataValueField="Ref_Number" runat="server" Width="186px" CssClass="Display:none"
                        AutoPostBack="true" EmptyMessage="- Select a Branch -" DataSourceID="BranchDropDownODS1"
                        Skin="Metro" AppendDataBoundItems="true">
                        <Items>
                            <telerik:RadComboBoxItem Value="0" Text="All Branches" Selected="true" />
                        </Items>
                    </telerik:RadComboBox>
                    <%--Objectdatasource for branch combo box--%>
                    <asp:ObjectDataSource ID="BranchDropDownODS1" runat="server" SelectMethod="usp_BranchDropDownList" TypeName="Test.BLL.Controls.BranchDropDownListBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="CompanyRef" DefaultValue="" Name="companyRef" Type="Int32"></asp:SessionParameter>

                        </SelectParameters>
                    </asp:ObjectDataSource>
                </ContentTemplate>
            </telerik:RadPanelItem>
        </Items>
        <Items>
            <%--Display Number of Unique Customers Seen branch comparison--%>
            <telerik:RadPanelItem Text="Number of Unique Customers Seen - Branch Comparison" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <div class="export">
                        <telerik:RadButton ID="UniqueCustomersSeenBranchEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportUniqueCustomersSeenBranchRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <telerik:RadHtmlChart ID="UniqueCustomersSeenBranchRHC1" runat="server" Skin="Material">
                            <ClientEvents OnLoad="formatUniqueCustomersSeenBranchRHC1" />
                            <Pan Enabled="true" Lock="Y" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="Y" />
                                <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                            </Zoom>
                            <ChartTitle Text="Number of Unique Clients Seen">
                            </ChartTitle>
                        </telerik:RadHtmlChart>
                    </div>

                    <br />
                    <%--Table--%>
                    <br />
                    <br />
                    <telerik:RadGrid ID="RadGrid2" runat="server" OnItemCommand="ExportGridCustomiser" AllowPaging="True" AllowSorting="True" OnExcelMLWorkBookCreated="RadGrid2_ExcelMLWorkBookCreated" DataSourceID="UniqueCustomersSeenBranchODC1" AllowFilteringByColumn="True" CellSpacing="-1" GridLines="Both" ShowGroupPanel="True" Skin="MetroTouch">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True" AllowDragToGroup="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView AutoGenerateColumns="False" Width="100%" CommandItemDisplay="Top" DataSourceID="UniqueCustomersSeenBranchODC1">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="Branch_Name" FilterControlAltText="Filter Branch_Name column" HeaderText="Branch" SortExpression="Branch_Name" UniqueName="Branch_Name">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TimePeriod" AllowFiltering="false" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Number_of_Unique_Clients" DataFormatString="{0:N0}" AllowFiltering="false" DataType="System.Int32" FilterControlAltText="Filter Number_of_Unique_Clients column" HeaderText="Number of Unique Clients" SortExpression="Number_of_Unique_Clients" UniqueName="Number_of_Unique_Clients">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="UniqueCustomersSeenBranchODC1" runat="server" SelectMethod="usp_UniqueCustomersSeenBranch" TypeName="Test.BLL.Customer.UniqueCustomersSeenBranchBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-30" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="BranchRef" Name="branchRef" Type="Int64"></asp:SessionParameter>

                            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>

                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--Display Number of Animals Seen Branch Comparison--%>
            <telerik:RadPanelItem Text="Number of Animals Seen - Branch Comparison" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <div class="export">
                        <telerik:RadButton ID="AnimalsSeenBranchEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportAnimalsSeenBranchRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <telerik:RadHtmlChart ID="AnimalsSeenBranchRHC1" runat="server" Skin="Metro">
                            <ClientEvents OnLoad="formatAnimalsSeenBranchRHC1" />
                            <Pan Enabled="true" Lock="Y" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="Y" />
                                <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                            </Zoom>
                        </telerik:RadHtmlChart>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="AnimalsSeenBranchODS1" runat="server" SelectMethod="usp_AnimalsSeenBranch" TypeName="Test.BLL.Customer.AnimalsSeenBranchBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-30" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="BranchRef" Name="branchRef" Type="Int64"></asp:SessionParameter>

                            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <br />
                    <br />
                    <telerik:RadGrid ID="AnimalsSeenBranchG1" OnItemCommand="ExportGridCustomiser" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="AnimalsSeenBranchODS1" ShowGroupPanel="True" Skin="MetroTouch" CellSpacing="-1" GridLines="Both">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView AutoGenerateColumns="False" Width="100%" CommandItemDisplay="Top" DataSourceID="AnimalsSeenBranchODS1">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="Branch_Name" FilterControlAltText="Filter Branch_Name column" HeaderText="Branch" SortExpression="Branch_Name" UniqueName="Branch_Name">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Number_of_animals_seen" DataFormatString="{0:N0}" DataType="System.Int32" FilterControlAltText="Filter Number_of_animals_seen column" HeaderText="Number of Animals Seen" SortExpression="Number_of_animals_seen" UniqueName="Number_of_animals_seen">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--Display Average dollar per customer branch comparison--%>
            <telerik:RadPanelItem Text="Average Dollar per Customer - Branch Comparison" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <div class="export">
                        <telerik:RadButton ID="AvgDollarPerCustomerBranchEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportAvgDollarPerCustomerBranchRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <telerik:RadHtmlChart ID="AvgDollarPerCustomerBranchRHC1" runat="server" Skin="Metro">
                            <ClientEvents OnLoad="formatAvgDollarPerCustomerBranchRHC1" />
                            <Pan Enabled="true" Lock="Y" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="Y" />
                                <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                            </Zoom>
                        </telerik:RadHtmlChart>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="AvgDollarPerCustomerBranchODS1" runat="server" SelectMethod="usp_AvgDollarPerCustomerBranch" TypeName="Test.BLL.Customer.AvgDollarPerCustomerBranchBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="BranchRef" Name="branchRef" Type="Int64"></asp:SessionParameter>

                            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <telerik:RadGrid ID="AvgDollarPerCustomerBranchG1" runat="server" OnItemCommand="ExportGridCustomiser" AllowPaging="True" AllowSorting="True" DataSourceID="AvgDollarPerCustomerBranchODS1" ShowGroupPanel="True" Skin="MetroTouch" CellSpacing="-1" GridLines="Both">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView AutoGenerateColumns="False" Width="100%" CommandItemDisplay="Top" DataSourceID="AvgDollarPerCustomerBranchODS1">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="Branch_Name" FilterControlAltText="Filter Branch_Name column" HeaderText="Branch" SortExpression="Branch_Name" UniqueName="Branch_Name">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Average_Dollar_per_customer" DataFormatString="{0:N0}" DataType="System.Decimal" FilterControlAltText="Filter Average_Dollar_per_customer column" HeaderText="Average Dollar per Customer" SortExpression="Average_Dollar_per_customer" UniqueName="Average_Dollar_per_customer">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Number of New Customers Branch Comparison--%>
            <telerik:RadPanelItem Text="Number of New Customers - Branch Comparison" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <div class="export">
                        <telerik:RadButton ID="NewCustomersBranchEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportNewCustomersBranchRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                        <telerik:RadHtmlChart ID="NewCustomersBranchRHC1" runat="server">
                            <ClientEvents OnLoad="formatNewCustomersBranchRHC1" />
                            <Pan Enabled="true" Lock="Y" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="Y" />
                                <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                            </Zoom>
                        </telerik:RadHtmlChart>
                    </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="NewCustomersBranchODS1" runat="server" SelectMethod="usp_NewCustomersBranch" TypeName="Test.BLL.Customer.NewCustomersBranchBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="BranchRef" Name="branchRef" Type="Int64"></asp:SessionParameter>

                            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <br />
                    <br />
                    <telerik:RadGrid ID="NewCustomersBranchG1" runat="server" OnItemCommand="ExportGridCustomiser" AllowPaging="True" AllowSorting="True" DataSourceID="NewCustomersBranchODS1" ShowGroupPanel="True" CellSpacing="-1" GridLines="Both">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView AutoGenerateColumns="False" Width="100%" CommandItemDisplay="Top" DataSourceID="NewCustomersBranchODS1">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="Branch_Name" FilterControlAltText="Filter Branch_Name column" HeaderText="Branch Name" SortExpression="Branch_Name" UniqueName="Branch_Name">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Number_of_New_Customers" DataFormatString="{0:N0}" DataType="System.Decimal" FilterControlAltText="Filter Number_of_New_Customers column" HeaderText="Number of New Customers" SortExpression="Number_of_New_Customers" UniqueName="Number_of_New_Customers">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Number of Small Animals branch comparison  chart--%>
            <telerik:RadPanelItem Text="Number of Small Animals - Branch Comparison" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <div class="export">
                        <telerik:RadButton ID="SmallAnimalsBranchEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportSmallAnimalsBranchRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                    <telerik:RadHtmlChart ID="SmallAnimalsBranchRHC1" runat="server" Skin="Material">
                        <ClientEvents OnLoad="formatSmallAnimalsBranchRHC1" />
                        <Pan Enabled="true" Lock="Y" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="Y" />
                                <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                            </Zoom>
                    </telerik:RadHtmlChart>
                        </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="SmallAnimalsBranchODS1" runat="server" SelectMethod="usp_SmallAnimalsBranch" TypeName="Test.BLL.Customer.SmallAnimalsBranchBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="BranchRef" Name="branchRef" Type="Int64"></asp:SessionParameter>

                            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <br />
                    <br />
                    <telerik:RadGrid ID="SmallAnimalsBranchG1" runat="server" OnItemCommand="ExportGridCustomiser" AllowPaging="True" AllowSorting="True" DataSourceID="SmallAnimalsBranchODS1" ShowGroupPanel="True" Skin="MetroTouch" CellSpacing="-1" GridLines="Both">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView AutoGenerateColumns="False" Width="100%" CommandItemDisplay="Top" DataSourceID="SmallAnimalsBranchODS1">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="Branch_Name" FilterControlAltText="Filter Branch_Name column" HeaderText="Branch" SortExpression="Branch_Name" UniqueName="Branch_Name">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Number_of_Small_Animals" DataFormatString="{0:N0}" DataType="System.Decimal" FilterControlAltText="Filter Number_of_Small_Animals column" HeaderText="Number of Small Animals" SortExpression="Number_of_Small_Animals" UniqueName="Number_of_Small_Animals">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </telerik:RadPanelItem>
            <%--This section is for Number of Large Animals branch comparison  chart--%>
            <telerik:RadPanelItem Text="Number of Large Animals - Branch Comparison" Visible="false" Expanded="false">
                <ContentTemplate>
                    <%--Chart--%>
                    <div class="export">
                        <telerik:RadButton ID="LargeAnimalsBranchEB" RenderMode="Lightweight" CssClass="ExportButton" runat="server" OnClientClicked="exportLargeAnimalsBranchRHC1" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                    <telerik:RadHtmlChart ID="LargeAnimalsBranchRHC1" runat="server" Skin="Material">
                        <ClientEvents OnLoad="formatLargeAnimalsBranchRHC1" />
                        <Pan Enabled="true" Lock="Y" />
                            <Zoom Enabled="true">
                                <MouseWheel Enabled="true" Lock="Y" />
                                <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                            </Zoom>
                    </telerik:RadHtmlChart>
                        </div>
                    <%--Datasource--%>
                    <asp:ObjectDataSource ID="LargeAnimalsBranchODS1" runat="server" SelectMethod="usp_LargeAnimalsBranch" TypeName="Test.BLL.Customer.LargeAnimalsBranchBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            <asp:SessionParameter SessionField="BranchRef" Name="branchRef" Type="Int64"></asp:SessionParameter>

                            <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--Table--%>
                    <br />
                    <br />
                    <telerik:RadGrid ID="LargeAnimalsBranchG1" runat="server" OnItemCommand="ExportGridCustomiser" AllowPaging="True" AllowSorting="True" DataSourceID="LargeAnimalsBranchODS1" ShowGroupPanel="True" Skin="MetroTouch" CellSpacing="-1" GridLines="Both">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <ExportSettings HideStructureColumns="true"></ExportSettings>
                        <MasterTableView AutoGenerateColumns="False" Width="100%" CommandItemDisplay="Top" DataSourceID="LargeAnimalsBranchODS1">
                            <CommandItemSettings ShowPrintButton="true" ShowExportToWordButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowAddNewRecordButton="False" ShowRefreshButton="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="Branch_Name" FilterControlAltText="Filter Branch_Name column" HeaderText="Branch" SortExpression="Branch_Name" UniqueName="Branch_Name">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Number_of_Large_Animals" DataFormatString="{0:N0}" DataType="System.Decimal" FilterControlAltText="Filter Number_of_Large_Animals column" HeaderText="Number of Large Animals" SortExpression="Number_of_Large_Animals" UniqueName="Number_of_Large_Animals">
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
<telerik:RadScriptBlock runat="server">
    <script>

        //Without this hide export button would not work
        var $ = $telerik.$;

        //For chart exporting
        function exportUniqueCustomersSeenBranchRHC1(sender, args) {
            exportRadHtmlChart('<%=UniqueCustomersSeenBranchRHC1.ClientID%>')
        }

        function exportAnimalsSeenBranchRHC1(sender, args) {
            exportRadHtmlChart('<%=AnimalsSeenBranchRHC1.ClientID%>')
        }

        function exportAvgDollarPerCustomerBranchRHC1(sender, args) {
            exportRadHtmlChart('<%=AvgDollarPerCustomerBranchRHC1.ClientID%>')
        }

        function exportNewCustomersBranchRHC1(sender, args) {
            exportRadHtmlChart('<%=NewCustomersBranchRHC1.ClientID%>')
        }

        function exportSmallAnimalsBranchRHC1(sender, args) {
            exportRadHtmlChart('<%=SmallAnimalsBranchRHC1.ClientID%>')
        }

        function exportLargeAnimalsBranchRHC1(sender, args) {
            exportRadHtmlChart('<%=LargeAnimalsBranchRHC1.ClientID%>')
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
        <%--For panning and zooming--%>

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
    <%--For responsive chart--%>

        //format Y axis value based on value
        function formatUniqueCustomersSeenBranchRHC1() {
            var chart1 = $find("<%=UniqueCustomersSeenBranchRHC1.ClientID%>");
            chart1.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart1.repaint();
        };

        function formatAnimalsSeenBranchRHC1() {
            var chart2 = $find("<%=AnimalsSeenBranchRHC1.ClientID%>");
        chart2.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
        chart2.repaint();
        };

        function formatAvgDollarPerCustomerBranchRHC1() {
            var chart3 = $find("<%=AvgDollarPerCustomerBranchRHC1.ClientID%>");
        chart3.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
        chart3.repaint();
        };

        function formatNewCustomersBranchRHC1() {
            var chart4 = $find("<%=NewCustomersBranchRHC1.ClientID%>");
            chart4.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
            chart4.repaint();
        };

        function formatSmallAnimalsBranchRHC1() {
            var chart5 = $find("<%=SmallAnimalsBranchRHC1.ClientID%>");
        chart5.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
        chart5.repaint();
        };

        function formatLargeAnimalsBranchRHC1() {
            var chart6 = $find("<%=LargeAnimalsBranchRHC1.ClientID%>");
        chart6.get_kendoWidget().options.valueAxis.labels.template = "#if(value <= 999) {# #=value# #}   else if (value >= 1000 && value <= 999999){# #=value / 1000#K #} else if(value >= 1000000 && value <= 999999999) {# #=value / 1000000#M #}  else if(value >= 1000000000 && value <= 999999999999) {# #=value / 1000000000#B #}#";
        chart6.repaint();
        };

    </script>
</telerik:RadScriptBlock>
