<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="createUserforCFL.aspx.cs" Inherits="Test.createUserforCFL" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="right_col" role="main">
            <h2><%: Title %></h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Hi CFL, Create a New User Account</h4>
        <hr />
        <%--roles the user can choose--%>
        <asp:DropDownList ID="RoleDDL" runat="server" DataTextField="Id" DataValueField="Id">
            <asp:ListItem Value="1">Admin</asp:ListItem>
            <asp:ListItem Value="2">Manager</asp:ListItem>
            <asp:ListItem Value="3">Employee</asp:ListItem>
        </asp:DropDownList>


        <asp:ValidationSummary runat="server" CssClass="text-danger" />

        <%--        User inputs company's number--%>
       <%-- <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="companyNumberTextbox" CssClass="col-md-2 control-label">Company number</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="companyNumberTextbox" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="companyNumberTextbox"
                    CssClass="text-danger" ErrorMessage="The company number field is required." />
            </div>
        </div>--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="companyIdDropdown" CssClass="col-md-2 control-label">Company ID</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList runat="server" ID="companyIdDropdown" CssClass="form-control" DataSourceID="CompanyListODS1" DataTextField="Name" DataValueField="Ref_Number">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="CompanyListODS1" runat="server" SelectMethod="usp_CompanyList" TypeName="Test.BLL.Controls.CompanyListBL"></asp:ObjectDataSource>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="companyIdDropdown"
                    CssClass="text-danger" ErrorMessage="The company number field is required." />
            </div>
        </div>



        <%--       User inputs Name--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="NameTextbox" CssClass="col-md-2 control-label">Name </asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="NameTextbox" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="NameTextbox"
                    CssClass="text-danger" ErrorMessage="The Name field is required." />
            </div>
        </div>

        <%--       User inputs Username--%>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Username" CssClass="col-md-2 control-label">Username </asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Username" CssClass="form-control" TextMode="SingleLine" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Username"
                        CssClass="text-danger" ErrorMessage="The Name field is required." />
                </div>
            </div>


        <%--       User inputs email --%>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>

        <%--       User inputs password --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
                <asp:RegularExpressionValidator Display="None" ControlToValidate = "Password" ID="RegularExpressionValidator1" ValidationExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{6,}" runat="server" ErrorMessage="Password must have at least 6 characters with 1 uppercase, 1 lowercase, 1 number, and 1 special character" ></asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password"  CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Create" CssClass="btn btn-default" />
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
