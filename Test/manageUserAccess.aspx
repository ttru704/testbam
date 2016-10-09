<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="manageUserAccess.aspx.cs" Inherits="Test.manageUserAccess" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="pageHeader" runat="Server">
    <header style="padding: inherit; margin-top: 15px">
        <h3>User Access</h3>
    </header>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="CompanyDDL1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="UserDDL1" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
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

            <%--User dropdownlist--%>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="UserDDL1" CssClass="col-md-2 control-label">User:  </asp:Label>
                <div class="col-md-10">
                    <telerik:RadDropDownList ID="UserDDL1" AutoPostBack="true" runat="server" DataSourceID="UserODS1" DataTextField="Name" DataValueField="Ref_Number" Skin="Silk" Width="300px"></telerik:RadDropDownList>

                        <asp:ObjectDataSource ID="UserODS1" runat="server" SelectMethod="usp_UserDropDownList" TypeName="Test.BLL.Controls.UserDropDownListBL">
                            <SelectParameters>
                                <asp:SessionParameter SessionField="CompanyRef" Name="companyRef" Type="Int64"></asp:SessionParameter>


                            </SelectParameters>
                        </asp:ObjectDataSource>
                </div>
            </div>

            <asp:ValidationSummary runat="server" CssClass="text-danger" />
            <%--Datepicker for the start date of the period that end user has access to BAM--%>
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

            <%--Toggle the status of the user - either active or inactive--%>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="StatusToggle" CssClass="col-md-2 control-label">Status</asp:Label>
                <div class="col-md-10">
                    <telerik:RadToggleButton ID="StatusToggle" Skin="Metro" AutoPostBack="false" runat="server">
                        <ToggleStates>
                            <telerik:ButtonToggleState Text="Active" Value="1"></telerik:ButtonToggleState>
                            <telerik:ButtonToggleState Text="Inactive" Value="0"></telerik:ButtonToggleState>
                        </ToggleStates>
                    </telerik:RadToggleButton>
                </div>
            </div>

            <%--Submit changes to the database thru the Onclick event--%>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <telerik:RadButton ID="Update" runat="server" OnClick="Update_Click" Skin="Metro" Text="Update"></telerik:RadButton>
                </div>
            </div>

            

        </div>
    </div>
</asp:Content>
