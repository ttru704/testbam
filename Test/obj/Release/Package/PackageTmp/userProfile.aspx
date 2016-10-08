<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs" Inherits="Test.addPhoneNumber" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="pageHeader" runat="Server">
    <header style="padding: inherit; margin-top: 15px">
        <h3>User Profile</h3>
    </header>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="right_col" role="main">
        <h2>Title.</h2>
        <br />
        <div class="form-horizontal">
            <h4>Edit Your Profile</h4>
            <hr />
            <%----Notify user profile has been edited----%>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Label ID="Message" runat="server"></asp:Label>
                </div>
            </div>
            <asp:ValidationSummary runat="server" CssClass="text-danger" />
            <p class="text-danger">
                <asp:Literal runat="server" ID="ErrorMessage" />
            </p>
            <%--Input Boxes--%>
            <div class="form-group">
                <%--Full name--%>
                <asp:Label runat="server" AssociatedControlID="FullName" CssClass="col-md-2 control-label">Full Name</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="FullName" CssClass="form-control"/>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="FullName"
                        CssClass="text-danger" ErrorMessage="Your full Name is required." />
                </div>
                <%--Email Address--%>
                <asp:Label runat="server" AssociatedControlID="EmailAddress" CssClass="col-md-2 control-label">Email Address</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="EmailAddress"  CssClass="form-control" TextMode="Email" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="EmailAddress"
                        CssClass="text-danger" ErrorMessage="Your email address is required." />
                </div>
                <%--Contact Number--%>
                <asp:Label runat="server" AssociatedControlID="ContactNumber" CssClass="col-md-2 control-label">Phone Number</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="ContactNumber"  CssClass="form-control" TextMode="Phone" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ContactNumber" 
                        CssClass="text-danger" ErrorMessage="Your phone number is required." />
                    <asp:RegularExpressionValidator Display="None" ControlToValidate = "ContactNumber" ID="RegularExpressionValidator1" ValidationExpression = "^[\s\S]{0,12}$" runat="server" ErrorMessage="Maximum 12 characters allowed." ></asp:RegularExpressionValidator>
                </div>
            </div>

            <%--button--%>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Button ID="Submit" runat="server" OnClick="SubmitEdit_Click"
                        Text="Submit" CssClass="btn btn-default" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
