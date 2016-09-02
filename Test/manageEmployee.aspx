<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="manageEmployee.aspx.cs" Inherits="Test.manageEmployee" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="right_col" role="main">
            <h2><%: Title %>.</h2>
            <p class="text-danger">
                <asp:Literal runat="server" ID="ErrorMessage" />
            </p>

            <div class="form-horizontal">
                <h4>Manage Employee</h4>
                <hr />
            </div>
            <div class="form-horizontal">
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Kpi_For_Company"></asp:CheckBoxList>
                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:KPIConnectionString %>' SelectCommand="usp_KPIForCompanyList" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="companyRef" Type="Int32"></asp:Parameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </form>
</asp:Content>
