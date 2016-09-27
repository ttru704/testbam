<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="addPhoneNumber.aspx.cs" Inherits="Test.addPhoneNumber" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="kpiNameHeader" runat="Server">
    <header style="padding: inherit; margin-top: 15px">
        <h3>Add Phone Number</h3>
    </header>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="right_col" role="main">
        <h2><%: Title %>.</h2>

        <div class="form-horizontal">
            <h4>Add a phone number</h4>
            <hr />
            <%--Notify user if an account has been successfully created--%>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Label ID="Message" runat="server"></asp:Label>
                </div>
            </div>
            <asp:ValidationSummary runat="server" CssClass="text-danger" />
            <p class="text-danger">
                <asp:Literal runat="server" ID="ErrorMessage" />
            </p>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="PhoneNumber" CssClass="col-md-2 control-label">Phone Number</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="PhoneNumber" CssClass="form-control" TextMode="Phone" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="PhoneNumber"
                        CssClass="text-danger" ErrorMessage="The PhoneNumber field is required." />
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Button runat="server" OnClick="PhoneNumber_Click"
                        Text="Submit" CssClass="btn btn-default" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
