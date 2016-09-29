<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="userManagement.aspx.cs" Inherits="Test.userManagement" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="kpiNameHeader" runat="Server">
    <header style="padding: inherit; margin-top: 15px">
        <h3>User Management</h3>
    </header>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
    <div class="right_col" role="main">
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
            <telerik:RadButton ID="Update" runat="server" Text="Update" OnClick="Update_Click" Skin="Silk"></telerik:RadButton>
            <br />
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <span style="height: 300px">
                        <asp:Label runat="server" Text="User:" Width="70"></asp:Label>
                        <telerik:RadDropDownList ID="UserDDL1" AutoPostBack="true" OnSelectedIndexChanged="userDDL1_OnClientSelectedIndexChanged" runat="server" DataSourceID="UserODS1" DataTextField="Name" DataValueField="Ref_Number" Skin="Silk" Width="300px"></telerik:RadDropDownList>

                        <asp:ObjectDataSource ID="UserODS1" runat="server" SelectMethod="usp_UserDropDownList" TypeName="Test.BLL.Controls.UserDropDownListBL">
                            <SelectParameters>
                                <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </span>
                    <br />
                    <span style="height: 300px">
                        <asp:Label runat="server" Text="KPI Type:" Width="70"></asp:Label>
                        <telerik:RadComboBox ID="KpiTypeDDL1" runat="server" AutoPostBack="true" DataSourceID="KpiTypeODS1" Width="300px"
                            DataTextField="Name" DataValueField="Ref_Number"
                            AppendDataBoundItems="true" Skin="Silk">
                            <Items>
                                <telerik:RadComboBoxItem Text="All" Value="0" Selected="true"></telerik:RadComboBoxItem>
                            </Items>
                        </telerik:RadComboBox>
                        <asp:ObjectDataSource ID="KpiTypeODS1" runat="server" SelectMethod="usp_GetKpiTypes" TypeName="Test.BLL.Controls.GetKpiTypesBL"></asp:ObjectDataSource>
                    </span>
                    <br />
                    <telerik:RadGrid runat="server" ID="kpiG1" CellSpacing="-1" GridLines="Both" DataSourceID="KPIGridODS1" OnSelectedCellChanged="kpiG1_SelectedCellChanged" Skin="MetroTouch">
                        <ClientSettings EnablePostBackOnRowClick="false">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <MasterTableView EditMode="Batch" AutoGenerateColumns="False" CommandItemDisplay="None" DataSourceID="KPIGridODS1" ClientDataKeyNames="Kpi_For_Company">
                            <Columns>
                                <telerik:GridBoundColumn DataField="KpiType" HeaderText="Kpi Type" SortExpression="KpiType" UniqueName="KpiType" FilterControlAltText="Filter KpiType column" ReadOnly="true"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Name" HeaderText="Name" SortExpression="Name" UniqueName="Name" FilterControlAltText="Filter Name column" ReadOnly="true"></telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn DataField="Viewable" HeaderText="Viewable" UniqueName="CheckBoxTemplateColumn">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="viewableCB" runat="server" Checked='<%# Eval("Viewable") %>' />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                            </Columns>

                        </MasterTableView>
                    </telerik:RadGrid>


                    <asp:ObjectDataSource ID="KPIGridODS1" runat="server" SelectMethod="usp_KPIGrid" TypeName="Test.BLL.Controls.KPIGridBL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int32"></asp:SessionParameter>
                            <asp:ControlParameter ControlID="UserDDL1" PropertyName="SelectedValue" Name="userRef" Type="String"></asp:ControlParameter>
                            <asp:ControlParameter ControlID="KpiTypeDDL1" PropertyName="SelectedValue" Name="kpiType" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
