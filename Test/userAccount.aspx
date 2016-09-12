<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="userAccount.aspx.cs" Inherits="Test.userAccount" %>
<%@ Import Namespace="System.Web.Security" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="right_col" role="main">
        <h2><%: Title %></h2>
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
        <asp:ChangePassword ID="ChangePassword2" runat="server">
        </asp:ChangePassword>
        <div class="form-horizontal">
            <h4>Edit user account</h4>
            <hr />
            <asp:ChangePassword ID="ChangePassword1" MembershipProvider="Identiy" runat="server"></asp:ChangePassword>
            <asp:Label ID="Msg" ForeColor="maroon" runat="server" />

            <%--       User inputs old password --%>

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="OldPassword" CssClass="col-md-2 control-label">Old Password</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="OldPassword" CssClass="form-control" TextMode="Password" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="OldPassword"
                        CssClass="text-danger" ErrorMessage="The old password field is required." />
                </div>
            </div>

            <%--       User inputs new password --%>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="NewPassword" CssClass="col-md-2 control-label">New Password</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="NewPassword" TextMode="Password" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword"
                        CssClass="text-danger" ErrorMessage="The new password field is required." />
                </div>
            </div>

            <%--       Confirm password --%>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                    <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The new password and confirmation password do not match." />
                </div>
            </div>
            <%--<div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The new password field is required." />
                </div>
            </div>--%>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Button runat="server"  Text="Create" CssClass="btn btn-default" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Label ID="Message" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
