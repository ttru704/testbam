<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="employeeKPI.aspx.cs" Inherits="Test.employeekpi" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="Button1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="CustomersSeenByEmpComRHC1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="AnimalsSeenByEmpComRHC1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="AnimalsSeenIndustryRHC1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <div class="right_col" role="main">
            <%--KPI menu--%>
            <div id="KPIMenu" style="text-align: center">
                <a href="/financialKPI.aspx" style="font-size: 20px"><strong>Financial</strong></a>
                <strong>|</strong>
                <a href="/employeekpi.aspx" style="font-size: 20px"><strong>Employee</strong></a>
                <strong>|</strong>
                <a href="/customerkpi.aspx" style="font-size: 20px"><strong>Customer</strong></a>
                <br />
                <br />
            </div>
            <br />
            <%--Datepickers and input--%>
            <div class="text-center">
                <telerik:RadDatePicker ID="DatePicker1" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-01-01" SelectedDate="2015-01-01" Height="24px" Width="197px">
                    <DatePopupButton
                        CssClass="rcCalPopup"
                        Width="2em" />
                </telerik:RadDatePicker>
                <telerik:RadDatePicker ID="DatePicker2" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-12-31" SelectedDate="2015-12-31" Height="24px" Width="197px">
                    <DatePopupButton
                        CssClass="rcCalPopup"
                        Width="2em" />
                </telerik:RadDatePicker>
                <asp:DropDownList ID="Company" runat="server" Width="100px" Visible="false">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                </asp:DropDownList>
                <%--<asp:DropDownList ID="Branch" runat="server" AutoPostBack="True" DataTextField="Branch_Ref" DataValueField="Branch_Ref" Width="100px">
                    <asp:ListItem Value="0">All Branches</asp:ListItem>
                </asp:DropDownList>--%>
                <telerik:RadDropDownList ID="Branch" runat="server" Height="24px" Width="197px">
                    <Items>
                        <telerik:DropDownListItem Text="All Branches" Value="0" />
                    </Items>
                </telerik:RadDropDownList>
                <%--<asp:DropDownList ID="TimeType" runat="server" Width="100px">
                    <asp:ListItem Value="1"> Monthly </asp:ListItem>
                    <asp:ListItem Value="2" Selected="True"> Yearly </asp:ListItem>
                </asp:DropDownList>--%>
                <telerik:RadDropDownList ID="TimeType" runat="server" Height="24px" Width="197px">
                    <Items>
                        <telerik:DropDownListItem Text="Weekly" Value="3" />
                        <telerik:DropDownListItem Text="Monthly" Value="1" />
                        <telerik:DropDownListItem Text="Yearly" Value="2" Selected="true" />

                    </Items>
                </telerik:RadDropDownList>
                <%--<asp:Button ID="Button1" runat="server" Text="View" OnClick="Button1_Click" />--%>
                <telerik:RadButton ID="Button1" runat="server" Text="View" OnClick="Button1_Click"></telerik:RadButton>
            </div>

            <br />
            <%--KPIs--%>
            <div class="col-12">
                <div class="x_panel" style="width: 100%">
                    <div class="x_title">
                        <h2>Number of Customers Seen By Employee</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up" OnClick="redraw"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content" style="width: 100%">
                        <div class="" style="width:100%">
                            <%--Export button--%>
                            <telerik:RadButton RenderMode="Lightweight" runat="server" OnClientClicked="exportRadHtmlChart" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                            <telerik:RadClientExportManager runat="server" ID="RadClientExportManager1">
                            </telerik:RadClientExportManager>
                            <%--Chart--%>
                            <telerik:RadHtmlChart ID="CustomersSeenByEmployeeCompanyRHC1" Width="100%" class="chart" runat="server" CssClass="MonthlyExport" Skin="Material">
                            </telerik:RadHtmlChart>
                            <%--Table--%>
                            <telerik:RadGrid ID="CustomersSeenByEmployeeCompanyG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="CustomersSeenByEmployeeCompanyODS1" ShowGroupPanel="True" Skin="Metro">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" DataSourceID="CustomersSeenByEmployeeCompanyODS1">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Employee_Name" FilterControlAltText="Filter Employee_Name column" HeaderText="Employee" SortExpression="Employee_Name" UniqueName="Employee_Name">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Number_Of_Customers_Seen_By_An_Employee" DataType="System.Int32" FilterControlAltText="Filter Number_Of_Customers_Seen_By_An_Employee column" HeaderText="Number Of Customers Seen" SortExpression="Number_Of_Customers_Seen_By_An_Employee" UniqueName="Number_Of_Customers_Seen_By_An_Employee">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                            <%--Datasource--%>
                            <asp:ObjectDataSource ID="CustomersSeenByEmployeeCompanyODS1" runat="server" SelectMethod="usp_CustomersSeenByEmployeeCompany" TypeName="Test.BLL.Productivity.CustomersSeenByEmployeeCompanyBL">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-01-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-12-31" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="Company" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="TimeType" DefaultValue="2" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Number of Animal Seen By Employee</h2>
                        <ul class="nav navbar-right panel_toolbox" OnClick="redraw">
                            <li OnClick="redraw"><a class="collapse-link" OnClick="redraw"><i class="fa fa-chevron-up" OnClick="redraw"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                            <%--Chart--%>
                            <telerik:RadHtmlChart ID="AnimalsSeenByEmployeeCompanyRHC1" runat="server" Skin="MetroTouch"></telerik:RadHtmlChart>
                            <%--Datasource--%>
                            <asp:ObjectDataSource ID="AnimalsSeenByEmployeeCompanyODS1" runat="server" SelectMethod="usp_AnimalsSeenByEmployeeCompany" TypeName="Test.BLL.Productivity.AnimalsSeenByEmployeeCompanyBL">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-01-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-12-31" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="Company" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="TimeType" DefaultValue="2" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <%--Table--%>
                            <telerik:RadGrid ID="AnimalsSeenByEmployeeCompanyG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="AnimalsSeenByEmployeeCompanyODS1" ShowGroupPanel="True" Skin="Metro">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" DataSourceID="AnimalsSeenByEmployeeCompanyODS1">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Employee_Name" FilterControlAltText="Filter Employee_Name column" HeaderText="Employee" SortExpression="Employee_Name" UniqueName="Employee_Name">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Number_Of_Animals_Seen_By_An_Employee" DataType="System.Int32" FilterControlAltText="Filter Number_Of_Animals_Seen_By_An_Employee column" HeaderText="Number of Animals Seen" SortExpression="Number_Of_Animals_Seen_By_An_Employee" UniqueName="Number_Of_Animals_Seen_By_An_Employee">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </div>
                    </div>
                </div>
            </div>

            <telerik:RadHtmlChart ID="AnimalsSeenIndustryRHC1" runat="server"></telerik:RadHtmlChart>

        </div>
    </form>
    <script>
        var $ = $telerik.$;

        function exportRadHtmlChart() {
            $find('<%=RadClientExportManager1.ClientID%>').exportPDF($(".MonthlyExport"));
        };

        //$("#CustomersSeenByEmpComRHC1").data("RadHtmlChart").options.transitions = false;
        //var redraw = $(".chart").data("RadHtmlChart").redraw();
        //$("#CustomersSeenByEmpComRHC1").data("RadHtmlChart").options.transitions = true;

<%--        function redraw() {
            console.log("its working");
            $telerik.$("<%=AnimalsSeenByEmpComRHC1.ClientID%>").data("kendoChart").redraw();
            
        }--%>
    </script>
</asp:Content>
