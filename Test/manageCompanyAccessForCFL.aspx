<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="manageCompanyAccessForCFL.aspx.cs" Inherits="Test.manageCompanyAccessForCFL" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="pageHeader" runat="Server">
    <header style="padding: inherit; margin-top: 15px">
        <h3>Manage Company Access</h3>
    </header>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="Update">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="GetCompanyAccessDetailG1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Metro"></telerik:RadAjaxLoadingPanel>
    <div class="right_col" role="main">
        <h2>Title .</h2>
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
        <br />
        <div class="form-horizontal">
            <h4>Manage the user access</h4>
            <hr />
            <%--Notify user if an account has been successfully created--%>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Label ID="Message" runat="server"></asp:Label>
                </div>
            </div>

            <%--Company dropdownlist--%>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="CompanyDDL1" CssClass="col-md-2 control-label">Company:  </asp:Label>
                <div class="col-md-10">
                    <telerik:RadDropDownList ID="CompanyDDL1"  DataTextField="Name" DataValueField="Ref_Number" runat="server" DataSourceID="CompanyListODS1" Width="300px" AutoPostBack="false" Skin="Silk"></telerik:RadDropDownList>
                        <asp:ObjectDataSource ID="CompanyListODS1" runat="server" SelectMethod="usp_CompanyList" TypeName="Test.BLL.Controls.CompanyListBL"></asp:ObjectDataSource>
                </div>
            </div>

            <%--Datepicker for the start date of the period that the company has access to BAM--%>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="StartDate" CssClass="col-md-2 control-label">Start Date </asp:Label>
                <div class="col-md-10">
                    <telerik:RadDatePicker ID="StartDate" runat="server" Height="24px" Width="120px" Skin="Metro">
                        <DatePopupButton
                    CssClass="rcCalPopup"
                    Width="2em" />
                    </telerik:RadDatePicker>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="StartDate"
                        CssClass="text-danger" ErrorMessage="The Name field is required." />
                </div>
            </div>

            <%--Datepicker for the end date of the period that end user has access to BAM--%>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="EndDate" CssClass="col-md-2 control-label">End Date </asp:Label>
                <div class="col-md-10">
                    <telerik:RadDatePicker ID="EndDate" runat="server" Height="24px" Width="120px" Skin="Metro">
                        <DatePopupButton
                    CssClass="rcCalPopup"
                    Width="2em" />
                    </telerik:RadDatePicker>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="EndDate"
                        CssClass="text-danger" ErrorMessage="The Name field is required." />
                </div>
            </div>

            <%--Submit changes to the database thru the Onclick event--%>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <telerik:RadButton ID="Update" runat="server" OnClick="Update_Click" Skin="Metro" Text="Update"></telerik:RadButton>
                </div>
            </div>

            <div class="form-horizontal">
                <telerik:RadGrid ID="GetCompanyAccessDetailG1" runat="server" DataSourceID="GetCompanyAccessDetailODS1" Skin="Metro">
                    <MasterTableView DataSourceID="GetCompanyAccessDetailODS1" AutoGenerateColumns="False">
                        <Columns>
                            <telerik:GridBoundColumn DataField="Name" HeaderText="Company" SortExpression="Name" UniqueName="Name" FilterControlAltText="Filter Name column"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AccessStart" HeaderText="From" SortExpression="AccessStart" UniqueName="AccessStart" FilterControlAltText="Filter AccessStart column" DataType="System.DateTime"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AccessEnd" HeaderText="To" SortExpression="AccessEnd" UniqueName="AccessEnd" DataType="System.DateTime" FilterControlAltText="Filter AccessEnd column"></telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <asp:ObjectDataSource ID="GetCompanyAccessDetailODS1" runat="server" SelectMethod="usp_GetCompanyAccessDetail" TypeName="Test.BLL.User.GetCompanyAccessDetailBL">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="0" Name="companyRef" Type="Int64"></asp:Parameter>

                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>

        </div>
    </div>
</asp:Content>

