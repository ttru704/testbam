<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Test.WebForm1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ContentTitle" ContentPlaceHolderID="kpiNameHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="right_col" role="main">
        <div class="userInputs">
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server"></telerik:RadAjaxLoadingPanel>

            <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                            <telerik:RadComboBox RenderMode="Lightweight" ID="BranchTypeDDL1" DataTextField="Name" DataValueField="Ref_Number" runat="server" Width="186px"
                                AutoPostBack="true" EmptyMessage="- Select a Branch Type -" DataSourceID="BranchTypeODS1"
                                Skin="Metro">
                            </telerik:RadComboBox>
                            <asp:ObjectDataSource ID="BranchTypeODS1" runat="server" SelectMethod="usp_BranchTypeDropDownList" TypeName="Test.BLL.Controls.BranchTypeDropDownListBL">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="1" Name="businessType" Type="Int32"></asp:Parameter>
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <telerik:RadComboBox RenderMode="Lightweight" ID="CountryDDL1" DataTextField="Country_Name" DataValueField="Country_Ref" runat="server" Width="186px"
                                    AutoPostBack="true" EmptyMessage="- Select a Country -" DataSourceID="CountryODS1"
                                    Skin="Metro">
                                </telerik:RadComboBox>
                            <br />
                            <asp:ObjectDataSource ID="CountryODS1" runat="server" SelectMethod="usp_CountryDropDownList" TypeName="Test.BLL.Controls.CountryDropDownListBL">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="BranchDDL1" PropertyName="SelectedValue" Name="branchRef" Type="Int64"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:ObjectDataSource>

                            <telerik:RadComboBox RenderMode="Lightweight" ID="StateDDL1" DataTextField="State_Name" DataValueField="State_Ref" runat="server" Width="186px"
                                AutoPostBack="true" EmptyMessage="- Select a State -" DataSourceID="StateODS1"
                                Skin="Metro">
                            </telerik:RadComboBox>
                            <asp:ObjectDataSource ID="StateODS1" runat="server" SelectMethod="usp_StateDropDownList" TypeName="Test.BLL.Controls.StateDropDownListBL">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="CountryDDL1" PropertyName="SelectedValue" Name="countryRef" Type="Int64"></asp:ControlParameter>


                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <telerik:RadComboBox RenderMode="Lightweight" ID="RegionDDL1" DataTextField="Region_Name" DataValueField="Region_Ref" runat="server" Width="186px"
                                AutoPostBack="true" EmptyMessage="- Select a Region -" DataSourceID="RegionODS1"
                                Skin="Metro">
                            </telerik:RadComboBox>
                            <asp:ObjectDataSource ID="RegionODS1" runat="server" SelectMethod="usp_RegionDropDownList" TypeName="Test.BLL.Controls.RegionDropDownListBL">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="StateDDL1" PropertyName="SelectedValue" Name="stateRef" Type="Int64"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </telerik:RadAjaxPanel>
            <%-- <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="CountryDDL1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="CountryDDL1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                        <telerik:AjaxUpdatedControl ControlID="StateDDL1" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="StateDDL1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="StateDDL1" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                        <telerik:AjaxUpdatedControl ControlID="RegionDDL1" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                    </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server" ></telerik:RadScriptManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>--%>
        </div>
    </div>
    <script>
        (function (global, undefined) {
            var demo = {};
            function populateValue() {
                $get(demo.label).innerHTML = $get(demo.textBox).value;
                //the RadWindow's content template is an INaming container and the server code block is needed
                $find(demo.contentTemplateID).close();
            }
            function openWinContentTemplate() {
                $find(demo.templateWindowID).show();
            }
            function openWinNavigateUrl() {
                $find(demo.urlWindowID).show();
            }
            global.$windowContentDemo = demo;
            global.populateValue = populateValue;
            global.openWinContentTemplate = openWinContentTemplate;
            global.openWinNavigateUrl = openWinNavigateUrl;
        })(window);
    </script>
</asp:Content>
