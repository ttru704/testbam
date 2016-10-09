<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="companyKpis.aspx.cs" Inherits="Test.companyKpis" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="pageHeader" runat="Server">
    <header style="padding: inherit; margin-top: 15px">
        <h3>Company KPIs</h3>
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
            <h4>Assign KPIs to Manager</h4>
            <hr />
        </div>
        <div class="form-horizontal">
            <telerik:RadButton ID="Update" runat="server" OnClick="Update_Click" Text="Update" Skin="Silk"></telerik:RadButton>
            <br />
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <span style="height: 300px">
                        <asp:Label runat="server" Text="Company:" Width="70"></asp:Label>
                        <telerik:RadComboBox ID="CompanyListCB1" runat="server" AutoPostBack="true" DataSourceID="CompanyListODS1" Width="300px"
                            DataTextField="Name" DataValueField="Ref_Number" Skin="Silk">
                        </telerik:RadComboBox>
                        <asp:ObjectDataSource ID="CompanyListODS1" runat="server" SelectMethod="usp_CompanyList" TypeName="Test.BLL.Controls.CompanyListBL"></asp:ObjectDataSource>
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
                    <telerik:RadGrid runat="server" ID="kpiG1" CellSpacing="-1" GridLines="Both" DataSourceID="KPIListForCompanyODS1" Skin="MetroTouch">
                        <ClientSettings EnablePostBackOnRowClick="false">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <MasterTableView EditMode="Batch" AutoGenerateColumns="False" CommandItemDisplay="None" DataSourceID="KPIListForCompanyODS1" ClientDataKeyNames="Kpi_For_Business">
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


                    <asp:ObjectDataSource ID="KPIListForCompanyODS1" runat="server" SelectMethod="usp_KPIListForCompany" TypeName="Test.BLL.Controls.KPIListForCompanyBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="CompanyListCB1" PropertyName="SelectedValue" Name="companyRef" Type="Int64"></asp:ControlParameter>
                            <asp:Parameter DefaultValue="1" Name="businessType" Type="Int64"></asp:Parameter>
                            <asp:ControlParameter ControlID="KpiTypeDDL1" PropertyName="SelectedValue" Name="kpiType" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
