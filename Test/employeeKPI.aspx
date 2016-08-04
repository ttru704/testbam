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
                        <telerik:AjaxUpdatedControl ControlID="CustomersSeenByEmpComRG1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="AnimalsSeenByEmpComRHC1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass="" />
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
                        <telerik:DropDownListItem Text="Monthly" Value="1" />
                        <telerik:DropDownListItem Text="Yearly" Value="2" Selected="true" />
                        <telerik:DropDownListItem Text="Weekly" Value="3" />
                    </Items>
                </telerik:RadDropDownList>
                <%--<asp:Button ID="Button1" runat="server" Text="View" OnClick="Button1_Click" />--%>
                <telerik:RadButton ID="Button1" runat="server" Text="View" OnClick="Button1_Click"></telerik:RadButton>
            </div>

            <br />

            <div class="col-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Number of Customers Seen By Employee</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                            <%--Export button--%>
                            <telerik:RadButton RenderMode="Lightweight" runat="server" OnClientClicked="exportRadHtmlChart" Text="Export to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                            <telerik:RadClientExportManager runat="server" ID="RadClientExportManager1">
                            </telerik:RadClientExportManager>
                            <%--Chart--%>
                            <telerik:RadHtmlChart ID="CustomersSeenByEmpComRHC1" runat="server" CssClass="MonthlyExport" Skin="Material">
                            </telerik:RadHtmlChart>
                            <%--Table--%>
                            <telerik:RadGrid ID="CustomersSeenByEmpComG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="CustomersSeenByEmpComODS1" ShowGroupPanel="True" Skin="Metro">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" DataSourceID="CustomersSeenByEmpComODS1">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Employee_Name" FilterControlAltText="Filter Employee_Name column" HeaderText="Employee" SortExpression="Employee" UniqueName="Employee_Name">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Number_Of_Customers_Seen_By_An_Employee" DataType="System.Int32" FilterControlAltText="Filter Number_Of_Customers_Seen_By_An_Employee column" HeaderText="Number of Customers Seen by an Employee" SortExpression="Number_Of_Customers_Seen_By_An_Employee" UniqueName="Number_Of_Customers_Seen_By_An_Employee">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                            <%--Datasource--%>
                            <asp:ObjectDataSource ID="CustomersSeenByEmpComODS1" runat="server" SelectMethod="usp_CustomersSeenByEmpCom" TypeName="Test.BLL.Productivity.CustomersSeenByEmpComBL">
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
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="">
                            <%--Chart--%>
                            <telerik:RadHtmlChart ID="AnimalsSeenByEmpComRHC1" runat="server" Skin="MetroTouch"></telerik:RadHtmlChart>
                            <%--Datasource--%>
                            <asp:ObjectDataSource ID="AnimalsSeenByEmpComODS1" runat="server" SelectMethod="usp_AnimalsSeenByEmpCom" TypeName="Test.BLL.Productivity.AnimalsSeenByEmpComBL">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-01-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-12-31" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="Company" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="TimeType" DefaultValue="2" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <%--Table--%>
                            <telerik:RadGrid ID="AnimalsSeenByEmpComG1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="AnimalsSeenByEmpComODS1" ShowGroupPanel="True" Skin="Metro">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" DataSourceID="AnimalsSeenByEmpComODS1">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Employee_Name" FilterControlAltText="Filter Employee_Name column" HeaderText="Employee" SortExpression="Employee Name" UniqueName="Employee_Name">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TimePeriod" FilterControlAltText="Filter TimePeriod column" HeaderText="Time Period" SortExpression="TimePeriod" UniqueName="TimePeriod">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Number_Of_Animals_Seen_By_An_Employee" DataType="System.Int32" FilterControlAltText="Filter Number_Of_Animals_Seen_By_An_Employee column" HeaderText="Number of Animals Seen by an Employee" SortExpression="Number_Of_Animals_Seen_By_An_Employee" UniqueName="Number_Of_Animals_Seen_By_An_Employee">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>
    <script>
        var $ = $telerik.$;

        function exportRadHtmlChart() {
            $find('<%=RadClientExportManager1.ClientID%>').exportPDF($(".MonthlyExport"));
        };



    </script>
</asp:Content>
