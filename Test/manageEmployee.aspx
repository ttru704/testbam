<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="manageEmployee.aspx.cs" Inherits="Test.manageEmployee" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">

        <div class="right_col" role="main">
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="KpiTypeDDL1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="kpiG1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
            <h2><%: Title %>.</h2>
            <p class="text-danger">
                <asp:Literal runat="server" ID="ErrorMessage" />
            </p>

            <div class="form-horizontal">
                <h4>Manage Employee</h4>
                <hr />
            </div>
            <div class="form-horizontal">
                <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
                <telerik:RadDropDownList ID="UserDDL1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Ref_Number"></telerik:RadDropDownList>
                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:KPIConnectionString %>' SelectCommand="select Name,
	   Ref_Number
from User_Profile"></asp:SqlDataSource>
                <telerik:RadComboBox ID="KpiTypeDDL1" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource3" Width="300px"
                    DataTextField="Name" DataValueField="Ref_Number"
                    AppendDataBoundItems="true">
                    <Items>
                        <telerik:RadComboBoxItem Text="All" Value="0" Selected="true"></telerik:RadComboBoxItem>
                    </Items>
                </telerik:RadComboBox>
                <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:KPIConnectionString %>' SelectCommand="select Name,
       Ref_Number
from KPI_Types"></asp:SqlDataSource>
                <telerik:RadGrid runat="server" ID="kpiG1" CellSpacing="-1" DataSourceID="SqlDataSource1" GridLines="Both" CommandItemDisplay="TopAndBottom">

                    <MasterTableView DataKeyNames="Ref_Number" DataSourceID="SqlDataSource1" EditMode="Batch" AutoGenerateColumns="False" CommandItemDisplay="TopAndBottom">
                        <CommandItemSettings ShowSaveChangesButton="True" ShowAddNewRecordButton="false"></CommandItemSettings>
                        
                        <Columns>
                            <telerik:GridBoundColumn DataField="Type" HeaderText="Type" SortExpression="Type" UniqueName="Type" FilterControlAltText="Filter Type column" ReadOnly="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Name" HeaderText="Name" SortExpression="Name" UniqueName="Name" FilterControlAltText="Filter Name column" ReadOnly="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Description" HeaderText="Description" SortExpression="Description" UniqueName="Description" FilterControlAltText="Filter Description column" ReadOnly="true"></telerik:GridBoundColumn>

                            <telerik:GridCheckBoxColumn DataField="Viewable" HeaderStyle-Width="80px" HeaderText="Viewable" SortExpression="Viewable"
                                UniqueName="Viewable" FilterControlAltText="Filter Viewable column" ReadOnly="false">
                            </telerik:GridCheckBoxColumn>
                            <%--                            Trying to make the checkboxes editable on first click
                            <telerik:GridTemplateColumn>
                                <ItemTemplate>
                                    <input id="Checkbox" type="checkbox" checked='<%# Eval("Ref_Number") %>' onclick="changeEditor(this);"  />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:CheckBox ID ="Checkbox1" runat="server" Checked='<%# Bind("Ref_Number") %>' />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>--%>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>

                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:KPIConnectionString %>' SelectCommand="usp_KPIGrid" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="companyRef" Type="Int32"></asp:Parameter>
                        <asp:ControlParameter ControlID="KpiTypeDDL1" PropertyName="SelectedValue" Name="kpiType" Type="Int32"></asp:ControlParameter>


                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </form>
</asp:Content>
