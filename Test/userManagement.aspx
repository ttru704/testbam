<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="userManagement.aspx.cs" Inherits="Test.userManagement" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
    <div class="right_col" role="main">
        <%--<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="UserDDL1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="kpiG1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                        <telerik:AjaxUpdatedControl ControlID="SqlDataSource1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="KpiTypeDDL1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="kpiG1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                        <telerik:AjaxUpdatedControl ControlID="SqlDataSource1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>--%>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Metro"></telerik:RadAjaxLoadingPanel>
        <h2><%: Title %></h2>
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>

        <div class="form-horizontal">
            <h4>Manage Employee</h4>
            <hr />
        </div>
        <div class="form-horizontal">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <telerik:RadDropDownList ID="UserDDL1" AutoPostBack="true" OnSelectedIndexChanged="userDDL1_OnClientSelectedIndexChanged" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Ref_Number"></telerik:RadDropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:KPIConnectionString %>' SelectCommand="usp_UserDropDownList" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="4" Name="companyRef" Type="Int32"></asp:Parameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
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
                    <telerik:RadButton ID="Update" runat="server" Text="Update" OnClick="Update_Click"></telerik:RadButton>

                    <telerik:RadGrid runat="server" ID="kpiG1" CellSpacing="-1" GridLines="Both" CommandItemDisplay="TopAndBottom" DataSourceID="SqlDataSource1" OnSelectedCellChanged="kpiG1_SelectedCellChanged">
                        <ClientSettings EnablePostBackOnRowClick="false">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <MasterTableView EditMode="Batch" AutoGenerateColumns="False" CommandItemDisplay="TopAndBottom" DataSourceID="SqlDataSource1" ClientDataKeyNames="Kpi_For_Company">
                            <Columns>
                                <telerik:GridBoundColumn DataField="Kpi_For_Company" Display="false" HeaderText="Kpi Ref" SortExpression="Kpi_For_Company" UniqueName="Kpi_For_Company" ReadOnly="true" FilterControlAltText="Filter Kpi_For_Company column" DataType="System.Int64"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="KpiType" HeaderText="Kpi Type" SortExpression="KpiType" UniqueName="KpiType" FilterControlAltText="Filter KpiType column" ReadOnly="true"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Name" HeaderText="Name" SortExpression="Name" Display="true" UniqueName="Name" FilterControlAltText="Filter Name column" ReadOnly="true"></telerik:GridBoundColumn>
                                <%--<telerik:GridCheckBoxColumn  DataField="Viewable" HeaderText="Viewable" SortExpression="Viewable" UniqueName="Viewable" DataType="System.Boolean" FilterControlAltText="Filter Viewable column">
                        </telerik:GridCheckBoxColumn>--%>
                                <telerik:GridTemplateColumn DataField="Viewable" UniqueName="CheckBoxTemplateColumn">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="viewableCB" runat="server" Checked='<%# Eval("Viewable") %>' />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>

                        </MasterTableView>
                    </telerik:RadGrid>

                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:KPIConnectionString %>' SelectCommand="usp_KPIGrid" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="CompanyRef" DefaultValue="" Name="companyRef" Type="Int32"></asp:SessionParameter>

                            <asp:ControlParameter ControlID="UserDDL1" PropertyName="SelectedValue" Name="userRef" Type="String" DefaultValue=""></asp:ControlParameter>


                            <asp:ControlParameter ControlID="KpiTypeDDL1" PropertyName="SelectedValue" Name="kpiType" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
